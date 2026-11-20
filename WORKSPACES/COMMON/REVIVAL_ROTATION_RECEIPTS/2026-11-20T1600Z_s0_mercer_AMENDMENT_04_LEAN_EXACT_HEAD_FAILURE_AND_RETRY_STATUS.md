# h976:s0 amendment 04 | exact-head Lean failure and retry status

**Original receipt:** WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-20T1600Z_s0_mercer.md  
**Related amendment:** AMENDMENT_03_SOURCE_FIDELITY_AND_PUBLISHER_READBACK.md  
**Nature:** additive status correction. No PR, branch, task, or source artifact is overwritten.

## 1. Initial exact-head run

Draft PR #2206 first received an exact-head workflow run:

- Run: #44777103205.
- Initial head: 0a44decd979c4ae57a28de5014849f22b2255699.
- Job: #136429715187.
- Result: FAILURE.

The coordinate past-null-cone slice, Hubble-scale normalization, block-generator skew-symmetry, and trace-zero declarations compiled. The matrix-square theorem omega4_sq failed: finite matrix-product sums were not reduced, leaving sixteen entry goals unsolved. This was a proof failure, not a physical counterexample and not an empirical result.

## 2. Corrective change and retry

The matrix-product proof was updated to unfold the finite sum using Fin.sum_univ_succ.

- New exact PR head: 362f6ed789e13e13b39d13f4d9706f7214394872.
- Retry run: #44778070078.
- Job: #136433116765.
- Exact PR-head checkout step: SUCCESS.
- Current observed status: IN_PROGRESS at “Generate Lake dependency manifest”.
- The Lean compilation step is still pending; workflow logs are not yet available.

This supersedes amendment 03's earlier statement that no workflow run had been returned. It does not supersede the statement that no successful compile is yet verified.

## 3. Verification boundary

PR #2206 remains an open draft stacked on the shared, unmerged PR #262 infrastructure branch. The shared base branch was not modified. The second run has not yet reached Lean compilation, so no theorem in the new module is currently claimed as compiled or verified.

The workflow does not run tests, lint, nanoda, leanchecker, or a global axiom audit in the current configuration. Even a successful lake build would verify only the formalized coordinate/algebraic statements, not the physical translation, unit assignments, H(s)H metric, observer-to-sky map, or truth of the premises.

No local Lean/Elan installation or outbound network was available for a separate local build. No Factory Floor handoff, physical calculation, fit, prediction, measurement, CODATA score, or BEDROCK promotion is made.

## 4. Next cursor

Wait for run #44778070078 to complete. If it fails, inspect the exact-head job log and repair only the failed proof. If it succeeds, record the exact head, remaining assumptions, and skipped audits, then keep the PR draft until its shared infrastructure dependency and independent review are resolved.

No automation, task identity, schedule, phase, worker ownership, or paper gate changes.
