# H909:s4 Hale — Amendment 02: Lean CI failure and repair pending

**Status:** FIRST_CI_FAILED / FIX_COMMITTED / SECOND_CI_PENDING. No successful compile is claimed.

The original report's sentence saying Actions run #44186240636 was still in progress is superseded by this amendment. The run completed with failure before the report's final publication state was verified.

## First exact-head run

- PR: [#1924](https://github.com/Satobloc/HsH/pull/1924)
- Initial head: e665dc5f06ff6b93012e6b486f1e1d1b111fe3e1
- Actions run: [#44186240636](https://github.com/Satobloc/HsH/actions/runs/44186240636)
- Job: 134403413044
- Conclusion: FAILURE

The target module failed because the two extensional finite-set membership proofs did not simplify the filter membership conditions. The subsequent rewrite also failed because applying the independence hypothesis had already reduced the event expressions to singleton finite sets. The emitted theorem-specific axiom output contained sorryAx, so the initial file was not an accepted proof.

## Repair submitted

Commit: 63be09488d9cab6c775b08e84e6d6c65dcb1cfbf

The repair explicitly simplifies Finset.mem_filter in the event lemmas and removes the redundant rewrite, allowing norm_num to evaluate the finite cardinality contradiction directly.

- Updated exact-head Actions run: [#44187122071](https://github.com/Satobloc/HsH/actions/runs/44187122071)
- Job: 134406512685
- At 2026-11-17T22:10:31Z: IN_PROGRESS; dependency-manifest generation was active and the Lean compile step had not yet started.

The repaired module has not yet passed Lean compilation. Its #print axioms output and exact-head build must be inspected after the run completes. No merge or main-branch promotion is requested.

## Existing formalization boundary

PR #262's exact-head run #43948452979 completed the full Lean project build successfully, including CognitionSourceOverlap. However, its workflow set axiom-audit to false and skipped the global axiom audit. This verifies compilation only; no global axiom-clean claim is made.

The new common-cause countermodel remains a separate draft formalization. It proves no empirical dependence and does not modify Orson's P1 or PR #1115.