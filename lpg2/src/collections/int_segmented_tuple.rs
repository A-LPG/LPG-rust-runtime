/// Segmented dynamic array of integers.
pub struct IntSegmentedTuple {
    top: usize,
    size: usize,
    log_blksize: usize,
    base_size: usize,
    base: Vec<Vec<i32>>,
}

impl IntSegmentedTuple {
    pub fn new(log_blksize: usize, base_size: usize) -> Self {
        let mut a = Self {
            top: 0,
            size: 0,
            log_blksize: 3,
            base_size: 4,
            base: Vec::new(),
        };
        a.log_blksize = log_blksize;
        a.base_size = if base_size == 0 { 4 } else { base_size };
        a.base = vec![Vec::new(); a.base_size];
        a
    }

    pub fn default_tuple() -> Self {
        Self::new(3, 4)
    }

    fn arraycopy(src: &[Vec<i32>], src_pos: usize, dest: &mut [Vec<i32>], dest_pos: usize, length: usize) {
        dest[dest_pos..(length + dest_pos)].clone_from_slice(&src[src_pos..(length + src_pos)]);
    }

    fn allocate_more_space(&mut self) {
        let k = self.size >> self.log_blksize;
        if k == self.base_size {
            self.base_size *= 2;
            let mut new_base = vec![Vec::new(); self.base_size];
            Self::arraycopy(&self.base, 0, &mut new_base, 0, k);
            self.base = new_base;
        }
        self.base[k] = vec![0; 1 << self.log_blksize];
        self.size += 1 << self.log_blksize;
    }

    pub fn resize(&mut self) {
        self.resize_to(0);
    }

    pub fn resize_to(&mut self, n: usize) {
        if n > self.size {
            while n > self.size {
                self.allocate_more_space();
            }
        }
        self.top = n;
    }

    pub fn reset(&mut self) {
        self.reset_to(0);
    }

    pub fn reset_to(&mut self, n: usize) {
        self.top = n;
    }

    #[allow(clippy::misnamed_getters)]
    pub fn size(&self) -> usize {
        self.top
    }

    pub fn out_of_range(&self, i: usize) -> bool {
        i >= self.top
    }

    pub fn get(&self, i: usize) -> i32 {
        self.base[i >> self.log_blksize][i % (1 << self.log_blksize)]
    }

    pub fn set(&mut self, i: usize, element: i32) {
        self.base[i >> self.log_blksize][i % (1 << self.log_blksize)] = element;
    }

    pub fn next_index(&mut self) -> usize {
        let i = self.top;
        self.top += 1;
        if i == self.size {
            self.allocate_more_space();
        }
        i
    }

    pub fn add(&mut self, element: i32) {
        let i = self.next_index();
        self.base[i >> self.log_blksize][i % (1 << self.log_blksize)] = element;
    }

    pub fn binary_search(&self, element: i32) -> i32 {
        let mut low = 0usize;
        let mut high = self.top;
        while high > low {
            let mid = (high + low) / 2;
            let mid_element = self.get(mid);
            if element == mid_element {
                return mid as i32;
            } else if element < mid_element {
                high = mid;
            } else {
                low = mid + 1;
            }
        }
        -(low as i32)
    }
}

impl Default for IntSegmentedTuple {
    fn default() -> Self {
        Self::default_tuple()
    }
}
