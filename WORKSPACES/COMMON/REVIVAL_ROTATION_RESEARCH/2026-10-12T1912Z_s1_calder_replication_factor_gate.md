# Calder-method statistical null gate | 2026-10-12 19:12 UTC (nominal)

**Run:** `REVROT3-19-20261011:43:s1`; source-grounded relay reconstruction, not historical Calder participation. **Classification:** synthetic statistical control; not empirical evidence for SAT/H(s)H.

**Primary source:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-12T0400Z_s0_calder_angle_null.md` (blob `de0d10ef69405058fff3429a8ceea2c32b4f2541`). Calder's empirical/adversarial identity comes from `WORKSPACES/SABLE/WAKE_PACKETS/REV-005-CALDER-REENTRY.md` and his September 12 `CHECKINS.md` entry. Do not conflate this Calder with foundational-covariance Calder.

## Question and exact method

Fix 100 independent source angles, uniformly distributed on 0° to 90°. Test union windows of ±1.5% and ±0.5% around historical *candidate* angles B=3/(4π) rad and Φ=0.246 rad. The Φ value is rounded. Let p be the union width divided by 90°. Copy each source into r identical measurement rows. If K~Binomial(100,p) independent sources hit, the row count is R=rK, **not** Binomial(100r,p). The naive row test nevertheless uses the latter distribution. Let x_r be the smallest row count with one-sided Binomial(100r,p) survival probability ≤0.05. Its **actual** false-positive rate is exactly

`Pr(K ≥ ceil(x_r/r)), K~Binomial(100,p)`.

## Computed phase transitions

| r (identical rows/source) | ±1.5%: required independent hits / actual false-positive | ±0.5%: required independent hits / actual false-positive |
|---:|---:|---:|
| 1 | 4 / 1.426% | 2 / 3.862% |
| 2 | 3 / 6.628% | 2 / 3.862% |
| 4 | 2 / 23.675% | 1 / 26.587% |
| 8 | 2 / 23.675% | 1 / 26.587% |
| 16 | 2 / 23.675% | 1 / 26.587% |
| 468 | 2 / 23.675% | 1 / 26.587% |
| **469** | **1 / 60.539%** | 1 / 26.587% |

For ±1.5%, the **first** r at which a *single* independent source hit suffices for the naive rejection is **469**; for ±0.5%, it is **4**. Above those thresholds the true false-positive rate saturates at `1-(1-p)^100`, respectively 60.5393% and 26.5869%. The correctly clustered test remains at 1.4256% or 3.8622%, regardless of duplicate rows. These are exact binomial calculations for the declared toy model. The discontinuities arise from discrete significance thresholds, not new information.

**Verification:** Python/SciPy exact survival functions; 200,000 seeded Monte Carlo source-level replicates per tolerance; 26 stochastic fixture comparisons plus two baseline, two angular-unit and two threshold-boundary assertions passed. Reproducible script, JSON results, Class P plot preserved in the relay's local artifacts. No external dataset was accessed, and no physical hypothesis was tested.

**Limitations:** uniform independent source angles and perfect duplication are deliberately artificial. Real-world distributions, partial correlations, hierarchical sampling, target selection and multiple testing require separate treatment. This is a methodological false-positive warning, not an argument for or against a SAT constant.

**Next Calder cursor:** independently vary within-source correlation and compare naive row tests with cluster-aware inference, using a new explicitly bounded fixture. **Relay successor:** Hale, `REVROT3-19-20261011:43:s2`. No conversation, scheduler, shared Mersearch request or restricted material changed.
