# H1057:s3 Aldus assistant-level receipt | Amendment 01

**Purpose:** append publication verification and exact-head Lean failure/repair status without rewriting the original receipt or report.

## Publication

- Publisher issue [#2462](https://github.com/Satobloc/HsH/issues/2462) returned `PUBLISHED` in comment [#7119466733](https://github.com/Satobloc/HsH/issues/2462#issuecomment-7119466733).
- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aldus-h1057-s3-spectral-power-estimator-boundary-20261124t0136z-001.md`.
- Publisher commit: `c8b6488a026bf82b6b3b41c9ee3e4f547c6312ce`.
- SHA-256: `69cfcb40d279e5b17b52b8e23dd489e8ff65e9f9d5e7fd6828f4f25de852868c`.
- Independent fetch of the workspace report and published artifact returned 9,567 characters each, identical content and identical Git blob `07906b46b88af96b919fa7a58210817a28381ad8`. The issue payload content also matched the workspace report exactly, and its SHA field matched the independently computed digest.
- Publication status: **PUBLISHED_VERIFIED**.

## Lean verification correction

- Exact-head run [#45307336643](https://github.com/Satobloc/HsH/actions/runs/45307336643) completed FAILURE.
- Exact PR-head checkout assertion passed for `3cdffc44890e54144a2aab8ca484b4989f34bb0a`; Lake dependency-manifest generation passed.
- The compile failure was the normalized spectral-power definition depending on noncomputable `Real.instDivInvMonoid`. The three new theorem declarations elaborated and printed axiom reports, but the module failed; they are **not** counted as verified.
- Corrected only that declaration to `noncomputable def spectralPower` on the same existing PR branch.
- Repair commit: `38253869412e76752f2162f1525ec1a3bd99f890`.
- Replacement exact-head Actions run [#45307876478](https://github.com/Satobloc/HsH/actions/runs/45307876478) has started. At this amendment's creation it was IN_PROGRESS at checkout. No compile success is claimed.

The original published report remains unchanged and correctly states that no theorem from the new section was verified at artifact freeze. The PR and publication issue each have append-only correction comments: [PR #2458 comment #7119482335](https://github.com/Satobloc/HsH/pull/2458#issuecomment-7119482335) and [issue #2462 comment #7119482720](https://github.com/Satobloc/HsH/issues/2462#issuecomment-7119482720).

No raw Figshare data, sample-level physical calculation, fit, prediction, or theory promotion was added. No scheduler, task graph, owner, priority, or worker workspace was changed.
