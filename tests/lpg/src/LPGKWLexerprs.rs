
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

// mod lpg
#[derive(Clone, Copy, Debug, Default)]
pub struct LPGKWLexerprs;

impl LPGKWLexerprs {
    pub fn new() -> Self {
        LPGKWLexerprs
    }
}

pub const LPGKWLexerprs_ERROR_SYMBOL: i32 = 0;
pub const LPGKWLexerprs_SCOPE_UBOUND: i32 = 0;
pub const LPGKWLexerprs_SCOPE_SIZE: i32 = 0;
pub const LPGKWLexerprs_MAX_NAME_LENGTH: i32 = 0;
pub const LPGKWLexerprs_NUM_STATES: i32 = 145;
pub const LPGKWLexerprs_NT_OFFSET: i32 = 40;
pub const LPGKWLexerprs_LA_STATE_OFFSET: i32 = 208;
pub const LPGKWLexerprs_MAX_LA: i32 = 0;
pub const LPGKWLexerprs_NUM_RULES: i32 = 29;
pub const LPGKWLexerprs_NUM_NONTERMINALS: i32 = 3;
pub const LPGKWLexerprs_NUM_SYMBOLS: i32 = 43;
pub const LPGKWLexerprs_START_STATE: i32 = 30;
pub const LPGKWLexerprs_IDENTIFIER_SYMBOL: i32 = 0;
pub const LPGKWLexerprs_EOFT_SYMBOL: i32 = 27;
pub const LPGKWLexerprs_EOLT_SYMBOL: i32 = 41;
pub const LPGKWLexerprs_ACCEPT_ACTION: i32 = 178;
pub const LPGKWLexerprs_ERROR_ACTION: i32 = 179;
pub const LPGKWLexerprs_BACKTRACK: bool = false;

static LPGKWLexerprs_is_nullable: &[i32] = &[0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,
];

static LPGKWLexerprs_prostheses_index: &[i32] = &[0,
            2,3,1,
];

static LPGKWLexerprs_is_keyword: &[i32] = &[0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
];

static LPGKWLexerprs_base_check: &[i32] = &[0,
            6,4,7,24,10,12,6,4,6,4,
            4,7,8,8,11,7,8,9,13,6,
            7,10,8,6,6,9,6,1,1,
];
static LPGKWLexerprs_rhs: &[i32] = LPGKWLexerprs_base_check;


static LPGKWLexerprs_base_action: &[i32] = &[
            1,1,1,1,1,1,1,1,1,1,
            1,1,1,1,1,1,1,1,1,1,
            1,1,1,1,1,1,1,1,2,2,
            26,33,34,37,1,39,12,44,45,62,
            22,65,67,17,35,51,68,14,5,70,
            30,71,72,73,77,80,42,79,82,86,
            85,87,54,88,95,96,97,100,99,103,
            105,109,112,117,113,115,120,121,125,124,
            123,130,131,8,132,133,134,136,139,143,
            145,146,147,149,148,156,153,157,161,162,
            165,159,167,166,176,178,180,184,185,186,
            174,57,168,190,191,194,196,198,201,203,
            206,205,207,210,215,213,217,211,219,221,
            225,228,229,230,223,233,239,234,241,244,
            245,247,248,250,253,237,259,262,255,263,
            265,267,271,273,276,277,278,281,282,283,
            288,286,292,296,298,293,303,287,305,307,
            308,311,313,312,317,319,320,179,179,
];
static LPGKWLexerprs_lhs: &[i32] = LPGKWLexerprs_base_action;


static LPGKWLexerprs_term_check: &[i32] = &[0,
            0,1,2,3,0,5,6,0,8,9,
            10,0,1,0,3,11,0,10,18,3,
            4,0,22,23,13,0,10,14,12,0,
            9,10,3,12,0,1,0,3,0,1,
            6,0,26,0,0,20,21,4,4,5,
            0,8,2,0,16,14,0,7,2,3,
            7,0,1,27,0,1,0,0,15,0,
            0,0,0,7,7,5,0,8,0,0,
            8,0,1,12,0,0,0,0,4,11,
            3,15,13,8,0,0,0,11,0,0,
            4,2,0,9,0,0,11,5,0,1,
            6,0,0,15,0,4,0,1,6,0,
            0,1,0,0,0,6,12,3,5,0,
            0,0,0,0,4,0,7,4,0,4,
            9,19,0,5,0,0,0,0,0,17,
            2,6,0,11,8,0,0,2,0,7,
            0,0,6,2,0,0,0,0,24,5,
            4,4,25,0,14,0,18,0,3,0,
            1,16,5,0,0,0,13,3,3,0,
            0,8,2,0,1,0,1,0,0,10,
            0,1,0,1,0,0,0,10,3,0,
            0,5,0,9,0,6,0,3,0,7,
            0,5,0,13,0,1,6,0,0,0,
            3,3,0,0,16,13,0,8,0,1,
            0,9,2,0,0,2,0,0,15,0,
            0,2,0,7,0,19,12,10,0,7,
            2,0,0,1,0,0,0,6,2,5,
            0,17,0,1,4,0,0,0,2,4,
            0,0,0,3,3,0,0,0,11,7,
            3,0,0,2,9,0,1,0,0,2,
            14,9,0,1,0,1,0,0,2,2,
            0,0,0,2,4,3,0,1,0,0,
            0,2,0,5,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
            0,0,0,0,0,0,0,0,0,0,
];

static LPGKWLexerprs_term_action: &[i32] = &[0,
            179,43,38,35,179,36,40,179,45,44,
            37,179,50,179,49,73,179,105,39,63,
            62,179,42,41,48,179,64,72,65,179,
            58,56,75,57,179,68,179,66,179,47,
            67,179,61,179,179,34,34,51,54,53,
            179,52,69,179,46,81,179,70,127,128,
            189,179,55,178,179,59,179,179,190,179,
            179,179,179,60,71,76,179,74,179,179,
            78,179,83,77,179,179,179,179,85,82,
            87,79,80,84,179,179,179,86,179,179,
            89,90,179,187,179,179,88,181,179,93,
            92,179,179,91,179,94,179,95,96,179,
            179,99,179,179,179,98,97,100,101,179,
            179,179,179,179,104,179,103,108,179,109,
            106,102,179,110,179,179,179,179,179,107,
            203,113,179,111,114,179,179,206,179,116,
            179,179,117,199,179,179,179,179,112,204,
            120,129,115,179,118,179,119,179,122,179,
            124,121,123,179,179,179,186,126,188,179,
            179,125,180,179,131,179,132,179,179,130,
            179,200,179,134,179,179,179,133,135,179,
            179,195,179,136,179,137,179,138,179,139,
            179,191,179,140,179,182,142,179,179,179,
            202,143,179,179,141,145,179,144,179,196,
            179,146,193,179,179,192,179,179,147,179,
            179,205,179,149,179,152,148,150,179,151,
            197,179,179,155,179,179,179,153,201,156,
            179,154,179,158,157,179,179,179,184,159,
            179,179,179,161,194,179,179,179,160,162,
            163,179,179,185,164,179,165,179,179,198,
            168,166,179,167,179,169,179,179,170,171,
            179,179,179,174,172,173,179,175,179,179,
            179,183,179,176,
];

impl lpg2::traits::ParseTable for LPGKWLexerprs {
    fn get_error_symbol(&self) -> i32 {
        LPGKWLexerprs_ERROR_SYMBOL
    }
    fn get_scope_ubound(&self) -> i32 {
        LPGKWLexerprs_SCOPE_UBOUND
    }
    fn get_scope_size(&self) -> i32 {
        LPGKWLexerprs_SCOPE_SIZE
    }
    fn get_max_name_length(&self) -> i32 {
        LPGKWLexerprs_MAX_NAME_LENGTH
    }
    fn get_num_states(&self) -> i32 {
        LPGKWLexerprs_NUM_STATES
    }
    fn get_nt_offset(&self) -> i32 {
        LPGKWLexerprs_NT_OFFSET
    }
    fn get_la_state_offset(&self) -> i32 {
        LPGKWLexerprs_LA_STATE_OFFSET
    }
    fn get_max_la(&self) -> i32 {
        LPGKWLexerprs_MAX_LA
    }
    fn get_num_rules(&self) -> i32 {
        LPGKWLexerprs_NUM_RULES
    }
    fn get_num_nonterminals(&self) -> i32 {
        LPGKWLexerprs_NUM_NONTERMINALS
    }
    fn get_num_symbols(&self) -> i32 {
        LPGKWLexerprs_NUM_SYMBOLS
    }
    fn get_start_state(&self) -> i32 {
        LPGKWLexerprs_START_STATE
    }
    fn get_eoft_symbol(&self) -> i32 {
        LPGKWLexerprs_EOFT_SYMBOL
    }
    fn get_eolt_symbol(&self) -> i32 {
        LPGKWLexerprs_EOLT_SYMBOL
    }
    fn get_accept_action(&self) -> i32 {
        LPGKWLexerprs_ACCEPT_ACTION
    }
    fn get_error_action(&self) -> i32 {
        LPGKWLexerprs_ERROR_ACTION
    }
    fn get_backtrack(&self) -> bool {
        LPGKWLexerprs_BACKTRACK
    }
    fn get_start_symbol(&self) -> i32 {
        self.lhs(0)
    }

    fn is_valid_for_parser(&self) -> bool {
        true
    }

    fn is_nullable(&self, symbol: i32) -> bool {
        LPGKWLexerprs_is_nullable[symbol as usize] != 0
    }
    fn base_check(&self, index: i32) -> i32 {
        LPGKWLexerprs_base_check[index as usize]
    }
    fn rhs(&self, index: i32) -> i32 {
        LPGKWLexerprs_rhs[index as usize]
    }

    fn base_action(&self, index: i32) -> i32 {
        LPGKWLexerprs_base_action[index as usize]
    }
    fn lhs(&self, index: i32) -> i32 {
        LPGKWLexerprs_lhs[index as usize]
    }

    fn term_check(&self, index: i32) -> i32 {
        LPGKWLexerprs_term_check[index as usize]
    }
    fn term_action(&self, index: i32) -> i32 {
        LPGKWLexerprs_term_action[index as usize]
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
        LPGKWLexerprs_base_action[(state + sym) as usize]
    }

    fn t_action(&self, act: i32, sym: i32) -> i32 {
        let i = LPGKWLexerprs_base_action[act as usize];
        let k = i + sym;
        let index = if LPGKWLexerprs_term_check[k as usize] == sym { k } else { i };
        LPGKWLexerprs_term_action[index as usize]
    }

    fn look_ahead(&self, la_state: i32, sym: i32) -> i32 {
        let k = la_state + sym;
        let index = if LPGKWLexerprs_term_check[k as usize] == sym { k } else { la_state };
        LPGKWLexerprs_term_action[index as usize]
    }

}

