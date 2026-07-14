# LPG-rust-runtime

Rust runtime library for [LPG2](https://github.com/A-LPG/LPG2) (LALR Parser Generator).

This crate ports the Go runtime [`LPG-go-runtime/lpg2`](https://github.com/A-LPG/LPG-go-runtime) to idiomatic Rust, providing lexer/parser engines, token streams, error recovery, and diagnostics used by LPG-generated parsers.

## Crate layout

```
LPG-rust-runtime/
├── lpg2/              # Main runtime crate
├── tests/lpg/         # LPG self-parser integration test (generated sources)
├── tests/java/        # Java backtracking grammar integration test scaffold
└── scripts/           # Code generation helpers
```

## Building

```bash
cargo build
cargo test
cargo clippy -- -D warnings
```

## Using with LPG2

1. Build LPG2 with Rust table support:

```bash
cd ../LPG2/lpg2
cmake -DLPG2_DEPLOY_TO_VSCODE=OFF -B build
cmake --build build
```

2. Use Rust templates from `LPG2/lpg-generator-templates-2.1.00/templates/rust/`:

- `LexerTemplateF.gi`
- `KeywordTemplateF.gi`
- `dtParserTemplateF.gi`
- `btParserTemplateF.gi`

3. Set environment variables when generating:

```bash
export LPG_TEMPLATE=/path/to/LPG2/lpg-generator-templates-2.1.00/templates/rust
export LPG_INCLUDE=/path/to/LPG2/lpg-generator-templates-2.1.00/include/rust
lpg -programming_language=rust -template=LexerTemplateF.gi MyLexer.gi
```

4. Add to generated `Cargo.toml`:

```toml
[dependencies]
lpg2 = { path = "../LPG-rust-runtime/lpg2" }
```

## Integration tests

Regenerate the LPG self-parser test sources:

```bash
./scripts/generate_lpg_test.sh
cd tests/lpg && cargo test
```

## License

Eclipse Public License v2.0
