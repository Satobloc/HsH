# Ravel sandbox checkpoint — five-bin confusion calibration

**Status:** SAT/CANDIDATE detector protocol; conditional numerical result, not canonical H(s)H.

## Exact question

How many labelled calibration events per true bin are needed for a measured full (5\times5) confusion matrix to preserve the covariance-matched (B^3\) versus (S^2\) five-bin discriminator at the already-stressed scale bound (|\widehat R/R-1|\le 0.016)?

## Sources actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/EARLY LOGGED/SAT_O8_AUDIT_Results.txt` — **full sequential read**. Used only for its methodological demand that hidden parameters, calibration definitions, and sensitivity scans be explicit. Historical particle/mass/topology claims were not used.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/PRECLOSE_NOTE_ROUNDUP.txt` — **substantial targeted read** of the solver-ecology and finite-core/carrier discriminator sections. Used for the typed separation between geometry generation and downstream readout classification, and for the warning that local finite-core solvers are not universal interaction laws.
- Slack `#all-hsh-working-group-one` — **targeted search** for `confusion matrix calibration` and `five-bin`; recovered the immediately preceding five-bin and scale-robustness checkpoints, with no earlier measured-matrix calibration packet.
- Google Drive — **metadata-only targeted searches** for `five bin confusion matrix calibration` and `signed coordinate detector calibration`; returned no relevant H(s)H calibration artifact. Irrelevant results were not opened.

## Source facts, inference, conjecture

**Source fact:** O8 treats calibration and parameter sensitivity as explicit dependencies, not repair factors. The H(s)H roundup types the finite-core discriminator as a downstream classifier with declared inputs and failure boundaries.

**Inference:** the detector confusion matrix (K) must be a separately calibrated stochastic operator acting after the candidate-specific geometric bin probabilities. It cannot be silently folded into (B^3\) or (S^2\) morphology.

**Sandbox construction:** calibrate each true-bin row with (m) labelled events,

\[
n_i\sim\operatorname{Multinomial}(m,K_i),\qquad
\widehat K_{ij}=\frac{n_{ij}+1/2}{m+5/2},
\]

then use the same sampled (\widehat K) in both candidate likelihoods. For candidate (H\in\{B^3,S^2\}), offset (u), and scale ratio (\rho=\widehat R/R\),

\[
p_{H,j}(u,\rho;\widehat K)
=\sum_i\left[F_H(\rho e_{i+1}-u)-F_H(\rho e_i-u)\right]\widehat K_{ij}.
\]

The profiled score is

\[
\Lambda(n;\widehat K)=
\max_{u,\rho}\sum_j n_j\log p_{B^3,j}
-\max_{u,\rho}\sum_j n_j\log p_{S^2,j}.
\]

This is the smallest operator-level repair: geometry stays fixed; only a labelled transfer experiment estimates the readout map.

## Conditional numerical result

Frozen conditions: (N=192), (|u|\le0.08), (|\rho-1|\le0.016), 41×17 nuisance grid, nominal adjacent-bin assignment probability (E=1-0.025^{1/192}=0.0190295\). The nominal (K) has endpoint diagonals 0.990485, interior diagonals 0.980970, and adjacent entries 0.00951476.

Threshold calibration used 180 independent confusion-matrix draws × 120 test repeats per candidate. Validation used 400 independent confusion-matrix draws × 250 test repeats per candidate at the two previously worst audited cells: (B^3:(u,\rho)=(0,1.016)), (S^2:(0.08,0.984)). Confidence bounds treat each calibrated matrix as an independent cluster.

| labels per true bin (m) | total labels | worst validation error | clustered 95% upper | result |
|---:|---:|---:|---:|:---|
| 250 | 1,250 | 6.846% | 7.212% | fail |
| 500 | 2,500 | 5.676% | 5.909% | fail |
| 1,000 | 5,000 | 5.188% | 5.382% | fail |
| 2,500 | 12,500 | 4.715% | 4.844% | pass |
| 5,000 | 25,000 | 4.632% | 4.775% | pass |
| 10,000 | 50,000 | 4.641% | 4.771% | pass |

The first tested passing design is therefore

\[
\boxed{m=2500\ \text{labelled events per true bin}\quad(12{,}500\ \text{total}).}
\]

This is a grid bracket, not a proof that 2,500 is minimal.

## Mechanism and discriminator

The low-count failure is not loss of geometric support information. It is uncertainty in the post-geometric channel (K), amplified because the 1.6% scale case already sits close to the 5% risk ceiling. The plateau above (m\approx2500\) indicates the remaining error is dominated by specimen noise plus offset/scale nuisance rather than matrix estimation.

**Candidate contrast:** a boundary-only (S^2\) carrier and a bulk (B^3\) core remain distinguishable because their latent five-bin fingerprints differ. A layered architecture contains this result naturally: bulk/boundary geometry produces latent probabilities, and a distinct readout layer applies (K). Treating (K) as geometry would erase this typing.

## Failure conditions

The packet fails if any of the following occurs:

1. the measured (K) is state-, offset-, scale-, or candidate-dependent rather than a stable row-stochastic operator;
2. calibration labels do not populate the same true-bin states seen in testing;
3. non-adjacent leakage or drift moves the empirical matrix outside the fitted model;
4. a continuum nuisance scan finds a worse cell than the two selected cells;
5. the empirical (m=2500\) clustered upper bound reaches or exceeds 5%.

## Prediction candidate / preregistration

Under the stated nominal (K), (N=192), and nuisance bounds, an independently generated calibration with 2,500 labelled events in each true bin, followed by a frozen threshold and independent validation, should produce worst selected-cell error below 5%; 1,000 per bin should not. This is a conditional metrology prediction with dimensionless error rate as the observable.

## Exact next dependency

Replace the nominal (K) with one measured from labelled calibration data, freeze the row estimator and threshold on a training split, then perform a continuum adversarial scan over ((u,\rho)) with calibration-matrix uncertainty clustered at the run level.

