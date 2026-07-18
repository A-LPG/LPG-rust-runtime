use std::cell::RefCell;

use super::gss_edge::GssEdge;

/// Graph-structured stack node: an LR state at an input index.
pub struct GssNode {
    state: i32,
    index: i32,
    edges: RefCell<Vec<GssEdge>>,
}

impl GssNode {
    pub fn new(state: i32, index: i32) -> Self {
        Self {
            state,
            index,
            edges: RefCell::new(Vec::new()),
        }
    }

    pub fn get_state(&self) -> i32 {
        self.state
    }

    pub fn get_index(&self) -> i32 {
        self.index
    }

    pub fn push_edge(&self, edge: GssEdge) {
        self.edges.borrow_mut().push(edge);
    }

    pub fn edge_count(&self) -> usize {
        self.edges.borrow().len()
    }

    pub fn first_edge(&self) -> Option<GssEdge> {
        self.edges.borrow().first().cloned()
    }

    pub fn get_edges(&self) -> Vec<GssEdge> {
        self.edges.borrow().clone()
    }
}
