# Amendment 01 | h1035:s3 | Lean build and publisher checksum reconciliation

**Date:** 2026-11-23  
**Supersedes:** pending CI and publisher fields in the h1035:s3 initial report and receipt.  
**Status:** LEAN_MERGE_REF_BUILD_PASSED / PUBLISHER_REJECTED_SHA_MISMATCH / NO_RETRY / NO_DUPLICATE.

## 1. Lean 4 / Mathlib build

GitHub Actions run [#45107637381](https://github.com/Satobloc/HsH/actions/runs/45107637381), job 137472464515, completed successfully.

- Checked-out ref: refs/remotes/pull/2397/merge.
- Merge commit: b409b493be9cab648b5f26f84c31cfdf62899693.
- Merge message: PR head 4fa73785016bfdb527d0a1dc47ccac6eea58a43a merged into base 62198155ccfe00e3414e7988cbb45f1d37e1b462.
- Lean: 4.34.0, commit 293d5d0c0c3f3dded4688b3ccd6a33939ac5102b.
- Lake: 5.0.0.
- Build: 8,959 jobs; completed successfully.
- The new module blob is ae621bb100cabd6d27a5899905f75c6061dca119 on both PR head and merge ref.
- The aggregator blob is 0a9d325413d996c3cf81d2408823801166e2da74 on both PR head and merge ref.

The three theorem-specific axiom reports are:

- detectorMap_lipschitzOnDomain: propext, Classical.choice, Quot.sound.
- factorizedObservedNearFiberSeparationBound: propext, Classical.choice, Quot.sound.
- noFactorizedDetectorReadoutWithinObservedNearFiberBudget: propext, Classical.choice, Quot.sound.

No sorryAx or admit occurrence was found in the captured job log or new module. This does not mean the theorems are axiom-free: the three standard Lean/Mathlib dependencies above are reported. Tests, lint, leanchecker, nanoda, and the separate axiom-audit action were skipped. This is a successful **merge-reference build**, not an exact-head-only run, independent review, main-branch integration, source-authorship validation, or physical validation. PR #2397 remains draft and unmerged.

## 2. Publisher checksum reconciliation

Publisher intake [#2399](https://github.com/Satobloc/HsH/issues/2399) returned REJECTED: SHA-256 mismatch. The submitted digest was d5e6418e9dae8671db06a8c587df1137392cfc9402a7a6e6a0b6f1b37d4df87b. The exact workspace report file, read back from main, has UTF-8 SHA-256:

57139b1c85aa46f596a43ec6ee5e66da7ebea3740b63d3a4f20bcba14ef79d88

The publisher rejection is valid. The submitted checksum was wrong; the report content itself is unchanged. No retry, edited re-trigger, duplicate issue, manual publication, or bypass was attempted. No PUBLISHED_SUBMISSIONS artifact exists for this submission. The workspace report remains the durable report; this amendment records the corrected digest and the failed publication attempt.

## 3. Remaining limits

The Lean theorem proves only the formalized conditional metric bound. It does not authenticate the map definitions, prove that the declared domains or Lipschitz constants describe a physical system, supply units or calibration, or establish H(s)H-specific predictions. No measured system or dataset was used. No physical calculation, fit, prediction, statistical uncertainty propagation, or theory-wide falsification claim is made.

Next: exact-head verification if independently available, then hostile review of the proof assumptions and source-bound map definitions. The PR must remain draft until that review and the parent Kestrel PR are resolved.
