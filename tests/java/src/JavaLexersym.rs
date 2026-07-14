
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
pub struct JavaLexersym;

impl JavaLexersym {
    pub const Char_CtlCharNotWS: i32 = 102;
    pub const Char_LF: i32 = 100;
    pub const Char_CR: i32 = 101;
    pub const Char_HT: i32 = 37;
    pub const Char_FF: i32 = 38;
    pub const Char_a: i32 = 19;
    pub const Char_b: i32 = 15;
    pub const Char_c: i32 = 20;
    pub const Char_d: i32 = 12;
    pub const Char_e: i32 = 16;
    pub const Char_f: i32 = 11;
    pub const Char_g: i32 = 39;
    pub const Char_h: i32 = 40;
    pub const Char_i: i32 = 41;
    pub const Char_j: i32 = 42;
    pub const Char_k: i32 = 43;
    pub const Char_l: i32 = 25;
    pub const Char_m: i32 = 44;
    pub const Char_n: i32 = 26;
    pub const Char_o: i32 = 45;
    pub const Char_p: i32 = 46;
    pub const Char_q: i32 = 47;
    pub const Char_r: i32 = 27;
    pub const Char_s: i32 = 48;
    pub const Char_t: i32 = 28;
    pub const Char_u: i32 = 29;
    pub const Char_v: i32 = 49;
    pub const Char_w: i32 = 50;
    pub const Char_x: i32 = 32;
    pub const Char_y: i32 = 51;
    pub const Char_z: i32 = 52;
    pub const Char__: i32 = 53;
    pub const Char_A: i32 = 21;
    pub const Char_B: i32 = 22;
    pub const Char_C: i32 = 23;
    pub const Char_D: i32 = 13;
    pub const Char_E: i32 = 17;
    pub const Char_F: i32 = 14;
    pub const Char_G: i32 = 54;
    pub const Char_H: i32 = 55;
    pub const Char_I: i32 = 56;
    pub const Char_J: i32 = 57;
    pub const Char_K: i32 = 58;
    pub const Char_L: i32 = 30;
    pub const Char_M: i32 = 59;
    pub const Char_N: i32 = 60;
    pub const Char_O: i32 = 61;
    pub const Char_P: i32 = 62;
    pub const Char_Q: i32 = 63;
    pub const Char_R: i32 = 64;
    pub const Char_S: i32 = 65;
    pub const Char_T: i32 = 66;
    pub const Char_U: i32 = 67;
    pub const Char_V: i32 = 68;
    pub const Char_W: i32 = 69;
    pub const Char_X: i32 = 33;
    pub const Char_Y: i32 = 70;
    pub const Char_Z: i32 = 71;
    pub const Char_0: i32 = 1;
    pub const Char_1: i32 = 2;
    pub const Char_2: i32 = 3;
    pub const Char_3: i32 = 4;
    pub const Char_4: i32 = 5;
    pub const Char_5: i32 = 6;
    pub const Char_6: i32 = 7;
    pub const Char_7: i32 = 8;
    pub const Char_8: i32 = 9;
    pub const Char_9: i32 = 10;
    pub const Char_AfterASCII: i32 = 72;
    pub const Char_Space: i32 = 73;
    pub const Char_DoubleQuote: i32 = 34;
    pub const Char_SingleQuote: i32 = 24;
    pub const Char_Percent: i32 = 81;
    pub const Char_VerticalBar: i32 = 74;
    pub const Char_Exclamation: i32 = 82;
    pub const Char_AtSign: i32 = 83;
    pub const Char_BackQuote: i32 = 97;
    pub const Char_Tilde: i32 = 84;
    pub const Char_Sharp: i32 = 98;
    pub const Char_DollarSign: i32 = 75;
    pub const Char_Ampersand: i32 = 76;
    pub const Char_Caret: i32 = 85;
    pub const Char_Colon: i32 = 86;
    pub const Char_SemiColon: i32 = 87;
    pub const Char_BackSlash: i32 = 77;
    pub const Char_LeftBrace: i32 = 88;
    pub const Char_RightBrace: i32 = 89;
    pub const Char_LeftBracket: i32 = 90;
    pub const Char_RightBracket: i32 = 91;
    pub const Char_QuestionMark: i32 = 92;
    pub const Char_Comma: i32 = 93;
    pub const Char_Dot: i32 = 31;
    pub const Char_LessThan: i32 = 78;
    pub const Char_GreaterThan: i32 = 94;
    pub const Char_Plus: i32 = 35;
    pub const Char_Minus: i32 = 36;
    pub const Char_Slash: i32 = 79;
    pub const Char_Star: i32 = 80;
    pub const Char_LeftParen: i32 = 95;
    pub const Char_RightParen: i32 = 96;
    pub const Char_Equal: i32 = 18;
    pub const Char_EOF: i32 = 99;

    pub const ORDERED_TERMINAL_SYMBOLS: &[&str] = &[
        "",
        "0",
        "1",
        "2",
        "3",
        "4",
        "5",
        "6",
        "7",
        "8",
        "9",
        "f",
        "d",
        "D",
        "F",
        "b",
        "e",
        "E",
        "Equal",
        "a",
        "c",
        "A",
        "B",
        "C",
        "SingleQuote",
        "l",
        "n",
        "r",
        "t",
        "u",
        "L",
        "Dot",
        "x",
        "X",
        "DoubleQuote",
        "Plus",
        "Minus",
        "HT",
        "FF",
        "g",
        "h",
        "i",
        "j",
        "k",
        "m",
        "o",
        "p",
        "q",
        "s",
        "v",
        "w",
        "y",
        "z",
        "_",
        "G",
        "H",
        "I",
        "J",
        "K",
        "M",
        "N",
        "O",
        "P",
        "Q",
        "R",
        "S",
        "T",
        "U",
        "V",
        "W",
        "Y",
        "Z",
        "AfterASCII",
        "Space",
        "VerticalBar",
        "DollarSign",
        "Ampersand",
        "BackSlash",
        "LessThan",
        "Slash",
        "Star",
        "Percent",
        "Exclamation",
        "AtSign",
        "Tilde",
        "Caret",
        "Colon",
        "SemiColon",
        "LeftBrace",
        "RightBrace",
        "LeftBracket",
        "RightBracket",
        "QuestionMark",
        "Comma",
        "GreaterThan",
        "LeftParen",
        "RightParen",
        "BackQuote",
        "Sharp",
        "EOF",
        "LF",
        "CR",
        "CtlCharNotWS",
    ];

    pub const NUM_TOKEN_KINDS: i32 = 102;

    pub const IS_VALID_FOR_PARSER: bool = true;
}
