use std::any::Any;
use std::rc::Rc;

use super::gss_node::GssNode;
use super::sppf_node::SppfNode;

/// Predecessor link labeled with the recognized grammar symbol, semantic
/// value, token location, and optional SPPF node.
#[derive(Clone)]
pub struct GssEdge {
    predecessor: Rc<GssNode>,
    symbol: i32,
    location: i32,
    semantic: Option<Rc<dyn Any>>,
    sppf: Option<Rc<SppfNode>>,
}

impl GssEdge {
    pub fn new(
        predecessor: Rc<GssNode>,
        symbol: i32,
        location: i32,
        semantic: Option<Rc<dyn Any>>,
        sppf: Option<Rc<SppfNode>>,
    ) -> Self {
        Self {
            predecessor,
            symbol,
            location,
            semantic,
            sppf,
        }
    }

    pub fn get_predecessor(&self) -> Rc<GssNode> {
        self.predecessor.clone()
    }

    pub fn get_symbol(&self) -> i32 {
        self.symbol
    }

    pub fn get_location(&self) -> i32 {
        self.location
    }

    pub fn get_semantic(&self) -> Option<Rc<dyn Any>> {
        self.semantic.clone()
    }

    pub fn get_sppf(&self) -> Option<Rc<SppfNode>> {
        self.sppf.clone()
    }
}
