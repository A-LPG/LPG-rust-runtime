/// Dynamic array of integers.
#[derive(Debug, Clone)]
pub struct IntArrayList {
    array: Vec<i32>,
}

impl IntArrayList {
    pub fn new() -> Self {
        Self::with_size(0, 0)
    }

    pub fn from_array(array: Vec<i32>) -> Self {
        Self { array }
    }

    pub fn from_copy(array: &[i32]) -> Self {
        Self {
            array: array.to_vec(),
        }
    }

    pub fn with_size(size: usize, capacity: usize) -> Self {
        let cap = capacity.max(size);
        let mut array = Vec::with_capacity(cap);
        array.resize(size, 0);
        Self { array }
    }

    pub fn clone_list(&self) -> Self {
        Self::from_copy(&self.array)
    }

    pub fn clear(&mut self) -> bool {
        if !self.array.is_empty() {
            self.array.clear();
        }
        true
    }

    pub fn remove_at(&mut self, index: usize) -> (i32, bool) {
        if index >= self.array.len() {
            return (-1, false);
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

    pub fn remove(&mut self, value: i32) -> bool {
        if let Some(i) = self.search(value) {
            let (_, found) = self.remove_at(i);
            return found;
        }
        false
    }

    pub fn search(&self, value: i32) -> Option<usize> {
        if self.array.is_empty() {
            return None;
        }
        self.array.iter().position(|&v| v == value)
    }

    pub fn remove_all(&mut self) -> bool {
        self.clear()
    }

    pub fn to_array(&self) -> Vec<i32> {
        self.array.clone()
    }

    pub fn size(&self) -> usize {
        self.array.len()
    }

    pub fn add(&mut self, elem: i32) -> &mut Self {
        self.array.push(elem);
        self
    }

    pub fn get(&self, index: usize) -> i32 {
        if index >= self.array.len() {
            -1
        } else {
            self.array[index]
        }
    }

    pub fn at(&self, index: usize) -> i32 {
        self.get(index)
    }

    pub fn contains(&self, val: i32) -> bool {
        self.search(val).is_some()
    }

    pub fn is_empty(&self) -> bool {
        self.size() == 0
    }

    pub fn set(&mut self, index: usize, element: i32) -> bool {
        if index >= self.array.len() {
            return false;
        }
        self.array[index] = element;
        true
    }

    pub fn index_of(&self, elem: i32) -> Option<usize> {
        self.search(elem)
    }

    pub fn last_index_of(&self, elem: i32) -> Option<usize> {
        let size = self.size();
        (0..size).rev().find(|&i| self.array[i] == elem)
    }
}

impl Default for IntArrayList {
    fn default() -> Self {
        Self::new()
    }
}
