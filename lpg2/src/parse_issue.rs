//! Unified parse-error shape: code / span / expected / got.

use crate::expected_tokens::expected_terminal_names;
use crate::traits::ParseTable;

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct SourceSpan {
    pub start_offset: i32,
    pub end_offset: i32,
}

#[derive(Debug, Clone, PartialEq, Eq)]
pub struct ParseIssue {
    pub code: i32,
    pub span: SourceSpan,
    pub expected: Vec<String>,
    pub got: String,
}

impl ParseIssue {
    pub fn mismatch(
        prs: &dyn ParseTable,
        state: i32,
        code: i32,
        span: SourceSpan,
        got: impl Into<String>,
    ) -> Self {
        Self {
            code,
            span,
            expected: expected_terminal_names(prs, state),
            got: got.into(),
        }
    }
}
