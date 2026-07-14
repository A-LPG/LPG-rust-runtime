//
// This is the grammar specification from the Final Draft of the generic spec.
//
////////////////////////////////////////////////////////////////////////////////
// Copyright (c) 2007 IBM Corporation.
// All rights reserved. This program and the accompanying materials
// are made available under the terms of the Eclipse Public License v1.0
// which accompanies this distribution, and is available at
// http://www.eclipse.org/legal/epl-v10.html
//
//Contributors:
//    Philippe Charles (pcharles@us.ibm.com) - initial API and implementation

////////////////////////////////////////////////////////////////////////////////

// mod java


    //#line 132 "btParserTemplateF.gi

/// Lets [`BacktrackingParser`] drive a shared [`PrsStreamRef`] (single-threaded).
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

impl IPrsStream for PrsStreamAdapter {
    fn get_message_handler(&self) -> Option<Rc<RefCell<dyn IMessageHandler>>> {
        unsafe { self.inner().get_message_handler() }
    }
    fn set_message_handler(&mut self, handler: Rc<RefCell<dyn IMessageHandler>>) {
        unsafe { self.inner_mut().set_message_handler(handler) }
    }
    fn get_i_lex_stream(&self) -> Option<LexStreamRef> {
        unsafe { self.inner().get_i_lex_stream() }
    }
    fn set_lex_stream(&mut self, lex_stream: LexStreamRef) {
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
    fn add_token(&mut self, token: Rc<dyn IToken>) {
        unsafe { self.inner_mut().add_token(token) }
    }
    fn add_adjunct(&mut self, adjunct: Rc<dyn IToken>) {
        unsafe { self.inner_mut().add_adjunct(adjunct) }
    }
    fn ordered_exported_symbols(&self) -> Option<Vec<String>> {
        unsafe { self.inner().ordered_exported_symbols() }
    }
    fn get_tokens(&self) -> &TokenArrayList {
        unsafe { self.inner().get_tokens() }
    }
    fn get_adjuncts(&self) -> &TokenArrayList {
        unsafe { self.inner().get_adjuncts() }
    }
    fn get_following_adjuncts(&self, i: i32) -> Vec<Rc<dyn IToken>> {
        unsafe { self.inner().get_following_adjuncts(i) }
    }
    fn get_preceding_adjuncts(&self, i: i32) -> Vec<Rc<dyn IToken>> {
        unsafe { self.inner().get_preceding_adjuncts(i) }
    }
    fn get_i_token(&self, i: i32) -> Option<Rc<dyn IToken>> {
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
    fn to_string_tokens(&self, t1: &dyn IToken, t2: &dyn IToken) -> String {
        unsafe { self.inner().to_string_tokens(t1, t2) }
    }
    fn get_token_index_at_character(&self, offset: i32) -> i32 {
        unsafe { self.inner().get_token_index_at_character(offset) }
    }
    fn get_token_at_character(&self, offset: i32) -> Option<Rc<dyn IToken>> {
        unsafe { self.inner().get_token_at_character(offset) }
    }
    fn get_token_at(&self, i: i32) -> Option<Rc<dyn IToken>> {
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

struct JavaParserRuleProxy {
    owner: *mut JavaParser,
}

unsafe impl Send for JavaParserRuleProxy {}
unsafe impl Sync for JavaParserRuleProxy {}

impl RuleAction for JavaParserRuleProxy {
    fn rule_action(&mut self, rule_number: i32) {
        unsafe {
            (*self.owner).rule_action_impl(rule_number);
        }
    }
}

    //#line 17 "GJavaParser.g



    //#line 396 "btParserTemplateF.gi

pub struct JavaParser {
    prs_stream: PrsStreamRef,
    bt_parser: Option<BacktrackingParser<PrsStreamAdapter, JavaParserprs, JavaParserRuleProxy>>,
    unimplemented_symbols_warning: bool,
    prs_table: JavaParserprs,
}

impl JavaParser {
    fn bt_parser(&mut self) -> &mut BacktrackingParser<PrsStreamAdapter, JavaParserprs, JavaParserRuleProxy> {
        self.bt_parser.as_mut().expect("parser not initialized")
    }

    pub fn new(lex_stream: Option<LexStreamRef>) -> Result<Box<Self>, LpgException> {
        let prs_stream = PrsStream::new(lex_stream.clone());
        let mut boxed = Box::new(Self {
            prs_stream,
            bt_parser: None,
            unimplemented_symbols_warning: false,
            prs_table: JavaParserprs,
        });
        let owner = boxed.as_mut() as *mut Self;
        let adapter = PrsStreamAdapter::new(&boxed.prs_stream);
        match BacktrackingParser::new(
            adapter,
            JavaParserprs,
            JavaParserRuleProxy { owner },
            None,
        ) {
            Ok(parser) => {
                boxed.bt_parser = Some(parser);
            }
            Err(LpgException::NotBacktrackParseTable(_)) => {
                return Err(NotBacktrackParseTableException::new(format!(
                    "Regenerate %prs_type with -BACKTRACK option"
                ))
                .into());
            }
            Err(LpgException::BadParseSymFile(_)) => {
                return Err(BadParseSymFileException::new(format!(
                    "Bad Parser Symbol File -- %sym_type"
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

    pub fn get_parse_table(&self) -> &JavaParserprs {
        &self.prs_table
    }

    pub fn get_parser(
        &mut self,
    ) -> &mut BacktrackingParser<PrsStreamAdapter, JavaParserprs, JavaParserRuleProxy> {
        self.bt_parser()
    }

    pub fn set_result(&mut self, object: Option<Box<dyn Any>>) {
        self.bt_parser().set_sym1(object);
    }

    pub fn get_rhs_sym(&self, i: i32) -> Option<&dyn Any> {
        self.bt_parser.as_ref().unwrap().get_sym(i)
    }

    pub fn get_rhs_token_index(&self, i: i32) -> i32 {
        self.bt_parser.as_ref().unwrap().get_token(i)
    }

    pub fn get_rhs_i_token(&self, i: i32) -> Option<Rc<dyn IToken>> {
        self.prs_stream
            .borrow()
            .get_i_token(self.get_rhs_token_index(i))
    }

    pub fn get_rhs_first_token_index(&self, i: i32) -> i32 {
        self.bt_parser.as_ref().unwrap().get_first_token_at(i)
    }

    pub fn get_rhs_first_i_token(&self, i: i32) -> Option<Rc<dyn IToken>> {
        self.prs_stream
            .borrow()
            .get_i_token(self.get_rhs_first_token_index(i))
    }

    pub fn get_rhs_last_token_index(&self, i: i32) -> i32 {
        self.bt_parser.as_ref().unwrap().get_last_token_at(i)
    }

    pub fn get_rhs_last_i_token(&self, i: i32) -> Option<Rc<dyn IToken>> {
        self.prs_stream
            .borrow()
            .get_i_token(self.get_rhs_last_token_index(i))
    }

    pub fn get_left_span(&self) -> i32 {
        self.bt_parser.as_ref().unwrap().get_first_token()
    }

    pub fn get_left_i_token(&self) -> Option<Rc<dyn IToken>> {
        self.prs_stream
            .borrow()
            .get_i_token(self.get_left_span())
    }

    pub fn get_right_span(&self) -> i32 {
        self.bt_parser.as_ref().unwrap().get_last_token()
    }

    pub fn get_right_i_token(&self) -> Option<Rc<dyn IToken>> {
        self.prs_stream
            .borrow()
            .get_i_token(self.get_right_span())
    }

    pub fn get_rhs_error_token_index(&self, i: i32) -> i32 {
        let index = self.bt_parser.as_ref().unwrap().get_token(i);
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
        let index = self.bt_parser.as_ref().unwrap().get_token(i);
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
        self.bt_parser().reset(Some(adapter), None, None)?;
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
                            JavaParsersym::ORDERED_TERMINAL_SYMBOLS[id as usize]
                        );
                    }
                    eprintln!();
                }
                Err(LpgException::UnimplementedTerminals(e))
            }
            Err(LpgException::UndefinedEofSymbol(_)) => Err(
                UndefinedEofSymbolException::new(format!(
                    "The Lexer does not implement the Eof symbol {}",
                    JavaParsersym::ORDERED_TERMINAL_SYMBOLS
                        [self.prs_table.get_eoft_symbol() as usize]
                ))
                .into(),
            ),
            Err(e) => Err(e),
        }
    }

    pub fn num_token_kinds(&self) -> i32 {
        JavaParsersym::NUM_TOKEN_KINDS
    }

    pub fn ordered_terminal_symbols(&self) -> Vec<String> {
        JavaParsersym::ORDERED_TERMINAL_SYMBOLS
            .iter()
            .map(|s| (*s).to_string())
            .collect()
    }

    pub fn get_token_kind_name(&self, kind: i32) -> String {
        JavaParsersym::ORDERED_TERMINAL_SYMBOLS[kind as usize].to_string()
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
        error_repair_count: i32,
        monitor: Option<Box<dyn Monitor>>,
    ) -> Result<Option<Box<dyn Any>>, LpgException> {
        self.bt_parser().set_monitor(monitor);
        match self
            .bt_parser()
            .fuzzy_parse_entry(0, error_repair_count)
        {
            Ok(ast) => Ok(ast),
            Err(LpgException::BadParse(e)) => Err(LpgException::BadParse(e)),
            Err(e) => Err(e),
        }
    }

    //
    // Additional entry points, if any
    //
    

    //#line 646 "btParserTemplateF.gi

    fn rule_action_impl(&mut self, rule_number: i32) {
        match rule_number {

            //
            // Rule 1:  identifier ::= IDENTIFIER
            //
             1 => {
                
                //#line 186 "GJavaParser.g"

                },
    //#line 650 "btParserTemplateF.gi

    
            _ => {}
        }
    }
}

