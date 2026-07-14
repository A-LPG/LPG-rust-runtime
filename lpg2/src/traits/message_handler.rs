use std::cell::RefCell;
use std::rc::Rc;

pub const OFFSET_INDEX: usize = 0;
pub const LENGTH_INDEX: usize = 1;
pub const START_LINE_INDEX: usize = 2;
pub const START_COLUMN_INDEX: usize = 3;
pub const END_LINE_INDEX: usize = 4;
pub const END_COLUMN_INDEX: usize = 5;

/// Message handler interface mirroring Go's `IMessageHandler`.
pub trait IMessageHandler {
    /// When a location is nil, the value of its offset is 0.
    fn handle_message(
        &mut self,
        error_code: i32,
        msg_location: &[i32],
        error_location: &[i32],
        filename: &str,
        error_info: &[String],
    );
}

#[allow(dead_code)]
pub type MessageHandlerRef = Rc<RefCell<dyn IMessageHandler>>;
