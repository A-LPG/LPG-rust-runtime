use crate::collections::IntTuple;
use crate::error::UnavailableParserInformationException;
use crate::monitor::Monitor;
use crate::parse_table::ParseTable;
use crate::traits::{ILexStream, RuleAction};

pub struct LexParser<TS, PT, RA>
where
    TS: ILexStream,
    PT: ParseTable + Clone,
    RA: RuleAction,
{
    pub taking_actions: bool,
    pub stack_increment: i32,
    pub start_state: i32,
    pub la_state_offset: i32,
    pub eoft_symbol: i32,
    pub accept_action: i32,
    pub error_action: i32,
    pub start_symbol: i32,
    pub num_rules: i32,
    pub tok_stream: Option<TS>,
    pub prs: Option<PT>,
    pub ra: Option<RA>,
    pub action: Option<IntTuple>,
    pub state_stack_top: i32,
    pub stack_length: i32,
    pub stack: Vec<i32>,
    pub location_stack: Vec<i32>,
    pub temp_stack: Vec<i32>,
    pub last_token: i32,
    pub current_action: i32,
    pub curtok: i32,
    pub starttok: i32,
    pub current_kind: i32,
}

impl<TS, PT, RA> Default for LexParser<TS, PT, RA>
where
    TS: ILexStream,
    PT: ParseTable + Clone,
    RA: RuleAction,
{
    fn default() -> Self {
        Self::new()
    }
}

impl<TS, PT, RA> LexParser<TS, PT, RA>
where
    TS: ILexStream,
    PT: ParseTable + Clone,
    RA: RuleAction,
{
    pub fn new() -> Self {
        Self::new_and_init(None, None, None)
    }

    pub fn new_and_init(
        tok_stream: Option<TS>,
        prs: Option<PT>,
        ra: Option<RA>,
    ) -> Self {
        let mut my = Self {
            taking_actions: false,
            stack_increment: 1024,
            start_state: 0,
            la_state_offset: 0,
            eoft_symbol: 0,
            accept_action: 0,
            error_action: 0,
            start_symbol: 0,
            num_rules: 0,
            tok_stream: None,
            prs: None,
            ra: None,
            action: None,
            state_stack_top: 0,
            stack_length: 0,
            stack: Vec::new(),
            location_stack: Vec::new(),
            temp_stack: Vec::new(),
            last_token: 0,
            current_action: 0,
            curtok: 0,
            starttok: 0,
            current_kind: 0,
        };
        if let (Some(ts), Some(prs), Some(ra)) = (tok_stream, prs, ra) {
            my.reset(ts, prs, ra);
        }
        my
    }

    pub fn reset(&mut self, tok_stream: TS, prs: PT, ra: RA) {
        self.tok_stream = Some(tok_stream);
        self.prs = Some(prs);
        self.ra = Some(ra);
        let prs = self.prs.as_ref().unwrap();
        self.start_state = prs.get_start_state();
        self.la_state_offset = prs.get_la_state_offset();
        self.eoft_symbol = prs.get_eoft_symbol();
        self.accept_action = prs.get_accept_action();
        self.error_action = prs.get_error_action();
        self.start_symbol = prs.get_start_symbol();
        self.num_rules = prs.get_num_rules();
    }

    fn tok_mut(&mut self) -> &mut TS {
        self.tok_stream.as_mut().expect("lex parser not initialized")
    }

    fn tok_ref(&self) -> &TS {
        self.tok_stream.as_ref().expect("lex parser not initialized")
    }

    fn prs(&self) -> &PT {
        self.prs.as_ref().expect("lex parser not initialized")
    }

    fn ra(&mut self) -> &mut RA {
        self.ra.as_mut().expect("lex parser not initialized")
    }

    pub fn reallocate_stacks(&mut self) {
        let old_stack_length = if self.stack.is_empty() {
            0
        } else {
            self.stack_length
        };
        self.stack_length += self.stack_increment;
        if old_stack_length == 0 {
            self.stack = vec![0; self.stack_length as usize];
            self.location_stack = vec![0; self.stack_length as usize];
            self.temp_stack = vec![0; self.stack_length as usize];
        } else {
            let mut new_stack = vec![0; self.stack_length as usize];
            crate::utils::arraycopy(&self.stack, 0, &mut new_stack, 0, old_stack_length as usize);
            self.stack = new_stack;

            let mut new_location = vec![0; self.stack_length as usize];
            crate::utils::arraycopy(
                &self.location_stack,
                0,
                &mut new_location,
                0,
                old_stack_length as usize,
            );
            self.location_stack = new_location;

            let mut new_temp = vec![0; self.stack_length as usize];
            crate::utils::arraycopy(
                &self.temp_stack,
                0,
                &mut new_temp,
                0,
                old_stack_length as usize,
            );
            self.temp_stack = new_temp;
        }
    }

    pub fn get_first_token_at(&self, i: i32) -> i32 {
        self.get_token(i)
    }

    pub fn get_first_token(&self) -> i32 {
        self.starttok
    }

    pub fn get_last_token(&self) -> i32 {
        self.last_token
    }

    pub fn get_last_token_at(&self, i: i32) -> i32 {
        if self.taking_actions {
            if i >= self.prs().rhs(self.current_action) {
                self.last_token
            } else {
                self.tok_ref()
                    .get_previous(self.get_token(i + 1))
            }
        } else {
            -1
        }
    }

    pub fn get_current_rule(&self) -> Result<i32, UnavailableParserInformationException> {
        if self.taking_actions {
            Ok(self.current_action)
        } else {
            Err(UnavailableParserInformationException::new(""))
        }
    }

    pub fn get_token(&self, i: i32) -> i32 {
        if self.taking_actions {
            self.location_stack[(self.state_stack_top + (i - 1)) as usize]
        } else {
            -1
        }
    }

    pub fn set_sym1(&mut self, _i: i32) {}

    pub fn get_sym(&self, i: i32) -> i32 {
        self.get_last_token_at(i)
    }

    pub fn reset_token_stream(&mut self, i: i32) {
        let temp = if i > self.tok_mut().get_stream_length() {
            self.tok_mut().get_stream_length()
        } else {
            i
        };
        self.tok_mut().reset_to(temp);
        self.curtok = self.tok_mut().get_token();
        self.current_kind = self.tok_ref().get_kind(self.curtok);
        if self.stack.is_empty() {
            self.reallocate_stacks();
        }
        if self.action.is_none() {
            self.action = Some(IntTuple::with_estimate(1 << 10));
        }
    }

    pub fn parse_characters(&mut self, start_offset: i32, end_offset: i32, monitor: Option<&dyn Monitor>) {
        self.reset_token_stream(start_offset);
        while self.curtok <= end_offset {
            if let Some(m) = monitor {
                if m.is_cancelled() {
                    return;
                }
            }
            self.lex_next_token(end_offset);
        }
    }

    pub fn parse_characters_with_monitor(&mut self, monitor: Option<&dyn Monitor>) {
        self.taking_actions = true;
        self.reset_token_stream(0);
        self.last_token = self.tok_ref().get_previous(self.curtok);

        while self.current_kind != self.eoft_symbol {
            if let Some(m) = monitor {
                if m.is_cancelled() {
                    break;
                }
            }

            self.state_stack_top = -1;
            self.current_action = self.start_state;
            self.starttok = self.curtok;

            loop {
                self.state_stack_top += 1;
                if self.state_stack_top as usize >= self.stack.len() {
                    self.reallocate_stacks();
                }
                self.stack[self.state_stack_top as usize] = self.current_action;
                self.location_stack[self.state_stack_top as usize] = self.curtok;

                self.parse_next_character(self.curtok, self.current_kind);
                if self.current_action == self.error_action && self.current_kind != self.eoft_symbol {
                    let save_next_token = self.tok_ref().peek();
                    let eof_pos = self.tok_ref().get_stream_length() - 1;
                    self.tok_mut().reset_to(eof_pos);
                    self.parse_next_character(self.curtok, self.eoft_symbol);
                    self.tok_mut().reset_to(save_next_token);
                }

                if self.current_action > self.error_action {
                    self.last_token = self.curtok;
                    self.curtok = self.tok_mut().get_token();
                    self.current_kind = self.tok_ref().get_kind(self.curtok);
                    self.current_action -= self.error_action;
                    loop {
                        self.state_stack_top -= self.prs().rhs(self.current_action) - 1;
                        let rule = self.current_action;
                        self.ra().rule_action(rule);
                        let lhs_symbol = self.prs().lhs(self.current_action);
                        if lhs_symbol == self.start_symbol {
                            break;
                        }
                        self.current_action =
                            self.prs().nt_action(self.stack[self.state_stack_top as usize], lhs_symbol);
                        if self.current_action <= self.num_rules {
                            continue;
                        } else {
                            break;
                        }
                    }
                    if self.prs().lhs(self.current_action) == self.start_symbol
                        || self.current_action == self.accept_action
                    {
                        break;
                    }
                } else if self.current_action < self.accept_action {
                    self.last_token = self.curtok;
                    self.curtok = self.tok_mut().get_token();
                    self.current_kind = self.tok_ref().get_kind(self.curtok);
                } else {
                    break;
                }
            }

            if self.starttok == self.curtok {
                if self.current_kind == self.eoft_symbol {
                    break;
                }
                let starttok = self.starttok;
                let curtok = self.curtok;
                self.tok_mut()
                    .report_lexical_error_position(starttok, curtok);
                self.last_token = self.curtok;
                self.curtok = self.tok_mut().get_token();
                self.current_kind = self.tok_ref().get_kind(self.curtok);
            } else {
                let starttok = self.starttok;
                let last_token = self.last_token;
                self.tok_mut()
                    .report_lexical_error_position(starttok, last_token);
            }
        }

        self.taking_actions = false;
    }

    pub fn parse_next_character(&mut self, token: i32, kind: i32) {
        let start_action = self.stack[self.state_stack_top as usize];
        let mut pos = self.state_stack_top;
        let mut temp_stack_top = self.state_stack_top - 1;

        'scan: {
            self.current_action = self.t_action(start_action, kind);
            while self.current_action <= self.num_rules {
                loop {
                    let lhs_symbol = self.prs().lhs(self.current_action);
                    if lhs_symbol == self.start_symbol {
                        break 'scan;
                    }
                    temp_stack_top -= self.prs().rhs(self.current_action) - 1;
                    let state = if temp_stack_top > pos {
                        self.temp_stack[temp_stack_top as usize]
                    } else {
                        self.stack[temp_stack_top as usize]
                    };
                    self.current_action = self.prs().nt_action(state, lhs_symbol);
                    if self.current_action <= self.num_rules {
                        continue;
                    } else {
                        break;
                    }
                }
                if (temp_stack_top + 1) as usize >= self.stack.len() {
                    self.reallocate_stacks();
                }
                if pos >= temp_stack_top {
                    pos = temp_stack_top;
                }
                self.temp_stack[(temp_stack_top + 1) as usize] = self.current_action;
                self.current_action = self.t_action(self.current_action, kind);
            }
        }

        if self.current_action != self.error_action {
            'replay: {
                self.current_action = self.t_action(start_action, kind);
                while self.current_action <= self.num_rules {
                    self.state_stack_top -= 1;
                    loop {
                        self.state_stack_top -= self.prs().rhs(self.current_action) - 1;
                        let rule = self.current_action;
                        self.ra().rule_action(rule);
                        let lhs_symbol = self.prs().lhs(self.current_action);
                        if lhs_symbol == self.start_symbol {
                            if self.starttok == token {
                                self.current_action = self.error_action;
                            } else {
                                self.current_action = self.accept_action;
                            }
                            break 'replay;
                        }
                        self.current_action = self.prs().nt_action(
                            self.stack[self.state_stack_top as usize],
                            lhs_symbol,
                        );
                        if self.current_action <= self.num_rules {
                            continue;
                        } else {
                            break;
                        }
                    }
                    self.state_stack_top += 1;
                    if self.state_stack_top as usize >= self.stack.len() {
                        self.reallocate_stacks();
                    }
                    self.stack[self.state_stack_top as usize] = self.current_action;
                    self.location_stack[self.state_stack_top as usize] = token;
                    self.current_action = self.t_action(self.current_action, kind);
                }
            }
        }
    }

    pub fn lookahead(&mut self, act: i32, token: i32) -> i32 {
        let act = self
            .prs()
            .look_ahead(act - self.la_state_offset, self.tok_ref().get_kind(token));
        if act > self.la_state_offset {
            self.lookahead(act, self.tok_ref().get_next(token))
        } else {
            act
        }
    }

    pub fn t_action(&mut self, act: i32, sym: i32) -> i32 {
        let act = self.prs().t_action(act, sym);
        if act > self.la_state_offset {
            self.lookahead(act, self.tok_ref().peek())
        } else {
            act
        }
    }

    pub fn scan_next_token(&mut self) -> bool {
        self.lex_next_token(self.tok_ref().get_stream_length())
    }

    pub fn scan_next_token_from_start_offset(&mut self, start_offset: i32) -> bool {
        self.reset_token_stream(start_offset);
        self.lex_next_token(self.tok_ref().get_stream_length())
    }

    pub fn lex_next_token(&mut self, end_offset: i32) -> bool {
        self.taking_actions = false;
        self.state_stack_top = -1;
        self.current_action = self.start_state;
        self.starttok = self.curtok;
        if let Some(ref mut action) = self.action {
            action.reset();
        }

        loop {
            self.state_stack_top += 1;
            if self.state_stack_top as usize >= self.stack.len() {
                self.reallocate_stacks();
            }
            self.stack[self.state_stack_top as usize] = self.current_action;

            self.current_action = self.lex_next_character(self.current_action, self.current_kind);
            if self.current_action == self.error_action && self.current_kind != self.eoft_symbol {
                let save_next_token = self.tok_ref().peek();
                let eof_pos = self.tok_ref().get_stream_length() - 1;
                self.tok_mut().reset_to(eof_pos);
                self.current_action =
                    self.lex_next_character(self.stack[self.state_stack_top as usize], self.eoft_symbol);
                self.tok_mut().reset_to(save_next_token);
            }

            if let Some(ref mut action) = self.action {
                action.add(self.current_action);
            }

            if self.current_action > self.error_action {
                self.curtok = self.tok_mut().get_token();
                if self.curtok > end_offset {
                    self.curtok = self.tok_ref().get_stream_length();
                }
                self.current_kind = self.tok_ref().get_kind(self.curtok);
                self.current_action -= self.error_action;
                loop {
                    let lhs_symbol = self.prs().lhs(self.current_action);
                    if lhs_symbol == self.start_symbol {
                        self.parse_actions();
                        return true;
                    }
                    self.state_stack_top -= self.prs().rhs(self.current_action) - 1;
                    self.current_action =
                        self.prs().nt_action(self.stack[self.state_stack_top as usize], lhs_symbol);
                    if self.current_action <= self.num_rules {
                        continue;
                    } else {
                        break;
                    }
                }
            } else if self.current_action < self.accept_action {
                self.curtok = self.tok_mut().get_token();
                if self.curtok > end_offset {
                    self.curtok = self.tok_ref().get_stream_length();
                }
                self.current_kind = self.tok_ref().get_kind(self.curtok);
            } else if self.current_action == self.accept_action {
                return true;
            } else {
                break;
            }
        }

        if self.starttok == self.curtok {
            if self.current_kind == self.eoft_symbol {
                self.action = None;
                return false;
            }
            self.last_token = self.curtok;
            let starttok = self.starttok;
            let curtok = self.curtok;
            self.tok_mut()
                .report_lexical_error_position(starttok, curtok);
            self.curtok = self.tok_mut().get_token();
            if self.curtok > end_offset {
                self.curtok = self.tok_ref().get_stream_length();
            }
            self.current_kind = self.tok_ref().get_kind(self.curtok);
        } else {
            self.last_token = self.tok_ref().get_previous(self.curtok);
            let starttok = self.starttok;
            let last_token = self.last_token;
            self.tok_mut()
                .report_lexical_error_position(starttok, last_token);
        }

        true
    }

    pub fn lex_next_character(&mut self, act: i32, kind: i32) -> i32 {
        let action_save = self.action.as_ref().map(|a| a.size()).unwrap_or(0);
        let mut pos = self.state_stack_top;
        let mut temp_stack_top = self.state_stack_top - 1;
        let mut act = self.t_action(act, kind);

        'scan: {
            while act <= self.num_rules {
                if let Some(ref mut action) = self.action {
                    action.add(act);
                }
                loop {
                    let lhs_symbol = self.prs().lhs(act);
                    if lhs_symbol == self.start_symbol {
                        if self.starttok == self.curtok {
                            act = self.error_action;
                            break 'scan;
                        } else {
                            self.parse_actions();
                            return self.accept_action;
                        }
                    }
                    temp_stack_top -= self.prs().rhs(act) - 1;
                    let state = if temp_stack_top > pos {
                        self.temp_stack[temp_stack_top as usize]
                    } else {
                        self.stack[temp_stack_top as usize]
                    };
                    act = self.prs().nt_action(state, lhs_symbol);
                    if act <= self.num_rules {
                        continue;
                    } else {
                        break;
                    }
                }
                if (temp_stack_top + 1) as usize >= self.stack.len() {
                    self.reallocate_stacks();
                }
                if pos >= temp_stack_top {
                    pos = temp_stack_top;
                }
                self.temp_stack[(temp_stack_top + 1) as usize] = act;
                act = self.t_action(act, kind);
            }
        }

        if act == self.error_action {
            if let Some(ref mut action) = self.action {
                action.reset_to(action_save);
            }
        } else {
            self.state_stack_top = temp_stack_top + 1;
            let mut i = pos + 1;
            while i <= self.state_stack_top {
                self.stack[i as usize] = self.temp_stack[i as usize];
                i += 1;
            }
        }
        act
    }

    pub fn parse_actions(&mut self) {
        self.taking_actions = true;
        self.curtok = self.starttok;
        self.last_token = self.tok_ref().get_previous(self.curtok);

        self.state_stack_top = -1;
        self.current_action = self.start_state;
        let actions: Vec<i32> = {
            let action = self.action.as_ref().expect("action not initialized");
            (0..action.size()).map(|i| action.get(i)).collect()
        };
        let mut i = 0;

        while i < actions.len() {
            self.state_stack_top += 1;
            self.stack[self.state_stack_top as usize] = self.current_action;
            self.location_stack[self.state_stack_top as usize] = self.curtok;

            self.current_action = actions[i];
            i += 1;
            if self.current_action <= self.num_rules {
                self.state_stack_top -= 1;
                loop {
                    self.state_stack_top -= self.prs().rhs(self.current_action) - 1;
                    let rule = self.current_action;
                    self.ra().rule_action(rule);
                    let lhs_symbol = self.prs().lhs(self.current_action);
                    if lhs_symbol == self.start_symbol {
                        self.taking_actions = false;
                        return;
                    }
                    self.current_action = self.prs().nt_action(
                        self.stack[self.state_stack_top as usize],
                        lhs_symbol,
                    );
                    if self.current_action <= self.num_rules {
                        continue;
                    } else {
                        break;
                    }
                }
            } else {
                self.last_token = self.curtok;
                let curtok = self.curtok;
                self.curtok = self.tok_mut().get_next(curtok);
                if self.current_action > self.error_action {
                    self.current_kind = self.tok_ref().get_kind(self.curtok);
                    self.current_action -= self.error_action;
                    loop {
                        self.state_stack_top -= self.prs().rhs(self.current_action) - 1;
                        let rule = self.current_action;
                        self.ra().rule_action(rule);
                        let lhs_symbol = self.prs().lhs(self.current_action);
                        if lhs_symbol == self.start_symbol {
                            self.taking_actions = false;
                            return;
                        }
                        self.current_action = self.prs().nt_action(
                            self.stack[self.state_stack_top as usize],
                            lhs_symbol,
                        );
                        if self.current_action <= self.num_rules {
                            continue;
                        } else {
                            break;
                        }
                    }
                }
            }
        }

        self.taking_actions = false;
    }
}
