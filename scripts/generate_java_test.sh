#!/usr/bin/env bash
# Generate Rust lexer/parser for the Java backtracking integration test.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
LPG2_ROOT="$(cd "$ROOT/../LPG2/lpg2" && pwd)"
LPG="${LPG2_ROOT}/build/lpg-v2.2.03"
TEMPLATE="${LPG2_ROOT}/../lpg-generator-templates-2.1.00/templates/rust"
INCLUDE="${LPG2_ROOT}/../lpg-generator-templates-2.1.00/include/rust"
OUT="${ROOT}/tests/java/src"
GRAMMAR="${ROOT}/tests/java/grammar"

if [[ ! -x "$LPG" ]]; then
  echo "Build LPG2 first: cmake -DLPG2_DEPLOY_TO_VSCODE=OFF -B $LPG2_ROOT/build && cmake --build $LPG2_ROOT/build"
  exit 1
fi

export LPG_TEMPLATE="$TEMPLATE"
export LPG_INCLUDE="$INCLUDE"

mkdir -p "$OUT"
cd "$GRAMMAR"
rm -f ./*.rs

"$LPG" -programming_language=rust \
  -include-directory="$INCLUDE" \
  -template="$TEMPLATE/LexerTemplateF.gi" \
  GJavaLexer.gi

"$LPG" -programming_language=rust \
  -include-directory="$INCLUDE" \
  -template="$TEMPLATE/btParserTemplateF.gi" \
  GJavaParser.g

# Keep hand-written lib.rs; replace generated sources only.
find "$OUT" -maxdepth 1 -name '*.rs' ! -name 'lib.rs' -delete
mv ./*.rs "$OUT/"

python3 << 'PYEOF'
import re
from pathlib import Path

OUT = Path("/Users/kuafu/workspace/lpg-project/LPG-rust-runtime/tests/java/src")

RUST_KEYWORDS = {
    "abstract", "as", "async", "await", "break", "const", "continue", "crate",
    "do", "dyn", "else", "enum", "extern", "false", "fn", "for", "if", "impl",
    "in", "let", "loop", "match", "mod", "move", "mut", "pub", "ref", "return",
    "self", "Self", "static", "struct", "super", "trait", "true", "type",
    "unsafe", "use", "where", "while", "yield",
    # strict/reserved in 2021 edition used by exported Java keywords
    "assert", "boolean", "byte", "case", "catch", "char", "class", "default",
    "double", "extends", "final", "finally", "float", "goto", "implements",
    "import", "instanceof", "int", "interface", "long", "native", "new", "null",
    "package", "private", "protected", "public", "short", "strictfp", "switch",
    "synchronized", "this", "throw", "throws", "transient", "try", "void",
    "volatile",
}

# Keywords that cannot use r# raw identifiers in Rust.
RAW_FORBIDDEN = {"self", "super", "crate", "Self"}

# Escape Rust keywords in JavaLexerexp.rs exported terminal constants.
exp = OUT / "JavaLexerexp.rs"
text = exp.read_text()
for kw in sorted(RUST_KEYWORDS, key=len, reverse=True):
    if kw in RAW_FORBIDDEN:
        text = re.sub(rf"pub const {kw}:", f"pub const KW_{kw}:", text)
    else:
        text = re.sub(rf"pub const {kw}:", f"pub const r#{kw}:", text)
exp.write_text(text)

# Patch btParser template output to match working LPGParser patterns.
# Fix lexer exported symbol list to match parser (Go uses JavaParsersym.OrderedTerminalSymbols).
lexer = OUT / "JavaLexer.rs"
text = lexer.read_text()
text = text.replace(
    """    fn ordered_exported_symbols(&self) -> Option<Vec<String>> {
        Some(
            JavaLexersym::ORDERED_TERMINAL_SYMBOLS
                .iter()
                .map(|s| (*s).to_string())
                .collect(),
        )
    }""",
    """    fn ordered_exported_symbols(&self) -> Option<Vec<String>> {
        Some(
            JavaParsersym::ORDERED_TERMINAL_SYMBOLS
                .iter()
                .map(|s| (*s).to_string())
                .collect(),
        )
    }""",
)
lexer.write_text(text)

parser = OUT / "JavaParser.rs"
text = parser.read_text()

text = text.replace(
    "        JavaParsersym::ORDERED_TERMINAL_SYMBOLS.to_vec()",
    """        JavaParsersym::ORDERED_TERMINAL_SYMBOLS
            .iter()
            .map(|s| (*s).to_string())
            .collect()""",
)
text = text.replace(
    "        JavaParsersym::ORDERED_TERMINAL_SYMBOLS[kind as usize].clone()",
    "        JavaParsersym::ORDERED_TERMINAL_SYMBOLS[kind as usize].to_string()",
)

old_err_idx = """    pub fn get_rhs_error_token_index(&self, i: i32) -> i32 {
        let index = self.bt_parser.as_ref().unwrap().get_token(i);
        if self
            .prs_stream
            .borrow()
            .get_i_token(index)
            .and_then(|t| t.as_error_token())
            .is_some()
        {
            index
        } else {
            0
        }
    }"""

new_err_idx = """    pub fn get_rhs_error_token_index(&self, i: i32) -> i32 {
        let index = self.bt_parser.as_ref().unwrap().get_token(i);
        let is_error = self
            .prs_stream
            .borrow()
            .get_i_token(index)
            .map(|t| t.as_error_token().is_some())
            .unwrap_or(false);
        if is_error {
            index
        } else {
            0
        }
    }"""
text = text.replace(old_err_idx, new_err_idx)

old_reset = """    pub fn reset(&mut self, lex_stream: LexStreamRef) -> Result<(), LpgException> {
        self.prs_stream = PrsStream::new(Some(lex_stream));
        self.bt_parser().reset(
            Some(PrsStreamAdapter::new(&self.prs_stream)),
            None,
            None,
        )?;
        match self.prs_stream.borrow_mut().remap_terminal_symbols(
            &self.ordered_terminal_symbols(),
            self.prs_table.get_eoft_symbol(),
        ) {"""

new_reset = """    pub fn reset(&mut self, lex_stream: LexStreamRef) -> Result<(), LpgException> {
        self.prs_stream = PrsStream::new(Some(lex_stream));
        let adapter = PrsStreamAdapter::new(&self.prs_stream);
        self.bt_parser().reset(Some(adapter), None, None)?;
        let symbols = self.ordered_terminal_symbols();
        let eoft = self.prs_table.get_eoft_symbol();
        match self
            .prs_stream
            .borrow_mut()
            .remap_terminal_symbols(&symbols, eoft) {"""
text = text.replace(old_reset, new_reset)

# Skip expensive diagnosis on parse failure (bt recovery already reports errors).
text = text.replace(
    """            Err(LpgException::BadParse(e)) => {
                self.prs_stream.borrow_mut().reset_to(e.error_token);
                let mut diagnose_parser = DiagnoseParser::new_diagnose_parser(
                    PrsStreamAdapter::new(&self.prs_stream),
                    self.prs_table.clone(),
                    0,
                    0,
                    None,
                );
                diagnose_parser.diagnose(e.error_token);
                Err(LpgException::BadParse(e))
            }""",
    """            Err(LpgException::BadParse(e)) => Err(LpgException::BadParse(e)),""",
)

parser.write_text(text)
print("Post-processed generated Rust sources")
PYEOF

echo "Generated files in $OUT"
ls -la "$OUT"
