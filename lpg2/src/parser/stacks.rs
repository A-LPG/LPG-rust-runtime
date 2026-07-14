use crate::utils::{arraycopy, object_arraycopy};

pub struct Stacks {
    pub stack_increment: i32,
    pub state_stack_top: i32,
    pub state_stack: Vec<i32>,
    pub location_stack: Vec<i32>,
    pub parse_stack: Vec<Option<Box<dyn std::any::Any>>>,
}

impl Stacks {
    pub fn new() -> Self {
        Self {
            stack_increment: 1024,
            state_stack_top: 0,
            state_stack: Vec::new(),
            location_stack: Vec::new(),
            parse_stack: Vec::new(),
        }
    }

    pub fn get_token(&self, i: i32) -> i32 {
        self.location_stack[(self.state_stack_top + (i - 1)) as usize]
    }

    pub fn get_sym(&self, i: i32) -> Option<&dyn std::any::Any> {
        self.parse_stack[(self.state_stack_top + (i - 1)) as usize]
            .as_deref()
            .map(|b| b as &dyn std::any::Any)
    }

    pub fn set_sym1(&mut self, ast: Option<Box<dyn std::any::Any>>) {
        self.parse_stack[self.state_stack_top as usize] = ast;
    }

    pub fn reallocate_stacks(&mut self) {
        let old_stack_length = self.state_stack.len();
        let stack_length = old_stack_length + self.stack_increment as usize;

        if self.state_stack.is_empty() {
            self.state_stack = vec![0; stack_length];
            self.location_stack = vec![0; stack_length];
            self.parse_stack = (0..stack_length).map(|_| None).collect();
        } else {
            let mut new_state = vec![0; stack_length];
            arraycopy(&self.state_stack, 0, &mut new_state, 0, old_stack_length);
            self.state_stack = new_state;

            let mut new_location = vec![0; stack_length];
            arraycopy(&self.location_stack, 0, &mut new_location, 0, old_stack_length);
            self.location_stack = new_location;

            let mut new_parse: Vec<Option<Box<dyn std::any::Any>>> =
                (0..stack_length).map(|_| None).collect();
            object_arraycopy(&mut self.parse_stack, 0, &mut new_parse, 0, old_stack_length);
            self.parse_stack = new_parse;
        }
    }

    pub fn reallocate_state_stack(&mut self) {
        let old_stack_length = self.state_stack.len();
        let stack_length = old_stack_length + self.stack_increment as usize;
        if self.state_stack.is_empty() {
            self.state_stack = vec![0; stack_length];
        } else {
            let mut new_state = vec![0; stack_length];
            arraycopy(&self.state_stack, 0, &mut new_state, 0, old_stack_length);
            self.state_stack = new_state;
        }
    }

    pub fn allocate_other_stacks(&mut self) {
        let stack_length = self.state_stack.len();
        self.location_stack = vec![0; stack_length];
        self.parse_stack = (0..stack_length).map(|_| None).collect();
    }
}

impl Default for Stacks {
    fn default() -> Self {
        Self::new()
    }
}
