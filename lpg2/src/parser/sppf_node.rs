use std::any::Any;
use std::cell::RefCell;
use std::rc::Rc;

/// Shared packed parse forest symbol node keyed by grammar symbol and extent.
pub struct SppfNode {
    grammar_symbol: i32,
    left_extent: i32,
    right_extent: i32,
    packs: RefCell<Vec<SppfPackedNode>>,
    ast_forest: RefCell<Option<Rc<dyn Any>>>,
}

impl SppfNode {
    pub fn new(grammar_symbol: i32, left_extent: i32, right_extent: i32) -> Self {
        Self {
            grammar_symbol,
            left_extent,
            right_extent,
            packs: RefCell::new(Vec::new()),
            ast_forest: RefCell::new(None),
        }
    }

    pub fn get_grammar_symbol(&self) -> i32 {
        self.grammar_symbol
    }

    pub fn get_left_extent(&self) -> i32 {
        self.left_extent
    }

    pub fn get_right_extent(&self) -> i32 {
        self.right_extent
    }

    pub fn get_packs(&self) -> Vec<SppfPackedNode> {
        self.packs.borrow().clone()
    }

    pub fn packs_mut(&self) -> std::cell::RefMut<'_, Vec<SppfPackedNode>> {
        self.packs.borrow_mut()
    }

    pub fn get_ast_forest(&self) -> Option<Rc<dyn Any>> {
        self.ast_forest.borrow().clone()
    }

    pub fn set_ast_forest(&self, forest: Option<Rc<dyn Any>>) {
        *self.ast_forest.borrow_mut() = forest;
    }
}

/// One production alternative under an SPPF symbol node.
#[derive(Clone)]
pub struct SppfPackedNode {
    rule: i32,
    children: Vec<Option<Rc<SppfNode>>>,
    semantic: Option<Rc<dyn Any>>,
}

impl SppfPackedNode {
    pub fn new(
        rule: i32,
        children: Vec<Option<Rc<SppfNode>>>,
        semantic: Option<Rc<dyn Any>>,
    ) -> Self {
        Self {
            rule,
            children,
            semantic,
        }
    }

    pub fn get_rule(&self) -> i32 {
        self.rule
    }

    pub fn get_children(&self) -> Vec<Rc<SppfNode>> {
        self.children
            .iter()
            .filter_map(|c| c.clone())
            .collect()
    }

    pub fn children_raw(&self) -> &[Option<Rc<SppfNode>>] {
        &self.children
    }

    pub fn get_semantic(&self) -> Option<Rc<dyn Any>> {
        self.semantic.clone()
    }
}
