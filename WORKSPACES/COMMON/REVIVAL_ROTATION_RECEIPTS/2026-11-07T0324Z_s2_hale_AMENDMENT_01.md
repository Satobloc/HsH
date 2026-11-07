# Receipt amendment 01 | Hale h651:s2 | 2026-11-07T03:24Z

This amendment records delivery/readback state after the immutable base receipt and handoff were created. The base receipt was not overwritten.

## Immutable artifacts

- Base receipt: WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-07T0324Z_s2_hale.md
  - Blob SHA-1: 5be0dc380f4837d84740623c33292436ba652a41
- Handoff: WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-07T0324Z_from_s2_to_s3_elias_kern.md
  - Blob SHA-1: 4f152ea420c7a46cefd0358b090cb76122261580

## Repository inbox delivery

- Hale INBOX pointer was appended by commit 2e3a1f593b41ee7c8df593aa99772484988cd183.
  - Readback blob SHA-1: b271db7f5b3a3d733c0550f30c02961906a294ee
  - Unique marker HALE-RUN-20261107T0324Z-H651S2-001 present.
  - Result: GITHUB_INBOX_DELIVERY_VERIFIED.
- Elias Kern INBOX pointer was appended by commit e49474b6513ee285dc7315f327a0b208e65c02cb.
  - Readback blob SHA-1: 89b56f9fca90f05ea54c2da90c1c15d72fab695e
  - Unique marker ELIAS-OPTIONAL-CONTEXT-20261107T0324Z-H651S3-001 present.
  - Result: GITHUB_INBOX_DELIVERY_VERIFIED, LATE_OPTIONAL_CONTEXT.

## Thread and consumption boundary

- Current Hale :24 run chat_ref: null.
- Current Elias :36 run chat_ref: null at last peek; it had already started at 03:33:34.894Z before the handoff packet was created.
- No authenticated Hale or Elias historical thread was identified.
- ChatGPT-thread delivery: UNAVAILABLE.
- Elias consumption of the late repository pointer: UNKNOWN. No read/acknowledgment is inferred from the inbox write.

The current main branch head after these writes is e49474b6513ee285dc7315f327a0b208e65c02cb. No task, schedule, phase, worker ownership, paper gate, theory status, or automation setting was changed.


## Additional calculation and publication verification | 2026-11-07T0410Z

The earlier base receipt's `NO_NEW_PHYSICAL_COMPARISON` describes the first checkpoint. This delayed retry added a source-based table reconstruction and covariance diagnostic from the 2026 NIST torsion-balance paper. These are derived calculations from published measured inputs, not a new measurement, H(s)H prediction, or P2 selection.

- Eight preliminary (G) values reconstructed from Table 15 torque differences, Table 2 apparent masses, and per-configuration (R_s)/(Gamma_{max}); only torque Type-A uncertainty propagated in the preliminary table.
- GLS common-mean/no-dark-effect null using Table 16 values and Table 18 covariance: (hat\mu=6.673611\times10^{-11}), (u=0.000142\times10^{-11}), (chi^2=25.04) for 3 df, (p=1.52\times10^{-5}). This is a fit diagnostic, not a prediction; the restrictive common-mean model is inadequate under the published covariance.
- CODATA 2022 is the latest published set; 16 inputs, three pair correlations, 3.9 uncertainty expansion. NIST 2026's final consensus is conditioned on a CODATA-centered prior; the new 2024 torque observations are post-2022, but the final posterior is not an independent CODATA holdout.
- The H(s)H worldtube/timesheet/responsive-medium → measured geometry → (Gamma) → torque → readout/covariance map remains unestablished. No H(s)H prediction, fit, P2 selection, or theory promotion.

### Publisher result

Issue #1438, `[HSH-PUBLISH-V1] NIST Table 15 reconstruction and CODATA prior-dependence audit`, is now **PUBLISHED_VERIFIED**.

- Submission ID: `hale-nist-table15-reconstruction-codata-prior-20261107t0324z-s2-001`.
- Content size: 13,610 UTF-8 bytes.
- SHA-256: `a1eeff1c015cf81eb7550adde23f6392c70c736aee7f71481ae6d3fdd3f85f49`.
- Publisher comment: #6702067506.
- Publisher commit: `702a8fcc2eaec92e285884295d145dee9832a46a`.
- Exact artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/hale-nist-table15-reconstruction-codata-prior-20261107t0324z-s2-001.md`.
- Readback blob SHA-1: `e6214b8a76c24fa59c6706b87f33c6a5c9a6065d`.
- The publisher-reported SHA-256 matches the submitted content; exact artifact readback succeeded.

This is a distinct additive calculation artifact, not a duplicate of issues #1432 or #1435. No direct write to `PUBLISHED_SUBMISSIONS` was made.
