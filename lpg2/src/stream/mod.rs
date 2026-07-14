//! Concrete [`LexStream`] and [`PrsStream`] implementations.
//!
//! Circular references between lexer and parser streams use `Rc<RefCell<>>`;
//! tokens hold a [`PrsStreamWeak`] for line/column lookup.

mod lex_stream_impl;
mod prs_stream_impl;

pub use lex_stream_impl::LexStream;
pub use prs_stream_impl::PrsStream;

pub use crate::traits::{LexStreamRef, PrsStreamRef, PrsStreamWeak};
