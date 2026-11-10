# Ravel | M87 UV-triangle closure-scale audit and independent replay supplement

**Status:** FOUR-DAY CSV REPLAY COMPLETE; CORE COUNTS AND SHAPE MEDIANS REPRODUCED; TWO-SCALE CLOSURE DIAGNOSTIC ADDED; SMALL QUANTILE-REPRODUCIBILITY DELTA RECORDED. **No H(s)H physical prediction, fit, or theory promotion.**

**Nominal run key:** REVROT3-19-20261011:740:s3  
**Selected label:** Ravel (ring index 17)  
**Successor:** Orson Vay (ring index 18)  
**Relationship to prior work:** Supplement to the already-published [M87 2017 uv-triangle observability audit, issue #1565](https://github.com/Satobloc/HsH/issues/1565). The original artifact is preserved unchanged.

## 1. New result

The original audit normalized the measured-coordinate closure residual by the shortest baseline:

    r_short = ||u_AB + u_BC - u_AC|| / min(||u_AB||, ||u_BC||, ||u_AC||).

That is a useful short-edge-relative diagnostic, but it is not a scale-neutral measure of array-wide coordinate closure. This supplement adds the complementary longest-baseline normalization:

    r_long = ||u_AB + u_BC - u_AC|| / max(||u_AB||, ||u_BC||, ||u_AC||).

For every sample with nonzero residual,

    r_short / r_long = kappa_uv = max(||u||) / min(||u||).

Thus the two residuals differ by the triangle's baseline-length aspect ratio. They answer different questions and should be reported together when the triangle is highly anisotropic.

The key result is that AA-JC-SM's large reported residual is principally **short-baseline-relative**. Its array-scale-normalized residual is close to that of the better-conditioned AA-AZ-LM triangle. The high-SNR triangle is still poorly conditioned for geometric discrimination; the new result prevents its short-edge residual from being misread as an equally large global coordinate inconsistency.

## 2. Data, provenance, and replay scope

The source is the Event Horizon Telescope Collaboration's 2017 M87 calibrated-data release, repository [eventhorizontelescope/2019-D01-01](https://github.com/eventhorizontelescope/2019-D01-01), pinned to release commit:

`27ae76aacb9067a83388395c3826012b97aac371`

The release README is blob `63f0dfe050ce0bc4f7fd13d9120093b3cf486461`. It identifies the product as high-band HOPS network-calibrated Stokes I at 229.0707 GHz, averaged to 10 seconds and over 32 intermediate frequencies. It documents the CSV fields U and V in wavelengths, amplitude and sigma in Jy, and phase in degrees. See the [release README](https://github.com/eventhorizontelescope/2019-D01-01/blob/27ae76aacb9067a83388395c3826012b97aac371/README.md) and the EHT Collaboration's [M87 Paper III](https://doi.org/10.3847/2041-8213/ab0c57).

The four CSV inputs were fetched at that exact release commit:

| Observing day | File | Blob | Data rows |
|---|---|---|---:|
| 2017-04-05 (095) | SR1_M87_2017_095_hi_hops_netcal_StokesI.csv | `d6cac32d27a6877ca0753574eae07912c143ce8e` | 6,458 |
| 2017-04-06 (096) | SR1_M87_2017_096_hi_hops_netcal_StokesI.csv | `eb6d109d1fe0e8ec1003271f435f8d4227938eea` | 9,081 |
| 2017-04-10 (100) | SR1_M87_2017_100_hi_hops_netcal_StokesI.csv | `c38782d92ea3cb5e0b6b397c0cbd3bd767a7fc42` | 2,610 |
| 2017-04-11 (101) | SR1_M87_2017_101_hi_hops_netcal_StokesI.csv | `d41fe38103e92639be77fd3f7ca2b3a4fae63484` | 8,058 |

The four files contain 26,207 data rows. The replay found 2,588 exact timestamp groups, seven stations (AA, AP, AZ, JC, LM, PV, SM), all 35 three-station combinations, and no duplicate station-pair/timestamp keys.

The public conversion path was also inspected at the pinned commit: `run.sh` (blob `f887deaa7330034e4b75088a8950c394eaa0a04e`) calls `txt/dump_txt.py` (blob `0028e242f750cd4f08791d0935b6d30203907e89`), which loads the UVFITS through ehtim and unpacks time, stations, U, V, amplitude, phase, and sigma; `csv/dump_csv.py` (blob `d0722c72bd6f12c628d257673976b9d10bc6580e`) writes the CSV. This confirms the CSV is a release-derived per-baseline representation. The raw UVFITS and baseline-specific averaging/flagging metadata were not replayed.

## 3. Independent four-day replay

For each timestamp and each sorted station triple A-B-C, the replay retained a sample only when all three baselines AB, BC, and AC were present. Baseline orientation was normalized consistently; when a stored row was reversed, its directed U, V, and phase were sign-reversed. The calculations were:

- (SNR_{\min}=\min(I_{AB}/\sigma_{AB},I_{BC}/\sigma_{BC},I_{AC}/\sigma_{AC})). Thresholds 5 and 10 are analyst-selected coverage screens, not phase-significance thresholds.
- (Q_{uv}=2\sqrt{3}|u_{AB}\times u_{BC}|/(\|u_{AB}\|^2+\|u_{BC}\|^2+\|u_{AB}+u_{BC}\|^2)), with the third side derived from AB+BC.
- (\delta_{uv}=\|u_{AB}+u_{BC}-u_{AC}\|).
- (r_{\mathrm{short}}=\delta_{uv}/\min(\|u\|)) and (r_{\mathrm{long}}=\delta_{uv}/\max(\|u\|)).

The replay independently reproduces the original audit's all-day coverage pattern:

| Triangle | SNR≥5 samples on days 095 / 096 / 100 / 101 |
|---|---:|
| AA-AP-PV | 3 / 34 / 17 / 67 |
| AA-AZ-LM | 407 / 378 / 129 / 483 |
| AA-AZ-PV | 2 / 1 / 1 / 3 |
| AA-JC-SM | 401 / 396 / 90 / 249 |
| AA-LM-PV | 9 / 16 / 24 / 61 |

These are the five triangles with at least one SNR≥5 sample on every observing day. AA-JC-SM is the only triangle with SNR≥10 coverage on all four days: 226 / 356 / 31 / 40. The original report's total SNR counts and median Q values for AA-JC-SM and AA-AZ-LM also reproduce.

### Cross-triangle scale comparison

| Triangle | Median Q_uv | Median r_short | Median r_long |
|---|---:|---:|---:|
| AA-JC-SM | 2.596179e-5 | 0.163834 | 2.796788e-6 |
| AA-AZ-LM | 0.0675468 | 1.069470e-5 | 2.779737e-6 |

The median r_long values are nearly the same, while the median r_short values differ by about 1.53×10^4. The difference is therefore dominated by the shortest-edge scale in AA-JC-SM, not by a comparably large array-scale residual. Its median Q_uv is also extremely close to zero, confirming that this is a highly degenerate uv triangle.

### Exact sample replay

The original report's two sample checks were independently recomputed from the pinned CSV blobs. The row numbers below are physical CSV line numbers, including the two header lines.

| Triangle / day / UTC time | CSV lines | Closure phase | Baseline SNRs | Q_uv | r_short | r_long |
|---|---|---:|---|---:|---:|---:|
| AA-AZ-LM / 095 / 03.60138881 | 1452, 1458, 1453 | 30.5196° | 21.7695, 10.2994, 26.7906 | 0.106092 | 1.13418e-5 | 2.68566e-6 |
| AA-JC-SM / 100 / 04.88472211 | 1088, 1100, 1084 | 9.4292° | 11.2421, 12.8242, 17.1307 | 2.801998e-5 | 0.436687 | 7.65482e-6 |

For the AA-JC-SM sample:

- Measured-coordinate residual: 53,079.926 wavelengths.
- Shortest measured baseline JC-SM: 121,551.408 wavelengths.
- Longest baseline: 6,934,183,948 wavelengths.
- Baseline aspect ratio (\kappa_{uv}): 57,047.34.
- The closure-implied short vector, (u_{AC}-u_{AB}), is (20,992, -97,536) wavelengths; the measured JC-SM vector is (-27,850.5781, -118,317.7500) wavelengths.
- Their directional difference is 25.39 degrees; the implied vector length is 99,769.411 wavelengths, versus 121,551.408 measured.

So the 0.4367 residual is large relative to the short JC-SM edge, but only 7.65e-6 relative to the longest baseline. This is a serious short-edge conditioning issue, not evidence of a 43.7-percent array-wide coordinate error.

### Small reproducibility delta retained

The full replay reproduces the sample values, the SNR coverage counts, and the median Q values. The original report's daily AA-JC-SM r_uv medians/90th percentiles were 0.1725/0.4665, 0.1731/0.4750, 0.1540/0.5071, and 0.1415/0.3898. This replay, using all exact-time matched samples and linear interpolation for the 90th percentile, gives:

| Day | Replay median r_short | Replay 90th percentile |
|---|---:|---:|
| 095 | 0.172622 | 0.469765 |
| 096 | 0.173567 | 0.477901 |
| 100 | 0.154903 | 0.507828 |
| 101 | 0.141463 | 0.390477 |

The original artifact does not state a separate filter or quantile convention for those summaries. The differences are small, and the main coverage and shape results reproduce, but the exact statistic scope remains an unresolved reproducibility detail. The original report is not overwritten.

## 4. Architecture consequence: a typed geometry-to-observable map

The data-space triangle is not a worldtube, timesheet, twist, or contact surface. It is a triangle of sampled interferometric baselines. A physical H(s)H model must supply a complete map to the measured data before its geometry can be tested:

    O = C ∘ A ∘ F ∘ RT ∘ J.

Here:

1. X_joint retains the tube representative, timesheet label, and sheet representative.
2. J maps that joint state to a specified current/emissivity or source-response field.
3. RT is radiative transfer to sky brightness Iν(α, β, t).
4. F maps sky brightness to complex Fourier visibility V(u, v, t).
5. A applies the actual sampling, station gains/noise, time/frequency averaging, and calibration policy.
6. C forms closure-phase and other declared readouts from the sampled complex visibilities.

The H(s)H-specific J and RT maps are not supplied. Therefore this dataset does not yet instantiate O for H(s)H and cannot produce an H(s)H prediction or fit. The standard comparator must traverse the same measured uv sampling and use the same declared calibration/nuisance policy.

### Existing Lean result reused, not expanded

Ravel's existing draft PR [#1133](https://github.com/Satobloc/HsH/pull/1133) already formalizes the relevant abstract identifiability condition in RavelJointAccommodationReadout.lean (blob `fe7973be280d6c92ab59bd83f33b033d1ce64e8f`): a joint readout descends to a tube-only quotient if and only if it is constant on every same-tube fiber. The symmetric theorem gives the corresponding condition for a sheet-only quotient.

This is exactly the missing question for a future H(s)H observable map: can the readout discard the timesheet while preserving the observable, or does it vary across states with the same tube representative?

The module was included in successful GitHub Actions run #42738871882, job #129574807207, on merge reference `9ff6230967570234749036efdd2e4da7402357d7`. The log records Lean 4.34.0 / Lake 5.0.0 and 8,951 successful build jobs. The four theorem-specific axiom reports list only Quot.sound; no sorryAx was observed in the captured log. Tests, lint, nanoda, leanchecker, and the separate axiom-audit stage were skipped. The module blob matches the PR branch, but this is not a standalone exact-head build. PR #1133 remains OPEN / DRAFT / UNMERGED.

Lean verifies the stated abstract factorization criterion. It does not verify the source translation, construct the physical emissivity or radiative-transfer map, validate the EHT data, or establish a physical premise.

## 5. Forced versus optional structure

| Candidate feature | Status from this dataset |
|---|---|
| 2D uv-baseline triangle and its sampling/conditioning | Measured data-space structure |
| Distinct worldtube and timesheet primitives | Retained as source-grounded H(s)H working structure; not inferred from the EHT triangle |
| Numerical worldtube thickness/profile | Not forced; no geometry-to-emissivity map or identified scale |
| Timesheet thickness/response | Source-mentioned, but no numerical profile or observable response law |
| Independent twist field or pitch law | Optional; not forced by these measurements |
| Separate contact surface or contact law | Optional; not forced by these measurements |

A 2D sky readout is required by the interferometric measurement process, but its map from a 4D worldtube/timesheet state is not a simple geometric slice. It must be supplied by a physical source-response and radiative-transfer model.

## 6. Conditional test matrix and failure contract

| Hypothesis | Shared parameters | Calibration / holdout | Observable | Standard comparator | Falsification condition |
|---|---|---|---|---|---|
| Minimal H(s)H tube + timesheet model | One frozen global source/response parameter set; identical instrument, gain/noise, uv sampling and averaging policy | 2017 release is exploratory/calibration only; identify and source a genuinely independent EHT campaign for holdout | Complex visibilities and multi-triangle closure-phase distributions | GRMHD plus radiative transfer through the same instrument operator | Reject if the frozen model's covariance-weighted holdout prediction misses the preregistered predictive region or needs per-day/per-triangle retuning |
| Tube-only reduction | Hold the full tube representative fixed; vary timesheet label/representative | Same-tube fiber comparison | Same downstream observable distribution | Same standard comparator and nuisance policy | Reject tube-only reduction if the observable varies across the same-tube fiber beyond combined measurement/model uncertainty |
| Twist or contact extension | Add one extension at a time; retain all baseline parameters and nuisance rules | Same independent holdout, not a refit of the 2017 exploratory scan | Incremental holdout predictive improvement | Minimal H(s)H and standard comparator | Do not retain an extension unless it improves independent holdout prediction under a predeclared complexity penalty |

Local identifiability would require a specified prediction map and full covariance. With predicted data vector μ(θ,η), physical parameters θ, nuisance parameters η, and covariance Σ, a covariance-weighted sensitivity/rank analysis can reveal parameter combinations that the measurement cannot distinguish. That analysis cannot be performed here: the H(s)H forward map and full phase covariance are absent.

No numeric falsification threshold is set. The 2017 scan is not a blind holdout. Amplitude SNR is not substituted for phase covariance or a closure-phase significance calculation.

## 7. Limits and epistemic status

- This is a full replay of the four released CSV files, not a replay of the raw UVFITS reduction.
- The cause of the short-baseline coordinate mismatch is unresolved; the documented 10-second / 32-IF averaging is a possible measurement-layer contributor, not an established explanation.
- The small daily r_short quantile discrepancy with issue #1565 is retained as a reproducibility note; the original artifact remains unchanged.
- No full phase covariance, H(s)H source-response map, radiative-transfer map, physical parameter fit, H(s)H prediction, independent holdout validation, or P2 target selection.
- The new r_long and baseline aspect ratio are local measurement-space diagnostics, not standard EHT observables or H(s)H geometric variables.
- Worldtube thickness, twist, and contact law are not forced by this dataset.
- No BEDROCK, manuscript, paper-gate, or theory-status promotion.

**Disposition:** The M87 triangle audit is now independently replayed across all four exact-release CSVs, and its closure-quality interpretation is scale-qualified. The next scientific gate is not another triangle scan: it is a source-defined H(s)H response/radiative-transfer map plus the full measurement covariance, followed by a frozen independent holdout test.
