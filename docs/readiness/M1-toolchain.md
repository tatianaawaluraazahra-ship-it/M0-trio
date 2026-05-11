# Readiness Review M1 - Toolchain Reproducible

## Identitas
- **Nama Kelompok**: Trio
- **Anggota 1**: Tatiana Awalura Azahra - 2583207073019
- **Anggota 2**: Rizwa Rahmatunnisa - 2583207073001
- **Anggota 3**: Ai Fitri Sobariah - 2507483207001
- **Kelas**: PTI 1A
- **Dosen**: Muhaemin Sidiq, S.Pd., M.Pd.
- **Program Studi**: Pendidikan Teknologi Informasi, Institut Pendidikan Indonesia
- **Tanggal**: 11 Mei 2026
- **Commit hash**: $(git rev-parse HEAD 2>/dev/null || echo "Initial")

## Ringkasan hasil
Seluruh pengujian teknis pada Milestone 1 telah berhasil diselesaikan oleh Kelompok Trio menggunakan Makefile otomatis. Lingkungan pengembangan pada WSL2 Ubuntu 26.04 telah divalidasi dan siap digunakan untuk tahap pengembangan kernel di M2.

## Evidence checklist
| Evidence | Path | Status | Catatan |
|---|---|---|---|
| Toolchain versions | build/meta/toolchain-versions.txt | OK | Terverifikasi |
| Host readiness | build/meta/host-readiness.txt | OK | Terverifikasi |
| QEMU capabilities | build/meta/qemu-capabilities.txt | OK | Terverifikasi |
| Freestanding object | build/proof/freestanding_probe.o | OK | Terverifikasi |
| Freestanding ELF | build/proof/freestanding_probe.elf | OK | Terverifikasi |
| ELF header | build/proof/readelf-header.txt | OK | Terverifikasi |
| ELF sections | build/proof/readelf-sections.txt | OK | Terverifikasi |
| Disassembly | build/proof/objdump-disassembly.txt | OK | Terverifikasi |
| Undefined symbol report | build/proof/nm-undefined.txt | OK | Kosong (Pass) |
| Reproducibility hash | build/repro/sha256-run1.txt | OK | Identik |

## Acceptance criteria M1
| Kriteria | Lulus/Gagal | Bukti |
|---|---|---|
| Repository berada di filesystem Linux WSL | Lulus | /home/tatiana/src/mcsos |
| Semua tool wajib tersedia | Lulus | make check OK |
| make meta berhasil | Lulus | Metadata tersimpan |
| make check berhasil | Lulus | Toolchain lengkap |
| make proof berhasil | Lulus | ELF dihasilkan |
| make qemu-probe berhasil | Lulus | q35 & OVMF OK |
| make repro berhasil | Lulus | Hash cocok |
| make test berhasil | Lulus | FINAL STATUS: OK |
| nm-undefined.txt kosong | Lulus | Tidak ada external symbol |
| Hasil readelf menunjukkan ELF64 x86_64 | Lulus | x86-64 executable |

## Known limitations
1. Belum ada cross GCC x86_64-elf-gcc.
2. Belum ada Continuous Integration (CI).
3. Belum ada pengujian pada hardware fisik secara langsung.

## Risiko dan mitigasi
1. Salah target triple -> Dilakukan inspeksi berkala pada header ELF dengan readelf.
2. Ketergantungan library host -> Mitigasi dengan flag -ffreestanding dan -nostdlib.
3. Kerusakan lingkungan WSL -> Rutin melakukan backup snapshot melalui sistem Git.

## Readiness decision
- [ ] Belum siap lanjut M2.
- [ ] Siap lanjut M2 dengan catatan.
- [x] Siap lanjut M2.

**Alasan keputusan**: Meskipun sempat ditemukan kendala teknis pada format separator Makefile dan kesalahan sintaksis pada script check_toolchain, semua masalah tersebut telah diperbaiki dan divalidasi ulang. Seluruh acceptance criteria kini telah terpenuhi dengan status OK pada hasil akhir `make test`.
