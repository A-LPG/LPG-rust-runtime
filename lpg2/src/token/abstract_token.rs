use std::cell::Cell;
use std::rc::{Rc, Weak};

use crate::traits::{ILexStream, IPrsStream, PrsStreamRef};

use std::cell::RefCell;

/// Base token fields shared by `Token` and `Adjunct`.
pub struct AbstractToken {
    kind: Cell<i32>,
    start_offset: Cell<i32>,
    end_offset: Cell<i32>,
    token_index: Cell<i32>,
    adjunct_index: Cell<i32>,
    i_prs_stream: RefCell<Option<Weak<RefCell<dyn IPrsStream>>>>,
}

impl AbstractToken {
    pub fn new(
        start_offset: i32,
        end_offset: i32,
        kind: i32,
        i_prs_stream: Option<Weak<RefCell<dyn IPrsStream>>>,
    ) -> Self {
        Self {
            kind: Cell::new(kind),
            start_offset: Cell::new(start_offset),
            end_offset: Cell::new(end_offset),
            token_index: Cell::new(0),
            adjunct_index: Cell::new(0),
            i_prs_stream: RefCell::new(i_prs_stream),
        }
    }

    pub fn get_kind(&self) -> i32 {
        self.kind.get()
    }

    pub fn set_kind(&self, kind: i32) {
        self.kind.set(kind);
    }

    pub fn get_start_offset(&self) -> i32 {
        self.start_offset.get()
    }

    pub fn set_start_offset(&self, start_offset: i32) {
        self.start_offset.set(start_offset);
    }

    pub fn get_end_offset(&self) -> i32 {
        self.end_offset.get()
    }

    pub fn set_end_offset(&self, end_offset: i32) {
        self.end_offset.set(end_offset);
    }

    pub fn get_token_index(&self) -> i32 {
        self.token_index.get()
    }

    pub fn set_token_index(&self, token_index: i32) {
        self.token_index.set(token_index);
    }

    pub fn get_adjunct_index(&self) -> i32 {
        self.adjunct_index.get()
    }

    pub fn set_adjunct_index(&self, adjunct_index: i32) {
        self.adjunct_index.set(adjunct_index);
    }

    pub fn get_i_prs_stream_weak(&self) -> Option<Weak<RefCell<dyn IPrsStream>>> {
        self.i_prs_stream.borrow().clone()
    }

    pub fn set_i_prs_stream(&self, stream: Option<Weak<RefCell<dyn IPrsStream>>>) {
        *self.i_prs_stream.borrow_mut() = stream;
    }

    pub fn get_i_prs_stream(&self) -> Option<PrsStreamRef> {
        self.i_prs_stream.borrow().as_ref()?.upgrade()
    }

    pub fn get_i_lex_stream(&self) -> Option<Rc<RefCell<dyn ILexStream>>> {
        self.get_i_prs_stream()?.borrow().get_i_lex_stream()
    }

    pub fn get_line(&self) -> i32 {
        if let Some(stream) = self.get_i_prs_stream() {
            if let Some(lex) = stream.borrow().get_i_lex_stream() {
                return lex
                    .borrow()
                    .get_line_number_of_char_at(self.start_offset.get());
            }
        }
        0
    }

    pub fn get_column(&self) -> i32 {
        if let Some(stream) = self.get_i_prs_stream() {
            if let Some(lex) = stream.borrow().get_i_lex_stream() {
                return lex.borrow().get_column_of_char_at(self.start_offset.get());
            }
        }
        0
    }

    pub fn get_end_line(&self) -> i32 {
        if let Some(stream) = self.get_i_prs_stream() {
            if let Some(lex) = stream.borrow().get_i_lex_stream() {
                return lex
                    .borrow()
                    .get_line_number_of_char_at(self.end_offset.get());
            }
        }
        0
    }

    pub fn get_end_column(&self) -> i32 {
        if let Some(stream) = self.get_i_prs_stream() {
            if let Some(lex) = stream.borrow().get_i_lex_stream() {
                return lex.borrow().get_column_of_char_at(self.end_offset.get());
            }
        }
        0
    }
}
