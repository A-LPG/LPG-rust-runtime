use crate::collections::{IntSegmentedTuple, IntTuple};
use crate::error::{BadParseException, LpgException};
use crate::monitor::Monitor;
use crate::parse_error_codes::SCOPE_CODE;
use crate::parse_table::ParseTable;
use crate::traits::{IPrsStream, TokenStream};
use crate::utils::arraycopy;

use super::backtracking::BacktrackingParser;
use super::configuration_stack::ConfigurationStack;
use super::diagnose::{
    DiagnoseParser, PrimaryRepairInfo, MIN_DISTANCE, BUFF_SIZE,
};

/// Token stream view through a raw pointer for recovery (single-threaded).
struct SharedPrsStream<TS: IPrsStream> {
    ptr: *mut TS,
}

impl<TS: IPrsStream> SharedPrsStream<TS> {
    fn new(ptr: *mut TS) -> Self {
        Self { ptr }
    }

    unsafe fn inner(&self) -> &TS {
        &*self.ptr
    }

    unsafe fn inner_mut(&mut self) -> &mut TS {
        &mut *self.ptr
    }
}

impl<TS: IPrsStream> TokenStream for SharedPrsStream<TS> {
    fn get_token_from_end_token(&mut self, end_token: i32) -> i32 {
        unsafe { self.inner_mut().get_token_from_end_token(end_token) }
    }
    fn get_token(&mut self) -> i32 {
        unsafe { self.inner_mut().get_token() }
    }
    fn get_kind(&self, i: i32) -> i32 {
        unsafe { self.inner().get_kind(i) }
    }
    fn get_next(&self, i: i32) -> i32 {
        unsafe { self.inner().get_next(i) }
    }
    fn get_previous(&self, i: i32) -> i32 {
        unsafe { self.inner().get_previous(i) }
    }
    fn get_name(&self, i: i32) -> String {
        unsafe { self.inner().get_name(i) }
    }
    fn peek(&self) -> i32 {
        unsafe { self.inner().peek() }
    }
    fn reset(&mut self) {
        unsafe { self.inner_mut().reset() }
    }
    fn reset_to(&mut self, i: i32) {
        unsafe { self.inner_mut().reset_to(i) }
    }
    fn bad_token(&self) -> i32 {
        unsafe { self.inner().bad_token() }
    }
    fn get_line(&self, i: i32) -> i32 {
        unsafe { self.inner().get_line(i) }
    }
    fn get_column(&self, i: i32) -> i32 {
        unsafe { self.inner().get_column(i) }
    }
    fn get_end_line(&self, i: i32) -> i32 {
        unsafe { self.inner().get_end_line(i) }
    }
    fn get_end_column(&self, i: i32) -> i32 {
        unsafe { self.inner().get_end_column(i) }
    }
    fn after_eol(&self, i: i32) -> bool {
        unsafe { self.inner().after_eol(i) }
    }
    fn get_file_name(&self) -> String {
        unsafe { self.inner().get_file_name() }
    }
    fn get_stream_length(&self) -> i32 {
        unsafe { self.inner().get_stream_length() }
    }
    fn get_first_real_token(&self, i: i32) -> i32 {
        unsafe { self.inner().get_first_real_token(i) }
    }
    fn get_last_real_token(&self, i: i32) -> i32 {
        unsafe { self.inner().get_last_real_token(i) }
    }
    fn report_error(
        &mut self,
        error_code: i32,
        left_token: i32,
        right_token: i32,
        error_info: &[String],
        error_token: i32,
    ) {
        unsafe {
            self.inner_mut()
                .report_error(error_code, left_token, right_token, error_info, error_token)
        }
    }
}

impl<TS: IPrsStream> IPrsStream for SharedPrsStream<TS> {
    fn get_message_handler(
        &self,
    ) -> Option<std::rc::Rc<std::cell::RefCell<dyn crate::traits::IMessageHandler>>> {
        unsafe { self.inner().get_message_handler() }
    }
    fn set_message_handler(
        &mut self,
        handler: std::rc::Rc<std::cell::RefCell<dyn crate::traits::IMessageHandler>>,
    ) {
        unsafe { self.inner_mut().set_message_handler(handler) }
    }
    fn get_i_lex_stream(&self) -> Option<crate::traits::LexStreamRef> {
        unsafe { self.inner().get_i_lex_stream() }
    }
    fn set_lex_stream(&mut self, lex_stream: crate::traits::LexStreamRef) {
        unsafe { self.inner_mut().set_lex_stream(lex_stream) }
    }
    fn make_token(&mut self, start_loc: i32, end_loc: i32, kind: i32) {
        unsafe { self.inner_mut().make_token(start_loc, end_loc, kind) }
    }
    fn make_adjunct(&mut self, start_loc: i32, end_loc: i32, kind: i32) {
        unsafe { self.inner_mut().make_adjunct(start_loc, end_loc, kind) }
    }
    fn remove_last_token(&mut self) {
        unsafe { self.inner_mut().remove_last_token() }
    }
    fn get_line_count(&self) -> i32 {
        unsafe { self.inner().get_line_count() }
    }
    fn get_size(&self) -> i32 {
        unsafe { self.inner().get_size() }
    }
    fn remap_terminal_symbols(
        &mut self,
        ordered_parser_symbols: &[String],
        eof_symbol: i32,
    ) -> Result<(), LpgException> {
        unsafe {
            self.inner_mut()
                .remap_terminal_symbols(ordered_parser_symbols, eof_symbol)
        }
    }
    fn ordered_terminal_symbols(&self) -> Option<Vec<String>> {
        unsafe { self.inner().ordered_terminal_symbols() }
    }
    fn map_kind(&self, kind: i32) -> i32 {
        unsafe { self.inner().map_kind(kind) }
    }
    fn reset_token_stream(&mut self) {
        unsafe { self.inner_mut().reset_token_stream() }
    }
    fn get_stream_index(&self) -> i32 {
        unsafe { self.inner().get_stream_index() }
    }
    fn reset_stream_length(&mut self) {
        unsafe { self.inner_mut().reset_stream_length() }
    }
    fn set_stream_index(&mut self, index: i32) {
        unsafe { self.inner_mut().set_stream_index(index) }
    }
    fn set_stream_length(&mut self, length: i32) {
        unsafe { self.inner_mut().set_stream_length(length) }
    }
    fn add_token(&mut self, token: std::rc::Rc<dyn crate::traits::IToken>) {
        unsafe { self.inner_mut().add_token(token) }
    }
    fn add_adjunct(&mut self, adjunct: std::rc::Rc<dyn crate::traits::IToken>) {
        unsafe { self.inner_mut().add_adjunct(adjunct) }
    }
    fn ordered_exported_symbols(&self) -> Option<Vec<String>> {
        unsafe { self.inner().ordered_exported_symbols() }
    }
    fn get_tokens(&self) -> &crate::collections::TokenArrayList {
        unsafe { self.inner().get_tokens() }
    }
    fn get_adjuncts(&self) -> &crate::collections::TokenArrayList {
        unsafe { self.inner().get_adjuncts() }
    }
    fn get_following_adjuncts(&self, i: i32) -> Vec<std::rc::Rc<dyn crate::traits::IToken>> {
        unsafe { self.inner().get_following_adjuncts(i) }
    }
    fn get_preceding_adjuncts(&self, i: i32) -> Vec<std::rc::Rc<dyn crate::traits::IToken>> {
        unsafe { self.inner().get_preceding_adjuncts(i) }
    }
    fn get_i_token(&self, i: i32) -> Option<std::rc::Rc<dyn crate::traits::IToken>> {
        unsafe { self.inner().get_i_token(i) }
    }
    fn get_token_text(&self, i: i32) -> String {
        unsafe { self.inner().get_token_text(i) }
    }
    fn get_start_offset(&self, i: i32) -> i32 {
        unsafe { self.inner().get_start_offset(i) }
    }
    fn get_end_offset(&self, i: i32) -> i32 {
        unsafe { self.inner().get_end_offset(i) }
    }
    fn get_line_offset(&self, i: i32) -> i32 {
        unsafe { self.inner().get_line_offset(i) }
    }
    fn get_line_number_of_char_at(&self, i: i32) -> i32 {
        unsafe { self.inner().get_line_number_of_char_at(i) }
    }
    fn get_column_of_char_at(&self, i: i32) -> i32 {
        unsafe { self.inner().get_column_of_char_at(i) }
    }
    fn get_token_length(&self, i: i32) -> i32 {
        unsafe { self.inner().get_token_length(i) }
    }
    fn get_line_number_of_token_at(&self, i: i32) -> i32 {
        unsafe { self.inner().get_line_number_of_token_at(i) }
    }
    fn get_end_line_number_of_token_at(&self, i: i32) -> i32 {
        unsafe { self.inner().get_end_line_number_of_token_at(i) }
    }
    fn get_column_of_token_at(&self, i: i32) -> i32 {
        unsafe { self.inner().get_column_of_token_at(i) }
    }
    fn get_end_column_of_token_at(&self, i: i32) -> i32 {
        unsafe { self.inner().get_end_column_of_token_at(i) }
    }
    fn get_input_chars(&self) -> Vec<char> {
        unsafe { self.inner().get_input_chars() }
    }
    fn to_string_from_index(&self, first_token: i32, last_token: i32) -> String {
        unsafe { self.inner().to_string_from_index(first_token, last_token) }
    }
    fn to_string_tokens(
        &self,
        t1: &dyn crate::traits::IToken,
        t2: &dyn crate::traits::IToken,
    ) -> String {
        unsafe { self.inner().to_string_tokens(t1, t2) }
    }
    fn get_token_index_at_character(&self, offset: i32) -> i32 {
        unsafe { self.inner().get_token_index_at_character(offset) }
    }
    fn get_token_at_character(&self, offset: i32) -> Option<std::rc::Rc<dyn crate::traits::IToken>> {
        unsafe { self.inner().get_token_at_character(offset) }
    }
    fn get_token_at(&self, i: i32) -> Option<std::rc::Rc<dyn crate::traits::IToken>> {
        unsafe { self.inner().get_token_at(i) }
    }
    fn dump_tokens(&self) {
        unsafe { self.inner().dump_tokens() }
    }
    fn dump_token(&self, i: i32) {
        unsafe { self.inner().dump_token(i) }
    }
    fn make_error_token(&mut self, first: i32, last: i32, error: i32, kind: i32) -> i32 {
        unsafe { self.inner_mut().make_error_token(first, last, error, kind) }
    }
}

pub struct RecoveryParser<TS, PT, RA>
where
    TS: IPrsStream,
    PT: ParseTable + Clone,
    RA: crate::traits::RuleAction,
{
    diagnose: DiagnoseParser<SharedPrsStream<TS>, PT>,
    parser: *mut BacktrackingParser<TS, PT, RA>,
    action: *mut IntSegmentedTuple,
    tokens: *mut IntTuple,
    action_stack: Vec<i32>,
    scope_repair: PrimaryRepairInfo,
}

impl<TS, PT, RA> RecoveryParser<TS, PT, RA>
where
    TS: IPrsStream,
    PT: ParseTable + Clone,
    RA: crate::traits::RuleAction,
{
    #[allow(clippy::too_many_arguments)]
    pub fn new(
        parser: *mut BacktrackingParser<TS, PT, RA>,
        action: *mut IntSegmentedTuple,
        tokens: *mut IntTuple,
        stream_ptr: *mut TS,
        prs: PT,
        max_errors: i32,
        max_time: i32,
        monitor: Option<Box<dyn Monitor>>,
    ) -> Self {
        let shared = SharedPrsStream::new(stream_ptr);
        let diagnose = DiagnoseParser::new_diagnose_parser(shared, prs, max_errors, max_time, monitor);

        let mut rp = Self {
            diagnose,
            parser,
            action,
            tokens,
            action_stack: Vec::new(),
            scope_repair: PrimaryRepairInfo::new(),
        };

        let action_stack_ptr = &mut rp.action_stack as *mut Vec<i32>;
        let state_stack_ptr = &mut rp.diagnose.state_stack as *mut Vec<i32>;
        rp.diagnose.extra_reallocate = Some(Box::new(move || {
            reallocate_action_stack_hook(action_stack_ptr, state_stack_ptr);
        }));

        rp
    }

    pub fn take_monitor(&mut self) -> Option<Box<dyn Monitor>> {
        self.diagnose.monitor.take()
    }

    pub fn reallocate_stacks(&mut self) {
        self.diagnose.dispatch_reallocate_stacks();
    }

    pub fn report_error(&mut self, scope_index: i32, error_token: i32) {
        let mut text = String::from("\"");
        let mut i = self.diagnose.scope_suffix(scope_index);
        while self.diagnose.scope_rhs(i) != 0 {
            if !self.diagnose.is_nullable(self.diagnose.scope_rhs(i)) {
                let symbol_index = if self.diagnose.scope_rhs(i) > self.diagnose.nt_offset {
                    self.diagnose
                        .nonterminal_index(self.diagnose.scope_rhs(i) - self.diagnose.nt_offset)
                } else {
                    self.diagnose.terminal_index(self.diagnose.scope_rhs(i))
                };
                if !self.diagnose.name(symbol_index).is_empty() {
                    if text.len() > 1 {
                        text.push(' ');
                    }
                    text.push_str(&self.diagnose.name(symbol_index));
                }
            }
            i += 1;
        }
        text.push('"');
        self.diagnose.tok_stream.report_error(
            SCOPE_CODE,
            error_token,
            error_token,
            &[text],
            0,
        );
    }

    pub fn recover(&mut self, marker_token: i32, error_token: i32) -> Result<i32, LpgException> {
        if self.diagnose.state_stack.is_empty() {
            self.reallocate_stacks();
        }

        unsafe {
            (*self.tokens).reset();
        }
        self.diagnose.tok_stream.reset();
        unsafe {
            (*self.tokens).add(
                self.diagnose
                    .tok_stream
                    .get_previous(self.diagnose.tok_stream.peek()),
            );
        }

        let restart_token = if marker_token != 0 {
            marker_token
        } else {
            self.diagnose.tok_stream.get_token()
        };

        let mut old_action_size = 0;
        self.diagnose.state_stack_top = 0;
        self.diagnose.state_stack[0] = self.diagnose.start_state;
        if self.action_stack.len() < self.diagnose.state_stack.len() {
            self.action_stack.resize(self.diagnose.state_stack.len(), 0);
        }

        let mut recovery_attempts = 0;
        const MAX_RECOVERY_ATTEMPTS: i32 = 64;

        loop {
            if recovery_attempts >= MAX_RECOVERY_ATTEMPTS {
                return Err(BadParseException::new(error_token).into());
            }
            recovery_attempts += 1;
            unsafe {
                (*self.action).reset_to(old_action_size);
            }
            if !self.fix_error(restart_token, error_token) {
                return Err(BadParseException::new(error_token).into());
            }
            if let Some(ref monitor) = self.diagnose.monitor {
                if monitor.is_cancelled() {
                    break;
                }
            }

            let restart_token = error_token;
            self.diagnose.tok_stream.reset_to(error_token);
            old_action_size = unsafe { (*self.action).size() };
            let new_error = unsafe {
                (*self.parser).backtrack_parse(
                    &self.diagnose.state_stack.clone(),
                    self.diagnose.state_stack_top,
                    &mut *self.action,
                    0,
                )
            };
            self.diagnose.tok_stream.reset_to(
                self.diagnose.tok_stream.get_next(restart_token),
            );
            if new_error != 0 {
                continue;
            } else {
                return Ok(restart_token);
            }
        }
        Ok(restart_token)
    }

    pub fn fix_error(&mut self, start_token: i32, error_token: i32) -> bool {
        let mut curtok = start_token;
        let mut current_kind = self.diagnose.tok_stream.get_kind(curtok);
        let first_stream_token = self.diagnose.tok_stream.peek();

        self.diagnose.buffer[1] = error_token;
        self.diagnose.buffer[0] = self
            .diagnose
            .tok_stream
            .get_previous(self.diagnose.buffer[1]);
        let mut k = 2;
        while k < BUFF_SIZE {
            self.diagnose.buffer[k as usize] = self
                .diagnose
                .tok_stream
                .get_next(self.diagnose.buffer[(k - 1) as usize]);
            k += 1;
        }

        self.scope_repair.distance = 0;
        self.scope_repair.misspell_index = 0;
        self.scope_repair.buffer_position = 1;

        self.diagnose.main_configuration_stack =
            ConfigurationStack::new(self.diagnose.prs.clone());

        self.diagnose.location_stack[self.diagnose.state_stack_top as usize] = curtok;
        self.action_stack[self.diagnose.state_stack_top as usize] =
            unsafe { (*self.action).size() as i32 };

        let mut act = self.diagnose.t_action(
            self.diagnose.state_stack[self.diagnose.state_stack_top as usize],
            current_kind,
        );

        loop {
            if let Some(ref monitor) = self.diagnose.monitor {
                if monitor.is_cancelled() {
                    return true;
                }
            }

            if act <= self.diagnose.num_rules {
                unsafe {
                    (*self.action).add(act);
                }
                self.diagnose.state_stack_top -= 1;
                loop {
                    self.diagnose.state_stack_top -= self.diagnose.rhs(act) - 1;
                    act = self.diagnose.nt_action(
                        self.diagnose.state_stack[self.diagnose.state_stack_top as usize],
                        self.diagnose.lhs(act),
                    );
                    if act <= self.diagnose.num_rules {
                        continue;
                    } else {
                        break;
                    }
                }
                self.diagnose.state_stack_top += 1;
                if self.diagnose.state_stack_top as usize >= self.diagnose.state_stack.len() {
                    self.reallocate_stacks();
                }
                self.diagnose.state_stack[self.diagnose.state_stack_top as usize] = act;
                self.diagnose.location_stack[self.diagnose.state_stack_top as usize] = curtok;
                self.action_stack[self.diagnose.state_stack_top as usize] =
                    unsafe { (*self.action).size() as i32 };
                act = self.diagnose.t_action(act, current_kind);
                continue;
            } else if act == self.diagnose.error_action {
                if curtok != error_token || self.diagnose.main_configuration_stack.size() > 0 {
                    if let Some(configuration) = self.diagnose.main_configuration_stack.pop() {
                        self.diagnose.state_stack_top = configuration.stack_top;
                        configuration.retrieve_stack(&mut self.diagnose.state_stack);
                        act = configuration.act;
                        curtok = configuration.curtok;
                        unsafe {
                            (*self.action).reset_to(configuration.action_length as usize);
                        }
                        current_kind = self.diagnose.tok_stream.get_kind(curtok);
                        self.diagnose
                            .tok_stream
                            .reset_to(self.diagnose.tok_stream.get_next(curtok));
                        continue;
                    }
                }
                break;
            } else if act > self.diagnose.accept_action && act < self.diagnose.error_action {
                if self.diagnose.main_configuration_stack.find_configuration(
                    &self.diagnose.state_stack,
                    self.diagnose.state_stack_top,
                    curtok,
                ) {
                    act = self.diagnose.error_action;
                } else {
                    self.diagnose.main_configuration_stack.push(
                        &self.diagnose.state_stack,
                        self.diagnose.state_stack_top,
                        act + 1,
                        curtok,
                        unsafe { (*self.action).size() as i32 },
                    );
                    act = self.diagnose.base_action(act);
                }
                continue;
            } else if act < self.diagnose.accept_action {
                unsafe {
                    (*self.action).add(act);
                }
                curtok = self.diagnose.tok_stream.get_token();
                current_kind = self.diagnose.tok_stream.get_kind(curtok);
            } else if act > self.diagnose.error_action {
                unsafe {
                    (*self.action).add(act);
                }
                curtok = self.diagnose.tok_stream.get_token();
                current_kind = self.diagnose.tok_stream.get_kind(curtok);
                act -= self.diagnose.error_action;
                loop {
                    self.diagnose.state_stack_top -= self.diagnose.rhs(act) - 1;
                    act = self.diagnose.nt_action(
                        self.diagnose.state_stack[self.diagnose.state_stack_top as usize],
                        self.diagnose.lhs(act),
                    );
                    if act <= self.diagnose.num_rules {
                        continue;
                    } else {
                        break;
                    }
                }
            } else {
                break;
            }

            self.diagnose.state_stack_top += 1;
            if self.diagnose.state_stack_top as usize >= self.diagnose.state_stack.len() {
                self.reallocate_stacks();
            }
            self.diagnose.state_stack[self.diagnose.state_stack_top as usize] = act;

            if curtok == error_token {
                self.diagnose.scope_trial(
                    &mut self.scope_repair,
                    &mut self.diagnose.state_stack.clone(),
                    self.diagnose.state_stack_top,
                );
                if self.scope_repair.distance >= MIN_DISTANCE {
                    unsafe {
                        (*self.tokens).add(start_token);
                    }
                    let mut token = first_stream_token;
                    while token != error_token {
                        unsafe {
                            (*self.tokens).add(token);
                        }
                        token = self.diagnose.tok_stream.get_next(token);
                    }
                    self.accept_recovery(error_token);
                    break;
                }
            }
            self.diagnose.location_stack[self.diagnose.state_stack_top as usize] = curtok;
            self.action_stack[self.diagnose.state_stack_top as usize] =
                unsafe { (*self.action).size() as i32 };
            act = self.diagnose.t_action(act, current_kind);
        }

        act != self.diagnose.error_action
    }

    pub fn accept_recovery(&mut self, error_token: i32) {
        use crate::collections::IntTuple as RecoveryAction;
        let mut recovery_action = RecoveryAction::with_estimate(8);
        let mut k = 0;
        while k <= self.diagnose.scope_stack_top {
            let scope_index = self.diagnose.scope_index[k as usize];
            let la = self.diagnose.scope_la(scope_index);

            recovery_action.reset();
            let mut act = self.diagnose.t_action(
                self.diagnose.state_stack[self.diagnose.state_stack_top as usize],
                la,
            );
            if act > self.diagnose.accept_action && act < self.diagnose.error_action {
                loop {
                    recovery_action.add(self.diagnose.base_action(act));
                    act += 1;
                    if self.diagnose.base_action(act) != 0 {
                        continue;
                    } else {
                        break;
                    }
                }
            } else {
                recovery_action.add(act);
            }

            let start_action_size = unsafe { (*self.action).size() };
            let mut index = 0;
            while index < recovery_action.size() {
                unsafe {
                    (*self.action).reset_to(start_action_size);
                }
                self.diagnose.tok_stream.reset_to(error_token);
                self.diagnose.temp_stack_top = self.diagnose.state_stack_top - 1;
                let mut max_pos = self.diagnose.state_stack_top;

                act = recovery_action.get(index);
                index += 1;
                while act <= self.diagnose.num_rules {
                    unsafe {
                        (*self.action).add(act);
                    }
                    loop {
                        let lhs_symbol = self.diagnose.lhs(act);
                        self.diagnose.temp_stack_top -= self.diagnose.rhs(act) - 1;
                        if self.diagnose.temp_stack_top > max_pos {
                            act = self.diagnose.temp_stack[self.diagnose.temp_stack_top as usize];
                        } else {
                            act = self.diagnose.state_stack[self.diagnose.temp_stack_top as usize];
                        }
                        act = self.diagnose.nt_action(act, lhs_symbol);
                        if act <= self.diagnose.num_rules {
                            continue;
                        } else {
                            break;
                        }
                    }
                    if (self.diagnose.temp_stack_top + 1) as usize
                        >= self.diagnose.state_stack.len()
                    {
                        self.reallocate_stacks();
                    }
                    if max_pos >= self.diagnose.temp_stack_top {
                        max_pos = self.diagnose.temp_stack_top;
                    }
                    self.diagnose.temp_stack[(self.diagnose.temp_stack_top + 1) as usize] = act;
                    act = self.diagnose.t_action(act, la);
                }

                if act != self.diagnose.error_action {
                    self.diagnose.temp_stack_top += 1;
                    self.diagnose.next_stack_top = self.diagnose.temp_stack_top;
                    let mut i = 0;
                    while i <= max_pos {
                        self.diagnose.next_stack[i as usize] =
                            self.diagnose.state_stack[i as usize];
                        i += 1;
                    }
                    i = max_pos + 1;
                    while i <= self.diagnose.temp_stack_top {
                        self.diagnose.next_stack[i as usize] =
                            self.diagnose.temp_stack[i as usize];
                        i += 1;
                    }
                    if self.complete_scope(self.diagnose.scope_suffix(scope_index)) {
                        let mut i = self.diagnose.scope_suffix(
                            self.diagnose.scope_index[k as usize],
                        );
                        while self.diagnose.scope_rhs(i) != 0 {
                            unsafe {
                                (*self.tokens).add(self.diagnose.tok_stream.make_error_token(
                                    error_token,
                                    self.diagnose
                                        .tok_stream
                                        .get_previous(error_token),
                                    error_token,
                                    self.diagnose.scope_rhs(i),
                                ));
                            }
                            i += 1;
                        }
                        self.report_error(
                            self.diagnose.scope_index[k as usize],
                            self.diagnose.tok_stream.get_previous(error_token),
                        );
                        break;
                    }
                }
            }

            self.diagnose.state_stack_top = self.diagnose.next_stack_top;
            arraycopy(
                &self.diagnose.next_stack,
                0,
                &mut self.diagnose.state_stack,
                0,
                (self.diagnose.state_stack_top + 1) as usize,
            );
            k += 1;
        }
    }

    pub fn complete_scope(&mut self, scope_rhs_index: i32) -> bool {
        let kind = self.diagnose.scope_rhs(scope_rhs_index);
        if kind == 0 {
            return true;
        }

        let mut act = self.diagnose.next_stack[self.diagnose.next_stack_top as usize];

        if kind > self.diagnose.nt_offset {
            let lhs_symbol = kind - self.diagnose.nt_offset;
            if self.diagnose.base_check(act + lhs_symbol) != lhs_symbol {
                return false;
            }
            act = self.diagnose.nt_action(act, lhs_symbol);

            let temp = if act <= self.diagnose.num_rules {
                act + self.diagnose.error_action
            } else {
                act
            };
            unsafe {
                (*self.action).add(temp);
            }
            while act <= self.diagnose.num_rules {
                self.diagnose.next_stack_top -= self.diagnose.rhs(act) - 1;
                act = self.diagnose.nt_action(
                    self.diagnose.next_stack[self.diagnose.next_stack_top as usize],
                    self.diagnose.lhs(act),
                );
            }
            self.diagnose.next_stack_top += 1;
            self.diagnose.next_stack[self.diagnose.next_stack_top as usize] = act;
            return self.complete_scope(scope_rhs_index + 1);
        }

        act = self.diagnose.t_action(act, kind);
        unsafe {
            (*self.action).add(act);
        }
        if act < self.diagnose.accept_action {
            self.diagnose.next_stack_top += 1;
            self.diagnose.next_stack[self.diagnose.next_stack_top as usize] = act;
            return self.complete_scope(scope_rhs_index + 1);
        } else if act > self.diagnose.error_action {
            act -= self.diagnose.error_action;
            loop {
                self.diagnose.next_stack_top -= self.diagnose.rhs(act) - 1;
                act = self.diagnose.nt_action(
                    self.diagnose.next_stack[self.diagnose.next_stack_top as usize],
                    self.diagnose.lhs(act),
                );
                if act <= self.diagnose.num_rules {
                    continue;
                } else {
                    break;
                }
            }
            self.diagnose.next_stack_top += 1;
            self.diagnose.next_stack[self.diagnose.next_stack_top as usize] = act;
            return true;
        } else if act > self.diagnose.accept_action && act < self.diagnose.error_action {
            let save_action_size = unsafe { (*self.action).size() };
            let mut i = act;
            while self.diagnose.base_action(i) != 0 {
                unsafe {
                    (*self.action).reset_to(save_action_size);
                }
                act = self.diagnose.base_action(i);
                i += 1;
                unsafe {
                    (*self.action).add(act);
                }
                if act <= self.diagnose.num_rules {
                } else if act < self.diagnose.accept_action {
                    self.diagnose.next_stack_top += 1;
                    self.diagnose.next_stack[self.diagnose.next_stack_top as usize] = act;
                    if self.complete_scope(scope_rhs_index + 1) {
                        return true;
                    }
                } else if act > self.diagnose.error_action {
                    act -= self.diagnose.error_action;
                    loop {
                        self.diagnose.next_stack_top -= self.diagnose.rhs(act) - 1;
                        act = self.diagnose.nt_action(
                            self.diagnose.next_stack[self.diagnose.next_stack_top as usize],
                            self.diagnose.lhs(act),
                        );
                        if act <= self.diagnose.num_rules {
                            continue;
                        } else {
                            break;
                        }
                    }
                    self.diagnose.next_stack_top += 1;
                    self.diagnose.next_stack[self.diagnose.next_stack_top as usize] = act;
                    return true;
                }
            }
        }
        false
    }
}

fn reallocate_action_stack_hook(action_stack_ptr: *mut Vec<i32>, state_stack_ptr: *mut Vec<i32>) {
    unsafe {
        let stack_len = (*state_stack_ptr).len();
        let action_stack = &mut *action_stack_ptr;
        if action_stack.is_empty() {
            *action_stack = vec![0; stack_len];
        } else {
            let old = action_stack.len();
            let mut new_stack = vec![0; stack_len];
            arraycopy(action_stack, 0, &mut new_stack, 0, old);
            *action_stack = new_stack;
        }
    }
}
