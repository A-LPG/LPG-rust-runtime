
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

pub struct LPGLexerexp;

impl LPGLexerexp {
    pub const ALIAS_KEY: i32 = 1;
    pub const AST_KEY: i32 = 2;
    pub const DEFINE_KEY: i32 = 3;
    pub const DISJOINTPREDECESSORSETS_KEY: i32 = 4;
    pub const DROPRULES_KEY: i32 = 5;
    pub const DROPSYMBOLS_KEY: i32 = 6;
    pub const EMPTY_KEY: i32 = 7;
    pub const END_KEY: i32 = 8;
    pub const ERROR_KEY: i32 = 9;
    pub const EOL_KEY: i32 = 10;
    pub const EOF_KEY: i32 = 11;
    pub const EXPORT_KEY: i32 = 12;
    pub const GLOBALS_KEY: i32 = 13;
    pub const HEADERS_KEY: i32 = 14;
    pub const IDENTIFIER_KEY: i32 = 15;
    pub const IMPORT_KEY: i32 = 16;
    pub const INCLUDE_KEY: i32 = 17;
    pub const KEYWORDS_KEY: i32 = 18;
    pub const NAMES_KEY: i32 = 19;
    pub const NOTICE_KEY: i32 = 20;
    pub const OPTIONS_KEY: i32 = 21;
    pub const RECOVER_KEY: i32 = 22;
    pub const RULES_KEY: i32 = 23;
    pub const SOFT_KEYWORDS_KEY: i32 = 24;
    pub const START_KEY: i32 = 25;
    pub const TERMINALS_KEY: i32 = 26;
    pub const TRAILERS_KEY: i32 = 27;
    pub const TYPES_KEY: i32 = 28;
    pub const EOF_TOKEN: i32 = 29;
    pub const SINGLE_LINE_COMMENT: i32 = 30;
    pub const MACRO_NAME: i32 = 31;
    pub const SYMBOL: i32 = 32;
    pub const BLOCK: i32 = 33;
    pub const EQUIVALENCE: i32 = 34;
    pub const PRIORITY_EQUIVALENCE: i32 = 35;
    pub const ARROW: i32 = 36;
    pub const PRIORITY_ARROW: i32 = 37;
    pub const OR_MARKER: i32 = 38;
    pub const EQUAL: i32 = 39;
    pub const COMMA: i32 = 40;
    pub const LEFT_PAREN: i32 = 41;
    pub const RIGHT_PAREN: i32 = 42;
    pub const LEFT_BRACKET: i32 = 43;
    pub const RIGHT_BRACKET: i32 = 44;
    pub const SHARP: i32 = 45;
    pub const VBAR: i32 = 46;

    pub const ORDERED_TERMINAL_SYMBOLS: &[&str] = &[
        "",
        "ALIAS_KEY",
        "AST_KEY",
        "DEFINE_KEY",
        "DISJOINTPREDECESSORSETS_KEY",
        "DROPRULES_KEY",
        "DROPSYMBOLS_KEY",
        "EMPTY_KEY",
        "END_KEY",
        "ERROR_KEY",
        "EOL_KEY",
        "EOF_KEY",
        "EXPORT_KEY",
        "GLOBALS_KEY",
        "HEADERS_KEY",
        "IDENTIFIER_KEY",
        "IMPORT_KEY",
        "INCLUDE_KEY",
        "KEYWORDS_KEY",
        "NAMES_KEY",
        "NOTICE_KEY",
        "OPTIONS_KEY",
        "RECOVER_KEY",
        "RULES_KEY",
        "SOFT_KEYWORDS_KEY",
        "START_KEY",
        "TERMINALS_KEY",
        "TRAILERS_KEY",
        "TYPES_KEY",
        "EOF_TOKEN",
        "SINGLE_LINE_COMMENT",
        "MACRO_NAME",
        "SYMBOL",
        "BLOCK",
        "EQUIVALENCE",
        "PRIORITY_EQUIVALENCE",
        "ARROW",
        "PRIORITY_ARROW",
        "OR_MARKER",
        "EQUAL",
        "COMMA",
        "LEFT_PAREN",
        "RIGHT_PAREN",
        "LEFT_BRACKET",
        "RIGHT_BRACKET",
        "SHARP",
        "VBAR",
    ];

    pub const NUM_TOKEN_KINDS: i32 = 46;
    pub const IS_VALID_FOR_PARSER: bool = false;
}
