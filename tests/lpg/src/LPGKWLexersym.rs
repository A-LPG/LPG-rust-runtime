
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
pub struct LPGKWLexersym;

impl LPGKWLexersym {
    pub const Char_DollarSign: i32 = 20;
    pub const Char_Percent: i32 = 21;
    pub const Char__: i32 = 28;
    pub const Char_a: i32 = 8;
    pub const Char_b: i32 = 17;
    pub const Char_c: i32 = 14;
    pub const Char_d: i32 = 9;
    pub const Char_e: i32 = 1;
    pub const Char_f: i32 = 15;
    pub const Char_g: i32 = 22;
    pub const Char_h: i32 = 23;
    pub const Char_i: i32 = 6;
    pub const Char_j: i32 = 24;
    pub const Char_k: i32 = 18;
    pub const Char_l: i32 = 7;
    pub const Char_m: i32 = 12;
    pub const Char_n: i32 = 10;
    pub const Char_o: i32 = 4;
    pub const Char_p: i32 = 11;
    pub const Char_q: i32 = 29;
    pub const Char_r: i32 = 3;
    pub const Char_s: i32 = 2;
    pub const Char_t: i32 = 5;
    pub const Char_u: i32 = 16;
    pub const Char_v: i32 = 25;
    pub const Char_w: i32 = 19;
    pub const Char_x: i32 = 26;
    pub const Char_y: i32 = 13;
    pub const Char_z: i32 = 30;
    pub const Char_0: i32 = 31;
    pub const Char_1: i32 = 32;
    pub const Char_2: i32 = 33;
    pub const Char_3: i32 = 34;
    pub const Char_4: i32 = 35;
    pub const Char_5: i32 = 36;
    pub const Char_6: i32 = 37;
    pub const Char_7: i32 = 38;
    pub const Char_8: i32 = 39;
    pub const Char_9: i32 = 40;
    pub const Char_EOF: i32 = 27;

    pub const ORDERED_TERMINAL_SYMBOLS: &[&str] = &[
        "",
        "e",
        "s",
        "r",
        "o",
        "t",
        "i",
        "l",
        "a",
        "d",
        "n",
        "p",
        "m",
        "y",
        "c",
        "f",
        "u",
        "b",
        "k",
        "w",
        "DollarSign",
        "Percent",
        "g",
        "h",
        "j",
        "v",
        "x",
        "EOF",
        "_",
        "q",
        "z",
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
    ];

    pub const NUM_TOKEN_KINDS: i32 = 40;

    pub const IS_VALID_FOR_PARSER: bool = true;
}
