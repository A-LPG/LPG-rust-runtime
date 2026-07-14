// mod lpg
#[derive(Clone, Copy, Debug, Default)]
pub struct LPGParserprs;

impl LPGParserprs {
    pub fn new() -> Self {
        LPGParserprs
    }
}

pub const LPGParserprs_ERROR_SYMBOL: i32 = 47;
pub const LPGParserprs_SCOPE_UBOUND: i32 = -1;
pub const LPGParserprs_SCOPE_SIZE: i32 = 0;
pub const LPGParserprs_MAX_NAME_LENGTH: i32 = 27;
pub const LPGParserprs_NUM_STATES: i32 = 105;
pub const LPGParserprs_NT_OFFSET: i32 = 47;
pub const LPGParserprs_LA_STATE_OFFSET: i32 = 601;
pub const LPGParserprs_MAX_LA: i32 = 3;
pub const LPGParserprs_NUM_RULES: i32 = 147;
pub const LPGParserprs_NUM_NONTERMINALS: i32 = 68;
pub const LPGParserprs_NUM_SYMBOLS: i32 = 115;
pub const LPGParserprs_START_STATE: i32 = 200;
pub const LPGParserprs_IDENTIFIER_SYMBOL: i32 = 0;
pub const LPGParserprs_EOFT_SYMBOL: i32 = 36;
pub const LPGParserprs_EOLT_SYMBOL: i32 = 36;
pub const LPGParserprs_ACCEPT_ACTION: i32 = 453;
pub const LPGParserprs_ERROR_ACTION: i32 = 454;
pub const LPGParserprs_BACKTRACK: bool = false;

static LPGParserprs_is_nullable: &[i32] = &[0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,1,0,0,
            0,0,0,1,0,1,1,0,0,0,
            0,0,0,0,1,0,1,0,0,0,
            1,1,1,0,0,1,0,0,0,0,
            0,0,1,0,0,0,0,0,1,0,
            0,1,0,1,1,0,0,1,0,0,
            1,0,0,0,1,1,0,0,0,1,
            1,0,0,0,0,
];

static LPGParserprs_prostheses_index: &[i32] = &[0,
            7,35,42,43,36,52,38,51,57,58,
            19,31,34,37,39,40,48,50,53,59,
            62,63,65,2,3,4,5,6,8,9,
            10,11,12,13,14,15,16,17,18,20,
            21,22,23,24,25,26,27,28,29,30,
            32,33,41,44,45,46,47,49,54,55,
            56,60,61,64,66,67,68,1,
];

static LPGParserprs_is_keyword: &[i32] = &[0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,
];

static LPGParserprs_base_check: &[i32] = &[0,
            2,0,2,3,3,3,3,3,3,3,
            3,3,3,3,3,3,3,3,3,3,
            3,3,3,3,3,3,0,2,2,1,
            3,2,0,2,4,1,3,1,2,3,
            3,3,3,3,3,1,1,1,1,1,
            1,1,1,1,1,2,2,1,1,1,
            1,1,1,1,2,1,2,1,1,2,
            0,2,2,2,1,2,1,2,4,0,
            1,1,1,2,1,3,1,2,3,1,
            1,1,1,1,1,1,2,2,0,2,
            3,1,2,3,1,3,1,1,1,1,
            2,0,2,1,2,0,1,0,1,1,
            1,2,1,1,1,2,2,0,2,1,
            1,1,1,2,4,1,3,0,2,2,
            0,2,1,0,1,0,2,-10,-12,-15,
            0,0,-70,-28,-16,0,0,0,-26,0,
            -37,0,0,0,0,0,0,0,0,0,
            -2,-45,0,0,0,-40,0,0,0,-59,
            0,0,0,0,-47,0,-3,0,0,0,
            0,0,0,-93,0,0,-63,0,-104,-1,
            -100,-5,0,0,0,-11,-8,0,0,0,
            0,0,0,0,-9,-13,0,-38,-20,0,
            0,0,0,0,0,0,0,-14,-21,0,
            -19,0,0,0,-24,0,-22,0,-23,0,
            -27,0,-25,-31,0,0,-76,0,0,-32,
            0,0,0,-29,0,-33,0,0,-7,0,
            -6,-30,0,0,-39,0,0,0,0,0,
            0,0,-43,0,-55,0,0,0,0,-44,
            0,0,-89,0,-86,0,-54,0,0,-17,
            0,-102,-4,-34,-18,0,-35,0,-36,0,
            0,0,0,-50,0,0,0,0,0,0,
            -60,-41,0,0,-42,0,0,-73,-46,0,
            0,-48,0,-49,0,-51,0,-96,0,-52,
            0,0,0,-53,-56,0,-64,0,0,0,
            -57,0,-58,0,-61,0,-62,-65,-78,0,
            0,-66,-67,0,0,-85,-68,0,0,-69,
            -74,0,-75,0,-77,-90,0,-79,0,-80,
            0,-81,0,-82,0,-83,0,-95,0,-84,
            0,-87,0,0,0,0,-101,-103,0,-71,
            -72,-88,-91,-92,0,-94,-97,-98,-99,-105,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,
];
static LPGParserprs_rhs: &[i32] = LPGParserprs_base_check;


static LPGParserprs_base_action: &[i32] = &[
            24,24,26,26,27,27,27,27,27,27,
            27,27,27,27,27,27,27,27,27,27,
            27,27,27,27,27,27,27,25,25,49,
            50,50,12,51,51,51,52,52,28,28,
            13,13,13,13,13,13,14,5,5,5,
            5,5,5,5,29,30,30,15,16,16,
            53,32,31,33,34,34,35,35,36,37,
            38,54,54,55,55,56,56,57,57,17,
            58,58,39,11,11,8,8,40,40,19,
            6,6,6,6,6,6,41,41,42,59,
            59,60,61,61,61,18,18,2,2,2,
            2,9,10,10,62,62,63,63,20,20,
            4,43,43,21,21,44,44,22,64,64,
            3,3,45,46,46,23,65,65,48,48,
            66,47,47,67,1,1,7,7,80,80,
            134,218,312,212,147,80,319,83,312,186,
            176,6,22,83,218,31,185,38,337,87,
            125,83,111,17,55,311,6,20,319,312,
            76,6,197,126,84,6,16,201,312,180,
            172,88,161,84,199,56,311,115,4,199,
            40,150,212,105,201,119,173,243,105,201,
            39,337,399,293,30,137,137,400,163,137,
            361,111,299,273,171,187,334,121,232,232,
            133,80,96,66,69,80,28,80,61,80,
            64,137,63,80,152,26,62,270,347,265,
            224,25,254,256,238,330,228,24,315,132,
            297,87,89,113,287,43,21,341,326,280,
            345,275,335,254,343,6,10,147,65,134,
            230,18,127,276,97,235,122,230,11,119,
            247,67,199,75,159,250,318,252,23,253,
            77,106,201,147,161,135,250,100,382,244,
            139,259,172,32,363,252,19,142,268,159,
            3,365,252,15,252,14,252,13,287,322,
            252,12,247,324,256,252,9,159,147,368,
            378,252,8,252,7,252,5,261,159,226,
            370,147,159,159,372,374,272,159,349,376,
            159,134,380,134,57,134,278,129,129,86,
            129,89,129,45,129,44,129,43,285,42,
            129,41,159,285,194,40,387,159,294,199,
            94,266,262,200,280,78,282,290,292,274,
            283,454,454,454,72,454,454,454,393,454,
            454,454,454,454,454,454,454,454,454,454,
            454,454,397,454,454,454,454,454,454,454,
            454,454,454,454,454,454,454,454,454,454,
            454,454,454,454,454,454,454,454,454,454,
            454,115,454,454,
];
static LPGParserprs_lhs: &[i32] = LPGParserprs_base_action;


static LPGParserprs_term_check: &[i32] = &[0,
            0,1,2,3,4,0,1,2,3,9,
            10,11,12,13,14,15,16,17,18,19,
            20,21,22,23,24,25,26,27,28,29,
            30,31,32,33,34,35,36,0,1,0,
            3,4,0,1,2,3,9,10,11,12,
            13,14,15,16,17,18,19,20,21,22,
            23,24,25,26,27,28,29,30,31,32,
            33,34,35,36,0,0,1,2,3,0,
            1,2,0,9,10,11,0,13,0,15,
            16,17,18,0,1,21,22,23,24,25,
            26,27,28,29,30,31,32,33,34,35,
            0,1,2,3,0,1,2,3,36,9,
            10,11,12,9,10,11,38,13,0,1,
            2,0,39,0,1,2,0,9,10,11,
            12,13,9,10,11,12,0,1,2,0,
            1,0,1,4,3,9,10,11,0,13,
            0,12,0,5,6,7,8,5,6,7,
            8,0,0,1,2,0,5,6,7,8,
            5,6,7,8,0,0,1,2,0,5,
            6,7,8,5,6,7,8,0,0,0,
            0,0,5,6,7,8,5,6,7,8,
            0,0,1,0,0,5,6,7,8,5,
            6,7,8,0,1,0,3,0,1,0,
            3,0,3,4,0,4,37,0,4,40,
            0,41,0,1,19,20,0,1,14,0,
            1,0,0,0,3,0,4,4,0,4,
            0,0,4,2,4,0,1,0,1,0,
            1,0,1,0,37,0,1,0,1,0,
            1,0,0,2,0,1,0,14,2,0,
            1,0,1,0,0,2,14,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,
];

static LPGParserprs_term_action: &[i32] = &[0,
            118,388,639,388,388,144,584,585,599,388,
            388,388,388,388,388,388,388,388,388,388,
            388,388,388,388,388,388,388,388,388,388,
            388,388,388,388,388,388,388,118,388,27,
            388,388,144,577,578,599,388,388,388,388,
            388,388,388,388,388,388,388,388,388,388,
            388,388,388,388,388,388,388,388,388,388,
            388,388,388,388,1,144,513,512,599,454,
            584,585,454,239,235,231,138,243,33,154,
            241,159,261,454,488,237,229,219,295,290,
            155,150,228,259,216,149,206,148,215,207,
            144,544,545,599,144,348,500,599,453,790,
            786,777,546,816,812,799,390,803,454,501,
            502,141,356,454,544,545,146,503,504,507,
            506,505,547,548,549,546,454,348,500,118,
            602,144,391,574,599,360,357,352,454,353,
            71,568,128,561,562,563,564,561,562,563,
            564,85,454,577,578,144,561,562,563,564,
            549,549,549,549,144,454,513,512,144,548,
            548,548,548,547,547,547,547,144,112,454,
            2,144,352,352,352,352,353,353,353,353,
            144,454,262,454,144,357,357,357,357,360,
            360,360,360,144,597,70,599,144,294,144,
            599,454,599,574,118,574,398,29,574,489,
            454,202,454,294,283,366,454,536,394,454,
            304,144,132,99,599,68,574,574,454,574,
            54,102,514,396,574,454,594,454,590,98,
            392,454,490,101,153,454,328,454,529,454,
            591,103,79,558,74,328,80,292,535,73,
            530,454,491,116,454,571,292,
];

static LPGParserprs_asb: &[i32] = &[0,
            129,186,129,163,125,100,100,125,68,34,
            34,34,67,93,1,34,125,125,34,68,
            93,34,34,34,34,34,68,30,128,127,
            100,100,100,192,162,68,99,95,99,99,
            95,162,67,68,8,192,99,162,162,160,
            162,162,68,68,99,162,162,162,99,93,
            162,68,99,192,192,192,192,192,192,125,
            188,125,125,1,1,100,1,160,29,29,
            29,29,29,29,125,38,192,191,125,125,
            197,125,37,191,159,191,159,125,39,156,
            192,156,155,156,158,
];

static LPGParserprs_asr: &[i32] = &[0,
            1,2,12,9,10,11,0,15,16,17,
            18,21,22,23,24,25,26,27,28,29,
            30,31,32,33,34,35,36,3,12,9,
            10,13,11,1,2,0,12,4,15,16,
            17,18,3,9,10,13,21,22,23,11,
            24,25,26,27,28,29,30,31,32,33,
            34,35,36,1,14,0,1,15,16,17,
            18,3,9,10,13,21,22,23,11,24,
            25,26,27,28,29,30,31,32,33,34,
            35,36,4,0,5,6,7,8,2,15,
            16,17,18,3,9,10,13,21,22,23,
            11,24,25,26,27,28,29,30,31,32,
            33,34,35,36,1,0,38,37,15,16,
            17,18,9,10,13,21,22,23,11,24,
            25,26,27,28,41,29,30,31,32,33,
            34,35,36,0,2,12,4,14,1,19,
            20,3,15,16,17,13,10,9,21,22,
            23,11,24,25,26,27,28,30,31,32,
            33,34,35,29,18,36,0,1,39,0,
            2,5,6,7,8,0,40,37,0,
];

static LPGParserprs_nasb: &[i32] = &[0,
            32,31,23,93,37,76,74,41,43,13,
            39,13,43,48,1,13,91,95,52,43,
            50,56,58,54,60,9,43,6,31,78,
            62,68,71,46,30,87,12,45,80,12,
            46,30,83,86,15,46,12,30,30,97,
            30,30,87,86,12,30,30,30,19,99,
            30,87,28,46,46,46,46,46,46,4,
            31,31,101,17,17,65,17,105,111,111,
            111,111,111,111,107,35,46,31,89,109,
            31,31,26,31,113,103,31,31,31,34,
            46,26,115,26,31,
];

static LPGParserprs_nasr: &[i32] = &[0,
            6,40,0,12,0,14,28,0,16,30,
            0,1,3,0,1,19,6,0,16,1,
            15,0,26,49,0,10,0,14,13,1,
            0,25,0,62,20,0,50,0,43,0,
            46,0,7,0,64,2,0,41,0,35,
            0,37,0,32,0,34,0,33,0,31,
            0,1,66,0,61,60,0,1,67,0,
            1,23,0,47,0,48,0,51,0,1,
            21,0,59,4,0,1,4,0,57,0,
            39,0,27,0,38,0,54,0,53,0,
            65,0,58,0,55,0,52,0,56,0,
            5,0,17,0,63,0,
];

static LPGParserprs_terminal_index: &[i32] = &[0,
            45,44,21,46,1,2,3,4,22,23,
            28,20,24,5,14,15,16,17,18,19,
            25,26,27,29,30,31,32,33,35,36,
            37,38,39,40,41,42,7,6,8,9,
            34,10,11,12,43,47,48,
];

static LPGParserprs_nonterminal_index: &[i32] = &[0,
            0,71,77,78,72,84,0,83,0,0,
            60,68,70,73,74,75,82,0,85,0,
            89,90,91,0,0,0,49,50,0,51,
            52,53,54,55,56,0,57,58,59,61,
            62,0,63,64,0,65,0,0,66,67,
            0,69,76,0,79,80,81,0,0,86,
            87,88,0,0,92,93,94,0,
];
static LPGParserprs_scope_prefix: &[i32] = &[];
static LPGParserprs_scope_suffix: &[i32] = &[];
static LPGParserprs_scope_lhs: &[i32] = &[];
static LPGParserprs_scope_la: &[i32] = &[];
static LPGParserprs_scope_state_set: &[i32] = &[];
static LPGParserprs_scope_rhs: &[i32] = &[];
static LPGParserprs_scope_state: &[i32] = &[];
static LPGParserprs_in_symb: &[i32] = &[];


static LPGParserprs_name: &[&str] = &[
            "",
            "::=",
            "::=?",
            "->",
            "->?",
            "|",
            "=",
            ",",
            "(",
            ")",
            "[",
            "]",
            "#",
            "$empty",
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
            "VBAR",
            "ERROR_TOKEN",
            "LPG_item",
            "alias_segment",
            "define_segment",
            "eof_segment",
            "eol_segment",
            "error_segment",
            "export_segment",
            "globals_segment",
            "identifier_segment",
            "import_segment",
            "include_segment",
            "keywords_segment",
            "names_segment",
            "notice_segment",
            "start_segment",
            "terminals_segment",
            "types_segment",
            "option_spec",
            "option_list",
            "option",
            "symbol_list",
            "aliasSpec",
            "produces",
            "alias_rhs",
            "alias_lhs_macro_name",
            "defineSpec",
            "macro_name_symbol",
            "macro_segment",
            "terminal_symbol",
            "action_segment",
            "drop_command",
            "drop_symbols",
            "drop_rules",
            "drop_rule",
            "keywordSpec",
            "name",
            "nameSpec",
            "nonTerm",
            "ruleNameWithAttributes",
            "symWithAttrs",
            "start_symbol",
            "terminal",
            "type_declarations",
            "barSymbolList",
            "symbol_pair",
            "recover_symbol",
];

impl lpg2::traits::ParseTable for LPGParserprs {
    fn get_error_symbol(&self) -> i32 {
        LPGParserprs_ERROR_SYMBOL
    }
    fn get_scope_ubound(&self) -> i32 {
        LPGParserprs_SCOPE_UBOUND
    }
    fn get_scope_size(&self) -> i32 {
        LPGParserprs_SCOPE_SIZE
    }
    fn get_max_name_length(&self) -> i32 {
        LPGParserprs_MAX_NAME_LENGTH
    }
    fn get_num_states(&self) -> i32 {
        LPGParserprs_NUM_STATES
    }
    fn get_nt_offset(&self) -> i32 {
        LPGParserprs_NT_OFFSET
    }
    fn get_la_state_offset(&self) -> i32 {
        LPGParserprs_LA_STATE_OFFSET
    }
    fn get_max_la(&self) -> i32 {
        LPGParserprs_MAX_LA
    }
    fn get_num_rules(&self) -> i32 {
        LPGParserprs_NUM_RULES
    }
    fn get_num_nonterminals(&self) -> i32 {
        LPGParserprs_NUM_NONTERMINALS
    }
    fn get_num_symbols(&self) -> i32 {
        LPGParserprs_NUM_SYMBOLS
    }
    fn get_start_state(&self) -> i32 {
        LPGParserprs_START_STATE
    }
    fn get_eoft_symbol(&self) -> i32 {
        LPGParserprs_EOFT_SYMBOL
    }
    fn get_eolt_symbol(&self) -> i32 {
        LPGParserprs_EOLT_SYMBOL
    }
    fn get_accept_action(&self) -> i32 {
        LPGParserprs_ACCEPT_ACTION
    }
    fn get_error_action(&self) -> i32 {
        LPGParserprs_ERROR_ACTION
    }
    fn get_backtrack(&self) -> bool {
        LPGParserprs_BACKTRACK
    }
    fn get_start_symbol(&self) -> i32 {
        self.lhs(0)
    }

    fn is_valid_for_parser(&self) -> bool {
        true
    }

    fn is_nullable(&self, symbol: i32) -> bool {
        LPGParserprs_is_nullable[symbol as usize] != 0
    }
    fn base_check(&self, index: i32) -> i32 {
        LPGParserprs_base_check[index as usize]
    }
    fn rhs(&self, index: i32) -> i32 {
        LPGParserprs_rhs[index as usize]
    }

    fn base_action(&self, index: i32) -> i32 {
        LPGParserprs_base_action[index as usize]
    }
    fn lhs(&self, index: i32) -> i32 {
        LPGParserprs_lhs[index as usize]
    }

    fn term_check(&self, index: i32) -> i32 {
        LPGParserprs_term_check[index as usize]
    }
    fn term_action(&self, index: i32) -> i32 {
        LPGParserprs_term_action[index as usize]
    }
    fn asb(&self, index: i32) -> i32 {
        LPGParserprs_asb[index as usize]
    }
    fn asr(&self, index: i32) -> i32 {
        LPGParserprs_asr[index as usize]
    }
    fn nasb(&self, index: i32) -> i32 {
        LPGParserprs_nasb[index as usize]
    }
    fn nasr(&self, index: i32) -> i32 {
        LPGParserprs_nasr[index as usize]
    }
    fn terminal_index(&self, index: i32) -> i32 {
        LPGParserprs_terminal_index[index as usize]
    }
    fn nonterminal_index(&self, index: i32) -> i32 {
        LPGParserprs_nonterminal_index[index as usize]
    }
    fn scope_prefix(&self, _index: i32) -> i32 { 0 }

    fn scope_suffix(&self, _index: i32) -> i32 { 0 }

    fn scope_lhs(&self, _index: i32) -> i32 { 0 }

    fn scope_la(&self, _index: i32) -> i32 { 0 }

    fn scope_state_set(&self, _index: i32) -> i32 { 0 }

    fn scope_rhs(&self, _index: i32) -> i32 { 0 }

    fn scope_state(&self, _index: i32) -> i32 { 0 }

    fn in_symb(&self, _index: i32) -> i32 { 0 }

    fn name(&self, index: i32) -> String {
        LPGParserprs_name[index as usize].to_string()
    }
    fn original_state(&self, state: i32) -> i32 {
        -LPGParserprs_base_check[state as usize]
    }

    fn asi(&self, state: i32) -> i32 {
        LPGParserprs_asb[self.original_state(state) as usize]
    }

    fn nasi(&self, state: i32) -> i32 {
        LPGParserprs_nasb[self.original_state(state) as usize]
    }

    fn in_symbol(&self, state: i32) -> i32 {
        LPGParserprs_in_symb[self.original_state(state) as usize]
    }

    fn nt_action(&self, state: i32, sym: i32) -> i32 {
        LPGParserprs_base_action[(state + sym) as usize]
    }

    fn t_action(&self, act: i32, sym: i32) -> i32 {
        let i = LPGParserprs_base_action[act as usize];
        let k = i + sym;
        let index = if LPGParserprs_term_check[k as usize] == sym { k } else { i };
        LPGParserprs_term_action[index as usize]
    }

    fn look_ahead(&self, la_state: i32, sym: i32) -> i32 {
        let k = la_state + sym;
        let index = if LPGParserprs_term_check[k as usize] == sym { k } else { la_state };
        LPGParserprs_term_action[index as usize]
    }

}

