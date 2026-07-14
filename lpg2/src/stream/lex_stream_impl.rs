use std::cell::RefCell;
use std::fs;
use std::io;
use std::rc::{Rc, Weak};

use crate::collections::IntSegmentedTuple;
use crate::error::{error_msg_text, EOF_CODE, INVALID_TOKEN_CODE, LEX_ERROR_CODE};
use crate::traits::{
    ILexStream, IMessageHandler, IPrsStream, LexStreamRef, PrsStreamRef, TokenStream,
};

/// Character input stream for lexical analysis.
///
/// `dispatch` may point at `self` or at a subclass wrapper that overrides
/// [`ILexStream`] methods.
pub struct LexStream {
    self_handle: Weak<RefCell<LexStream>>,
    override_dispatch: Option<LexStreamRef>,
    default_tab: i32,
    index: i32,
    stream_length: i32,
    input_chars: Vec<char>,
    file_name: String,
    line_offsets: IntSegmentedTuple,
    tab: i32,
    prs_stream: Option<PrsStreamRef>,
    err_msg: Option<Rc<RefCell<dyn IMessageHandler>>>,
}

impl LexStream {
    /// Create a lexer stream, optionally reading `file_name` when `input_chars` is `None`.
    #[allow(clippy::new_ret_no_self)]
    pub fn new(
        file_name: String,
        input_chars: Option<Vec<char>>,
        tab: i32,
        line_offsets: Option<IntSegmentedTuple>,
    ) -> Result<LexStreamRef, io::Error> {
        Self::new_ext(None, file_name, input_chars, tab, line_offsets)
    }

    /// Create a lexer stream with an optional external dispatch wrapper.
    pub fn new_ext(
        dispatch: Option<LexStreamRef>,
        file_name: String,
        input_chars: Option<Vec<char>>,
        tab: i32,
        line_offsets: Option<IntSegmentedTuple>,
    ) -> Result<LexStreamRef, io::Error> {
        let rc: Rc<RefCell<LexStream>> = Rc::new_cyclic(|weak| {
            RefCell::new(LexStream {
                self_handle: weak.clone(),
                override_dispatch: dispatch,
                default_tab: 1,
                index: -1,
                stream_length: 0,
                input_chars: Vec::new(),
                file_name: String::new(),
                line_offsets: IntSegmentedTuple::new(12, 4),
                tab: 1,
                prs_stream: None,
                err_msg: None,
            })
        });

        {
            let mut stream = rc.borrow_mut();
            stream.tab = if tab == 0 { stream.default_tab } else { tab };
            stream.set_line_offset(-1);
            stream.initialize(file_name, input_chars, line_offsets)?;
        }

        Ok(rc)
    }

    fn dispatch(&self) -> LexStreamRef {
        if let Some(ref d) = self.override_dispatch {
            return d.clone();
        }
        self.self_handle
            .upgrade()
            .expect("LexStream self_handle dropped while in use")
    }

    fn get_file_string(file_name: &str) -> Result<String, io::Error> {
        fs::read_to_string(file_name)
    }

    fn initialize(
        &mut self,
        file_name: String,
        input_chars: Option<Vec<char>>,
        line_offsets: Option<IntSegmentedTuple>,
    ) -> Result<(), io::Error> {
        let chars = match input_chars {
            Some(chars) => chars,
            None => Self::get_file_string(&file_name)?.chars().collect(),
        };

        self.set_input_chars(chars);
        self.set_stream_length(self.input_chars.len() as i32);
        self.set_file_name(file_name);
        if let Some(offsets) = line_offsets {
            self.line_offsets = offsets;
        } else {
            self.compute_line_offsets();
        }
        Ok(())
    }

    /// Recompute newline offsets from the current input character buffer.
    pub fn compute_line_offsets(&mut self) {
        self.line_offsets.reset();
        self.set_line_offset(-1);
        let size = self.input_chars.len();
        for i in 0..size {
            if self.input_chars[i] == '\n' {
                self.set_line_offset(i as i32);
            }
        }
    }

    /// Replace the input character buffer and reset the stream index.
    pub fn set_input_chars(&mut self, input_chars: Vec<char>) {
        self.input_chars = input_chars;
        self.index = -1;
    }

    /// Return the input character buffer.
    pub fn get_input_chars_slice(&self) -> &[char] {
        &self.input_chars
    }

    /// Set the source file name associated with this stream.
    pub fn set_file_name(&mut self, file_name: String) {
        self.file_name = file_name;
    }

    /// Set the line-offset table.
    pub fn set_line_offsets(&mut self, line_offsets: IntSegmentedTuple) {
        self.line_offsets = line_offsets;
    }

    /// Return the line-offset table.
    pub fn get_line_offsets(&self) -> &IntSegmentedTuple {
        &self.line_offsets
    }

    /// Set the tab width used for column computation.
    pub fn set_tab(&mut self, tab: i32) {
        self.tab = tab;
    }

    /// Return the tab width.
    pub fn get_tab(&self) -> i32 {
        self.tab
    }

    /// Set the current character stream index.
    pub fn set_stream_index(&mut self, index: i32) {
        self.index = index;
    }

    /// Return the current character stream index.
    pub fn get_stream_index(&self) -> i32 {
        self.index
    }

    /// Set the length of the character stream.
    pub fn set_stream_length(&mut self, stream_length: i32) {
        self.stream_length = stream_length;
    }

    /// Append a line offset to the line-offset table.
    pub fn set_line_offset(&mut self, i: i32) {
        self.line_offsets.add(i);
    }

    /// Return the character offset for line `i`.
    pub fn get_line_offset_at(&self, i: i32) -> i32 {
        self.line_offsets.get(i as usize)
    }

    /// Return the single-character string at index `i`.
    pub fn get_char_value_at(&self, i: i32) -> String {
        self.input_chars[i as usize].to_string()
    }

    /// Return the numeric code point at index `i`.
    pub fn get_int_value_at(&self, i: i32) -> i32 {
        self.input_chars[i as usize] as i32
    }

    fn next(&self, i: i32) -> i32 {
        // Call the local TokenStream impl directly. Going through
        // `dispatch().borrow()` re-enters the same RefCell when the caller
        // already holds a borrow (e.g. LexParser → wrapper → LexStream).
        TokenStream::get_next(self, i)
    }

    #[allow(dead_code)]
    fn previous(&self, i: i32) -> i32 {
        TokenStream::get_previous(self, i)
    }

    /// Return the line number of the character at index `i`.
    pub fn get_line_number_of_char_at(&self, i: i32) -> i32 {
        let index = self.line_offsets.binary_search(i);
        if index < 0 {
            -index
        } else if index == 0 {
            1
        } else {
            index
        }
    }

    /// Return the column number of the character at index `i`, honoring tab stops.
    pub fn get_column_of_char_at(&self, i: i32) -> i32 {
        let line_no = self.get_line_number_of_char_at(i);
        let mut start = self.line_offsets.get((line_no - 1) as usize);
        if start + 1 >= self.stream_length {
            return 1;
        }
        let mut k = start + 1;
        while k < i {
            if self.input_chars[k as usize] == '\t' {
                let offset = (k - start) - 1;
                start -= (self.tab - 1) - (offset % self.tab);
            }
            k += 1;
        }
        i - start
    }

    /// Return a substring of the input buffer, or `"$EOF"` when out of range.
    pub fn to_string_range(&self, start_offset: i32, end_offset: i32) -> String {
        let length = end_offset - start_offset + 1;
        if end_offset >= self.input_chars.len() as i32 {
            "$EOF".to_string()
        } else if length <= 0 {
            String::new()
        } else {
            self.input_chars[start_offset as usize..=end_offset as usize]
                .iter()
                .collect()
        }
    }

    fn report_lexical_error_position_impl(&mut self, left_loc: i32, right_loc: i32) {
        let error_code = if right_loc >= self.stream_length {
            EOF_CODE
        } else if left_loc == right_loc {
            LEX_ERROR_CODE
        } else {
            INVALID_TOKEN_CODE
        };

        let token_text = if error_code == EOF_CODE {
            "End-of-file ".to_string()
        } else if error_code == INVALID_TOKEN_CODE {
            format!("\"{}\" ", self.to_string_range(left_loc, right_loc + 1))
        } else {
            format!("\"{}\" ", self.get_char_value_at(left_loc))
        };

        let error_left_loc = 0;
        let error_right_loc = 0;
        let error_info = vec![token_text];
        self.report_lexical_error_impl(
            left_loc,
            right_loc,
            error_code,
            error_left_loc,
            error_right_loc,
            &error_info,
        );
    }

    fn report_lexical_error_impl(
        &mut self,
        left_loc: i32,
        right_loc: i32,
        error_code: i32,
        error_left_loc: i32,
        error_right_loc: i32,
        error_info: &[String],
    ) {
        if self.err_msg.is_none() {
            let location_info = format!(
                "{} : {} : {} : {} : {} : {} : {} : {}",
                self.get_file_name(),
                self.get_line_number_of_char_at(left_loc),
                self.get_column_of_char_at(left_loc),
                self.get_line_number_of_char_at(right_loc),
                self.get_column_of_char_at(right_loc),
                error_left_loc,
                error_right_loc,
                error_code
            );
            print!("****Error {location_info}");
            for info in error_info {
                print!("{info} ");
            }
            println!("{}", error_msg_text(error_code));
        } else if let Some(ref handler) = self.err_msg {
            let dispatch = self.dispatch();
            let msg_location = dispatch.borrow().get_location(left_loc, right_loc);
            let error_location = dispatch
                .borrow()
                .get_location(error_left_loc, error_right_loc);
            handler.borrow_mut().handle_message(
                error_code,
                &msg_location,
                &error_location,
                &self.get_file_name(),
                error_info,
            );
        }
    }
}

impl TokenStream for LexStream {
    fn get_token_from_end_token(&mut self, end_token: i32) -> i32 {
        if self.index < end_token {
            self.index = self.next(self.index);
        } else {
            self.index = self.stream_length;
        }
        self.index
    }

    fn get_token(&mut self) -> i32 {
        self.index = self.next(self.index);
        self.index
    }

    fn get_kind(&self, _i: i32) -> i32 {
        0
    }

    fn get_next(&self, i: i32) -> i32 {
        let next = i + 1;
        if next < self.stream_length {
            next
        } else {
            self.stream_length
        }
    }

    fn get_previous(&self, i: i32) -> i32 {
        if i <= 0 {
            0
        } else {
            i - 1
        }
    }

    fn get_name(&self, i: i32) -> String {
        if i >= self.stream_length {
            String::new()
        } else {
            self.get_char_value_at(i)
        }
    }

    fn peek(&self) -> i32 {
        self.get_next(self.index)
    }

    fn reset(&mut self) {
        self.index = -1;
    }

    fn reset_to(&mut self, i: i32) {
        self.index = i - 1;
    }

    fn bad_token(&self) -> i32 {
        0
    }

    fn get_line(&self, i: i32) -> i32 {
        self.get_line_number_of_char_at(i)
    }

    fn get_column(&self, i: i32) -> i32 {
        self.get_column_of_char_at(i)
    }

    fn get_end_line(&self, i: i32) -> i32 {
        self.get_line(i)
    }

    fn get_end_column(&self, i: i32) -> i32 {
        self.get_column_of_char_at(i)
    }

    fn after_eol(&self, i: i32) -> bool {
        if i < 1 {
            true
        } else {
            let dispatch = self.dispatch();
            let dispatch = dispatch.borrow();
            dispatch.get_line_number_of_char_at(i - 1) < dispatch.get_line_number_of_char_at(i)
        }
    }

    fn get_file_name(&self) -> String {
        self.file_name.clone()
    }

    fn get_stream_length(&self) -> i32 {
        self.stream_length
    }

    fn get_first_real_token(&self, i: i32) -> i32 {
        i
    }

    fn get_last_real_token(&self, i: i32) -> i32 {
        i
    }

    fn report_error(
        &mut self,
        error_code: i32,
        left_token: i32,
        right_token: i32,
        error_info: &[String],
        error_token: i32,
    ) {
        self.dispatch().borrow_mut().report_lexical_error(
            left_token,
            right_token,
            error_code,
            error_token,
            error_token,
            error_info,
        );
    }
}

impl ILexStream for LexStream {
    fn get_i_prs_stream(&self) -> Option<PrsStreamRef> {
        self.prs_stream.clone()
    }

    fn set_prs_stream(&mut self, prs_stream: Rc<RefCell<dyn IPrsStream>>) {
        self.prs_stream = Some(prs_stream.clone());
        let dispatch = self.dispatch();
        prs_stream.borrow_mut().set_lex_stream(dispatch);
    }

    fn get_line_count(&self) -> i32 {
        self.line_offsets.size() as i32 - 1
    }

    fn get_stream_index(&self) -> i32 {
        LexStream::get_stream_index(self)
    }

    fn ordered_exported_symbols(&self) -> Option<Vec<String>> {
        None
    }

    fn get_line_offset(&self, i: i32) -> i32 {
        self.line_offsets.get(i as usize)
    }

    fn get_line_number_of_char_at(&self, i: i32) -> i32 {
        LexStream::get_line_number_of_char_at(self, i)
    }

    fn get_column_of_char_at(&self, i: i32) -> i32 {
        LexStream::get_column_of_char_at(self, i)
    }

    fn get_char_value(&self, i: i32) -> String {
        self.get_char_value_at(i)
    }

    fn get_input_chars(&self) -> Vec<char> {
        self.input_chars.clone()
    }

    fn get_int_value(&self, i: i32) -> i32 {
        self.get_int_value_at(i)
    }

    fn make_token(&mut self, start_loc: i32, end_loc: i32, kind: i32) {
        if let Some(ref prs_stream) = self.prs_stream {
            prs_stream
                .borrow_mut()
                .make_token(start_loc, end_loc, kind);
        } else {
            self.dispatch()
                .borrow_mut()
                .report_lexical_error_position(start_loc, end_loc);
        }
    }

    fn set_message_handler(&mut self, handler: Rc<RefCell<dyn IMessageHandler>>) {
        self.err_msg = Some(handler);
    }

    fn get_message_handler(&self) -> Option<Rc<RefCell<dyn IMessageHandler>>> {
        self.err_msg.clone()
    }

    fn get_location(&self, left_loc: i32, right_loc: i32) -> [i32; 6] {
        let end_loc = if right_loc < self.stream_length {
            right_loc
        } else {
            self.stream_length - 1
        };
        let length = end_loc - left_loc + 1;
        let dispatch = self.dispatch();
        let dispatch = dispatch.borrow();
        [
            left_loc,
            length,
            dispatch.get_line_number_of_char_at(left_loc),
            dispatch.get_column_of_char_at(left_loc),
            dispatch.get_line_number_of_char_at(right_loc),
            dispatch.get_column_of_char_at(right_loc),
        ]
    }

    fn report_lexical_error_position(&mut self, left_loc: i32, right_loc: i32) {
        self.report_lexical_error_position_impl(left_loc, right_loc);
    }

    fn report_lexical_error(
        &mut self,
        left_loc: i32,
        right_loc: i32,
        error_code: i32,
        error_left_loc: i32,
        error_right_loc: i32,
        error_info: &[String],
    ) {
        self.report_lexical_error_impl(
            left_loc,
            right_loc,
            error_code,
            error_left_loc,
            error_right_loc,
            error_info,
        );
    }

    fn to_string_range(&self, start_offset: i32, end_offset: i32) -> String {
        LexStream::to_string_range(self, start_offset, end_offset)
    }
}
