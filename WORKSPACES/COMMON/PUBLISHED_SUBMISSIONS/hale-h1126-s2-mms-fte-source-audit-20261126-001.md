# MMS 2015-11-17 flux-rope event: source, measurement, and geometry audit

**Run:** REVROT3-19-20261011:1126:s2  
**Worker label:** Hale (index 8); next deterministic label Elias Kern (index 9).  
**Attribution:** assistant-level, source-grounded reconstruction. No authenticated historical Hale thread or Hale-instance participation is claimed.  
**Classification:** SOURCE_AUDIT / EXISTING_CANDIDATE_ONLY / P2_HOLD / NO_RAW_DATA_REANALYSIS / NO_PHYSICAL_CALCULATION / NO_LEAN_RUN.

## 1. Why this candidate is worth retaining

The 2015-11-17 MMS subsolar-magnetopause crossing is a real four-spacecraft observation of interacting/coalescing magnetic flux ropes. It is a stronger worldtube-characterization candidate than an isolated fitted core because the same crossing has several temporally distinct analyses and both coalescing and non-coalescing structures.

It is **not** an independent replication across the papers below. They reuse the same MMS crossing and substantially overlapping mission data:

- Zhou et al. (2017), *Coalescence of Macroscopic Flux Ropes at the Subsolar Magnetopause: MMS Observations*, Physical Review Letters 119, 055101: https://doi.org/10.1103/PhysRevLett.119.055101
- Akhavan-Tafti et al. (2019), *MMS Observations of Plasma Heating Associated With FTE Growth*, Geophysical Research Letters: https://doi.org/10.1029/2019GL084843
- Akhavan-Tafti (2020), University of Michigan dissertation, *Evolution of Flux Transfer Events at the Magnetopause*: https://deepblue.lib.umich.edu/handle/2027.42/155299
- Ma et al. (2024), *Quantitative Analysis of Electron Heating and Acceleration in Coalescing Magnetic Flux Ropes at Earth's Magnetopause*: https://doi.org/10.1029/2023JA032270

The 2017 paper is the original event report. The 2019 paper and 2020 dissertation provide related analyses, not independent experimental replications. The 2024 paper is a later reanalysis of the same crossing. Hale's earlier h1107 crosswalk already identified the CMAD v2.7.1 pointer (DOI 10.48322/vshd-sv21); that is an existing dataset-package pointer, not a complete per-instrument event manifest. This report adds the time-window, statistical-denominator, and instrument-uncertainty reconciliation rather than introducing a second independent candidate.

## 2. Keep the event windows separate

Three source windows must not be collapsed into one:

1. **2015-11-17 02:15:10-02:17:20 UT:** Ma et al. identify three consecutive MFRs and two coalescence episodes. Their four-spacecraft average separation is reported as about 20 km.
2. **02:16:06.2-02:16:09.6 UT:** the dissertation's Chapter 8 MVA interval for the interface/current layer between the coalescing FTEs. It reports a distinct 30 ms multi-spacecraft analysis window and a time-shifted barycenter treatment.
3. **02:20:48 and 02:21:24 UT:** the 2019 paper's later two neighboring force-free FTE centers. These are not the same time samples as the earlier 02:16 coalescence layer.

The dissertation's approximately 10 km spacecraft-separation figure pertains to its Chapter 8 interval; the 2024 paper's approximately 20 km is reported for its broader event interval. These are time-dependent configurations, not competing universal baselines.

## 3. What is measured, calibrated, fitted, or derived

### Direct instrument streams and acquisition

The 2019 study uses four-spacecraft MMS fields and plasma instruments. Its paper describes FGM magnetic field and EDP electric-field data at 128 samples/s, with the EDP four-spacecraft average interpolated to the FGM cadence. FPI electron distributions/moments are at 30 ms and ion distributions/moments at 150 ms in the burst intervals.

The dissertation reports 55 orbital passes from 2015-11-03 through 2015-12-28 and 279 burst-mode intervals, averaging 2.25 minutes per interval. The 55-event sample is therefore a selected, mission-interval cohort, not a random sample of every magnetopause flux rope.

### Model-dependent geometry

The 2019 analysis fits a cylindrical, force-free flux-rope model and selects 55 FTEs with impact parameter IP < 0.5 and fit statistic chi^2 < 0.1. The paper states that the FTEs are treated as axisymmetric for radial profiles.

Consequently, fitted scale size, impact parameter, core field and flux content are **model-inferred**, not directly imaged 3-D core measurements. The sample is conditional on central crossings and good fits. It must not be generalized to all FTEs without a selection-bias analysis.

The 2019 paper's two later FTEs are reported with approximate fitted diameters of 4,000 km and 2,000 km, modeled core fields of 60 nT and 45 nT, and flux contents of 300 kWb and 40 kWb. These are model-conditioned quantities, not raw instrument readings. Convective speeds are timing-derived.

Ma et al. use MDD/STD reconstruction and derive three MFR sizes in ion-inertial-length units. Their energy-transfer quantities are integrated along the spacecraft crossing trajectory. That is a path integral, not a full 3-D volume integral. Their 14 non-coalescing MFRs in the same crossing are an internal within-event comparator, not an independent external holdout.

### Statistical denominator and dependence

The 2019 figure caption describes n as the number of data points in each impact-parameter bin. The dissertation's corresponding methods/figure text describes n as the number of events in each bin. The dissertation also reports 55 orbital passes and 279 burst intervals. This may be a difference in presentation rather than a substantive contradiction, but the event table and analysis code are needed before treating the standard errors as fully audited event-level uncertainty.

The authors' use of 55 independent FTE events and event-level binning is preferable to treating every high-rate time sample as independent. It does not, by itself, establish independence across orbit, solar-wind regime, spacecraft configuration, or shared calibration. The supplementary Data Set S1 event list is needed to map event IDs to passes and burst intervals.

## 4. Instrument uncertainty and product-version status

The following are **instrument/product-level specifications or external calibration studies**, not event-specific posterior uncertainties:

- **FGM L2 burst:** 128 vectors/s. The checked NASA MMS1 FGM L2 burst catalog entry gives absolute-error estimates of about 0.1 nT in the spin plane, 0.15 nT along the spin axis, and 0.2 nT in total magnitude. Burst mode uses the DFG; survey mode uses AFG, with cross-calibration and possible small offsets. See also the instrument paper, https://doi.org/10.1007/s11214-014-0057-3. Treat these as product documentation, not an event-specific four-spacecraft covariance; the corresponding per-spacecraft product metadata must be verified.
- **FPI:** DES electron cadence 30 ms; DIS ion cadence 150 ms. Not all burst data are necessarily downlinked, so event coverage and quality/state flags must be checked. Gershman et al. (2019), https://doi.org/10.1029/2019JA026980, studies residual 1-10% relative sensor-response errors. It reports DES flat-field corrections spanning roughly 0.7-1.3 across eight sensor heads; after correction, residual angular factors are expected around 1%. At 1% residual error, its examples estimate electron-velocity distortions of roughly 25 km/s in a 50 eV magnetosheath and 100 km/s in a 1,000 eV magnetosphere. These are illustrative instrument-study estimates, not corrections for this event. The dissertation's statement that FPI errors were negligible relative to its reported moments must be reconciled with event-specific quality flags and the later systematic-error analysis.
- **EDP:** the mission-level metadata/specification gives approximately 0.5 mV/m accuracy; the axial-probe instrument paper reports a different approximately 1 mV/m precision and 25 microV/m resolution (https://doi.org/10.1007/s11214-014-0115-x). These are distinct instrument/specification descriptions, not a single event-specific error bar. The event's spacecraft-potential correction, EDI cross-calibration, interpolation uncertainty, and cross-spacecraft covariance remain to be established.

Product-catalog records checked include MMS1 FGM L2 burst (DOI 10.48322/pj0n-m695) and MMS2 FPI DIS L2 burst (DOI 10.48322/8az2-0h04). These are product-level records, not an event-specific four-spacecraft manifest. The MMS3 FGM burst browse directory at https://lasp.colorado.edu/mms/sdc/public/about/browse/mms3/fgm/brst/l2/2015/11/17/ exposes versioned files including mms3_fgm_brst_l2_20151117021914_v4.18.0.cdf and neighboring files. This confirms one spacecraft/product path and a listed file version; it does **not** establish the latest version, the exact file coverage for the earlier 02:15-02:17 coalescence window, or the full four-spacecraft/FPI/EDP manifest.

The 2019 paper lists a 14.2 KB supplementary Data Set S1 event table and states that MMS data are publicly available through the MMS Science Data Center (https://lasp.colorado.edu/mms/sdc/public/). The event-list DOCX was not retrieved in this audit. The FPI instrument reference is Pollock et al. (2016), https://doi.org/10.1007/s11214-016-0245-4. Raw CDF bytes were not retrieved in this audit. No raw-file checksums, variable-level inspection, or numerical reanalysis are claimed.

Outstanding acquisition requirements:

1. Event-to-orbit/event-to-burst-interval map from Data Set S1.
2. Exact versioned CDF manifest and SHA-256 for FGM, FPI DES/DIS, EDP, and spacecraft ephemeris for all four spacecraft.
3. Calibration/quality flags, spacecraft-potential corrections, timing offsets, coordinate transforms, and time-dependent tetrahedron geometry.
4. Event-specific measurement covariance, including shared calibration and cross-spacecraft correlations.
5. A predeclared holdout not used in the force-free/MDD/STD reconstruction.

## 5. Minimal measurement-to-geometry map (proposal, not H(s)H fact)

A source-faithful forward chain would be:

raw streams Y[s,k](t)
-> calibration C[s,k](version, quality flags)
-> time/position registration R[s](t)
-> common barycenter and event coordinates
-> MDD/MVA/LMN reconstruction
-> explicit force-free or other geometric fit M(theta)
-> derived observables (core scale, impact parameter, field, flux, heating terms).

The H(s)H forward generator from a declared worldtube/timesheet/responsive-medium representation to those calibrated observables is not yet defined. The inverse reconstruction from four spacecraft trajectories to a complete 4-D structure is not unique without explicit projection, synchronization, model, and identifiability conditions. MDD's quasi-2-D assumption and the force-free cylindrical fit are part of the measurement model, not proof of an H(s)H equivalence.

Existing Lean PR #1189 (observation factorization), PR #2458 (covariance composition), and PR #2330 (unit-lineage factorization) are relevant as conditional mathematics, but none has been instantiated on this MMS acquisition chain. No new Lean run was made under the active Lane 24/P0 hold.

## 6. Disposition

- **Candidate status:** additional measured-system candidate only; not selected as P2.
- **P2:** remains HOLD. No system selection, paper advancement, or gate change.
- **Physical work:** no raw-data calculation, fit, independent prediction, or observational validation performed.
- **CODATA:** no numerical comparison made. Any later recalculation of ion inertial length or related scales must first pin the adopted CODATA release and correlated constants; no constants were silently substituted here.
- **H(s)H:** this is a possible worldtube/measurement-map test case, not evidence that magnetic flux ropes are H(s)H worldtubes.
- **WWRD:** mechanical climbing-rope constraints remain a first-blush geometric heuristic. A magnetized-plasma flux rope is not a mechanical climbing rope, and neither establishes rope universality.
- **Theory:** no BEDROCK promotion, equation correction, or new physical law.

The useful next discriminator is not another fit: retrieve the exact event/product manifest, establish the event-level covariance and time-dependent four-spacecraft geometry, then freeze a measurement-only baseline and an untouched holdout before comparing any H(s)H forward prediction.