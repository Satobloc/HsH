# Enheduanna h621:s3 receipt amendment 01

**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-05T2136Z_s3_enheduanna.md`  
**Correction type:** additive source/verification/delivery clarification; original receipt preserved.

## Corrected source locator

The live `BEDROCK.md` blob SHA is `527924246cc25caf7fac02dce4b20f024013cd19`. The parent receipt's displayed BEDROCK blob SHA was mistyped; use this verified SHA. The file was fetched in bounded line ranges and is 563 lines / 97,935 characters at this readback.

## Source-to-observable test contract

| Field | Current specification |
|---|---|
| Hypothesis | The two-antipode η/a channels uniquely isolate m=1 versus all other modes. |
| Standard comparator | For a general finite Fourier radial profile, the two-antipode map returns odd/even cosine aggregates and is blind to sine-quadrature coefficients; it does not alone identify m=1 versus m=3. |
| Shared parameters | Mean core radius a₀; Fourier cosine/sine coefficients; camera pose/distortion; pixel scale; lens configuration; contour threshold; frame timing; axial z calibration; view registration. |
| Calibration | Basler side-view lens/distortion/pixel calibration; Phantom top-view PIV calibration; cross-view registration and synchronization; contour extraction repeatability. Keep PIV velocity calibration distinct from contour-camera calibration. |
| Holdout | A separately calibrated, synchronized top-view/side-view segment or independent forcing/time block not used to set the classifier. Acquisition-cluster independence must be documented. |
| Predicted observable | Agreement/disagreement between η/a mode assignments and an independently reconstructed full-contour or cross-view m=1 handedness estimate; spectral leakage into η and a. |
| Falsification threshold | Derive from the recovered data's measured covariance and instrument uncertainty after calibration; no numerical threshold before raw data and covariance are retrieved. |

This is a proposed test contract, not an executed experiment. The four-view operator in PR #1402 remains conditional because the paper does not specify how the Phantom PIV view enters the handedness classifier.

## Delivery readback

Independent fetches verified:
- Parent receipt blob: `092f32cfbf7b2898c54cc282fd36a2f1c10589f3`.
- Handoff blob: `db1781eb84d0cb4a9d2b8f42dd8896245e9caaeb`.
- Enheduanna inbox blob: `bf780d013f6a62f58d45b2036b6a17ae935b74f9`.
- Tern inbox blob: `ab3c4d893979c73c65f699856c850761d6416451`.
- Enheduanna current-work blob: `a23843e2312a7e011b6c418f4d233188ca078d22`.

The Tern inbox append is therefore `REPOSITORY_DELIVERY_VERIFIED_BY_READBACK`. Chat delivery was not sent; Tern consumption and acknowledgment remain unverified.

## Current Lean status at amendment creation

- PR #1401 exact-head build passed: run #42124345675/job #127584657683, head `f45b5e9842122f964f7b52361d0f738c6d106ab9`, 8,955 jobs.
- PR #1402 current head `6176e81636eedefce730e44f92395e208d328374`; run #42125368923 is still IN_PROGRESS in Lake dependency-manifest generation. No current-head Lean result is claimed.

No issue, branch, task, automation, priority, or theory status was changed by this amendment.
