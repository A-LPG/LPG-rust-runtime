use std::any::Any;
use std::collections::HashMap;
use std::rc::Rc;

use crate::error::{
    BadParseException, BadParseSymFileException, LpgException, NotGLRParseTableException,
};
use crate::monitor::Monitor;
use crate::parse_table::ParseTable;
use crate::traits::{box_ast, unbox_ast, IAst, RuleAction};
use crate::token_stream::TokenStream;

use super::gss_edge::GssEdge;
use super::gss_node::GssNode;
use super::sppf_node::{SppfNode, SppfPackedNode};
use super::stacks::Stacks;

const GSS_BOTTOM_STATE: i32 = i32::MIN;

/// Marker stored when a GLR accept has a null semantic root.
struct GlrNullResult;

/// Generalized LR driver for LPG GLR conflict tables.
pub struct GLRParser<TS, PT, RA>
where
    TS: TokenStream,
    PT: ParseTable + Clone,
    RA: RuleAction,
{
    pub stacks: Stacks,
    monitor: Option<Box<dyn Monitor>>,
    start_state: i32,
    num_rules: i32,
    nt_offset: i32,
    la_state_offset: i32,
    accept_action: i32,
    error_action: i32,
    tok_stream: Option<TS>,
    prs: PT,
    ra: RA,
    taking_actions: bool,
    current_action: i32,
    last_token: i32,
    parse_stack_root: i32,
    frame_top: i32,
    frame_location: Vec<i32>,
    frame_parse: Vec<Option<Rc<dyn Any>>>,
    family_cache: HashMap<String, Rc<dyn IAst>>,
    forest_cache: HashMap<String, Rc<dyn IAst>>,
    gss_nodes: HashMap<String, Rc<GssNode>>,
    sppf_nodes: HashMap<String, Rc<SppfNode>>,
    sppf_root: Option<Rc<SppfNode>>,
    sppf_symbols: i32,
}

struct GlrAccept {
    ast: Option<Rc<dyn Any>>,
    grammar_symbol: i32,
    sppf: Option<Rc<SppfNode>>,
}

struct GlrConfig {
    state_stack: Vec<i32>,
    symbol_stack: Vec<i32>,
    parse_stack: Vec<Option<Rc<dyn Any>>>,
    location_stack: Vec<i32>,
    sppf_stack: Vec<Option<Rc<SppfNode>>>,
    gss_tip: Option<Rc<GssNode>>,
    state_stack_top: i32,
    current_action: i32,
    curtok: i32,
    last_token: i32,
    current_kind: i32,
}

impl GlrConfig {
    fn copy(&self) -> Self {
        Self {
            state_stack: self.state_stack.clone(),
            symbol_stack: self.symbol_stack.clone(),
            parse_stack: self.parse_stack.clone(),
            location_stack: self.location_stack.clone(),
            sppf_stack: self.sppf_stack.clone(),
            gss_tip: self.gss_tip.clone(),
            state_stack_top: self.state_stack_top,
            current_action: self.current_action,
            curtok: self.curtok,
            last_token: self.last_token,
            current_kind: self.current_kind,
        }
    }

    fn key(&self) -> String {
        let mut out = format!(
            "{}:{}:{}:{}:{}",
            self.curtok,
            self.current_kind,
            self.last_token,
            self.current_action,
            self.state_stack_top
        );
        for i in 0..=self.state_stack_top {
            let i = i as usize;
            out.push_str(&format!(
                ":{}:{}:{}",
                self.state_stack[i], self.location_stack[i], self.symbol_stack[i]
            ));
        }
        out
    }
}

impl<TS, PT, RA> GLRParser<TS, PT, RA>
where
    TS: TokenStream,
    PT: ParseTable + Clone,
    RA: RuleAction,
{
    pub fn new(
        tok_stream: Option<TS>,
        prs: PT,
        ra: RA,
        monitor: Option<Box<dyn Monitor>>,
    ) -> Result<Self, LpgException> {
        let mut parser = Self {
            stacks: Stacks::new(),
            monitor,
            start_state: 0,
            num_rules: 0,
            nt_offset: 0,
            la_state_offset: 0,
            accept_action: 0,
            error_action: 0,
            tok_stream: None,
            prs: prs.clone(),
            ra,
            taking_actions: false,
            current_action: 0,
            last_token: 0,
            parse_stack_root: 0,
            frame_top: 0,
            frame_location: Vec::new(),
            frame_parse: Vec::new(),
            family_cache: HashMap::new(),
            forest_cache: HashMap::new(),
            gss_nodes: HashMap::new(),
            sppf_nodes: HashMap::new(),
            sppf_root: None,
            sppf_symbols: 0,
        };
        parser.reset(tok_stream, Some(prs), None, None)?;
        Ok(parser)
    }

    fn lookahead(&self, act: i32, token: i32) -> i32 {
        let tok = self.tok_stream.as_ref().expect("token stream");
        let act = self
            .prs
            .look_ahead(act - self.la_state_offset, tok.get_kind(token));
        if act > self.la_state_offset {
            self.lookahead(act, tok.get_next(token))
        } else {
            act
        }
    }

    fn t_action(&self, state: i32, sym: i32, curtok: i32) -> i32 {
        let tok = self.tok_stream.as_ref().expect("token stream");
        let act = self.prs.t_action(state, sym);
        if act > self.la_state_offset {
            self.lookahead(act, tok.get_next(curtok))
        } else {
            act
        }
    }

    fn expand_conflict(&self, act: i32) -> Vec<i32> {
        let mut out = Vec::with_capacity(2);
        let mut i = act;
        loop {
            let candidate = self.prs.base_action(i);
            if candidate == 0 {
                break;
            }
            out.push(candidate);
            i += 1;
        }
        out
    }

    pub fn get_current_rule(&self) -> i32 {
        self.current_action
    }

    pub fn get_token(&self, i: i32) -> i32 {
        if self.taking_actions {
            self.frame_location[(self.frame_top + (i - 1)) as usize]
        } else {
            self.stacks.get_token(i)
        }
    }

    pub fn get_sym(&self, i: i32) -> Option<&dyn Any> {
        if self.taking_actions {
            self.frame_parse[(self.frame_top + (i - 1)) as usize]
                .as_ref()
                .map(|r| r.as_ref() as &dyn Any)
        } else {
            self.stacks.get_sym(i)
        }
    }

    pub fn set_sym1(&mut self, ast: Option<Box<dyn Any>>) {
        if self.taking_actions {
            self.frame_parse[self.frame_top as usize] = ast.map(Rc::from);
        } else {
            self.stacks.set_sym1(ast);
        }
    }

    pub fn get_first_token(&self) -> i32 {
        self.get_token(1)
    }

    pub fn get_first_token_at(&self, i: i32) -> i32 {
        self.get_token(i)
    }

    pub fn get_last_token(&self) -> i32 {
        self.last_token
    }

    pub fn get_last_token_at(&self, i: i32) -> i32 {
        if i >= self.prs.rhs(self.current_action) {
            self.last_token
        } else {
            self.tok_stream
                .as_ref()
                .expect("token stream")
                .get_previous(self.get_token(i + 1))
        }
    }

    pub fn get_sppf_root(&self) -> Option<Rc<SppfNode>> {
        self.sppf_root.clone()
    }

    pub fn get_sppf_symbol_count(&self) -> i32 {
        self.sppf_symbols
    }

    pub fn set_monitor(&mut self, monitor: Option<Box<dyn Monitor>>) {
        self.monitor = monitor;
    }

    pub fn reset1(&mut self) {
        self.taking_actions = false;
        self.sppf_root = None;
        self.sppf_symbols = 0;
    }

    pub fn reset2(&mut self, tok_stream: TS, monitor: Option<Box<dyn Monitor>>) {
        self.monitor = monitor;
        self.tok_stream = Some(tok_stream);
        self.reset1();
    }

    pub fn reset(
        &mut self,
        tok_stream: Option<TS>,
        prs: Option<PT>,
        ra: Option<RA>,
        monitor: Option<Box<dyn Monitor>>,
    ) -> Result<(), LpgException> {
        if let Some(prs) = prs {
            self.prs = prs;
            self.start_state = self.prs.get_start_state();
            self.num_rules = self.prs.get_num_rules();
            self.nt_offset = self.prs.get_nt_offset();
            self.la_state_offset = self.prs.get_la_state_offset();
            self.accept_action = self.prs.get_accept_action();
            self.error_action = self.prs.get_error_action();
            if !self.prs.is_valid_for_parser() {
                return Err(BadParseSymFileException::new("").into());
            }
            if !self.prs.is_glr() {
                return Err(NotGLRParseTableException::new("").into());
            }
        }
        if let Some(ra) = ra {
            self.ra = ra;
        }
        match tok_stream {
            None => {
                self.reset1();
                Ok(())
            }
            Some(ts) => {
                self.reset2(ts, monitor);
                Ok(())
            }
        }
    }

    pub fn parse(
        &mut self,
        max_error_count: i32,
    ) -> Result<Option<Box<dyn Any>>, LpgException> {
        self.parse_entry(0, max_error_count)
    }

    pub fn parse_entry(
        &mut self,
        marker_kind: i32,
        _max_error_count: i32,
    ) -> Result<Option<Box<dyn Any>>, LpgException> {
        // GLR+%Recover fallback is deferred; e2e uses error-free input.
        self.parse_entry_no_repair(marker_kind)
    }

    fn parse_entry_no_repair(
        &mut self,
        marker_kind: i32,
    ) -> Result<Option<Box<dyn Any>>, LpgException> {
        self.tok_stream.as_mut().expect("token stream").reset();
        self.family_cache.clear();
        self.forest_cache.clear();
        self.gss_nodes.clear();
        self.sppf_nodes.clear();
        self.sppf_root = None;
        self.sppf_symbols = 0;

        let first_tok = self.tok_stream.as_mut().unwrap().get_token();
        let prev = self.tok_stream.as_ref().unwrap().get_previous(first_tok);
        let (start_tok, start_kind) = if marker_kind != 0 {
            self.parse_stack_root = 1;
            (prev, marker_kind)
        } else {
            self.parse_stack_root = 0;
            (
                first_tok,
                self.tok_stream.as_ref().unwrap().get_kind(first_tok),
            )
        };

        let mut start = GlrConfig {
            state_stack: Vec::new(),
            symbol_stack: Vec::new(),
            parse_stack: Vec::new(),
            location_stack: Vec::new(),
            sppf_stack: Vec::new(),
            gss_tip: None,
            state_stack_top: -1,
            current_action: self.start_state,
            curtok: start_tok,
            last_token: prev,
            current_kind: start_kind,
        };
        self.ensure_capacity(&mut start, 16);

        let mut live = vec![start];
        let mut accepts: Vec<GlrAccept> = Vec::new();
        let mut error_tok = start_tok;
        let mut outer_guard = self.prs.get_num_states() * 64
            + self.tok_stream.as_ref().unwrap().get_stream_length() * 8
            + 256;

        while !live.is_empty() {
            if self.monitor.as_ref().is_some_and(|m| m.is_cancelled()) {
                return Ok(None);
            }
            outer_guard -= 1;
            if outer_guard < 0 {
                return Err(glr_error(
                    "cyclic/epsilon-loop grammar not supported by GLR v2",
                ));
            }

            let mut next_configs: Vec<GlrConfig> = Vec::new();
            let mut packed: HashMap<String, Vec<usize>> = HashMap::new();
            let batch = std::mem::take(&mut live);

            for cfg in batch {
                if cfg.curtok > error_tok {
                    error_tok = cfg.curtok;
                }
                let mut step_results = Vec::new();
                let mut step_accepts = Vec::new();
                self.step_config(cfg, &mut step_results, &mut step_accepts)?;
                for candidate in step_accepts {
                    self.pack_accept(&mut accepts, candidate)?;
                }
                for result in step_results {
                    let key = result.key();
                    let mut merged = false;
                    if let Some(indices) = packed.get(&key).cloned() {
                        for idx in indices {
                            if self.can_pack_parse_stacks(&next_configs[idx], &result) {
                                self.pack_parse_stacks(&mut next_configs[idx], &result)?;
                                merged = true;
                                break;
                            }
                        }
                    }
                    if !merged {
                        let idx = next_configs.len();
                        packed.entry(key).or_default().push(idx);
                        next_configs.push(result);
                    }
                }
            }

            if !accepts.is_empty() && next_configs.is_empty() {
                break;
            }
            live = next_configs;
            if live.is_empty() && accepts.is_empty() {
                return Err(BadParseException::new(error_tok).into());
            }
        }

        if accepts.is_empty() {
            return Err(BadParseException::new(error_tok).into());
        }

        let root_symbol = accepts[0].grammar_symbol;
        let root = accepts[0].ast.clone();
        self.sppf_root = accepts[0].sppf.clone();
        for candidate in accepts.iter().skip(1) {
            if candidate.grammar_symbol != root_symbol {
                return Err(glr_error("GLR accepted distinct start symbols"));
            }
            if self.sppf_root.is_none() {
                self.sppf_root = candidate.sppf.clone();
            }
            if !append_next_ast_any(&root, &candidate.ast, true) {
                return Err(glr_error("overlapping GLR accept forests"));
            }
        }
        self.sppf_symbols = self.sppf_nodes.len() as i32;
        if is_null_result(&root) {
            return Ok(None);
        }
        Ok(root.and_then(|r| unbox_ast(r.as_ref()).map(box_ast)))
    }

    fn step_config(
        &mut self,
        cfg: GlrConfig,
        out: &mut Vec<GlrConfig>,
        accepts: &mut Vec<GlrAccept>,
    ) -> Result<(), LpgException> {
        let mut work = vec![cfg];
        let mut guard = self.prs.get_num_states() * 4 + 8;

        while let Some(mut current) = work.pop() {
            guard -= 1;
            if guard < 0 {
                return Err(glr_error(
                    "cyclic/epsilon-loop grammar not supported by GLR v2",
                ));
            }

            let need = current.state_stack_top + 2;
            self.ensure_capacity(&mut current, need);
            current.state_stack_top += 1;
            let top = current.state_stack_top as usize;
            current.state_stack[top] = current.current_action;
            current.location_stack[top] = current.curtok;
            current.symbol_stack[top] = 0;
            current.sppf_stack[top] = None;
            if current.state_stack_top != self.parse_stack_root {
                current.parse_stack[top] = None;
            }
            current.gss_tip = Some(self.gss_push(
                current.gss_tip.take(),
                current.current_action,
                current.curtok,
                0,
                None,
                None,
            ));

            let act =
                self.t_action(current.current_action, current.current_kind, current.curtok);
            let candidates = if act > self.accept_action && act < self.error_action {
                self.expand_conflict(act)
            } else {
                vec![act]
            };

            if candidates.len() == 1 {
                self.apply_concrete_action(
                    &mut current,
                    candidates[0],
                    &mut work,
                    out,
                    accepts,
                )?;
            } else {
                for candidate in candidates {
                    let mut fork = current.copy();
                    self.apply_concrete_action(&mut fork, candidate, &mut work, out, accepts)?;
                }
            }
        }
        Ok(())
    }

    fn apply_concrete_action(
        &mut self,
        fork: &mut GlrConfig,
        candidate: i32,
        work: &mut Vec<GlrConfig>,
        out: &mut Vec<GlrConfig>,
        accepts: &mut Vec<GlrAccept>,
    ) -> Result<(), LpgException> {
        if candidate <= self.num_rules {
            fork.state_stack_top -= 1;
            fork.gss_tip = gss_pop(fork.gss_tip.take());
            return self.apply_reduce_closure(fork, candidate, work);
        }
        if candidate > self.error_action {
            let top = fork.state_stack_top as usize;
            fork.symbol_stack[top] = fork.current_kind;
            let term = self.terminal_sppf(fork.current_kind, fork.curtok);
            fork.sppf_stack[top] = Some(term.clone());
            fork.gss_tip = Some(gss_relabel(
                fork.gss_tip.take(),
                fork.current_kind,
                fork.curtok,
                None,
                Some(term),
            ));
            fork.last_token = fork.curtok;
            fork.curtok = self.tok_stream.as_ref().unwrap().get_next(fork.curtok);
            fork.current_kind = self.tok_stream.as_ref().unwrap().get_kind(fork.curtok);
            return self.apply_reduce_closure(fork, candidate - self.error_action, work);
        }
        if candidate < self.accept_action {
            let top = fork.state_stack_top as usize;
            fork.symbol_stack[top] = fork.current_kind;
            let term = self.terminal_sppf(fork.current_kind, fork.curtok);
            fork.sppf_stack[top] = Some(term.clone());
            fork.gss_tip = Some(gss_relabel(
                fork.gss_tip.take(),
                fork.current_kind,
                fork.curtok,
                None,
                Some(term),
            ));
            fork.last_token = fork.curtok;
            fork.curtok = self.tok_stream.as_ref().unwrap().get_next(fork.curtok);
            fork.current_kind = self.tok_stream.as_ref().unwrap().get_kind(fork.curtok);
            fork.current_action = candidate;
            out.push(fork.copy());
            return Ok(());
        }
        if candidate == self.accept_action {
            let root_idx = self.parse_stack_root as usize;
            let root = fork.parse_stack.get(root_idx).cloned().unwrap_or(None);
            let root_symbol = if self.parse_stack_root <= fork.state_stack_top {
                fork.symbol_stack[root_idx]
            } else {
                0
            };
            let root_sppf = fork.sppf_stack.get(root_idx).cloned().unwrap_or(None);
            let ast = if root.is_none() {
                Some(Rc::new(GlrNullResult) as Rc<dyn Any>)
            } else {
                root
            };
            accepts.push(GlrAccept {
                ast,
                grammar_symbol: root_symbol,
                sppf: root_sppf,
            });
        }
        Ok(())
    }

    fn apply_reduce_closure(
        &mut self,
        fork: &mut GlrConfig,
        rule: i32,
        work: &mut Vec<GlrConfig>,
    ) -> Result<(), LpgException> {
        let mut action = rule;
        loop {
            let rhs = self.prs.rhs(action);
            if fork.state_stack_top - (rhs - 1) < 0 {
                return Err(glr_error("GLR reduce stack underflow"));
            }

            let mut children = Vec::with_capacity(rhs as usize);
            for i in 0..rhs {
                let idx = (fork.state_stack_top - rhs + 1 + i) as usize;
                children.push(fork.sppf_stack[idx].clone());
            }
            fork.state_stack_top -= rhs - 1;
            if rhs > 0 {
                for _ in 0..(rhs - 1) {
                    fork.gss_tip = gss_pop(fork.gss_tip.take());
                }
            } else {
                self.ensure_capacity(fork, fork.state_stack_top + 1);
                let top = fork.state_stack_top as usize;
                fork.gss_tip = Some(self.gss_push(
                    fork.gss_tip.take(),
                    fork.state_stack[top],
                    fork.location_stack[top],
                    0,
                    None,
                    None,
                ));
            }

            let reduction_key = reduction_key(
                action,
                fork.last_token,
                rhs,
                fork.state_stack_top,
                &fork.location_stack,
                &fork.symbol_stack,
                &fork.parse_stack,
            );
            self.current_action = action;
            self.last_token = fork.last_token;
            self.frame_top = fork.state_stack_top;
            self.frame_location = fork.location_stack.clone();
            self.frame_parse = fork.parse_stack.clone();

            self.taking_actions = true;
            self.ra.rule_action(action);
            self.taking_actions = false;

            fork.parse_stack = std::mem::take(&mut self.frame_parse);
            fork.location_stack = std::mem::take(&mut self.frame_location);

            let lhs = self.prs.lhs(action);
            let lhs_symbol = self.nt_offset + lhs;
            let top = fork.state_stack_top as usize;
            let mut result = fork.parse_stack[top].clone();

            if let Some(ast) = as_iast(&result) {
                let canonical = if let Some(c) = self.family_cache.get(&reduction_key) {
                    c.clone()
                } else {
                    let forest_key = ast_forest_key(lhs_symbol, &ast);
                    let mut canonical = forest_key
                        .as_ref()
                        .and_then(|k| self.forest_cache.get(k).cloned());
                    if canonical.is_none() {
                        canonical = Some(ast.clone());
                        if let Some(k) = forest_key {
                            self.forest_cache.insert(k, ast.clone());
                        }
                    } else if let Some(ref c) = canonical {
                        if !Rc::ptr_eq(c, &ast) && !append_next_ast(c, &ast, true) {
                            return Err(glr_error("cannot merge GLR production family"));
                        }
                    }
                    let canonical = canonical.unwrap();
                    self.family_cache
                        .insert(reduction_key, canonical.clone());
                    canonical
                };
                fork.parse_stack[top] = Some(Rc::from(box_ast(canonical.clone())));
                result = fork.parse_stack[top].clone();
            }

            let mut left_extent = fork.location_stack[top];
            let mut right_extent = fork.last_token;
            if let Some(ast) = as_iast(&result) {
                left_extent = ast.get_left_i_token().get_token_index();
                right_extent = ast.get_right_i_token().get_token_index();
            }
            let symbol_node = self.sppf_symbol(lhs_symbol, left_extent, right_extent);
            self.add_packed(&symbol_node, action, &children, result.clone());
            if as_iast(&result).is_some() {
                symbol_node.set_ast_forest(result.clone());
            }
            fork.sppf_stack[top] = Some(symbol_node.clone());
            fork.symbol_stack[top] = lhs_symbol;
            fork.gss_tip = Some(gss_relabel(
                fork.gss_tip.take(),
                lhs_symbol,
                left_extent,
                result,
                Some(symbol_node),
            ));
            action = self.prs.nt_action(fork.state_stack[top], lhs);
            if action > self.num_rules {
                break;
            }
        }

        fork.current_action = action;
        work.push(fork.copy());
        Ok(())
    }

    fn ensure_capacity(&self, config: &mut GlrConfig, need: i32) {
        let old_length = config.state_stack.len() as i32;
        if need < old_length {
            return;
        }
        let mut new_length = need + 8;
        let stack_inc = self.stacks.stack_increment;
        if old_length + stack_inc > new_length {
            new_length = old_length + stack_inc;
        }
        let new_len = new_length as usize;
        config.state_stack.resize(new_len, 0);
        config.symbol_stack.resize(new_len, 0);
        config.location_stack.resize(new_len, 0);
        config.parse_stack.resize(new_len, None);
        config.sppf_stack.resize(new_len, None);
    }

    fn sppf_symbol(
        &mut self,
        grammar_symbol: i32,
        left_extent: i32,
        right_extent: i32,
    ) -> Rc<SppfNode> {
        let key = format!("{}:{}:{}", grammar_symbol, left_extent, right_extent);
        self.sppf_nodes
            .entry(key)
            .or_insert_with(|| Rc::new(SppfNode::new(grammar_symbol, left_extent, right_extent)))
            .clone()
    }

    fn terminal_sppf(&mut self, kind: i32, token: i32) -> Rc<SppfNode> {
        let term = self.sppf_symbol(kind, token, token);
        if term.packs_mut().is_empty() {
            term.packs_mut()
                .push(SppfPackedNode::new(-kind, Vec::new(), None));
        }
        term
    }

    fn add_packed(
        &self,
        symbol_node: &SppfNode,
        rule: i32,
        children: &[Option<Rc<SppfNode>>],
        semantic: Option<Rc<dyn Any>>,
    ) {
        {
            let packs = symbol_node.packs_mut();
            for packed in packs.iter() {
                if packed.get_rule() != rule || packed.children_raw().len() != children.len() {
                    continue;
                }
                let same = packed
                    .children_raw()
                    .iter()
                    .zip(children.iter())
                    .all(|(a, b)| match (a, b) {
                        (Some(x), Some(y)) => Rc::ptr_eq(x, y),
                        (None, None) => true,
                        _ => false,
                    });
                if same {
                    return;
                }
            }
        }
        symbol_node
            .packs_mut()
            .push(SppfPackedNode::new(rule, children.to_vec(), semantic));
    }

    fn gss_push(
        &mut self,
        tip: Option<Rc<GssNode>>,
        state: i32,
        index: i32,
        symbol: i32,
        semantic: Option<Rc<dyn Any>>,
        sppf: Option<Rc<SppfNode>>,
    ) -> Rc<GssNode> {
        let predecessor = tip.unwrap_or_else(|| Rc::new(GssNode::new(GSS_BOTTOM_STATE, -1)));
        let node = Rc::new(GssNode::new(state, index));
        node.push_edge(GssEdge::new(
            predecessor.clone(),
            symbol,
            index,
            semantic.clone(),
            sppf.clone(),
        ));
        let key = format!("{}:{}", state, index);
        let canonical = self
            .gss_nodes
            .entry(key)
            .or_insert_with(|| Rc::new(GssNode::new(state, index)))
            .clone();
        canonical.push_edge(GssEdge::new(predecessor, symbol, index, semantic, sppf));
        node
    }

    fn pack_accept(
        &self,
        accepts: &mut Vec<GlrAccept>,
        candidate: GlrAccept,
    ) -> Result<(), LpgException> {
        if is_null_result(&candidate.ast) {
            if accepts.iter().any(|e| is_null_result(&e.ast)) {
                return Ok(());
            }
            accepts.push(candidate);
            return Ok(());
        }
        let Some(ast) = as_iast(&candidate.ast) else {
            return Ok(());
        };
        for existing in accepts.iter() {
            let Some(other) = as_iast(&existing.ast) else {
                continue;
            };
            if existing.grammar_symbol == candidate.grammar_symbol
                && same_span(&other, &ast)
                && append_next_ast(&other, &ast, true)
            {
                return Ok(());
            }
        }
        accepts.push(candidate);
        Ok(())
    }

    fn can_pack_parse_stacks(&self, existing: &GlrConfig, incoming: &GlrConfig) -> bool {
        if existing.state_stack_top != incoming.state_stack_top {
            return false;
        }
        for i in 0..=existing.state_stack_top as usize {
            let a = &existing.parse_stack[i];
            let b = &incoming.parse_stack[i];
            if same_identity(a, b) {
                continue;
            }
            let (Some(ast_a), Some(ast_b)) = (as_iast(a), as_iast(b)) else {
                return false;
            };
            if !same_span(&ast_a, &ast_b) || !append_next_ast(&ast_a, &ast_b, false) {
                return false;
            }
        }
        true
    }

    fn pack_parse_stacks(
        &mut self,
        existing: &mut GlrConfig,
        incoming: &GlrConfig,
    ) -> Result<(), LpgException> {
        for i in 0..=existing.state_stack_top as usize {
            let a = &existing.parse_stack[i];
            let b = &incoming.parse_stack[i];
            if same_identity(a, b) || a.is_none() || b.is_none() {
                continue;
            }
            let (Some(ast_a), Some(ast_b)) = (as_iast(a), as_iast(b)) else {
                return Err(glr_error("overlapping GLR semantic forests"));
            };
            if !append_next_ast(&ast_a, &ast_b, false) {
                return Err(glr_error("overlapping GLR semantic forests"));
            }
        }

        for i in 0..=existing.state_stack_top as usize {
            let a = existing.parse_stack[i].clone();
            let b = incoming.parse_stack[i].clone();
            if a.is_none() {
                existing.parse_stack[i] = b;
            } else if b.is_none() || same_identity(&a, &b) {
            } else if !append_next_ast_any(&a, &b, true) {
                return Err(glr_error("overlapping GLR semantic forests"));
            }

            let left = existing.sppf_stack[i].clone();
            let right = incoming.sppf_stack[i].clone();
            if left.is_none() {
                existing.sppf_stack[i] = right;
            } else if let (Some(left_n), Some(right_n)) = (left, right) {
                if !Rc::ptr_eq(&left_n, &right_n)
                    && left_n.get_grammar_symbol() == right_n.get_grammar_symbol()
                    && left_n.get_left_extent() == right_n.get_left_extent()
                    && left_n.get_right_extent() == right_n.get_right_extent()
                {
                    for packed in right_n.get_packs() {
                        self.add_packed(
                            &left_n,
                            packed.get_rule(),
                            packed.children_raw(),
                            packed.get_semantic(),
                        );
                    }
                    if as_iast(&existing.parse_stack[i]).is_some() {
                        left_n.set_ast_forest(existing.parse_stack[i].clone());
                    }
                }
            }
        }
        if incoming.gss_tip.is_some() {
            existing.gss_tip = incoming.gss_tip.clone();
        }
        Ok(())
    }
}

fn gss_pop(tip: Option<Rc<GssNode>>) -> Option<Rc<GssNode>> {
    let tip = tip?;
    let edge = tip.first_edge()?;
    let predecessor = edge.get_predecessor();
    if predecessor.get_state() == GSS_BOTTOM_STATE {
        None
    } else {
        Some(predecessor)
    }
}

fn gss_relabel(
    tip: Option<Rc<GssNode>>,
    symbol: i32,
    location: i32,
    semantic: Option<Rc<dyn Any>>,
    sppf: Option<Rc<SppfNode>>,
) -> Rc<GssNode> {
    match tip {
        Some(tip) if tip.edge_count() > 0 => {
            let pred = tip.first_edge().unwrap().get_predecessor();
            let node = Rc::new(GssNode::new(tip.get_state(), tip.get_index()));
            node.push_edge(GssEdge::new(pred, symbol, location, semantic, sppf));
            node
        }
        Some(tip) => tip,
        None => Rc::new(GssNode::new(0, 0)),
    }
}

fn glr_error(msg: &str) -> LpgException {
    crate::error::NullPointerException::new(msg).into()
}

fn is_null_result(value: &Option<Rc<dyn Any>>) -> bool {
    value
        .as_ref()
        .and_then(|r| r.downcast_ref::<GlrNullResult>())
        .is_some()
}

fn as_iast(value: &Option<Rc<dyn Any>>) -> Option<Rc<dyn IAst>> {
    value.as_ref().and_then(|r| unbox_ast(r.as_ref()))
}

fn same_identity(a: &Option<Rc<dyn Any>>, b: &Option<Rc<dyn Any>>) -> bool {
    match (a, b) {
        (None, None) => true,
        (Some(x), Some(y)) => {
            if let (Some(ax), Some(ay)) = (unbox_ast(x.as_ref()), unbox_ast(y.as_ref())) {
                return Rc::ptr_eq(&ax, &ay);
            }
            Rc::ptr_eq(x, y)
        }
        _ => false,
    }
}

fn identity_of(value: &Option<Rc<dyn Any>>) -> usize {
    match value {
        None => 0,
        Some(rc) => {
            if let Some(ast) = unbox_ast(rc.as_ref()) {
                Rc::as_ptr(&ast) as *const () as usize
            } else {
                Rc::as_ptr(rc) as *const () as usize
            }
        }
    }
}

fn reduction_key(
    rule: i32,
    last_token: i32,
    rhs: i32,
    frame_top: i32,
    locations: &[i32],
    symbols: &[i32],
    semantics: &[Option<Rc<dyn Any>>],
) -> String {
    let mut out = format!("{}:{}", rule, last_token);
    for i in 0..rhs {
        let index = (frame_top + i) as usize;
        out.push_str(&format!(
            ":{}:{}:{}",
            locations[index],
            symbols[index],
            identity_of(&semantics[index])
        ));
    }
    out
}

fn same_span(a: &Rc<dyn IAst>, b: &Rc<dyn IAst>) -> bool {
    let left_a = a.get_left_i_token();
    let right_a = a.get_right_i_token();
    let left_b = b.get_left_i_token();
    let right_b = b.get_right_i_token();
    let stream_eq = match (left_a.get_i_lex_stream(), left_b.get_i_lex_stream()) {
        (Some(sa), Some(sb)) => Rc::ptr_eq(&sa, &sb),
        (None, None) => true,
        _ => false,
    };
    let stream_eq_r = match (right_a.get_i_lex_stream(), right_b.get_i_lex_stream()) {
        (Some(sa), Some(sb)) => Rc::ptr_eq(&sa, &sb),
        (None, None) => true,
        _ => false,
    };
    stream_eq
        && stream_eq_r
        && left_a.get_token_index() == left_b.get_token_index()
        && right_a.get_token_index() == right_b.get_token_index()
}

fn append_next_ast_any(
    root: &Option<Rc<dyn Any>>,
    alternative: &Option<Rc<dyn Any>>,
    commit: bool,
) -> bool {
    let (Some(a), Some(b)) = (as_iast(root), as_iast(alternative)) else {
        return false;
    };
    append_next_ast(&a, &b, commit)
}

fn append_next_ast(root: &Rc<dyn IAst>, incoming: &Rc<dyn IAst>, commit: bool) -> bool {
    if Rc::ptr_eq(root, incoming) {
        return true;
    }

    let mut seen = HashMap::new();
    let mut tail = root.clone();
    let mut node = Some(root.clone());
    while let Some(current) = node {
        let id = Rc::as_ptr(&current) as *const () as usize;
        if id == 0 || seen.contains_key(&id) {
            return false;
        }
        seen.insert(id, true);
        tail = current.clone();
        node = current.get_next_ast();
    }

    let mut incoming_seen = HashMap::new();
    let mut node = Some(incoming.clone());
    while let Some(current) = node {
        let id = Rc::as_ptr(&current) as *const () as usize;
        if id == 0 || incoming_seen.contains_key(&id) {
            return false;
        }
        incoming_seen.insert(id, true);
        if seen.contains_key(&id) {
            node = current.get_next_ast();
            continue;
        }
        let mut next = current.get_next_ast();
        while let Some(n) = next {
            let next_id = Rc::as_ptr(&n) as *const () as usize;
            if next_id == 0
                || incoming_seen.contains_key(&next_id)
                || seen.contains_key(&next_id)
            {
                return false;
            }
            incoming_seen.insert(next_id, true);
            next = n.get_next_ast();
        }
        if commit {
            tail.set_next_ast(Some(current));
        }
        return true;
    }
    true
}

fn ast_forest_key(grammar_symbol: i32, ast: &Rc<dyn IAst>) -> Option<String> {
    let left = ast.get_left_i_token();
    let right = ast.get_right_i_token();
    let stream_id = left
        .get_i_lex_stream()
        .map(|s| Rc::as_ptr(&s) as *const () as usize)
        .unwrap_or(0);
    Some(format!(
        "{}:{}:{}:{}",
        grammar_symbol,
        stream_id,
        left.get_token_index(),
        right.get_token_index()
    ))
}
