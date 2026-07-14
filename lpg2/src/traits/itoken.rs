use std::rc::Rc;

use super::lex_stream::LexStreamRef;
use super::prs_stream::PrsStreamRef;

/// Token interface mirroring Go's `IToken`.
pub trait IToken {
    fn get_kind(&self) -> i32;
    fn set_kind(&self, kind: i32);

    fn get_start_offset(&self) -> i32;
    fn set_start_offset(&self, start_offset: i32);

    fn get_end_offset(&self) -> i32;
    fn set_end_offset(&self, end_offset: i32);

    fn get_token_index(&self) -> i32;
    fn set_token_index(&self, i: i32);

    fn get_adjunct_index(&self) -> i32;
    fn set_adjunct_index(&self, i: i32);

    fn get_preceding_adjuncts(&self) -> Vec<Rc<dyn IToken>>;
    fn get_following_adjuncts(&self) -> Vec<Rc<dyn IToken>>;

    fn get_i_lex_stream(&self) -> Option<LexStreamRef>;
    fn get_i_prs_stream(&self) -> Option<PrsStreamRef>;

    fn get_line(&self) -> i32;
    fn get_column(&self) -> i32;
    fn get_end_line(&self) -> i32;
    fn get_end_column(&self) -> i32;

    fn to_string(&self) -> String;

    /// Downcast helper for error-token traversal.
    fn as_error_token(&self) -> Option<&crate::token::ErrorToken> {
        None
    }
}
