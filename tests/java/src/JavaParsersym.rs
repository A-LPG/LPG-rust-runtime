//
// This is the grammar specification from the Final Draft of the generic spec.
//
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
pub struct JavaParsersym;

impl JavaParsersym {
    pub const TK_IntegerLiteral: i32 = 31;
    pub const TK_LongLiteral: i32 = 32;
    pub const TK_FloatingPointLiteral: i32 = 33;
    pub const TK_DoubleLiteral: i32 = 34;
    pub const TK_CharacterLiteral: i32 = 35;
    pub const TK_StringLiteral: i32 = 36;
    pub const TK_MINUS_MINUS: i32 = 26;
    pub const TK_OR: i32 = 84;
    pub const TK_MINUS: i32 = 46;
    pub const TK_MINUS_EQUAL: i32 = 72;
    pub const TK_NOT: i32 = 48;
    pub const TK_NOT_EQUAL: i32 = 85;
    pub const TK_REMAINDER: i32 = 86;
    pub const TK_REMAINDER_EQUAL: i32 = 73;
    pub const TK_AND: i32 = 68;
    pub const TK_AND_AND: i32 = 87;
    pub const TK_AND_EQUAL: i32 = 74;
    pub const TK_LPAREN: i32 = 3;
    pub const TK_RPAREN: i32 = 20;
    pub const TK_MULTIPLY: i32 = 69;
    pub const TK_MULTIPLY_EQUAL: i32 = 75;
    pub const TK_COMMA: i32 = 42;
    pub const TK_DOT: i32 = 40;
    pub const TK_DIVIDE: i32 = 88;
    pub const TK_DIVIDE_EQUAL: i32 = 76;
    pub const TK_COLON: i32 = 50;
    pub const TK_SEMICOLON: i32 = 4;
    pub const TK_QUESTION: i32 = 89;
    pub const TK_AT: i32 = 1;
    pub const TK_LBRACKET: i32 = 23;
    pub const TK_RBRACKET: i32 = 52;
    pub const TK_XOR: i32 = 90;
    pub const TK_XOR_EQUAL: i32 = 77;
    pub const TK_LBRACE: i32 = 30;
    pub const TK_OR_OR: i32 = 95;
    pub const TK_OR_EQUAL: i32 = 78;
    pub const TK_RBRACE: i32 = 43;
    pub const TK_TWIDDLE: i32 = 49;
    pub const TK_PLUS: i32 = 47;
    pub const TK_PLUS_PLUS: i32 = 27;
    pub const TK_PLUS_EQUAL: i32 = 79;
    pub const TK_LESS: i32 = 24;
    pub const TK_LEFT_SHIFT: i32 = 70;
    pub const TK_LEFT_SHIFT_EQUAL: i32 = 80;
    pub const TK_LESS_EQUAL: i32 = 81;
    pub const TK_EQUAL: i32 = 51;
    pub const TK_EQUAL_EQUAL: i32 = 91;
    pub const TK_GREATER: i32 = 45;
    pub const TK_GREATER_EQUAL: i32 = 103;
    pub const TK_RIGHT_SHIFT: i32 = 104;
    pub const TK_RIGHT_SHIFT_EQUAL: i32 = 105;
    pub const TK_UNSIGNED_RIGHT_SHIFT: i32 = 106;
    pub const TK_UNSIGNED_RIGHT_SHIFT_EQUAL: i32 = 107;
    pub const TK_ELLIPSIS: i32 = 96;
    pub const TK_BeginAction: i32 = 108;
    pub const TK_EndAction: i32 = 109;
    pub const TK_BeginJava: i32 = 110;
    pub const TK_EndJava: i32 = 111;
    pub const TK_NoAction: i32 = 112;
    pub const TK_NullAction: i32 = 113;
    pub const TK_BadAction: i32 = 114;
    pub const TK_abstract: i32 = 17;
    pub const TK_assert: i32 = 57;
    pub const TK_boolean: i32 = 5;
    pub const TK_break: i32 = 58;
    pub const TK_byte: i32 = 6;
    pub const TK_case: i32 = 71;
    pub const TK_catch: i32 = 97;
    pub const TK_char: i32 = 7;
    pub const TK_class: i32 = 41;
    pub const TK_const: i32 = 115;
    pub const TK_continue: i32 = 59;
    pub const TK_default: i32 = 60;
    pub const TK_do: i32 = 61;
    pub const TK_double: i32 = 8;
    pub const TK_enum: i32 = 44;
    pub const TK_else: i32 = 92;
    pub const TK_extends: i32 = 82;
    pub const TK_false: i32 = 37;
    pub const TK_final: i32 = 19;
    pub const TK_finally: i32 = 98;
    pub const TK_float: i32 = 9;
    pub const TK_for: i32 = 62;
    pub const TK_goto: i32 = 116;
    pub const TK_if: i32 = 63;
    pub const TK_implements: i32 = 102;
    pub const TK_import: i32 = 99;
    pub const TK_instanceof: i32 = 83;
    pub const TK_int: i32 = 10;
    pub const TK_interface: i32 = 21;
    pub const TK_long: i32 = 11;
    pub const TK_native: i32 = 93;
    pub const TK_new: i32 = 28;
    pub const TK_null: i32 = 38;
    pub const TK_package: i32 = 100;
    pub const TK_private: i32 = 14;
    pub const TK_protected: i32 = 15;
    pub const TK_public: i32 = 12;
    pub const TK_return: i32 = 64;
    pub const TK_short: i32 = 13;
    pub const TK_static: i32 = 16;
    pub const TK_strictfp: i32 = 18;
    pub const TK_super: i32 = 25;
    pub const TK_switch: i32 = 65;
    pub const TK_synchronized: i32 = 53;
    pub const TK_this: i32 = 29;
    pub const TK_throw: i32 = 66;
    pub const TK_throws: i32 = 101;
    pub const TK_transient: i32 = 54;
    pub const TK_true: i32 = 39;
    pub const TK_try: i32 = 67;
    pub const TK_void: i32 = 22;
    pub const TK_volatile: i32 = 55;
    pub const TK_while: i32 = 56;
    pub const TK_EOF_TOKEN: i32 = 94;
    pub const TK_IDENTIFIER: i32 = 2;
    pub const TK_ERROR_TOKEN: i32 = 117;

    pub const ORDERED_TERMINAL_SYMBOLS: &[&str] = &[
        "",
        "AT",
        "IDENTIFIER",
        "LPAREN",
        "SEMICOLON",
        "boolean",
        "byte",
        "char",
        "double",
        "float",
        "int",
        "long",
        "public",
        "short",
        "private",
        "protected",
        "static",
        "abstract",
        "strictfp",
        "final",
        "RPAREN",
        "interface",
        "void",
        "LBRACKET",
        "LESS",
        "super",
        "MINUS_MINUS",
        "PLUS_PLUS",
        "new",
        "this",
        "LBRACE",
        "IntegerLiteral",
        "LongLiteral",
        "FloatingPointLiteral",
        "DoubleLiteral",
        "CharacterLiteral",
        "StringLiteral",
        "false",
        "null",
        "true",
        "DOT",
        "class",
        "COMMA",
        "RBRACE",
        "enum",
        "GREATER",
        "MINUS",
        "PLUS",
        "NOT",
        "TWIDDLE",
        "COLON",
        "EQUAL",
        "RBRACKET",
        "synchronized",
        "transient",
        "volatile",
        "while",
        "assert",
        "break",
        "continue",
        "default",
        "do",
        "for",
        "if",
        "return",
        "switch",
        "throw",
        "try",
        "AND",
        "MULTIPLY",
        "LEFT_SHIFT",
        "case",
        "MINUS_EQUAL",
        "REMAINDER_EQUAL",
        "AND_EQUAL",
        "MULTIPLY_EQUAL",
        "DIVIDE_EQUAL",
        "XOR_EQUAL",
        "OR_EQUAL",
        "PLUS_EQUAL",
        "LEFT_SHIFT_EQUAL",
        "LESS_EQUAL",
        "extends",
        "instanceof",
        "OR",
        "NOT_EQUAL",
        "REMAINDER",
        "AND_AND",
        "DIVIDE",
        "QUESTION",
        "XOR",
        "EQUAL_EQUAL",
        "else",
        "native",
        "EOF_TOKEN",
        "OR_OR",
        "ELLIPSIS",
        "catch",
        "finally",
        "import",
        "package",
        "throws",
        "implements",
        "GREATER_EQUAL",
        "RIGHT_SHIFT",
        "RIGHT_SHIFT_EQUAL",
        "UNSIGNED_RIGHT_SHIFT",
        "UNSIGNED_RIGHT_SHIFT_EQUAL",
        "BeginAction",
        "EndAction",
        "BeginJava",
        "EndJava",
        "NoAction",
        "NullAction",
        "BadAction",
        "const",
        "goto",
        "ERROR_TOKEN",
    ];

    pub const NUM_TOKEN_KINDS: i32 = 117;

    pub const IS_VALID_FOR_PARSER: bool = true;
}
