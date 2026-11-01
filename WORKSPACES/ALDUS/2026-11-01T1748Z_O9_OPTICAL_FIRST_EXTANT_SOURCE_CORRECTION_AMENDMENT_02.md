# Aldus O9 optical source chronology — amendment 02: Lean verification

**Actions run:** #41334575985  
**Job:** #124931559593  
**Result:** SUCCESS  
**Verification context:** merge-ref build, not exact-head-only.

The run checked out merge commit `5f38d8cda6769f2a2fbb853ada1e7742bccf9ffc`, merging PR head `ac19fc84e126a7a4656b78d858de9d35f0b09496` into base `df06acf0a1e9a7d7a4950418bc18a655fea579f8`.

- Lean 4.34.0.
- Lake 5.0.0.
- Full library build: 8,956 targets, completed successfully.
- New namespace: `HsHVerification.AldusO9OpticalSourceChronology`.
- New theorem-specific `#print axioms` outputs: 16/16 report that the theorem does not depend on any axioms.
- Full retrieved job log: 68,252 characters / 700 lines.
- `sorryAx` count: 0.
- `admit` count: 0.
- The new module built at target 8927/8956.

The workflow ran dependency-manifest generation, Lean installation, full formal-library compilation and environment recording. It did not run separate test, lint, nanoda or automated axiom-audit jobs.

**Correct status: MERGE_REF_BUILD_SUCCESS / EXACT_HEAD_NOT_VERIFIED.** The build contains the new PR head, but the checkout is the synthetic merge commit. It verifies the encoded finite source chronology, roles, timestamps and parent identifiers only. It does not authenticate the source, establish sole authorship, establish public visibility or validate the optical model.

PR #982 remains OPEN / DRAFT / UNMERGED. No merge or theory promotion occurred.

This amendment supersedes the earlier in-progress CI status in the main report and amendment 01.
