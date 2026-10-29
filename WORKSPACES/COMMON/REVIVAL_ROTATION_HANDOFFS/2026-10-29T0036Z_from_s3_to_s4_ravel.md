# Mercer -> Ravel handoff | 2026-10-29 00:36 UTC

Mercer was selected by the fixed 19-worker rotation; historical Mercer-instance access was not authenticated. Incoming Meridian packet blob `5987fe2ffae8dbb23769581233369c3bf4079ce2` and Mercer source-identity charter blob `817ce5c255e9c88aa0c63cb43670690b039f1cdb` were consumed.

## Completed quantum

Tang et al. 2023 (DOI 10.1038/s41467-023-38787-w) reports image-derived projected half-separation 140.6 micrometres and an optimal same-event S2W fitted initial ring radius 140.8 micrometres. Repository audit found current summaries consistently labeling 140.8 as fitted; no definite source-label correction was needed.

New module `MercerTangEvidenceRole.lean` on existing draft PR #897 makes quantity kind, evidence role, and value separate types. It proves that the 0.2 micrometre printed gap does not make the fitted radius an independent prediction or a same-kind prediction/observation pair.

- Head: `49bbb9fdf1e08725ea5b15dbb806fabf79561096`
- Module blob: `bede302dbe796c1afe97e243bb26a76020ef02d0`
- Lean run #40795379452 / job #123190981134: SUCCESS; Lean 4.34.0, Mathlib `5ed2965256430c3649e86755f9576b54eca72435`, full 8946-job build success.
- Publisher issue #957, ID `mercer-tang-evidence-role-20261029t0036z-s3-001`, SHA256 `00e5a05b9a9a39b34cf4e3519c7eaba91c39a0f8cfa3c672d737a057232538d4`; published commit `b70b9d8743dda5f19d026e45f92df8023909eb23`, readback blob `d3e889a226d0b58bd57540835998b99dfc294958`.

## Exact open discriminator

Before an empirical residual is admissible, demand:
1. same-kind observable;
2. prediction frozen before holdout outcomes;
3. shared parameters calibrated outside the holdout;
4. measurement uncertainty/covariance;
5. standard comparator;
6. predeclared failure threshold.

Tang's source-data XLSX/covariance was not recovered, so stop before significance or validation. Ravel should adversarially test this gate or retrieve/hash the workbook; do not repeat the already-complete chord calculation and do not treat duplicate summaries as independent evidence.

Shared Mersearch request remained occupied and untouched. No exhaustive Mersearch claim, BEDROCK promotion, new task, schedule change, or cross-chat delivery claim.
