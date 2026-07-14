use crate::collections::ObjectTuple;
use crate::parse_table::ParseTable;

use super::configuration_element::ConfigurationElement;
use super::state_element::StateElement;

pub struct ConfigurationStack<P: ParseTable + Clone> {
    pub table_size: i32,
    pub table: Vec<Option<Box<ConfigurationElement>>>,
    pub configuration_stack: ObjectTuple,
    pub state_root: Box<StateElement>,
    pub max_configuration_size: i32,
    pub stacks_size: i32,
    pub state_element_size: i32,
    pub next_state_id: i32,
    pub prs: P,
}

impl<P: ParseTable + Clone> ConfigurationStack<P> {
    pub fn new(prs: P) -> Self {
        let mut state_root = StateElement::new();
        state_root.number = prs.get_start_state();
        state_root.id = 0;
        Self {
            table_size: 1021,
            table: vec![None; 1021],
            configuration_stack: ObjectTuple::with_estimate(1 << 12),
            state_root: Box::new(state_root),
            max_configuration_size: 0,
            stacks_size: 0,
            state_element_size: 1,
            next_state_id: 1,
            prs,
        }
    }

    fn alloc_state(&mut self, number: i32) -> StateElement {
        let id = self.next_state_id;
        self.next_state_id += 1;
        self.state_element_size += 1;
        StateElement {
            parent: None,
            children: None,
            siblings: None,
            number,
            id,
        }
    }

    pub fn make_state_list(
        &mut self,
        parent: &mut StateElement,
        stack: &[i32],
        index: usize,
        stack_top: usize,
    ) -> i32 {
        let mut parent_id = parent.id;
        let mut current = parent;
        for stack_val in stack.iter().take(stack_top + 1).skip(index) {
            let mut state = self.alloc_state(*stack_val);
            state.parent = Some(Box::new(StateElement {
                id: parent_id,
                number: 0,
                parent: None,
                children: None,
                siblings: None,
            }));
            current.children = Some(Box::new(state));
            parent_id = current.children.as_ref().unwrap().id;
            current = current.children.as_mut().unwrap();
        }
        parent_id
    }

    pub fn find_or_insert_stack(
        &mut self,
        stack: &[i32],
        index: usize,
        stack_top: usize,
    ) -> i32 {
        let root = self.state_root.as_mut() as *mut StateElement;
        // SAFETY: `find_or_insert_stack_node` only mutates the state tree through `root`
        // while using other `self` fields for allocation counters.
        unsafe { self.find_or_insert_stack_node(root, stack, index, stack_top) }
    }

    unsafe fn find_or_insert_stack_node(
        &mut self,
        root: *mut StateElement,
        stack: &[i32],
        index: usize,
        stack_top: usize,
    ) -> i32 {
        let root = &mut *root;
        let state_number = stack[index];
        let mut p: Option<&mut StateElement> = Some(root);
        while let Some(node) = p.take() {
            if node.number == state_number {
                if index == stack_top {
                    return node.id;
                } else if node.children.is_none() {
                    return self.make_state_list(node, stack, index + 1, stack_top);
                } else {
                    let child = node.children.as_mut().unwrap().as_mut() as *mut StateElement;
                    return self.find_or_insert_stack_node(child, stack, index + 1, stack_top);
                }
            }
            p = node.siblings.as_deref_mut();
        }

        let mut node = self.alloc_state(state_number);
        node.parent = root.parent.take();
        node.siblings = root.siblings.take();
        root.siblings = Some(Box::new(node));

        if index == stack_top {
            root.siblings.as_ref().unwrap().id
        } else {
            self.make_state_list(root.siblings.as_mut().unwrap(), stack, index + 1, stack_top)
        }
    }

    fn find_state_by_id(&self, id: i32) -> Option<&StateElement> {
        fn walk(node: &StateElement, id: i32) -> Option<&StateElement> {
            if node.id == id {
                return Some(node);
            }
            if let Some(ref child) = node.children {
                if let Some(found) = walk(child, id) {
                    return Some(found);
                }
            }
            if let Some(ref sib) = node.siblings {
                if let Some(found) = walk(sib, id) {
                    return Some(found);
                }
            }
            None
        }
        walk(&self.state_root, id)
    }

    fn clone_chain_from_leaf(&self, leaf_id: i32) -> Box<StateElement> {
        let mut numbers = Vec::new();
        let mut id = leaf_id;
        while let Some(node) = self.find_state_by_id(id) {
            numbers.push(node.number);
            let Some(ref parent) = node.parent else {
                break;
            };
            id = parent.id;
        }

        let mut leaf = StateElement::new();
        leaf.number = numbers[0];
        let mut link = &mut leaf;
        for &num in numbers.iter().skip(1) {
            link.parent = Some(Box::new(StateElement {
                number: num,
                parent: None,
                children: None,
                siblings: None,
                id: -1,
            }));
            link = link.parent.as_mut().unwrap();
        }
        Box::new(leaf)
    }

    pub fn find_configuration(&mut self, stack: &[i32], stack_top: i32, curtok: i32) -> bool {
        let last_id = self.find_or_insert_stack(stack, 0, stack_top as usize);
        let hash_address = (curtok.rem_euclid(self.table_size)) as usize;
        let mut configuration = self.table[hash_address].as_deref();
        while let Some(cfg) = configuration {
            if cfg.curtok == curtok && cfg.last_element_id == last_id {
                return true;
            }
            configuration = cfg.next.as_deref();
        }
        false
    }

    pub fn push(
        &mut self,
        stack: &[i32],
        stack_top: i32,
        conflict_index: i32,
        curtok: i32,
        action_length: i32,
    ) {
        let hash_address = (curtok.rem_euclid(self.table_size)) as usize;
        let last_id = self.find_or_insert_stack(stack, 0, stack_top as usize);

        let mut configuration = ConfigurationElement::new();
        configuration.next = self.table[hash_address].take();
        configuration.stack_top = stack_top;
        configuration.conflict_index = conflict_index;
        configuration.curtok = curtok;
        configuration.action_length = action_length;
        configuration.last_element_id = last_id;
        configuration.last_element = Some(self.clone_chain_from_leaf(last_id));

        self.table[hash_address] = Some(Box::new(configuration.clone()));
        self.max_configuration_size += 1;
        self.stacks_size += stack_top + 1;

        self.configuration_stack
            .add(Box::new(configuration) as Box<dyn std::any::Any>);
    }

    pub fn pop(&mut self) -> Option<ConfigurationElement> {
        if self.configuration_stack.size() == 0 {
            return None;
        }
        let index = self.configuration_stack.size() - 1;
        let any = self.configuration_stack.get(index)?;
        let mut configuration = any
            .downcast_ref::<ConfigurationElement>()?
            .clone();
        configuration.act = self.prs.base_action(configuration.conflict_index);
        configuration.conflict_index += 1;
        if self.prs.base_action(configuration.conflict_index) == 0 {
            self.configuration_stack.reset_to(index);
        }
        Some(configuration)
    }

    pub fn top(&mut self) -> Option<ConfigurationElement> {
        if self.configuration_stack.size() == 0 {
            return None;
        }
        let index = self.configuration_stack.size() - 1;
        let any = self.configuration_stack.get(index)?;
        let mut configuration = any
            .downcast_ref::<ConfigurationElement>()?
            .clone();
        configuration.act = self.prs.base_action(configuration.conflict_index);
        Some(configuration)
    }

    pub fn size(&self) -> usize {
        self.configuration_stack.size()
    }

    pub fn max_configuration_size(&self) -> i32 {
        self.max_configuration_size
    }

    pub fn num_state_elements(&self) -> i32 {
        self.state_element_size
    }

    pub fn stacks_size(&self) -> i32 {
        self.stacks_size
    }
}
