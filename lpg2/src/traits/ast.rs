use std::any::Any;
use std::rc::Rc;

use crate::collections::ArrayList;

use super::itoken::IToken;

/// AST visitor interface mirroring Go's `IAstVisitor`.
/// Single-threaded: matches the rest of the `Rc`/`RefCell` runtime.
pub trait IAstVisitor {
    fn pre_visit(&mut self, element: &dyn IAst) -> bool;
    fn post_visit(&mut self, element: &dyn IAst);
}

/// AST interface mirroring Go's `IAst`.
///
/// Parent links use interior mutability (`RefCell` in generated nodes) so
/// `set_parent` takes `&self` and works after the node is wrapped in `Rc`.
/// Children are returned by value (matching Go's `*ArrayList` copies).
pub trait IAst {
    fn get_next_ast(&self) -> Option<Rc<dyn IAst>>;
    fn set_parent(&self, parent: Option<Rc<dyn IAst>>);
    fn get_parent(&self) -> Option<Rc<dyn IAst>>;

    fn get_left_i_token(&self) -> Rc<dyn IToken>;
    fn get_right_i_token(&self) -> Rc<dyn IToken>;

    fn get_preceding_adjuncts(&self) -> Vec<Rc<dyn IToken>>;
    fn get_following_adjuncts(&self) -> Vec<Rc<dyn IToken>>;

    fn get_children(&self) -> ArrayList;
    fn get_all_children(&self) -> ArrayList;

    fn accept(&self, visitor: &mut dyn IAstVisitor);
}

/// Box an AST node for parser stack / `ArrayList` payloads.
///
/// Always store `Rc<dyn IAst>` so list recovery and downcasts share one type.
pub fn box_ast(node: Rc<dyn IAst>) -> Box<dyn Any> {
    Box::new(node)
}

/// Recover an AST node from an erased parser-stack payload.
pub fn unbox_ast(value: &dyn Any) -> Option<Rc<dyn IAst>> {
    value.downcast_ref::<Rc<dyn IAst>>().cloned()
}
