
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


    //#line 112 "LexerTemplateF.gi


    //#line 118 "LexerTemplateF.gi

struct JavaLexerRuleProxy {
    owner: *mut JavaLexer,
}

impl RuleAction for JavaLexerRuleProxy {
    fn rule_action(&mut self, rule_number: i32) {
        unsafe {
            (*self.owner).rule_action_impl(rule_number);
        }
    }
}

pub struct JavaLexer {
    kw_lexer: Option<JavaKWLexer>,
    print_tokens: bool,
    lex_parser: LexParser<JavaLexerLpgLexStream, JavaLexerprs, JavaLexerRuleProxy>,
    lex_stream: JavaLexerLpgLexStream,
    prs: JavaLexerprs,
}

impl JavaLexer {
    pub fn new(
        filename: String,
        tab: i32,
        input_chars: Option<Vec<char>>,
    ) -> Result<Box<Self>, LpgException> {
        let lex_stream = JavaLexerLpgLexStream::new(filename, input_chars, tab)?;
        let prs = JavaLexerprs;
        let mut boxed = Box::new(Self {
            kw_lexer: None,
            print_tokens: false,
            lex_parser: LexParser::new(),
            lex_stream: lex_stream.clone(),
            prs,
        });
        let owner = boxed.as_mut() as *mut Self;
        boxed.lex_parser.reset(
            lex_stream,
            boxed.prs.clone(),
            JavaLexerRuleProxy { owner },
        );
        boxed.reset_keyword_lexer();
        Ok(boxed)
    }

    pub fn get_parse_table(&self) -> &JavaLexerprs {
        &self.prs
    }

    pub fn get_parser(&mut self) -> &mut LexParser<JavaLexerLpgLexStream, JavaLexerprs, JavaLexerRuleProxy> {
        &mut self.lex_parser
    }

    pub fn get_token(&self, i: i32) -> i32 {
        self.lex_parser.get_token(i)
    }

    pub fn get_rhs_first_token_index(&self, i: i32) -> i32 {
        self.lex_parser.get_first_token_at(i)
    }

    pub fn get_rhs_last_token_index(&self, i: i32) -> i32 {
        self.lex_parser.get_last_token_at(i)
    }

    pub fn get_left_span(&self) -> i32 {
        self.lex_parser.get_token(1)
    }

    pub fn get_right_span(&self) -> i32 {
        self.lex_parser.get_last_token()
    }

    pub fn reset_keyword_lexer(&mut self) {
        if self.kw_lexer.is_none() {
            self.kw_lexer = Some(JavaKWLexer::new(
                self.lex_stream.get_input_chars(),
                crate::JavaParsersym::TK_IDENTIFIER,
            ));
        } else {
            self.kw_lexer
                .as_mut()
                .unwrap()
                .set_input_chars(self.lex_stream.get_input_chars());
        }
    }

    pub fn reset(
        &mut self,
        filename: String,
        tab: i32,
        input_chars: Option<Vec<char>>,
    ) -> Result<(), LpgException> {
        self.lex_stream = JavaLexerLpgLexStream::new(filename, input_chars, tab)?;
        let owner = self as *mut Self;
        self.lex_parser.reset(
            self.lex_stream.clone(),
            self.prs.clone(),
            JavaLexerRuleProxy { owner },
        );
        self.reset_keyword_lexer();
        Ok(())
    }

    pub fn get_i_lex_stream(&self) -> LexStreamRef {
        self.lex_stream.get_i_lex_stream()
    }

    fn initialize_lexer(
        &mut self,
        prs_stream: PrsStreamRef,
        start_offset: i32,
        end_offset: i32,
    ) -> Result<(), LpgException> {
        if self.lex_stream.get_input_chars().is_empty() {
            return Err(LpgException::NullPointer(NullPointerException::new(
                "LexStream was not initialized",
            )));
        }
        let lex_ref = self.get_i_lex_stream();
        lex_ref.borrow_mut().set_prs_stream(prs_stream.clone());
        prs_stream.borrow_mut().set_lex_stream(lex_ref);
        prs_stream
            .borrow_mut()
            .make_token(start_offset, end_offset, 0);
        Ok(())
    }

    fn add_eof(&self, prs_stream: PrsStreamRef, end_offset: i32) {
        prs_stream
            .borrow_mut()
            .make_token(end_offset, end_offset, crate::JavaParsersym::TK_EOF_TOKEN);
        let size = prs_stream.borrow().get_size();
        prs_stream.borrow_mut().set_stream_length(size);
    }

    pub fn lexer_with_position(
        &mut self,
        prs_stream: PrsStreamRef,
        start_offset: i32,
        end_offset: i32,
        monitor: Option<&dyn Monitor>,
    ) -> Result<(), LpgException> {
        if start_offset <= 1 {
            self.initialize_lexer(prs_stream.clone(), 0, -1)?;
        } else {
            self.initialize_lexer(prs_stream.clone(), start_offset - 1, start_offset - 1)?;
        }
        self.lex_parser
            .parse_characters(start_offset, end_offset, monitor);
        let index = if end_offset >= self.lex_stream.get_stream_index() {
            self.lex_stream.get_stream_index()
        } else {
            end_offset + 1
        };
        self.add_eof(prs_stream, index);
        Ok(())
    }

    pub fn lexer(
        &mut self,
        prs_stream: PrsStreamRef,
        monitor: Option<&dyn Monitor>,
    ) -> Result<(), LpgException> {
        self.initialize_lexer(prs_stream.clone(), 0, -1)?;
        self.lex_parser.parse_characters_with_monitor(monitor);
        self.add_eof(prs_stream, self.lex_stream.get_stream_index());
        Ok(())
    }

    /// If a parse stream was not passed to the lexical analyser then we
    /// simply report a lexical error. Otherwise, we produce a bad token.
    pub fn report_lexical_error(&mut self, start_loc: i32, end_loc: i32) {
        if let Some(prs_stream) = self.lex_stream.get_i_prs_stream() {
            let mut i = prs_stream.borrow().get_size() - 1;
            while i > 0 {
                if prs_stream.borrow().get_start_offset(i) >= start_loc {
                    prs_stream.borrow_mut().remove_last_token();
                } else {
                    break;
                }
                i -= 1;
            }
            prs_stream
                .borrow_mut()
                .make_token(start_loc, end_loc, 0);
        } else {
            self.lex_stream
                .report_lexical_error_position(start_loc, end_loc);
        }
    }

    //#line 383 "LexerBasicMapF.gi

//
// The Lexer contains an array of characters as the input stream to be parsed.
// There are methods to retrieve and classify characters.
// The lexparser "token" is implemented simply as the index of the next character in the array.
// The Lexer extends the abstract class LpgLexStream with an implementation of the abstract
// method get_kind.  The template defines the Lexer class and the lexer() method.
// A driver creates the action class, "Lexer", passing an Option object to the constructor.
//

    pub fn get_keyword_kinds(&self) -> &[i32] {
        self.kw_lexer.as_ref().unwrap().get_keyword_kinds()
    }

    pub fn make_token(&mut self, left_token: i32, right_token: i32, kind: i32) {
        self.lex_stream
            .make_token(left_token, right_token, kind);
    }

    pub fn make_token_with_kind(&mut self, kind: i32) {
        let start_offset = self.get_left_span();
        let end_offset = self.get_right_span();
        self.lex_stream
            .make_token(start_offset, end_offset, kind);
        if self.print_tokens {
            self.print_value(start_offset, end_offset);
        }
    }

    pub fn make_comment(&mut self, kind: i32) {
        let start_offset = self.get_left_span();
        let end_offset = self.get_right_span();
        if let Some(prs_stream) = self.lex_stream.get_i_prs_stream() {
            prs_stream
                .borrow_mut()
                .make_adjunct(start_offset, end_offset, kind);
        }
    }

    pub fn skip_token(&mut self) {
        if self.print_tokens {
            self.print_value(self.get_left_span(), self.get_right_span());
        }
    }

    pub fn check_for_key_word(&mut self) {
        let start_offset = self.get_left_span();
        let end_offset = self.get_right_span();
        let kw_kind = self
            .kw_lexer
            .as_ref()
            .unwrap()
            .lexer(start_offset, end_offset);
        self.lex_stream
            .make_token(start_offset, end_offset, kw_kind);
        if self.print_tokens {
            self.print_value(start_offset, end_offset);
        }
    }

    //
    // This flavor of check_for_key_word is necessary when the default kind
    // (which is returned when the keyword filter doesn't match) is something
    // other than _IDENTIFIER.
    //

    pub fn check_for_key_word_with_kind(&mut self, default_kind: i32) {
        let start_offset = self.get_left_span();
        let end_offset = self.get_right_span();
        let mut kw_kind = self
            .kw_lexer
            .as_ref()
            .unwrap()
            .lexer(start_offset, end_offset);
        if kw_kind == crate::JavaParsersym::TK_IDENTIFIER {
            kw_kind = default_kind;
        }
        self.lex_stream
            .make_token(start_offset, end_offset, kw_kind);
        if self.print_tokens {
            self.print_value(start_offset, end_offset);
        }
    }

    pub fn print_value(&self, start_offset: i32, end_offset: i32) {
        let chars = self.lex_stream.get_input_chars();
        let s: String = chars[start_offset as usize..=end_offset as usize]
            .iter()
            .collect();
        print!("{s}");
    }

    //#line 314 "LexerTemplateF.gi

    fn rule_action_impl(&mut self, rule_number: i32) {
        match rule_number {

            //
            // Rule 1:  Token ::= Identifier
            //
             1 => { 
                self.check_for_key_word();
                  },
    
            //
            // Rule 2:  Token ::= " SLBody "
            //
             2 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_StringLiteral);
                  },
    
            //
            // Rule 3:  Token ::= ' NotSQ '
            //
             3 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_CharacterLiteral);
                  },
    
            //
            // Rule 4:  Token ::= IntegerLiteral
            //
             4 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_IntegerLiteral);
                  },
    
            //
            // Rule 5:  Token ::= FloatingPointLiteral
            //
             5 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_FloatingPointLiteral);
                  },
    
            //
            // Rule 6:  Token ::= DoubleLiteral
            //
             6 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_DoubleLiteral);
                  },
    
            //
            // Rule 7:  Token ::= / * Inside Stars /
            //
             7 => { 
                self.skip_token();
                  },
    
            //
            // Rule 8:  Token ::= SLC
            //
             8 => { 
                self.skip_token();
                  },
    
            //
            // Rule 9:  Token ::= WS
            //
             9 => { 
                self.skip_token();
                  },
    
            //
            // Rule 10:  Token ::= +
            //
             10 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_PLUS);
                  },
    
            //
            // Rule 11:  Token ::= -
            //
             11 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_MINUS);
                  },
    
            //
            // Rule 12:  Token ::= *
            //
             12 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_MULTIPLY);
                  },
    
            //
            // Rule 13:  Token ::= /
            //
             13 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_DIVIDE);
                  },
    
            //
            // Rule 14:  Token ::= (
            //
             14 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_LPAREN);
                  },
    
            //
            // Rule 15:  Token ::= )
            //
             15 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_RPAREN);
                  },
    
            //
            // Rule 16:  Token ::= =
            //
             16 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_EQUAL);
                  },
    
            //
            // Rule 17:  Token ::= ,
            //
             17 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_COMMA);
                  },
    
            //
            // Rule 18:  Token ::= :
            //
             18 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_COLON);
                  },
    
            //
            // Rule 19:  Token ::= ;
            //
             19 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_SEMICOLON);
                  },
    
            //
            // Rule 20:  Token ::= ^
            //
             20 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_XOR);
                  },
    
            //
            // Rule 21:  Token ::= %
            //
             21 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_REMAINDER);
                  },
    
            //
            // Rule 22:  Token ::= ~
            //
             22 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_TWIDDLE);
                  },
    
            //
            // Rule 23:  Token ::= |
            //
             23 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_OR);
                  },
    
            //
            // Rule 24:  Token ::= &
            //
             24 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_AND);
                  },
    
            //
            // Rule 25:  Token ::= <
            //
             25 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_LESS);
                  },
    
            //
            // Rule 26:  Token ::= >
            //
             26 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_GREATER);
                  },
    
            //
            // Rule 27:  Token ::= .
            //
             27 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_DOT);
                  },
    
            //
            // Rule 28:  Token ::= !
            //
             28 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_NOT);
                  },
    
            //
            // Rule 29:  Token ::= [
            //
             29 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_LBRACKET);
                  },
    
            //
            // Rule 30:  Token ::= ]
            //
             30 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_RBRACKET);
                  },
    
            //
            // Rule 31:  Token ::= {
            //
             31 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_LBRACE);
                  },
    
            //
            // Rule 32:  Token ::= }
            //
             32 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_RBRACE);
                  },
    
            //
            // Rule 33:  Token ::= ?
            //
             33 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_QUESTION);
                  },
    
            //
            // Rule 34:  Token ::= @
            //
             34 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_AT);
                  },
    
            //
            // Rule 35:  Token ::= + +
            //
             35 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_PLUS_PLUS);
                  },
    
            //
            // Rule 36:  Token ::= - -
            //
             36 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_MINUS_MINUS);
                  },
    
            //
            // Rule 37:  Token ::= = =
            //
             37 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_EQUAL_EQUAL);
                  },
    
            //
            // Rule 38:  Token ::= < =
            //
             38 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_LESS_EQUAL);
                  },
    
            //
            // Rule 39:  Token ::= ! =
            //
             39 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_NOT_EQUAL);
                  },
    
            //
            // Rule 40:  Token ::= < <
            //
             40 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_LEFT_SHIFT);
                  },
    
            //
            // Rule 41:  Token ::= + =
            //
             41 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_PLUS_EQUAL);
                  },
    
            //
            // Rule 42:  Token ::= - =
            //
             42 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_MINUS_EQUAL);
                  },
    
            //
            // Rule 43:  Token ::= * =
            //
             43 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_MULTIPLY_EQUAL);
                  },
    
            //
            // Rule 44:  Token ::= / =
            //
             44 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_DIVIDE_EQUAL);
                  },
    
            //
            // Rule 45:  Token ::= & =
            //
             45 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_AND_EQUAL);
                  },
    
            //
            // Rule 46:  Token ::= | =
            //
             46 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_OR_EQUAL);
                  },
    
            //
            // Rule 47:  Token ::= ^ =
            //
             47 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_XOR_EQUAL);
                  },
    
            //
            // Rule 48:  Token ::= % =
            //
             48 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_REMAINDER_EQUAL);
                  },
    
            //
            // Rule 49:  Token ::= < < =
            //
             49 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_LEFT_SHIFT_EQUAL);
                  },
    
            //
            // Rule 50:  Token ::= | |
            //
             50 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_OR_OR);
                  },
    
            //
            // Rule 51:  Token ::= & &
            //
             51 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_AND_AND);
                  },
    
            //
            // Rule 52:  Token ::= . . .
            //
             52 => { 
                self.make_token_with_kind(crate::JavaParsersym::TK_ELLIPSIS);
                  },
    
    //#line 318 "LexerTemplateF.gi

    
            _ => {}
        }
    }
}

    //#line 3 "LexerBasicMapF.gi
 
#[derive(Clone)]
pub struct JavaLexerLpgLexStream {
    inner: LexStreamRef,
}

static JavaLexerLpgLexStream_TOKEN_KIND: [i32; 128] = [
        JavaLexersym::Char_CtlCharNotWS,    // 000    0x00
        JavaLexersym::Char_CtlCharNotWS,    // 001    0x01
        JavaLexersym::Char_CtlCharNotWS,    // 002    0x02
        JavaLexersym::Char_CtlCharNotWS,    // 003    0x03
        JavaLexersym::Char_CtlCharNotWS,    // 004    0x04
        JavaLexersym::Char_CtlCharNotWS,    // 005    0x05
        JavaLexersym::Char_CtlCharNotWS,    // 006    0x06
        JavaLexersym::Char_CtlCharNotWS,    // 007    0x07
        JavaLexersym::Char_CtlCharNotWS,    // 008    0x08
        JavaLexersym::Char_HT,              // 009    0x09
        JavaLexersym::Char_LF,              // 010    0x0A
        JavaLexersym::Char_CtlCharNotWS,    // 011    0x0B
        JavaLexersym::Char_FF,              // 012    0x0C
        JavaLexersym::Char_CR,              // 013    0x0D
        JavaLexersym::Char_CtlCharNotWS,    // 014    0x0E
        JavaLexersym::Char_CtlCharNotWS,    // 015    0x0F
        JavaLexersym::Char_CtlCharNotWS,    // 016    0x10
        JavaLexersym::Char_CtlCharNotWS,    // 017    0x11
        JavaLexersym::Char_CtlCharNotWS,    // 018    0x12
        JavaLexersym::Char_CtlCharNotWS,    // 019    0x13
        JavaLexersym::Char_CtlCharNotWS,    // 020    0x14
        JavaLexersym::Char_CtlCharNotWS,    // 021    0x15
        JavaLexersym::Char_CtlCharNotWS,    // 022    0x16
        JavaLexersym::Char_CtlCharNotWS,    // 023    0x17
        JavaLexersym::Char_CtlCharNotWS,    // 024    0x18
        JavaLexersym::Char_CtlCharNotWS,    // 025    0x19
        JavaLexersym::Char_CtlCharNotWS,    // 026    0x1A
        JavaLexersym::Char_CtlCharNotWS,    // 027    0x1B
        JavaLexersym::Char_CtlCharNotWS,    // 028    0x1C
        JavaLexersym::Char_CtlCharNotWS,    // 029    0x1D
        JavaLexersym::Char_CtlCharNotWS,    // 030    0x1E
        JavaLexersym::Char_CtlCharNotWS,    // 031    0x1F
        JavaLexersym::Char_Space,           // 032    0x20
        JavaLexersym::Char_Exclamation,     // 033    0x21
        JavaLexersym::Char_DoubleQuote,     // 034    0x22
        JavaLexersym::Char_Sharp,           // 035    0x23
        JavaLexersym::Char_DollarSign,      // 036    0x24
        JavaLexersym::Char_Percent,         // 037    0x25
        JavaLexersym::Char_Ampersand,       // 038    0x26
        JavaLexersym::Char_SingleQuote,     // 039    0x27
        JavaLexersym::Char_LeftParen,       // 040    0x28
        JavaLexersym::Char_RightParen,      // 041    0x29
        JavaLexersym::Char_Star,            // 042    0x2A
        JavaLexersym::Char_Plus,            // 043    0x2B
        JavaLexersym::Char_Comma,           // 044    0x2C
        JavaLexersym::Char_Minus,           // 045    0x2D
        JavaLexersym::Char_Dot,             // 046    0x2E
        JavaLexersym::Char_Slash,           // 047    0x2F
        JavaLexersym::Char_0,               // 048    0x30
        JavaLexersym::Char_1,               // 049    0x31
        JavaLexersym::Char_2,               // 050    0x32
        JavaLexersym::Char_3,               // 051    0x33
        JavaLexersym::Char_4,               // 052    0x34
        JavaLexersym::Char_5,               // 053    0x35
        JavaLexersym::Char_6,               // 054    0x36
        JavaLexersym::Char_7,               // 055    0x37
        JavaLexersym::Char_8,               // 056    0x38
        JavaLexersym::Char_9,               // 057    0x39
        JavaLexersym::Char_Colon,           // 058    0x3A
        JavaLexersym::Char_SemiColon,       // 059    0x3B
        JavaLexersym::Char_LessThan,        // 060    0x3C
        JavaLexersym::Char_Equal,           // 061    0x3D
        JavaLexersym::Char_GreaterThan,     // 062    0x3E
        JavaLexersym::Char_QuestionMark,    // 063    0x3F
        JavaLexersym::Char_AtSign,          // 064    0x40
        JavaLexersym::Char_A,               // 065    0x41
        JavaLexersym::Char_B,               // 066    0x42
        JavaLexersym::Char_C,               // 067    0x43
        JavaLexersym::Char_D,               // 068    0x44
        JavaLexersym::Char_E,               // 069    0x45
        JavaLexersym::Char_F,               // 070    0x46
        JavaLexersym::Char_G,               // 071    0x47
        JavaLexersym::Char_H,               // 072    0x48
        JavaLexersym::Char_I,               // 073    0x49
        JavaLexersym::Char_J,               // 074    0x4A
        JavaLexersym::Char_K,               // 075    0x4B
        JavaLexersym::Char_L,               // 076    0x4C
        JavaLexersym::Char_M,               // 077    0x4D
        JavaLexersym::Char_N,               // 078    0x4E
        JavaLexersym::Char_O,               // 079    0x4F
        JavaLexersym::Char_P,               // 080    0x50
        JavaLexersym::Char_Q,               // 081    0x51
        JavaLexersym::Char_R,               // 082    0x52
        JavaLexersym::Char_S,               // 083    0x53
        JavaLexersym::Char_T,               // 084    0x54
        JavaLexersym::Char_U,               // 085    0x55
        JavaLexersym::Char_V,               // 086    0x56
        JavaLexersym::Char_W,               // 087    0x57
        JavaLexersym::Char_X,               // 088    0x58
        JavaLexersym::Char_Y,               // 089    0x59
        JavaLexersym::Char_Z,               // 090    0x5A
        JavaLexersym::Char_LeftBracket,     // 091    0x5B
        JavaLexersym::Char_BackSlash,       // 092    0x5C
        JavaLexersym::Char_RightBracket,    // 093    0x5D
        JavaLexersym::Char_Caret,           // 094    0x5E
        JavaLexersym::Char__,               // 095    0x5F
        JavaLexersym::Char_BackQuote,       // 096    0x60
        JavaLexersym::Char_a,               // 097    0x61
        JavaLexersym::Char_b,               // 098    0x62
        JavaLexersym::Char_c,               // 099    0x63
        JavaLexersym::Char_d,               // 100    0x64
        JavaLexersym::Char_e,               // 101    0x65
        JavaLexersym::Char_f,               // 102    0x66
        JavaLexersym::Char_g,               // 103    0x67
        JavaLexersym::Char_h,               // 104    0x68
        JavaLexersym::Char_i,               // 105    0x69
        JavaLexersym::Char_j,               // 106    0x6A
        JavaLexersym::Char_k,               // 107    0x6B
        JavaLexersym::Char_l,               // 108    0x6C
        JavaLexersym::Char_m,               // 109    0x6D
        JavaLexersym::Char_n,               // 110    0x6E
        JavaLexersym::Char_o,               // 111    0x6F
        JavaLexersym::Char_p,               // 112    0x70
        JavaLexersym::Char_q,               // 113    0x71
        JavaLexersym::Char_r,               // 114    0x72
        JavaLexersym::Char_s,               // 115    0x73
        JavaLexersym::Char_t,               // 116    0x74
        JavaLexersym::Char_u,               // 117    0x75
        JavaLexersym::Char_v,               // 118    0x76
        JavaLexersym::Char_w,               // 119    0x77
        JavaLexersym::Char_x,               // 120    0x78
        JavaLexersym::Char_y,               // 121    0x79
        JavaLexersym::Char_z,               // 122    0x7A
        JavaLexersym::Char_LeftBrace,       // 123    0x7B
        JavaLexersym::Char_VerticalBar,     // 124    0x7C
        JavaLexersym::Char_RightBrace,      // 125    0x7D
        JavaLexersym::Char_Tilde,           // 126    0x7E
        JavaLexersym::Char_AfterASCII,      // 127    for all chars in range 128..65534
];

impl JavaLexerLpgLexStream {
    pub fn new(
        file_name: String,
        input_chars: Option<Vec<char>>,
        tab: i32,
    ) -> Result<Self, LpgException> {
        let inner = LexStream::new(file_name, input_chars, tab, None).map_err(|e| {
            LpgException::NullPointer(NullPointerException::new(&e.to_string()))
        })?;
        Ok(Self { inner })
    }

    pub fn get_input_chars(&self) -> Vec<char> {
        self.inner.borrow().get_input_chars()
    }

    pub fn get_stream_index(&self) -> i32 {
        self.inner.borrow().get_stream_index()
    }

    pub fn get_i_lex_stream(&self) -> LexStreamRef {
        self.inner.clone()
    }

    pub fn get_i_prs_stream(&self) -> Option<PrsStreamRef> {
        self.inner.borrow().get_i_prs_stream()
    }

    pub fn report_lexical_error_position(&mut self, left_loc: i32, right_loc: i32) {
        self.inner
            .borrow_mut()
            .report_lexical_error_position(left_loc, right_loc);
    }
}

impl TokenStream for JavaLexerLpgLexStream {
    fn get_token_from_end_token(&mut self, end_token: i32) -> i32 {
        self.inner.borrow_mut().get_token_from_end_token(end_token)
    }

    fn get_token(&mut self) -> i32 {
        self.inner.borrow_mut().get_token()
    }

    fn get_kind(&self, i: i32) -> i32 {
        let c = if i >= self.inner.borrow().get_stream_length() {
            0xffff
        } else {
            self.inner.borrow().get_int_value(i)
        };
        if c < 128 {
            JavaLexerLpgLexStream_TOKEN_KIND[c as usize]
        } else if c == 0xffff {
            JavaLexersym::Char_EOF
        } else {
            JavaLexersym::Char_AfterASCII
        }
    }

    fn get_next(&self, i: i32) -> i32 {
        self.inner.borrow().get_next(i)
    }

    fn get_previous(&self, i: i32) -> i32 {
        self.inner.borrow().get_previous(i)
    }

    fn get_name(&self, i: i32) -> String {
        self.inner.borrow().get_name(i)
    }

    fn peek(&self) -> i32 {
        self.inner.borrow().peek()
    }

    fn reset(&mut self) {
        self.inner.borrow_mut().reset()
    }

    fn reset_to(&mut self, i: i32) {
        self.inner.borrow_mut().reset_to(i)
    }

    fn bad_token(&self) -> i32 {
        self.inner.borrow().bad_token()
    }

    fn get_line(&self, i: i32) -> i32 {
        self.inner.borrow().get_line(i)
    }

    fn get_column(&self, i: i32) -> i32 {
        self.inner.borrow().get_column(i)
    }

    fn get_end_line(&self, i: i32) -> i32 {
        self.inner.borrow().get_end_line(i)
    }

    fn get_end_column(&self, i: i32) -> i32 {
        self.inner.borrow().get_end_column(i)
    }

    fn after_eol(&self, i: i32) -> bool {
        self.inner.borrow().after_eol(i)
    }

    fn get_file_name(&self) -> String {
        self.inner.borrow().get_file_name()
    }

    fn get_stream_length(&self) -> i32 {
        self.inner.borrow().get_stream_length()
    }

    fn get_first_real_token(&self, i: i32) -> i32 {
        self.inner.borrow().get_first_real_token(i)
    }

    fn get_last_real_token(&self, i: i32) -> i32 {
        self.inner.borrow().get_last_real_token(i)
    }

    fn report_error(
        &mut self,
        error_code: i32,
        left_token: i32,
        right_token: i32,
        error_info: &[String],
        error_token: i32,
    ) {
        self.inner.borrow_mut().report_error(
            error_code,
            left_token,
            right_token,
            error_info,
            error_token,
        )
    }
}

impl ILexStream for JavaLexerLpgLexStream {
    fn get_i_prs_stream(&self) -> Option<PrsStreamRef> {
        self.inner.borrow().get_i_prs_stream()
    }

    fn set_prs_stream(&mut self, stream: PrsStreamRef) {
        self.inner.borrow_mut().set_prs_stream(stream)
    }

    fn get_line_count(&self) -> i32 {
        self.inner.borrow().get_line_count()
    }

    fn get_stream_index(&self) -> i32 {
        self.inner.borrow().get_stream_index()
    }

    fn ordered_exported_symbols(&self) -> Option<Vec<String>> {
        Some(
            JavaParsersym::ORDERED_TERMINAL_SYMBOLS
                .iter()
                .map(|s| (*s).to_string())
                .collect(),
        )
    }

    fn get_line_offset(&self, i: i32) -> i32 {
        self.inner.borrow().get_line_offset(i)
    }

    fn get_line_number_of_char_at(&self, i: i32) -> i32 {
        self.inner.borrow().get_line_number_of_char_at(i)
    }

    fn get_column_of_char_at(&self, i: i32) -> i32 {
        self.inner.borrow().get_column_of_char_at(i)
    }

    fn get_char_value(&self, i: i32) -> String {
        self.inner.borrow().get_char_value(i)
    }

    fn get_input_chars(&self) -> Vec<char> {
        self.inner.borrow().get_input_chars()
    }

    fn get_int_value(&self, i: i32) -> i32 {
        self.inner.borrow().get_int_value(i)
    }

    fn make_token(&mut self, start_loc: i32, end_loc: i32, kind: i32) {
        self.inner.borrow_mut().make_token(start_loc, end_loc, kind)
    }

    fn set_message_handler(&mut self, handler: Rc<RefCell<dyn IMessageHandler>>) {
        self.inner.borrow_mut().set_message_handler(handler)
    }

    fn get_message_handler(&self) -> Option<Rc<RefCell<dyn IMessageHandler>>> {
        self.inner.borrow().get_message_handler()
    }

    fn get_location(&self, left_loc: i32, right_loc: i32) -> [i32; 6] {
        self.inner.borrow().get_location(left_loc, right_loc)
    }

    fn report_lexical_error_position(&mut self, left_loc: i32, right_loc: i32) {
        self.inner
            .borrow_mut()
            .report_lexical_error_position(left_loc, right_loc)
    }

    fn report_lexical_error(
        &mut self,
        left_loc: i32,
        right_loc: i32,
        error_code: i32,
        error_left_loc: i32,
        error_right_loc: i32,
        error_info: &[String],
    ) {
        self.inner.borrow_mut().report_lexical_error(
            left_loc,
            right_loc,
            error_code,
            error_left_loc,
            error_right_loc,
            error_info,
        )
    }

    fn to_string_range(&self, start_offset: i32, end_offset: i32) -> String {
        self.inner.borrow().to_string_range(start_offset, end_offset)
    }
}

