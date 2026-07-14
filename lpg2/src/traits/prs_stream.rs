use std::cell::RefCell;
use std::rc::Rc;

use crate::collections::TokenArrayList;

use super::itoken::IToken;
use super::lex_stream::ILexStream;
use super::message_handler::IMessageHandler;
use super::token_stream::TokenStream;

/// Shared handle to a parser token stream (self or subclass wrapper).
pub type PrsStreamRef = Rc<RefCell<dyn IPrsStream>>;

/// Weak back-reference from tokens to their parser stream.
pub type PrsStreamWeak = std::rc::Weak<RefCell<dyn IPrsStream>>;

/// Parser stream interface mirroring Go's `IPrsStream`.
pub trait IPrsStream: TokenStream {
    fn get_message_handler(&self) -> Option<Rc<RefCell<dyn IMessageHandler>>>;
    fn set_message_handler(&mut self, handler: Rc<RefCell<dyn IMessageHandler>>);

    fn get_i_lex_stream(&self) -> Option<Rc<RefCell<dyn ILexStream>>>;
    fn set_lex_stream(&mut self, lex_stream: Rc<RefCell<dyn ILexStream>>);

    fn make_token(&mut self, start_loc: i32, end_loc: i32, kind: i32);
    fn make_adjunct(&mut self, start_loc: i32, end_loc: i32, kind: i32);
    fn remove_last_token(&mut self);

    fn get_line_count(&self) -> i32;
    fn get_size(&self) -> i32;

    fn remap_terminal_symbols(
        &mut self,
        ordered_parser_symbols: &[String],
        eof_symbol: i32,
    ) -> Result<(), crate::error::LpgException>;

    fn ordered_terminal_symbols(&self) -> Option<Vec<String>>;
    fn map_kind(&self, kind: i32) -> i32;
    fn reset_token_stream(&mut self);

    fn get_stream_index(&self) -> i32;
    fn reset_stream_length(&mut self);
    fn set_stream_index(&mut self, index: i32);
    fn set_stream_length(&mut self, length: i32);

    fn add_token(&mut self, token: Rc<dyn IToken>);
    fn add_adjunct(&mut self, adjunct: Rc<dyn IToken>);

    fn ordered_exported_symbols(&self) -> Option<Vec<String>>;
    fn get_tokens(&self) -> &TokenArrayList;
    fn get_adjuncts(&self) -> &TokenArrayList;

    fn get_following_adjuncts(&self, i: i32) -> Vec<Rc<dyn IToken>>;
    fn get_preceding_adjuncts(&self, i: i32) -> Vec<Rc<dyn IToken>>;

    fn get_i_token(&self, i: i32) -> Option<Rc<dyn IToken>>;
    fn get_token_text(&self, i: i32) -> String;
    fn get_start_offset(&self, i: i32) -> i32;
    fn get_end_offset(&self, i: i32) -> i32;
    fn get_line_offset(&self, i: i32) -> i32;
    fn get_line_number_of_char_at(&self, i: i32) -> i32;
    fn get_column_of_char_at(&self, i: i32) -> i32;
    fn get_token_length(&self, i: i32) -> i32;
    fn get_line_number_of_token_at(&self, i: i32) -> i32;
    fn get_end_line_number_of_token_at(&self, i: i32) -> i32;
    fn get_column_of_token_at(&self, i: i32) -> i32;
    fn get_end_column_of_token_at(&self, i: i32) -> i32;
    fn get_input_chars(&self) -> Vec<char>;

    fn to_string_from_index(&self, first_token: i32, last_token: i32) -> String;
    fn to_string_tokens(&self, t1: &dyn IToken, t2: &dyn IToken) -> String;

    fn get_token_index_at_character(&self, offset: i32) -> i32;
    fn get_token_at_character(&self, offset: i32) -> Option<Rc<dyn IToken>>;
    fn get_token_at(&self, i: i32) -> Option<Rc<dyn IToken>>;

    fn dump_tokens(&self);
    fn dump_token(&self, i: i32);

    fn make_error_token(&mut self, first: i32, last: i32, error: i32, kind: i32) -> i32;

    /// Deprecated alias for [`get_first_real_token`](TokenStream::get_first_real_token).
    fn get_first_error_token(&self, i: i32) -> i32 {
        self.get_first_real_token(i)
    }

    /// Deprecated alias for [`get_last_real_token`](TokenStream::get_last_real_token).
    fn get_last_error_token(&self, i: i32) -> i32 {
        self.get_last_real_token(i)
    }
}
