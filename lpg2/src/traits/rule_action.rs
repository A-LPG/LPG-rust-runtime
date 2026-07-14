/// Rule action callback used by deterministic / backtracking / lex parsers.
///
/// Bound to `Rc`/`RefCell` action owners in generated code, so this trait is
/// intentionally single-threaded (no `Send`/`Sync`).
pub trait RuleAction {
    fn rule_action(&mut self, rule_number: i32);
}
