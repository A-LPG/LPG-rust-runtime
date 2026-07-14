//! LPG self-parser integration test crate (generated lexer/parser).
//!
//! Sources are produced by `scripts/generate_lpg_test.sh` using LPG2
//! `programming_language=rust` templates. Generated files are included into
//! one module (Go-style package layout).

#![allow(non_snake_case)]
#![allow(non_upper_case_globals)]
#![allow(dead_code)]
#![allow(unused_imports)]
#![allow(unused_variables)]
#![allow(unused_parens)]
#![allow(private_interfaces)]
#![allow(clippy::all)]

use lpg2::prelude::*;
use lpg2::traits::ParseTable;
use std::any::Any;
use std::cell::RefCell;
use std::rc::Rc;

include!("LPGKWLexersym.rs");
include!("LPGKWLexerprs.rs");
include!("LPGKWLexer.rs");
include!("LPGLexersym.rs");
include!("LPGLexerprs.rs");
include!("LPGLexerexp.rs");
include!("LPGLexer.rs");
include!("LPGParsersym.rs");
include!("LPGParserprs.rs");
include!("LPGParser.rs");
