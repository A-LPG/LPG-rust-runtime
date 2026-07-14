#![allow(non_camel_case_types)]
#![allow(non_upper_case_globals)]
#![allow(dead_code)]

mod jikespg_sym;
mod jikespg_prs;

#[cfg(test)]
mod tests {
    use lpg2::traits::ParseTable;
    use crate::jikespg_prs::jikespg_prs;

    #[test]
    fn parse_table_constants() {
        let prs = jikespg_prs::new();
        assert!(prs.get_num_states() > 0);
        assert!(prs.get_num_rules() > 0);
        assert!(prs.is_valid_for_parser());
        assert_eq!(prs.get_start_symbol(), prs.lhs(0));
    }
}
