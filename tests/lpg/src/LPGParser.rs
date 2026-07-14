// mod lpg


    //#line 135 "dtParserTemplateF.gi

/// Lets [`DeterministicParser`] drive a shared [`PrsStreamRef`] (single-threaded).
struct PrsStreamAdapter {
    ptr: *mut dyn IPrsStream,
}

impl PrsStreamAdapter {
    fn new(stream: &PrsStreamRef) -> Self {
        Self {
            ptr: stream.as_ref().as_ptr(),
        }
    }

    unsafe fn inner(&self) -> &dyn IPrsStream {
        &*self.ptr
    }

    unsafe fn inner_mut(&mut self) -> &mut dyn IPrsStream {
        &mut *self.ptr
    }
}

impl TokenStream for PrsStreamAdapter {
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
            self.inner_mut().report_error(
                error_code,
                left_token,
                right_token,
                error_info,
                error_token,
            )
        }
    }
}

struct LPGParserRuleProxy {
    owner: *mut LPGParser,
}

unsafe impl Send for LPGParserRuleProxy {}
unsafe impl Sync for LPGParserRuleProxy {}

impl RuleAction for LPGParserRuleProxy {
    fn rule_action(&mut self, rule_number: i32) {
        unsafe {
            (*self.owner).rule_action_impl(rule_number);
        }
    }
}

    //#line 8 "LPGParser.g


 
    //#line 254 "dtParserTemplateF.gi

pub struct LPGParser {
    prs_stream: PrsStreamRef,
    dt_parser: Option<DeterministicParser<PrsStreamAdapter, LPGParserprs, LPGParserRuleProxy>>,
    unimplemented_symbols_warning: bool,
    prs_table: LPGParserprs,
}

impl LPGParser {
    fn dt_parser(&mut self) -> &mut DeterministicParser<PrsStreamAdapter, LPGParserprs, LPGParserRuleProxy> {
        self.dt_parser.as_mut().expect("parser not initialized")
    }

    pub fn new(lex_stream: Option<LexStreamRef>) -> Result<Box<Self>, LpgException> {
        let prs_stream = PrsStream::new(lex_stream.clone());
        let mut boxed = Box::new(Self {
            prs_stream,
            dt_parser: None,
            unimplemented_symbols_warning: false,
            prs_table: LPGParserprs,
        });
        let owner = boxed.as_mut() as *mut Self;
        let adapter = PrsStreamAdapter::new(&boxed.prs_stream);
        match DeterministicParser::new(
            adapter,
            LPGParserprs,
            LPGParserRuleProxy { owner },
            None,
        ) {
            Ok(parser) => {
                boxed.dt_parser = Some(parser);
            }
            Err(LpgException::NotDeterministicParseTable(_)) => {
                return Err(NotDeterministicParseTableException::new(format!(
                    "Regenerate %prs_type with -NOBACKTRACK option"
                ))
                .into());
            }
            Err(LpgException::BadParseSymFile(_)) => {
                return Err(BadParseSymFileException::new(format!(
                    "Bad Parser Symbol File -- %sym_type. Regenerate %prs_type"
                ))
                .into());
            }
            Err(e) => return Err(e),
        }
        if let Some(lex) = lex_stream {
            boxed.reset(lex)?;
        }
        Ok(boxed)
    }

    pub fn get_parse_table(&self) -> &LPGParserprs {
        &self.prs_table
    }

    pub fn get_parser(
        &mut self,
    ) -> &mut DeterministicParser<PrsStreamAdapter, LPGParserprs, LPGParserRuleProxy> {
        self.dt_parser()
    }

    pub fn set_result(&mut self, object: Option<Box<dyn Any>>) {
        self.dt_parser().set_sym1(object);
    }

    pub fn get_rhs_sym(&self, i: i32) -> Option<&dyn Any> {
        self.dt_parser.as_ref().unwrap().get_sym(i)
    }

    pub fn get_rhs_token_index(&self, i: i32) -> i32 {
        self.dt_parser.as_ref().unwrap().get_token(i)
    }

    pub fn get_rhs_i_token(&self, i: i32) -> Option<Rc<dyn IToken>> {
        self.prs_stream
            .borrow()
            .get_i_token(self.get_rhs_token_index(i))
    }

    pub fn get_rhs_first_token_index(&self, i: i32) -> i32 {
        self.dt_parser.as_ref().unwrap().get_first_token_at(i)
    }

    pub fn get_rhs_first_i_token(&self, i: i32) -> Option<Rc<dyn IToken>> {
        self.prs_stream
            .borrow()
            .get_i_token(self.get_rhs_first_token_index(i))
    }

    pub fn get_rhs_last_token_index(&self, i: i32) -> i32 {
        self.dt_parser.as_ref().unwrap().get_last_token_at(i)
    }

    pub fn get_rhs_last_i_token(&self, i: i32) -> Option<Rc<dyn IToken>> {
        self.prs_stream
            .borrow()
            .get_i_token(self.get_rhs_last_token_index(i))
    }

    pub fn get_left_span(&self) -> i32 {
        self.dt_parser.as_ref().unwrap().get_first_token()
    }

    pub fn get_left_i_token(&self) -> Option<Rc<dyn IToken>> {
        self.prs_stream
            .borrow()
            .get_i_token(self.get_left_span())
    }

    pub fn get_right_span(&self) -> i32 {
        self.dt_parser.as_ref().unwrap().get_last_token()
    }

    pub fn get_right_i_token(&self) -> Option<Rc<dyn IToken>> {
        self.prs_stream
            .borrow()
            .get_i_token(self.get_right_span())
    }

    pub fn get_rhs_error_token_index(&self, i: i32) -> i32 {
        let index = self.dt_parser.as_ref().unwrap().get_token(i);
        let is_error = self
            .prs_stream
            .borrow()
            .get_i_token(index)
            .map(|t| t.as_error_token().is_some())
            .unwrap_or(false);
        if is_error {
            index
        } else {
            0
        }
    }

    pub fn get_rhs_error_i_token(&self, i: i32) -> Option<Rc<dyn IToken>> {
        let index = self.dt_parser.as_ref().unwrap().get_token(i);
        self.prs_stream.borrow().get_i_token(index).and_then(|t| {
            if t.as_error_token().is_some() {
                Some(t)
            } else {
                None
            }
        })
    }

    pub fn reset(&mut self, lex_stream: LexStreamRef) -> Result<(), LpgException> {
        self.prs_stream = PrsStream::new(Some(lex_stream));
        let adapter = PrsStreamAdapter::new(&self.prs_stream);
        self.dt_parser().reset(Some(adapter), None, None)?;
        let symbols = self.ordered_terminal_symbols();
        let eoft = self.prs_table.get_eoft_symbol();
        match self
            .prs_stream
            .borrow_mut()
            .remap_terminal_symbols(&symbols, eoft)
        {
            Ok(()) => Ok(()),
            Err(LpgException::NullExportedSymbols(_))
            | Err(LpgException::NullTerminalSymbols(_)) => Ok(()),
            Err(LpgException::UnimplementedTerminals(e)) => {
                if self.unimplemented_symbols_warning {
                    eprintln!("The Lexer will not scan the following token(s):");
                    let symbols = e.get_symbols();
                    for idx in 0..symbols.size() {
                        let id = symbols.get(idx as usize);
                        eprintln!(
                            "    {}",
                            LPGParsersym::ORDERED_TERMINAL_SYMBOLS[id as usize]
                        );
                    }
                    eprintln!();
                }
                Err(LpgException::UnimplementedTerminals(e))
            }
            Err(LpgException::UndefinedEofSymbol(_)) => Err(
                UndefinedEofSymbolException::new(format!(
                    "The Lexer does not implement the Eof symbol {}",
                    LPGParsersym::ORDERED_TERMINAL_SYMBOLS
                        [self.prs_table.get_eoft_symbol() as usize]
                ))
                .into(),
            ),
            Err(e) => Err(e),
        }
    }

    pub fn num_token_kinds(&self) -> i32 {
        LPGParsersym::NUM_TOKEN_KINDS
    }

    pub fn ordered_terminal_symbols(&self) -> Vec<String> {
        LPGParsersym::ORDERED_TERMINAL_SYMBOLS
            .iter()
            .map(|s| (*s).to_string())
            .collect()
    }

    pub fn get_token_kind_name(&self, kind: i32) -> String {
        LPGParsersym::ORDERED_TERMINAL_SYMBOLS[kind as usize].to_string()
    }

    pub fn get_eof_token_kind(&self) -> i32 {
        self.prs_table.get_eoft_symbol()
    }

    pub fn get_i_prs_stream(&self) -> PrsStreamRef {
        self.prs_stream.clone()
    }

    pub fn parser(&mut self) -> Result<Option<Box<dyn Any>>, LpgException> {
        self.parser_with_monitor(0, None)
    }

    pub fn parser_with_monitor(
        &mut self,
        _error_repair_count: i32,
        monitor: Option<Box<dyn Monitor>>,
    ) -> Result<Option<Box<dyn Any>>, LpgException> {
        self.dt_parser().set_monitor(monitor);
        match self.dt_parser().parse_entry(0) {
            Ok(ast) => Ok(ast),
            Err(LpgException::BadParse(e)) => {
                self.prs_stream.borrow_mut().reset_to(e.error_token);
                let mut diagnose_parser = DiagnoseParser::new_diagnose_parser(
                    PrsStreamAdapter::new(&self.prs_stream),
                    self.prs_table.clone(),
                    0,
                    0,
                    None,
                );
                diagnose_parser.diagnose(e.error_token);
                Err(LpgException::BadParse(e))
            }
            Err(e) => Err(e),
        }
    }

    //
    // Additional entry points, if any
    //
    

    //#line 38 "LPGParser.g


 
    //#line 501 "dtParserTemplateF.gi

    fn rule_action_impl(&mut self, rule_number: i32) {
        match rule_number {

            //
            // Rule 1:  LPG ::= options_segment LPG_INPUT
            //
             1 => {
                
                //#line 46 "LPGParser.g"

             },
            //
            // Rule 120:  action_segment ::= BLOCK
            //
             120 => {
                
                //#line 223 "LPGParser.g"
            },
    //#line 505 "dtParserTemplateF.gi

    
            _ => {}
        }
    }
}

