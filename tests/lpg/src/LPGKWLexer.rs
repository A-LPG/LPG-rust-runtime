
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


    //#line 58 "KeywordTemplateF.gi


    //#line 10 "KWLexerFoldedCaseMapF.gi

//
// Each upper case letter is mapped into its corresponding
// lower case counterpart. For example, if an 'A' appears
// in the input, it is mapped into LPGKWLexersym.Char_a just
// like 'a'.
//
static LPGKWLexer_TOKEN_KIND: [i32; 128] = {
    let mut token_kind = [0i32; 128];
    token_kind[b'$' as usize] = LPGKWLexersym::Char_DollarSign;
    token_kind[b'%' as usize] = LPGKWLexersym::Char_Percent;
    token_kind[b'_' as usize] = LPGKWLexersym::Char__;

    token_kind[b'0' as usize] = LPGKWLexersym::Char_0;
    token_kind[b'1' as usize] = LPGKWLexersym::Char_1;
    token_kind[b'2' as usize] = LPGKWLexersym::Char_2;
    token_kind[b'3' as usize] = LPGKWLexersym::Char_3;
    token_kind[b'4' as usize] = LPGKWLexersym::Char_4;
    token_kind[b'5' as usize] = LPGKWLexersym::Char_5;
    token_kind[b'6' as usize] = LPGKWLexersym::Char_6;
    token_kind[b'7' as usize] = LPGKWLexersym::Char_7;
    token_kind[b'8' as usize] = LPGKWLexersym::Char_8;
    token_kind[b'9' as usize] = LPGKWLexersym::Char_9;

    token_kind[b'a' as usize] = LPGKWLexersym::Char_a;
    token_kind[b'b' as usize] = LPGKWLexersym::Char_b;
    token_kind[b'c' as usize] = LPGKWLexersym::Char_c;
    token_kind[b'd' as usize] = LPGKWLexersym::Char_d;
    token_kind[b'e' as usize] = LPGKWLexersym::Char_e;
    token_kind[b'f' as usize] = LPGKWLexersym::Char_f;
    token_kind[b'g' as usize] = LPGKWLexersym::Char_g;
    token_kind[b'h' as usize] = LPGKWLexersym::Char_h;
    token_kind[b'i' as usize] = LPGKWLexersym::Char_i;
    token_kind[b'j' as usize] = LPGKWLexersym::Char_j;
    token_kind[b'k' as usize] = LPGKWLexersym::Char_k;
    token_kind[b'l' as usize] = LPGKWLexersym::Char_l;
    token_kind[b'm' as usize] = LPGKWLexersym::Char_m;
    token_kind[b'n' as usize] = LPGKWLexersym::Char_n;
    token_kind[b'o' as usize] = LPGKWLexersym::Char_o;
    token_kind[b'p' as usize] = LPGKWLexersym::Char_p;
    token_kind[b'q' as usize] = LPGKWLexersym::Char_q;
    token_kind[b'r' as usize] = LPGKWLexersym::Char_r;
    token_kind[b's' as usize] = LPGKWLexersym::Char_s;
    token_kind[b't' as usize] = LPGKWLexersym::Char_t;
    token_kind[b'u' as usize] = LPGKWLexersym::Char_u;
    token_kind[b'v' as usize] = LPGKWLexersym::Char_v;
    token_kind[b'w' as usize] = LPGKWLexersym::Char_w;
    token_kind[b'x' as usize] = LPGKWLexersym::Char_x;
    token_kind[b'y' as usize] = LPGKWLexersym::Char_y;
    token_kind[b'z' as usize] = LPGKWLexersym::Char_z;

    token_kind[b'A' as usize] = LPGKWLexersym::Char_a;
    token_kind[b'B' as usize] = LPGKWLexersym::Char_b;
    token_kind[b'C' as usize] = LPGKWLexersym::Char_c;
    token_kind[b'D' as usize] = LPGKWLexersym::Char_d;
    token_kind[b'E' as usize] = LPGKWLexersym::Char_e;
    token_kind[b'F' as usize] = LPGKWLexersym::Char_f;
    token_kind[b'G' as usize] = LPGKWLexersym::Char_g;
    token_kind[b'H' as usize] = LPGKWLexersym::Char_h;
    token_kind[b'I' as usize] = LPGKWLexersym::Char_i;
    token_kind[b'J' as usize] = LPGKWLexersym::Char_j;
    token_kind[b'K' as usize] = LPGKWLexersym::Char_k;
    token_kind[b'L' as usize] = LPGKWLexersym::Char_l;
    token_kind[b'M' as usize] = LPGKWLexersym::Char_m;
    token_kind[b'N' as usize] = LPGKWLexersym::Char_n;
    token_kind[b'O' as usize] = LPGKWLexersym::Char_o;
    token_kind[b'P' as usize] = LPGKWLexersym::Char_p;
    token_kind[b'Q' as usize] = LPGKWLexersym::Char_q;
    token_kind[b'R' as usize] = LPGKWLexersym::Char_r;
    token_kind[b'S' as usize] = LPGKWLexersym::Char_s;
    token_kind[b'T' as usize] = LPGKWLexersym::Char_t;
    token_kind[b'U' as usize] = LPGKWLexersym::Char_u;
    token_kind[b'V' as usize] = LPGKWLexersym::Char_v;
    token_kind[b'W' as usize] = LPGKWLexersym::Char_w;
    token_kind[b'X' as usize] = LPGKWLexersym::Char_x;
    token_kind[b'Y' as usize] = LPGKWLexersym::Char_y;
    token_kind[b'Z' as usize] = LPGKWLexersym::Char_z;
    token_kind
};

    //#line 63 "KeywordTemplateF.gi

pub struct LPGKWLexer {
    prs: LPGKWLexerprs,
    input_chars: Vec<char>,
    keyword_kind: Vec<i32>,
}

impl LPGKWLexer {
    pub fn get_keyword_kinds(&self) -> &[i32] {
        &self.keyword_kind
    }

    pub fn lexer(&self, mut curtok: i32, lasttok: i32) -> i32 {
        let mut current_kind = self.get_kind(self.input_chars[curtok as usize]);
        let mut act = self.prs.t_action(LPGKWLexerprs_START_STATE, current_kind);
        while act > LPGKWLexerprs_NUM_RULES && act < LPGKWLexerprs_ACCEPT_ACTION {
            curtok += 1;
            current_kind = if curtok > lasttok {
                LPGKWLexersym::Char_EOF
            } else {
                self.get_kind(self.input_chars[curtok as usize])
            };
            act = self.prs.t_action(act, current_kind);
        }

        if act > LPGKWLexerprs_ERROR_ACTION {
            curtok += 1;
            act -= LPGKWLexerprs_ERROR_ACTION;
        }

        if act == LPGKWLexerprs_ERROR_ACTION || curtok <= lasttok {
            self.keyword_kind[0]
        } else {
            self.keyword_kind[act as usize]
        }
    }

    pub fn set_input_chars(&mut self, input_chars: Vec<char>) {
        self.input_chars = input_chars;
    }

    //#line 93 "KWLexerFoldedCaseMapF.gi

    pub fn get_kind(&self, c: char) -> i32 {
        let code = c as u32;
        if code < 128 {
            LPGKWLexer_TOKEN_KIND[code as usize]
        } else {
            0
        }
    }

    //#line 107 "KeywordTemplateF.gi


    pub fn new(input_chars: Vec<char>, identifier_kind: i32) -> Self {
        let mut keyword_kind = vec![0; (29 + 1) as usize];
        keyword_kind[0] = identifier_kind;
        let mut my = Self {
            prs: LPGKWLexerprs::new(),
            input_chars,
            keyword_kind,
        };

        //
        // Rule 1:  Keyword ::= KeyPrefix a l i a s
        //
        
        my.keyword_kind[1 as usize] = (crate::LPGParsersym::TK_ALIAS_KEY)
       ;
    
        //
        // Rule 2:  Keyword ::= KeyPrefix a s t
        //
        
        my.keyword_kind[2 as usize] = (crate::LPGParsersym::TK_AST_KEY)
       ;
    
        //
        // Rule 3:  Keyword ::= KeyPrefix d e f i n e
        //
        
        my.keyword_kind[3 as usize] = (crate::LPGParsersym::TK_DEFINE_KEY)
       ;
    
        //
        // Rule 4:  Keyword ::= KeyPrefix d i s j o i n t p r e d e c e s s o r s e t s
        //
        
        my.keyword_kind[4 as usize] = (crate::LPGParsersym::TK_DISJOINTPREDECESSORSETS_KEY)
       ;
    
        //
        // Rule 5:  Keyword ::= KeyPrefix d r o p r u l e s
        //
        
        my.keyword_kind[5 as usize] = (crate::LPGParsersym::TK_DROPRULES_KEY)
       ;
    
        //
        // Rule 6:  Keyword ::= KeyPrefix d r o p s y m b o l s
        //
        
        my.keyword_kind[6 as usize] = (crate::LPGParsersym::TK_DROPSYMBOLS_KEY)
       ;
    
        //
        // Rule 7:  Keyword ::= KeyPrefix e m p t y
        //
        
        my.keyword_kind[7 as usize] = (crate::LPGParsersym::TK_EMPTY_KEY)
       ;
    
        //
        // Rule 8:  Keyword ::= KeyPrefix e n d
        //
        
        my.keyword_kind[8 as usize] = (crate::LPGParsersym::TK_END_KEY)
       ;
    
        //
        // Rule 9:  Keyword ::= KeyPrefix e r r o r
        //
        
        my.keyword_kind[9 as usize] = (crate::LPGParsersym::TK_ERROR_KEY)
       ;
    
        //
        // Rule 10:  Keyword ::= KeyPrefix e o l
        //
        
        my.keyword_kind[10 as usize] = (crate::LPGParsersym::TK_EOL_KEY)
       ;
    
        //
        // Rule 11:  Keyword ::= KeyPrefix e o f
        //
        
        my.keyword_kind[11 as usize] = (crate::LPGParsersym::TK_EOF_KEY)
       ;
    
        //
        // Rule 12:  Keyword ::= KeyPrefix e x p o r t
        //
        
        my.keyword_kind[12 as usize] = (crate::LPGParsersym::TK_EXPORT_KEY)
       ;
    
        //
        // Rule 13:  Keyword ::= KeyPrefix g l o b a l s
        //
        
        my.keyword_kind[13 as usize] = (crate::LPGParsersym::TK_GLOBALS_KEY)
       ;
    
        //
        // Rule 14:  Keyword ::= KeyPrefix h e a d e r s
        //
        
        my.keyword_kind[14 as usize] = (crate::LPGParsersym::TK_HEADERS_KEY)
       ;
    
        //
        // Rule 15:  Keyword ::= KeyPrefix i d e n t i f i e r
        //
        
        my.keyword_kind[15 as usize] = (crate::LPGParsersym::TK_IDENTIFIER_KEY)
       ;
    
        //
        // Rule 16:  Keyword ::= KeyPrefix i m p o r t
        //
        
        my.keyword_kind[16 as usize] = (crate::LPGParsersym::TK_IMPORT_KEY)
       ;
    
        //
        // Rule 17:  Keyword ::= KeyPrefix i n c l u d e
        //
        
        my.keyword_kind[17 as usize] = (crate::LPGParsersym::TK_INCLUDE_KEY)
       ;
    
        //
        // Rule 18:  Keyword ::= KeyPrefix k e y w o r d s
        //
        
        my.keyword_kind[18 as usize] = (crate::LPGParsersym::TK_KEYWORDS_KEY)
       ;
    
        //
        // Rule 19:  Keyword ::= KeyPrefix s o f t k e y w o r d s
        //
        
        my.keyword_kind[19 as usize] = (crate::LPGParsersym::TK_SOFT_KEYWORDS_KEY)
       ;
    
        //
        // Rule 20:  Keyword ::= KeyPrefix n a m e s
        //
        
        my.keyword_kind[20 as usize] = (crate::LPGParsersym::TK_NAMES_KEY)
       ;
    
        //
        // Rule 21:  Keyword ::= KeyPrefix n o t i c e
        //
        
        my.keyword_kind[21 as usize] = (crate::LPGParsersym::TK_NOTICE_KEY)
       ;
    
        //
        // Rule 22:  Keyword ::= KeyPrefix t e r m i n a l s
        //
        
        my.keyword_kind[22 as usize] = (crate::LPGParsersym::TK_TERMINALS_KEY)
       ;
    
        //
        // Rule 23:  Keyword ::= KeyPrefix r e c o v e r
        //
        
        my.keyword_kind[23 as usize] = (crate::LPGParsersym::TK_RECOVER_KEY)
       ;
    
        //
        // Rule 24:  Keyword ::= KeyPrefix r u l e s
        //
        
        my.keyword_kind[24 as usize] = (crate::LPGParsersym::TK_RULES_KEY)
       ;
    
        //
        // Rule 25:  Keyword ::= KeyPrefix s t a r t
        //
        
        my.keyword_kind[25 as usize] = (crate::LPGParsersym::TK_START_KEY)
       ;
    
        //
        // Rule 26:  Keyword ::= KeyPrefix t r a i l e r s
        //
        
        my.keyword_kind[26 as usize] = (crate::LPGParsersym::TK_TRAILERS_KEY)
       ;
    
        //
        // Rule 27:  Keyword ::= KeyPrefix t y p e s
        //
        
        my.keyword_kind[27 as usize] = (crate::LPGParsersym::TK_TYPES_KEY)
       ;
    
    //#line 121 "KeywordTemplateF.gi

        for i in 0..my.keyword_kind.len() {
            if my.keyword_kind[i] == 0 {
                my.keyword_kind[i] = identifier_kind;
            }
        }
        my
    }
}

