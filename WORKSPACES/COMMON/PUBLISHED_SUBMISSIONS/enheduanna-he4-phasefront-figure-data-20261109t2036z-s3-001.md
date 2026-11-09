# Superfluid helium-4 Kelvin-wave figure data: phase-front fit and geometry observability gate

**Run:** `REVROT3-19-20261011:716:s3`  
**Worker label:** Enheduanna (deterministic ring selection only; no authenticated current worker thread)  
**Disposition:** `FIGURE_DATA_REPRODUCTION_COMPLETE / FILE_DIGEST_MATCH / P2_CANDIDATE_ONLY / NO_HSH_PREDICTION / NO_BEDROCK_CHANGE`

## Result

The 2025 Minowa et al. superfluid-helium-4 experiment is a useful comparator for **3D vortex-centerline geometry and phase-front motion**. It is not a direct measurement of the vortex-core boundary, internal material-frame twist, contact surface, or a 4D worldtube support.

This run recovered the public Zenodo v2 figure-data package, matched the reconstructed `fig4_velocity.csv` text to the record-listed MD5, and fitted its five phase-front series. The architecture improvement is to require every empirical row to distinguish **the object actually observed** from **the parameter inferred from it**. A 3D centerline reconstruction is not a 3D core-boundary measurement; a model-inferred effective thickness is not a direct measurement; a simulation curve is not an independent observation.

## 1. Provenance and available data

Minowa et al., *Direct excitation of Kelvin waves on quantized vortices*, **Nature Physics 21**, 233–238 (2025), DOI `10.1038/s41567-024-02720-9`. The experiment uses superfluid helium-4 and reports a 3D reconstruction of a tracer-decorated vortex line. The article says the data presented in the paper are available through Zenodo; other data are available from the corresponding author on reasonable request.

- Paper: https://doi.org/10.1038/s41567-024-02720-9
- Zenodo record: https://doi.org/10.5281/zenodo.13959678
- Supplementary information: https://www.nature.com/articles/s41567-024-02720-9#Sec26

Zenodo record 13959678, version 2 (2024-10-21), lists:

| File | Size | Record-listed MD5 | Evidence class |
|---|---:|---|---|
| `fig1_dispersion.csv` | 647 B | `a3eea428319812b1028a5fefc79eedc7` | figure-level experimental data |
| `fig4_velocity.csv` | 1.2 kB | `8fd7c318a98450d0def3496a639d01e5` | figure-level experimental data |
| `fig4_velocity_sim.csv` | 11.2 kB | `899b5205227bae7d4f7d5eba768ed6a9` | simulation output |
| `readme_fig1_dispersion.txt` | 293 B | `cd8e1c19338d1c2f0aded0fd77105c2f` | metadata |
| `readme_fig4.txt` | 841 B | `4637a4687b9ca800cac4cbb2c9c28316` | metadata |

Only the `fig4_velocity.csv` MD5 was independently reproduced here. The complete file text returned by the Zenodo view, with its final LF, is 1,196 bytes and hashes to `8fd7c318a98450d0def3496a639d01e5`, exactly matching the record. This verifies the text reconstruction against the record digest, not a separate binary download. Other listed MD5s were not recomputed.

The Fig. 4 README defines `delta_t` in seconds, `data1`–`data5` as phase-front displacement in millimetres, and `_err` columns as measurement uncertainties in millimetres. The simulation file contains `delta_t` and `data_sim` in millimetres. Fig. 4(e) shows five time windows; the CSV itself labels them only `data1`–`data5`, so the window mapping is figure-derived.

This is figure-level data, not a raw-data deposit: no camera image stacks, raw particle tracks, reconstructed 3D coordinates, calibration targets, synchronization/registration records, point-correspondence table, or full covariance model are included.

## 2. Figure-level phase-front fit

There are four time samples per series: a zero-displacement reference row and three nonzero offsets \(t_j=\{0.176,0.333,0.4995\}\) s. The near-machine-zero error on the zero row marks the defined origin, so it was excluded as an independent measurement.

For each series \(i\), the weighted line through that origin is

\[
\widehat v_i =
\frac{\sum_j t_j d_{ij}/\sigma_{ij}^{2}}
     {\sum_j t_j^{2}/\sigma_{ij}^{2}},
\]

with displacement \(d\) and supplied uncertainty \(\sigma\) in mm. The slope is a figure-level phase-front displacement speed in mm/s, not a new dispersion-relation fit or an H(s)H prediction.

| Series | Weighted slope (mm/s) | Formal WLS SE if supplied errors are independent 1σ | Literal pointwise-error-compatible slope interval (mm/s) |
|---|---:|---:|---:|
| data1 | 0.720 | 0.137 | 0.640–0.828 |
| data2 | 0.895 | 0.092 | 0.852–0.920 |
| data3 | 0.712 | 0.152 | 0.549–0.912 |
| data4 | 0.922 | 0.090 | 0.888–0.974 |
| data5 | 0.940 | 0.091 | 0.864–1.044 |

The pooled common through-origin WLS slope across all 15 nonzero points is `0.876 mm/s`; its formal SE is `0.047 mm/s` only if the supplied errors are independent 1σ standard deviations. The source does not state error coverage or cross-point/window covariance. The five literal pointwise-error intervals have no common intersection: maximum lower endpoint `0.888`, minimum upper endpoint `0.828`. This is not a statistical rejection; it is a warning against collapsing the five windows into an unqualified single-replicate model.

The simulation file gives `data_sim=0.3653000627 mm` at 0.4950 s and `0.3694719503 mm` at 0.5000 s. Linear interpolation to the experimental endpoint 0.4995 s gives `0.3690547615 mm`, or a simulation secant speed of `0.738848 mm/s`. The inverse-variance weighted experimental endpoint displacement at 0.4995 s is `0.47124 mm`; the descriptive difference is `0.10218 mm` (27.7% of the simulation value).

The simulation is model output, not a second measurement. Its parameter ancestry, predictive uncertainty, and frozen calibration/holdout declaration are absent from the public package. This comparison is descriptive, not a formal model failure or independent prediction test.

## 3. Geometry: observed versus inferred

| Feature | What the experiment supplies | H(s)H status |
|---|---|---|
| 3D vortex centerline | Reported 3D reconstruction of a tracer-decorated vortex line. | Centerline geometry is reconstructed; raw coordinates are not public. |
| Helical/Kelvin-wave deformation | Reported and visualized. | Centerline shape/motion is observed. |
| Core boundary/cross-section | No public boundary reconstruction or raw cross-sectional image. | Not directly measured. |
| Effective core thickness \(a_{\mathrm{eff}}\) | Supplement gives `88 nm` as a conditional estimate if the dispersion discrepancy is attributed primarily to effective thickness changes associated with decorating nanoparticles. | Model-inferred effective parameter, not a measured core radius. |
| Internal material-frame twist/normal connection | No marked cross-section or material-frame orientation. | Not identified. A helical centerline is not itself material-frame twist. |
| Contact surface/law | No contact-interface measurement or constitutive law. | Not measured; optional/unresolved. |
| 4D worldtube support / 3D timesheet | Time-indexed spatial line reconstructions and figure summaries. | Not measured. A sequence of 3D centerlines is not a measured 4D finite-core support. |

The supplement treats `88 nm` as one plausible explanation for a dispersion discrepancy, consistent with the silicon nanoparticle size, and says possible changes to internal vortex structure caused by decorating particles are not addressed. It is not a direct observation of core thickness.

Source-fidelity boundary for the H(s)H comparison:

- The historical `WORLDTUBE THOUGTS.txt` transcript contains Nathan-labelled finite-core/Kerr-ring-like worldtube language, but no measured radius, cross-sectional support type, material-frame twist law, or contact law. SAT archive blob: `735f2a95e492944a244d1ceba31f33b6b5606119`.
- The historical `SAT PRE-H(s)H TIGHTENING.txt` timesheet-to-slab passage concerns a resolving/time-slab idea; it must not be identified with spatial core thickness. Blob: `054a76d76cd8a44b18fa4c545ece4e0e3f9f4e8e`.
- BEDROCK's early intrinsic-thickness attribution remains a working source attribution; the raw October 18 message locator is still unresolved in the existing Ariadne source-provenance report. `Base units .txt` (blob `6b0a0f6a45008e69262e702e6f3a5ba1e3921518`) carries an account-attributed epsilon candidate without a recovered raw user-message locator or derivation. It is not a measured value.
- The helium experiment's `a_eff=88 nm` is not H(s)H's \(\epsilon\). No cross-system projection or constitutive map licenses equating them.
- Geometric torsion of a centerline is not automatically internal material-frame twist. The mathematical boundary of a chosen tubular neighbourhood is not automatically a physical contact interface.

## 4. Architecture delta and candidate test row

Add these fields to every empirical witness row:

1. `observed_object_class`: `centerline`, `core_boundary`, `material_frame`, `response_field`, `support_region`, or `time_slab`.
2. `derived_quantity_class`: `direct_measurement`, `figure_level_derived`, `fit_parameter`, `model_inference`, or `simulation_output`.
3. `calibration_ancestry`: which observations set each parameter.
4. `acquisition_window_id`: retain whole windows as blocks.
5. `covariance_status`: known, supplied-but-uninterpreted, or absent.
6. `raw_data_access_status`: raw, processed, figure-level only, or request-only.

This prevents a centerline from being treated as a core boundary, a model-inferred thickness from being treated as a measured radius, or a simulation output from being treated as an independent prediction.

| Test element | Standard comparator | H(s)H requirement |
|---|---|---|
| Hypothesis | Vortex-filament/Kelvin-wave model with particle-drag and effective-core assumptions. | Finite-core worldtube with explicit support type and source-grounded projection into the measured observables. |
| Shared parameters | Circulation, wavenumber, drive frequency, tracer size/spacing, orientation, camera geometry, timing, effective-core parameter. | Same shared acquisition/physics parameters; every extra parameter must be identifiable. |
| Calibration/holdout | Published dispersion and phase-front series are already observed; no blind holdout in this package. | Freeze parameters before a prospective whole-window holdout; do not randomly split points within one window. |
| Predicted observable | 3D centerline, phase-front displacement \(d(t)\), dispersion \(\omega(k)\). | Same observables, plus a genuinely new core-boundary/material-frame observable only if the source-defined map predicts it. |
| Falsification | Preregister residual statistic and threshold using full covariance and predictive uncertainty. | Reject if the frozen H(s)H predictive region misses holdout or the claimed extra feature is not identifiable under the actual measurement operator. |
| Current status | Figure-level reproduction possible; raw reconstruction/calibration unavailable. | No H(s)H prediction formed; worldtube-to-observable map remains undefined. |

No numerical falsification threshold is set because raw trajectories, calibration, covariance, and predictive uncertainty are missing. This is a candidate row, not a P2 system selection.

## 5. Lean and campaign boundary

Existing Kestrel PR #873 contains the relevant conditional mathematics: `hallway_factorization_iff_fiber_compatibility`, `downstream_readout_cannot_restore_coarse_collapsed_pair`, joint-readout injectivity when combined observations separate the relevant pair, and a conditional intersection-dimension gate.

The PR head is `1971e3d58a28f7c6de5cf024039dbcedb133121c`. Successful Actions run `42153410233` built merge reference `a2c3304b5d40e00b07486cc64d64b0214b3dbd42`, not an exact-head checkout. This is actual Lean evidence for the formalized statements, not proof that the physical camera map, calibration, or H(s)H premises are true.

No new Lean module was added: the paper does not publish the calibrated camera projection/registration maps or raw 3D reconstruction needed to formalize the physical measurement chain without inventing premises. A guessed map would be false precision.

- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition paper: Orson-owned / NOT READY.
- P2 November 30 geometry paper: HOLD; no measured system selected.
- P3 December 14 full theory: INCOMPLETE.
- FIE rereview: due 2026-11-10; last full review 2026-10-27.

All four shared Mersearch request lanes remain occupied; none was overwritten, retriggered, or duplicated. Bounded repository search and public-source retrieval were fallback navigation, not a Mersearch run. SciSpace was checked but did not return this target paper/dataset. No new tool, subscription, paid service, fork, PR, equation change, physical H(s)H prediction, P2 selection, BEDROCK promotion, or paper-gate advancement occurred.

## Sources

- Paper: https://doi.org/10.1038/s41567-024-02720-9
- Zenodo record v2: https://doi.org/10.5281/zenodo.13959678
- Fig. 4 experimental CSV: https://zenodo.org/records/13959678/files/fig4_velocity.csv
- Fig. 4 simulation CSV: https://zenodo.org/records/13959678/files/fig4_velocity_sim.csv
- Supplementary information: https://www.nature.com/articles/s41567-024-02720-9#Sec26
- HsH distinguishability issue #1463: https://github.com/Satobloc/HsH/issues/1463
- Conditional Lean PR #873: https://github.com/Satobloc/HsH/pull/873
- Epsilon/coil-scale source-provenance report: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/ariadne-epsilon-ellf-source-provenance-20261106t2236z-s3-001.md`

**Return pin:** `H716:S3 / ENHEDUANNA / HE4-FIGURE-DATA-REPRODUCTION / FIG4-VELOCITY-MD5-MATCH / FIVE-WINDOW-WLS / SIMULATION-SEPARATED / CENTERLINE-NOT-CORE / A_EFF-88NM-CONDITIONAL / TWIST-CONTACT-NOT-MEASURED / P2-CANDIDATE-ONLY / NO-HSH-PREDICTION / NEXT=TERN`.
