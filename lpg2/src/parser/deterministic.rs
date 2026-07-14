use std::any::Any;

use crate::collections::IntTuple;
use crate::error::{
    BadParseException, BadParseSymFileException, LpgException, NotDeterministicParseTableException,
};
use crate::monitor::Monitor;
use crate::parse_table::ParseTable;
use crate::traits::RuleAction;
use crate::token_stream::TokenStream;

use super::stacks::Stacks;

pub struct DeterministicParser<TS, PT, RA>
where
    TS: TokenStream,
    PT: ParseTable + Clone,
    RA: RuleAction,
{
    pub stacks: Stacks,
    pub taking_actions: bool,
    pub marker_kind: i32,
    pub monitor: Option<Box<dyn Monitor>>,
    pub start_state: i32,
    pub num_rules: i32,
    pub nt_offset: i32,
    pub la_state_offset: i32,
    pub eoft_symbol: i32,
    pub accept_action: i32,
    pub error_action: i32,
    pub error_symbol: i32,
    pub last_token: i32,
    pub current_action: i32,
    pub action: Option<IntTuple>,
    pub tok_stream: TS,
    pub prs: PT,
    pub ra: RA,
}

impl<TS, PT, RA> DeterministicParser<TS, PT, RA>
where
    TS: TokenStream,
    PT: ParseTable + Clone,
    RA: RuleAction,
{
    pub fn new(
        tok_stream: TS,
        prs: PT,
        ra: RA,
        monitor: Option<Box<dyn Monitor>>,
    ) -> Result<Self, LpgException> {
        if !prs.is_valid_for_parser() {
            return Err(BadParseSymFileException::new("").into());
        }
        if prs.get_backtrack() {
            return Err(NotDeterministicParseTableException::new("").into());
        }
        Ok(Self {
            stacks: Stacks::new(),
            taking_actions: false,
            marker_kind: 0,
            monitor,
            start_state: prs.get_start_state(),
            num_rules: prs.get_num_rules(),
            nt_offset: prs.get_nt_offset(),
            la_state_offset: prs.get_la_state_offset(),
            eoft_symbol: prs.get_eoft_symbol(),
            accept_action: prs.get_accept_action(),
            error_action: prs.get_error_action(),
            error_symbol: prs.get_error_symbol(),
            last_token: 0,
            current_action: 0,
            action: None,
            tok_stream,
            prs,
            ra,
        })
    }

    pub fn lookahead(&mut self, act: i32, token: i32) -> i32 {
        let act = self
            .prs
            .look_ahead(act - self.la_state_offset, self.tok_stream.get_kind(token));
        if act > self.la_state_offset {
            self.lookahead(act, self.tok_stream.get_next(token))
        } else {
            act
        }
    }

    pub fn t_action1(&mut self, act: i32, sym: i32) -> i32 {
        let act = self.prs.t_action(act, sym);
        if act > self.la_state_offset {
            self.lookahead(act, self.tok_stream.peek())
        } else {
            act
        }
    }

    pub fn t_action(&mut self, act: i32, sym: &[i32], index: usize) -> i32 {
        let mut act = self.prs.t_action(act, sym[index]);
        let mut index = index;
        while act > self.la_state_offset {
            index = (index + 1) % sym.len();
            act = self
                .prs
                .look_ahead(act - self.la_state_offset, sym[index]);
        }
        act
    }

    pub fn process_reductions(&mut self) {
        loop {
            self.stacks.state_stack_top -= self.prs.rhs(self.current_action) - 1;
            self.ra.rule_action(self.current_action);
            self.current_action = self.prs.nt_action(
                self.stacks.state_stack[self.stacks.state_stack_top as usize],
                self.prs.lhs(self.current_action),
            );
            if self.current_action <= self.num_rules {
                continue;
            } else {
                break;
            }
        }
    }

    pub fn get_current_rule(&self) -> i32 {
        if self.taking_actions {
            self.current_action
        } else {
            -1
        }
    }

    pub fn get_first_token(&self) -> i32 {
        if self.taking_actions {
            self.get_token(1)
        } else {
            -1
        }
    }

    pub fn get_first_token_at(&self, i: i32) -> i32 {
        if self.taking_actions {
            self.get_token(i)
        } else {
            -1
        }
    }

    pub fn get_last_token(&self) -> i32 {
        if self.taking_actions {
            self.last_token
        } else {
            -1
        }
    }

    pub fn get_last_token_at(&self, i: i32) -> i32 {
        if self.taking_actions {
            if i >= self.prs.rhs(self.current_action) {
                self.last_token
            } else {
                self.tok_stream
                    .get_previous(self.get_token(i + 1))
            }
        } else {
            -1
        }
    }

    pub fn get_token(&self, i: i32) -> i32 {
        self.stacks.get_token(i)
    }

    pub fn get_sym(&self, i: i32) -> Option<&dyn Any> {
        self.stacks.get_sym(i)
    }

    pub fn set_sym1(&mut self, ast: Option<Box<dyn Any>>) {
        self.stacks.set_sym1(ast);
    }

    pub fn set_monitor(&mut self, monitor: Option<Box<dyn Monitor>>) {
        self.monitor = monitor;
    }

    pub fn reset1(&mut self) {
        self.taking_actions = false;
        self.marker_kind = 0;
        if let Some(ref mut action) = self.action {
            action.reset();
        }
    }

    pub fn reset2(&mut self, tok_stream: TS, monitor: Option<Box<dyn Monitor>>) {
        self.monitor = monitor;
        self.tok_stream = tok_stream;
        self.reset1();
    }

    pub fn reset(
        &mut self,
        tok_stream: Option<TS>,
        prs: Option<PT>,
        monitor: Option<Box<dyn Monitor>>,
    ) -> Result<(), LpgException> {
        if let Some(prs) = prs {
            self.prs = prs;
            self.start_state = self.prs.get_start_state();
            self.num_rules = self.prs.get_num_rules();
            self.nt_offset = self.prs.get_nt_offset();
            self.la_state_offset = self.prs.get_la_state_offset();
            self.eoft_symbol = self.prs.get_eoft_symbol();
            self.error_symbol = self.prs.get_error_symbol();
            self.accept_action = self.prs.get_accept_action();
            self.error_action = self.prs.get_error_action();
            if !self.prs.is_valid_for_parser() {
                return Err(BadParseSymFileException::new("").into());
            }
            if self.prs.get_backtrack() {
                return Err(NotDeterministicParseTableException::new("").into());
            }
        }
        if tok_stream.is_none() {
            self.reset1();
            return Ok(());
        }
        self.reset2(tok_stream.unwrap(), monitor);
        Ok(())
    }

    pub fn parse_entry(
        &mut self,
        marker_kind: i32,
    ) -> Result<Option<Box<dyn Any>>, LpgException> {
        self.taking_actions = true;
        self.tok_stream.reset();
        self.last_token = self
            .tok_stream
            .get_previous(self.tok_stream.peek());
        let (mut curtok, mut current_kind) = if marker_kind == 0 {
            let curtok = self.tok_stream.get_token();
            let current_kind = self.tok_stream.get_kind(curtok);
            (curtok, current_kind)
        } else {
            (self.last_token, marker_kind)
        };

        self.stacks.reallocate_stacks();
        self.stacks.state_stack_top = -1;
        self.current_action = self.start_state;

        loop {
            if let Some(ref monitor) = self.monitor {
                if monitor.is_cancelled() {
                    self.taking_actions = false;
                    return Ok(None);
                }
            }

            self.stacks.state_stack_top += 1;
            if self.stacks.state_stack_top as usize >= self.stacks.state_stack.len() {
                self.stacks.reallocate_stacks();
            }

            self.stacks.state_stack[self.stacks.state_stack_top as usize] = self.current_action;
            self.stacks.location_stack[self.stacks.state_stack_top as usize] = curtok;

            self.current_action = self.t_action1(self.current_action, current_kind);

            if self.current_action <= self.num_rules {
                self.stacks.state_stack_top -= 1;
                self.process_reductions();
            } else if self.current_action > self.error_action {
                self.last_token = curtok;
                curtok = self.tok_stream.get_token();
                current_kind = self.tok_stream.get_kind(curtok);
                self.current_action -= self.error_action;
                self.process_reductions();
            } else if self.current_action < self.accept_action {
                self.last_token = curtok;
                curtok = self.tok_stream.get_token();
                current_kind = self.tok_stream.get_kind(curtok);
            } else {
                break;
            }
        }

        self.taking_actions = false;

        if self.current_action == self.error_action {
            return Err(BadParseException::new(curtok).into());
        }

        if marker_kind == 0 {
            Ok(self.stacks.parse_stack[0].take())
        } else {
            Ok(self.stacks.parse_stack[1].take())
        }
    }

    pub fn reset_parser(&mut self) {
        self.reset_parser_entry(0);
    }

    pub fn reset_parser_entry(&mut self, marker_kind: i32) {
        self.marker_kind = marker_kind;
        if self.stacks.state_stack.is_empty() {
            self.stacks.reallocate_stacks();
        }
        self.stacks.state_stack_top = 0;
        self.stacks.state_stack[0] = self.start_state;
        if self.action.is_none() {
            self.action = Some(IntTuple::with_estimate(1 << 20));
        } else if let Some(ref mut action) = self.action {
            action.reset();
        }
        self.taking_actions = false;
        if marker_kind != 0 {
            let sym = [marker_kind];
            let _ = self.parse(&sym, 0);
        }
    }

    pub fn recoverable_state(&self, state: i32) -> bool {
        let mut k = self.prs.asi(state);
        while self.prs.asr(k) != 0 {
            if self.prs.asr(k) == self.error_symbol {
                return true;
            }
            k += 1;
        }
        false
    }

    pub fn error_reset(&mut self) {
        let gate = if self.marker_kind == 0 { 0 } else { 1 };
        while self.stacks.state_stack_top >= gate {
            if self.recoverable_state(
                self.stacks.state_stack[self.stacks.state_stack_top as usize],
            ) {
                break;
            }
            self.stacks.state_stack_top -= 1;
        }
        if self.stacks.state_stack_top < gate {
            self.reset_parser_entry(self.marker_kind);
        }
    }

    pub fn parse(&mut self, sym: &[i32], index: usize) -> Result<i32, LpgException> {
        let action_ptr = self
            .action
            .as_mut()
            .expect("action tuple not initialized") as *mut IntTuple;
        let save_action_length = unsafe { (*action_ptr).size() };
        let mut pos = self.stacks.state_stack_top;
        let mut location_top = self.stacks.state_stack_top - 1;

        self.current_action = self.t_action(
            self.stacks.state_stack[self.stacks.state_stack_top as usize],
            sym,
            index,
        );
        while self.current_action <= self.num_rules {
            unsafe {
                (*action_ptr).add(self.current_action);
            }
            loop {
                location_top -= self.prs.rhs(self.current_action) - 1;

                let state = if location_top > pos {
                    self.stacks.location_stack[location_top as usize]
                } else {
                    self.stacks.state_stack[location_top as usize]
                };

                self.current_action =
                    self.prs
                        .nt_action(state, self.prs.lhs(self.current_action));
                if self.current_action <= self.num_rules {
                    continue;
                } else {
                    break;
                }
            }

            if pos >= location_top {
                pos = location_top;
            }
            if (location_top + 1) as usize >= self.stacks.location_stack.len() {
                self.stacks.reallocate_stacks();
            }
            self.stacks.location_stack[(location_top + 1) as usize] = self.current_action;

            self.current_action = self.t_action(self.current_action, sym, index);
        }

        if self.current_action > self.error_action || self.current_action < self.accept_action {
            unsafe {
                (*action_ptr).add(self.current_action);
            }

            self.stacks.state_stack_top = location_top + 1;
            let mut i = pos + 1;
            while i <= self.stacks.state_stack_top {
                self.stacks.state_stack[i as usize] =
                    self.stacks.location_stack[i as usize];
                i += 1;
            }

            if self.current_action > self.error_action {
                self.current_action -= self.error_action;
                loop {
                    self.stacks.state_stack_top -= self.prs.rhs(self.current_action) - 1;
                    self.current_action = self.prs.nt_action(
                        self.stacks.state_stack[self.stacks.state_stack_top as usize],
                        self.prs.lhs(self.current_action),
                    );
                    if self.current_action <= self.num_rules {
                        continue;
                    } else {
                        break;
                    }
                }
            }

            self.stacks.state_stack_top += 1;
            if self.stacks.state_stack_top as usize >= self.stacks.state_stack.len() {
                self.stacks.reallocate_stacks();
            }
            self.stacks.state_stack[self.stacks.state_stack_top as usize] = self.current_action;
        } else if self.current_action == self.error_action {
            unsafe {
                (*action_ptr).reset_to(save_action_length);
            }
        }
        Ok(self.current_action)
    }

    pub fn parse_actions(&mut self) -> Option<Box<dyn Any>> {
        self.taking_actions = true;
        self.tok_stream.reset();
        self.last_token = self
            .tok_stream
            .get_previous(self.tok_stream.peek());
        let mut curtok = if self.marker_kind == 0 {
            self.tok_stream.get_token()
        } else {
            self.last_token
        };

        self.stacks.state_stack_top = -1;
        self.current_action = self.start_state;
        let action = self.action.take().expect("action tuple not initialized");
        let action_size = action.size();
        let mut i = 0;
        while i < action_size {
            if let Some(ref monitor) = self.monitor {
                if monitor.is_cancelled() {
                    self.taking_actions = false;
                    self.action = Some(action);
                    return None;
                }
            }

            self.stacks.state_stack_top += 1;
            self.stacks.state_stack[self.stacks.state_stack_top as usize] = self.current_action;
            self.stacks.location_stack[self.stacks.state_stack_top as usize] = curtok;

            self.current_action = action.get(i);
            i += 1;
            if self.current_action <= self.num_rules {
                self.stacks.state_stack_top -= 1;
                self.process_reductions();
            } else {
                self.last_token = curtok;
                curtok = self.tok_stream.get_token();
                if self.current_action > self.error_action {
                    self.current_action -= self.error_action;
                    self.process_reductions();
                }
            }
        }

        self.taking_actions = false;
        self.action = None;
        if self.marker_kind == 0 {
            self.stacks.parse_stack[0].take()
        } else {
            self.stacks.parse_stack[1].take()
        }
    }
}
