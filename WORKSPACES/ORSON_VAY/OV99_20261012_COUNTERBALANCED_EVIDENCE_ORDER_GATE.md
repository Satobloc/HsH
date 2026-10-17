# Orson Vay OV-99 | Counterbalanced evidence-presentation identifiability gate
Date: 2026-10-12 21:24 UTC (nominal relay)
Status: SYNTHETIC METHODS ONLY. No LLM behavioral trial administered. Source-grounded relay reconstruction, not authenticated original Orson participation.

## Provenance
- Orson role charter: WORKSPACES/ORSON_VAY/ROLE_CHARTER_2026-10-09_LLM_COGNITION.md (blob dac0cae61a30a4b5d7503dc42fdf5fc1da4f57dd).
- OV95: WORKSPACES/ORSON_VAY/OV95_20261011_ARTIFACT_CALIBRATION.md (blob 5948ae3797ccbcc97539a71fe440bf069b650216).
- OV96: WORKSPACES/ORSON_VAY/OV96_20261011_PAIRED_CALIBRATION_SCORER.md (blob 6562ee9e51bef68cbff84ae4f92e9846566a7b3a).
- OV98: WORKSPACES/ORSON_VAY/OV98_20261012_EXACT_PAIRED_POWER_GATE.md (blob 66dd697cc4f124025507fc14b80f68fa6c0a2e9e).
- This work extends power analysis to an administration-order identifiability control, not a duplicate power calculation.

## Question
If checkpoint-only (A) and checkpoint-plus-evidence (B) are always administered in the same chronological batch order, can a period/session drift effect masquerade as the evidence effect? OV96 specifies separate sessions, so this is a proposed allocation safeguard, NOT an observed flaw in the existing scorer.

## Exact synthetic calculation
Let n=24 matched cases, s_i=+1 for A then B, -1 for B then A, and d_i=response(second)-response(first).
Assume the *linear expected-response fixture* d_i=beta*s_i+gamma, with true evidence effect beta=+0.12 and second-period drift gamma=-0.20. These are stipulated synthetic numbers, not model estimates.

With n_AB cases of AB order and n_BA of BA order, the two-column design X=[s_i,1] has Gram determinant
  det(X'X)=n^2-(n_AB-n_BA)^2=4*n_AB*n_BA.
All-AB or all-BA designs are rank deficient: beta and gamma cannot be separately identified.
For 12 AB and 12 BA, determinant=576 and the exact fitted effects recover beta=.12, gamma=-.20.

The naive evidence-minus-checkpoint difference is
  beta_naive=beta+gamma*(n_AB-n_BA)/n.
For all AB it is -.08, reversing the sign of the stipulated true effect. For balanced AB/BA it is +.12.

Under homoskedastic independent pair-difference errors, the variance of the adjusted beta estimate is sigma^2*n/(4*n_AB*n_BA). Relative to a balanced allocation, inflation is n^2/(4*n_AB*n_BA).

| AB/BA | Naive evidence effect | Identifiable? | Variance inflation |
|---|---:|---|---:|
| 24/0 | -0.080000 | no | undefined |
| 23/1 | -0.063333 | yes | 6.260870 |
| 18/6 | +0.020000 | yes | 1.333333 |
| 12/12 | +0.120000 | yes | 1.000000 |
| 6/18 | +0.220000 | yes | 1.333333 |
| 1/23 | +0.303333 | yes | 6.260870 |
| 0/24 | +0.320000 | no | undefined |

Verified with standard-library Fraction arithmetic and deterministic assertions; exact coefficient recovery checked for all nondegenerate allocations. Local script: orson_ov99_order_identifiability.py; JSON: orson_ov99_results.json.

## Protocol implication
Before any OV95/96/98 trial, preregister balanced allocation of case presentation across sessions/batches, preserve order, case ID, model version, session ID, evidence condition, timestamps, and blinded scoring. Keep conditions in separate fresh sessions to avoid memory/carryover; counterbalancing does not itself cure same-session leakage. Add the still-missing explicit nonexecution checkpoint control or remove the unsupported claim. Do not treat case-paired repeated calls as independent sessions automatically. No production scorer modification is justified by this synthetic calculation alone.

## Boundaries
No LLM administered, no measured behavior, no SAT physical claim, no new extractor or scheduler change. This is a standard linear design-identifiability check, not evidence of an observed order effect.
