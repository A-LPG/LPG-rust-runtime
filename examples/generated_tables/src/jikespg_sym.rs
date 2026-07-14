pub struct jikespg_sym;

impl jikespg_sym {
    pub const TK_DROPSYMBOLS_KEY: i32 = 34;
    pub const TK_DROPACTIONS_KEY: i32 = 35;
    pub const TK_DROPRULES_KEY: i32 = 36;
    pub const TK_NOTICE_KEY: i32 = 11;
    pub const TK_AST_KEY: i32 = 12;
    pub const TK_GLOBALS_KEY: i32 = 13;
    pub const TK_DEFINE_KEY: i32 = 14;
    pub const TK_TERMINALS_KEY: i32 = 15;
    pub const TK_SOFTKEYWORDS_KEY: i32 = 16;
    pub const TK_EOL_KEY: i32 = 6;
    pub const TK_EOF_KEY: i32 = 9;
    pub const TK_ERROR_KEY: i32 = 7;
    pub const TK_IDENTIFIER_KEY: i32 = 8;
    pub const TK_ALIAS_KEY: i32 = 17;
    pub const TK_EMPTY_KEY: i32 = 3;
    pub const TK_START_KEY: i32 = 18;
    pub const TK_TYPES_KEY: i32 = 19;
    pub const TK_RULES_KEY: i32 = 20;
    pub const TK_NAMES_KEY: i32 = 21;
    pub const TK_END_KEY: i32 = 4;
    pub const TK_HEADERS_KEY: i32 = 22;
    pub const TK_TRAILERS_KEY: i32 = 23;
    pub const TK_EXPORT_KEY: i32 = 24;
    pub const TK_IMPORT_KEY: i32 = 25;
    pub const TK_INCLUDE_KEY: i32 = 26;
    pub const TK_RECOVER_KEY: i32 = 27;
    pub const TK_DISJOINTPREDECESSORSETS_KEY: i32 = 28;
    pub const TK_EQUIVALENCE: i32 = 30;
    pub const TK_PRIORITY_EQUIVALENCE: i32 = 31;
    pub const TK_ARROW: i32 = 32;
    pub const TK_PRIORITY_ARROW: i32 = 33;
    pub const TK_OR_MARKER: i32 = 10;
    pub const TK_MACRO_NAME: i32 = 5;
    pub const TK_SYMBOL: i32 = 1;
    pub const TK_BLOCK: i32 = 2;
    pub const TK_EOF: i32 = 29;
    pub const TK_ERROR_SYMBOL: i32 = 37;

    pub const ORDERED_TERMINAL_SYMBOLS: &[&str] = &[
        "",
        "SYMBOL",
        "BLOCK",
        "EMPTY_KEY",
        "END_KEY",
        "MACRO_NAME",
        "EOL_KEY",
        "ERROR_KEY",
        "IDENTIFIER_KEY",
        "EOF_KEY",
        "OR_MARKER",
        "NOTICE_KEY",
        "AST_KEY",
        "GLOBALS_KEY",
        "DEFINE_KEY",
        "TERMINALS_KEY",
        "SOFTKEYWORDS_KEY",
        "ALIAS_KEY",
        "START_KEY",
        "TYPES_KEY",
        "RULES_KEY",
        "NAMES_KEY",
        "HEADERS_KEY",
        "TRAILERS_KEY",
        "EXPORT_KEY",
        "IMPORT_KEY",
        "INCLUDE_KEY",
        "RECOVER_KEY",
        "DISJOINTPREDECESSORSETS_KEY",
        "EOF",
        "EQUIVALENCE",
        "PRIORITY_EQUIVALENCE",
        "ARROW",
        "PRIORITY_ARROW",
        "DROPSYMBOLS_KEY",
        "DROPACTIONS_KEY",
        "DROPRULES_KEY",
        "ERROR_SYMBOL",
    ];

    pub const NUM_TOKEN_KINDS: i32 = 37;

    pub const IS_VALID_FOR_PARSER: bool = true;
}
