/// Parse table interface mirroring Go's `ParseTable`.
pub trait ParseTable: Send + Sync {
    fn base_check(&self, index: i32) -> i32;
    fn rhs(&self, index: i32) -> i32;
    fn base_action(&self, index: i32) -> i32;
    fn lhs(&self, index: i32) -> i32;
    fn term_check(&self, index: i32) -> i32;
    fn term_action(&self, index: i32) -> i32;
    fn asb(&self, index: i32) -> i32;
    fn asr(&self, index: i32) -> i32;
    fn nasb(&self, index: i32) -> i32;
    fn nasr(&self, index: i32) -> i32;
    fn terminal_index(&self, index: i32) -> i32;
    fn nonterminal_index(&self, index: i32) -> i32;
    fn scope_prefix(&self, index: i32) -> i32;
    fn scope_suffix(&self, index: i32) -> i32;
    fn scope_lhs(&self, index: i32) -> i32;
    fn scope_la(&self, index: i32) -> i32;
    fn scope_state_set(&self, index: i32) -> i32;
    fn scope_rhs(&self, index: i32) -> i32;
    fn scope_state(&self, index: i32) -> i32;
    fn in_symb(&self, index: i32) -> i32;
    fn name(&self, index: i32) -> String;
    fn original_state(&self, state: i32) -> i32;
    fn asi(&self, state: i32) -> i32;
    fn nasi(&self, state: i32) -> i32;
    fn in_symbol(&self, state: i32) -> i32;
    fn nt_action(&self, state: i32, sym: i32) -> i32;
    fn t_action(&self, act: i32, sym: i32) -> i32;
    fn look_ahead(&self, act: i32, sym: i32) -> i32;
    fn get_error_symbol(&self) -> i32;
    fn get_scope_ubound(&self) -> i32;
    fn get_scope_size(&self) -> i32;
    fn get_max_name_length(&self) -> i32;
    fn get_num_states(&self) -> i32;
    fn get_nt_offset(&self) -> i32;
    fn get_la_state_offset(&self) -> i32;
    fn get_max_la(&self) -> i32;
    fn get_num_rules(&self) -> i32;
    fn get_num_nonterminals(&self) -> i32;
    fn get_num_symbols(&self) -> i32;
    fn get_start_state(&self) -> i32;
    fn get_start_symbol(&self) -> i32;
    fn get_eoft_symbol(&self) -> i32;
    fn get_eolt_symbol(&self) -> i32;
    fn get_accept_action(&self) -> i32;
    fn get_error_action(&self) -> i32;
    fn is_nullable(&self, symbol: i32) -> bool;
    fn is_valid_for_parser(&self) -> bool;
    fn get_backtrack(&self) -> bool;

    /// Map a nonterminal token kind (a symbol value with `NT_OFFSET` already
    /// applied) to a compact index into `RuleAction::get_prosthetic_ast()`.
    /// Tables generated for grammars without `%Recover` symbols use this
    /// default, which selects the null-factory slot.
    fn get_prosthesis_index(&self, _index: i32) -> i32 {
        0
    }
}
