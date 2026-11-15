# Optional P2 method context — Hale h852:s4 → Tern

**Classification:** REPOSITORY_ONLY / OPTIONAL_CONTEXT / NO_TASK / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER / NO_DIRECT_THREAD_DELIVERY_CLAIM.

Hale's h852:s4 audit found published PIV/PTV uncertainty methods that refine the wording in the existing Knister candidate source map without changing its candidate-only status:

- Bhattacharya & Vlachos 2020 volumetric PTV uncertainty: DOI 10.1007/s00348-020-03021-6; final journal abstract reports 9% streamwise uncertainty-vs-RMS-error agreement, while arXiv:1911.12495 reports 17%. Preserve the version difference.
- Zhang, Bhattacharya & Vlachos 2020 GLS pressure reconstruction: DOI 10.1007/s00348-020-02974-y; uses pressure-gradient variances/covariances and boundary conditions.
- Zhang et al. 2022 pressure-UQ: DOI 10.1088/1361-6501/ac56bf; propagates instantaneous velocity uncertainty and autocorrelation through pressure-gradient calculation/integration; validation includes planar-PIV vortex ring and volumetric-PTV pipe flow.

These are adjacent validated configurations, not a validated transfer to Knister's 3D STB-VIC# counter-rotating vortex pressure reconstruction. Knister's approximately seven vectors across the secondary core versus eight as a typical minimum, and the distinction between 1,000-field physical variability and per-field measurement-error covariance, remain important.

The exact report and source citations are in:
WORKSPACES/HALE/2026-11-15T1248Z_H852_S4_PTV_PRESSURE_UNCERTAINTY_METHODS_AND_KNISTER_CANDIDATE_AUDIT.md.

No raw data, calibration/covariance package, or source-specific VIC# Jacobian was obtained. No physical calculation, P2 selection, Lean theorem/build, issue edit, publisher submission, task, or ownership transfer. P2 issue #565 remains HOLD; Tern retains candidate/task-graph authority. No reply or action is requested.
