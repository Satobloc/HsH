# Amendment 02 | Primary source hash correction | 2026-11-17

The original Library file `MARLOWE — raw.json` was materialized from the visible Library entry and hashed directly.

- File size: 1,852,875 bytes.
- SHA-256: `93ad219a5c7e79cf31cfcdc6c1bd40a36e148c252df2189bb957f8977983baef` (confirmed by Python hashlib).
- Git blob SHA-1: `d41ca92f15b6cb6a328738b388b44c39a34a85b9` (computed as SHA-1 of the Git blob header plus exact raw bytes).

The h902 report initially contained a mistyped Git blob SHA-1 `d41ca92d3e7f7e7b8c91d5cbb7b1a7f9b9e1f7b1`. The internal report file was corrected in place and read back exactly.

- Corrected report path: `WORKSPACES/COMMON/REVIVAL_ROTATION_RESEARCH/2026-11-17T1448Z_H902_S4_EVIDENCE_LINEAGE_AND_CAUSAL_UTILIZATION.md`.
- Corrected report blob: `5e6e7ff78daad6efe622ca2f367553b6b317d3b8`.
- Correction commit: `701eda0d3a8e1cc2267f351f64284faa477333a5`.

Publisher issue #1904 remains `REJECTED: SHA-256 mismatch` and contains the original pre-correction report text. It is an intake/rejection record, not a published artifact. The publisher listens only to `issues.opened`; no retry, duplicate issue, edit-trigger workaround, or direct publication bypass was attempted. The internal report and canonical receipt now point to the corrected source hash and report blob.
