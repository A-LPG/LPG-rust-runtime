//! Expected-terminals helper for editor completion (antlr4-c3 style).

use crate::traits::ParseTable;

/// Return sorted distinct terminal names legal in parser state `state`.
pub fn expected_terminal_names(prs: &dyn ParseTable, state: i32) -> Vec<String> {
    let error_action = prs.get_error_action();
    let nt_offset = prs.get_nt_offset();
    let mut unique = std::collections::BTreeSet::new();
    for sym in 1..nt_offset {
        let act = prs.t_action(state, sym);
        if act == error_action {
            continue;
        }
        let n = prs.name(prs.terminal_index(sym));
        if !n.is_empty() {
            unique.insert(n);
        }
    }
    unique.into_iter().collect()
}
