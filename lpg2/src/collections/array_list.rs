use std::any::Any;

/// Dynamic array of boxed values, mirroring Go's `ArrayList`.
pub struct ArrayList {
    array: Vec<Option<Box<dyn Any>>>,
}

impl ArrayList {
    pub fn new() -> Self {
        Self::new_with_size(0, 0)
    }

    pub fn from_array(array: Vec<Option<Box<dyn Any>>>) -> Self {
        Self { array }
    }

    pub fn from_copy(array: Vec<Option<Box<dyn Any>>>) -> Self {
        Self { array }
    }

    pub fn with_size(size: usize, capacity: usize) -> Self {
        Self::new_with_size(size, capacity)
    }

    fn new_with_size(size: usize, capacity: usize) -> Self {
        let cap = capacity.max(size);
        let mut array = Vec::with_capacity(cap);
        array.resize_with(size, || None);
        Self { array }
    }

    pub fn clone_list(&self) -> Self {
        // Go performs a shallow copy of interface references; owned `Box<dyn Any>`
        // cannot be cloned without changing the element type.
        Self::new_with_size(self.array.len(), self.array.len())
    }

    pub fn clear(&mut self) -> bool {
        if !self.array.is_empty() {
            self.array.clear();
        }
        true
    }

    pub fn remove_at(&mut self, index: usize) -> (Option<Box<dyn Any>>, bool) {
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

    pub fn remove_value(&mut self, index: usize) -> bool {
        if index < self.array.len() {
            self.array.remove(index);
            true
        } else {
            false
        }
    }

    pub fn remove_all(&mut self) -> bool {
        self.clear()
    }

    pub fn to_array(self) -> Vec<Option<Box<dyn Any>>> {
        self.array
    }

    pub fn size(&self) -> usize {
        self.array.len()
    }

    pub fn add(&mut self, elem: Box<dyn Any>) -> &mut Self {
        self.array.push(Some(elem));
        self
    }

    pub fn get(&self, index: usize) -> Option<&dyn Any> {
        self.array.get(index)?.as_ref().map(|b| b.as_ref())
    }

    pub fn get_boxed(&self, index: usize) -> Option<&Box<dyn Any>> {
        self.array.get(index)?.as_ref()
    }

    pub fn at(&self, index: usize) -> Option<&dyn Any> {
        self.get(index)
    }

    pub fn contains_index(&self, index: usize) -> bool {
        index < self.array.len() && self.array[index].is_some()
    }

    pub fn is_empty(&self) -> bool {
        self.size() == 0
    }

    pub fn set(&mut self, index: usize, element: Box<dyn Any>) -> bool {
        if index >= self.array.len() {
            return false;
        }
        self.array[index] = Some(element);
        true
    }

    pub fn index_of_ptr(&self, ptr: *const ()) -> Option<usize> {
        for (index, v) in self.array.iter().enumerate() {
            if let Some(ref boxed) = v {
                if std::ptr::eq(boxed.as_ref() as *const dyn Any, ptr as *const dyn Any) {
                    return Some(index);
                }
            }
        }
        None
    }

    pub fn last_index_of_ptr(&self, ptr: *const ()) -> Option<usize> {
        for index in (0..self.size()).rev() {
            if let Some(ref boxed) = self.array[index] {
                if std::ptr::eq(boxed.as_ref() as *const dyn Any, ptr as *const dyn Any) {
                    return Some(index);
                }
            }
        }
        None
    }
}

impl Default for ArrayList {
    fn default() -> Self {
        Self::new()
    }
}
