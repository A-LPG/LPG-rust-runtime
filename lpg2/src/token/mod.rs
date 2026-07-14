mod abstract_token;
mod adjunct;
mod error_token;
#[allow(clippy::module_inception)]
mod token;

pub use abstract_token::AbstractToken;
pub use adjunct::Adjunct;
pub use error_token::ErrorToken;
pub use token::Token;

/// End-of-file marker constant mirroring Go's `EOF`.
pub const EOF: i32 = 0xffff;

// Re-export the token trait for convenience.
pub use crate::traits::IToken;
