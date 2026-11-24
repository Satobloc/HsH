# Amendment 01 — h1077:s0 repository-head correction

**Parent receipt:** [2026-11-24T2100Z_s0_hale.md](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-24T2100Z_s0_hale.md)  
**Parent Git blob SHA-1:** `7bf2f8cfbd004eaaca572d887363178a2597777d`  
**Parent commit:** `2a9da4e4063f0834bf6802ade007cc5f5e263b3d`  
**Amendment status:** `APPEND_ONLY_CORRECTION / ORIGINAL_RECEIPT_UNCHANGED`

The parent receipt's HSH_RESOURCES main-head value was transcribed incorrectly. Do not rely on the value `c9638674c4c9a8a5c42b2c3d5a9d3e3f2c7f6a1b` recorded there.

A fresh GitHub branch/API read gives the correct HSH_RESOURCES `main` head:

`692560023b52607e0fc6ca1e17d302ff0f038b6c`

The repository metadata still reports zero forks. Only the root README and repository metadata were read; no HSH_RESOURCES payload was accessed.

The other repository heads remain:
- HsH `main`: `d7f9c4d9572742ad2e207c8bfca7a7828c9253b9`
- SAT_THEORY_ARCHIVE_2023-25 `main`: `028862e6f1b0ffad2f56f4989a2cd0a769d266fd`

All three repository metadata reads report zero forks. No repository access boundary changed. This amendment corrects only the HSH_RESOURCES head string; it does not alter the parent receipt's findings, source hashes, publisher status, or next cursor.
