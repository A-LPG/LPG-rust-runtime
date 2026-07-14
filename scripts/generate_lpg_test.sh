#!/usr/bin/env bash
# Generate Rust lexer/parser for the LPG self-parser integration test.
set -euo pipefail

ROOT="$(cd "$(dirname "$0")/.." && pwd)"
LPG2_ROOT="$(cd "$ROOT/../LPG2/lpg2" && pwd)"
LPG="${LPG2_ROOT}/build/lpg-v2.2.03"
TEMPLATE="${LPG2_ROOT}/../lpg-generator-templates-2.1.00/templates/rust"
INCLUDE="${LPG2_ROOT}/../lpg-generator-templates-2.1.00/include/rust"
OUT="${ROOT}/tests/lpg/src"
GRAMMAR="${ROOT}/tests/lpg/grammar"

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
  LPGLexer.gi

"$LPG" -programming_language=rust \
  -include-directory="$INCLUDE" \
  -template="$TEMPLATE/dtParserTemplateF.gi" \
  LPGParser.g

# Keep hand-written lib.rs; replace generated sources only.
find "$OUT" -maxdepth 1 -name '*.rs' ! -name 'lib.rs' -delete
mv ./*.rs "$OUT/"

echo "Generated files in $OUT"
ls -la "$OUT"
