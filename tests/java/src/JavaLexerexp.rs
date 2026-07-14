
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

// mod LpgJava
pub struct JavaLexerexp;

impl JavaLexerexp {
    pub const r#abstract: i32 = 1;
    pub const r#assert: i32 = 2;
    pub const r#boolean: i32 = 3;
    pub const r#break: i32 = 4;
    pub const r#byte: i32 = 5;
    pub const r#case: i32 = 6;
    pub const r#catch: i32 = 7;
    pub const r#char: i32 = 8;
    pub const r#class: i32 = 9;
    pub const r#const: i32 = 10;
    pub const r#continue: i32 = 11;
    pub const r#default: i32 = 12;
    pub const r#do: i32 = 13;
    pub const r#double: i32 = 14;
    pub const r#enum: i32 = 15;
    pub const r#else: i32 = 16;
    pub const r#extends: i32 = 17;
    pub const r#false: i32 = 18;
    pub const r#final: i32 = 19;
    pub const r#finally: i32 = 20;
    pub const r#float: i32 = 21;
    pub const r#for: i32 = 22;
    pub const r#goto: i32 = 23;
    pub const r#if: i32 = 24;
    pub const r#implements: i32 = 25;
    pub const r#import: i32 = 26;
    pub const r#instanceof: i32 = 27;
    pub const r#int: i32 = 28;
    pub const r#interface: i32 = 29;
    pub const r#long: i32 = 30;
    pub const r#native: i32 = 31;
    pub const r#new: i32 = 32;
    pub const r#null: i32 = 33;
    pub const r#package: i32 = 34;
    pub const r#private: i32 = 35;
    pub const r#protected: i32 = 36;
    pub const r#public: i32 = 37;
    pub const r#return: i32 = 38;
    pub const r#short: i32 = 39;
    pub const r#static: i32 = 40;
    pub const r#strictfp: i32 = 41;
    pub const KW_super: i32 = 42;
    pub const r#switch: i32 = 43;
    pub const r#synchronized: i32 = 44;
    pub const r#this: i32 = 45;
    pub const r#throw: i32 = 46;
    pub const r#throws: i32 = 47;
    pub const r#transient: i32 = 48;
    pub const r#true: i32 = 49;
    pub const r#try: i32 = 50;
    pub const r#void: i32 = 51;
    pub const r#volatile: i32 = 52;
    pub const r#while: i32 = 53;
    pub const BeginAction: i32 = 54;
    pub const BeginJava: i32 = 55;
    pub const EndAction: i32 = 56;
    pub const EndJava: i32 = 57;
    pub const NoAction: i32 = 58;
    pub const NullAction: i32 = 59;
    pub const BadAction: i32 = 60;
    pub const EOF_TOKEN: i32 = 61;
    pub const IDENTIFIER: i32 = 62;
    pub const IntegerLiteral: i32 = 63;
    pub const LongLiteral: i32 = 64;
    pub const FloatingPointLiteral: i32 = 65;
    pub const DoubleLiteral: i32 = 66;
    pub const CharacterLiteral: i32 = 67;
    pub const StringLiteral: i32 = 68;
    pub const PLUS_PLUS: i32 = 69;
    pub const MINUS_MINUS: i32 = 70;
    pub const EQUAL_EQUAL: i32 = 71;
    pub const LESS_EQUAL: i32 = 72;
    pub const GREATER_EQUAL: i32 = 73;
    pub const NOT_EQUAL: i32 = 74;
    pub const LEFT_SHIFT: i32 = 75;
    pub const RIGHT_SHIFT: i32 = 76;
    pub const UNSIGNED_RIGHT_SHIFT: i32 = 77;
    pub const PLUS_EQUAL: i32 = 78;
    pub const MINUS_EQUAL: i32 = 79;
    pub const MULTIPLY_EQUAL: i32 = 80;
    pub const DIVIDE_EQUAL: i32 = 81;
    pub const AND_EQUAL: i32 = 82;
    pub const OR_EQUAL: i32 = 83;
    pub const XOR_EQUAL: i32 = 84;
    pub const REMAINDER_EQUAL: i32 = 85;
    pub const LEFT_SHIFT_EQUAL: i32 = 86;
    pub const RIGHT_SHIFT_EQUAL: i32 = 87;
    pub const UNSIGNED_RIGHT_SHIFT_EQUAL: i32 = 88;
    pub const OR_OR: i32 = 89;
    pub const AND_AND: i32 = 90;
    pub const PLUS: i32 = 91;
    pub const MINUS: i32 = 92;
    pub const NOT: i32 = 93;
    pub const REMAINDER: i32 = 94;
    pub const XOR: i32 = 95;
    pub const AND: i32 = 96;
    pub const MULTIPLY: i32 = 97;
    pub const OR: i32 = 98;
    pub const TWIDDLE: i32 = 99;
    pub const DIVIDE: i32 = 100;
    pub const GREATER: i32 = 101;
    pub const LESS: i32 = 102;
    pub const LPAREN: i32 = 103;
    pub const RPAREN: i32 = 104;
    pub const LBRACE: i32 = 105;
    pub const RBRACE: i32 = 106;
    pub const LBRACKET: i32 = 107;
    pub const RBRACKET: i32 = 108;
    pub const SEMICOLON: i32 = 109;
    pub const QUESTION: i32 = 110;
    pub const AT: i32 = 111;
    pub const COLON: i32 = 112;
    pub const COMMA: i32 = 113;
    pub const DOT: i32 = 114;
    pub const EQUAL: i32 = 115;
    pub const ELLIPSIS: i32 = 116;

    pub const ORDERED_TERMINAL_SYMBOLS: &[&str] = &[
        "",
        "abstract",
        "assert",
        "boolean",
        "break",
        "byte",
        "case",
        "catch",
        "char",
        "class",
        "const",
        "continue",
        "default",
        "do",
        "double",
        "enum",
        "else",
        "extends",
        "false",
        "final",
        "finally",
        "float",
        "for",
        "goto",
        "if",
        "implements",
        "import",
        "instanceof",
        "int",
        "interface",
        "long",
        "native",
        "new",
        "null",
        "package",
        "private",
        "protected",
        "public",
        "return",
        "short",
        "static",
        "strictfp",
        "super",
        "switch",
        "synchronized",
        "this",
        "throw",
        "throws",
        "transient",
        "true",
        "try",
        "void",
        "volatile",
        "while",
        "BeginAction",
        "BeginJava",
        "EndAction",
        "EndJava",
        "NoAction",
        "NullAction",
        "BadAction",
        "EOF_TOKEN",
        "IDENTIFIER",
        "IntegerLiteral",
        "LongLiteral",
        "FloatingPointLiteral",
        "DoubleLiteral",
        "CharacterLiteral",
        "StringLiteral",
        "PLUS_PLUS",
        "MINUS_MINUS",
        "EQUAL_EQUAL",
        "LESS_EQUAL",
        "GREATER_EQUAL",
        "NOT_EQUAL",
        "LEFT_SHIFT",
        "RIGHT_SHIFT",
        "UNSIGNED_RIGHT_SHIFT",
        "PLUS_EQUAL",
        "MINUS_EQUAL",
        "MULTIPLY_EQUAL",
        "DIVIDE_EQUAL",
        "AND_EQUAL",
        "OR_EQUAL",
        "XOR_EQUAL",
        "REMAINDER_EQUAL",
        "LEFT_SHIFT_EQUAL",
        "RIGHT_SHIFT_EQUAL",
        "UNSIGNED_RIGHT_SHIFT_EQUAL",
        "OR_OR",
        "AND_AND",
        "PLUS",
        "MINUS",
        "NOT",
        "REMAINDER",
        "XOR",
        "AND",
        "MULTIPLY",
        "OR",
        "TWIDDLE",
        "DIVIDE",
        "GREATER",
        "LESS",
        "LPAREN",
        "RPAREN",
        "LBRACE",
        "RBRACE",
        "LBRACKET",
        "RBRACKET",
        "SEMICOLON",
        "QUESTION",
        "AT",
        "COLON",
        "COMMA",
        "DOT",
        "EQUAL",
        "ELLIPSIS",
    ];

    pub const NUM_TOKEN_KINDS: i32 = 116;
    pub const IS_VALID_FOR_PARSER: bool = false;
}
