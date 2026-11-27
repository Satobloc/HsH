# Enheduanna h1134:s3 | Gaussian core/readout variance alias gate

**Nominal slot:** 2026-11-27T06:36:00Z  
**Run key:** `REVROT3-19-20261011:1134:s3`  
**Deterministic selection:** Enheduanna (ring index 11); next label Tern Rook (index 12).  
**Execution identity:** assistant-level repository work under a deterministic routing label; no authenticated Enheduanna instance or current run-level conversation reference is established.

## Result

Added a conditional identifiability gate for separating intrinsic finite-core variance from instrument/readout blur when both are modeled as independent Gaussian convolution kernels.

Under that model, instrument j observes `q_j = v_core + v_blur,j`. For two instruments, the map is `F(v_core,v_blur1,v_blur2)=(v_core+v_blur1,v_core+v_blur2)`. For any positive shift δ smaller than both blur variances, moving δ into the shared core variance and subtracting it from both blur variances preserves both observations, keeps all alternative variances positive, and changes the core variance. The two-instrument map is therefore non-injective when both PSF variances are free.

**Operational consequence:** observed width cannot be assigned to intrinsic worldtube/core thickness without independent PSF calibration or a justified, separately calibrated non-Gaussian/non-convolutional observable. Keep intrinsic thickness, coil scale `ell_f`, and instrument blur distinct. This is a conditional measurement-model result, not a claim that the actual H(s)H core or any real instrument is Gaussian.

## Existing work reused

The existing Sable calculation `WORKSPACES/SABLE/sable_gaussian_blur_semigroup_gate_20261014.py`, blob `0e378bf1754c08537f8c6feeccd3d6f1c4a891fb`, records the Gaussian semigroup alias and a two-instrument Jacobian of rank 2/3 with null direction `[1,-1,-1]`. Its source labels the result GEN/DERIVED mathematics for the stated convolution model, not an actual-instrument or particle-ontology result. Its non-Gaussian matched-second-moment negative control is a synthetic example, not physical evidence.

This adds a specific resolution-kernel nuisance to the geometry/observation map contract #1341, nuisance-range/projected-identifiability PR #873 and support-freeze PR #2640. It does not replace those gates.

## Lean formalization

Draft PR [#2663](https://github.com/Satobloc/HsH/pull/2663), based on existing branch `infra/lean4-verification-20261023`, base `08b73a3f60003b5b245cb8f012faa13ff045154c`.

- Head: `4637b468a2d0deef7fc3762e4773e69f1d87ca6b`.
- Module: `FORMAL_VERIFICATION/HsHVerification/GaussianCoreReadoutAlias.lean`.
- Module blob: `50bb3682a60a8453d3991cdf5da4f5fccad63726`.
- Root aggregator blob: `5b45c6f552bc9a90f4ca4ab2aa632dcfe587267a`.
- Independent source readback: module and import match; no `sorry` or `admit` text in the module.

Actions run [#45953113816](https://github.com/Satobloc/HsH/actions/runs/45953113816) has passed exact PR-head checkout and Lake manifest generation. The Lean library compilation step is still in progress; theorem compilation, the two rational `#eval` results, and theorem-specific axiom output are **not yet verified**. Status: `SUBMITTED_NOT_VERIFIED`.

Local `lean`, `lake` and `elan` are absent; the existing GitHub Actions workflow is the actual-build route. No new compiler, dependency, workflow, tool, fork or paid service was added.

Lean checks only the encoded variance-map statement. It does not prove the Gaussian convolution premise, any instrument kernel, source fidelity, or physical truth.

## Empirical status and limits

No measured system or dataset was selected or acquired. No physical calculation, fit, prediction, uncertainty propagation, numerical falsification threshold, independent measurement or H(s)H forward map is claimed. The test matrix is a protocol template, not an instantiated experiment.

A future core-width claim requires explicit source-to-profile and profile-to-instrument maps; independently calibrated PSF data and covariance (or a separately justified kernel family); shared core and instrument-specific nuisance parameters; a frozen independent whole-acquisition holdout; the same measurement operator for the standard comparator; and a covariance-aware failure threshold derived from actual data.

P1 cognition remains overdue/frozen/Orson-owned. P2 remains HOLD for November 30. P3 remains incomplete for December 14. P0 presentation safety remains FAIL; deployment and release are not authorized. Tern retains PWH/scheduler coordination. No queue or graph write was made.

No SAT-O or Blockwave equation changed. No BEDROCK theory promotion or paper-gate advancement occurred.

## Scheduler and continuity

The existing :36 task remains enabled under ID `6a9f52b69ec08191b0a2ba24a074f781`, with its original hourly :36 Eastern schedule and Worldtube phase unchanged. No sixth task or scheduler mutation.

Current invocation `b578b231-6dfc-832e-b0f8-1ed757ae6c6e` is `IN_PROGRESS`, with `chat_ref=null`. Its cached result belongs to the preceding h1133:s3 Aldus run and is not attributed to this execution.

No direct Tern-thread delivery, consumption, acknowledgment or ownership transfer is claimed. Next deterministic ring label: Tern Rook. Keep PR #2663 draft and unmerged pending exact-head verification and independent review.