use lpg2::collections::{ArrayList, IntSegmentedTuple, IntTuple};
use lpg2::error::{BadParseException, LpgException};
use lpg2::parser::Stacks;
use lpg2::stream::{LexStream, PrsStream};
use lpg2::traits::{ILexStream, ParseTable};

struct MockParseTable;

impl ParseTable for MockParseTable {
    fn base_check(&self, _index: i32) -> i32 {
        0
    }
    fn rhs(&self, _index: i32) -> i32 {
        0
    }
    fn base_action(&self, _index: i32) -> i32 {
        0
    }
    fn lhs(&self, _index: i32) -> i32 {
        0
    }
    fn term_check(&self, _index: i32) -> i32 {
        0
    }
    fn term_action(&self, _index: i32) -> i32 {
        0
    }
    fn asb(&self, _index: i32) -> i32 {
        0
    }
    fn asr(&self, _index: i32) -> i32 {
        0
    }
    fn nasb(&self, _index: i32) -> i32 {
        0
    }
    fn nasr(&self, _index: i32) -> i32 {
        0
    }
    fn terminal_index(&self, _index: i32) -> i32 {
        0
    }
    fn nonterminal_index(&self, _index: i32) -> i32 {
        0
    }
    fn scope_prefix(&self, _index: i32) -> i32 {
        0
    }
    fn scope_suffix(&self, _index: i32) -> i32 {
        0
    }
    fn scope_lhs(&self, _index: i32) -> i32 {
        0
    }
    fn scope_la(&self, _index: i32) -> i32 {
        0
    }
    fn scope_state_set(&self, _index: i32) -> i32 {
        0
    }
    fn scope_rhs(&self, _index: i32) -> i32 {
        0
    }
    fn scope_state(&self, _index: i32) -> i32 {
        0
    }
    fn in_symb(&self, _index: i32) -> i32 {
        0
    }
    fn name(&self, _index: i32) -> String {
        String::new()
    }
    fn original_state(&self, _state: i32) -> i32 {
        0
    }
    fn asi(&self, _state: i32) -> i32 {
        0
    }
    fn nasi(&self, _state: i32) -> i32 {
        0
    }
    fn in_symbol(&self, _state: i32) -> i32 {
        0
    }
    fn nt_action(&self, _state: i32, _sym: i32) -> i32 {
        0
    }
    fn t_action(&self, _act: i32, _sym: i32) -> i32 {
        0
    }
    fn look_ahead(&self, _act: i32, _sym: i32) -> i32 {
        0
    }
    fn get_error_symbol(&self) -> i32 {
        0
    }
    fn get_scope_ubound(&self) -> i32 {
        0
    }
    fn get_scope_size(&self) -> i32 {
        0
    }
    fn get_max_name_length(&self) -> i32 {
        0
    }
    fn get_num_states(&self) -> i32 {
        0
    }
    fn get_nt_offset(&self) -> i32 {
        0
    }
    fn get_la_state_offset(&self) -> i32 {
        0
    }
    fn get_max_la(&self) -> i32 {
        0
    }
    fn get_num_rules(&self) -> i32 {
        0
    }
    fn get_num_nonterminals(&self) -> i32 {
        0
    }
    fn get_num_symbols(&self) -> i32 {
        0
    }
    fn get_start_state(&self) -> i32 {
        0
    }
    fn get_start_symbol(&self) -> i32 {
        0
    }
    fn get_eoft_symbol(&self) -> i32 {
        0
    }
    fn get_eolt_symbol(&self) -> i32 {
        0
    }
    fn get_accept_action(&self) -> i32 {
        0
    }
    fn get_error_action(&self) -> i32 {
        0
    }
    fn is_nullable(&self, _symbol: i32) -> bool {
        false
    }
    fn is_valid_for_parser(&self) -> bool {
        true
    }
    fn get_backtrack(&self) -> bool {
        false
    }
}

#[test]
fn stacks_get_set_sym() {
    let mut stacks = Stacks::new();
    stacks.reallocate_stacks();
    stacks.state_stack_top = 0;
    stacks.set_sym1(Some(Box::new(42i32)));
    let sym = stacks.get_sym(1);
    assert!(sym.is_some());
}

#[test]
fn int_tuple_grows() {
    let mut t = IntTuple::new();
    t.add(1);
    t.add(2);
    assert_eq!(t.size(), 2);
    assert_eq!(t.get(1), 2);
}

#[test]
fn int_segmented_tuple_add_get() {
    let mut t = IntSegmentedTuple::new(3, 4);
    t.add(7);
    t.add(8);
    assert_eq!(t.size(), 2);
    assert_eq!(t.get(1), 8);
}

#[test]
fn array_list_add_get() {
    let mut list = ArrayList::new();
    list.add(Box::new("x".to_string()));
    assert_eq!(list.size(), 1);
}

#[test]
fn bad_parse_exception_into_lpg_exception() {
    let err: LpgException = BadParseException::new(3).into();
    match err {
        LpgException::BadParse(e) => assert_eq!(e.error_token, 3),
        _ => panic!("expected BadParse variant"),
    }
}

#[test]
fn lex_stream_reads_chars() {
    let lex_ref = LexStream::new(
        "test.txt".to_string(),
        Some(vec!['a', 'b', 'c']),
        4,
        None,
    )
    .expect("lex stream");
    assert_eq!(lex_ref.borrow().get_input_chars(), vec!['a', 'b', 'c']);
    assert_eq!(lex_ref.borrow().get_stream_length(), 3);
}

#[test]
fn prs_stream_make_token() {
    let lex_ref = LexStream::new(
        "t".to_string(),
        Some(vec!['x']),
        4,
        None,
    )
    .expect("lex stream");
    let prs = PrsStream::new(Some(lex_ref));
    {
        prs.borrow_mut().make_token(0, 0, 1);
    }
    let size = prs.borrow().get_size();
    assert_eq!(size, 1);
    assert!(prs.borrow().get_i_token(0).is_some());
}
