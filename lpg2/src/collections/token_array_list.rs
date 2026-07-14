use std::rc::{Rc, Weak};

use crate::traits::IToken;

/// Dynamic array of tokens.
pub struct TokenArrayList {
    array: Vec<Option<Rc<dyn IToken>>>,
}

impl TokenArrayList {
    pub fn new() -> Self {
        Self::with_size(0, 0)
    }

    pub fn from_array(array: Vec<Rc<dyn IToken>>) -> Self {
        Self {
            array: array.into_iter().map(Some).collect(),
        }
    }

    pub fn from_copy(array: &[Rc<dyn IToken>]) -> Self {
        Self {
            array: array.iter().map(|t| Some(t.clone())).collect(),
        }
    }

    pub fn with_size(size: usize, capacity: usize) -> Self {
        let cap = capacity.max(size);
        let mut array = Vec::with_capacity(cap);
        array.resize_with(size, || None);
        Self { array }
    }

    pub fn clone_list(&self) -> Self {
        Self {
            array: self.array.clone(),
        }
    }

    pub fn clear(&mut self) -> bool {
        if !self.array.is_empty() {
            self.array.clear();
        }
        true
    }

    pub fn remove_at(&mut self, index: usize) -> (Option<Rc<dyn IToken>>, bool) {
        if index >= self.array.len() {
            return (None, false);
        }
        if index == 0 {
            let value = self.array.remove(0);
            return (value, true);
        } else if index == self.array.len() - 1 {
            let value = self.array.pop().unwrap();
            return (value, true);
        }
        let value = self.array.remove(index);
        (value, true)
    }

    pub fn remove(&mut self, value: &Rc<dyn IToken>) -> bool {
        if let Some(i) = self.search_arc(value) {
            let (_, found) = self.remove_at(i);
            return found;
        }
        false
    }

    pub fn search_arc(&self, value: &Rc<dyn IToken>) -> Option<usize> {
        if self.array.is_empty() {
            return None;
        }
        for (index, v) in self.array.iter().enumerate() {
            if let Some(ref token) = v {
                if Rc::ptr_eq(token, value) {
                    return Some(index);
                }
            }
        }
        None
    }

    pub fn remove_all(&mut self) -> bool {
        self.clear()
    }

    pub fn to_array(&self) -> Vec<Rc<dyn IToken>> {
        self.array.iter().filter_map(|t| t.clone()).collect()
    }

    pub fn size(&self) -> usize {
        self.array.len()
    }

    pub fn add(&mut self, elem: Rc<dyn IToken>) -> &mut Self {
        self.array.push(Some(elem));
        self
    }

    pub fn get(&self, index: usize) -> Option<Rc<dyn IToken>> {
        self.array.get(index)?.clone()
    }

    pub fn at(&self, index: usize) -> Option<Rc<dyn IToken>> {
        self.get(index)
    }

    pub fn contains(&self, value: &Rc<dyn IToken>) -> bool {
        self.search_arc(value).is_some()
    }

    pub fn is_empty(&self) -> bool {
        self.size() == 0
    }

    pub fn set(&mut self, index: usize, element: Rc<dyn IToken>) -> bool {
        if index >= self.array.len() {
            return false;
        }
        self.array[index] = Some(element);
        true
    }

    pub fn index_of(&self, value: &Rc<dyn IToken>) -> Option<usize> {
        self.search_arc(value)
    }

    pub fn last_index_of(&self, value: &Rc<dyn IToken>) -> Option<usize> {
        let size = self.size();
        for i in (0..size).rev() {
            if let Some(ref token) = self.array[i] {
                if Rc::ptr_eq(token, value) {
                    return Some(i);
                }
            }
        }
        None
    }

    /// Weak references for non-owning iteration.
    pub fn weak_at(&self, index: usize) -> Option<Weak<dyn IToken>> {
        self.get(index).map(|t| Rc::downgrade(&t))
    }
}

impl Default for TokenArrayList {
    fn default() -> Self {
        Self::new()
    }
}
