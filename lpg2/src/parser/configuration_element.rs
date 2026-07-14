use super::state_element::StateElement;

#[derive(Clone)]
pub struct ConfigurationElement {
    pub next: Option<Box<ConfigurationElement>>,
    pub last_element: Option<Box<StateElement>>,
    pub last_element_id: i32,
    pub stack_top: i32,
    pub action_length: i32,
    pub conflict_index: i32,
    pub curtok: i32,
    pub act: i32,
}

impl ConfigurationElement {
    pub fn new() -> Self {
        Self {
            next: None,
            last_element: None,
            last_element_id: 0,
            stack_top: 0,
            action_length: 0,
            conflict_index: 0,
            curtok: 0,
            act: 0,
        }
    }

    pub fn retrieve_stack(&self, stack: &mut [i32]) {
        let Some(ref tail_box) = self.last_element else {
            return;
        };
        let mut tail: Option<&StateElement> = Some(tail_box.as_ref());
        let mut i = self.stack_top;
        while i >= 0 {
            let Some(t) = tail else {
                return;
            };
            stack[i as usize] = t.number;
            tail = t.parent.as_deref();
            i -= 1;
        }
    }
}

impl Default for ConfigurationElement {
    fn default() -> Self {
        Self::new()
    }
}
