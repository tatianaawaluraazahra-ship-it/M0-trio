# MCSOS 260502
MCSOS 260502 adalah proyek sistem operasi pendidikan bertahap untuk target x86_64 dengan host pengembangan Windows 11 x64 melalui WSL 2. 

Status saat ini: MO baseline requirements, governance, dan lingkungan pengembangan reproducible.

Target awal:
- Arsitektur: x86_64
- Emulator: QEMU system x86_64
- Firmware emulator: OVMF / UEFI
- Bahasa kernel awal: freestanding C17 dan assembly x86_64 minimal
- Kernel model awal: monolithic educational kernel dengan boundary modular internal

Perintah awal:
- bash tools/check_env.sh
- make meta
- make check
- make smoke

Dokumen utama:
- docs/requirements/system_requirements.md
- docs/requirements/assumptions_and_nongoals.md
- docs/adr/ADR-0001-toolchain-and-boot-baseline.md
- docs/security/threat_model.md
- docs/governance/risk_register.md
- docs/testing/verification_matrix.md

Catatan readiness: keberhasilan MO hanya berarti lingkungan dan baseline proyek siap diperiksa. MO tidak membuktikan kernel dapat boot.
