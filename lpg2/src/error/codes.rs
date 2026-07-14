pub const NIL_CODE: i32 = -1;
pub const LEX_ERROR_CODE: i32 = 0;
pub const ERROR_CODE: i32 = 1;
pub const BEFORE_CODE: i32 = 2;
pub const INSERTION_CODE: i32 = 3;
pub const INVALID_CODE: i32 = 4;
pub const SUBSTITUTION_CODE: i32 = 5;
pub const SECONDARY_CODE: i32 = 5;
pub const DELETION_CODE: i32 = 6;
pub const MERGE_CODE: i32 = 7;
pub const MISPLACED_CODE: i32 = 8;
pub const SCOPE_CODE: i32 = 9;
pub const EOF_CODE: i32 = 10;
pub const INVALID_TOKEN_CODE: i32 = 11;
pub const ERROR_RULE_ERROR_CODE: i32 = 11;
pub const ERROR_RULE_WARNING_CODE: i32 = 12;
pub const NO_MESSAGE_CODE: i32 = 13;
pub const MANUAL_CODE: i32 = 14;

pub const ERROR_MSG_TEXT: [&str; 14] = [
    "unexpected character ignored",
    "parsing terminated at this token",
    " inserted before this token",
    " expected after this token",
    "unexpected input discarded",
    " expected instead of this input",
    " unexpected token(s): ignored",
    " formed from merged tokens",
    "misplaced construct(s):",
    " inserted to complete scope",
    " reached after this token",
    " is invalid",
    " is ignored",
    "",
];

/// Return the error message text for a given error code.
pub fn error_msg_text(code: i32) -> &'static str {
    if code < 0 || code as usize >= ERROR_MSG_TEXT.len() {
        ""
    } else {
        ERROR_MSG_TEXT[code as usize]
    }
}
