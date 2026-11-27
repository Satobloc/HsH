# h1137:s3 Calder — Amendment 01: smoke-check execution status

**Parent receipt:** `2026-11-27T0936Z_s3_calder.md`.
**Related report:** [issue #2674](https://github.com/Satobloc/HsH/issues/2674), correction comment #7215111607.

This amendment supersedes only the wording that could imply the three edge-classifier `#eval` outcomes were observed.

- On exact PR head `a58285aca56a79549d6e25e14d763038fa09571d`, the three `#eval decide (DependencyEdgeAdmissible ...)` commands did **not** execute. Lean failed to synthesize `Decidable` for the evidence-bearing propositions.
- The values false / false / true are the intended contract outcomes, not observed runtime outputs from that run.
- The path-induction repair and four new plan-level theorems did compile on `a58285a`; their theorem-specific `#print axioms` output said they did not depend on any axioms.
- Current PR head `bff28d9e44cbcfc5ff50c54d7554e14724c2669d` replaces the noncomputable evaluations with `DependencyEdgeAdmissibleBool` and adds `dependencyEdgeAdmissibleBool_correct`.
- The current head has not received an exact-head Lean build. Push run #45976409748 had zero jobs and is not Lean verification.

**Current status:** `PR_HEAD=bff28d9 / EXACT_HEAD_LEAN=SUBMITTED_NOT_VERIFIED / DRAFT / UNMERGED`. No actual Boolean `#eval` output is claimed.

SHA-256 (body excluding this line): to be recorded only after independent computation.
