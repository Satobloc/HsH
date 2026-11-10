# M87 2017 uv-triangle observability audit

Status: EXPLORATORY MEASUREMENT-LAYER AUDIT. This is a standard interferometric data-quality analysis, not an H(s)H physical prediction, model fit, or target-selection decision.

## Data and provenance

- Dataset: Event Horizon Telescope Collaboration, 2017 M87 calibrated-data release, repository `eventhorizontelescope/2019-D01-01`.
- Release commit: `27ae76aacb9067a83388395c3826012b97aac371` (2019-04-10).
- README blob: `63f0dfe050ce0bc4f7fd13d9120093b3cf486461`.
- Observing days: 2017-04-05, 2017-04-06, 2017-04-10, 2017-04-11.
- Product: high-band HOPS network-calibrated Stokes I; frequency `229.0707 GHz`; 10-second time averaging and averaging over 32 IFs, as documented by the release.
- CSV columns used: `time(UTC)`, `T1`, `T2`, `U(lambda)`, `V(lambda)`, `Iamp(Jy)`, `Iphase(d)`, `Isigma(Jy)`.
- The four input file blobs were:
  - day 095: `d6cac32d27a6877ca0753574eae07912c143ce8e`, 6,458 data rows.
  - day 096: `eb6d109d1fe0e8ec1003271f435f8d4227938eea`, 9,081 data rows.
  - day 100: `c38782d92ea3cb5e0b6b397c0cbd3bd767a7fc42`, 2,610 data rows.
  - day 101: `d41fe38103e92639be77fd3f7ca2b3a4fae63484`, 8,058 data rows.

`Isigma(Jy)` was used as the release's reported amplitude-error field. The CSV does not supply a full phase covariance matrix. No phase significance or p-value is inferred from amplitude SNR.

## Method

Seven station codes occur in the selected files: AA, AP, AZ, JC, LM, PV, SM. Their 35 three-station combinations were enumerated. For each day and triangle, rows were joined on exact `time(UTC)` and retained only when all three baselines were present.

For directed stations A -> B -> C -> A:

- Closure phase: `wrap(phi_AB + phi_BC - phi_AC)`, reversing the sign of a baseline phase when its station order is reversed.
- Baseline SNR screen: `SNR_min = min(Iamp / Isigma)` across the three baselines. Thresholds 5 and 10 are analyst-selected coverage screens, not significance thresholds.
- Local uv-triangle shape diagnostic:
  `Q_uv = 2*sqrt(3)*abs(u_AB_x*u_BC_y - u_AB_y*u_BC_x) / (|u_AB|^2 + |u_BC|^2 + |u_AB + u_BC|^2)`.
  The third side in this expression is derived as `AB + BC`, so the shape diagnostic describes a closed geometric triangle.
- Separate measured-coordinate closure check:
  `r_uv = ||u_AB + u_BC - u_AC|| / min(||u_AB||, ||u_BC||, ||u_AC||)`.
  This checks whether the three published per-baseline uv coordinates actually close at the displayed timestamp.

`Q_uv` and `r_uv` are local measurement-space diagnostics in the namespace `LOCAL:RAVEL-M87-UV`. They are dimensionless and are not SAT/H(s)H worldtube variables, physical twist angles, or standard EHT observables.

## Results across all 35 triangles

Only one triangle had at least one `SNR_min >= 10` sample on each of the four observing days: AA-JC-SM. Five triangles had at least one `SNR_min >= 5` sample on each day.

| Triangle | Median Q_uv | Total SNR>=5 samples | Total SNR>=10 samples | SNR>=10 by day 095/096/100/101 |
|---|---:|---:|---:|---|
| AA-JC-SM | 0.00002596 | 1,136 | 653 | 226 / 356 / 31 / 40 |
| AA-AZ-LM | 0.06755 | 1,397 | 368 | 74 / 0 / 29 / 265 |
| AA-LM-PV | 0.88825 | 110 | 0 | 0 / 0 / 0 / 0 |
| AA-AZ-PV | 0.98525 | 7 | 0 | 0 / 0 / 0 / 0 |
| AA-AP-PV | 0.0003815 | 121 | 0 | 0 / 0 / 0 / 0 |

The table is an exploratory scan of all 35 triangles, not a preregistered selection or a blind holdout.

### Coordinate-closure result

AA-JC-SM is the only triangle with SNR>=10 coverage on all four days, but its measured uv coordinates do not close tightly relative to its very short JC-SM baseline:

- Median `r_uv` by day: 0.1725, 0.1731, 0.1540, 0.1415.
- 90th-percentile `r_uv` by day: 0.4665, 0.4750, 0.5071, 0.3898.
- Across all matched samples, median `r_uv` is about 0.164.

By contrast, AA-AZ-LM has median `r_uv` around 1.07e-5 across the release and daily 90th percentiles around 2.7e-5 to 3.0e-5. Its uv geometry is less degenerate, but it has no SNR>=10 samples on day 096.

### Two exact sample checks

1. AA-AZ-LM, day 095, `time(UTC)=03.60138881`, CSV data rows 1452, 1458, 1453:
   - Closure phase: 30.5196 degrees.
   - Baseline SNRs: 21.7695, 10.2994, 26.7906.
   - `Q_uv`: 0.106092.
   - `r_uv`: 1.13418e-5.

2. AA-JC-SM, day 100, `time(UTC)=04.88472211`, CSV data rows 1088, 1100, 1084:
   - Closure phase: 9.4292 degrees.
   - Baseline SNRs: 11.2421, 12.8242, 17.1307.
   - `Q_uv`: 2.801998e-5.
   - `r_uv`: 0.436687.

The AA-JC-SM sample's measured coordinate-closure residual is about 43.7 percent of its shortest baseline. The release documentation confirms 10-second time averaging and 32-IF frequency averaging, but the cause of this baseline-relative mismatch has not been established. The raw UVFITS and baseline-specific averaging/flagging metadata were not inspected.

## Architectural consequence

High SNR alone is not a sufficient triangle-selection rule. In this release, the best all-day SNR coverage belongs to an almost degenerate triangle with a substantial measured-coordinate closure mismatch. A more geometrically useful triangle has weaker and day-dependent SNR coverage. A future test should therefore use a joint multi-triangle likelihood with the full measurement covariance and explicit coordinate/averaging quality checks, rather than selecting one high-SNR triangle.

The measurement chain that a physical model must traverse is:

`4D source geometry -> response/emissivity -> radiative transfer -> 2D sky brightness -> Fourier visibility V(u,v,t) -> station gains/noise -> time/frequency averaging -> closure phase and other readouts`.

The standard comparator must use the same measured uv coverage, calibration, nuisance parameters, and averaging operator. An H(s)H alternative must provide an explicit geometry-to-response/emissivity map before it can predict the same complex visibilities or closure phases. That map is not established by this data audit.

The finite-core/worldtube and timesheet representations do not by themselves determine an emission model. A numerical thickness profile is not identified here. Twist and a separate contact law are optional extensions, not consequences of these measurements. Any projection or coarse-graining must specify its domain, codomain, composition order, and conditions under which the reduced readout preserves the observable.

## Prospective failure contract

After a source-defined H(s)H forward map and full covariance are available:

1. Freeze global physical parameters on a calibration campaign; do not refit them separately for each day or triangle.
2. Hold instrument gains and calibration nuisance parameters to the same declared policy for the standard and H(s)H models.
3. Predict complex visibilities and closure-phase distributions for a genuinely independent campaign after the model is frozen.
4. Reject the H(s)H model if its preregistered covariance-weighted holdout residual exceeds the chosen predictive threshold, or if it requires per-day/per-triangle free parameters to remain viable.
5. Treat twist/contact additions as separately counted extensions; they do not rescue the minimal model without a predeclared complexity penalty and independent holdout improvement.

No numeric falsification threshold is set here because the full phase covariance and H(s)H forward map are absent. The 2017 triangle scan is exploratory and must not be reused as a blind holdout.

## Limits and epistemic status

- Standard EHT measurement-layer data only; no GRMHD model was fit.
- No H(s)H prediction, physical parameter fit, independent validation, or P2 target selection.
- No phase covariance, raw UVFITS replay, or cause for the AA-JC-SM uv-coordinate mismatch.
- No claim that `Q_uv` is a physical geometry variable or that the observed triangle statistics support H(s)H.
- This audit improves the measurement/verification architecture; it does not promote BEDROCK theory.
