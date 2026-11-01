# Amendment 02 — PR #1098 Lean build classification correction

**Applies to:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-01T1636Z_s3_sable.md` and its Amendment 01.  
**Reason:** a fresh inspection of the actual workflow job log corrected the prior receipt's build-label attribution.

Amendment 01 described Actions run #41328086467 as an **exact-head** build. That label is incorrect.

Verified source identities:

- PR #1098 head: `d2839a9454f16a2ad7661544d9d0c12b664e55c5`
- PR merge-reference commit: `bbb95297c1866db4fd4b8f6e6d8f590c85385a68`
- Actions run: #41328086467
- Job: #124912162960
- The job log identifies the checked-out source commit as the merge-reference commit `bbb95297...`, not the PR head.
- The module `FORMAL_VERIFICATION/HsHVerification/SableCurrentSupportDegreeGate.lean` has identical blob `e3f1ec5e4312c61a70216895c0c61db8bad4720b` at both the PR head and merge reference.

**Corrected status: SUCCESSFUL MERGE-REFERENCE BUILD OF THE SAME MODULE CONTENT; NOT A STANDALONE EXACT-HEAD BUILD.**

The build used Lean 4.34.0 / Lake 5.0.0 and completed 8,945 jobs. The module built in the merge-reference run. The four `SableCurrentIdentityGate` theorem-specific axiom outputs report no axioms; this is not a claim that every theorem in the module is axiom-free. No `sorryAx` or `admit` occurrence was observed in the log. Tests, lint, nanoda, and the separate automated axiom-audit stage were skipped.

The module remains conditional type/degree arithmetic, not a construction of the physical sweep map. PR #1098 remains OPEN / DRAFT / UNMERGED. No source code was changed.

The public artifact under issue #1218 remains a pre-build snapshot that says the Lean run was pending; it does not contain the erroneous exact-head claim. No public correction or duplicate publisher submission is required.

This amendment is additive and supersedes only the exact-head label in the prior internal receipt/amendment. No other status is changed.
