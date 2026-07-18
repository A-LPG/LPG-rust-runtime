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

    /// GLR packed-forest projection. Deterministic ASTs leave these as no-ops.
    fn set_next_ast(&self, _n: Option<Rc<dyn IAst>>) {}
    fn reset_next_ast(&self) {
        self.set_next_ast(None);
    }

    fn set_parent(&self, parent: Option<Rc<dyn IAst>>);
    fn get_parent(&self) -> Option<Rc<dyn IAst>>;

    fn get_left_i_token(&self) -> Rc<dyn IToken>;
    fn get_right_i_token(&self) -> Rc<dyn IToken>;

    fn get_preceding_adjuncts(&self) -> Vec<Rc<dyn IToken>>;
    fn get_following_adjuncts(&self) -> Vec<Rc<dyn IToken>>;

    fn get_children(&self) -> ArrayList;
    fn get_all_children(&self) -> ArrayList;

    fn accept(&self, visitor: &mut dyn IAstVisitor);

    /// Type-erasure hook so generated code can recover concrete `Rc<T>` from
    /// `Rc<dyn IAst>` after `box_ast` (see [`downcast_ast`]).
    fn as_any(&self) -> &dyn Any;
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

/// Downcast `Rc<dyn IAst>` to a concrete generated AST node type.
///
/// Safe when `T` is the dynamic type behind the trait object (verified via
/// [`IAst::as_any`]). Used by list ADD and rule reconstruction after `box_ast`.
pub fn downcast_ast<T: IAst + 'static>(node: Rc<dyn IAst>) -> Option<Rc<T>> {
    if !node.as_any().is::<T>() {
        return None;
    }
    // SAFETY: `as_any` confirmed the concrete type is `T`; `Rc<dyn IAst>` and
    // `Rc<T>` share the same allocation layout for a single concrete `T: IAst`.
    let ptr = Rc::into_raw(node);
    Some(unsafe { Rc::from_raw(ptr as *const T) })
}
