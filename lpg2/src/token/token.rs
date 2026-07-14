use std::cell::RefCell;
use std::rc::{Rc, Weak};

use crate::traits::{IPrsStream, IToken, PrsStreamRef};

use super::abstract_token::AbstractToken;

/// Concrete token mirroring Go's `Token`.
pub struct Token {
    inner: AbstractToken,
}

impl Token {
    #[allow(clippy::new_ret_no_self)]
    pub fn new(
        start_offset: i32,
        end_offset: i32,
        kind: i32,
        i_prs_stream: Option<Weak<RefCell<dyn IPrsStream>>>,
    ) -> Rc<dyn IToken> {
        Rc::new(Self {
            inner: AbstractToken::new(start_offset, end_offset, kind, i_prs_stream),
        })
    }

    pub fn inner(&self) -> &AbstractToken {
        &self.inner
    }

    pub(crate) fn from_inner(inner: AbstractToken) -> Self {
        Self { inner }
    }
}

impl IToken for Token {
    fn get_kind(&self) -> i32 {
        self.inner.get_kind()
    }

    fn set_kind(&self, kind: i32) {
        self.inner.set_kind(kind);
    }

    fn get_start_offset(&self) -> i32 {
        self.inner.get_start_offset()
    }

    fn set_start_offset(&self, start_offset: i32) {
        self.inner.set_start_offset(start_offset);
    }

    fn get_end_offset(&self) -> i32 {
        self.inner.get_end_offset()
    }

    fn set_end_offset(&self, end_offset: i32) {
        self.inner.set_end_offset(end_offset);
    }

    fn get_token_index(&self) -> i32 {
        self.inner.get_token_index()
    }

    fn set_token_index(&self, i: i32) {
        self.inner.set_token_index(i);
    }

    fn get_adjunct_index(&self) -> i32 {
        self.inner.get_adjunct_index()
    }

    fn set_adjunct_index(&self, i: i32) {
        self.inner.set_adjunct_index(i);
    }

    fn get_preceding_adjuncts(&self) -> Vec<Rc<dyn IToken>> {
        if let Some(stream) = self.inner.get_i_prs_stream() {
            stream
                .borrow()
                .get_preceding_adjuncts(self.inner.get_token_index())
        } else {
            Vec::new()
        }
    }

    fn get_following_adjuncts(&self) -> Vec<Rc<dyn IToken>> {
        if let Some(stream) = self.inner.get_i_prs_stream() {
            stream
                .borrow()
                .get_following_adjuncts(self.inner.get_token_index())
        } else {
            Vec::new()
        }
    }

    fn get_i_lex_stream(&self) -> Option<Rc<RefCell<dyn crate::traits::ILexStream>>> {
        self.inner.get_i_lex_stream()
    }

    fn get_i_prs_stream(&self) -> Option<PrsStreamRef> {
        self.inner.get_i_prs_stream()
    }

    fn get_line(&self) -> i32 {
        self.inner.get_line()
    }

    fn get_column(&self) -> i32 {
        self.inner.get_column()
    }

    fn get_end_line(&self) -> i32 {
        self.inner.get_end_line()
    }

    fn get_end_column(&self) -> i32 {
        self.inner.get_end_column()
    }

    fn to_string(&self) -> String {
        if let Some(stream) = self.inner.get_i_prs_stream() {
            stream.borrow().to_string_tokens(self, self)
        } else {
            "<ToString>".to_string()
        }
    }
}
