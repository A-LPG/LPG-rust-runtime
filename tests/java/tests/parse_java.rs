use std::path::PathBuf;

use java_test::{JavaLexer, JavaParser};

#[test]
fn parse_java_test_file() {
    let path = {
        let candidates = [
            PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("testdata/test.java"),
            PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("testdata/minimal.java"),
            PathBuf::from(env!("CARGO_MANIFEST_DIR"))
                .join("../../../LPG-go-runtime/test/java/test.java"),
        ];
        candidates
            .into_iter()
            .find(|p| p.exists())
            .unwrap_or_else(|| panic!("test.java not found"))
    };

    let filename = path.to_string_lossy().into_owned();
    let mut lexer = JavaLexer::new(filename, 4, None).expect("create lexer");
    let lex_stream = lexer.get_i_lex_stream();
    let mut parser = JavaParser::new(Some(lex_stream)).expect("create parser");
    lexer
        .lexer(parser.get_i_prs_stream(), None)
        .expect("lex");
    // automatic_ast=none: successful parse returns Ok(None) rather than an AST root.
    parser.parser().expect("parse test.java");
}
