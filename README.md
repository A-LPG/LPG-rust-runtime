# LPG-rust-runtime

Rust runtime for [LPG2](https://github.com/A-LPG/LPG2) (lexer/parser engines, AST helpers, recovery).

## Install / coordinates

| Field | Value |
|-------|-------|
| Package | Cargo crate `lpg2` (path or crates.io) |
| Version | 1.0.0 |
| Compatible generator | LPG2 ≥ 2.3.0 — see [`ecosystem/compat.json`](https://github.com/A-LPG/LPG2/blob/main/ecosystem/compat.json) |

```toml
[dependencies]
lpg2 = { path = "../LPG-rust-runtime/lpg2" }
# or, once published: lpg2 = "1.0"
```

## Minimum toolchain

Rust stable (edition 2021).

## Build and test

```bash
cargo test
cargo clippy -- -D warnings
```

## Wiring generated files

1. Generate with `-programming_language=rust -table` and Rust `dtParserTemplateF.gi` / `btParserTemplateF.gi`
2. Include `*prs.rs`, `*sym.rs`, and parser sources in your crate
3. Depend on this runtime as above

## Features

| Feature | Status |
|---------|--------|
| Deterministic parser | yes |
| Backtracking | yes |
| Nested automatic AST | yes (+ behavior tests in LPG2 CI) |
| `%Recover` prosthetic AST | yes |

## Publish status

- Channel: crates.io (workflow: `.github/workflows/publish.yml`, needs `CARGO_REGISTRY_TOKEN`)
- Automation: dry-run always; publish when secret set

## Links

- Generator: https://github.com/A-LPG/LPG2
- Ecosystem: https://github.com/A-LPG/LPG2/blob/main/docs/ECOSYSTEM.md
- Runnable sample: https://github.com/A-LPG/LPG2/tree/main/examples/calculator/rust
