use crate::utils::arraycopy;

/// Dynamic array of integers.
pub struct IntTuple {
    array: Vec<i32>,
    top: usize,
}

impl IntTuple {
    pub fn new() -> Self {
        Self::with_estimate(10)
    }

    pub fn with_estimate(estimate: usize) -> Self {
        Self {
            top: 0,
            array: vec![0; estimate],
        }
    }

    pub fn reset_to(&mut self, n: usize) {
        self.top = n;
    }

    pub fn reset(&mut self) {
        self.top = 0;
    }

    pub fn capacity(&self) -> usize {
        self.array.len()
    }

    pub fn size(&self) -> usize {
        self.top
    }

    pub fn get(&self, i: usize) -> i32 {
        self.array[i]
    }

    pub fn set(&mut self, index: usize, value: i32) {
        if index < self.array.len() {
            self.array[index] = value;
        }
    }

    pub fn next_index(&mut self) -> usize {
        let i = self.top;
        self.top += 1;
        if i >= self.array.len() {
            let mut new_array = vec![0; i * 2];
            arraycopy(&self.array, 0, &mut new_array, 0, i);
            self.array = new_array;
        }
        i
    }

    pub fn add(&mut self, element: i32) {
        let i = self.next_index();
        self.array[i] = element;
    }
}

impl Default for IntTuple {
    fn default() -> Self {
        Self::new()
    }
}
