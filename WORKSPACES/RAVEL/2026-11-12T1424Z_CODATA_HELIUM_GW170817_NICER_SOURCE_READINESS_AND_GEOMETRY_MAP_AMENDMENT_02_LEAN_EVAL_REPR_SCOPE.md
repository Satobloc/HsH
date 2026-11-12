# Amendment 02 — Lean evaluation rendering versus theorem axiom scope

**Parent report:** [Ravel h782:s2 source-readiness and geometry-map report](2026-11-12T1424Z_CODATA_HELIUM_GW170817_NICER_SOURCE_READINESS_AND_GEOMETRY_MAP.md)  
**Classification:** ADDITIVE PROOF-SCOPE CLARIFICATION / NO PR OR THEORY CHANGE.

## Finding

The parent report notes that `RavelNormalConnectionReduction` “still reports `Real.ofCauchy (sorry ...)`.” That phrase accurately describes a captured `#eval` output, but it should not be read as evidence that the target theorem proofs contain an admitted proof.

Read-only checks:

- PR #1133 head: `3ba3880c70256e79f0ced72e40d0e11dc384e7e0`.
- Source file: `FORMAL_VERIFICATION/HsHVerification/RavelNormalConnectionReduction.lean`.
- File blob: `b4974d21b7b40fbf51373b6129e628d31c8df56e`.
- The fetched source contains `#eval` commands and no literal `sorry`, `admit`, or `axiom` declaration.
- The successful [PR workflow run #43212754624](https://github.com/Satobloc/HsH/actions/runs/43212754624) checked out `refs/remotes/pull/1133/merge`, not a standalone PR-head checkout. It completed 8,953 build jobs under Lean 4.34.0 / Lake 5.0.0.
- The job's theorem-specific `#print axioms` output for `inSheetReadout_same_for_distinct_connections` and `inSheetReadout_injective_on_reduced_subspace` lists `[propext, Classical.choice, Quot.sound]`; it does not list `sorryAx`.
- The `Real.ofCauchy (sorry ...)` strings occur in the `#eval` rendering of real-valued expressions. An evaluation rendering is not itself a theorem proof or theorem-specific axiom report. This audit does not claim to have established the exact internal implementation reason for that rendering.

## Limits retained

The job sets `nanoda-allow-sorry=true`; tests, lint, leanchecker and a separate global axiom audit were not run. Therefore this is **not** a repository-wide certification that no theorem or definition depends on `sorryAx`.

The latest PR workflow result is a successful merge-reference build. A standalone exact-head Lean build and current-main integration remain NOT VERIFIED. The separate push run #43212592322 is `conversation-json-content-ci`, not Lean verification.

No physical connection, carrier map, empirical prediction, measurement, or theory equivalence is established by this formalization.

**Correct reading:** `EVAL_REPR_OBSERVED / TARGET_THEOREM_AXIOMS_NO_SORRYAX / GLOBAL_AUDIT_NOT_RUN / MERGE_REF_BUILD_SUCCESS`.

No source code, PR, branch, task, ownership, or paper gate was changed. This is an optional repository-only correction; no direct Ravel-thread delivery, consumption, or acknowledgment is claimed.
