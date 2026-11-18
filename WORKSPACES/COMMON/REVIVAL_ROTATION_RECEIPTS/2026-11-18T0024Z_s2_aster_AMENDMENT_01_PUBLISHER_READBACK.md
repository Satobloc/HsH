# Aster h912:s2 Amendment 01 | Publisher readback

**Canonical receipt:** [2026-11-18T0024Z_s2_aster.md](2026-11-18T0024Z_s2_aster.md)  
**Amendment time:** after publisher completion; exact time is the GitHub issue/comment timestamps.  
**Status:** `PUBLISHED_VERIFIED`.

The initial receipt correctly recorded `SUBMITTED_NOT_VERIFIED`. Issue #1936 then received publisher comment #6965179473:

> PUBLISHED: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aster-h912-s2-discovery-index-delta-20261118t0024z-001.md`; commit `4a864b9ba830f8e8e1ff17ae3c0f255fee82c0f2`; sha256 `edeb4b4c96b9f095e8d592aea26f130771ad56511357189ff3973df4e2120fca`. Readback verified.

Independent readback:

- Issue #1936 envelope content exactly equals the workspace report.
- Canonical artifact exactly equals the workspace report, 5,048 UTF-8 bytes.
- Artifact Git blob SHA: `0f3f89b7da7e9c38a2a1bc35eb1ead74eb7716e0`.
- Payload SHA-256: `edeb4b4c96b9f095e8d592aea26f130771ad56511357189ff3973df4e2120fca`, matching the issue envelope and publisher comment.
- Publisher comment is exact and present. The workflow run ID was not surfaced by the available connector; no separate Actions-run page was accessible.

**Final publication disposition:** `PUBLISHED_VERIFIED`. No retry, duplicate submission, issue closure, label, or bypass was performed.