// mod lpg
pub struct LPGParsersym;

impl LPGParsersym {
    pub const TK_EQUIVALENCE: i32 = 5;
    pub const TK_PRIORITY_EQUIVALENCE: i32 = 6;
    pub const TK_ARROW: i32 = 7;
    pub const TK_PRIORITY_ARROW: i32 = 8;
    pub const TK_OR_MARKER: i32 = 14;
    pub const TK_EQUAL: i32 = 38;
    pub const TK_COMMA: i32 = 37;
    pub const TK_LEFT_PAREN: i32 = 39;
    pub const TK_RIGHT_PAREN: i32 = 40;
    pub const TK_LEFT_BRACKET: i32 = 42;
    pub const TK_RIGHT_BRACKET: i32 = 43;
    pub const TK_SHARP: i32 = 44;
    pub const TK_ALIAS_KEY: i32 = 15;
    pub const TK_AST_KEY: i32 = 16;
    pub const TK_DEFINE_KEY: i32 = 17;
    pub const TK_DISJOINTPREDECESSORSETS_KEY: i32 = 18;
    pub const TK_DROPRULES_KEY: i32 = 19;
    pub const TK_DROPSYMBOLS_KEY: i32 = 20;
    pub const TK_EMPTY_KEY: i32 = 12;
    pub const TK_END_KEY: i32 = 3;
    pub const TK_ERROR_KEY: i32 = 9;
    pub const TK_EOL_KEY: i32 = 10;
    pub const TK_EOF_KEY: i32 = 13;
    pub const TK_EXPORT_KEY: i32 = 21;
    pub const TK_GLOBALS_KEY: i32 = 22;
    pub const TK_HEADERS_KEY: i32 = 23;
    pub const TK_IDENTIFIER_KEY: i32 = 11;
    pub const TK_IMPORT_KEY: i32 = 24;
    pub const TK_INCLUDE_KEY: i32 = 25;
    pub const TK_KEYWORDS_KEY: i32 = 26;
    pub const TK_NAMES_KEY: i32 = 27;
    pub const TK_NOTICE_KEY: i32 = 28;
    pub const TK_OPTIONS_KEY: i32 = 41;
    pub const TK_RECOVER_KEY: i32 = 29;
    pub const TK_RULES_KEY: i32 = 30;
    pub const TK_SOFT_KEYWORDS_KEY: i32 = 31;
    pub const TK_START_KEY: i32 = 32;
    pub const TK_TERMINALS_KEY: i32 = 33;
    pub const TK_TRAILERS_KEY: i32 = 34;
    pub const TK_TYPES_KEY: i32 = 35;
    pub const TK_EOF_TOKEN: i32 = 36;
    pub const TK_SINGLE_LINE_COMMENT: i32 = 45;
    pub const TK_MACRO_NAME: i32 = 2;
    pub const TK_SYMBOL: i32 = 1;
    pub const TK_BLOCK: i32 = 4;
    pub const TK_VBAR: i32 = 46;
    pub const TK_ERROR_TOKEN: i32 = 47;

    pub const ORDERED_TERMINAL_SYMBOLS: &[&str] = &[
        "",
        "SYMBOL",
        "MACRO_NAME",
        "END_KEY",
        "BLOCK",
        "EQUIVALENCE",
        "PRIORITY_EQUIVALENCE",
        "ARROW",
        "PRIORITY_ARROW",
        "ERROR_KEY",
        "EOL_KEY",
        "IDENTIFIER_KEY",
        "EMPTY_KEY",
        "EOF_KEY",
        "OR_MARKER",
        "ALIAS_KEY",
        "AST_KEY",
        "DEFINE_KEY",
        "DISJOINTPREDECESSORSETS_KEY",
        "DROPRULES_KEY",
        "DROPSYMBOLS_KEY",
        "EXPORT_KEY",
        "GLOBALS_KEY",
        "HEADERS_KEY",
        "IMPORT_KEY",
        "INCLUDE_KEY",
        "KEYWORDS_KEY",
        "NAMES_KEY",
        "NOTICE_KEY",
        "RECOVER_KEY",
        "RULES_KEY",
        "SOFT_KEYWORDS_KEY",
        "START_KEY",
        "TERMINALS_KEY",
        "TRAILERS_KEY",
        "TYPES_KEY",
        "EOF_TOKEN",
        "COMMA",
        "EQUAL",
        "LEFT_PAREN",
        "RIGHT_PAREN",
        "OPTIONS_KEY",
        "LEFT_BRACKET",
        "RIGHT_BRACKET",
        "SHARP",
        "SINGLE_LINE_COMMENT",
        "VBAR",
        "ERROR_TOKEN",
    ];

    pub const NUM_TOKEN_KINDS: i32 = 47;

    pub const IS_VALID_FOR_PARSER: bool = true;
}
