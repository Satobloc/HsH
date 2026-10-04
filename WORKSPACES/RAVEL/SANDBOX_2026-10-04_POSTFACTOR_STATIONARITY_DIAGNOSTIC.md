# Ravel sandbox — post-factor stationarity diagnostic

**Status:** sandbox / exact channel algebra plus conditional asymptotic power calculation.  
**Question:** Given calibration and later five-bin detector matrices, when does one stationary stochastic post-factor exist, and can the current calibration budget detect carrier-dependent failure at the drift level that already threatens classification?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT Mark V/SATv  TO STANDARD MAP.txt` — **full sequential read**. Source fact retained: the older construction repeatedly distinguishes persistent filament configurations from transient relational readout/transfer events. Historical lattice, particle identifications, mass claims, and boson assignments were not imported.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_126_DIRECT_READOUT_ENDPOINT_RECONSTRUCTION.md` — **full sequential read**. Source fact retained: direct observables may reconstruct different inverse branches with different scaling laws; model mismatch should be exposed by a regression fixture rather than repaired by relabeling geometry.
3. Google Drive — targeted searches for `detector stationarity calibration matrix readout drift H(s)H` and `calibration matrix`; **indexed only**, no relevant construction found.
4. Slack `#all-hsh-working-group-one` — targeted post-construction search for stationary shared detector drift; **no prior packet found**.

## Exact construction

Let `K_cal` and `K_test` be square row-stochastic confusion matrices. If `K_cal` is nonsingular, any post-calibration factor is unique:

`D* = K_cal^{-1} K_test`.

Then

`K_test = K_cal D`

for a physical stochastic post-channel if and only if

`D* >= 0` and `D* 1 = 1`.

The row-sum condition follows automatically from stochasticity and invertibility:

`K_cal D*1 = K_test 1 = 1 = K_cal 1`, hence `D*1=1`.

Therefore negative entries of `D*` are the sharp obstruction. If `K_cal` is singular or noisy, replace the inverse by the constrained projection

`r_fac = min_{D>=0,D1=1} ||K_cal D-K_test||_F / ||K_test||_F`.

For multiple carrier classes `g`, stationary readout drift requires one shared factor:

`r_shared = min_D [sum_g ||K_cal D-K_test^(g)||_F^2 / sum_g ||K_test^(g)||_F^2]^(1/2)`.

This nests the stationary model inside the general carrier-dependent channel family. Separate admissible `D_g` do not satisfy stationarity.

## Frozen numerical fixture

The nominal five-bin `K0` is well conditioned:

- `cond_2(K0)=1.03565204`;
- `det(K0)=0.92576587`.

Thus inversion instability is not the issue in this fixture.

Three synthetic alternatives were tested:

1. shared coherent drift: both carrier classes use `K0 D_+` — exact null residual;
2. opposed carrier drift: one uses `K0 D_+`, the other `K0 D_-`;
3. direct row-specific leakage — produces a negative entry in the unique inferred factor and a nonzero constrained residual.

At the previous packet's conservative classification-risk limit,

`d = 4.751487e-4` per event,

opposed carrier drift gives

`r_shared = 3.37394e-4`.

## Calibration-power consequence

For independently labelled calibration/test rows, the five row-wise two-sample homogeneity statistic has `df=5(5-1)=20`. Under equal labels per row `m`, its noncentrality is

`lambda = (m/2) sum_ij (p_ij-q_ij)^2 / pbar_ij`.

Using alpha=0.05 and 80% power:

| target | labels per true bin required |
|---|---:|
| opposed drift at `d=4.7515e-4` | **178,535** |
| current design | 2,500 |

At `m=2500`, power against the classification-threatening opposed drift is only **5.58%**, barely above test size. With `m=2500`, 80% power is reached only at

- opposed carrier drift: `d=0.0049765` = **0.4977%**;
- one-sided carrier drift: `d=0.0074597` = **0.7460%**.

The current calibration burden can estimate nominal `K` well enough to classify under an assumed stationary channel, but it cannot certify stationarity at the roughly 0.05% coherent-drift level required by that classifier.

## Candidate comparison and new sandbox inference

| architecture | algebraic status | empirical burden |
|---|---|---|
| one stationary post-channel | nested null model; one shared nonnegative `D` | low once drift is large |
| carrier-dependent post-channels | each `D_g` may be valid, but shared factor fails | ~178k labels/bin at the current risk limit |
| nonfactorable row change | unique inverse factor contains negative entries | detect via constrained factor residual |

Sandbox inference: a claimed geometry discriminator must either preregister stationarity as an external control or fund a much larger crossed calibration. Otherwise a candidate-dependent detector change can imitate the edge-mass signature while remaining statistically invisible to the existing `m=2500` calibration.

This is a readout-identifiability result, not evidence that the detector actually depends on carrier family.

## Failure and falsification

Reject the stationary post-drift model if any inferred factor has a statistically material negative entry or if a shared-factor goodness-of-fit test rejects after calibration uncertainty and multiplicity are included. The power calculation fails if labels are dependent, row totals differ materially, drift varies specimen by specimen, or asymptotic chi-square calibration is inaccurate in sparse cells.

## Tight prediction / solver test

Blindly inject opposite `+bin/-bin` test channels at `d=4.7515e-4`. With 2,500 labels per true bin, a 5% shared-channel homogeneity test should reject only about **5.58%** of trials. At approximately 178,535 labels per bin it should reject about **80%**. A materially different power curve falsifies this fixture or its multinomial assumptions.

## Exact next dependency

Design a crossed calibration in which the same labelled latent-bin inputs are measured under both candidate-presentation conditions; estimate the shared-factor likelihood ratio with finite-sample bootstrap, then optimize label allocation to certify `d <= 4.75e-4` without assuming asymptotic chi-square behavior.

Artifacts: `five_bin_postfactor_diagnostic.py`, `five_bin_postfactor_diagnostic.json`, `five_bin_postfactor_diagnostic.svg`, `five_bin_postfactor_diagnostic.png`.
