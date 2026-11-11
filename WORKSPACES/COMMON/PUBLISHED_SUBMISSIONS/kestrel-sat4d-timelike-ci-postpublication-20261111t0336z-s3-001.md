# Post-publication CI verification: Kestrel SAT4D timelike gate

**Scope:** additive verification update to the scale-location submission already published at issue #1578. This note records a later CI result; it does not replace the original artifact or add a physical claim.

## CI chronology

1. **Run #42954816385 failed.** Lean parsed the Greek `lambda` binder as a reserved token. The source was changed to the ASCII parameter name `lam`.
2. **Run #42955291571 failed.** The definition `sat4dVelocity` was rejected as computable because it depends on noncomputable `Real.cos`.
3. **Repair commit:** `8f49c39c8428e3d0195a8d6abd3d613aa786de4d` marks `sat4dVelocity` as `noncomputable`.
4. **PR-event run #42955799035 / job #130310470259 completed SUCCESS.** Lean 4.34.0 / Lake 5.0.0 built the full root library (8,956 jobs). `KestrelSAT4DTimelikeGate` built at 8,932/8,956.

## Exact verification scope

- PR head: `8f49c39c8428e3d0195a8d6abd3d613aa786de4d`.
- PR base: `61cc8b65ffed70296e0121dbae067892a79c81d4`.
- Workflow checked-out merge commit (`GITHUB_SHA`): `78d45712dbdc8cc6543d50f93fb9b95e2fd4d84e`.
- The new module blob `cc5a210c79098c6ffe24e6c596680afec55f1a74` is identical at the PR head and merge ref; the root aggregator imports the module at both refs. This is a successful merge-reference build containing the exact PR-head module, not an exact-head standalone build.

The two theorem-specific `#print axioms` outputs list `propext`, `Classical.choice`, and `Quot.sound`. The captured full job log contains no `sorryAx` or bare `admit` occurrence; this is not a global no-sorry certification. Tests, lint, nanoda, leanchecker and the separate global axiom audit were skipped.

A separate push-event run for the same commit, #42955791876, concluded failure but returned no job record. It is not substituted for the successful PR-event run; its cause is unknown.

## What the formalization establishes

Under the declared assumptions `c = 1` and Minkowski signature `(-+++)`, the module proves:

1. the algebraic Minkowski norm identity for the explicitly declared SAT4D tangent components; and
2. the pointwise equivalence between a negative norm and the strict sub-unit sum of squared spatial components.

It does **not** prove that the declared components are the derivative of the historical curve, determine whether `lambda` is coordinate time or proper time, prove the phase-independent global sufficient bound, construct a finite-core worldtube, or map the historical Lorentzian ansatz into current H(s)H positive-definite geometry. Compilation does not validate the source translation or physical premises.

PR #873 remains OPEN / DRAFT / UNMERGED. No formal review submission, physical calculation, fit, prediction, observational validation, or BEDROCK promotion is claimed.

The original scale-location artifact remains at issue #1578. Earlier issue #1577 was a rejected envelope without the required publisher title prefix; #1578 is the sole published artifact for the original submission.
