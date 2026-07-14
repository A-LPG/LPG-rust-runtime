use std::rc::Rc;

use crate::traits::IToken;

use super::abstract_token::AbstractToken;
use super::token::Token;

/// Error token mirroring Go's `ErrorToken`.
pub struct ErrorToken {
    token: Token,
    first_token: Option<Rc<dyn IToken>>,
    last_token: Option<Rc<dyn IToken>>,
    error_token: Option<Rc<dyn IToken>>,
}

impl ErrorToken {
    #[allow(clippy::new_ret_no_self)]
    pub fn new(
        first_token: Option<Rc<dyn IToken>>,
        last_token: Option<Rc<dyn IToken>>,
        error_token: Option<Rc<dyn IToken>>,
        start_offset: i32,
        end_offset: i32,
        kind: i32,
    ) -> Rc<dyn IToken> {
        Rc::new(ErrorToken {
            token: Token::from_inner(AbstractToken::new(start_offset, end_offset, kind, None)),
            first_token,
            last_token,
            error_token,
        })
    }

    pub fn get_first_token(&self) -> Option<Rc<dyn IToken>> {
        self.get_first_real_token()
    }

    pub fn get_first_real_token(&self) -> Option<Rc<dyn IToken>> {
        self.first_token.clone()
    }

    pub fn get_last_token(&self) -> Option<Rc<dyn IToken>> {
        self.get_last_real_token()
    }

    pub fn get_last_real_token(&self) -> Option<Rc<dyn IToken>> {
        self.last_token.clone()
    }

    pub fn get_error_token(&self) -> Option<Rc<dyn IToken>> {
        self.error_token.clone()
    }

    pub fn inner(&self) -> &AbstractToken {
        self.token.inner()
    }
}

impl IToken for ErrorToken {
    fn get_kind(&self) -> i32 {
        self.token.get_kind()
    }

    fn set_kind(&self, kind: i32) {
        self.token.set_kind(kind);
    }

    fn get_start_offset(&self) -> i32 {
        self.token.get_start_offset()
    }

    fn set_start_offset(&self, start_offset: i32) {
        self.token.set_start_offset(start_offset);
    }

    fn get_end_offset(&self) -> i32 {
        self.token.get_end_offset()
    }

    fn set_end_offset(&self, end_offset: i32) {
        self.token.set_end_offset(end_offset);
    }

    fn get_token_index(&self) -> i32 {
        self.token.get_token_index()
    }

    fn set_token_index(&self, i: i32) {
        self.token.set_token_index(i);
    }

    fn get_adjunct_index(&self) -> i32 {
        self.token.get_adjunct_index()
    }

    fn set_adjunct_index(&self, i: i32) {
        self.token.set_adjunct_index(i);
    }

    fn get_preceding_adjuncts(&self) -> Vec<Rc<dyn IToken>> {
        self.first_token
            .as_ref()
            .map(|t| t.get_preceding_adjuncts())
            .unwrap_or_default()
    }

    fn get_following_adjuncts(&self) -> Vec<Rc<dyn IToken>> {
        self.last_token
            .as_ref()
            .map(|t| t.get_following_adjuncts())
            .unwrap_or_default()
    }

    fn get_i_lex_stream(&self) -> Option<Rc<std::cell::RefCell<dyn crate::traits::ILexStream>>> {
        self.token.get_i_lex_stream()
    }

    fn get_i_prs_stream(&self) -> Option<Rc<std::cell::RefCell<dyn crate::traits::IPrsStream>>> {
        self.token.get_i_prs_stream()
    }

    fn get_line(&self) -> i32 {
        self.token.get_line()
    }

    fn get_column(&self) -> i32 {
        self.token.get_column()
    }

    fn get_end_line(&self) -> i32 {
        self.token.get_end_line()
    }

    fn get_end_column(&self) -> i32 {
        self.token.get_end_column()
    }

    fn to_string(&self) -> String {
        self.token.to_string()
    }

    fn as_error_token(&self) -> Option<&ErrorToken> {
        Some(self)
    }
}
