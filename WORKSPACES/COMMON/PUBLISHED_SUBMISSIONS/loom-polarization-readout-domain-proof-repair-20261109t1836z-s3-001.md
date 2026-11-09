# Polarization-mode readout: proof repair and normalization-domain gate

**Run:** `REVROT3-19-20261011:714:s3`  
**Selected label:** Loom, ring index 1. **Next:** Aster, ring index 2. Deterministic routing only; no authenticated current Loom ChatGPT thread is claimed.

**Disposition:** ASSISTANT-GENERATED FORMALIZATION REPAIR; PR MERGE-REFERENCE LEAN BUILD SUCCESS; OPEN/DRAFT/UNMERGED; NO PHYSICAL PREDICTION.

## What changed

Existing draft PR #1296, previously recorded in issue #1297 as not compiling, had two source-level blockers: complex division required a noncomputable definition, and `Complex.abs` was not an API in the pinned Lean/Mathlib toolchain.

The existing branch was repaired rather than replaced:

- `modeCoefficient` is now explicitly noncomputable.
- Complex magnitude statements use the Mathlib norm `‖·‖`.
- A `PositiveAnnularNormalization` structure records `0 < I_ann` as a required domain condition for the physically admissible normalized readout.
- `normalizedModeCoefficient` separates that admissible readout from the unrestricted algebraic coefficient.

The positivity field is an explicit assumption. It does not establish that any particular observation or dataset satisfies the condition.

## Formalized statements

The module proves:

1. A spatially uniform complex phase factor on every polarization sample factors out of the finite-pixel linear mode coefficient.
2. A unit-modulus phase factor preserves the norm of that coefficient.
3. With the pixel kernel and positive annular normalization fixed, a change in the normalized mode norm cannot be explained by a spatially uniform unit-modulus phase rotation alone.

This is a standard finite-sum measurement-operator result. It is not a distinctive SAT/H(s)H prediction.

## Actual Lean verification

- PR: #1296, `research/worldtube-polarization-mode-rotation-20261103t0336z`.
- Corrected PR head: `009489a8034ee21c5b48de8a9d36f4d7eb3a7cb4`.
- Corrected module blob: `9111a1404def67efeec3e29a50b2ff6a1d32aa88`.
- Root aggregator blob: `e8f63a1f32779749dd7ffa6dafa5d02508068346`.
- Actions run: [#42676448487](https://github.com/Satobloc/HsH/actions/runs/42676448487), job #129358978999, SUCCESS.
- The PR event compiled merge ref `fcb963cc9e12ba15bfe5f5dc9da77c928a9ac78d`. The module and root aggregator blobs were independently compared between PR head and merge ref and match exactly.
- Lean 4.34.0; Lake 5.0.0; Mathlib v4.34.0 at `5ed2965256430c3649e86755f9576b54eca72435`.
- Full root build: 8,945 jobs; target module built at 8,925/8,945.
- Four theorem-specific `#print axioms` outputs each report `[propext, Classical.choice, Quot.sound]`. No `sorryAx` appears in those outputs.

The first repair attempt, head `86e5415cf4893a4c301e87ebd18aa84732c77b90`, failed because a redundant rewrite of `hz` remained after the norm-invariance theorem had already discharged it. The corrected proof is in head `009489a8034ee21c5b48de8a9d36f4d7eb3a7cb4`.

Tests, lint, nanoda and the separate global axiom-audit step were skipped. This is not a global axiom audit. A separate Vercel deployment status is failed; that is not a Lean result.

## What remains unproved or unobserved

- The continuous-integral analogue is not formalized.
- The positive-normalization assumption has not been checked against a measured dataset.
- No raw UVFITS or other observational data were downloaded or reanalysed.
- No calibrated/holdout split, measurement covariance, shared-parameter fit, standard-model comparator or empirical falsification threshold was established.
- No map is supplied from H(s)H worldtube thickness, twist or contact geometry to magnetic field, synchrotron emissivity, Stokes Q/U, Faraday depth, EVPA or the measured mode coefficient.
- No physical H(s)H prediction, physical calculation, or empirical validation is claimed.

The formal build checks only the formalized finite-pixel statement. It does not establish the soundness of the source-to-model translation or the truth of physical premises.

## Project controls

The original source-linked report remains issue #1297. This is an additive follow-up, not a replacement or duplicate. PR #1296 remains OPEN / DRAFT / UNMERGED; no merge or BEDROCK promotion is requested.

P0 Code Grurple remains ACTIVE. P1 November 9 remains Orson-owned / NOT READY. P2 November 30 remains HOLD. P3 December 14 remains INCOMPLETE. FIE rereview is due November 10, not yet due.

All four shared Mersearch request lanes remain requested/occupied. No lane was overwritten or retriggered. No new tool, dependency, fork, paid service, physical calculation, SAT-O/Blockwave equation edit, manuscript change, theory promotion, or paper-gate advancement occurred. No automation ID, schedule, phase, cadence or task count was changed; no sixth task was created.

**Authorship and identity:** this is an assistant-generated repository/Lean repair, not Nathan Direct and not an authenticated historical Loom-thread contribution. Independent mathematical/source review remains outstanding.
