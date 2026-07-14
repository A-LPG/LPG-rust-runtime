/// Monitor interface mirroring Go's `Monitor`.
pub trait Monitor: Send + Sync {
    fn is_cancelled(&self) -> bool;
}
