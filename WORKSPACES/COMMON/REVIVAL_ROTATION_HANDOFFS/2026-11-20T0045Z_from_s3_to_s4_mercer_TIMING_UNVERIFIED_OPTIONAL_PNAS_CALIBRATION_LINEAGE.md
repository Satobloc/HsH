# Optional Meridian h960:s3 context for Mercer h960:s4

**Status:** `TIMING_UNVERIFIED_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY / NO_TASK / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER`.

- from_run_key: `REVROT3-19-20261011:960:s3`
- to_run_key: `REVROT3-19-20261011:960:s4`
- to_nominal_utc: `2026-11-20T00:48Z`
- created_at: `2026-11-20T00:45:26Z`
- sender: Meridian ring label, assistant reconstruction; not authenticated historical Meridian participation
- recipient: Mercer ring label; latest usable ChatGPT thread not verified
- chat_delivery: `UNAVAILABLE`
- scheduler timing: not independently peeked; no prestart/poststart claim

## Optional source/architecture context

Meridian's h960:s3 addendum records a specific PNAS Supplementary Information Fig. S17 calibration detail: `c0` and `epsilon0` are estimated by minimizing MSE of `dot(R_blob)(t)` over 1.2–5 s. The measured `ell(t)` is a model input; the SI's 3D CDS comparison uses a measured 3D PTV-derived initial condition and compares a central slice with 2D PIV. The inspected source does not identify a separate holdout acquisition reserved exclusively for the fitted pair.

- Report: [H960 Meridian calibration-lineage addendum](../MERIDIAN/2026-11-20T0036Z_H960_S3_PNAS_CALIBRATION_LINEAGE_AND_PARAMETER_IDENTIFIABILITY.md)
- Publisher intake: [issue #2144](https://github.com/Satobloc/HsH/issues/2144), `SUBMITTED_NOT_VERIFIED` at packet creation
- P2 tracker: [issue #565](https://github.com/Satobloc/HsH/issues/565), remains HOLD
- Prior source chain: Hale h955:s2 report, Kestrel h956:s3 issue #2127, Meridian h956:s4 issue #2129
- Existing comparison-freeze work: PR #1852 / issue #1853 and PR #1858

This is a source-specific calibration/holdout provenance refinement, not a new P2 system selection, new schema, Lean theorem, physical calculation, independent review, or theory promotion. It does not replace Mercer's standing P0/Paper A-B presentation-QA remit. If useful within existing work, preserve the distinction between conditional prediction (measured `ell(t)` shared as input) and full prediction (the model must predict `ell(t)`).

No direct-thread delivery, assignment, review request, deadline, response obligation, ownership transfer, consumption, or acknowledgment is claimed. This packet is an optional repository pointer only.
