#!/usr/bin/env bash
set -euo pipefail
ROOT="$(cd "$(dirname "${BASH_SOURCE[0]}")/../.." && pwd)"
STATUS=0

check_cmd() {
  local name="$1"
  if command -v "$name" >/dev/null 2>&1; then
    printf "OK: %-24s %s\n" "$name" "$(command -v "$name")"
  else
    printf "ERROR: missing command: %s\n" "$name" >&2
    STATUS=1
  fi
}

# Daftar tool yang harus dicek (dipastikan tidak terputus)
for cmd in git make cmake ninja clang ld.lld llvm-objdump gcc readelf objdump nm nasm qemu-system-x86_64 gdb python3 shellcheck cppcheck clang-tidy file; do
  check_cmd "$cmd"
done

exit "$STATUS"
