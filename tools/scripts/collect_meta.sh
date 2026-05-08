#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
OUT="$ROOT/build/meta"
mkdir -p "$OUT"
{
  echo "mcsos_milestone=M1"
  echo "date_utc=$(date -u +"%Y-%m-%dT%H:%M:%SZ")"
  echo "repo=$ROOT"
  echo "user=$(id -un)"
  echo "uname=$(uname -a)"
  echo "[tool-versions]"
  clang --version | head -n 1 || true
  ld.lld --version | head -n 1 || true
  nasm -v || true
  qemu-system-x86_64 --version | head -n 1 || true
} | tee "$OUT/toolchain-versions.txt"
