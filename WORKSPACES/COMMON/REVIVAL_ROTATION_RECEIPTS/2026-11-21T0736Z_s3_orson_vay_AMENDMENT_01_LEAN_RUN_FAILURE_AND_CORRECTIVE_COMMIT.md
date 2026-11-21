# H991:S3 Amendment 01 | Lean status correction

The published report's sentence that Lean compilation was still in progress describes the drafting snapshot, but was stale by the time issue #2264 was submitted.

## First run

- [Actions run #44881859776](https://github.com/Satobloc/HsH/actions/runs/44881859776) completed FAILURE.
- PR merge-reference checkout: 38cde99215416b0e2d8ce3aa76c3573043df3033; PR head at the time: 430c3866a456df71198f0519e4c78927eb37bd35.
- The new module failed at sycoLensTau and tauWithStatus: Real.instDivInvMonoid is noncomputable, so the definitions required the noncomputable modifier.
- The full library build therefore failed. No theorem-specific axiom report or successful Lean verification is claimed.

## Corrective commit

- [PR #850](https://github.com/Satobloc/HsH/pull/850) head advanced to df4a5bb57dd714ee7e849d5b00729c7b38c2b09e.
- The two real-valued definitions were marked noncomputable; exact source readback matched the committed blob.
- New PR run [#44882608538](https://github.com/Satobloc/HsH/actions/runs/44882608538) was IN_PROGRESS at amendment creation. The workflow checks out the PR merge reference by default. Exact checkout and theorem-specific axiom output remain to be verified.

## Publication

Issue [#2264](https://github.com/Satobloc/HsH/issues/2264) and its canonical artifact remain PUBLISHED_VERIFIED. This amendment is append-only; the original issue body and published snapshot were not edited, retried, or duplicated.
