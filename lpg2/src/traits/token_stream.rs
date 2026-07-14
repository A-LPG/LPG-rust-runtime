/// Token stream interface mirroring Go's `TokenStream`.
pub trait TokenStream {
    fn get_token_from_end_token(&mut self, end_token: i32) -> i32;
    fn get_token(&mut self) -> i32;
    fn get_kind(&self, i: i32) -> i32;
    fn get_next(&self, i: i32) -> i32;
    fn get_previous(&self, i: i32) -> i32;
    fn get_name(&self, i: i32) -> String;
    fn peek(&self) -> i32;
    fn reset(&mut self);
    fn reset_to(&mut self, i: i32);
    fn bad_token(&self) -> i32;
    fn get_line(&self, i: i32) -> i32;
    fn get_column(&self, i: i32) -> i32;
    fn get_end_line(&self, i: i32) -> i32;
    fn get_end_column(&self, i: i32) -> i32;
    fn after_eol(&self, i: i32) -> bool;
    fn get_file_name(&self) -> String;
    fn get_stream_length(&self) -> i32;
    fn get_first_real_token(&self, i: i32) -> i32;
    fn get_last_real_token(&self, i: i32) -> i32;
    fn report_error(
        &mut self,
        error_code: i32,
        left_token: i32,
        right_token: i32,
        error_info: &[String],
        error_token: i32,
    );
}
