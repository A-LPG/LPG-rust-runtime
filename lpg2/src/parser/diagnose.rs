use crate::collections::IntTuple;
use crate::monitor::Monitor;
use crate::parse_error_codes::*;
use crate::parse_table::ParseTable;
use crate::token_stream::TokenStream;
use crate::utils::{append_rune, arraycopy, char_at, now, sub_str, to_lower, to_upper};

use super::configuration_stack::ConfigurationStack;

pub const BUFF_UBOUND: i32 = 31;
pub const BUFF_SIZE: i32 = 32;
pub const MAX_DISTANCE: i32 = 30;
pub const MIN_DISTANCE: i32 = 3;
pub const NIL: i32 = -1;

#[derive(Clone, Debug, Default)]
pub struct RepairCandidate {
    pub symbol: i32,
    pub location: i32,
}

impl RepairCandidate {
    pub fn new() -> Self {
        Self {
            symbol: 0,
            location: 0,
        }
    }
}

#[derive(Clone, Debug, Default)]
pub struct PrimaryRepairInfo {
    pub distance: i32,
    pub misspell_index: i32,
    pub code: i32,
    pub buffer_position: i32,
    pub symbol: i32,
}

impl PrimaryRepairInfo {
    pub fn new() -> Self {
        Self::default()
    }

    pub fn new_and_clone(clone: &PrimaryRepairInfo) -> Self {
        let mut t = Self::new();
        t.copy_from(clone);
        t
    }

    pub fn copy_from(&mut self, clone: &PrimaryRepairInfo) {
        self.distance = clone.distance;
        self.misspell_index = clone.misspell_index;
        self.code = clone.code;
        self.buffer_position = clone.buffer_position;
        self.symbol = clone.symbol;
    }
}

#[derive(Clone, Debug, Default)]
pub struct SecondaryRepairInfo {
    pub code: i32,
    pub distance: i32,
    pub buffer_position: i32,
    pub stack_position: i32,
    pub num_deletions: i32,
    pub symbol: i32,
    pub recovery_on_next_stack: bool,
}

impl SecondaryRepairInfo {
    pub fn new() -> Self {
        Self::default()
    }
}

#[derive(Clone, Debug)]
pub struct StateInfo {
    pub state: i32,
    pub next: i32,
}

impl StateInfo {
    pub fn new(state: i32, next: i32) -> Self {
        Self { state, next }
    }
}

pub fn state_info_arraycopy(
    src: &[StateInfo],
    src_pos: usize,
    dest: &mut [StateInfo],
    dest_pos: usize,
    length: usize,
) {
    dest[dest_pos..(length + dest_pos)].clone_from_slice(&src[src_pos..(length + src_pos)]);
}

pub trait DiagnoseParserDispatch<TS, PT>
where
    TS: TokenStream,
    PT: ParseTable + Clone,
{
    fn reallocate_stacks(parser: &mut DiagnoseParser<TS, PT>);
}

pub struct DiagnoseParser<TS, PT>
where
    TS: TokenStream,
    PT: ParseTable + Clone,
{
    pub extra_reallocate: Option<Box<dyn FnMut()>>,
    pub monitor: Option<Box<dyn Monitor>>,
    pub tok_stream: TS,
    pub prs: PT,
    pub error_symbol: i32,
    pub scope_size: i32,
    pub max_name_length: i32,
    pub nt_offset: i32,
    pub la_state_offset: i32,
    pub num_rules: i32,
    pub num_symbols: i32,
    pub start_state: i32,
    pub eoft_symbol: i32,
    pub eolt_symbol: i32,
    pub accept_action: i32,
    pub error_action: i32,
    pub list: Vec<i32>,
    pub max_errors: i32,
    pub max_time: i32,
    pub state_stack_top: i32,
    pub state_stack: Vec<i32>,
    pub location_stack: Vec<i32>,
    pub temp_stack_top: i32,
    pub temp_stack: Vec<i32>,
    pub prev_stack_top: i32,
    pub prev_stack: Vec<i32>,
    pub next_stack_top: i32,
    pub next_stack: Vec<i32>,
    pub scope_stack_top: i32,
    pub scope_index: Vec<i32>,
    pub scope_position: Vec<i32>,
    pub buffer: Vec<i32>,
    pub state_seen: Vec<i32>,
    pub state_pool_top: i32,
    pub state_pool: Vec<StateInfo>,
    pub main_configuration_stack: ConfigurationStack<PT>,
    pub stack_increment: i32,
}

impl<TS, PT> DiagnoseParserDispatch<TS, PT> for DiagnoseParser<TS, PT>
where
    TS: TokenStream,
    PT: ParseTable + Clone,
{
    fn reallocate_stacks(parser: &mut DiagnoseParser<TS, PT>) {
        parser.reallocate_stacks();
    }
}

impl<TS, PT> DiagnoseParser<TS, PT>
where
    TS: TokenStream,
    PT: ParseTable + Clone,
{
    pub fn new_diagnose_parser_ext(
        extra_reallocate: Option<Box<dyn FnMut()>>,
        tok_stream: TS,
        prs: PT,
        max_errors: i32,
        max_time: i32,
        monitor: Option<Box<dyn Monitor>>,
    ) -> Self {
        let mut my = Self::new_diagnose_parser(tok_stream, prs, max_errors, max_time, monitor);
        my.extra_reallocate = extra_reallocate;
        my
    }

    pub fn new_diagnose_parser(
        tok_stream: TS,
        prs: PT,
        max_errors: i32,
        max_time: i32,
        monitor: Option<Box<dyn Monitor>>,
    ) -> Self {
        let error_symbol = prs.get_error_symbol();
        let scope_size = prs.get_scope_size();
        let max_name_length = prs.get_max_name_length();
        let nt_offset = prs.get_nt_offset();
        let la_state_offset = prs.get_la_state_offset();
        let num_rules = prs.get_num_rules();
        let num_symbols = prs.get_num_symbols();
        let start_state = prs.get_start_state();
        let eoft_symbol = prs.get_eoft_symbol();
        let eolt_symbol = prs.get_eolt_symbol();
        let accept_action = prs.get_accept_action();
        let error_action = prs.get_error_action();
        let main_configuration_stack = ConfigurationStack::new(prs.clone());
        Self {
            extra_reallocate: None,
            monitor,
            tok_stream,
            prs,
            error_symbol,
            scope_size,
            max_name_length,
            nt_offset,
            la_state_offset,
            num_rules,
            num_symbols,
            start_state,
            eoft_symbol,
            eolt_symbol,
            accept_action,
            error_action,
            list: vec![0; (num_symbols + 1) as usize],
            max_errors,
            max_time,
            state_stack_top: 0,
            state_stack: Vec::new(),
            location_stack: Vec::new(),
            temp_stack_top: 0,
            temp_stack: Vec::new(),
            prev_stack_top: 0,
            prev_stack: Vec::new(),
            next_stack_top: 0,
            next_stack: Vec::new(),
            scope_stack_top: 0,
            scope_index: Vec::new(),
            scope_position: Vec::new(),
            buffer: vec![0; BUFF_SIZE as usize],
            state_seen: Vec::new(),
            state_pool_top: 0,
            state_pool: Vec::new(),
            main_configuration_stack,
            stack_increment: 256,
        }
    }

    pub fn set_monitor(&mut self, monitor: Option<Box<dyn Monitor>>) {
        self.monitor = monitor;
    }

    pub fn rhs(&self, index: i32) -> i32 {
        self.prs.rhs(index)
    }
    pub fn base_action(&self, index: i32) -> i32 {
        self.prs.base_action(index)
    }
    pub fn base_check(&self, index: i32) -> i32 {
        self.prs.base_check(index)
    }
    pub fn lhs(&self, index: i32) -> i32 {
        self.prs.lhs(index)
    }
    pub fn term_check(&self, index: i32) -> i32 {
        self.prs.term_check(index)
    }
    pub fn term_action(&self, index: i32) -> i32 {
        self.prs.term_action(index)
    }
    pub fn asb(&self, index: i32) -> i32 {
        self.prs.asb(index)
    }
    pub fn asr(&self, index: i32) -> i32 {
        self.prs.asr(index)
    }
    pub fn nasb(&self, index: i32) -> i32 {
        self.prs.nasb(index)
    }
    pub fn nasr(&self, index: i32) -> i32 {
        self.prs.nasr(index)
    }
    pub fn terminal_index(&self, index: i32) -> i32 {
        self.prs.terminal_index(index)
    }
    pub fn nonterminal_index(&self, index: i32) -> i32 {
        self.prs.nonterminal_index(index)
    }
    pub fn symbol_index(&self, index: i32) -> i32 {
        if index > self.nt_offset {
            self.nonterminal_index(index - self.nt_offset)
        } else {
            self.terminal_index(index)
        }
    }
    pub fn scope_prefix(&self, index: i32) -> i32 {
        self.prs.scope_prefix(index)
    }
    pub fn scope_suffix(&self, index: i32) -> i32 {
        self.prs.scope_suffix(index)
    }
    pub fn scope_lhs(&self, index: i32) -> i32 {
        self.prs.scope_lhs(index)
    }
    pub fn scope_la(&self, index: i32) -> i32 {
        self.prs.scope_la(index)
    }
    pub fn scope_state_set(&self, index: i32) -> i32 {
        self.prs.scope_state_set(index)
    }
    pub fn scope_rhs(&self, index: i32) -> i32 {
        self.prs.scope_rhs(index)
    }
    pub fn scope_state(&self, index: i32) -> i32 {
        self.prs.scope_state(index)
    }
    pub fn in_symb(&self, index: i32) -> i32 {
        self.prs.in_symb(index)
    }
    pub fn name(&self, index: i32) -> String {
        self.prs.name(index)
    }
    pub fn original_state(&self, state: i32) -> i32 {
        self.prs.original_state(state)
    }
    pub fn asi(&self, state: i32) -> i32 {
        self.prs.asi(state)
    }
    pub fn nasi(&self, state: i32) -> i32 {
        self.prs.nasi(state)
    }
    pub fn in_symbol(&self, state: i32) -> i32 {
        self.prs.in_symbol(state)
    }
    pub fn nt_action(&self, state: i32, sym: i32) -> i32 {
        self.prs.nt_action(state, sym)
    }
    pub fn is_nullable(&self, symbol: i32) -> bool {
        self.prs.is_nullable(symbol)
    }

    pub fn dispatch_reallocate_stacks(&mut self) {
        self.reallocate_stacks();
        let mut hook = self.extra_reallocate.take();
        if let Some(ref mut h) = hook {
            h();
        }
        self.extra_reallocate = hook;
    }

    pub fn reallocate_stacks(&mut self) {
        let old_stack_length = self.state_stack.len();
        let stack_length = old_stack_length + self.stack_increment as usize;

        if self.state_stack.is_empty() {
            self.state_stack = vec![0; stack_length];
            self.location_stack = vec![0; stack_length];
            self.temp_stack = vec![0; stack_length];
            self.prev_stack = vec![0; stack_length];
            self.next_stack = vec![0; stack_length];
            self.scope_index = vec![0; stack_length];
            self.scope_position = vec![0; stack_length];
        } else {
            let mut new_state_stack = vec![0; stack_length];
            arraycopy(&self.state_stack, 0, &mut new_state_stack, 0, old_stack_length);
            self.state_stack = new_state_stack;

            let mut new_location_stack = vec![0; stack_length];
            arraycopy(&self.location_stack, 0, &mut new_location_stack, 0, old_stack_length);
            self.location_stack = new_location_stack;

            let mut new_temp_stack = vec![0; stack_length];
            arraycopy(&self.temp_stack, 0, &mut new_temp_stack, 0, old_stack_length);
            self.temp_stack = new_temp_stack;

            let mut new_prev_stack = vec![0; stack_length];
            arraycopy(&self.prev_stack, 0, &mut new_prev_stack, 0, old_stack_length);
            self.prev_stack = new_prev_stack;

            let mut new_next_stack = vec![0; stack_length];
            arraycopy(&self.next_stack, 0, &mut new_next_stack, 0, old_stack_length);
            self.next_stack = new_next_stack;

            let mut new_scope_index = vec![0; stack_length];
            arraycopy(&self.scope_index, 0, &mut new_scope_index, 0, old_stack_length);
            self.scope_index = new_scope_index;

            let mut new_scope_position = vec![0; stack_length];
            arraycopy(&self.scope_position, 0, &mut new_scope_position, 0, old_stack_length);
            self.scope_position = new_scope_position;
        }
    }

    pub fn diagnose(&mut self, error_token: i32) {
        self.diagnose_entry(0, error_token);
    }

    pub fn diagnose_entry_with_marker_kind(&mut self, marker_kind: i32) {
        self.dispatch_reallocate_stacks();
        self.temp_stack_top = 0;
        self.temp_stack[self.temp_stack_top as usize] = self.start_state;
        self.tok_stream.reset();
        let (_current_token, current_kind) = if marker_kind == 0 {
            let current_token = self.tok_stream.get_token();
            let current_kind = self.tok_stream.get_kind(current_token);
            (current_token, current_kind)
        } else {
            let current_token = self.tok_stream.peek();
            (current_token, marker_kind)
        };

        let error_token = self.parse_for_error(current_kind);
        if error_token != 0 {
            self.diagnose_entry(marker_kind, error_token);
        }
    }

    pub fn diagnose_entry(&mut self, marker_kind: i32, error_token: i32) {
        let mut action = IntTuple::with_estimate(1 << 18);
        let start_time = now();
        let mut error_count = 0;

        if self.state_stack.is_empty() {
            self.dispatch_reallocate_stacks();
        }

        self.temp_stack_top = 0;
        self.temp_stack[self.temp_stack_top as usize] = self.start_state;
        self.tok_stream.reset();
        let mut current_kind = if marker_kind == 0 {
            let current_token = self.tok_stream.get_token();
            self.tok_stream.get_kind(current_token)
        } else {
            marker_kind
        };
        self.parse_up_to_error(&mut action, current_kind, error_token);

        self.state_stack_top = 0;
        self.state_stack[self.state_stack_top as usize] = self.start_state;

        self.temp_stack_top = self.state_stack_top;
        arraycopy(
            &self.temp_stack,
            0,
            &mut self.state_stack,
            0,
            (self.temp_stack_top + 1) as usize,
        );

        self.tok_stream.reset();
        let mut current_token = if marker_kind == 0 {
            self.tok_stream.get_token()
        } else {
            self.tok_stream.peek()
        };
        self.location_stack[self.state_stack_top as usize] = current_token;

        let mut error_token = error_token;
        loop {
            let mut prev_pos = -1;
            self.prev_stack_top = -1;

            let mut next_pos = -1;
            self.next_stack_top = -1;

            let mut pos = self.state_stack_top;
            self.temp_stack_top = self.state_stack_top - 1;
            arraycopy(
                &self.state_stack,
                0,
                &mut self.temp_stack,
                0,
                (self.state_stack_top + 1) as usize,
            );

            let mut action_index = 0;
            let mut act = action.get(action_index);
            action_index += 1;

            while act <= self.num_rules {
                loop {
                    self.temp_stack_top -= self.rhs(act) - 1;
                    act = self.nt_action(
                        self.temp_stack[self.temp_stack_top as usize],
                        self.lhs(act),
                    );
                    if act <= self.num_rules {
                        continue;
                    } else {
                        break;
                    }
                }

                if (self.temp_stack_top + 1) as usize >= self.state_stack.len() {
                    self.dispatch_reallocate_stacks();
                }
                if pos >= self.temp_stack_top {
                    pos = self.temp_stack_top;
                }
                self.temp_stack[(self.temp_stack_top + 1) as usize] = act;
                act = action.get(action_index);
                action_index += 1;
            }

            while act > self.error_action || act < self.accept_action {
                if let Some(ref monitor) = self.monitor {
                    if monitor.is_cancelled() {
                        return;
                    }
                }

                self.next_stack_top = self.temp_stack_top + 1;
                let mut i = next_pos + 1;
                while i <= self.next_stack_top {
                    self.next_stack[i as usize] = self.temp_stack[i as usize];
                    i += 1;
                }
                let mut k = pos + 1;
                while k <= self.next_stack_top {
                    self.location_stack[k as usize] =
                        self.location_stack[self.state_stack_top as usize];
                    k += 1;
                }

                if act > self.error_action {
                    act -= self.error_action;
                    loop {
                        self.next_stack_top -= self.rhs(act) - 1;
                        act = self.nt_action(
                            self.next_stack[self.next_stack_top as usize],
                            self.lhs(act),
                        );
                        if act <= self.num_rules {
                            continue;
                        } else {
                            break;
                        }
                    }
                    if pos >= self.next_stack_top {
                        pos = self.next_stack_top;
                    }
                }

                if (self.next_stack_top + 1) as usize >= self.state_stack.len() {
                    self.dispatch_reallocate_stacks();
                }

                self.temp_stack_top = self.next_stack_top;

                self.next_stack_top += 1;
                self.next_stack[self.next_stack_top as usize] = act;

                next_pos = self.next_stack_top;

                current_token = self.tok_stream.get_token();
                act = action.get(action_index);
                action_index += 1;
                while act <= self.num_rules {
                    loop {
                        let lhs_symbol = self.lhs(act);
                        self.temp_stack_top -= self.rhs(act) - 1;
                        if self.temp_stack_top > next_pos {
                            act = self.temp_stack[self.temp_stack_top as usize];
                        } else {
                            act = self.next_stack[self.temp_stack_top as usize];
                        }

                        act = self.nt_action(act, lhs_symbol);
                        if act <= self.num_rules {
                            continue;
                        } else {
                            break;
                        }
                    }

                    if (self.temp_stack_top + 1) as usize >= self.state_stack.len() {
                        self.dispatch_reallocate_stacks();
                    }
                    if next_pos >= self.temp_stack_top {
                        next_pos = self.temp_stack_top;
                    }
                    self.temp_stack[(self.temp_stack_top + 1) as usize] = act;

                    act = action.get(action_index);
                    action_index += 1;
                }

                if act != self.error_action {
                    self.prev_stack_top = self.state_stack_top;
                    let mut i = prev_pos + 1;
                    while i <= self.prev_stack_top {
                        self.prev_stack[i as usize] = self.state_stack[i as usize];
                        i += 1;
                    }
                    prev_pos = pos;

                    self.state_stack_top = self.next_stack_top;
                    let mut k = pos + 1;
                    while k <= self.state_stack_top {
                        self.state_stack[k as usize] = self.next_stack[k as usize];
                        k += 1;
                    }
                    self.location_stack[self.state_stack_top as usize] = current_token;
                    pos = next_pos;
                }
            }

            if act == self.error_action {
                error_count += 1;
                if error_count > 1 {
                    if self.max_errors > 0 && error_count > self.max_errors {
                        break;
                    }
                    if self.max_time > 0 && now() - start_time > self.max_time {
                        break;
                    }
                }
                let candidate = self.error_recovery(error_token);
                if let Some(ref monitor) = self.monitor {
                    if monitor.is_cancelled() {
                        return;
                    }
                }
                act = self.state_stack[self.state_stack_top as usize];

                if candidate.symbol == 0 {
                    break;
                } else if candidate.symbol > self.nt_offset {
                    let lhs_symbol = candidate.symbol - self.nt_offset;
                    act = self.nt_action(act, lhs_symbol);
                    while act <= self.num_rules {
                        self.state_stack_top -= self.rhs(act) - 1;
                        act = self.nt_action(
                            self.state_stack[self.state_stack_top as usize],
                            self.lhs(act),
                        );
                    }

                    self.state_stack_top += 1;
                    self.state_stack[self.state_stack_top as usize] = act;

                    current_token = self.tok_stream.get_token();
                    current_kind = self.tok_stream.get_kind(current_token);
                    self.location_stack[self.state_stack_top as usize] = current_token;
                } else {
                    current_kind = candidate.symbol;
                    self.location_stack[self.state_stack_top as usize] = candidate.location;
                }

                let next_token = self.tok_stream.peek();
                self.temp_stack_top = self.state_stack_top;
                arraycopy(
                    &self.state_stack,
                    0,
                    &mut self.temp_stack,
                    0,
                    (self.state_stack_top + 1) as usize,
                );
                error_token = self.parse_for_error(current_kind);

                if error_token != 0 {
                    self.tok_stream.reset_to(next_token);
                    self.temp_stack_top = self.state_stack_top;
                    arraycopy(
                        &self.state_stack,
                        0,
                        &mut self.temp_stack,
                        0,
                        (self.state_stack_top + 1) as usize,
                    );
                    self.parse_up_to_error(&mut action, current_kind, error_token);
                    self.tok_stream.reset_to(next_token);
                } else {
                    act = self.accept_action;
                }
            }
            if act != self.accept_action {
                continue;
            } else {
                break;
            }
        }
    }

    pub fn parse_for_error(&mut self, mut current_kind: i32) -> i32 {
        let mut error_token = 0;
        let mut curtok = self
            .tok_stream
            .get_previous(self.tok_stream.peek());
        let mut act = self.t_action(self.temp_stack[self.temp_stack_top as usize], current_kind);
        let mut configuration_stack = ConfigurationStack::new(self.prs.clone());

        loop {
            if act <= self.num_rules {
                self.temp_stack_top -= 1;

                loop {
                    self.temp_stack_top -= self.rhs(act) - 1;
                    act = self.nt_action(
                        self.temp_stack[self.temp_stack_top as usize],
                        self.lhs(act),
                    );
                    if act <= self.num_rules {
                        continue;
                    } else {
                        break;
                    }
                }
            } else if act > self.error_action {
                curtok = self.tok_stream.get_token();
                current_kind = self.tok_stream.get_kind(curtok);
                act -= self.error_action;

                loop {
                    self.temp_stack_top -= self.rhs(act) - 1;
                    act = self.nt_action(
                        self.temp_stack[self.temp_stack_top as usize],
                        self.lhs(act),
                    );
                    if act <= self.num_rules {
                        continue;
                    } else {
                        break;
                    }
                }
            } else if act < self.accept_action {
                curtok = self.tok_stream.get_token();
                current_kind = self.tok_stream.get_kind(curtok);
            } else if act == self.error_action {
                if error_token <= curtok {
                    error_token = curtok;
                }

                if let Some(configuration) = configuration_stack.pop() {
                    self.temp_stack_top = configuration.stack_top;
                    configuration.retrieve_stack(&mut self.temp_stack);
                    act = configuration.act;
                    curtok = configuration.curtok;
                    current_kind = self.tok_stream.get_kind(curtok);
                    self.tok_stream
                        .reset_to(self.tok_stream.get_next(curtok));
                    continue;
                } else {
                    act = self.error_action;
                    break;
                }
            } else if act > self.accept_action {
                if configuration_stack.find_configuration(
                    &self.temp_stack,
                    self.temp_stack_top,
                    curtok,
                ) {
                    act = self.error_action;
                } else {
                    configuration_stack.push(
                        &self.temp_stack,
                        self.temp_stack_top,
                        act + 1,
                        curtok,
                        0,
                    );
                    act = self.base_action(act);
                }
                continue;
            } else {
                break;
            }

            self.temp_stack_top += 1;
            if self.temp_stack_top as usize >= self.temp_stack.len() {
                self.dispatch_reallocate_stacks();
            }
            self.temp_stack[self.temp_stack_top as usize] = act;
            act = self.t_action(act, current_kind);
        }
        if act == self.error_action {
            error_token
        } else {
            0
        }
    }

    pub fn parse_up_to_error(
        &mut self,
        action: &mut IntTuple,
        mut current_kind: i32,
        error_token: i32,
    ) {
        let mut curtok = self
            .tok_stream
            .get_previous(self.tok_stream.peek());
        let mut act = self.t_action(self.temp_stack[self.temp_stack_top as usize], current_kind);
        let mut configuration_stack = ConfigurationStack::new(self.prs.clone());

        action.reset();
        loop {
            if act <= self.num_rules {
                action.add(act);
                self.temp_stack_top -= 1;

                loop {
                    self.temp_stack_top -= self.rhs(act) - 1;
                    act = self.nt_action(
                        self.temp_stack[self.temp_stack_top as usize],
                        self.lhs(act),
                    );
                    if act <= self.num_rules {
                        continue;
                    } else {
                        break;
                    }
                }
            } else if act > self.error_action {
                action.add(act);
                curtok = self.tok_stream.get_token();
                current_kind = self.tok_stream.get_kind(curtok);
                act -= self.error_action;

                loop {
                    self.temp_stack_top -= self.rhs(act) - 1;
                    act = self.nt_action(
                        self.temp_stack[self.temp_stack_top as usize],
                        self.lhs(act),
                    );
                    if act <= self.num_rules {
                        continue;
                    } else {
                        break;
                    }
                }
            } else if act < self.accept_action {
                action.add(act);
                curtok = self.tok_stream.get_token();
                current_kind = self.tok_stream.get_kind(curtok);
            } else if act == self.error_action {
                if curtok != error_token {
                    if let Some(configuration) = configuration_stack.pop() {
                        self.temp_stack_top = configuration.stack_top;
                        configuration.retrieve_stack(&mut self.temp_stack);
                        act = configuration.act;
                        curtok = configuration.curtok;
                        action.reset_to(configuration.action_length as usize);
                        current_kind = self.tok_stream.get_kind(curtok);
                        self.tok_stream
                            .reset_to(self.tok_stream.get_next(curtok));
                        continue;
                    }
                }
                break;
            } else if act > self.accept_action {
                if configuration_stack.find_configuration(
                    &self.temp_stack,
                    self.temp_stack_top,
                    curtok,
                ) {
                    act = self.error_action;
                } else {
                    configuration_stack.push(
                        &self.temp_stack,
                        self.temp_stack_top,
                        act + 1,
                        curtok,
                        action.size() as i32,
                    );
                    act = self.base_action(act);
                }
                continue;
            } else {
                break;
            }

            self.temp_stack_top += 1;
            if self.temp_stack_top as usize >= self.temp_stack.len() {
                self.dispatch_reallocate_stacks();
            }
            self.temp_stack[self.temp_stack_top as usize] = act;
            act = self.t_action(act, current_kind);
        }
        action.add(self.error_action);
    }

    pub fn parse_check(
        &mut self,
        stack: &[i32],
        stack_top: i32,
        first_symbol: i32,
        buffer_position: i32,
    ) -> i32 {
        let mut buffer_index: i32;
        let mut current_kind: i32;

        let mut local_stack = vec![0; stack.len()];
        let mut local_stack_top = stack_top;
        local_stack[..=(stack_top as usize)].copy_from_slice(&stack[..=(stack_top as usize)]);
        let mut configuration_stack = ConfigurationStack::new(self.prs.clone());

        let mut act = local_stack[local_stack_top as usize];
        if first_symbol > self.nt_offset {
            let lhs_symbol = first_symbol - self.nt_offset;
            buffer_index = buffer_position;
            current_kind = self.tok_stream.get_kind(self.buffer[buffer_index as usize]);
            self.tok_stream
                .reset_to(self.tok_stream.get_next(self.buffer[buffer_index as usize]));
            act = self.nt_action(act, lhs_symbol);
            while act <= self.num_rules {
                local_stack_top -= self.rhs(act) - 1;
                act = self.nt_action(local_stack[local_stack_top as usize], self.lhs(act));
            }
        } else {
            local_stack_top -= 1;
            buffer_index = buffer_position - 1;
            current_kind = first_symbol;
            self.tok_stream
                .reset_to(self.buffer[buffer_position as usize]);
        }

        local_stack_top += 1;
        if local_stack_top as usize >= local_stack.len() {
            return buffer_index;
        }
        local_stack[local_stack_top as usize] = act;

        act = self.t_action(act, current_kind);

        loop {
            if act <= self.num_rules {
                local_stack_top -= self.rhs(act);
                act = self.nt_action(local_stack[local_stack_top as usize], self.lhs(act));
                while act <= self.num_rules {
                    local_stack_top -= self.rhs(act) - 1;
                    act = self.nt_action(local_stack[local_stack_top as usize], self.lhs(act));
                }
            } else if act > self.error_action {
                if buffer_index == MAX_DISTANCE {
                    buffer_index += 1;
                    break;
                }
                buffer_index += 1;

                current_kind = self.tok_stream.get_kind(self.buffer[buffer_index as usize]);
                self.tok_stream
                    .reset_to(self.tok_stream.get_next(self.buffer[buffer_index as usize]));
                act -= self.error_action;

                loop {
                    local_stack_top -= self.rhs(act) - 1;
                    act = self.nt_action(local_stack[local_stack_top as usize], self.lhs(act));
                    if act <= self.num_rules {
                        continue;
                    } else {
                        break;
                    }
                }
            } else if act < self.accept_action {
                if buffer_index == MAX_DISTANCE {
                    buffer_index += 1;
                    break;
                }
                buffer_index += 1;
                current_kind = self.tok_stream.get_kind(self.buffer[buffer_index as usize]);
                self.tok_stream
                    .reset_to(self.tok_stream.get_next(self.buffer[buffer_index as usize]));
            } else if act == self.error_action {
                if let Some(configuration) = configuration_stack.pop() {
                    local_stack_top = configuration.stack_top;
                    configuration.retrieve_stack(&mut local_stack);
                    act = configuration.act;
                    buffer_index = configuration.curtok;
                    current_kind = self.tok_stream.get_kind(self.buffer[buffer_index as usize]);
                    self.tok_stream
                        .reset_to(self.tok_stream.get_next(self.buffer[buffer_index as usize]));
                    continue;
                } else {
                    act = self.error_action;
                    break;
                }
            } else if act > self.accept_action {
                if configuration_stack.find_configuration(&local_stack, local_stack_top, buffer_index)
                {
                    act = self.error_action;
                } else {
                    configuration_stack.push(
                        &local_stack,
                        local_stack_top,
                        act + 1,
                        buffer_index,
                        0,
                    );
                    act = self.base_action(act);
                }
                continue;
            } else {
                break;
            }

            local_stack_top += 1;
            if local_stack_top as usize >= local_stack.len() {
                break;
            }
            local_stack[local_stack_top as usize] = act;
            act = self.t_action(act, current_kind);
        }
        if act == self.accept_action {
            MAX_DISTANCE
        } else {
            buffer_index
        }
    }

    pub fn error_recovery(&mut self, error_token: i32) -> RepairCandidate {
        let prevtok = self.tok_stream.get_previous(error_token);

        let mut candidate = self.primary_phase(error_token);
        if candidate.symbol != 0 {
            return candidate;
        }
        candidate = self.secondary_phase(error_token);
        if candidate.symbol != 0 {
            return candidate;
        }

        if self.tok_stream.get_kind(error_token) != self.eoft_symbol {
            loop {
                if self.tok_stream.get_kind(self.buffer[BUFF_UBOUND as usize]) == self.eoft_symbol {
                    break;
                }
                candidate = self.secondary_phase(self.buffer[(MAX_DISTANCE - MIN_DISTANCE + 2) as usize]);
                if candidate.symbol != 0 {
                    return candidate;
                }
            }
        }

        let mut scope_repair = PrimaryRepairInfo::new();
        scope_repair.buffer_position = BUFF_UBOUND;
        let mut top = self.state_stack_top;
        while top >= 0 {
            self.scope_trial(&mut scope_repair, &mut self.state_stack.clone(), top);
            if scope_repair.distance > 0 {
                break;
            }
            top -= 1;
        }

        let mut i = 0;
        while i < self.scope_stack_top {
            self.emit_error(
                SCOPE_CODE,
                -self.scope_index[i as usize],
                self.location_stack[self.scope_position[i as usize] as usize],
                self.buffer[1],
                self.nonterminal_index(self.scope_lhs(self.scope_index[i as usize])),
            );
            i += 1;
        }

        if self.tok_stream.get_kind(error_token) == self.eoft_symbol {
            self.emit_error(
                EOF_CODE,
                self.terminal_index(self.eoft_symbol),
                prevtok,
                prevtok,
                0,
            );
        } else {
            let mut i = BUFF_UBOUND;
            while self.tok_stream.get_kind(self.buffer[i as usize]) == self.eoft_symbol {
                i -= 1;
            }

            self.emit_error(
                DELETION_CODE,
                self.terminal_index(self.tok_stream.get_kind(error_token)),
                error_token,
                self.buffer[i as usize],
                0,
            );
        }

        let mut candidate = RepairCandidate::new();
        candidate.symbol = 0;
        candidate.location = self.buffer[BUFF_UBOUND as usize];
        candidate
    }

    pub fn primary_phase(&mut self, error_token: i32) -> RepairCandidate {
        let i = if self.next_stack_top >= 0 { 3 } else { 2 };
        self.buffer[i as usize] = error_token;
        let mut j = i;
        while j > 0 {
            self.buffer[(j - 1) as usize] = self.tok_stream.get_previous(self.buffer[j as usize]);
            j -= 1;
        }
        let mut k = i + 1;
        while k < BUFF_SIZE {
            self.buffer[k as usize] = self.tok_stream.get_next(self.buffer[(k - 1) as usize]);
            k += 1;
        }

        let mut repair = PrimaryRepairInfo::new();
        if self.next_stack_top >= 0 {
            repair.buffer_position = 3;
            self.check_primary_distance(
                &mut repair,
                &self.next_stack.clone(),
                self.next_stack_top,
            );
        }

        let mut base_repair = PrimaryRepairInfo::new_and_clone(&repair);

        base_repair.buffer_position = 2;
        self.check_primary_distance(
            &mut base_repair,
            &self.state_stack.clone(),
            self.state_stack_top,
        );
        if base_repair.distance > repair.distance
            || base_repair.misspell_index > repair.misspell_index
        {
            repair = base_repair;
        }

        if self.prev_stack_top >= 0 {
            let mut prev_repair = PrimaryRepairInfo::new_and_clone(&repair);
            prev_repair.buffer_position = 1;
            self.check_primary_distance(
                &mut prev_repair,
                &self.prev_stack.clone(),
                self.prev_stack_top,
            );
            if prev_repair.distance > repair.distance
                || prev_repair.misspell_index > repair.misspell_index
            {
                repair = prev_repair;
            }
        }

        let candidate = RepairCandidate::new();
        if self.next_stack_top >= 0 {
            if self.secondary_check(&self.next_stack.clone(), self.next_stack_top, 3, repair.distance)
            {
                return candidate;
            }
        } else if self.secondary_check(
            &self.state_stack.clone(),
            self.state_stack_top,
            2,
            repair.distance,
        ) {
            return candidate;
        }

        repair.distance = repair.distance - repair.buffer_position + 1;

        if repair.code == INVALID_CODE
            || repair.code == DELETION_CODE
            || repair.code == SUBSTITUTION_CODE
            || repair.code == MERGE_CODE
        {
            repair.distance -= 1;
        }

        if repair.distance < MIN_DISTANCE {
            return candidate;
        }

        if repair.code == INSERTION_CODE
            && self.tok_stream.get_kind(self.buffer[(repair.buffer_position - 1) as usize]) == 0
        {
            repair.code = BEFORE_CODE;
        }

        if repair.buffer_position == 1 {
            self.state_stack_top = self.prev_stack_top;
            arraycopy(
                &self.prev_stack,
                0,
                &mut self.state_stack,
                0,
                (self.state_stack_top + 1) as usize,
            );
        } else if self.next_stack_top >= 0 && repair.buffer_position >= 3 {
            self.state_stack_top = self.next_stack_top;
            arraycopy(
                &self.next_stack,
                0,
                &mut self.state_stack,
                0,
                (self.state_stack_top + 1) as usize,
            );
            self.location_stack[self.state_stack_top as usize] = self.buffer[3];
        }
        self.primary_diagnosis(&repair)
    }

    pub fn merge_candidate(&self, state: i32, buffer_position: i32) -> i32 {
        let str = format!(
            "{}{}",
            self.tok_stream
                .get_name(self.buffer[buffer_position as usize]),
            self.tok_stream
                .get_name(self.buffer[(buffer_position + 1) as usize])
        );
        let mut k = self.asi(state);
        while self.asr(k) != 0 {
            let i = self.terminal_index(self.asr(k));
            if str.len() == self.name(i).len() && to_lower(&str) == to_lower(&self.name(i)) {
                return self.asr(k);
            }
            k += 1;
        }
        0
    }

    pub fn check_primary_distance(
        &mut self,
        repair: &mut PrimaryRepairInfo,
        stck: &[i32],
        stack_top: i32,
    ) {
        let mut scope_repair = PrimaryRepairInfo::new_and_clone(repair);
        self.scope_trial(&mut scope_repair, &mut stck.to_vec(), stack_top);
        if scope_repair.distance > repair.distance {
            repair.copy_from(&scope_repair);
        }

        let mut symbol = self.merge_candidate(stck[stack_top as usize], repair.buffer_position);
        if symbol != 0 {
            let j = self.parse_check(stck, stack_top, symbol, repair.buffer_position + 2);
            if j > repair.distance || (j == repair.distance && repair.misspell_index < 10) {
                repair.misspell_index = 10;
                repair.symbol = symbol;
                repair.distance = j;
                repair.code = MERGE_CODE;
            }
        }

        let j = self.parse_check(
            stck,
            stack_top,
            self.tok_stream
                .get_kind(self.buffer[(repair.buffer_position + 1) as usize]),
            repair.buffer_position + 2,
        );

        let k = if self.tok_stream.get_kind(self.buffer[repair.buffer_position as usize])
            == self.eolt_symbol
            && self
                .tok_stream
                .after_eol(self.buffer[(repair.buffer_position + 1) as usize])
        {
            10
        } else {
            0
        };

        if j > repair.distance || (j == repair.distance && k > repair.misspell_index) {
            repair.misspell_index = k;
            repair.code = DELETION_CODE;
            repair.distance = j;
        }

        let mut next_state = stck[stack_top as usize];
        let mut max_pos = stack_top;
        self.temp_stack_top = stack_top - 1;

        self.tok_stream
            .reset_to(self.buffer[(repair.buffer_position + 1) as usize]);
        let tok = self
            .tok_stream
            .get_kind(self.buffer[repair.buffer_position as usize]);
        let mut act = self.t_action(next_state, tok);
        while act <= self.num_rules {
            loop {
                let lhs_symbol = self.lhs(act);
                self.temp_stack_top -= self.rhs(act) - 1;

                if self.temp_stack_top > max_pos {
                    act = self.temp_stack[self.temp_stack_top as usize];
                } else {
                    act = stck[self.temp_stack_top as usize];
                }

                act = self.nt_action(act, lhs_symbol);
                if act <= self.num_rules {
                    continue;
                } else {
                    break;
                }
            }
            if max_pos >= self.temp_stack_top {
                max_pos = self.temp_stack_top;
            }
            self.temp_stack[(self.temp_stack_top + 1) as usize] = act;
            next_state = act;
            act = self.t_action(next_state, tok);
        }

        let mut root = 0;
        let mut i = self.asi(next_state);
        while self.asr(i) != 0 {
            symbol = self.asr(i);
            if symbol != self.eoft_symbol && symbol != self.error_symbol {
                if root == 0 {
                    self.list[symbol as usize] = symbol;
                } else {
                    self.list[symbol as usize] = self.list[root as usize];
                    self.list[root as usize] = symbol;
                }
                root = symbol;
            }
            i += 1;
        }
        if stck[stack_top as usize] != next_state {
            let mut i = self.asi(stck[stack_top as usize]);
            while self.asr(i) != 0 {
                symbol = self.asr(i);
                if symbol != self.eoft_symbol
                    && symbol != self.error_symbol
                    && self.list[symbol as usize] == 0
                {
                    if root == 0 {
                        self.list[symbol as usize] = symbol;
                    } else {
                        self.list[symbol as usize] = self.list[root as usize];
                        self.list[root as usize] = symbol;
                    }
                    root = symbol;
                }
                i += 1;
            }
        }

        let head = self.list[root as usize];
        self.list[root as usize] = 0;
        root = head;

        symbol = root;
        while symbol != 0 {
            let m = self.parse_check(stck, stack_top, symbol, repair.buffer_position);
            let n = if symbol == self.eolt_symbol
                && self
                    .tok_stream
                    .after_eol(self.buffer[repair.buffer_position as usize])
            {
                10
            } else {
                0
            };

            if m > repair.distance || (m == repair.distance && n > repair.misspell_index) {
                repair.misspell_index = n;
                repair.distance = m;
                repair.symbol = symbol;
                repair.code = INSERTION_CODE;
            }
            symbol = self.list[symbol as usize];
        }

        symbol = root;
        while symbol != 0 {
            let m = self.parse_check(stck, stack_top, symbol, repair.buffer_position + 1);
            let n = if symbol == self.eolt_symbol
                && self
                    .tok_stream
                    .after_eol(self.buffer[(repair.buffer_position + 1) as usize])
            {
                10
            } else {
                self.misspell(symbol, self.buffer[repair.buffer_position as usize])
            };

            if m > repair.distance || (m == repair.distance && n > repair.misspell_index) {
                repair.misspell_index = n;
                repair.distance = m;
                repair.symbol = symbol;
                repair.code = SUBSTITUTION_CODE;
            }
            let s = symbol;
            symbol = self.list[s as usize];
            self.list[s as usize] = 0;
        }

        let mut nt_index = self.nasi(stck[stack_top as usize]);
        while self.nasr(nt_index) != 0 {
            symbol = self.nasr(nt_index) + self.nt_offset;
            let n = self.parse_check(stck, stack_top, symbol, repair.buffer_position + 1);
            if n > repair.distance {
                repair.misspell_index = 0;
                repair.distance = n;
                repair.symbol = symbol;
                repair.code = INVALID_CODE;
            }

            let n = self.parse_check(stck, stack_top, symbol, repair.buffer_position);
            if n > repair.distance || (n == repair.distance && repair.code == INVALID_CODE) {
                repair.misspell_index = 0;
                repair.distance = n;
                repair.symbol = symbol;
                repair.code = INSERTION_CODE;
            }
            nt_index += 1;
        }
    }

    pub fn primary_diagnosis(&mut self, repair: &PrimaryRepairInfo) -> RepairCandidate {
        let prevtok = self.buffer[(repair.buffer_position - 1) as usize];
        let current_token = self.buffer[repair.buffer_position as usize];

        match repair.code {
            c if c == INSERTION_CODE || c == BEFORE_CODE => {
                let name_index = if repair.symbol > self.nt_offset {
                    self.get_nterm_index(
                        self.state_stack[self.state_stack_top as usize],
                        repair.symbol,
                        repair.buffer_position,
                    )
                } else {
                    self.get_term_index(
                        &self.state_stack.clone(),
                        self.state_stack_top,
                        repair.symbol,
                        repair.buffer_position,
                    )
                };

                let tok = if repair.code == INSERTION_CODE {
                    prevtok
                } else {
                    current_token
                };
                self.emit_error(repair.code, name_index, tok, tok, 0);
            }
            INVALID_CODE => {
                let name_index = self.get_nterm_index(
                    self.state_stack[self.state_stack_top as usize],
                    repair.symbol,
                    repair.buffer_position + 1,
                );
                self.emit_error(repair.code, name_index, current_token, current_token, 0);
            }
            SUBSTITUTION_CODE => {
                let (name_index, code) = if repair.misspell_index >= 6 {
                    (self.terminal_index(repair.symbol), repair.code)
                } else {
                    let name_index = self.get_term_index(
                        &self.state_stack.clone(),
                        self.state_stack_top,
                        repair.symbol,
                        repair.buffer_position + 1,
                    );
                    let code = if name_index != self.terminal_index(repair.symbol) {
                        INVALID_CODE
                    } else {
                        repair.code
                    };
                    (name_index, code)
                };
                self.emit_error(code, name_index, current_token, current_token, 0);
            }
            MERGE_CODE => {
                self.emit_error(
                    repair.code,
                    self.terminal_index(repair.symbol),
                    current_token,
                    self.tok_stream.get_next(current_token),
                    0,
                );
            }
            SCOPE_CODE => {
                let mut i = 0;
                while i < self.scope_stack_top {
                    self.emit_error(
                        repair.code,
                        -self.scope_index[i as usize],
                        self.location_stack[self.scope_position[i as usize] as usize],
                        prevtok,
                        self.nonterminal_index(self.scope_lhs(self.scope_index[i as usize])),
                    );
                    i += 1;
                }
                let symbol = self.scope_lhs(self.scope_index[self.scope_stack_top as usize])
                    + self.nt_offset;
                self.state_stack_top = self.scope_position[self.scope_stack_top as usize];
                let nterm_index = self.get_nterm_index(
                    self.state_stack[self.state_stack_top as usize],
                    symbol,
                    repair.buffer_position,
                );
                self.emit_error(
                    repair.code,
                    -self.scope_index[self.scope_stack_top as usize],
                    self.location_stack[self.scope_position[self.scope_stack_top as usize] as usize],
                    prevtok,
                    nterm_index,
                );
            }
            _ => {
                self.emit_error(
                    repair.code,
                    self.terminal_index(self.error_symbol),
                    current_token,
                    current_token,
                    0,
                );
            }
        }

        let mut candidate = RepairCandidate::new();
        match repair.code {
            c if c == INSERTION_CODE || c == BEFORE_CODE || c == SCOPE_CODE => {
                candidate.symbol = repair.symbol;
                candidate.location = self.buffer[repair.buffer_position as usize];
                self.tok_stream
                    .reset_to(self.buffer[repair.buffer_position as usize]);
            }
            c if c == INVALID_CODE || c == SUBSTITUTION_CODE => {
                candidate.symbol = repair.symbol;
                candidate.location = self.buffer[repair.buffer_position as usize];
                self.tok_stream
                    .reset_to(self.buffer[(repair.buffer_position + 1) as usize]);
            }
            MERGE_CODE => {
                candidate.symbol = repair.symbol;
                candidate.location = self.buffer[repair.buffer_position as usize];
                self.tok_stream
                    .reset_to(self.buffer[(repair.buffer_position + 2) as usize]);
            }
            _ => {
                candidate.location = self.buffer[(repair.buffer_position + 1) as usize];
                candidate.symbol = self.tok_stream.get_kind(
                    self.buffer[(repair.buffer_position + 1) as usize],
                );
                self.tok_stream
                    .reset_to(self.buffer[(repair.buffer_position + 2) as usize]);
            }
        }
        candidate
    }

    pub fn get_term_index(
        &mut self,
        stck: &[i32],
        stack_top: i32,
        tok: i32,
        buffer_position: i32,
    ) -> i32 {
        let mut act = stck[stack_top as usize];
        let mut max_pos = stack_top;
        let mut highest_symbol = tok;

        self.temp_stack_top = stack_top - 1;

        self.tok_stream
            .reset_to(self.buffer[buffer_position as usize]);
        act = self.t_action(act, tok);
        while act <= self.num_rules {
            loop {
                let lhs_symbol = self.lhs(act);
                self.temp_stack_top -= self.rhs(act) - 1;

                if self.temp_stack_top > max_pos {
                    act = self.temp_stack[self.temp_stack_top as usize];
                } else {
                    act = stck[self.temp_stack_top as usize];
                }

                act = self.nt_action(act, lhs_symbol);
                if act <= self.num_rules {
                    continue;
                } else {
                    break;
                }
            }

            if max_pos >= self.temp_stack_top {
                max_pos = self.temp_stack_top;
            }
            self.temp_stack[(self.temp_stack_top + 1) as usize] = act;
            act = self.t_action(act, tok);
        }

        self.temp_stack_top += 1;

        let threshold = self.temp_stack_top;

        let tok = self.tok_stream.get_kind(self.buffer[buffer_position as usize]);
        self.tok_stream
            .reset_to(self.buffer[(buffer_position + 1) as usize]);

        if act > self.error_action {
            act -= self.error_action;
        } else if act < self.accept_action {
            self.temp_stack[(self.temp_stack_top + 1) as usize] = act;
            act = self.t_action(act, tok);
        }
        while act <= self.num_rules {
            loop {
                let lhs_symbol = self.lhs(act);
                self.temp_stack_top -= self.rhs(act) - 1;

                if self.temp_stack_top < threshold {
                    if highest_symbol > self.nt_offset {
                        return self.nonterminal_index(highest_symbol - self.nt_offset);
                    } else {
                        return self.terminal_index(highest_symbol);
                    }
                }
                if self.temp_stack_top == threshold {
                    highest_symbol = lhs_symbol + self.nt_offset;
                }
                if self.temp_stack_top > max_pos {
                    act = self.temp_stack[self.temp_stack_top as usize];
                } else {
                    act = stck[self.temp_stack_top as usize];
                }

                act = self.nt_action(act, lhs_symbol);
                if act <= self.num_rules {
                    continue;
                } else {
                    break;
                }
            }

            self.temp_stack[(self.temp_stack_top + 1) as usize] = act;
            act = self.t_action(act, tok);
        }
        if highest_symbol > self.nt_offset {
            self.nonterminal_index(highest_symbol - self.nt_offset)
        } else {
            self.terminal_index(highest_symbol)
        }
    }

    pub fn get_nterm_index(&mut self, start: i32, sym: i32, buffer_position: i32) -> i32 {
        let mut highest_symbol = sym - self.nt_offset;
        let tok = self.tok_stream.get_kind(self.buffer[buffer_position as usize]);
        self.tok_stream
            .reset_to(self.buffer[(buffer_position + 1) as usize]);

        self.temp_stack_top = 0;
        self.temp_stack[0] = start;

        let mut act = self.nt_action(start, highest_symbol);
        if act > self.num_rules {
            self.temp_stack[(self.temp_stack_top + 1) as usize] = act;
            act = self.t_action(act, tok);
        }

        while act <= self.num_rules {
            loop {
                self.temp_stack_top -= self.rhs(act) - 1;
                if self.temp_stack_top < 0 {
                    return self.nonterminal_index(highest_symbol);
                }
                if self.temp_stack_top == 0 {
                    highest_symbol = self.lhs(act);
                }
                act = self.nt_action(self.temp_stack[self.temp_stack_top as usize], self.lhs(act));
                if act <= self.num_rules {
                    continue;
                } else {
                    break;
                }
            }
            self.temp_stack[(self.temp_stack_top + 1) as usize] = act;
            act = self.t_action(act, tok);
        }
        self.nonterminal_index(highest_symbol)
    }

    pub fn misspell(&self, sym: i32, tok: i32) -> i32 {
        let mut s1 = to_lower(&self.name(self.terminal_index(sym)));
        let n = s1.len() as i32;
        s1 = append_rune(&s1, '\0');

        let mut s2 = to_lower(&self.tok_stream.get_name(tok));
        let m = if s2.len() < self.max_name_length as usize {
            s2.len() as i32
        } else {
            self.max_name_length
        };
        s2 = sub_str(&s2, 0, m as usize);
        s2 = append_rune(&s2, '\0');

        if n == 1 && m == 1 {
            let c1 = char_at(&s1, 0);
            let c2 = char_at(&s2, 0);
            if (c1 == ';' && c2 == ',')
                || (c1 == ',' && c2 == ';')
                || (c1 == ';' && c2 == ':')
                || (c1 == ':' && c2 == ';')
                || (c1 == '.' && c2 == ',')
                || (c1 == ',' && c2 == '.')
                || (c1 == '\'' && c2 == '"')
                || (c1 == '"' && c2 == '\'')
            {
                return 3;
            }
        }

        let mut count = 0;
        let mut prefix_length = 0;
        let mut num_errors = 0;

        let mut i = 0;
        let mut j = 0;

        while i < n && j < m {
            if char_at(&s1, i as usize) == char_at(&s2, j as usize) {
                count += 1;
                i += 1;
                j += 1;
                if num_errors == 0 {
                    prefix_length += 1;
                }
            } else if char_at(&s1, (i + 1) as usize) == char_at(&s2, j as usize)
                && char_at(&s1, i as usize) == char_at(&s2, (j + 1) as usize)
            {
                count += 2;
                i += 2;
                j += 2;
                num_errors += 1;
            } else if char_at(&s1, (i + 1) as usize) == char_at(&s2, (j + 1) as usize) {
                i += 2;
                j += 2;
                num_errors += 1;
            } else {
                if (n - i) > (m - j) {
                    i += 1;
                } else if (m - j) > (n - i) {
                    j += 1;
                } else {
                    i += 1;
                    j += 1;
                }
                num_errors += 1;
            }
        }

        if i < n || j < m {
            num_errors += 1;
        }
        let mut temp;
        if n < m {
            temp = n / 6 + 1;
        } else {
            temp = m / 6 + 1;
        }
        if num_errors > temp {
            count = prefix_length;
        }
        if n < s1.len() as i32 {
            temp = s1.len() as i32;
        } else {
            temp = n;
        }
        count * 10 / (temp + num_errors)
    }

    pub fn scope_trial_check(
        &mut self,
        repair: &mut PrimaryRepairInfo,
        stack: &mut [i32],
        stack_top: i32,
        indx: i32,
    ) {
        let mut i = self.state_seen[stack_top as usize];
        while i != NIL {
            if self.state_pool[i as usize].state == stack[stack_top as usize] {
                return;
            }
            i = self.state_pool[i as usize].next;
        }
        let old_state_pool_top = self.state_pool_top;
        self.state_pool_top += 1;
        if self.state_pool_top as usize >= self.state_pool.len() {
            let mut new_pool = vec![
                StateInfo::new(0, NIL);
                (self.state_pool_top * 2) as usize
            ];
            state_info_arraycopy(
                &self.state_pool,
                0,
                &mut new_pool,
                0,
                self.state_pool_top as usize,
            );
            self.state_pool = new_pool;
        }

        self.state_pool[old_state_pool_top as usize] = StateInfo::new(
            stack[stack_top as usize],
            self.state_seen[stack_top as usize],
        );
        self.state_seen[stack_top as usize] = old_state_pool_top;

        let mut action = IntTuple::with_estimate(1 << 3);
        let mut i = 0;
        while i < self.scope_size {
            action.reset();
            let mut act = self.t_action(stack[stack_top as usize], self.scope_la(i));
            if act > self.accept_action && act < self.error_action {
                loop {
                    action.add(self.base_action(act));
                    act += 1;
                    if self.base_action(act) != 0 {
                        continue;
                    } else {
                        break;
                    }
                }
            } else {
                action.add(act);
            }

            let mut action_index = 0;
            while (action_index as i32) < action.size() as i32 {
                self.tok_stream
                    .reset_to(self.buffer[repair.buffer_position as usize]);
                self.temp_stack_top = stack_top - 1;
                let mut max_pos = stack_top;

                act = action.get(action_index);
                action_index += 1;
                while act <= self.num_rules {
                    loop {
                        let lhs_symbol = self.lhs(act);
                        self.temp_stack_top -= self.rhs(act) - 1;

                        if self.temp_stack_top > max_pos {
                            act = self.temp_stack[self.temp_stack_top as usize];
                        } else {
                            act = stack[self.temp_stack_top as usize];
                        }

                        act = self.nt_action(act, lhs_symbol);
                        if act <= self.num_rules {
                            continue;
                        } else {
                            break;
                        }
                    }
                    if (self.temp_stack_top + 1) as usize >= self.state_stack.len() {
                        return;
                    }
                    if max_pos >= self.temp_stack_top {
                        max_pos = self.temp_stack_top;
                    }
                    self.temp_stack[(self.temp_stack_top + 1) as usize] = act;
                    act = self.t_action(act, self.scope_la(i));
                }

                if act != self.error_action {
                    let mut k = self.scope_prefix(i);
                    let mut j = self.temp_stack_top + 1;
                    while j >= (max_pos + 1)
                        && self.in_symbol(self.temp_stack[j as usize]) == self.scope_rhs(k)
                    {
                        j -= 1;
                        k += 1;
                    }
                    if j == max_pos {
                        j = max_pos;
                        while j >= 1 && self.in_symbol(stack[j as usize]) == self.scope_rhs(k) {
                            j -= 1;
                            k += 1;
                        }
                    }

                    let marked_pos = if max_pos < stack_top {
                        max_pos + 1
                    } else {
                        stack_top
                    };

                    if self.scope_rhs(k) == 0 && j < marked_pos {
                        let stack_position = j;
                        let mut jj = self.scope_state_set(i);
                        while stack[stack_position as usize] != self.scope_state(jj)
                            && self.scope_state(jj) != 0
                        {
                            jj += 1;
                        }

                        if self.scope_state(jj) != 0 {
                            let previous_distance = repair.distance;
                            let distance = self.parse_check(
                                stack,
                                stack_position,
                                self.scope_lhs(i) + self.nt_offset,
                                repair.buffer_position,
                            );

                            if (distance - repair.buffer_position + 1) < MIN_DISTANCE {
                                let mut top = stack_position;
                                act = self.nt_action(stack[top as usize], self.scope_lhs(i));
                                while act <= self.num_rules {
                                    top -= self.rhs(act) - 1;
                                    act = self.nt_action(stack[top as usize], self.lhs(act));
                                }
                                top += 1;
                                let j_act = act;
                                let saved = stack[top as usize];
                                stack[top as usize] = j_act;
                                self.scope_trial_check(repair, stack, top, indx + 1);
                                stack[top as usize] = saved;
                            } else if distance > repair.distance {
                                self.scope_stack_top = indx;
                                repair.distance = distance;
                            }

                            if self.tok_stream.get_kind(
                                self.buffer[repair.buffer_position as usize],
                            ) == self.eoft_symbol
                                && repair.distance == previous_distance
                            {
                                self.scope_stack_top = indx;
                                repair.distance = MAX_DISTANCE;
                            }

                            if repair.distance > previous_distance {
                                self.scope_index[indx as usize] = i;
                                self.scope_position[indx as usize] = stack_position;
                                return;
                            }
                        }
                    }
                }
            }
            i += 1;
        }
    }

    pub fn secondary_check(
        &mut self,
        stack: &[i32],
        stack_top: i32,
        buffer_position: i32,
        distance: i32,
    ) -> bool {
        let mut top = stack_top - 1;
        while top >= 0 {
            let j = self.parse_check(
                stack,
                top,
                self.tok_stream
                    .get_kind(self.buffer[buffer_position as usize]),
                buffer_position + 1,
            );
            if (j - buffer_position + 1) > MIN_DISTANCE && j > distance {
                return true;
            }
            top -= 1;
        }

        let mut scope_repair = PrimaryRepairInfo::new();
        scope_repair.buffer_position = buffer_position + 1;
        scope_repair.distance = distance;
        self.scope_trial(&mut scope_repair, &mut stack.to_vec(), stack_top);
        (scope_repair.distance - buffer_position) > MIN_DISTANCE && scope_repair.distance > distance
    }

    pub fn scope_trial(&mut self, repair: &mut PrimaryRepairInfo, stack: &mut [i32], stack_top: i32) {
        if self.state_seen.is_empty() || self.state_seen.len() < self.state_stack.len() {
            self.state_seen = vec![NIL; self.state_stack.len()];
        }
        let mut i = 0;
        while i < self.state_stack.len() {
            self.state_seen[i] = NIL;
            i += 1;
        }

        self.state_pool_top = 0;
        if self.state_pool.is_empty() || self.state_pool.len() < self.state_stack.len() {
            self.state_pool = vec![StateInfo::new(0, NIL); self.state_stack.len()];
        }
        self.scope_trial_check(repair, stack, stack_top, 0);
        repair.code = SCOPE_CODE;
        repair.misspell_index = 10;
    }

    pub fn secondary_phase(&mut self, error_token: i32) -> RepairCandidate {
        let mut repair = SecondaryRepairInfo::new();
        let mut misplaced_repair = SecondaryRepairInfo::new();

        let mut next_last_index = 0;
        if self.next_stack_top >= 0 {
            self.buffer[2] = error_token;
            self.buffer[1] = self.tok_stream.get_previous(self.buffer[2]);
            self.buffer[0] = self.tok_stream.get_previous(self.buffer[1]);
            let mut k = 3;
            while k < BUFF_UBOUND {
                self.buffer[k as usize] = self.tok_stream.get_next(self.buffer[(k - 1) as usize]);
                k += 1;
            }

            self.buffer[BUFF_UBOUND as usize] = self.tok_stream.bad_token();

            next_last_index = MAX_DISTANCE - 1;
            while next_last_index >= 1
                && self.tok_stream.get_kind(self.buffer[next_last_index as usize])
                    == self.eoft_symbol
            {
                next_last_index -= 1;
            }
            next_last_index += 1;

            let save_location = self.location_stack[self.next_stack_top as usize];
            self.location_stack[self.next_stack_top as usize] = self.buffer[2];
            misplaced_repair.num_deletions = self.next_stack_top;
            self.misplacement_recovery(
                &mut misplaced_repair,
                &self.next_stack.clone(),
                self.next_stack_top,
                next_last_index,
                true,
            );
            if misplaced_repair.recovery_on_next_stack {
                misplaced_repair.distance += 1;
            }
            repair.num_deletions = self.next_stack_top + BUFF_UBOUND;
            self.secondary_recovery(
                &mut repair,
                &self.next_stack.clone(),
                self.next_stack_top,
                next_last_index,
                true,
            );

            if repair.recovery_on_next_stack {
                repair.distance += 1;
            }
            self.location_stack[self.next_stack_top as usize] = save_location;
        } else {
            misplaced_repair.num_deletions = self.state_stack_top;
            repair.num_deletions = self.state_stack_top + BUFF_UBOUND;
        }

        self.buffer[3] = error_token;

        self.buffer[2] = self.tok_stream.get_previous(self.buffer[3]);
        self.buffer[1] = self.tok_stream.get_previous(self.buffer[2]);
        self.buffer[0] = self.tok_stream.get_previous(self.buffer[1]);
        let mut k = 4;
        while k < BUFF_SIZE {
            self.buffer[k as usize] = self.tok_stream.get_next(self.buffer[(k - 1) as usize]);
            k += 1;
        }

        let mut last_index = MAX_DISTANCE - 1;
        while last_index >= 1
            && self.tok_stream.get_kind(self.buffer[last_index as usize]) == self.eoft_symbol
        {
            last_index -= 1;
        }
        last_index += 1;

        self.misplacement_recovery(
            &mut misplaced_repair,
            &self.state_stack.clone(),
            self.state_stack_top,
            last_index,
            false,
        );

        self.secondary_recovery(
            &mut repair,
            &self.state_stack.clone(),
            self.state_stack_top,
            last_index,
            false,
        );

        if misplaced_repair.distance > MIN_DISTANCE
            && (misplaced_repair.num_deletions <= repair.num_deletions
                || (misplaced_repair.distance - misplaced_repair.num_deletions)
                    >= (repair.distance - repair.num_deletions))
        {
            repair.code = MISPLACED_CODE;
            repair.stack_position = misplaced_repair.stack_position;
            repair.buffer_position = 2;
            repair.num_deletions = misplaced_repair.num_deletions;
            repair.distance = misplaced_repair.distance;
            repair.recovery_on_next_stack = misplaced_repair.recovery_on_next_stack;
        }

        if repair.recovery_on_next_stack {
            self.state_stack_top = self.next_stack_top;
            arraycopy(
                &self.next_stack,
                0,
                &mut self.state_stack,
                0,
                (self.state_stack_top + 1) as usize,
            );

            self.buffer[2] = error_token;
            self.buffer[1] = self.tok_stream.get_previous(self.buffer[2]);
            self.buffer[0] = self.tok_stream.get_previous(self.buffer[1]);
            let mut k = 3;
            while k < BUFF_UBOUND {
                self.buffer[k as usize] = self.tok_stream.get_next(self.buffer[(k - 1) as usize]);
                k += 1;
            }

            self.buffer[BUFF_UBOUND as usize] = self.tok_stream.bad_token();

            self.location_stack[self.next_stack_top as usize] = self.buffer[2];
            last_index = next_last_index;
        }

        if repair.code == SECONDARY_CODE || repair.code == DELETION_CODE {
            let mut scope_repair = PrimaryRepairInfo::new();
            scope_repair.buffer_position = 2;
            while scope_repair.buffer_position <= repair.buffer_position
                && repair.code != SCOPE_CODE
            {
                self.scope_trial(
                    &mut scope_repair,
                    &mut self.state_stack.clone(),
                    self.state_stack_top,
                );
                let j = if scope_repair.distance == MAX_DISTANCE {
                    last_index
                } else {
                    scope_repair.distance
                };

                let k = scope_repair.buffer_position - 1;
                if (scope_repair.distance - k) > MIN_DISTANCE
                    && (j - k) > (repair.distance - repair.num_deletions)
                {
                    let i = self.scope_index[self.scope_stack_top as usize];
                    repair.code = SCOPE_CODE;
                    repair.symbol = self.scope_lhs(i) + self.nt_offset;
                    repair.stack_position = self.state_stack_top;
                    repair.buffer_position = scope_repair.buffer_position;
                }
                scope_repair.buffer_position += 1;
            }
        }

        let mut candidate = RepairCandidate::new();
        if repair.code == 0 {
            return candidate;
        }
        self.secondary_diagnosis(&repair);

        match repair.code {
            MISPLACED_CODE => {
                candidate.location = self.buffer[2];
                candidate.symbol = self.tok_stream.get_kind(self.buffer[2]);
                self.tok_stream.reset_to(self.tok_stream.get_next(self.buffer[2]));
            }
            DELETION_CODE => {
                candidate.location = self.buffer[repair.buffer_position as usize];
                candidate.symbol = self
                    .tok_stream
                    .get_kind(self.buffer[repair.buffer_position as usize]);
                self.tok_stream.reset_to(self.tok_stream.get_next(
                    self.buffer[repair.buffer_position as usize],
                ));
            }
            _ => {
                candidate.symbol = repair.symbol;
                candidate.location = self.buffer[repair.buffer_position as usize];
                self.tok_stream
                    .reset_to(self.buffer[repair.buffer_position as usize]);
            }
        }
        candidate
    }

    pub fn misplacement_recovery(
        &mut self,
        repair: &mut SecondaryRepairInfo,
        stack: &[i32],
        stack_top: i32,
        last_index: i32,
        stack_flag: bool,
    ) {
        let mut previous_loc = self.buffer[2];
        let mut stack_deletions = 0;
        let mut top = stack_top - 1;
        while top >= 0 {
            if self.location_stack[top as usize] < previous_loc {
                stack_deletions += 1;
            }
            previous_loc = self.location_stack[top as usize];

            let parse_distance = self.parse_check(stack, top, self.tok_stream.get_kind(self.buffer[2]), 3);
            let j = if parse_distance == MAX_DISTANCE {
                last_index
            } else {
                parse_distance
            };
            if parse_distance > MIN_DISTANCE
                && (j - stack_deletions) > (repair.distance - repair.num_deletions)
            {
                repair.stack_position = top;
                repair.distance = j;
                repair.num_deletions = stack_deletions;
                repair.recovery_on_next_stack = stack_flag;
            }
            top -= 1;
        }
    }

    pub fn secondary_recovery(
        &mut self,
        repair: &mut SecondaryRepairInfo,
        stack: &[i32],
        stack_top: i32,
        last_index: i32,
        stack_flag: bool,
    ) {
        let mut previous_loc = self.buffer[2];
        let mut stack_deletions = 0;
        let mut top = stack_top;
        while top >= 0 && repair.num_deletions >= stack_deletions {
            if self.location_stack[top as usize] < previous_loc {
                stack_deletions += 1;
            }
            previous_loc = self.location_stack[top as usize];
            let mut i = 2;
            while i <= (last_index - MIN_DISTANCE + 1)
                && repair.num_deletions >= (stack_deletions + i - 1)
            {
                let parse_distance = self.parse_check(
                    stack,
                    top,
                    self.tok_stream.get_kind(self.buffer[i as usize]),
                    i + 1,
                );
                let j = if parse_distance == MAX_DISTANCE {
                    last_index
                } else {
                    parse_distance
                };
                if (parse_distance - i + 1) > MIN_DISTANCE {
                    let k = stack_deletions + i - 1;
                    if k < repair.num_deletions
                        || (j - k) > (repair.distance - repair.num_deletions)
                        || (repair.code == SECONDARY_CODE
                            && (j - k) == (repair.distance - repair.num_deletions))
                    {
                        repair.code = DELETION_CODE;
                        repair.distance = j;
                        repair.stack_position = top;
                        repair.buffer_position = i;
                        repair.num_deletions = k;
                        repair.recovery_on_next_stack = stack_flag;
                    }
                }
                let mut l = self.nasi(stack[top as usize]);
                while l >= 0 && self.nasr(l) != 0 {
                    let symbol = self.nasr(l) + self.nt_offset;
                    let parse_distance = self.parse_check(stack, top, symbol, i);
                    let j = if parse_distance == MAX_DISTANCE {
                        last_index
                    } else {
                        parse_distance
                    };

                    if (parse_distance - i + 1) > MIN_DISTANCE {
                        let k = stack_deletions + i - 1;
                        if k < repair.num_deletions || (j - k) > (repair.distance - repair.num_deletions)
                        {
                            repair.code = SECONDARY_CODE;
                            repair.symbol = symbol;
                            repair.distance = j;
                            repair.stack_position = top;
                            repair.buffer_position = i;
                            repair.num_deletions = k;
                            repair.recovery_on_next_stack = stack_flag;
                        }
                    }
                    l += 1;
                }
                i += 1;
            }
            top -= 1;
        }
    }

    pub fn secondary_diagnosis(&mut self, repair: &SecondaryRepairInfo) {
        match repair.code {
            SCOPE_CODE => {
                if repair.stack_position < self.state_stack_top {
                    self.emit_error(
                        DELETION_CODE,
                        self.terminal_index(self.error_symbol),
                        self.location_stack[repair.stack_position as usize],
                        self.buffer[1],
                        0,
                    );
                }
                let mut i = 0;
                while i < self.scope_stack_top {
                    self.emit_error(
                        SCOPE_CODE,
                        -self.scope_index[i as usize],
                        self.location_stack[self.scope_position[i as usize] as usize],
                        self.buffer[1],
                        self.nonterminal_index(self.scope_lhs(self.scope_index[i as usize])),
                    );
                    i += 1;
                }

                let symbol = self.scope_lhs(self.scope_index[self.scope_stack_top as usize])
                    + self.nt_offset;
                self.state_stack_top = self.scope_position[self.scope_stack_top as usize];
                let nterm_index = self.get_nterm_index(
                    self.state_stack[self.state_stack_top as usize],
                    symbol,
                    repair.buffer_position,
                );
                self.emit_error(
                    SCOPE_CODE,
                    -self.scope_index[self.scope_stack_top as usize],
                    self.location_stack[self.scope_position[self.scope_stack_top as usize] as usize],
                    self.buffer[1],
                    nterm_index,
                );
            }
            _ => {
                let name_index = if repair.code == SECONDARY_CODE {
                    self.get_nterm_index(
                        self.state_stack[repair.stack_position as usize],
                        repair.symbol,
                        repair.buffer_position,
                    )
                } else {
                    self.terminal_index(self.error_symbol)
                };
                self.emit_error(
                    repair.code,
                    name_index,
                    self.location_stack[repair.stack_position as usize],
                    self.buffer[(repair.buffer_position - 1) as usize],
                    0,
                );
                self.state_stack_top = repair.stack_position;
            }
        }
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

    pub fn t_action(&mut self, act: i32, sym: i32) -> i32 {
        let act = self.prs.t_action(act, sym);
        if act > self.la_state_offset {
            self.lookahead(act, self.tok_stream.peek())
        } else {
            act
        }
    }

    pub fn emit_error(
        &mut self,
        msg_code: i32,
        name_index: i32,
        left_token: i32,
        right_token: i32,
        _scope_name_index: i32,
    ) {
        let mut msg_code = msg_code;
        let mut token_name = if name_index >= 0 && to_upper(&self.name(name_index)) != "ERROR" {
            format!("\"{}\"", self.name(name_index))
        } else {
            String::new()
        };

        if msg_code == INVALID_CODE {
            if token_name.is_empty() {
                msg_code = INVALID_CODE;
            } else {
                msg_code = INVALID_TOKEN_CODE;
            }
        }
        if msg_code == SCOPE_CODE {
            token_name = "\"".to_string();
            let mut i = self.scope_suffix(-name_index);
            while self.scope_rhs(i) != 0 {
                if !self.is_nullable(self.scope_rhs(i)) {
                    let symbol_index = if self.scope_rhs(i) > self.nt_offset {
                        self.nonterminal_index(self.scope_rhs(i) - self.nt_offset)
                    } else {
                        self.terminal_index(self.scope_rhs(i))
                    };

                    if !self.name(symbol_index).is_empty() {
                        if token_name.len() > 1 {
                            token_name.push(' ');
                        }
                        token_name.push_str(&self.name(symbol_index));
                    }
                }
                i += 1;
            }
            token_name.push('"');
        }
        self.tok_stream.report_error(
            msg_code,
            left_token,
            right_token,
            &[token_name],
            0,
        );
    }
}
