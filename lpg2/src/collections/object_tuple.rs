use crate::utils::object_arraycopy;

/// Dynamic array of boxed objects.
pub struct ObjectTuple {
    top: usize,
    array: Vec<Option<Box<dyn std::any::Any>>>,
}

impl ObjectTuple {
    pub fn new() -> Self {
        Self::with_estimate(10)
    }

    pub fn with_estimate(estimate: usize) -> Self {
        let mut array = Vec::with_capacity(estimate);
        array.resize_with(estimate, || None);
        Self { top: 0, array }
    }

    pub fn reset_to(&mut self, n: usize) {
        self.top = n;
    }

    pub fn reset(&mut self) {
        self.top = 0;
    }

    fn _capacity(&self) -> usize {
        self.array.len()
    }

    pub fn size(&self) -> usize {
        self.top
    }

    pub fn get(&self, i: usize) -> Option<&dyn std::any::Any> {
        if i >= self.array.len() {
            return None;
        }
        self.array[i].as_ref().map(|b| b.as_ref())
    }

    pub fn set(&mut self, index: usize, value: Box<dyn std::any::Any>) {
        if index < self.array.len() {
            self.array[index] = Some(value);
        }
    }

    pub fn next_index(&mut self) -> usize {
        let i = self.top;
        self.top += 1;
        if i >= self.array.len() {
            let mut new_array: Vec<Option<Box<dyn std::any::Any>>> =
                Vec::with_capacity(i * 2);
            new_array.resize_with(i * 2, || None);
            object_arraycopy(&mut self.array, 0, &mut new_array, 0, i);
            self.array = new_array;
        }
        i
    }

    pub fn add(&mut self, element: Box<dyn std::any::Any>) {
        let i = self.next_index();
        self.array[i] = Some(element);
    }
}

impl Default for ObjectTuple {
    fn default() -> Self {
        Self::new()
    }
}
