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
pub trait IAst {
    fn get_next_ast(&self) -> Option<Rc<dyn IAst>>;
    fn set_parent(&mut self, parent: Option<Rc<dyn IAst>>);
    fn get_parent(&self) -> Option<Rc<dyn IAst>>;

    fn get_left_i_token(&self) -> Rc<dyn IToken>;
    fn get_right_i_token(&self) -> Rc<dyn IToken>;

    fn get_preceding_adjuncts(&self) -> Vec<Rc<dyn IToken>>;
    fn get_following_adjuncts(&self) -> Vec<Rc<dyn IToken>>;

    fn get_children(&self) -> &ArrayList;
    fn get_all_children(&self) -> &ArrayList;

    fn accept(&self, visitor: &mut dyn IAstVisitor);
}
