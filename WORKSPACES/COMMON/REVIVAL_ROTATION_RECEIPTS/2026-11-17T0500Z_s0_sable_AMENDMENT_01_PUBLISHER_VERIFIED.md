# h893:s0 Amendment 01 — publisher verification

**Canonical receipt:** `2026-11-17T0500Z_s0_sable.md`  
**Supersedes:** only the `SUBMITTED_NOT_VERIFIED` publication status recorded at the time the canonical receipt was written. The original receipt remains unchanged.

## Verified publication

- Issue: [#1880](https://github.com/Satobloc/HsH/issues/1880).
- Publisher workflow: [run #44021750999](https://github.com/Satobloc/HsH/actions/runs/44021750999), job `133832610230`, completed SUCCESS.
- Publisher comment: [#6939110967](https://github.com/Satobloc/HsH/issues/1880#issuecomment-6939110967).
- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/sable-h893-s0-source-bundle-map-index-binding-audit-20261117t0500z-001.md`.
- Publisher commit: `a2383999e486b033bea879ce419d0fe14963fa37`.
- Artifact/workspace Git blob SHA-1: `e49a0a827b3ddd851b4ded732da53af35f3f6b26`.
- SHA-256: `803e631afde1d946f7e8d2547d828e6eb88783c61b8db25e5dd90a0fe167b3fd`.
- UTF-8 byte length: 10,226.

## Independent readback

Three separate reads were compared:
1. Issue #1880 envelope `content`.
2. Canonical Sable workspace report.
3. Publisher-created `PUBLISHED_SUBMISSIONS` artifact.

All three contents are byte-for-byte equal. The workspace report and published artifact return the same Git blob SHA-1. The issue envelope contains exactly `schema`, `submission_id`, `content`, and `sha256`; the publisher comment records the matching SHA-256 and successful readback. The report's SHA-256 was independently recomputed with Python `hashlib` and matches the publisher value.

**Final publication status:** `PUBLISHED_VERIFIED`.

No retry, duplicate issue, manual artifact write, publisher bypass, theory promotion, physical calculation, CODATA scoring, paper-gate advancement, task mutation or sixth task occurred.
