
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


    //#line 58 "KeywordTemplateF.gi


    //#line 10 "KWLexerFoldedCaseMapF.gi

//
// Each upper case letter is mapped into its corresponding
// lower case counterpart. For example, if an 'A' appears
// in the input, it is mapped into JavaKWLexersym.Char_a just
// like 'a'.
//
static JavaKWLexer_TOKEN_KIND: [i32; 128] = {
    let mut token_kind = [0i32; 128];
    token_kind[b'$' as usize] = JavaKWLexersym::Char_DollarSign;
    token_kind[b'%' as usize] = JavaKWLexersym::Char_Percent;
    token_kind[b'_' as usize] = JavaKWLexersym::Char__;

    token_kind[b'0' as usize] = JavaKWLexersym::Char_0;
    token_kind[b'1' as usize] = JavaKWLexersym::Char_1;
    token_kind[b'2' as usize] = JavaKWLexersym::Char_2;
    token_kind[b'3' as usize] = JavaKWLexersym::Char_3;
    token_kind[b'4' as usize] = JavaKWLexersym::Char_4;
    token_kind[b'5' as usize] = JavaKWLexersym::Char_5;
    token_kind[b'6' as usize] = JavaKWLexersym::Char_6;
    token_kind[b'7' as usize] = JavaKWLexersym::Char_7;
    token_kind[b'8' as usize] = JavaKWLexersym::Char_8;
    token_kind[b'9' as usize] = JavaKWLexersym::Char_9;

    token_kind[b'a' as usize] = JavaKWLexersym::Char_a;
    token_kind[b'b' as usize] = JavaKWLexersym::Char_b;
    token_kind[b'c' as usize] = JavaKWLexersym::Char_c;
    token_kind[b'd' as usize] = JavaKWLexersym::Char_d;
    token_kind[b'e' as usize] = JavaKWLexersym::Char_e;
    token_kind[b'f' as usize] = JavaKWLexersym::Char_f;
    token_kind[b'g' as usize] = JavaKWLexersym::Char_g;
    token_kind[b'h' as usize] = JavaKWLexersym::Char_h;
    token_kind[b'i' as usize] = JavaKWLexersym::Char_i;
    token_kind[b'j' as usize] = JavaKWLexersym::Char_j;
    token_kind[b'k' as usize] = JavaKWLexersym::Char_k;
    token_kind[b'l' as usize] = JavaKWLexersym::Char_l;
    token_kind[b'm' as usize] = JavaKWLexersym::Char_m;
    token_kind[b'n' as usize] = JavaKWLexersym::Char_n;
    token_kind[b'o' as usize] = JavaKWLexersym::Char_o;
    token_kind[b'p' as usize] = JavaKWLexersym::Char_p;
    token_kind[b'q' as usize] = JavaKWLexersym::Char_q;
    token_kind[b'r' as usize] = JavaKWLexersym::Char_r;
    token_kind[b's' as usize] = JavaKWLexersym::Char_s;
    token_kind[b't' as usize] = JavaKWLexersym::Char_t;
    token_kind[b'u' as usize] = JavaKWLexersym::Char_u;
    token_kind[b'v' as usize] = JavaKWLexersym::Char_v;
    token_kind[b'w' as usize] = JavaKWLexersym::Char_w;
    token_kind[b'x' as usize] = JavaKWLexersym::Char_x;
    token_kind[b'y' as usize] = JavaKWLexersym::Char_y;
    token_kind[b'z' as usize] = JavaKWLexersym::Char_z;

    token_kind[b'A' as usize] = JavaKWLexersym::Char_a;
    token_kind[b'B' as usize] = JavaKWLexersym::Char_b;
    token_kind[b'C' as usize] = JavaKWLexersym::Char_c;
    token_kind[b'D' as usize] = JavaKWLexersym::Char_d;
    token_kind[b'E' as usize] = JavaKWLexersym::Char_e;
    token_kind[b'F' as usize] = JavaKWLexersym::Char_f;
    token_kind[b'G' as usize] = JavaKWLexersym::Char_g;
    token_kind[b'H' as usize] = JavaKWLexersym::Char_h;
    token_kind[b'I' as usize] = JavaKWLexersym::Char_i;
    token_kind[b'J' as usize] = JavaKWLexersym::Char_j;
    token_kind[b'K' as usize] = JavaKWLexersym::Char_k;
    token_kind[b'L' as usize] = JavaKWLexersym::Char_l;
    token_kind[b'M' as usize] = JavaKWLexersym::Char_m;
    token_kind[b'N' as usize] = JavaKWLexersym::Char_n;
    token_kind[b'O' as usize] = JavaKWLexersym::Char_o;
    token_kind[b'P' as usize] = JavaKWLexersym::Char_p;
    token_kind[b'Q' as usize] = JavaKWLexersym::Char_q;
    token_kind[b'R' as usize] = JavaKWLexersym::Char_r;
    token_kind[b'S' as usize] = JavaKWLexersym::Char_s;
    token_kind[b'T' as usize] = JavaKWLexersym::Char_t;
    token_kind[b'U' as usize] = JavaKWLexersym::Char_u;
    token_kind[b'V' as usize] = JavaKWLexersym::Char_v;
    token_kind[b'W' as usize] = JavaKWLexersym::Char_w;
    token_kind[b'X' as usize] = JavaKWLexersym::Char_x;
    token_kind[b'Y' as usize] = JavaKWLexersym::Char_y;
    token_kind[b'Z' as usize] = JavaKWLexersym::Char_z;
    token_kind
};

    //#line 63 "KeywordTemplateF.gi

pub struct JavaKWLexer {
    prs: JavaKWLexerprs,
    input_chars: Vec<char>,
    keyword_kind: Vec<i32>,
}

impl JavaKWLexer {
    pub fn get_keyword_kinds(&self) -> &[i32] {
        &self.keyword_kind
    }

    pub fn lexer(&self, mut curtok: i32, lasttok: i32) -> i32 {
        let mut current_kind = self.get_kind(self.input_chars[curtok as usize]);
        let mut act = self.prs.t_action(JavaKWLexerprs_START_STATE, current_kind);
        while act > JavaKWLexerprs_NUM_RULES && act < JavaKWLexerprs_ACCEPT_ACTION {
            curtok += 1;
            current_kind = if curtok > lasttok {
                JavaKWLexersym::Char_EOF
            } else {
                self.get_kind(self.input_chars[curtok as usize])
            };
            act = self.prs.t_action(act, current_kind);
        }

        if act > JavaKWLexerprs_ERROR_ACTION {
            curtok += 1;
            act -= JavaKWLexerprs_ERROR_ACTION;
        }

        if act == JavaKWLexerprs_ERROR_ACTION || curtok <= lasttok {
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
            JavaKWLexer_TOKEN_KIND[code as usize]
        } else {
            0
        }
    }

    //#line 107 "KeywordTemplateF.gi


    pub fn new(input_chars: Vec<char>, identifier_kind: i32) -> Self {
        let mut keyword_kind = vec![0; (60 + 1) as usize];
        keyword_kind[0] = identifier_kind;
        let mut my = Self {
            prs: JavaKWLexerprs::new(),
            input_chars,
            keyword_kind,
        };

        //
        // Rule 1:  KeyWord ::= a b s t r a c t
        //
        
        my.keyword_kind[1 as usize] = (crate::JavaParsersym::TK_abstract)
       ;
    
        //
        // Rule 2:  KeyWord ::= a s s e r t
        //
        
        my.keyword_kind[2 as usize] = (crate::JavaParsersym::TK_assert)
       ;
    
        //
        // Rule 3:  KeyWord ::= b o o l e a n
        //
        
        my.keyword_kind[3 as usize] = (crate::JavaParsersym::TK_boolean)
       ;
    
        //
        // Rule 4:  KeyWord ::= b r e a k
        //
        
        my.keyword_kind[4 as usize] = (crate::JavaParsersym::TK_break)
       ;
    
        //
        // Rule 5:  KeyWord ::= b y t e
        //
        
        my.keyword_kind[5 as usize] = (crate::JavaParsersym::TK_byte)
       ;
    
        //
        // Rule 6:  KeyWord ::= c a s e
        //
        
        my.keyword_kind[6 as usize] = (crate::JavaParsersym::TK_case)
       ;
    
        //
        // Rule 7:  KeyWord ::= c a t c h
        //
        
        my.keyword_kind[7 as usize] = (crate::JavaParsersym::TK_catch)
       ;
    
        //
        // Rule 8:  KeyWord ::= c h a r
        //
        
        my.keyword_kind[8 as usize] = (crate::JavaParsersym::TK_char)
       ;
    
        //
        // Rule 9:  KeyWord ::= c l a s s
        //
        
        my.keyword_kind[9 as usize] = (crate::JavaParsersym::TK_class)
       ;
    
        //
        // Rule 10:  KeyWord ::= c o n s t
        //
        
        my.keyword_kind[10 as usize] = (crate::JavaParsersym::TK_const)
       ;
    
        //
        // Rule 11:  KeyWord ::= c o n t i n u e
        //
        
        my.keyword_kind[11 as usize] = (crate::JavaParsersym::TK_continue)
       ;
    
        //
        // Rule 12:  KeyWord ::= d e f a u l t
        //
        
        my.keyword_kind[12 as usize] = (crate::JavaParsersym::TK_default)
       ;
    
        //
        // Rule 13:  KeyWord ::= d o
        //
        
        my.keyword_kind[13 as usize] = (crate::JavaParsersym::TK_do)
       ;
    
        //
        // Rule 14:  KeyWord ::= d o u b l e
        //
        
        my.keyword_kind[14 as usize] = (crate::JavaParsersym::TK_double)
       ;
    
        //
        // Rule 15:  KeyWord ::= e l s e
        //
        
        my.keyword_kind[15 as usize] = (crate::JavaParsersym::TK_else)
       ;
    
        //
        // Rule 16:  KeyWord ::= e n u m
        //
        
        my.keyword_kind[16 as usize] = (crate::JavaParsersym::TK_enum)
       ;
    
        //
        // Rule 17:  KeyWord ::= e x t e n d s
        //
        
        my.keyword_kind[17 as usize] = (crate::JavaParsersym::TK_extends)
       ;
    
        //
        // Rule 18:  KeyWord ::= f a l s e
        //
        
        my.keyword_kind[18 as usize] = (crate::JavaParsersym::TK_false)
       ;
    
        //
        // Rule 19:  KeyWord ::= f i n a l
        //
        
        my.keyword_kind[19 as usize] = (crate::JavaParsersym::TK_final)
       ;
    
        //
        // Rule 20:  KeyWord ::= f i n a l l y
        //
        
        my.keyword_kind[20 as usize] = (crate::JavaParsersym::TK_finally)
       ;
    
        //
        // Rule 21:  KeyWord ::= f l o a t
        //
        
        my.keyword_kind[21 as usize] = (crate::JavaParsersym::TK_float)
       ;
    
        //
        // Rule 22:  KeyWord ::= f o r
        //
        
        my.keyword_kind[22 as usize] = (crate::JavaParsersym::TK_for)
       ;
    
        //
        // Rule 23:  KeyWord ::= g o t o
        //
        
        my.keyword_kind[23 as usize] = (crate::JavaParsersym::TK_goto)
       ;
    
        //
        // Rule 24:  KeyWord ::= i f
        //
        
        my.keyword_kind[24 as usize] = (crate::JavaParsersym::TK_if)
       ;
    
        //
        // Rule 25:  KeyWord ::= i m p l e m e n t s
        //
        
        my.keyword_kind[25 as usize] = (crate::JavaParsersym::TK_implements)
       ;
    
        //
        // Rule 26:  KeyWord ::= i m p o r t
        //
        
        my.keyword_kind[26 as usize] = (crate::JavaParsersym::TK_import)
       ;
    
        //
        // Rule 27:  KeyWord ::= i n s t a n c e o f
        //
        
        my.keyword_kind[27 as usize] = (crate::JavaParsersym::TK_instanceof)
       ;
    
        //
        // Rule 28:  KeyWord ::= i n t
        //
        
        my.keyword_kind[28 as usize] = (crate::JavaParsersym::TK_int)
       ;
    
        //
        // Rule 29:  KeyWord ::= i n t e r f a c e
        //
        
        my.keyword_kind[29 as usize] = (crate::JavaParsersym::TK_interface)
       ;
    
        //
        // Rule 30:  KeyWord ::= l o n g
        //
        
        my.keyword_kind[30 as usize] = (crate::JavaParsersym::TK_long)
       ;
    
        //
        // Rule 31:  KeyWord ::= n a t i v e
        //
        
        my.keyword_kind[31 as usize] = (crate::JavaParsersym::TK_native)
       ;
    
        //
        // Rule 32:  KeyWord ::= n e w
        //
        
        my.keyword_kind[32 as usize] = (crate::JavaParsersym::TK_new)
       ;
    
        //
        // Rule 33:  KeyWord ::= n u l l
        //
        
        my.keyword_kind[33 as usize] = (crate::JavaParsersym::TK_null)
       ;
    
        //
        // Rule 34:  KeyWord ::= p a c k a g e
        //
        
        my.keyword_kind[34 as usize] = (crate::JavaParsersym::TK_package)
       ;
    
        //
        // Rule 35:  KeyWord ::= p r i v a t e
        //
        
        my.keyword_kind[35 as usize] = (crate::JavaParsersym::TK_private)
       ;
    
        //
        // Rule 36:  KeyWord ::= p r o t e c t e d
        //
        
        my.keyword_kind[36 as usize] = (crate::JavaParsersym::TK_protected)
       ;
    
        //
        // Rule 37:  KeyWord ::= p u b l i c
        //
        
        my.keyword_kind[37 as usize] = (crate::JavaParsersym::TK_public)
       ;
    
        //
        // Rule 38:  KeyWord ::= r e t u r n
        //
        
        my.keyword_kind[38 as usize] = (crate::JavaParsersym::TK_return)
       ;
    
        //
        // Rule 39:  KeyWord ::= s h o r t
        //
        
        my.keyword_kind[39 as usize] = (crate::JavaParsersym::TK_short)
       ;
    
        //
        // Rule 40:  KeyWord ::= s t a t i c
        //
        
        my.keyword_kind[40 as usize] = (crate::JavaParsersym::TK_static)
       ;
    
        //
        // Rule 41:  KeyWord ::= s t r i c t f p
        //
        
        my.keyword_kind[41 as usize] = (crate::JavaParsersym::TK_strictfp)
       ;
    
        //
        // Rule 42:  KeyWord ::= s u p e r
        //
        
        my.keyword_kind[42 as usize] = (crate::JavaParsersym::TK_super)
       ;
    
        //
        // Rule 43:  KeyWord ::= s w i t c h
        //
        
        my.keyword_kind[43 as usize] = (crate::JavaParsersym::TK_switch)
       ;
    
        //
        // Rule 44:  KeyWord ::= s y n c h r o n i z e d
        //
        
        my.keyword_kind[44 as usize] = (crate::JavaParsersym::TK_synchronized)
       ;
    
        //
        // Rule 45:  KeyWord ::= t h i s
        //
        
        my.keyword_kind[45 as usize] = (crate::JavaParsersym::TK_this)
       ;
    
        //
        // Rule 46:  KeyWord ::= t h r o w
        //
        
        my.keyword_kind[46 as usize] = (crate::JavaParsersym::TK_throw)
       ;
    
        //
        // Rule 47:  KeyWord ::= t h r o w s
        //
        
        my.keyword_kind[47 as usize] = (crate::JavaParsersym::TK_throws)
       ;
    
        //
        // Rule 48:  KeyWord ::= t r a n s i e n t
        //
        
        my.keyword_kind[48 as usize] = (crate::JavaParsersym::TK_transient)
       ;
    
        //
        // Rule 49:  KeyWord ::= t r u e
        //
        
        my.keyword_kind[49 as usize] = (crate::JavaParsersym::TK_true)
       ;
    
        //
        // Rule 50:  KeyWord ::= t r y
        //
        
        my.keyword_kind[50 as usize] = (crate::JavaParsersym::TK_try)
       ;
    
        //
        // Rule 51:  KeyWord ::= v o i d
        //
        
        my.keyword_kind[51 as usize] = (crate::JavaParsersym::TK_void)
       ;
    
        //
        // Rule 52:  KeyWord ::= v o l a t i l e
        //
        
        my.keyword_kind[52 as usize] = (crate::JavaParsersym::TK_volatile)
       ;
    
        //
        // Rule 53:  KeyWord ::= w h i l e
        //
        
        my.keyword_kind[53 as usize] = (crate::JavaParsersym::TK_while)
       ;
    
        //
        // Rule 54:  KeyWord ::= $ b e g i n a c t i o n
        //
        
        my.keyword_kind[54 as usize] = (crate::JavaParsersym::TK_BeginAction)
       ;
    
        //
        // Rule 55:  KeyWord ::= $ b e g i n j a v a
        //
        
        my.keyword_kind[55 as usize] = (crate::JavaParsersym::TK_BeginJava)
       ;
    
        //
        // Rule 56:  KeyWord ::= $ e n d a c t i o n
        //
        
        my.keyword_kind[56 as usize] = (crate::JavaParsersym::TK_EndAction)
       ;
    
        //
        // Rule 57:  KeyWord ::= $ e n d j a v a
        //
        
        my.keyword_kind[57 as usize] = (crate::JavaParsersym::TK_EndJava)
       ;
    
        //
        // Rule 58:  KeyWord ::= $ n o a c t i o n
        //
        
        my.keyword_kind[58 as usize] = (crate::JavaParsersym::TK_NoAction)
       ;
    
        //
        // Rule 59:  KeyWord ::= $ n u l l a c t i o n
        //
        
        my.keyword_kind[59 as usize] = (crate::JavaParsersym::TK_NullAction)
       ;
    
        //
        // Rule 60:  KeyWord ::= $ b a d a c t i o n
        //
        
        my.keyword_kind[60 as usize] = (crate::JavaParsersym::TK_BadAction)
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

