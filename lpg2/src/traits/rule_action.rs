use std::rc::Rc;

use super::ast::IAst;
use super::itoken::IToken;

/// A prosthetic-AST factory synthesizes a placeholder AST node for a `%Recover`
/// nonterminal that the backtracking parser replays as an `ErrorToken`. It is
/// invoked with the error token and returns a freshly built node (the parser
/// then boxes it onto the value stack via `box_ast`).
pub type ProstheticAst = Box<dyn Fn(Rc<dyn IToken>) -> Rc<dyn IAst>>;

/// Rule action callback used by deterministic / backtracking / lex parsers.
///
/// Bound to `Rc`/`RefCell` action owners in generated code, so this trait is
/// intentionally single-threaded (no `Send`/`Sync`).
pub trait RuleAction {
    fn rule_action(&mut self, rule_number: i32);

    /// Parsers generated with `automatic_ast` and `%Recover` symbols override
    /// this to return factories indexed by `ParseTable::get_prosthesis_index`.
    /// The default (no recover symbols) returns `None`, in which case the
    /// backtracking parser keeps its historical behavior of throwing a
    /// `BadParseException` on a replayed nonterminal token.
    fn get_prosthetic_ast(&self) -> Option<Vec<Option<ProstheticAst>>> {
        None
    }
}
