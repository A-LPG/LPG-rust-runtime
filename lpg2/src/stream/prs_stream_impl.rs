use std::cell::RefCell;
use std::collections::HashMap;
use std::rc::{Rc, Weak};

use crate::collections::{IntArrayList, TokenArrayList};
use crate::error::{
    LpgException, NullExportedSymbolsException, NullPointerException, UndefinedEofSymbolException,
    UnimplementedTerminalsException,
};
use crate::token::{Adjunct, ErrorToken, Token};
use crate::traits::{
    IMessageHandler, IPrsStream, IToken, LexStreamRef, PrsStreamRef, PrsStreamWeak, TokenStream,
};
use crate::utils::string_slice_equal;

/// Token stream produced by lexical analysis and consumed by the parser.
pub struct PrsStream {
    self_handle: Weak<RefCell<PrsStream>>,
    override_dispatch: Option<PrsStreamRef>,
    i_lex_stream: Option<LexStreamRef>,
    kind_map: Vec<i32>,
    tokens: TokenArrayList,
    adjuncts: TokenArrayList,
    index: i32,
    len: i32,
}

impl PrsStream {
    /// Create a parser stream bound to the given lexer stream.
    #[allow(clippy::new_ret_no_self)]
    pub fn new(i_lex_stream: Option<LexStreamRef>) -> PrsStreamRef {
        Self::new_ext(None, i_lex_stream)
    }

    /// Create a parser stream with an optional external dispatch wrapper.
    pub fn new_ext(
        dispatch: Option<PrsStreamRef>,
        i_lex_stream: Option<LexStreamRef>,
    ) -> PrsStreamRef {
        let rc: Rc<RefCell<PrsStream>> = Rc::new_cyclic(|weak| {
            RefCell::new(PrsStream {
                self_handle: weak.clone(),
                override_dispatch: dispatch,
                i_lex_stream: None,
                kind_map: Vec::new(),
                tokens: TokenArrayList::new(),
                index: 0,
                len: 0,
                adjuncts: TokenArrayList::new(),
            })
        });

        if let Some(lex) = i_lex_stream {
            let prs_ref: PrsStreamRef = rc.clone();
            lex.borrow_mut().set_prs_stream(prs_ref.clone());
            rc.borrow_mut().set_lex_stream(lex);
            rc.borrow_mut().reset_token_stream();
        }

        rc
    }

    fn dispatch(&self) -> PrsStreamRef {
        if let Some(ref d) = self.override_dispatch {
            return d.clone();
        }
        self.self_handle
            .upgrade()
            .expect("PrsStream self_handle dropped while in use")
    }

    fn prs_weak(&self) -> PrsStreamWeak {
        Rc::downgrade(&self.dispatch())
    }

    /// Replace the associated lexer stream and reset the token stream.
    pub fn set_lex_stream(&mut self, lex_stream: LexStreamRef) {
        self.i_lex_stream = Some(lex_stream);
        self.reset_token_stream();
    }

    /// Replace the associated lexer stream and re-link circular references.
    pub fn reset_lex_stream(&mut self, lex_stream: LexStreamRef) {
        self.i_lex_stream = Some(lex_stream.clone());
        let dispatch = self.dispatch();
        lex_stream.borrow_mut().set_prs_stream(dispatch);
        self.dispatch().borrow_mut().set_lex_stream(lex_stream);
    }

    /// Clear token and adjunct lists.
    pub fn reset_token_stream(&mut self) {
        self.tokens = TokenArrayList::new();
        self.index = 0;
        self.adjuncts = TokenArrayList::new();
    }

    /// Map a lexer token kind to a parser terminal kind.
    pub fn map_kind(&self, kind: i32) -> i32 {
        if self.kind_map.is_empty() {
            kind
        } else {
            self.kind_map[kind as usize]
        }
    }

    /// Alias for [`IPrsStream::get_i_lex_stream`] (Go `GetLexStream`).
    pub fn get_lex_stream(&self) -> Option<LexStreamRef> {
        self.i_lex_stream.clone()
    }

    /// Record the current token-stream length (Go `SetSize`).
    pub fn set_size(&mut self) {
        self.len = self.tokens.size() as i32;
    }

    fn get_adjuncts_from_index(&self, i: i32) -> Vec<Rc<dyn IToken>> {
        let start_index = self
            .tokens
            .get(i as usize)
            .map(|t| t.get_adjunct_index())
            .unwrap_or(0);
        let end_index = if i + 1 == self.tokens.size() as i32 {
            self.adjuncts.size() as i32
        } else {
            let next = self.dispatch().borrow().get_next(i);
            self.tokens
                .get(next as usize)
                .map(|t| t.get_adjunct_index())
                .unwrap_or(self.adjuncts.size() as i32)
        };

        let mut slice = Vec::new();
        let mut j = start_index;
        while j < end_index {
            if let Some(adjunct) = self.adjuncts.get(j as usize) {
                slice.push(adjunct);
            }
            j += 1;
        }
        slice
    }

    /// Default implementation of [`IPrsStream::get_first_real_token`].
    pub fn get_first_real_token_impl(&self, mut i: i32) -> i32 {
        while i >= self.len {
            if let Some(token) = self.tokens.get(i as usize) {
                if let Some(error_token) = token.as_error_token() {
                    i = error_token
                        .get_first_real_token()
                        .map(|t| t.get_token_index())
                        .unwrap_or(i);
                } else {
                    break;
                }
            } else {
                break;
            }
        }
        i
    }

    /// Default implementation of [`IPrsStream::get_last_real_token`].
    pub fn get_last_real_token_impl(&self, mut i: i32) -> i32 {
        while i >= self.len {
            if let Some(token) = self.tokens.get(i as usize) {
                if let Some(error_token) = token.as_error_token() {
                    i = error_token
                        .get_last_real_token()
                        .map(|t| t.get_token_index())
                        .unwrap_or(i);
                } else {
                    break;
                }
            } else {
                break;
            }
        }
        i
    }

    /// Print token metadata for tokens in `(1 .. size-1)`.
    pub fn dump_tokens_impl(&self) {
        if self.dispatch().borrow().get_size() <= 2 {
            return;
        }
        println!(" Kind \tOffSet \tLen \tLine \tCol \tText\n");
        let size = self.get_size();
        let mut i = 1;
        while i < size - 1 {
            self.dispatch().borrow().dump_token(i);
            i += 1;
        }
    }

    /// Print metadata for a single token.
    pub fn dump_token_impl(&self, i: i32) {
        let dispatch = self.dispatch();
        let dispatch = dispatch.borrow();
        print!(" ( {} )", dispatch.get_kind(i));
        print!(" \t{}", dispatch.get_start_offset(i));
        print!(" \t{}", dispatch.get_token_length(i));
        print!(" \t{}", dispatch.get_line_number_of_token_at(i));
        print!(" \t{}", dispatch.get_column_of_token_at(i));
        print!(" \t{}", dispatch.get_token_text(i));
        println!();
    }
}

impl TokenStream for PrsStream {
    fn get_token_from_end_token(&mut self, end_token: i32) -> i32 {
        if self.index < end_token {
            self.index = self.dispatch().borrow().get_next(self.index);
        } else {
            self.index = self.len - 1;
        }
        self.index
    }

    fn get_token(&mut self) -> i32 {
        self.index = self.dispatch().borrow().get_next(self.index);
        self.index
    }

    fn get_kind(&self, i: i32) -> i32 {
        self.tokens
            .get(i as usize)
            .map(|t| t.get_kind())
            .unwrap_or(0)
    }

    fn get_next(&self, i: i32) -> i32 {
        let next = i + 1;
        if next < self.len {
            next
        } else {
            self.len - 1
        }
    }

    fn get_previous(&self, i: i32) -> i32 {
        if i <= 0 {
            0
        } else {
            i - 1
        }
    }

    fn get_name(&self, i: i32) -> String {
        self.dispatch().borrow().get_token_text(i)
    }

    fn peek(&self) -> i32 {
        self.dispatch().borrow().get_next(self.index)
    }

    fn reset(&mut self) {
        self.index = 0;
    }

    fn reset_to(&mut self, i: i32) {
        self.index = self.dispatch().borrow().get_previous(i);
    }

    fn bad_token(&self) -> i32 {
        0
    }

    fn get_line(&self, i: i32) -> i32 {
        self.dispatch().borrow().get_line_number_of_token_at(i)
    }

    fn get_column(&self, i: i32) -> i32 {
        self.dispatch().borrow().get_column_of_token_at(i)
    }

    fn get_end_line(&self, i: i32) -> i32 {
        self.dispatch().borrow().get_end_line_number_of_token_at(i)
    }

    fn get_end_column(&self, i: i32) -> i32 {
        self.dispatch().borrow().get_end_column_of_token_at(i)
    }

    fn after_eol(&self, i: i32) -> bool {
        if i < 1 {
            true
        } else {
            let dispatch = self.dispatch();
            let dispatch = dispatch.borrow();
            dispatch.get_end_line_number_of_token_at(i - 1)
                < dispatch.get_line_number_of_token_at(i)
        }
    }

    fn get_file_name(&self) -> String {
        if let Some(ref lex) = self.i_lex_stream {
            lex.borrow().get_file_name()
        } else {
            String::new()
        }
    }

    fn get_stream_length(&self) -> i32 {
        self.len
    }

    fn get_first_real_token(&self, i: i32) -> i32 {
        self.get_first_real_token_impl(i)
    }

    fn get_last_real_token(&self, i: i32) -> i32 {
        self.get_last_real_token_impl(i)
    }

    fn report_error(
        &mut self,
        error_code: i32,
        left_token: i32,
        right_token: i32,
        error_info: &[String],
        error_token: i32,
    ) {
        if let Some(ref lex) = self.i_lex_stream {
            let dispatch = self.dispatch();
            let dispatch = dispatch.borrow();
            lex.borrow_mut().report_lexical_error(
                dispatch.get_start_offset(left_token),
                dispatch.get_end_offset(right_token),
                error_code,
                dispatch.get_start_offset(error_token),
                dispatch.get_end_offset(error_token),
                error_info,
            );
        }
    }
}

impl IPrsStream for PrsStream {
    fn get_message_handler(&self) -> Option<Rc<RefCell<dyn IMessageHandler>>> {
        self.i_lex_stream
            .as_ref()
            .and_then(|lex| lex.borrow().get_message_handler())
    }

    fn set_message_handler(&mut self, handler: Rc<RefCell<dyn IMessageHandler>>) {
        if let Some(ref lex) = self.i_lex_stream {
            lex.borrow_mut().set_message_handler(handler);
        }
    }

    fn get_i_lex_stream(&self) -> Option<LexStreamRef> {
        self.i_lex_stream.clone()
    }

    fn set_lex_stream(&mut self, lex_stream: LexStreamRef) {
        PrsStream::set_lex_stream(self, lex_stream);
    }

    fn make_token(&mut self, start_loc: i32, end_loc: i32, kind: i32) {
        let prs_weak = self.prs_weak();
        let token = Token::new(start_loc, end_loc, self.map_kind(kind), Some(prs_weak));
        let token_index = self.tokens.size() as i32;
        token.set_token_index(token_index);
        self.tokens.add(token);
        if let Some(last) = self.tokens.get(self.tokens.size() - 1) {
            last.set_adjunct_index(self.adjuncts.size() as i32);
        }
    }

    fn make_adjunct(&mut self, start_loc: i32, end_loc: i32, kind: i32) {
        let token_index = self.tokens.size() as i32 - 1;
        let prs_weak = self.prs_weak();
        let adjunct = Adjunct::new(start_loc, end_loc, self.map_kind(kind), Some(prs_weak));
        adjunct.set_adjunct_index(self.adjuncts.size() as i32);
        adjunct.set_token_index(token_index);
        self.adjuncts.add(adjunct);
    }

    fn remove_last_token(&mut self) {
        let last_index = self.tokens.size() - 1;
        let adjunct_index = self
            .tokens
            .get(last_index)
            .map(|t| t.get_adjunct_index())
            .unwrap_or(0) as usize;
        let mut adjuncts_size = self.adjuncts.size();
        while adjuncts_size > adjunct_index {
            adjuncts_size -= 1;
            self.adjuncts.remove_at(adjuncts_size);
        }
        self.tokens.remove_at(last_index);
    }

    fn get_line_count(&self) -> i32 {
        self.i_lex_stream
            .as_ref()
            .map(|lex| lex.borrow().get_line_count())
            .unwrap_or(0)
    }

    fn get_size(&self) -> i32 {
        self.tokens.size() as i32
    }

    fn remap_terminal_symbols(
        &mut self,
        ordered_parser_symbols: &[String],
        eof_symbol: i32,
    ) -> Result<(), LpgException> {
        let lex = self.i_lex_stream.clone().ok_or_else(|| {
            LpgException::NullPointer(NullPointerException::new(
                "PrsStream.RemapTerminalSymbols(..)  lexStream is nil",
            ))
        })?;

        let ordered_lexer_symbols = lex
            .borrow()
            .ordered_exported_symbols()
            .ok_or_else(|| LpgException::NullExportedSymbols(NullExportedSymbolsException::new("")))?;

        let mut unimplemented_symbols = IntArrayList::new();

        if string_slice_equal(&ordered_lexer_symbols, ordered_parser_symbols) {
            self.kind_map = vec![0; ordered_lexer_symbols.len()];
            let mut terminal_map: HashMap<&str, i32> = HashMap::new();
            for (i, symbol) in ordered_lexer_symbols.iter().enumerate() {
                terminal_map.insert(symbol.as_str(), i as i32);
            }
            for (i, symbol) in ordered_parser_symbols.iter().enumerate() {
                if let Some(&k) = terminal_map.get(symbol.as_str()) {
                    self.kind_map[k as usize] = i as i32;
                } else if i as i32 == eof_symbol {
                    return Err(LpgException::UndefinedEofSymbol(
                        UndefinedEofSymbolException::new(""),
                    ));
                } else {
                    unimplemented_symbols.add(i as i32);
                }
            }
        }

        if unimplemented_symbols.size() > 0 {
            return Err(LpgException::UnimplementedTerminals(
                UnimplementedTerminalsException::new(unimplemented_symbols),
            ));
        }

        Ok(())
    }

    fn ordered_terminal_symbols(&self) -> Option<Vec<String>> {
        None
    }

    fn map_kind(&self, kind: i32) -> i32 {
        PrsStream::map_kind(self, kind)
    }

    fn reset_token_stream(&mut self) {
        PrsStream::reset_token_stream(self);
    }

    fn reset_stream_length(&mut self) {
        self.len = self.tokens.size() as i32;
    }

    fn get_stream_index(&self) -> i32 {
        self.index
    }

    fn set_stream_index(&mut self, index: i32) {
        self.index = index;
    }

    fn set_stream_length(&mut self, len: i32) {
        self.len = len;
    }

    fn add_token(&mut self, token: Rc<dyn IToken>) {
        token.set_token_index(self.tokens.size() as i32);
        self.tokens.add(token);
        if let Some(last) = self.tokens.get(self.tokens.size() - 1) {
            last.set_adjunct_index(self.adjuncts.size() as i32);
        }
    }

    fn add_adjunct(&mut self, adjunct: Rc<dyn IToken>) {
        let token_index = self.tokens.size() as i32 - 1;
        adjunct.set_token_index(token_index);
        adjunct.set_adjunct_index(self.adjuncts.size() as i32);
        self.adjuncts.add(adjunct);
    }

    fn ordered_exported_symbols(&self) -> Option<Vec<String>> {
        None
    }

    fn get_tokens(&self) -> &TokenArrayList {
        &self.tokens
    }

    fn get_adjuncts(&self) -> &TokenArrayList {
        &self.adjuncts
    }

    fn get_following_adjuncts(&self, i: i32) -> Vec<Rc<dyn IToken>> {
        self.get_adjuncts_from_index(i)
    }

    fn get_preceding_adjuncts(&self, i: i32) -> Vec<Rc<dyn IToken>> {
        self.get_adjuncts_from_index(self.dispatch().borrow().get_previous(i))
    }

    fn get_i_token(&self, i: i32) -> Option<Rc<dyn IToken>> {
        self.tokens.get(i as usize)
    }

    fn get_token_text(&self, i: i32) -> String {
        self.tokens
            .get(i as usize)
            .map(|t| t.to_string())
            .unwrap_or_default()
    }

    fn get_start_offset(&self, i: i32) -> i32 {
        self.tokens
            .get(i as usize)
            .map(|t| t.get_start_offset())
            .unwrap_or(0)
    }

    fn get_end_offset(&self, i: i32) -> i32 {
        self.tokens
            .get(i as usize)
            .map(|t| t.get_end_offset())
            .unwrap_or(0)
    }

    fn get_line_offset(&self, i: i32) -> i32 {
        self.i_lex_stream
            .as_ref()
            .map(|lex| lex.borrow().get_line_offset(i))
            .unwrap_or(0)
    }

    fn get_line_number_of_char_at(&self, i: i32) -> i32 {
        self.i_lex_stream
            .as_ref()
            .map(|lex| lex.borrow().get_line_number_of_char_at(i))
            .unwrap_or(0)
    }

    fn get_column_of_char_at(&self, i: i32) -> i32 {
        if let Some(ref lex) = self.i_lex_stream {
            lex.borrow().get_column_of_char_at(i)
        } else {
            0
        }
    }

    fn get_token_length(&self, i: i32) -> i32 {
        self.tokens
            .get(i as usize)
            .map(|t| t.get_end_offset() - t.get_start_offset() + 1)
            .unwrap_or(0)
    }

    fn get_line_number_of_token_at(&self, i: i32) -> i32 {
        if self.i_lex_stream.is_none() {
            return 0;
        }
        let start = self
            .tokens
            .get(i as usize)
            .map(|t| t.get_start_offset())
            .unwrap_or(0);
        self.i_lex_stream
            .as_ref()
            .map(|lex| lex.borrow().get_line_number_of_char_at(start))
            .unwrap_or(0)
    }

    fn get_end_line_number_of_token_at(&self, i: i32) -> i32 {
        if self.i_lex_stream.is_none() {
            return 0;
        }
        let end = self
            .tokens
            .get(i as usize)
            .map(|t| t.get_end_offset())
            .unwrap_or(0);
        self.i_lex_stream
            .as_ref()
            .map(|lex| lex.borrow().get_line_number_of_char_at(end))
            .unwrap_or(0)
    }

    fn get_column_of_token_at(&self, i: i32) -> i32 {
        if self.i_lex_stream.is_none() {
            return 0;
        }
        let start = self
            .tokens
            .get(i as usize)
            .map(|t| t.get_start_offset())
            .unwrap_or(0);
        self.i_lex_stream
            .as_ref()
            .map(|lex| lex.borrow().get_column_of_char_at(start))
            .unwrap_or(0)
    }

    fn get_end_column_of_token_at(&self, i: i32) -> i32 {
        if self.i_lex_stream.is_none() {
            return 0;
        }
        let end = self
            .tokens
            .get(i as usize)
            .map(|t| t.get_end_offset())
            .unwrap_or(0);
        self.i_lex_stream
            .as_ref()
            .map(|lex| lex.borrow().get_column_of_char_at(end))
            .unwrap_or(0)
    }

    fn get_input_chars(&self) -> Vec<char> {
        self.i_lex_stream
            .as_ref()
            .map(|lex| lex.borrow().get_input_chars())
            .unwrap_or_default()
    }

    fn to_string_from_index(&self, first_token: i32, last_token: i32) -> String {
        let dispatch = self.dispatch();
        let dispatch = dispatch.borrow();
        match (
            dispatch.get_i_token(first_token),
            dispatch.get_i_token(last_token),
        ) {
            (Some(t1), Some(t2)) => dispatch.to_string_tokens(t1.as_ref(), t2.as_ref()),
            _ => String::new(),
        }
    }

    fn to_string_tokens(&self, t1: &dyn IToken, t2: &dyn IToken) -> String {
        if let Some(ref lex) = self.i_lex_stream {
            lex.borrow()
                .to_string_range(t1.get_start_offset(), t2.get_end_offset())
        } else {
            String::new()
        }
    }

    fn get_token_index_at_character(&self, offset: i32) -> i32 {
        let mut low = 0;
        let mut high = self.tokens.size() as i32;
        while high > low {
            let mid = (high + low) / 2;
            if let Some(mid_element) = self.tokens.get(mid as usize) {
                if offset >= mid_element.get_start_offset()
                    && offset <= mid_element.get_end_offset()
                {
                    return mid;
                }
                if offset < mid_element.get_start_offset() {
                    high = mid;
                } else {
                    low = mid + 1;
                }
            } else {
                break;
            }
        }
        -(low - 1)
    }

    fn get_token_at_character(&self, offset: i32) -> Option<Rc<dyn IToken>> {
        let token_index = self.get_token_index_at_character(offset);
        if token_index < 0 {
            None
        } else {
            self.dispatch().borrow().get_token_at(token_index)
        }
    }

    fn get_token_at(&self, i: i32) -> Option<Rc<dyn IToken>> {
        self.tokens.get(i as usize)
    }

    fn dump_tokens(&self) {
        PrsStream::dump_tokens_impl(self);
    }

    fn dump_token(&self, i: i32) {
        PrsStream::dump_token_impl(self, i);
    }

    fn make_error_token(
        &mut self,
        firsttok: i32,
        lasttok: i32,
        errortok: i32,
        kind: i32,
    ) -> i32 {
        let index = self.tokens.size() as i32;
        let dispatch = self.dispatch();
        let dispatch = dispatch.borrow();

        let token = ErrorToken::new(
            dispatch.get_i_token(firsttok),
            dispatch.get_i_token(lasttok),
            dispatch.get_i_token(errortok),
            dispatch.get_start_offset(firsttok),
            dispatch.get_end_offset(lasttok),
            kind,
        );
        token.set_token_index(self.tokens.size() as i32);
        self.tokens.add(token);
        if let Some(last) = self.tokens.get(self.tokens.size() - 1) {
            last.set_adjunct_index(self.adjuncts.size() as i32);
        }
        index
    }
}
