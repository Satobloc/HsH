# Aldus protocol-arm evidence gate — verification amendment 01

**Supersedes the build-pending status in the 21:36Z primary report and receipt.**

## Lean verification result

Actions run: #41354204612  
Job: #124990847103  
Workflow conclusion: SUCCESS  
Checkout/source commit: `64beceef919c06ee41d3d88c7bb085b72dc0f932`  
PR head merged into the checked-out base: `1baef266e1980b207aa9fef7cb4993a5d7e34926` into `18a901332b5d00c2a582aad9e4d4a7598aa1179e`.

**Classification: MERGE_REF_BUILD_SUCCESS.** This is not a separate exact-head standalone build.

- Lean 4.34.0.
- Lake 5.0.0.
- Full library build: SUCCESS, 8,951 jobs.
- New module `HsHVerification.AldusProtocolArmEvidenceGate`: built at 8927/8951.
- Root aggregator: built at 8950/8951.
- `sorryAx` occurrences in complete job log: 0.
- `admit` occurrences in complete job log: 0.
- Tests: SKIPPED.
- Lint: SKIPPED.
- nanoda: SKIPPED.
- Separate axiom-audit: SKIPPED.

The new module's actual `#eval` outputs were:

`T_proxy` (N):
- 0.105948
- 0.130800
- 0.19628175
- 0.24729375
- 0.294300
- 0.480508333...
- 0.545227083...

`x0)-only bounds (N):
- 0.10014375–0.11191575
- 0.12434175–0.13742175
- 0.188352–0.204375
- 0.238383–0.256368
- 0.28457175–0.30419175
- 0.468055083...–0.493125083...
- 0.531956333...–0.558661333...

The seven reported (f_1) values were also evaluated as:
`[1.18, 1.19, 1.20, 1.20, 1.23, 1.17, 1.20]` Hz.

The theorem-specific `#print axioms` commands executed. The evidence-ledger propositions depend on `propext`; the exact rational arithmetic propositions depend on `propext`, `Classical.choice`, and `Quot.sound`. These are the reported standard dependencies. The separate automated axiom audit was skipped, so no stronger axiom-audit claim is made.

## Interpretation boundary

The successful build verifies the encoded finite evidence ledger, cross-arm fusion predicate, and exact-rational calculations. It does not authenticate the source transcription, validate the physical model used to infer (T_{m proxy}), establish an H(s)H-to-rope map, or constitute independent physical validation.

The Kozyreff (T_{m proxy}) values remain model-derived estimates from the published (x_0) values. The printed (x_0) uncertainty alone is propagated; (ho), (Z_0), (g), covariance and model discrepancy uncertainties remain unavailable.

The WWRD climbing-rope comparison remains a first-blush geometric heuristic, not a physical equivalence.

## Durable links

- Existing WWRD PR #862: https://github.com/Satobloc/HsH/pull/862
- New module on the PR branch: https://github.com/Satobloc/HsH/blob/research/aldus-wwrd-rope-source-gate-20261028t0724z/FORMAL_VERIFICATION/HsHVerification/AldusProtocolArmEvidenceGate.lean
- Original report on the PR branch: https://github.com/Satobloc/HsH/blob/research/aldus-wwrd-rope-source-gate-20261028t0724z/WORKSPACES/ALDUS/2026-11-01T2136Z_PROTOCOL_ARM_EVIDENCE_GATE.md
- Actions run: https://github.com/Satobloc/HsH/actions/runs/41354204612

PR #862 remains open, draft and unmerged. No theory or paper-gate promotion follows from this build.
