use std::cell::RefCell;
use std::rc::Rc;

use super::message_handler::IMessageHandler;
use super::prs_stream::IPrsStream;
use super::token_stream::TokenStream;

/// Shared handle to a lexer stream (self or subclass wrapper).
pub type LexStreamRef = Rc<RefCell<dyn ILexStream>>;

/// Lexical stream interface mirroring Go's `ILexStream`.
pub trait ILexStream: TokenStream {
    fn get_i_prs_stream(&self) -> Option<Rc<RefCell<dyn IPrsStream>>>;
    fn set_prs_stream(&mut self, stream: Rc<RefCell<dyn IPrsStream>>);

    fn get_line_count(&self) -> i32;
    fn get_stream_index(&self) -> i32;
    fn ordered_exported_symbols(&self) -> Option<Vec<String>>;
    fn get_line_offset(&self, i: i32) -> i32;
    fn get_line_number_of_char_at(&self, i: i32) -> i32;
    fn get_column_of_char_at(&self, i: i32) -> i32;
    fn get_char_value(&self, i: i32) -> String;
    fn get_input_chars(&self) -> Vec<char>;
    fn get_int_value(&self, i: i32) -> i32;

    fn make_token(&mut self, start_loc: i32, end_loc: i32, kind: i32);
    fn set_message_handler(&mut self, handler: Rc<RefCell<dyn IMessageHandler>>);
    fn get_message_handler(&self) -> Option<Rc<RefCell<dyn IMessageHandler>>>;

    fn get_location(&self, left_loc: i32, right_loc: i32) -> [i32; 6];
    fn report_lexical_error_position(&mut self, left_loc: i32, right_loc: i32);
    fn report_lexical_error(
        &mut self,
        left_loc: i32,
        right_loc: i32,
        error_code: i32,
        error_left_loc: i32,
        error_right_loc: i32,
        error_info: &[String],
    );

    fn to_string_range(&self, start_offset: i32, end_offset: i32) -> String;

    /// Deprecated alias for [`get_first_real_token`](TokenStream::get_first_real_token).
    fn get_first_error_token(&self, i: i32) -> i32 {
        self.get_first_real_token(i)
    }

    /// Deprecated alias for [`get_last_real_token`](TokenStream::get_last_real_token).
    fn get_last_error_token(&self, i: i32) -> i32 {
        self.get_last_real_token(i)
    }
}
