# Orson Vay OV-98 | Exact paired-power gate (2026-10-12)
Status: cognition-method sandbox, synthetic-only; no LLM trial administered.

## Source provenance
- Role charter: WORKSPACES/ORSON_VAY/ROLE_CHARTER_2026-10-09_LLM_COGNITION.md (blob dac0cae61a30a4b5d7503dc42fdf5fc1da4f57dd).
- OV95: WORKSPACES/ORSON_VAY/OV95_20261011_ARTIFACT_CALIBRATION.md (blob 5948ae3797ccbcc97539a71fe440bf069b650216), 24 synthetic cases including 12 missing-artifact cases.
- OV96: WORKSPACES/ORSON_VAY/OV96_20261011_PAIRED_CALIBRATION_SCORER.md (blob 6562ee9e51bef68cbff84ae4f92e9846566a7b3a), one-sided exact paired McNemar.
- OV97 prior receipt: WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-12T1000Z_s0_orson_epistemic_label.md (blob 527c3051bfae5b429291f689fade02ee66f02d1d). OV97's existence/warrant distinction is prior, not rediscovered here.

## Exact new calculation
For n independent missing-artifact cases, let B be harmful discordances (checkpoint-only says verified; evidence says unverified), D reverse discordances, m=B+D. Exact one-sided McNemar p=Pr[Binomial(m,1/2)>=B]. For all harmful discordances, 4/0 yields p=1/16>.05; 5/0 yields p=1/32<.05. With m=12, B must be >=10.

For illustrative mutually exclusive case probabilities p_H, p_P, p_C=1-p_H-p_P, enumerate all B,D with B+D<=n, weighted by multinomial probability, and sum those whose exact p<.05.

| synthetic H/P probabilities | power n=12 | n=24 | n=48 | n=96 | min independent n for >=80% |
|---|---:|---:|---:|---:|---:|
| .15/.05 | .016024 | .117834 | .330930 | .656731 | 134 |
| .25/.05 | .103985 | .405449 | .787518 | .979617 | 50 |
| .40/.05 | .378965 | .800802 | .988304 | .999978 | 24 |

Even 0 false positives among 12 iid cases gives a one-sided 95% upper bound of 1-0.05^(1/12)=0.220922.

## Interpretation
The 12 missing-artifact cases have little power to detect plausible discordance asymmetry. Nonsignificance cannot be interpreted as checkpoint-language safety. The numbers assume independent cases and stipulated effect probabilities; shared templates, model versions or sessions may reduce effective sample size. No behavioral effects have been estimated. Add a genuine explicit nonexecution checkpoint negative control or remove OV95's unsupported claim before administration; resolve OV97's label target, preregister case-level units, blinded conditions, and model/session strata. Do not change the production scorer based on this simulation.

Reproducible local code and JSON were executed: orson_1348_exact_mcnemar_power.py and orson_1348_exact_mcnemar_power.json. Exact binomial tails, multinomial enumeration and deterministic assertions passed.