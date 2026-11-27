# Correction and verification amendment to Ravel h1143:s2 report #2700

**Date:** 2026-11-27  
**Submission:** distinct correction amendment; not a duplicate of the substantive report.

## 1. Correct historical source identity

The original report artifact at `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ravel-h1143-s2-mode-dependent-calibration-identifiability-20261127t1524z-001.md` contains an incorrect raw-export checksum and a truncated Git blob value. Those two values were authored incorrectly and must not be relied upon.

The verified source identity in the live Ravel STATE record is:
- Conversation ID: `6a9d1a23-4fac-83ea-b76f-6805ece3ee9f`
- HsH raw-export Git blob SHA-1: `17cfe3feb830f70009557d063482b35adba0834b`
- Raw-export SHA-256: `b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba`

The original published artifact has Git blob SHA-1 `a922a9096a39577fd9a17ed0647e8e2bc6f42799` and SHA-256 `f5a13f66eb698f8eb7518aceb082d2ff40129fb3c9c128202c925354243c3971`. It remains immutable and contains the incorrect source-hash line. The issue #2700 envelope body has been corrected, but the already-published artifact was not overwritten. This amendment is the canonical correction.

## 2. Lean verification status corrected

The second exact-head verification has now completed successfully.

- Existing PR: [#1133](https://github.com/Satobloc/HsH/pull/1133)
- Exact PR head: `5865def00a07e98d2b118784f7e97fb67a615251`
- Module blob: `57c643229b24eabe9e8520b44049d1adaea7b07a`
- Run: [#46029841970](https://github.com/Satobloc/HsH/actions/runs/46029841970)
- Job: `140610570881`
- Exact PR-head checkout assertion: PASS
- Lean: 4.34.0
- Lake: 5.0.0
- Full formal-library build: SUCCESS, 8,962 jobs
- The target module built successfully in 6.7 seconds.

The actual executable evaluations were:
```
(6, 10)
(6, 10)
(2 / 5, 3 / 5)
```

The three new theorem-specific axiom reports list `propext`, `Classical.choice` and `Quot.sound`. The new module itself contains no `sorry` or `admit`. This is not a global axiom audit: global audit, tests, lint, leanchecker and nanoda were not completed by this workflow.

The first attempt [#46029141767](https://github.com/Satobloc/HsH/actions/runs/46029141767) failed because a redundant `ring` tactic ran after `field_simp` had already closed the goal. The tactic-only repair was made on the same PR branch. The second build above verifies the repaired exact PR head.

## 3. Mathematical and physical boundary

The result remains conditional field algebra:
- mode-dependent calibration factors multiply the candidate response ratio;
- unconstrained independent factors can absorb any nonzero candidate response pair;
- the observed pair alone therefore does not identify the candidate ratio.

The rational values are a formal algebra witness, not physical measurements or a physical fixture. The build does not validate the assistant-reconstructed calibration model, a detector, an H(s)H physical premise or an observable prediction.

No physical system was selected, no data were downloaded, and no fit, CODATA comparison, uncertainty propagation, paper-gate advancement or theory promotion occurred. PR #1133 remains OPEN / DRAFT / UNMERGED.

## 4. Supersession

For the historical raw-export checksum/blob and final Lean verification status, this amendment supersedes the corresponding lines in issue #2700's published artifact. The remaining source-screen, P0 and operating-boundary findings in #2700 are unchanged.