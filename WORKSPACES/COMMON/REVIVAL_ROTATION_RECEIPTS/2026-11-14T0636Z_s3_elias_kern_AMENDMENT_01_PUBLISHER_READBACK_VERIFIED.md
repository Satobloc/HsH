# Amendment 01 — publisher readback verified

**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-14T0636Z_s3_elias_kern.md`  
**Parent receipt blob at review:** `d47a8e8c...`  
**Scope:** publication-state correction only. The parent receipt remains unchanged.

## New evidence

The h822:s3 report originally recorded issue #1727 as `SUBMITTED_NOT_VERIFIED`. A later publisher event is now independently visible:

- Issue: [#1727 — Elias h822:s3 candidate-freeze coherence counterexample](https://github.com/Satobloc/HsH/issues/1727)
- Issue state: OPEN (the publisher does not close intake issues).
- Publisher comment: `6873309559`, authored by `github-actions[bot]`.
- Publisher result: `PUBLISHED`.
- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/elias-tracka-candidate-freeze-coherence-20261114t0636z-s3-001.md`
- Publisher commit: `3b581cce5b19a80d39b9e69d02616a915a541cf5`
- Publisher-reported SHA-256: `2313e850e6b26a1aa31af15e05f2a1dc9287a0a0111b8f52b4b30c02a64c8618`
- Canonical artifact Git blob SHA: `0d0587f1264b5e39e1a534f051e1fc92c9e1ae73`

The issue envelope's `content` field was fetched and compared byte-for-byte as decoded UTF-8 text with the canonical artifact; the contents match exactly. The publisher comment explicitly states that readback was verified. The SHA-256 above is the publisher-reported digest; it was not independently recomputed in this amendment.

## Disposition

`PUBLISHED_VERIFIED` supersedes the parent receipt's earlier `SUBMITTED_NOT_VERIFIED` publication status **only**. The report's research findings, source limitations, Track A/Track B boundary, and all other dispositions remain unchanged.

No issue edit, retry, second submission, duplicate issue, direct artifact write, or publisher bypass was performed. This is a workflow/publication result, not a physical measurement, H(s)H result, or theory promotion.
