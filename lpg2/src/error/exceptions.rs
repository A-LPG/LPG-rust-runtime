use thiserror::Error;

use crate::collections::IntArrayList;

#[derive(Debug, Error)]
#[error("BadParseException")]
pub struct BadParseException {
    pub error_token: i32,
}

impl BadParseException {
    pub fn new(error_token: i32) -> Self {
        Self { error_token }
    }

    pub fn to_string_msg(&self) -> String {
        self.to_string()
    }
}

#[derive(Debug, Error)]
#[error("{message}")]
pub struct BadParseSymFileException {
    message: String,
}

impl BadParseSymFileException {
    pub fn new(info: impl Into<String>) -> Self {
        let message = {
            let s = info.into();
            if s.is_empty() {
                "BadParseSymFileException".to_string()
            } else {
                s
            }
        };
        Self { message }
    }

    pub fn to_string_msg(&self) -> String {
        self.to_string()
    }
}

#[derive(Debug, Error)]
#[error("{message}")]
pub struct MismatchedInputCharsException {
    message: String,
}

impl MismatchedInputCharsException {
    pub fn new(info: impl Into<String>) -> Self {
        let message = {
            let s = info.into();
            if s.is_empty() {
                "MismatchedInputCharsException".to_string()
            } else {
                s
            }
        };
        Self { message }
    }

    pub fn to_string_msg(&self) -> String {
        self.to_string()
    }
}

#[derive(Debug, Error)]
#[error("{message}")]
pub struct NotBacktrackParseTableException {
    message: String,
}

impl NotBacktrackParseTableException {
    pub fn new(info: impl Into<String>) -> Self {
        let message = {
            let s = info.into();
            if s.is_empty() {
                "NotBacktrackParseTableException".to_string()
            } else {
                s
            }
        };
        Self { message }
    }

    pub fn to_string_msg(&self) -> String {
        self.to_string()
    }
}

#[derive(Debug, Error)]
#[error("{message}")]
pub struct NotDeterministicParseTableException {
    message: String,
}

impl NotDeterministicParseTableException {
    pub fn new(info: impl Into<String>) -> Self {
        let message = {
            let s = info.into();
            if s.is_empty() {
                "NotDeterministicParseTableException".to_string()
            } else {
                s
            }
        };
        Self { message }
    }

    pub fn to_string_msg(&self) -> String {
        self.to_string()
    }
}

#[derive(Debug, Error)]
#[error("{message}")]
pub struct NullExportedSymbolsException {
    message: String,
}

impl NullExportedSymbolsException {
    pub fn new(info: impl Into<String>) -> Self {
        let message = {
            let s = info.into();
            if s.is_empty() {
                "NullExportedSymbolsException".to_string()
            } else {
                s
            }
        };
        Self { message }
    }

    pub fn to_string_msg(&self) -> String {
        self.to_string()
    }
}

#[derive(Debug, Error)]
#[error("{message}")]
pub struct NullPointerException {
    message: String,
}

impl NullPointerException {
    pub fn new(info: impl Into<String>) -> Self {
        let message = {
            let s = info.into();
            if s.is_empty() {
                "NullPointerException".to_string()
            } else {
                s
            }
        };
        Self { message }
    }

    pub fn to_string_msg(&self) -> String {
        self.to_string()
    }
}

#[derive(Debug, Error)]
#[error("{message}")]
pub struct NullTerminalSymbolsException {
    message: String,
}

impl NullTerminalSymbolsException {
    pub fn new(info: impl Into<String>) -> Self {
        let message = {
            let s = info.into();
            if s.is_empty() {
                "NullTerminalSymbolsException".to_string()
            } else {
                s
            }
        };
        Self { message }
    }

    pub fn to_string_msg(&self) -> String {
        self.to_string()
    }
}

#[derive(Debug, Error)]
#[error("{message}")]
pub struct TokenStreamNotIPrsStreamException {
    message: String,
}

impl TokenStreamNotIPrsStreamException {
    pub fn new(info: impl Into<String>) -> Self {
        let message = {
            let s = info.into();
            if s.is_empty() {
                "TokenStreamNotIPrsStreamException".to_string()
            } else {
                s
            }
        };
        Self { message }
    }

    pub fn to_string_msg(&self) -> String {
        self.to_string()
    }
}

#[derive(Debug, Error)]
#[error("{message}")]
pub struct UnavailableParserInformationException {
    message: String,
}

impl UnavailableParserInformationException {
    pub fn new(info: impl Into<String>) -> Self {
        let message = {
            let s = info.into();
            if s.is_empty() {
                "Unavailable parser Information Exception".to_string()
            } else {
                s
            }
        };
        Self { message }
    }

    pub fn to_string_msg(&self) -> String {
        self.to_string()
    }
}

#[derive(Debug, Error)]
#[error("{message}")]
pub struct UndefinedEofSymbolException {
    message: String,
}

impl UndefinedEofSymbolException {
    pub fn new(info: impl Into<String>) -> Self {
        let message = {
            let s = info.into();
            if s.is_empty() {
                "UndefinedEofSymbolException".to_string()
            } else {
                s
            }
        };
        Self { message }
    }

    pub fn to_string_msg(&self) -> String {
        self.to_string()
    }
}

#[derive(Debug, Error)]
#[error("UnimplementedTerminalsException")]
pub struct UnimplementedTerminalsException {
    symbols: IntArrayList,
}

impl UnimplementedTerminalsException {
    pub fn new(symbols: IntArrayList) -> Self {
        Self { symbols }
    }

    pub fn get_symbols(&self) -> &IntArrayList {
        &self.symbols
    }

    pub fn to_string_msg(&self) -> String {
        self.to_string()
    }
}

#[derive(Debug, Error)]
#[error("{message}")]
pub struct UnknownStreamType {
    message: String,
}

impl UnknownStreamType {
    pub fn new(info: impl Into<String>) -> Self {
        let message = {
            let s = info.into();
            if s.is_empty() {
                "UnknownStreamType".to_string()
            } else {
                s
            }
        };
        Self { message }
    }

    pub fn to_string_msg(&self) -> String {
        self.to_string()
    }
}

/// Union of all LPG2 runtime exceptions.
#[derive(Debug, Error)]
pub enum LpgException {
    #[error(transparent)]
    BadParse(#[from] BadParseException),
    #[error(transparent)]
    BadParseSymFile(#[from] BadParseSymFileException),
    #[error(transparent)]
    MismatchedInputChars(#[from] MismatchedInputCharsException),
    #[error(transparent)]
    NotBacktrackParseTable(#[from] NotBacktrackParseTableException),
    #[error(transparent)]
    NotDeterministicParseTable(#[from] NotDeterministicParseTableException),
    #[error(transparent)]
    NullExportedSymbols(#[from] NullExportedSymbolsException),
    #[error(transparent)]
    NullPointer(#[from] NullPointerException),
    #[error(transparent)]
    NullTerminalSymbols(#[from] NullTerminalSymbolsException),
    #[error(transparent)]
    TokenStreamNotIPrsStream(#[from] TokenStreamNotIPrsStreamException),
    #[error(transparent)]
    UnavailableParserInformation(#[from] UnavailableParserInformationException),
    #[error(transparent)]
    UndefinedEofSymbol(#[from] UndefinedEofSymbolException),
    #[error(transparent)]
    UnimplementedTerminals(#[from] UnimplementedTerminalsException),
    #[error(transparent)]
    UnknownStreamType(#[from] UnknownStreamType),
}
