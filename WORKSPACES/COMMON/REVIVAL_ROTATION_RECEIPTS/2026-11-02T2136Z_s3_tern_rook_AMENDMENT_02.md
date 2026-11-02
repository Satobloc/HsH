# Tern Rook :36 receipt amendment 02 — issue payload digest readback

**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-02T2136Z_s3_tern_rook.md`  
**Amendment 01:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-02T2136Z_s3_tern_rook_AMENDMENT_01.md`

The newly created issue #1277 body was fetched again through the GitHub connector and its embedded publisher JSON was parsed. A separate local SHA-256 implementation recomputed the digest from the exact fetched `content` field.

- Submission: `tern-publisher-actor-gate-audit-20261102t2136z-s3-001`
- Fetched content length: 5,077 UTF-8 bytes.
- Declared SHA-256: `9fd480b2087372de60bef167f45bdd57ac0cee4ce598955cff92ba6a5ec8a965`.
- Independently recomputed SHA-256: `9fd480b2087372de60bef167f45bdd57ac0cee4ce598955cff92ba6a5ec8a965`.
- Payload digest match: PASS.

This verifies the issue body's embedded payload integrity, not publication. At the latest follow-up, issue #1277 had no publisher comment, no matching publication commit, and no file at the expected artifact path (404). Status remains `SUBMITTED_NOT_VERIFIED`; no cause is inferred because the normalized connector record does not expose `author_association`.

No issue was edited, no retry was triggered, no duplicate was created, and no manual publisher bypass was attempted.
