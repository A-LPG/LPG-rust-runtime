
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

type __LPGKWLexerexp__ struct{
   ALIAS_KEY int
   AST_KEY int
   DEFINE_KEY int
   DISJOINTPREDECESSORSETS_KEY int
   DROPRULES_KEY int
   DROPSYMBOLS_KEY int
   EMPTY_KEY int
   END_KEY int
   ERROR_KEY int
   EOL_KEY int
   EOF_KEY int
   EXPORT_KEY int
   GLOBALS_KEY int
   HEADERS_KEY int
   IDENTIFIER_KEY int
   IMPORT_KEY int
   INCLUDE_KEY int
   KEYWORDS_KEY int
   NAMES_KEY int
   NOTICE_KEY int
   OPTIONS_KEY int
   RECOVER_KEY int
   RULES_KEY int
   SOFT_KEYWORDS_KEY int
   START_KEY int
   TERMINALS_KEY int
   TRAILERS_KEY int
   TYPES_KEY int

   OrderedTerminalSymbols []string

   NumTokenKinds int

   IsValidForParser  bool
}
func New__LPGKWLexerexp__() *__LPGKWLexerexp__{
    my := new(__LPGKWLexerexp__)
   my.ALIAS_KEY = 1
   my.AST_KEY = 2
   my.DEFINE_KEY = 3
   my.DISJOINTPREDECESSORSETS_KEY = 4
   my.DROPRULES_KEY = 5
   my.DROPSYMBOLS_KEY = 6
   my.EMPTY_KEY = 7
   my.END_KEY = 8
   my.ERROR_KEY = 9
   my.EOL_KEY = 10
   my.EOF_KEY = 11
   my.EXPORT_KEY = 12
   my.GLOBALS_KEY = 13
   my.HEADERS_KEY = 14
   my.IDENTIFIER_KEY = 15
   my.IMPORT_KEY = 16
   my.INCLUDE_KEY = 17
   my.KEYWORDS_KEY = 18
   my.NAMES_KEY = 19
   my.NOTICE_KEY = 20
   my.OPTIONS_KEY = 21
   my.RECOVER_KEY = 22
   my.RULES_KEY = 23
   my.SOFT_KEYWORDS_KEY = 24
   my.START_KEY = 25
   my.TERMINALS_KEY = 26
   my.TRAILERS_KEY = 27
   my.TYPES_KEY = 28

   my.OrderedTerminalSymbols = []string{
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
             }

   my.NumTokenKinds = 28
   my.IsValidForParser = false


   return my
}
var LPGKWLexerexp = New__LPGKWLexerexp__()
