# M87* acquisition lineage and holdout status
Submission: relay36-m87-acquisition-lineage-20261103t0736z-001
Status: case-level evidence-lineage application; no physical prediction, no fit, no P2 system selection, no theory promotion.

## Executive result

The current M87* polarimetry candidate contains several distinct data products, observing epochs, calibration pipelines, and papers. They must not be counted as interchangeable independent observations.

The key correction is to classify the 2021 results used in the current HsH note as a RETROSPECTIVE CROSS-EPOCH COMPARISON, not a blind holdout. The 2025 EHT paper analyzes all three epochs (2017, 2018, 2021), and the current HsH note uses published method-ensemble ranges from that paper. No parameter-freeze timestamp or holdout-access audit is recorded.

The 2017 Stokes-I and polarimetric releases are different products from the same April 2017 observing campaign. The 2023 polarimetric release contains 24 files, but the inventory resolves them into 8 observing-day/band cells with 3 processing variants per cell. Those 24 files are not 24 independent acquisitions.

This is an application of the existing Ariadne evidence-lineage proposal to one real measured system. It does not create a new schema, catalog, or tool.

## 1. Source-grounded data lineage

The official EHT data-products catalog distinguishes these M87 products:

| Product | Observation scope | Release/update date | Source status |
|---|---|---|---|
| 2019-D01-01 | 2017 calibrated data | 2019-04-10 | calibrated Stokes-I release |
| 2022-D01-01 | 2017 complete L1 data | 2022-05-09 | separate complete-L1 product |
| 2023-D01-01 | 2017 calibrated polarimetric data | 2023-11-08 | DOI 10.25739/q46m-m857 |
| 2024-D01-01 | 2018 M87 calibrated data | 2024-03 | separate calibrated product |
| 2025-D01-01 | 2018 complete L1 data | 2025-01-06 | separate complete-L1 product |
| 2025-D02-01 | 2021 complete L1 data | 2025-09-16 | separate complete-L1 product |
| 2026-D01-01 | 2018 and 2021 calibrated polarimetric data | 2026-06-29 | combined polarimetric product |

The catalog lists the 2026-D01-01 product with the 2025 A&A 704 A91 paper as its reference. It separately lists the 2018 and 2021 complete-L1 products. The exact parent/derivative relationships among the 2024, 2025, and 2026 products have not been recovered from their manifests; do not infer them from product names.

### 2017 Stokes-I product

The official 2019-D01-01 README identifies the data as derived from the April 2017 SR1 observing campaign, covering April 5, 6, 10, and 11 in low and high bands. The released data are time-averaged to 10 seconds and frequency-averaged over 32 IFs. All polarization information is removed: RL/LR are set to zero and RR/LL are set to estimated Stokes-I values.

Therefore 2019-D01-01 is useful for intensity and visibility readouts, but it cannot directly test a polarization-only twist or EVPA-helicity signature.

The 2019-D01-02 imaging-pipeline release describes DIFMAP, eht-imaging, and SMILI as alternative image-reconstruction pipelines using calibrated visibility data. These are analysis variants, not new observing campaigns.

### 2017 polarimetric product

The official 2023-D01-01 README identifies calibrated polarimetric data from the same 2017 observing campaign and the same four observing days. It contains HOPS and CASA calibration products. HOPS is supplied in two versions: an ALMA-rotated base product and a zero-baseline D-term-corrected/self-calibrated product. CASA has its own D-term correction and is not self-calibrated.

The versioned inventory was counted by script:

- 8 CASA files;
- 8 HOPS ALMArot files;
- 8 HOPS zbl-dtcal+selfcal files;
- 4 observing days x 2 bands = 8 day-band cells;
- 24 files / 8 cells = 3 processing variants per cell.

This is a metadata count, not a physical calculation. The 24 files are not 24 independent observations. HOPS and CASA provide reduction-robustness comparisons on the same observing campaign, not independent acquisition-level replication.

### 2018 and 2021 products

The official catalog lists separate 2018 and 2021 complete-L1 products, plus a combined 2018+2021 calibrated polarimetric product. The 2025 A&A paper, DOI 10.1051/0004-6361/202555855, reports three epochs of polarized M87* images at 230 GHz using 2017, 2018, and 2021 observations. Its abstract notes that 2021 baseline coverage gained Kitt Peak and NOEMA.

These are distinct observing epochs of the same physical system and the same EHT collaboration. The 2021 station configuration is a useful baseline-coverage variation, but it is not an independent-system replication.

## 2. Applied evidence-lineage classification

| Comparison | Acquisition lineage | Analysis lineage | Correct classification |
|---|---|---|---|
| 2019-D01-01 vs 2023-D01-01 | Same 2017 campaign and observing days; exact raw-sample overlap unresolved | Stokes-I vs polarimetric products; HOPS appears in both product families | Cross-channel, same-campaign evidence; not independent acquisition |
| HOPS vs CASA in 2023-D01-01 | Same 2017 campaign | Distinct calibration pipelines | Reduction robustness only |
| HOPS ALMArot vs HOPS zbl-dtcal+selfcal | Same campaign | Different calibration/self-calibration stages | Processing variants only |
| 2017 vs 2018 vs 2021 | Separate observing epochs | Same M87* system and EHT collaboration; 2021 has a changed station complement | Retrospective temporal comparison, not independent-system replication |
| 2021 in the current HsH analysis | Included in the 2025 paper and published ranges | Model-exposure/freeze audit absent | Not a blind holdout |

The Ravel 2017 Fourier-visibility report records 51,119 calibrated visibility rows from 2019-D01-01. Those are visibility records within the 2017 campaign, not 51,119 independent acquisitions. An effective statistical sample size requires the time, baseline, calibration, and imaging covariance; it has not been calculated here.

The M87 polarimetry report uses published method-ensemble ranges and did not download, recalibrate, or re-image raw UVFITS. Its 2017/2018/2021 comparison is therefore a published-range comparison, not a new raw-data analysis.

## 3. Holdout and prediction consequence

The current 2021 label should be:

RETROSPECTIVE_CROSS_EPOCH_COMPARISON

not:

BLIND_HOLDOUT

A genuine holdout requires a frozen parameter vector and analysis plan before access to the held-out acquisition, plus a recorded access audit. Neither is present. Since the 2025 paper already analyzes 2017, 2018, and 2021, a model developed using that paper or the current HsH published ranges has already been exposed to all three epochs.

A prospective test would require:

1. A source-defined H(s)H forward map and one frozen shared parameter vector.
2. A declared calibration acquisition and a genuinely unseen future epoch, frequency, or independently acquired system.
3. The same model across Stokes-I and polarimetric channels, with shared acquisition/calibration covariance retained.
4. A matched GRMHD plus synchrotron-radiative-transfer comparator, including spatially varying Faraday rotation.
5. A predeclared joint predictive region and falsification threshold, with no per-epoch retuning.

The 2021 station change can test sensitivity to baseline coverage if predicted in advance. It cannot, by itself, establish independent replication of the M87* system.

## 4. H(s)H map and proof status

The required source-to-observable chain remains incomplete:

4D filament/worldtube -> electromagnetic current -> magnetic-field orientation -> synchrotron emissivity/absorption -> Stokes I/Q/U/V -> Faraday depth -> beta2

No source-grounded composition map currently supplies this chain. EVPA helicity is not thereby worldtube twist. The M87 data do not directly measure worldtube thickness, torsion, material-frame twist, or contact surfaces.

Existing conditional mathematics was checked rather than duplicated:

- Ariadne's Evidence Lineage x Readout Identifiability contract, blob 5712460df6a52d8388c8647b842aa02c93f8415d, already proposes a typed provenance DAG and separate artifact, acquisition, instrument/calibration, analysis, system, and fit/holdout levels. It remains a proposal, not a canonical schema.
- Morrow's holdout_not_identifiable_from_calibration theorem is present in the current PR #388 head a48cb68e2f848bcffab8251b2495aef88702307d. Lean 4.34.0 Actions run #41015101863 succeeded; the theorem-specific axiom output says it does not depend on any axioms. This is a conditional workflow theorem, not an empirical result.
- Kestrel's projected-incidence/scale-route theorems in PR #873 head 0da1050bd0e20e55004c86053e9ccd1b582633d9 built successfully in run #41585887441. They concern map identifiability, not evidence independence.
- The M87-specific finite-pixel module in PR #1296 did not compile. Exact-head Actions run #41576591587 failed: complex division depended on a noncomputable instance, and Complex.abs was unresolved. No Lean proof is established for that module. The task graph's LEAN_NOT_RUN field is stale relative to the actual failed run and the correction recorded on issue #1297.

Lean checks only the formalized statement. None of these builds establishes the correctness of the source-to-physics translation, the physical premises, or an observational prediction.

## 5. Admission status and next cursor

| Requirement | Current status |
|---|---|
| Identifiable real system and public data products | Present: M87*, EHT product catalog |
| Exact raw acquisition IDs and complete parent/derivative manifests | Incomplete |
| Units and observational uncertainties | Published sources identify them; raw joint covariance not retrieved |
| Shared calibration and analysis dependence | Partially mapped; full covariance missing |
| Parameter-freeze timestamp and holdout-access audit | Missing |
| H(s)H geometry-to-Stokes/Faraday forward map | Missing |
| Matched standard comparator | Specified at design level, not run |
| Independent blind prediction | Not available from the currently published 2017-2021 set |
| Physical fit or prediction | None performed |

Disposition: LINEAGE_APPLICATION_COMPLETE / HOLDOUT_NOT_ESTABLISHED / RAW_DATA_NOT_RETRIEVED / MAP_MISSING / P2_CANDIDATE_ONLY.

M87* remains a candidate, not the selected P2 system. This note does not advance the November 30 paper gate, change BEDROCK, modify SAT-O/Blockwave equations, or promote any H(s)H physical claim.

## Source custody

- Official EHT data catalog, accessed 2026-11-03: https://eventhorizontelescope.org/for-astronomers/data
- 2019-D01-01 README blob: 63f0dfe050ce0bc4f7fd13d9120093b3cf486461
- 2019-D01-02 README blob: ed5e6343fbffa873f337be002810de6e0dae9c7a
- 2023-D01-01 README blob: cf649186a3d39ecc748a24b8f27bba0a9f63e5e5
- 2023-D01-01 inventory blob: 3cc43a15da25cc3ce0afe4c219546f4813bca8cf
- 2025 A&A 704 A91: DOI 10.1051/0004-6361/202555855
- HsH M87 polarimetry note: blob c161bfd7a3179f2f04e2fcc6b57d6f06ee3f6888
- HsH Ravel 2017 visibility audit: blob 9bad967ae217d3b2421b9617e82adb1f3477b240
- HsH joint-readout gate: blob 05d8ae7f5f4b734515ef70776e475ac36303715e
- P2 docket: issue #565. No final P2 system selection is recorded.

No raw UVFITS, private source material, or Mira inbox content is included in this artifact.
