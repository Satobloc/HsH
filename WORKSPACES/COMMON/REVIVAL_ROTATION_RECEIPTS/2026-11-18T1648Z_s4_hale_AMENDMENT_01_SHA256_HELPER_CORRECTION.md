# H928:s4 receipt amendment 01 | SHA-256 helper correction

Date: 2026-11-18. The initial checksum helper used an incorrect 64-bit length-padding implementation. It failed the standard SHA-256 "abc" vector and therefore the digest recorded in the initial receipt/continuity and issue #1996 is incorrect.

- Initial declared digest (invalid): 6a93d7146e4197bad4cb6c56fcf7eca9104d22011852640b6495deaa7faaaab4
- Correct SHA-256 helper now passes the standard "abc" vector: ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad
- Exact report content read back from GitHub: 9,428 UTF-8 bytes.
- Correct report SHA-256: 8bed59ab09f6b0b39f97ad2a2e943a738adaa7b323c5b4bd49f517a360a2f1e4
- Report blob remains e518e38d94d127968ddcc6bfc09dc4429a65ebe3; content was not changed.
- Intake issue #1996 remains open with the incorrect declared digest. The publisher listens only to issues.opened, so no edit/retry was attempted. At amendment creation, no publisher comment existed and the canonical artifact was not available. Wait for the original rejection before any corrected intake; do not create a duplicate artifact or reuse the issue without a documented publisher route.

This is a checksum-process error, not a research-result error. All scientific calculations and exact reanalysis remain unchanged.
