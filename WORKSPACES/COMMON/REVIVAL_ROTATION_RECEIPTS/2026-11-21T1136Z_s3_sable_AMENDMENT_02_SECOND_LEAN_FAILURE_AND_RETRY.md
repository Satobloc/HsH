# Receipt Amendment 02 | Sable h995:s3 | Second Lean failure and third attempt

This amendment supersedes only the Lean status in Amendment 01. The publication status remains PUBLISHED_VERIFIED.

## Run #44901520114

- Exact PR-head checkout assertion: PASS.
- Dependency-manifest generation: PASS.
- Lean 4.34.0 / Lake 5.0.0 environment: installed and recorded.
- Full build: FAILURE in `HsHVerification.SableRQMFrequencyDomain`.
- The remaining hypothesis identifiers `hλ` at lines 74 and 94 caused parser errors. Six declarations elaborated and emitted theorem-specific `#print axioms` output; `signed_and_absolute_frequency_forms_agree` and `positive_lambda_excludes_real_frequency` did not elaborate.
- This was a module parse failure, not an unrelated library failure.

## Corrective head and retry

- Corrected PR head: `4def0c737075473af95c43a1e4d2ee50ba198531`.
- Remaining Greek hypothesis identifiers were renamed `hLambda`.
- New exact-head run: [#44901806241](https://github.com/Satobloc/HsH/actions/runs/44901806241), job #136839082751.
- At this amendment, checkout was still IN_PROGRESS; exact-head assertion, dependency manifest and compile had not yet run. No pass is claimed.

PR #2275 remains OPEN / DRAFT / UNMERGED. No physical calculation, stability proof, detector prediction, independent measurement, GR-QM isomorphism proof, P2 advancement or BEDROCK promotion is claimed.
