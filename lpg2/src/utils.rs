/// Copy `length` elements from `src` starting at `src_pos` into `dest` starting at `dest_pos`.
pub fn arraycopy(src: &[i32], src_pos: usize, dest: &mut [i32], dest_pos: usize, length: usize) {
    dest[dest_pos..(length + dest_pos)].copy_from_slice(&src[src_pos..(length + src_pos)]);
}

/// Copy `length` elements from `src` starting at `src_pos` into `dest` starting at `dest_pos`.
pub fn object_arraycopy(
    src: &mut [Option<Box<dyn std::any::Any>>],
    src_pos: usize,
    dest: &mut [Option<Box<dyn std::any::Any>>],
    dest_pos: usize,
    length: usize,
) {
    for i in 0..length {
        dest[dest_pos + i] = src[src_pos + i].take();
    }
}

/// Current time in milliseconds since Unix epoch (Go `Now`).
pub fn now() -> i32 {
    use std::time::{SystemTime, UNIX_EPOCH};
    SystemTime::now()
        .duration_since(UNIX_EPOCH)
        .map(|d| (d.as_millis() as i64).min(i32::MAX as i64) as i32)
        .unwrap_or(0)
}

/// Append a rune to a string (Go `AppendRune`).
pub fn append_rune(s: &str, c: char) -> String {
    let mut out = String::with_capacity(s.len() + c.len_utf8());
    out.push_str(s);
    out.push(c);
    out
}

/// Return a substring by rune index and length (Go `SubStr`).
pub fn sub_str(s: &str, start: usize, length: usize) -> String {
    s.chars().skip(start).take(length).collect()
}

/// Return the rune at a rune index (Go `CharAt`).
pub fn char_at(s: &str, start: usize) -> char {
    s.chars().nth(start).unwrap_or('\0')
}

/// Lowercase a string (Go `ToLower`).
pub fn to_lower(s: &str) -> String {
    s.to_lowercase()
}

/// Uppercase a string (Go `ToUpper`).
pub fn to_upper(s: &str) -> String {
    s.to_uppercase()
}

/// Compare two string slices for equality (including nil-vs-empty semantics from Go).
pub fn string_slice_equal(a: &[String], b: &[String]) -> bool {
    if a.len() != b.len() {
        return false;
    }
    if a.is_empty() != b.is_empty() {
        return false;
    }
    for (i, v) in a.iter().enumerate() {
        if v != &b[i] {
            return false;
        }
    }
    true
}
