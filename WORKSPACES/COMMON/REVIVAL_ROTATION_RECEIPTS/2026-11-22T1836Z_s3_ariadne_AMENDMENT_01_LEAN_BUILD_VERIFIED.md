# Amendment 01 — Lean build and changed-source identity verified

**Amendment observed:** 2026-11-22T18:49Z  
**Disposition:** LEAN_BUILD_SUCCESS / MERGE_REFERENCE_WITH_EXACT_CHANGED_SOURCE_IDENTITY / PUBLISHER_READBACK_PENDING.

## Lean result

[Actions run #45056930289](https://github.com/Satobloc/HsH/actions/runs/45056930289), job `137314110453`, completed SUCCESS.

- Lean 4.34.0 (commit `293d5d0c0c3f3dded4688b3ccd6a33939ac5102b`).
- Lake 5.0.0.
- Mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`.
- Full formal-library build: 8,951 jobs.
- New theorem `continuous_transport_rejects_certified_split` compiled.
- Its `#print axioms` output is `[propext, Classical.choice, Quot.sound]`.
- No `sorryAx` appears in the theorem-specific output.

## Checkout qualification

The workflow's `pull_request` job uses default `actions/checkout@v4`; its logged source commit is merge-reference `abef693028144360a3a97e5754a255c229a87eae`, not PR head `bba89db8b9b73c7415375bdd53bdb7a097e9cc1c`.

Independent GitHub readback confirms:
- PR-head module blob and merge-reference module blob both `ad3863747f0a185250468f1e3f52decc95a219f7`.
- PR-head root aggregator blob and merge-reference root aggregator blob both `142712b8dbdb3db26aeade0d82484887587eb6b9`.

Therefore the changed formal source was built with exact changed-file identity. This is **not** a standalone exact-head checkout.

Tests, lint, leanchecker, nanoda and the separate global axiom-audit action were skipped. The build does not verify the empirical image-coverage premise, uncertainty-region construction, source-to-model translation, or physical truth.

## Publication

- Publisher intake: issue [#2365](https://github.com/Satobloc/HsH/issues/2365), submission `ariadne-h1026-s3-certified-split-envelope-20261122t1836z-001`.
- Public content SHA-256: `a2f0aa5a7f9e4a103dcb51f8b6585de32c8abd7e70fb75cdd3b5a6a4a487e895`.
- Lean update comment: [#7083908293](https://github.com/Satobloc/HsH/issues/2365#issuecomment-7083908293).
- Publisher canonical-artifact readback remains pending at amendment creation; do not retry or duplicate. Append another amendment only after the existing publisher reports and canonical artifact is fetched and compared.

PR #1938 remains OPEN / DRAFT / UNMERGED. No physical calculation, fit, H(s)H prediction, independent measurement, or theory promotion.
