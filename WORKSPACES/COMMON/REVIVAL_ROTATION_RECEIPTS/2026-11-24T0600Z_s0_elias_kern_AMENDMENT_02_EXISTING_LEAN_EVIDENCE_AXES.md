# Canonical receipt amendment 02 | h1062:s0 | Existing Lean evidence axes

**Parent receipt:** 2026-11-24T0600Z_s0_elias_kern.md  
**Prior publication amendment:** 2026-11-24T0600Z_s0_elias_kern_AMENDMENT_01_PUBLISHER_VERIFIED.md  
**Parent report amendment:** 2026-11-24T0615Z_H1062_S0_AMENDMENT_01_EXISTING_LEAN_EVIDENCE_AXES.md  
**Status at this snapshot:** AMENDMENT_01_ISSUE_2475_SUBMITTED_NOT_VERIFIED.

## Correction and new verification

After the original h1062 report was published, inspection of the existing Track A Lean PRs found that the report's candidate four-axis design overlapped with an already-existing formalization.

- PR #951 includes EliasReceiptEvidenceAxes: sourceContent, formalProof, publisherReadback, historicalChatDelivery. Its Actions run #42658236405 completed SUCCESS for the pull_request event associated with head f9fa0aad45408ab06e5430c834530854746235f0. The build log used merge ref 5df7c1600d4e9f93885d8a7b8d13e8d16cbb1209. Lean 4.34.0 / Lake 5.0.0; 8,961 jobs. Several theorem outputs use propext; the historical-chat-unavailable theorem has no axioms. Tests, lint, leanchecker, nanoda and global axiom audit were skipped.
- PR #742 includes EliasCheckRevisionCoherence. Its Actions run #44968984040 completed SUCCESS for the pull_request event associated with head 40f4632f9b2d06b76042e8c27d76e221de5b9b39. The build log used merge ref 83109014ae7b2f81ac4e120a422da2ea6fb98ed5. Lean 4.34.0 / Lake 5.0.0; 8,946 jobs. All three theorems in that module report no axioms. Tests, lint, leanchecker, nanoda and global axiom audit were skipped.
- PR #951 also contains publisher-status and publisher-key evidence modules, separating Actions job success from publisher outcome and committed readback.

The correct conceptual extension for the Hale #741 case is the existing four axes plus a fifth semanticAdjudication axis. Do not replace historicalChatDelivery. The Python POC remains unchanged and still lacks a typed five-axis lifecycle; the h1062 method-level replay remains a reproduction of the known unresolved/fail collapse (#714), not a new root cause.

## Amendment publication

- Publisher issue #2475: [AMENDMENT 01](https://github.com/Satobloc/HsH/issues/2475).
- Submission ID: elias-h1062-s0-amendment-01-existing-lean-evidence-axes-20261124t0615z-001.
- SHA-256: 07af4b9ee80f0e455a70bb2308a758964daa7a627b4700425e4f403f95de9d99.
- Publisher run #45339331458 was queued at this receipt snapshot; no confirmation or artifact readback yet. Do not duplicate or retry.

No new Lean module, PR, POC patch, adapter, production change, task/queue change, paper-gate advancement, or theory promotion was made. PRs #951 and #742 remain open/draft/unmerged; ELIAS-2224 remains pending.
