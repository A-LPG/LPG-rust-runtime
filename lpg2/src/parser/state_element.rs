#[derive(Clone)]
pub struct StateElement {
    pub parent: Option<Box<StateElement>>,
    pub children: Option<Box<StateElement>>,
    pub siblings: Option<Box<StateElement>>,
    pub number: i32,
    pub id: i32,
}

impl StateElement {
    pub fn new() -> Self {
        Self {
            parent: None,
            children: None,
            siblings: None,
            number: 0,
            id: 0,
        }
    }
}

impl Default for StateElement {
    fn default() -> Self {
        Self::new()
    }
}
