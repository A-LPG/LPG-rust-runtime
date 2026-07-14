
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

// mod java
#[derive(Clone, Copy, Debug, Default)]
pub struct JavaKWLexerprs;

impl JavaKWLexerprs {
    pub fn new() -> Self {
        JavaKWLexerprs
    }
}

pub const JavaKWLexerprs_ERROR_SYMBOL: i32 = 0;
pub const JavaKWLexerprs_SCOPE_UBOUND: i32 = 0;
pub const JavaKWLexerprs_SCOPE_SIZE: i32 = 0;
pub const JavaKWLexerprs_MAX_NAME_LENGTH: i32 = 0;
pub const JavaKWLexerprs_NUM_STATES: i32 = 242;
pub const JavaKWLexerprs_NT_OFFSET: i32 = 40;
pub const JavaKWLexerprs_LA_STATE_OFFSET: i32 = 366;
pub const JavaKWLexerprs_MAX_LA: i32 = 1;
pub const JavaKWLexerprs_NUM_RULES: i32 = 60;
pub const JavaKWLexerprs_NUM_NONTERMINALS: i32 = 2;
pub const JavaKWLexerprs_NUM_SYMBOLS: i32 = 42;
pub const JavaKWLexerprs_START_STATE: i32 = 61;
pub const JavaKWLexerprs_IDENTIFIER_SYMBOL: i32 = 0;
pub const JavaKWLexerprs_EOFT_SYMBOL: i32 = 27;
pub const JavaKWLexerprs_EOLT_SYMBOL: i32 = 41;
pub const JavaKWLexerprs_ACCEPT_ACTION: i32 = 305;
pub const JavaKWLexerprs_ERROR_ACTION: i32 = 306;
pub const JavaKWLexerprs_BACKTRACK: bool = false;

static JavaKWLexerprs_is_nullable: &[i32] = &[0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,
];

static JavaKWLexerprs_prostheses_index: &[i32] = &[0,
            2,1,
];

static JavaKWLexerprs_is_keyword: &[i32] = &[0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
];

static JavaKWLexerprs_base_check: &[i32] = &[0,
            8,6,7,5,4,4,5,4,5,5,
            8,7,2,6,4,4,7,5,5,7,
            5,3,4,2,10,6,10,3,9,4,
            6,3,4,7,7,9,6,6,5,6,
            8,5,6,12,4,5,6,9,4,3,
            4,8,5,12,10,10,8,9,11,10,
];
static JavaKWLexerprs_rhs: &[i32] = JavaKWLexerprs_base_check;


static JavaKWLexerprs_base_action: &[i32] = &[
            1,1,1,1,1,1,1,1,1,1,
            1,1,1,1,1,1,1,1,1,1,
            1,1,1,1,1,1,1,1,1,1,
            1,1,1,1,1,1,1,1,1,1,
            1,1,1,1,1,1,1,1,1,1,
            1,1,1,1,1,1,1,1,1,1,
            1,1,63,71,33,14,117,63,21,119,
            47,51,120,45,123,23,57,79,39,60,
            73,85,126,89,6,68,67,93,127,129,
            124,94,133,136,139,95,140,143,24,144,
            147,104,141,152,77,155,157,149,162,158,
            164,165,166,167,170,172,106,177,179,182,
            183,184,185,186,188,190,191,196,195,197,
            199,206,207,204,205,215,217,218,220,222,
            223,225,226,228,229,230,233,236,238,241,
            31,243,246,247,235,254,251,255,258,259,
            108,260,265,261,264,275,268,276,278,281,
            279,284,110,285,287,289,294,290,296,297,
            298,299,301,305,302,304,312,314,317,319,
            307,321,324,325,326,331,329,333,263,337,
            338,339,340,342,343,346,348,351,353,354,
            358,361,347,363,366,367,368,365,372,376,
            377,379,380,382,383,385,388,392,393,395,
            396,398,401,400,402,403,409,411,415,417,
            418,421,406,423,428,112,425,431,430,434,
            436,438,439,442,443,444,447,449,452,450,
            454,455,456,460,466,462,464,471,472,473,
            477,478,476,483,479,484,488,489,495,493,
            497,498,500,490,507,509,511,502,513,516,
            518,520,522,523,528,524,512,529,532,533,
            534,544,536,535,306,306,
];
static JavaKWLexerprs_lhs: &[i32] = JavaKWLexerprs_base_action;


static JavaKWLexerprs_term_check: &[i32] = &[0,
            0,1,2,3,4,0,6,7,8,9,
            10,6,12,0,14,15,16,17,18,19,
            0,1,0,0,24,3,13,5,6,7,
            0,11,0,13,2,5,4,7,0,19,
            20,3,19,5,0,7,0,15,4,3,
            0,13,2,3,0,9,0,11,14,0,
            4,11,0,7,5,21,0,0,9,3,
            0,9,0,6,7,13,0,11,0,20,
            2,25,10,5,0,9,20,15,0,5,
            2,3,0,0,0,11,3,27,6,5,
            6,9,9,0,1,0,1,0,1,0,
            0,0,3,10,3,10,0,10,0,0,
            2,5,0,0,5,0,0,5,0,4,
            4,22,0,22,6,0,1,5,0,0,
            0,18,0,0,1,0,0,8,0,7,
            4,0,1,15,0,7,0,0,18,5,
            4,0,1,0,0,0,0,0,11,0,
            4,0,3,10,3,11,0,1,0,14,
            2,0,0,0,0,0,5,0,3,0,
            0,7,10,10,0,0,0,3,0,12,
            2,12,7,0,0,0,0,17,12,4,
            0,5,8,10,0,1,0,0,2,0,
            1,0,0,6,0,0,1,0,0,0,
            9,7,0,11,0,0,7,0,6,2,
            0,1,0,16,10,0,0,5,3,3,
            0,23,17,0,0,2,2,0,0,0,
            0,3,0,0,0,2,4,0,8,10,
            3,21,15,9,0,0,2,0,0,2,
            0,1,7,0,0,7,0,3,0,0,
            2,8,6,0,1,0,0,0,0,10,
            0,0,1,0,0,8,0,9,8,13,
            6,0,9,0,19,2,0,6,0,3,
            0,3,16,0,0,0,3,2,0,9,
            0,1,0,9,2,7,0,0,0,0,
            1,0,0,7,6,0,0,0,11,2,
            0,10,0,0,8,13,3,0,1,9,
            0,9,0,3,0,0,0,0,23,4,
            8,0,6,6,10,0,0,1,0,0,
            9,0,0,4,0,1,8,0,13,8,
            8,0,0,2,0,0,1,0,4,0,
            0,0,0,2,17,0,14,7,0,7,
            0,12,4,3,0,1,0,0,21,3,
            0,16,0,1,0,8,6,0,1,0,
            0,7,2,0,5,0,1,0,0,2,
            2,0,0,0,3,2,0,14,0,0,
            8,0,1,0,0,0,1,4,10,0,
            11,0,8,0,5,0,20,6,3,6,
            0,0,0,3,2,0,0,0,0,8,
            4,4,0,0,2,2,8,0,0,0,
            2,4,0,18,0,1,0,0,6,0,
            4,0,5,0,5,16,0,1,0,1,
            0,0,0,12,2,0,6,0,1,0,
            5,0,0,0,5,4,4,0,0,6,
            3,0,0,0,0,0,4,26,5,4,
            0,10,14,0,0,2,12,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,
];

static JavaKWLexerprs_term_action: &[i32] = &[0,
            306,67,76,80,71,306,73,72,78,69,
            68,127,77,306,75,79,66,74,70,65,
            306,91,306,306,64,107,84,104,106,105,
            306,90,306,92,82,193,81,194,306,89,
            88,116,338,113,306,114,306,83,101,96,
            306,115,98,99,306,95,306,94,330,306,
            109,97,306,110,119,102,306,306,118,131,
            306,86,306,129,128,87,306,130,306,117,
            112,108,120,111,306,328,356,121,306,123,
            126,125,306,306,306,122,138,305,133,142,
            143,132,137,306,148,306,163,306,201,306,
            306,306,212,149,268,164,306,202,306,306,
            93,85,306,306,100,306,306,103,306,124,
            134,211,306,267,135,306,140,139,306,306,
            306,136,306,306,146,306,306,144,306,145,
            147,306,151,141,306,154,306,306,150,152,
            153,306,155,306,13,306,306,306,156,306,
            160,306,161,157,162,158,306,165,306,159,
            166,306,306,306,306,306,167,306,171,306,
            306,170,168,169,306,306,306,176,306,172,
            355,173,175,306,306,306,306,174,357,177,
            306,178,179,351,306,180,306,306,181,306,
            183,306,306,182,306,306,187,306,306,306,
            184,186,306,185,306,306,339,28,190,191,
            306,192,306,188,197,306,306,329,195,196,
            306,189,336,306,306,198,321,306,306,306,
            306,200,306,306,306,312,233,306,204,203,
            205,322,199,314,306,306,311,306,306,207,
            306,208,206,306,306,209,306,213,306,306,
            359,210,214,306,215,306,306,306,306,216,
            306,306,345,306,306,219,306,348,220,218,
            221,306,222,306,217,224,306,223,306,225,
            306,226,227,306,306,306,229,231,306,228,
            306,327,306,230,324,232,306,306,306,306,
            316,306,306,234,236,306,306,306,235,237,
            306,315,306,306,243,313,240,306,241,238,
            306,239,306,242,46,306,306,306,310,245,
            244,306,246,247,353,306,306,249,306,306,
            248,306,306,344,306,251,346,306,349,343,
            250,306,306,337,306,306,332,306,254,306,
            19,306,306,320,252,306,253,256,306,258,
            306,257,259,260,306,308,306,306,255,261,
            306,264,306,265,306,262,263,306,266,306,
            306,269,270,306,271,306,273,306,306,341,
            340,306,306,306,274,276,306,272,306,306,
            275,306,318,306,306,306,279,309,323,306,
            277,306,278,306,280,306,326,281,363,282,
            306,306,306,283,358,306,306,306,306,284,
            285,286,306,306,287,289,288,306,306,306,
            317,290,306,347,306,307,306,306,291,306,
            364,306,292,306,293,294,306,295,306,354,
            306,306,306,342,335,306,296,306,298,306,
            297,306,306,306,299,362,366,306,306,300,
            361,306,306,306,306,306,365,301,302,360,
            306,331,333,306,306,303,350,
];

impl lpg2::traits::ParseTable for JavaKWLexerprs {
    fn get_error_symbol(&self) -> i32 {
        JavaKWLexerprs_ERROR_SYMBOL
    }
    fn get_scope_ubound(&self) -> i32 {
        JavaKWLexerprs_SCOPE_UBOUND
    }
    fn get_scope_size(&self) -> i32 {
        JavaKWLexerprs_SCOPE_SIZE
    }
    fn get_max_name_length(&self) -> i32 {
        JavaKWLexerprs_MAX_NAME_LENGTH
    }
    fn get_num_states(&self) -> i32 {
        JavaKWLexerprs_NUM_STATES
    }
    fn get_nt_offset(&self) -> i32 {
        JavaKWLexerprs_NT_OFFSET
    }
    fn get_la_state_offset(&self) -> i32 {
        JavaKWLexerprs_LA_STATE_OFFSET
    }
    fn get_max_la(&self) -> i32 {
        JavaKWLexerprs_MAX_LA
    }
    fn get_num_rules(&self) -> i32 {
        JavaKWLexerprs_NUM_RULES
    }
    fn get_num_nonterminals(&self) -> i32 {
        JavaKWLexerprs_NUM_NONTERMINALS
    }
    fn get_num_symbols(&self) -> i32 {
        JavaKWLexerprs_NUM_SYMBOLS
    }
    fn get_start_state(&self) -> i32 {
        JavaKWLexerprs_START_STATE
    }
    fn get_eoft_symbol(&self) -> i32 {
        JavaKWLexerprs_EOFT_SYMBOL
    }
    fn get_eolt_symbol(&self) -> i32 {
        JavaKWLexerprs_EOLT_SYMBOL
    }
    fn get_accept_action(&self) -> i32 {
        JavaKWLexerprs_ACCEPT_ACTION
    }
    fn get_error_action(&self) -> i32 {
        JavaKWLexerprs_ERROR_ACTION
    }
    fn get_backtrack(&self) -> bool {
        JavaKWLexerprs_BACKTRACK
    }
    fn get_start_symbol(&self) -> i32 {
        self.lhs(0)
    }

    fn is_valid_for_parser(&self) -> bool {
        true
    }

    fn is_nullable(&self, symbol: i32) -> bool {
        JavaKWLexerprs_is_nullable[symbol as usize] != 0
    }
    fn base_check(&self, index: i32) -> i32 {
        JavaKWLexerprs_base_check[index as usize]
    }
    fn rhs(&self, index: i32) -> i32 {
        JavaKWLexerprs_rhs[index as usize]
    }

    fn base_action(&self, index: i32) -> i32 {
        JavaKWLexerprs_base_action[index as usize]
    }
    fn lhs(&self, index: i32) -> i32 {
        JavaKWLexerprs_lhs[index as usize]
    }

    fn term_check(&self, index: i32) -> i32 {
        JavaKWLexerprs_term_check[index as usize]
    }
    fn term_action(&self, index: i32) -> i32 {
        JavaKWLexerprs_term_action[index as usize]
    }
    fn asb(&self, _index: i32) -> i32 { 0 }

    fn asr(&self, _index: i32) -> i32 { 0 }

    fn nasb(&self, _index: i32) -> i32 { 0 }

    fn nasr(&self, _index: i32) -> i32 { 0 }

    fn terminal_index(&self, _index: i32) -> i32 { 0 }

    fn nonterminal_index(&self, _index: i32) -> i32 { 0 }

    fn scope_prefix(&self, _index: i32) -> i32 { 0 }

    fn scope_suffix(&self, _index: i32) -> i32 { 0 }

    fn scope_lhs(&self, _index: i32) -> i32 { 0 }

    fn scope_la(&self, _index: i32) -> i32 { 0 }

    fn scope_state_set(&self, _index: i32) -> i32 { 0 }

    fn scope_rhs(&self, _index: i32) -> i32 { 0 }

    fn scope_state(&self, _index: i32) -> i32 { 0 }

    fn in_symb(&self, _index: i32) -> i32 { 0 }

    fn name(&self, _index: i32) -> String { String::new() }

    fn original_state(&self, _state: i32) -> i32 { 0 }

    fn asi(&self, _state: i32) -> i32 { 0 }

    fn nasi(&self, _state: i32) -> i32 { 0 }

    fn in_symbol(&self, _state: i32) -> i32 { 0 }

    fn nt_action(&self, state: i32, sym: i32) -> i32 {
        JavaKWLexerprs_base_action[(state + sym) as usize]
    }

    fn t_action(&self, act: i32, sym: i32) -> i32 {
        let i = JavaKWLexerprs_base_action[act as usize];
        let k = i + sym;
        let index = if JavaKWLexerprs_term_check[k as usize] == sym { k } else { i };
        JavaKWLexerprs_term_action[index as usize]
    }

    fn look_ahead(&self, la_state: i32, sym: i32) -> i32 {
        let k = la_state + sym;
        let index = if JavaKWLexerprs_term_check[k as usize] == sym { k } else { la_state };
        JavaKWLexerprs_term_action[index as usize]
    }

}

