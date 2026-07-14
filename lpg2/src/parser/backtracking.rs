use std::any::Any;

use crate::collections::{IntSegmentedTuple, IntTuple};
use crate::error::{
    BadParseException, BadParseSymFileException, LpgException, NotBacktrackParseTableException,
};
use crate::monitor::Monitor;
use crate::parse_table::ParseTable;
use crate::traits::{IPrsStream, RuleAction};
use crate::utils::arraycopy;

use super::configuration_stack::ConfigurationStack;
use super::recovery::RecoveryParser;
use super::stacks::Stacks;

pub struct BacktrackingParser<TS, PT, RA>
where
    TS: IPrsStream,
    PT: ParseTable + Clone,
    RA: RuleAction,
{
    pub stacks: Stacks,
    pub monitor: Option<Box<dyn Monitor>>,
    pub start_state: i32,
    pub num_rules: i32,
    pub nt_offset: i32,
    pub la_state_offset: i32,
    pub eoft_symbol: i32,
    pub error_symbol: i32,
    pub accept_action: i32,
    pub error_action: i32,
    pub last_token: i32,
    pub current_action: i32,
    pub tok_stream: TS,
    pub prs: PT,
    pub ra: RA,
    pub action: IntSegmentedTuple,
    pub tokens: Option<IntTuple>,
    pub action_stack: Vec<i32>,
    pub skip_tokens: bool,
    pub marker_token_index: i32,
}

impl<TS, PT, RA> BacktrackingParser<TS, PT, RA>
where
    TS: IPrsStream,
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
        if !prs.get_backtrack() {
            return Err(NotBacktrackParseTableException::new("").into());
        }
        Ok(Self {
            stacks: Stacks::new(),
            monitor,
            start_state: prs.get_start_state(),
            num_rules: prs.get_num_rules(),
            nt_offset: prs.get_nt_offset(),
            la_state_offset: prs.get_la_state_offset(),
            eoft_symbol: prs.get_eoft_symbol(),
            error_symbol: prs.get_error_symbol(),
            accept_action: prs.get_accept_action(),
            error_action: prs.get_error_action(),
            last_token: 0,
            current_action: 0,
            tok_stream,
            prs,
            ra,
            action: IntSegmentedTuple::new(10, 1024),
            tokens: None,
            action_stack: Vec::new(),
            skip_tokens: false,
            marker_token_index: 0,
        })
    }

    pub fn get_marker_token(
        &mut self,
        marker_kind: i32,
        start_token_index: i32,
    ) -> Result<i32, LpgException> {
        if marker_kind == 0 {
            Ok(0)
        } else if self.marker_token_index == 0 {
            self.marker_token_index = self.tok_stream.make_error_token(
                self.tok_stream.get_previous(start_token_index),
                self.tok_stream.get_previous(start_token_index),
                self.tok_stream.get_previous(start_token_index),
                marker_kind,
            );
            Ok(self.marker_token_index)
        } else {
            if let Some(token) = self.tok_stream.get_i_token(self.marker_token_index) {
                token.set_kind(marker_kind);
            }
            Ok(self.marker_token_index)
        }
    }

    pub fn get_token(&self, i: i32) -> i32 {
        let tokens = self.tokens.as_ref().expect("tokens not initialized");
        tokens.get(
            self.stacks.location_stack[(self.stacks.state_stack_top + (i - 1)) as usize] as usize,
        )
    }

    pub fn get_sym(&self, i: i32) -> Option<&dyn Any> {
        self.stacks.get_sym(i)
    }

    pub fn set_sym1(&mut self, ast: Option<Box<dyn Any>>) {
        self.stacks.set_sym1(ast);
    }

    pub fn get_current_rule(&self) -> i32 {
        self.current_action
    }

    pub fn get_first_token(&self) -> i32 {
        self.tok_stream.get_first_real_token(self.get_token(1))
    }

    pub fn get_first_token_at(&self, i: i32) -> i32 {
        self.tok_stream.get_first_real_token(self.get_token(i))
    }

    pub fn get_last_token(&self) -> i32 {
        self.tok_stream.get_last_real_token(self.last_token)
    }

    pub fn get_last_token_at(&self, i: i32) -> i32 {
        let l = if i >= self.prs.rhs(self.current_action) {
            self.last_token
        } else {
            let tokens = self.tokens.as_ref().expect("tokens not initialized");
            tokens.get(
                self.stacks.location_stack[(self.stacks.state_stack_top + i) as usize] as usize
                    - 1,
            )
        };
        self.tok_stream.get_last_real_token(l)
    }

    pub fn set_monitor(&mut self, monitor: Option<Box<dyn Monitor>>) {
        self.monitor = monitor;
    }

    pub fn reset1(&mut self) {
        self.action.reset();
        self.skip_tokens = false;
        self.marker_token_index = 0;
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
            if !self.prs.get_backtrack() {
                return Err(NotBacktrackParseTableException::new("").into());
            }
        }
        if tok_stream.is_none() {
            self.reset1();
            return Ok(());
        }
        self.reset2(tok_stream.unwrap(), monitor);
        Ok(())
    }

    pub fn reallocate_other_stacks(&mut self, start_token_index: i32) {
        if self.action_stack.is_empty() {
            let len = self.stacks.state_stack.len();
            self.action_stack = vec![0; len];
            self.stacks.location_stack = vec![0; len];
            self.stacks.parse_stack = (0..len).map(|_| None).collect();
            self.action_stack[0] = 0;
            self.stacks.location_stack[0] = start_token_index;
        } else if self.action_stack.len() < self.stacks.state_stack.len() {
            let old_length = self.action_stack.len();
            let new_len = self.stacks.state_stack.len();
            let mut new_action_stack = vec![0; new_len];
            arraycopy(&self.action_stack, 0, &mut new_action_stack, 0, old_length);
            self.action_stack = new_action_stack;

            let mut new_location = vec![0; new_len];
            arraycopy(
                &self.stacks.location_stack,
                0,
                &mut new_location,
                0,
                old_length,
            );
            self.stacks.location_stack = new_location;

            let mut new_parse: Vec<Option<Box<dyn std::any::Any>>> =
                (0..new_len).map(|_| None).collect();
            crate::utils::object_arraycopy(
                &mut self.stacks.parse_stack,
                0,
                &mut new_parse,
                0,
                old_length,
            );
            self.stacks.parse_stack = new_parse;
        }
    }

    pub fn fuzzy_parse(&mut self) -> Result<Option<Box<dyn Any>>, LpgException> {
        self.fuzzy_parse_entry(0, i32::MAX)
    }

    pub fn fuzzy_parse_with_error_count(
        &mut self,
        max_error_count: i32,
    ) -> Result<Option<Box<dyn Any>>, LpgException> {
        self.fuzzy_parse_entry(0, max_error_count)
    }

    pub fn fuzzy_parse_entry(
        &mut self,
        marker_kind: i32,
        max_error_count: i32,
    ) -> Result<Option<Box<dyn Any>>, LpgException> {
        self.action.reset();
        self.tok_stream.reset();
        self.stacks.reallocate_state_stack();
        self.stacks.state_stack_top = 0;
        self.stacks.state_stack[0] = self.start_state;

        let first_token = self.tok_stream.peek();
        let mut start_token = first_token;
        let marker_token = self.get_marker_token(marker_kind, first_token)?;

        self.tokens = Some(IntTuple::with_estimate(
            self.tok_stream.get_stream_length() as usize,
        ));
        self.tokens
            .as_mut()
            .unwrap()
            .add(self.tok_stream.get_previous(first_token));

        let error_token = self.backtrack_parse_internal(marker_token);

        if error_token != 0 {
            let parser_ptr = self as *mut Self;
            let action_ptr = &mut self.action as *mut IntSegmentedTuple;
            let tokens_ptr = self.tokens.as_mut().unwrap() as *mut IntTuple;
            let stream_ptr = &mut self.tok_stream as *mut TS;
            let prs = self.prs.clone();
            let monitor = self.monitor.take();
            let mut rp = RecoveryParser::new(
                parser_ptr,
                action_ptr,
                tokens_ptr,
                stream_ptr,
                prs,
                max_error_count,
                0,
                monitor,
            );
            start_token = rp.recover(marker_token, error_token)?;
            self.monitor = rp.take_monitor();
        }

        if marker_token != 0 && start_token == first_token {
            self.tokens.as_mut().unwrap().add(marker_token);
        }
        let mut t = start_token;
        while self.tok_stream.get_kind(t) != self.eoft_symbol {
            self.tokens.as_mut().unwrap().add(t);
            t = self.tok_stream.get_next(t);
        }
        self.tokens.as_mut().unwrap().add(t);
        self.parse_actions(marker_kind)
    }

    pub fn parse(&mut self, max_error_count: i32) -> Result<Option<Box<dyn Any>>, LpgException> {
        self.parse_entry(0, max_error_count)
    }

    pub fn parse_entry(
        &mut self,
        marker_kind: i32,
        max_error_count: i32,
    ) -> Result<Option<Box<dyn Any>>, LpgException> {
        self.action.reset();
        self.tok_stream.reset();
        self.stacks.reallocate_state_stack();
        self.stacks.state_stack_top = 0;
        self.stacks.state_stack[0] = self.start_state;

        self.skip_tokens = max_error_count < 0;
        let mut max_error_count = max_error_count;
        if max_error_count > 0 {
            max_error_count = 0;
        }

        self.tokens = Some(IntTuple::with_estimate(
            self.tok_stream.get_stream_length() as usize,
        ));
        self.tokens
            .as_mut()
            .unwrap()
            .add(self.tok_stream.get_previous(self.tok_stream.peek()));

        let mut start_token_index = self.tok_stream.peek();
        let mut repair_token = self.get_marker_token(marker_kind, start_token_index)?;
        let mut start_action_index = self.action.size();
        let mut temp_stack = vec![0; (self.stacks.state_stack_top + 1) as usize];
        let temp_len = temp_stack.len();
        arraycopy(
            &self.stacks.state_stack,
            0,
            &mut temp_stack,
            0,
            temp_len,
        );

        let initial_error_token = self.backtrack_parse_internal(repair_token);
        let mut error_token = initial_error_token;
        let mut count = 0;

        while error_token != 0 {
            if count == max_error_count {
                return Err(BadParseException::new(initial_error_token).into());
            }
            self.action.reset_to(start_action_index);
            self.tok_stream.reset_to(start_token_index);
            self.stacks.state_stack_top = temp_stack.len() as i32 - 1;
            let stack_len = temp_stack.len();
            arraycopy(&temp_stack, 0, &mut self.stacks.state_stack, 0, stack_len);
            self.reallocate_other_stacks(start_token_index);

            self.backtrack_parse_up_to_error(repair_token, error_token);

            self.stacks.state_stack_top =
                self.find_recovery_state_index(self.stacks.state_stack_top);
            while self.stacks.state_stack_top >= 0 {
                let tokens = self.tokens.as_ref().unwrap();
                let recovery_token = tokens.get(
                    (self.stacks.location_stack[self.stacks.state_stack_top as usize] - 1)
                        as usize,
                );
                let temp = if recovery_token >= start_token_index {
                    recovery_token
                } else {
                    error_token
                };
                repair_token = self.error_repair(temp, error_token);
                if repair_token != 0 {
                    break;
                }
                self.stacks.state_stack_top =
                    self.find_recovery_state_index(self.stacks.state_stack_top - 1);
            }
            if self.stacks.state_stack_top < 0 {
                return Err(BadParseException::new(initial_error_token).into());
            }
            temp_stack = vec![0; (self.stacks.state_stack_top + 1) as usize];
            let temp_len = temp_stack.len();
            arraycopy(
                &self.stacks.state_stack,
                0,
                &mut temp_stack,
                0,
                temp_len,
            );

            start_action_index = self.action.size();
            start_token_index = self.tok_stream.peek();

            error_token = self.backtrack_parse_internal(repair_token);
            count += 1;
        }

        if repair_token != 0 {
            self.tokens.as_mut().unwrap().add(repair_token);
        }
        let mut t = start_token_index;
        while self.tok_stream.get_kind(t) != self.eoft_symbol {
            self.tokens.as_mut().unwrap().add(t);
            t = self.tok_stream.get_next(t);
        }
        self.tokens.as_mut().unwrap().add(t);
        self.parse_actions(marker_kind)
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

    fn token_at(&self, index: i32) -> i32 {
        self.tokens
            .as_ref()
            .expect("tokens not initialized")
            .get(index as usize)
    }

    pub fn parse_actions(
        &mut self,
        marker_kind: i32,
    ) -> Result<Option<Box<dyn Any>>, LpgException> {
        let mut ti: i32 = 0;
        self.last_token = self.token_at(ti);
        ti += 1;
        let mut curtok = self.token_at(ti);
        self.stacks.allocate_other_stacks();

        self.stacks.state_stack_top = -1;
        self.current_action = self.start_state;
        let action_size = self.action.size();
        let mut i = 0;
        while i < action_size {
            if let Some(ref monitor) = self.monitor {
                if monitor.is_cancelled() {
                    return Ok(None);
                }
            }
            self.stacks.state_stack_top += 1;
            self.stacks.state_stack[self.stacks.state_stack_top as usize] = self.current_action;
            self.stacks.location_stack[self.stacks.state_stack_top as usize] = ti;

            self.current_action = self.action.get(i);
            i += 1;
            if self.current_action <= self.num_rules {
                self.stacks.state_stack_top -= 1;
                self.process_reductions();
            } else {
                if self.tok_stream.get_kind(curtok) > self.nt_offset {
                    if let Some(token) = self.tok_stream.get_i_token(curtok) {
                        if let Some(badtok) = token.as_error_token() {
                            if let Some(et) = badtok.get_error_token() {
                                return Err(BadParseException::new(et.get_token_index()).into());
                            }
                        }
                    }
                    return Err(BadParseException::new(curtok).into());
                }
                self.last_token = curtok;
                ti += 1;
                curtok = self.token_at(ti);
                if self.current_action > self.error_action {
                    self.current_action -= self.error_action;
                    self.process_reductions();
                }
            }
        }

        if marker_kind == 0 {
            Ok(self.stacks.parse_stack[0].take())
        } else {
            Ok(self.stacks.parse_stack[1].take())
        }
    }

    pub fn process_backtrack_reductions(&mut self, act: i32) -> i32 {
        let mut act = act;
        loop {
            self.stacks.state_stack_top -= self.prs.rhs(act) - 1;
            act = self.prs.nt_action(
                self.stacks.state_stack[self.stacks.state_stack_top as usize],
                self.prs.lhs(act),
            );
            if act <= self.num_rules {
                continue;
            } else {
                break;
            }
        }
        act
    }

    pub fn backtrack_parse(
        &mut self,
        stack: &[i32],
        stack_top: i32,
        action: &mut IntSegmentedTuple,
        initial_token: i32,
    ) -> i32 {
        self.stacks.state_stack_top = stack_top;
        arraycopy(stack, 0, &mut self.stacks.state_stack, 0, (stack_top + 1) as usize);
        std::mem::swap(&mut self.action, action);
        let result = self.backtrack_parse_internal(initial_token);
        std::mem::swap(&mut self.action, action);
        result
    }

    fn backtrack_parse_internal(&mut self, initial_token: i32) -> i32 {
        let mut configuration_stack = ConfigurationStack::new(self.prs.clone());
        let mut error_token = 0;
        let start_token = self.tok_stream.peek();

        let (mut curtok, mut current_kind, mut act) = if initial_token > 0 {
            let curtok = initial_token;
            (
                curtok,
                self.tok_stream.get_kind(curtok),
                self.t_action(
                    self.stacks.state_stack[self.stacks.state_stack_top as usize],
                    self.tok_stream.get_kind(curtok),
                ),
            )
        } else {
            let curtok = self.tok_stream.get_token();
            (
                curtok,
                self.tok_stream.get_kind(curtok),
                self.t_action(
                    self.stacks.state_stack[self.stacks.state_stack_top as usize],
                    self.tok_stream.get_kind(curtok),
                ),
            )
        };

        loop {
            if let Some(ref monitor) = self.monitor {
                if monitor.is_cancelled() {
                    return 0;
                }
            }
            if act <= self.num_rules {
                self.action.add(act);
                self.stacks.state_stack_top -= 1;
                act = self.process_backtrack_reductions(act);
            } else if act > self.error_action {
                self.action.add(act);
                curtok = self.tok_stream.get_token();
                current_kind = self.tok_stream.get_kind(curtok);
                act = self.process_backtrack_reductions(act - self.error_action);
            } else if act < self.accept_action {
                self.action.add(act);
                curtok = self.tok_stream.get_token();
                current_kind = self.tok_stream.get_kind(curtok);
            } else if act == self.error_action {
                if error_token <= curtok {
                    error_token = curtok;
                }
                if let Some(configuration) = configuration_stack.pop() {
                    self.action
                        .reset_to(configuration.action_length as usize);
                    act = configuration.act;
                    curtok = configuration.curtok;
                    current_kind = self.tok_stream.get_kind(curtok);
                    let index = if curtok == initial_token {
                        start_token
                    } else {
                        self.tok_stream.get_next(curtok)
                    };
                    self.tok_stream.reset_to(index);
                    self.stacks.state_stack_top = configuration.stack_top;
                    configuration.retrieve_stack(&mut self.stacks.state_stack);
                    continue;
                } else {
                    act = self.error_action;
                    break;
                }
            } else if act > self.accept_action {
                if configuration_stack.find_configuration(
                    &self.stacks.state_stack,
                    self.stacks.state_stack_top,
                    curtok,
                ) {
                    act = self.error_action;
                } else {
                    configuration_stack.push(
                        &self.stacks.state_stack,
                        self.stacks.state_stack_top,
                        act + 1,
                        curtok,
                        self.action.size() as i32,
                    );
                    act = self.prs.base_action(act);
                }
                continue;
            } else {
                break;
            }

            self.stacks.state_stack_top += 1;
            if self.stacks.state_stack_top as usize >= self.stacks.state_stack.len() {
                self.stacks.reallocate_state_stack();
            }
            self.stacks.state_stack[self.stacks.state_stack_top as usize] = act;
            act = self.t_action(act, current_kind);
        }

        if act == self.error_action {
            error_token
        } else {
            0
        }
    }

    pub fn backtrack_parse_up_to_error(&mut self, initial_token: i32, error_token: i32) {
        let mut configuration_stack = ConfigurationStack::new(self.prs.clone());
        let start_token = self.tok_stream.peek();
        let (mut curtok, mut current_kind, mut act) = if initial_token > 0 {
            let curtok = initial_token;
            (
                curtok,
                self.tok_stream.get_kind(curtok),
                self.t_action(
                    self.stacks.state_stack[self.stacks.state_stack_top as usize],
                    self.tok_stream.get_kind(curtok),
                ),
            )
        } else {
            let curtok = self.tok_stream.get_token();
            (
                curtok,
                self.tok_stream.get_kind(curtok),
                self.t_action(
                    self.stacks.state_stack[self.stacks.state_stack_top as usize],
                    self.tok_stream.get_kind(curtok),
                ),
            )
        };

        let tokens_ptr = self.tokens.as_mut().unwrap() as *mut IntTuple;
        unsafe {
            (*tokens_ptr).add(curtok);
        }
        self.stacks.location_stack[self.stacks.state_stack_top as usize] =
            unsafe { (*tokens_ptr).size() as i32 };
        self.action_stack[self.stacks.state_stack_top as usize] = self.action.size() as i32;

        loop {
            if let Some(ref monitor) = self.monitor {
                if monitor.is_cancelled() {
                    return;
                }
            }

            if act <= self.num_rules {
                self.action.add(act);
                self.stacks.state_stack_top -= 1;
                act = self.process_backtrack_reductions(act);
            } else if act > self.error_action {
                self.action.add(act);
                curtok = self.tok_stream.get_token();
                current_kind = self.tok_stream.get_kind(curtok);
                unsafe {
                    (*tokens_ptr).add(curtok);
                }
                act = self.process_backtrack_reductions(act - self.error_action);
            } else if act < self.accept_action {
                self.action.add(act);
                curtok = self.tok_stream.get_token();
                current_kind = self.tok_stream.get_kind(curtok);
                unsafe {
                    (*tokens_ptr).add(curtok);
                }
            } else if act == self.error_action {
                if curtok != error_token {
                    if let Some(configuration) = configuration_stack.pop() {
                        self.action
                            .reset_to(configuration.action_length as usize);
                        act = configuration.act;
                        let next_token_index = configuration.curtok;
                        unsafe {
                            (*tokens_ptr).reset_to(next_token_index as usize);
                            curtok = (*tokens_ptr).get((next_token_index - 1) as usize);
                        }
                        current_kind = self.tok_stream.get_kind(curtok);
                        let index = if curtok == initial_token {
                            start_token
                        } else {
                            self.tok_stream.get_next(curtok)
                        };
                        self.tok_stream.reset_to(index);
                        self.stacks.state_stack_top = configuration.stack_top;
                        configuration.retrieve_stack(&mut self.stacks.state_stack);
                        self.stacks.location_stack[self.stacks.state_stack_top as usize] =
                            unsafe { (*tokens_ptr).size() as i32 };
                        self.action_stack[self.stacks.state_stack_top as usize] =
                            self.action.size() as i32;
                        continue;
                    }
                }
                break;
            } else if act > self.accept_action {
                let token_pos = unsafe { (*tokens_ptr).size() as i32 };
                if configuration_stack.find_configuration(
                    &self.stacks.state_stack,
                    self.stacks.state_stack_top,
                    token_pos,
                ) {
                    act = self.error_action;
                } else {
                    configuration_stack.push(
                        &self.stacks.state_stack,
                        self.stacks.state_stack_top,
                        act + 1,
                        token_pos,
                        self.action.size() as i32,
                    );
                    act = self.prs.base_action(act);
                }
                continue;
            } else {
                break;
            }

            self.stacks.state_stack_top += 1;
            self.stacks.state_stack[self.stacks.state_stack_top as usize] = act;
            self.stacks.location_stack[self.stacks.state_stack_top as usize] =
                unsafe { (*tokens_ptr).size() as i32 };
            self.action_stack[self.stacks.state_stack_top as usize] = self.action.size() as i32;
            act = self.t_action(act, current_kind);
        }
    }

    pub fn repairable(&mut self, error_token: i32) -> bool {
        let mut configuration_stack = ConfigurationStack::new(self.prs.clone());
        let start_token = self.tok_stream.peek();
        let mut final_token = self.tok_stream.get_stream_length();
        let mut curtok = 0;
        let mut current_kind = self.error_symbol;
        let mut act = self.t_action(
            self.stacks.state_stack[self.stacks.state_stack_top as usize],
            current_kind,
        );

        loop {
            if act <= self.num_rules {
                self.stacks.state_stack_top -= 1;
                act = self.process_backtrack_reductions(act);
            } else if act > self.error_action {
                curtok = self.tok_stream.get_token();
                if curtok > final_token {
                    return true;
                }
                current_kind = self.tok_stream.get_kind(curtok);
                act = self.process_backtrack_reductions(act - self.error_action);
            } else if act < self.accept_action {
                curtok = self.tok_stream.get_token();
                if curtok > final_token {
                    return true;
                }
                current_kind = self.tok_stream.get_kind(curtok);
            } else if act == self.error_action {
                if let Some(configuration) = configuration_stack.pop() {
                    self.stacks.state_stack_top = configuration.stack_top;
                    configuration.retrieve_stack(&mut self.stacks.state_stack);
                    act = configuration.act;
                    curtok = configuration.curtok;
                    if curtok == 0 {
                        current_kind = self.error_symbol;
                        self.tok_stream.reset_to(start_token);
                    } else {
                        current_kind = self.tok_stream.get_kind(curtok);
                        self.tok_stream.reset_to(self.tok_stream.get_next(curtok));
                    }
                    continue;
                } else {
                    act = self.error_action;
                    break;
                }
            } else if act > self.accept_action {
                if configuration_stack.find_configuration(
                    &self.stacks.state_stack,
                    self.stacks.state_stack_top,
                    curtok,
                ) {
                    act = self.error_action;
                } else {
                    configuration_stack.push(
                        &self.stacks.state_stack,
                        self.stacks.state_stack_top,
                        act + 1,
                        curtok,
                        0,
                    );
                    act = self.prs.base_action(act);
                }
                continue;
            } else {
                break;
            }

            if curtok > error_token
                && final_token == self.tok_stream.get_stream_length()
                && self.recoverable_state(act)
            {
                if self.skip_tokens {
                    final_token = curtok;
                } else {
                    final_token = self.tok_stream.get_next(curtok);
                }
            }

            self.stacks.state_stack_top += 1;
            if self.stacks.state_stack_top as usize >= self.stacks.state_stack.len() {
                self.stacks.reallocate_state_stack();
            }
            self.stacks.state_stack[self.stacks.state_stack_top as usize] = act;
            act = self.t_action(act, current_kind);
        }

        act == self.accept_action
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

    pub fn find_recovery_state_index(&self, start_index: i32) -> i32 {
        let mut i = start_index;
        while i >= 0 {
            if self.recoverable_state(self.stacks.state_stack[i as usize]) {
                break;
            }
            i -= 1;
        }
        if i >= 0 {
            let mut k = i - 1;
            while k >= 0 {
                if self.stacks.location_stack[k as usize]
                    != self.stacks.location_stack[i as usize]
                {
                    break;
                }
                k -= 1;
            }
            i = k + 1;
        }
        i
    }

    pub fn error_repair(&mut self, recovery_token: i32, error_token: i32) -> i32 {
        let mut temp_stack = vec![0; (self.stacks.state_stack_top + 1) as usize];
        let temp_len = temp_stack.len();
        arraycopy(
            &self.stacks.state_stack,
            0,
            &mut temp_stack,
            0,
            temp_len,
        );
        let mut recovery_token = recovery_token;
        while self.tok_stream.get_kind(recovery_token) != self.eoft_symbol {
            self.tok_stream.reset_to(recovery_token);
            if self.repairable(error_token) {
                break;
            }
            self.stacks.state_stack_top = temp_stack.len() as i32 - 1;
            let stack_len = temp_stack.len();
            arraycopy(&temp_stack, 0, &mut self.stacks.state_stack, 0, stack_len);
            recovery_token = self.tok_stream.get_next(recovery_token);
        }

        if self.tok_stream.get_kind(recovery_token) == self.eoft_symbol {
            self.tok_stream.reset_to(recovery_token);
            if !self.repairable(error_token) {
                self.stacks.state_stack_top = temp_stack.len() as i32 - 1;
                let stack_len = temp_stack.len();
            arraycopy(&temp_stack, 0, &mut self.stacks.state_stack, 0, stack_len);
                return 0;
            }
        }

        self.stacks.state_stack_top = temp_stack.len() as i32 - 1;
        let stack_len = temp_stack.len();
        arraycopy(&temp_stack, 0, &mut self.stacks.state_stack, 0, stack_len);
        self.tok_stream.reset_to(recovery_token);
        let tokens = self.tokens.as_mut().unwrap();
        tokens.reset_to(
            (self.stacks.location_stack[self.stacks.state_stack_top as usize] - 1) as usize,
        );
        self.action.reset_to(
            self.action_stack[self.stacks.state_stack_top as usize] as usize,
        );

        self.tok_stream.make_error_token(
            tokens.get(
                (self.stacks.location_stack[self.stacks.state_stack_top as usize] - 1) as usize,
            ),
            self.tok_stream.get_previous(recovery_token),
            error_token,
            self.error_symbol,
        )
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
}

/// Host trait for recovery parser backtrack callback.
pub trait BacktrackHost {
    fn backtrack_parse_host(
        &mut self,
        stack: &[i32],
        stack_top: i32,
        action: &mut IntSegmentedTuple,
        initial_token: i32,
    ) -> i32;
}

impl<TS, PT, RA> BacktrackHost for BacktrackingParser<TS, PT, RA>
where
    TS: IPrsStream,
    PT: ParseTable + Clone,
    RA: RuleAction,
{
    fn backtrack_parse_host(
        &mut self,
        stack: &[i32],
        stack_top: i32,
        action: &mut IntSegmentedTuple,
        initial_token: i32,
    ) -> i32 {
        self.backtrack_parse(stack, stack_top, action, initial_token)
    }
}
