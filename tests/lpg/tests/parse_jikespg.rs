use std::path::PathBuf;

use lpg_test::{LPGLexer, LPGParser};

#[test]
fn parse_jikespg_grammar() {
    let path = {
        let candidates = [
            PathBuf::from(env!("CARGO_MANIFEST_DIR"))
                .join("../../../LPG-go-runtime/test/lpg/jikespg.g"),
            PathBuf::from("/Users/kuafu/workspace/lpg-project/LPG-go-runtime/test/lpg/jikespg.g"),
        ];
        candidates
            .into_iter()
            .find(|p| p.exists())
            .unwrap_or_else(|| panic!("jikespg.g not found"))
    };

    let filename = path.to_string_lossy().into_owned();
    let mut lexer = LPGLexer::new(filename, 4, None).expect("create lexer");
    let lex_stream = lexer.get_i_lex_stream();
    let mut parser = LPGParser::new(Some(lex_stream)).expect("create parser");
    lexer
        .lexer(parser.get_i_prs_stream(), None)
        .expect("lex");
    // automatic_ast=none: successful parse returns Ok(None) rather than an AST root.
    parser.parser().expect("parse jikespg.g");
}
