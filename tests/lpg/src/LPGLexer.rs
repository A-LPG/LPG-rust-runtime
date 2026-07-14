
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


    //#line 112 "LexerTemplateF.gi


    //#line 7 "LPGLexer.gi



    //#line 118 "LexerTemplateF.gi

struct LPGLexerRuleProxy {
    owner: *mut LPGLexer,
}

impl RuleAction for LPGLexerRuleProxy {
    fn rule_action(&mut self, rule_number: i32) {
        unsafe {
            (*self.owner).rule_action_impl(rule_number);
        }
    }
}

pub struct LPGLexer {
    kw_lexer: Option<LPGKWLexer>,
    print_tokens: bool,
    lex_parser: LexParser<LPGLexerLpgLexStream, LPGLexerprs, LPGLexerRuleProxy>,
    lex_stream: LPGLexerLpgLexStream,
    prs: LPGLexerprs,
}

impl LPGLexer {
    pub fn new(
        filename: String,
        tab: i32,
        input_chars: Option<Vec<char>>,
    ) -> Result<Box<Self>, LpgException> {
        let lex_stream = LPGLexerLpgLexStream::new(filename, input_chars, tab)?;
        let prs = LPGLexerprs;
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
            LPGLexerRuleProxy { owner },
        );
        boxed.reset_keyword_lexer();
        Ok(boxed)
    }

    pub fn get_parse_table(&self) -> &LPGLexerprs {
        &self.prs
    }

    pub fn get_parser(&mut self) -> &mut LexParser<LPGLexerLpgLexStream, LPGLexerprs, LPGLexerRuleProxy> {
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
            self.kw_lexer = Some(LPGKWLexer::new(
                self.lex_stream.get_input_chars(),
                crate::LPGParsersym::TK_MACRO_NAME,
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
        self.lex_stream = LPGLexerLpgLexStream::new(filename, input_chars, tab)?;
        let owner = self as *mut Self;
        self.lex_parser.reset(
            self.lex_stream.clone(),
            self.prs.clone(),
            LPGLexerRuleProxy { owner },
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
            .make_token(end_offset, end_offset, crate::LPGParsersym::TK_EOF_TOKEN);
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

    //#line 12 "LPGLexer.gi

 
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
        if kw_kind == crate::LPGParsersym::TK_MACRO_NAME {
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
            // Rule 1:  Token ::= white
            //
             1 => { 
             self.skip_token();             },

            //
            // Rule 2:  Token ::= singleLineComment
            //
             2 => { 
             self.make_comment(crate::LPGParsersym::TK_SINGLE_LINE_COMMENT);
                  },
            //
            // Rule 4:  Token ::= MacroSymbol
            //
             4 => { 
             self.check_for_key_word();            },

            //
            // Rule 5:  Token ::= Symbol
            //
             5 => { 
             self.check_for_key_word_with_kind(crate::LPGParsersym::TK_SYMBOL);            },

            //
            // Rule 6:  Token ::= Block
            //
             6 => { 
             self.make_token_with_kind(crate::LPGParsersym::TK_BLOCK);            },

            //
            // Rule 7:  Token ::= Equivalence
            //
             7 => { 
             self.make_token_with_kind(crate::LPGParsersym::TK_EQUIVALENCE);            },

            //
            // Rule 8:  Token ::= Equivalence ?
            //
             8 => { 
             self.make_token_with_kind(crate::LPGParsersym::TK_PRIORITY_EQUIVALENCE);            },

            //
            // Rule 9:  Token ::= #
            //
             9 => { 
             self.make_token_with_kind(crate::LPGParsersym::TK_SHARP);            },

            //
            // Rule 10:  Token ::= Arrow
            //
             10 => { 
             self.make_token_with_kind(crate::LPGParsersym::TK_ARROW);            },

            //
            // Rule 11:  Token ::= Arrow ?
            //
             11 => { 
             self.make_token_with_kind(crate::LPGParsersym::TK_PRIORITY_ARROW);            },

            //
            // Rule 12:  Token ::= |
            //
             12 => { 
             self.make_token_with_kind(crate::LPGParsersym::TK_OR_MARKER);            },

            //
            // Rule 13:  Token ::= [
            //
             13 => { 
             self.make_token_with_kind(crate::LPGParsersym::TK_LEFT_BRACKET);            },

            //
            // Rule 14:  Token ::= ]
            //
             14 => { 
             self.make_token_with_kind(crate::LPGParsersym::TK_RIGHT_BRACKET);
                  },
            //
            // Rule 858:  OptionLines ::= OptionLineList
            //
             858 => { 
            
                  // What ever needs to happen after the options have been 
                  // scanned must happen here.
                    },
      
            //
            // Rule 867:  options ::= % oO pP tT iI oO nN sS
            //
             867 => { 
            
                  self.make_token(self.get_left_span(), self.get_right_span(), crate::LPGParsersym::TK_OPTIONS_KEY);
                    },
      
            //
            // Rule 868:  OptionComment ::= singleLineComment
            //
             868 => { 
             self.make_comment(crate::LPGParsersym::TK_SINGLE_LINE_COMMENT);             },

            //
            // Rule 892:  separator ::= ,$comma
            //
             892 => { 
              self.make_token(self.get_left_span(), self.get_right_span(), crate::LPGParsersym::TK_COMMA);             },

            //
            // Rule 893:  option ::= action_block$ab optionWhite =$eq optionWhite ($lp optionWhite filename$fn optionWhite ,$comma1 optionWhite block_begin$bb optionWhite ,$comma2 optionWhite block_end$be optionWhite )$rp optionWhite
            //
             893 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_LEFT_PAREN);
                  self.make_token(self.get_rhs_first_token_index(7), self.get_rhs_last_token_index(7), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(9), self.get_rhs_last_token_index(9), crate::LPGParsersym::TK_COMMA);
                  self.make_token(self.get_rhs_first_token_index(11), self.get_rhs_last_token_index(11), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(13), self.get_rhs_last_token_index(13), crate::LPGParsersym::TK_COMMA);
                  self.make_token(self.get_rhs_first_token_index(15), self.get_rhs_last_token_index(15), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(17), self.get_rhs_last_token_index(17), crate::LPGParsersym::TK_RIGHT_PAREN);
                    },
      
            //
            // Rule 896:  option ::= ast_block$ab optionWhite =$eq optionWhite ($lp optionWhite block_begin$bb optionWhite ,$comma2 optionWhite block_end$be optionWhite )$rp optionWhite
            //
             896 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_LEFT_PAREN);

                  self.make_token(self.get_rhs_first_token_index(7), self.get_rhs_last_token_index(7), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(9), self.get_rhs_last_token_index(9), crate::LPGParsersym::TK_COMMA);
                  self.make_token(self.get_rhs_first_token_index(11), self.get_rhs_last_token_index(11), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(13), self.get_rhs_last_token_index(13), crate::LPGParsersym::TK_RIGHT_PAREN);
                    },
      
            //
            // Rule 901:  option ::= ast_directory$ad optionWhite =$eq optionWhite Value$val optionWhite
            //
             901 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 904:  option ::= ast_type$at optionWhite =$eq optionWhite Value$val optionWhite
            //
             904 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 907:  option ::= attributes$a optionWhite
            //
             907 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 908:  option ::= no attributes$a optionWhite
            //
             908 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 910:  option ::= automatic_ast$a optionWhite
            //
             910 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 911:  option ::= no automatic_ast$a optionWhite
            //
             911 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 912:  option ::= automatic_ast$aa optionWhite =$eq optionWhite automatic_ast_value$val optionWhite
            //
             912 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 916:  option ::= backtrack$b optionWhite
            //
             916 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 917:  option ::= no backtrack$b optionWhite
            //
             917 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 919:  option ::= byte$b optionWhite
            //
             919 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 920:  option ::= no byte$b optionWhite
            //
             920 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 922:  option ::= conflicts$c optionWhite
            //
             922 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 923:  option ::= no conflicts$c optionWhite
            //
             923 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 925:  option ::= dat_directory$dd optionWhite =$eq optionWhite Value$val optionWhite
            //
             925 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 928:  option ::= dat_file$df optionWhite =$eq optionWhite Value$val optionWhite
            //
             928 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 930:  option ::= dcl_file$df optionWhite =$eq optionWhite Value$val optionWhite
            //
             930 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 932:  option ::= def_file$df optionWhite =$eq optionWhite Value$val optionWhite
            //
             932 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 934:  option ::= debug$d optionWhite
            //
             934 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 935:  option ::= no debug$d optionWhite
            //
             935 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 937:  option ::= edit$e optionWhite
            //
             937 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 938:  option ::= no edit$e optionWhite
            //
             938 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 940:  option ::= error_maps$e optionWhite
            //
             940 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 941:  option ::= no error_maps$e optionWhite
            //
             941 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 944:  option ::= escape$e optionWhite =$eq optionWhite anyNonWhiteChar$val optionWhite
            //
             944 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                
                    },
      
            //
            // Rule 946:  option ::= export_terminals$et optionWhite =$eq optionWhite filename$fn optionWhite
            //
             946 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 947:  option ::= export_terminals$et optionWhite =$eq optionWhite ($lp optionWhite filename$fn optionWhite )$rp optionWhite
            //
             947 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_LEFT_PAREN);
                  self.make_token(self.get_rhs_first_token_index(7), self.get_rhs_last_token_index(7), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(9), self.get_rhs_last_token_index(9), crate::LPGParsersym::TK_RIGHT_PAREN);
                    },
      
            //
            // Rule 948:  option ::= export_terminals$et optionWhite =$eq optionWhite ($lp optionWhite filename$fn optionWhite ,$comma optionWhite export_prefix$ep optionWhite )$rp optionWhite
            //
             948 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_LEFT_PAREN);
                  self.make_token(self.get_rhs_first_token_index(7), self.get_rhs_last_token_index(7), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(9), self.get_rhs_last_token_index(9), crate::LPGParsersym::TK_COMMA);
                  self.make_token(self.get_rhs_first_token_index(11), self.get_rhs_last_token_index(11), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(13), self.get_rhs_last_token_index(13), crate::LPGParsersym::TK_RIGHT_PAREN);
                    },
      
            //
            // Rule 949:  option ::= export_terminals$et optionWhite =$eq optionWhite ($lp optionWhite filename$fn optionWhite ,$comma1 optionWhite export_prefix$ep optionWhite ,$comma2 optionWhite export_suffix$es optionWhite )$rp optionWhite
            //
             949 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_LEFT_PAREN);
                  self.make_token(self.get_rhs_first_token_index(7), self.get_rhs_last_token_index(7), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(9), self.get_rhs_last_token_index(9), crate::LPGParsersym::TK_COMMA);
                  self.make_token(self.get_rhs_first_token_index(11), self.get_rhs_last_token_index(11), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(13), self.get_rhs_last_token_index(13), crate::LPGParsersym::TK_COMMA);
                  self.make_token(self.get_rhs_first_token_index(15), self.get_rhs_last_token_index(15), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(17), self.get_rhs_last_token_index(17), crate::LPGParsersym::TK_RIGHT_PAREN);
                    },
      
            //
            // Rule 954:  option ::= extends_parsetable$e optionWhite
            //
             954 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 955:  option ::= no extends_parsetable$e optionWhite
            //
             955 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 956:  option ::= extends_parsetable$ep optionWhite =$eq optionWhite Value$val optionWhite
            //
             956 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 959:  option ::= factory$f optionWhite =$eq optionWhite Value$val optionWhite
            //
             959 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 961:  option ::= file_prefix$fp optionWhite =$eq optionWhite Value$val optionWhite
            //
             961 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 964:  option ::= filter$f optionWhite =$eq optionWhite Value$val optionWhite
            //
             964 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 966:  option ::= first$f optionWhite
            //
             966 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 967:  option ::= no first$f optionWhite
            //
             967 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 969:  option ::= follow$f optionWhite
            //
             969 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 970:  option ::= no follow$f optionWhite
            //
             970 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 972:  option ::= goto_default$g optionWhite
            //
             972 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 973:  option ::= no goto_default$g optionWhite
            //
             973 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 976:  option ::= headers$h optionWhite =$eq optionWhite ($lp optionWhite filename$fn optionWhite ,$comma1 optionWhite block_begin$bb optionWhite ,$comma2 optionWhite block_end$be optionWhite )$rp optionWhite
            //
             976 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_LEFT_PAREN);
                  self.make_token(self.get_rhs_first_token_index(7), self.get_rhs_last_token_index(7), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(9), self.get_rhs_last_token_index(9), crate::LPGParsersym::TK_COMMA);
                  self.make_token(self.get_rhs_first_token_index(11), self.get_rhs_last_token_index(11), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(13), self.get_rhs_last_token_index(13), crate::LPGParsersym::TK_COMMA);
                  self.make_token(self.get_rhs_first_token_index(15), self.get_rhs_last_token_index(15), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(17), self.get_rhs_last_token_index(17), crate::LPGParsersym::TK_RIGHT_PAREN);
                    },
      
            //
            // Rule 978:  option ::= imp_file$if optionWhite =$eq optionWhite Value$val optionWhite
            //
             978 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 981:  option ::= import_terminals$it optionWhite =$eq optionWhite Value$val optionWhite
            //
             981 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 984:  option ::= include_directory$id optionWhite =$eq optionWhite Value$val optionWhite
            //
             984 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 988:  option ::= lalr_level$l optionWhite
            //
             988 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 989:  option ::= no lalr_level$l optionWhite
            //
             989 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 990:  option ::= lalr_level$l optionWhite =$eq optionWhite number$val optionWhite
            //
             990 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 995:  option ::= list$l optionWhite
            //
             995 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 996:  option ::= no list$l optionWhite
            //
             996 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 998:  option ::= margin$m optionWhite =$eq optionWhite number$val optionWhite
            //
             998 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1000:  option ::= max_cases$mc optionWhite =$eq optionWhite number$val optionWhite
            //
             1000 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1003:  option ::= names$n optionWhite
            //
             1003 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 1004:  option ::= no names$n optionWhite
            //
             1004 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 1005:  option ::= names$n optionWhite =$eq optionWhite names_value$val optionWhite
            //
             1005 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1010:  option ::= nt_check$n optionWhite
            //
             1010 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 1011:  option ::= no nt_check$n optionWhite
            //
             1011 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 1014:  option ::= or_marker$om optionWhite =$eq optionWhite anyNonWhiteChar$val optionWhite
            //
             1014 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1017:  option ::= out_directory$dd optionWhite =$eq optionWhite Value$val optionWhite
            //
             1017 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1020:  option ::= parent_saved$ps optionWhite
            //
             1020 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1021:  option ::= no parent_saved$ps optionWhite
            //
             1021 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1024:  option ::= package$p optionWhite =$eq optionWhite Value$val optionWhite
            //
             1024 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1026:  option ::= parsetable_interfaces$pi optionWhite =$eq optionWhite Value$val optionWhite
            //
             1026 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1030:  option ::= prefix$p optionWhite =$eq optionWhite Value$val optionWhite
            //
             1030 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1032:  option ::= priority$p optionWhite
            //
             1032 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 1033:  option ::= no priority$p optionWhite
            //
             1033 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 1035:  option ::= programming_language$pl optionWhite =$eq optionWhite programming_language_value$val optionWhite
            //
             1035 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1039:  option ::= prs_file$pf optionWhite =$eq optionWhite Value$val optionWhite
            //
             1039 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1042:  option ::= quiet$q optionWhite
            //
             1042 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 1043:  option ::= no quiet$q optionWhite
            //
             1043 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 1045:  option ::= read_reduce$r optionWhite
            //
             1045 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 1046:  option ::= no read_reduce$r optionWhite
            //
             1046 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 1049:  option ::= remap_terminals$r optionWhite
            //
             1049 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 1050:  option ::= no remap_terminals$r optionWhite
            //
             1050 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             },

            //
            // Rule 1053:  option ::= scopes$s optionWhite
            //
             1053 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1054:  option ::= no scopes$s optionWhite
            //
             1054 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1056:  option ::= serialize$s optionWhite
            //
             1056 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1057:  option ::= no serialize$s optionWhite
            //
             1057 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1059:  option ::= shift_default$s optionWhite
            //
             1059 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1060:  option ::= no shift_default$s optionWhite
            //
             1060 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1063:  option ::= single_productions$s optionWhite
            //
             1063 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1064:  option ::= no single_productions$s optionWhite
            //
             1064 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1067:  option ::= slr$s optionWhite
            //
             1067 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1068:  option ::= no slr$s optionWhite
            //
             1068 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1070:  option ::= soft_keywords$s optionWhite
            //
             1070 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1071:  option ::= no soft_keywords$s optionWhite
            //
             1071 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1075:  option ::= states$s optionWhite
            //
             1075 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1076:  option ::= no states$s optionWhite
            //
             1076 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1078:  option ::= suffix$s optionWhite =$eq optionWhite Value$val optionWhite
            //
             1078 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1080:  option ::= sym_file$sf optionWhite =$eq optionWhite Value$val optionWhite
            //
             1080 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1083:  option ::= tab_file$tf optionWhite =$eq optionWhite Value$val optionWhite
            //
             1083 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1086:  option ::= template$t optionWhite =$eq optionWhite Value$val optionWhite
            //
             1086 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1088:  option ::= trailers$t optionWhite =$eq optionWhite ($lp optionWhite filename$fn optionWhite ,$comma1 optionWhite block_begin$bb optionWhite ,$comma2 optionWhite block_end$be optionWhite )$rp optionWhite
            //
             1088 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_LEFT_PAREN);
                  self.make_token(self.get_rhs_first_token_index(7), self.get_rhs_last_token_index(7), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(9), self.get_rhs_last_token_index(9), crate::LPGParsersym::TK_COMMA);
                  self.make_token(self.get_rhs_first_token_index(11), self.get_rhs_last_token_index(11), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(13), self.get_rhs_last_token_index(13), crate::LPGParsersym::TK_COMMA);
                  self.make_token(self.get_rhs_first_token_index(15), self.get_rhs_last_token_index(15), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(17), self.get_rhs_last_token_index(17), crate::LPGParsersym::TK_RIGHT_PAREN);
                    },
      
            //
            // Rule 1090:  option ::= table$t optionWhite
            //
             1090 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1091:  option ::= no table$t optionWhite
            //
             1091 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1092:  option ::= table$t optionWhite =$eq optionWhite programming_language_value$val optionWhite
            //
             1092 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1094:  option ::= trace$t optionWhite
            //
             1094 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1095:  option ::= no trace$t optionWhite
            //
             1095 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1096:  option ::= trace$t optionWhite =$eq optionWhite trace_value$val optionWhite
            //
             1096 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1101:  option ::= variables$v optionWhite
            //
             1101 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1102:  option ::= no variables$v optionWhite
            //
             1102 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1103:  option ::= variables$v optionWhite =$eq optionWhite variables_value$val optionWhite
            //
             1103 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1110:  option ::= verbose$v optionWhite
            //
             1110 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1111:  option ::= no verbose$v optionWhite
            //
             1111 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1113:  option ::= visitor$v optionWhite
            //
             1113 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1114:  option ::= no visitor$v optionWhite
            //
             1114 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1115:  option ::= visitor$v optionWhite =$eq optionWhite visitor_value$val optionWhite
            //
             1115 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1120:  option ::= visitor_type$vt optionWhite =$eq optionWhite Value$val optionWhite
            //
             1120 => { 
            
                  self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);
                  self.make_token(self.get_rhs_first_token_index(3), self.get_rhs_last_token_index(3), crate::LPGParsersym::TK_EQUAL);
                  self.make_token(self.get_rhs_first_token_index(5), self.get_rhs_last_token_index(5), crate::LPGParsersym::TK_SYMBOL);
                    },
      
            //
            // Rule 1123:  option ::= warnings$w optionWhite
            //
             1123 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1124:  option ::= no warnings$w optionWhite
            //
             1124 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1126:  option ::= xreference$x optionWhite
            //
             1126 => { 
              self.make_token(self.get_rhs_first_token_index(1), self.get_rhs_last_token_index(1), crate::LPGParsersym::TK_SYMBOL);             }, 

            //
            // Rule 1127:  option ::= no xreference$x optionWhite
            //
             1127 => { 
              self.make_token(self.get_rhs_first_token_index(2), self.get_rhs_last_token_index(2), crate::LPGParsersym::TK_SYMBOL);
                  }, 
    //#line 318 "LexerTemplateF.gi

    
            _ => {}
        }
    }
}

    //#line 3 "LexerBasicMapF.gi
 
#[derive(Clone)]
pub struct LPGLexerLpgLexStream {
    inner: LexStreamRef,
}

static LPGLexerLpgLexStream_TOKEN_KIND: [i32; 128] = [
        LPGLexersym::Char_CtlCharNotWS,    // 000    0x00
        LPGLexersym::Char_CtlCharNotWS,    // 001    0x01
        LPGLexersym::Char_CtlCharNotWS,    // 002    0x02
        LPGLexersym::Char_CtlCharNotWS,    // 003    0x03
        LPGLexersym::Char_CtlCharNotWS,    // 004    0x04
        LPGLexersym::Char_CtlCharNotWS,    // 005    0x05
        LPGLexersym::Char_CtlCharNotWS,    // 006    0x06
        LPGLexersym::Char_CtlCharNotWS,    // 007    0x07
        LPGLexersym::Char_CtlCharNotWS,    // 008    0x08
        LPGLexersym::Char_HT,              // 009    0x09
        LPGLexersym::Char_LF,              // 010    0x0A
        LPGLexersym::Char_CtlCharNotWS,    // 011    0x0B
        LPGLexersym::Char_FF,              // 012    0x0C
        LPGLexersym::Char_CR,              // 013    0x0D
        LPGLexersym::Char_CtlCharNotWS,    // 014    0x0E
        LPGLexersym::Char_CtlCharNotWS,    // 015    0x0F
        LPGLexersym::Char_CtlCharNotWS,    // 016    0x10
        LPGLexersym::Char_CtlCharNotWS,    // 017    0x11
        LPGLexersym::Char_CtlCharNotWS,    // 018    0x12
        LPGLexersym::Char_CtlCharNotWS,    // 019    0x13
        LPGLexersym::Char_CtlCharNotWS,    // 020    0x14
        LPGLexersym::Char_CtlCharNotWS,    // 021    0x15
        LPGLexersym::Char_CtlCharNotWS,    // 022    0x16
        LPGLexersym::Char_CtlCharNotWS,    // 023    0x17
        LPGLexersym::Char_CtlCharNotWS,    // 024    0x18
        LPGLexersym::Char_CtlCharNotWS,    // 025    0x19
        LPGLexersym::Char_CtlCharNotWS,    // 026    0x1A
        LPGLexersym::Char_CtlCharNotWS,    // 027    0x1B
        LPGLexersym::Char_CtlCharNotWS,    // 028    0x1C
        LPGLexersym::Char_CtlCharNotWS,    // 029    0x1D
        LPGLexersym::Char_CtlCharNotWS,    // 030    0x1E
        LPGLexersym::Char_CtlCharNotWS,    // 031    0x1F
        LPGLexersym::Char_Space,           // 032    0x20
        LPGLexersym::Char_Exclamation,     // 033    0x21
        LPGLexersym::Char_DoubleQuote,     // 034    0x22
        LPGLexersym::Char_Sharp,           // 035    0x23
        LPGLexersym::Char_DollarSign,      // 036    0x24
        LPGLexersym::Char_Percent,         // 037    0x25
        LPGLexersym::Char_Ampersand,       // 038    0x26
        LPGLexersym::Char_SingleQuote,     // 039    0x27
        LPGLexersym::Char_LeftParen,       // 040    0x28
        LPGLexersym::Char_RightParen,      // 041    0x29
        LPGLexersym::Char_Star,            // 042    0x2A
        LPGLexersym::Char_Plus,            // 043    0x2B
        LPGLexersym::Char_Comma,           // 044    0x2C
        LPGLexersym::Char_Minus,           // 045    0x2D
        LPGLexersym::Char_Dot,             // 046    0x2E
        LPGLexersym::Char_Slash,           // 047    0x2F
        LPGLexersym::Char_0,               // 048    0x30
        LPGLexersym::Char_1,               // 049    0x31
        LPGLexersym::Char_2,               // 050    0x32
        LPGLexersym::Char_3,               // 051    0x33
        LPGLexersym::Char_4,               // 052    0x34
        LPGLexersym::Char_5,               // 053    0x35
        LPGLexersym::Char_6,               // 054    0x36
        LPGLexersym::Char_7,               // 055    0x37
        LPGLexersym::Char_8,               // 056    0x38
        LPGLexersym::Char_9,               // 057    0x39
        LPGLexersym::Char_Colon,           // 058    0x3A
        LPGLexersym::Char_SemiColon,       // 059    0x3B
        LPGLexersym::Char_LessThan,        // 060    0x3C
        LPGLexersym::Char_Equal,           // 061    0x3D
        LPGLexersym::Char_GreaterThan,     // 062    0x3E
        LPGLexersym::Char_QuestionMark,    // 063    0x3F
        LPGLexersym::Char_AtSign,          // 064    0x40
        LPGLexersym::Char_A,               // 065    0x41
        LPGLexersym::Char_B,               // 066    0x42
        LPGLexersym::Char_C,               // 067    0x43
        LPGLexersym::Char_D,               // 068    0x44
        LPGLexersym::Char_E,               // 069    0x45
        LPGLexersym::Char_F,               // 070    0x46
        LPGLexersym::Char_G,               // 071    0x47
        LPGLexersym::Char_H,               // 072    0x48
        LPGLexersym::Char_I,               // 073    0x49
        LPGLexersym::Char_J,               // 074    0x4A
        LPGLexersym::Char_K,               // 075    0x4B
        LPGLexersym::Char_L,               // 076    0x4C
        LPGLexersym::Char_M,               // 077    0x4D
        LPGLexersym::Char_N,               // 078    0x4E
        LPGLexersym::Char_O,               // 079    0x4F
        LPGLexersym::Char_P,               // 080    0x50
        LPGLexersym::Char_Q,               // 081    0x51
        LPGLexersym::Char_R,               // 082    0x52
        LPGLexersym::Char_S,               // 083    0x53
        LPGLexersym::Char_T,               // 084    0x54
        LPGLexersym::Char_U,               // 085    0x55
        LPGLexersym::Char_V,               // 086    0x56
        LPGLexersym::Char_W,               // 087    0x57
        LPGLexersym::Char_X,               // 088    0x58
        LPGLexersym::Char_Y,               // 089    0x59
        LPGLexersym::Char_Z,               // 090    0x5A
        LPGLexersym::Char_LeftBracket,     // 091    0x5B
        LPGLexersym::Char_BackSlash,       // 092    0x5C
        LPGLexersym::Char_RightBracket,    // 093    0x5D
        LPGLexersym::Char_Caret,           // 094    0x5E
        LPGLexersym::Char__,               // 095    0x5F
        LPGLexersym::Char_BackQuote,       // 096    0x60
        LPGLexersym::Char_a,               // 097    0x61
        LPGLexersym::Char_b,               // 098    0x62
        LPGLexersym::Char_c,               // 099    0x63
        LPGLexersym::Char_d,               // 100    0x64
        LPGLexersym::Char_e,               // 101    0x65
        LPGLexersym::Char_f,               // 102    0x66
        LPGLexersym::Char_g,               // 103    0x67
        LPGLexersym::Char_h,               // 104    0x68
        LPGLexersym::Char_i,               // 105    0x69
        LPGLexersym::Char_j,               // 106    0x6A
        LPGLexersym::Char_k,               // 107    0x6B
        LPGLexersym::Char_l,               // 108    0x6C
        LPGLexersym::Char_m,               // 109    0x6D
        LPGLexersym::Char_n,               // 110    0x6E
        LPGLexersym::Char_o,               // 111    0x6F
        LPGLexersym::Char_p,               // 112    0x70
        LPGLexersym::Char_q,               // 113    0x71
        LPGLexersym::Char_r,               // 114    0x72
        LPGLexersym::Char_s,               // 115    0x73
        LPGLexersym::Char_t,               // 116    0x74
        LPGLexersym::Char_u,               // 117    0x75
        LPGLexersym::Char_v,               // 118    0x76
        LPGLexersym::Char_w,               // 119    0x77
        LPGLexersym::Char_x,               // 120    0x78
        LPGLexersym::Char_y,               // 121    0x79
        LPGLexersym::Char_z,               // 122    0x7A
        LPGLexersym::Char_LeftBrace,       // 123    0x7B
        LPGLexersym::Char_VerticalBar,     // 124    0x7C
        LPGLexersym::Char_RightBrace,      // 125    0x7D
        LPGLexersym::Char_Tilde,           // 126    0x7E
        LPGLexersym::Char_AfterASCII,      // 127    for all chars in range 128..65534
];

impl LPGLexerLpgLexStream {
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

impl TokenStream for LPGLexerLpgLexStream {
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
            LPGLexerLpgLexStream_TOKEN_KIND[c as usize]
        } else if c == 0xffff {
            LPGLexersym::Char_EOF
        } else {
            LPGLexersym::Char_AfterASCII
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

impl ILexStream for LPGLexerLpgLexStream {
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
            LPGLexersym::ORDERED_TERMINAL_SYMBOLS
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

