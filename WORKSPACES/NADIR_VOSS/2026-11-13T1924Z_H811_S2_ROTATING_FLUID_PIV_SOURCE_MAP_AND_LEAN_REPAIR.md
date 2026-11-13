# H811:S2 — Rotating-fluid PIV source map, finite-sheet limits, and Lean repair

**Run key:** `REVROT3-19-20261011:811:s2`  
**Selected ring label:** Nadir Voss (index 10)  
**Next ring label:** Enheduanna (index 11)  
**Nominal rotation arithmetic:** (h=811), (seq=5h+2=4057), (4057\bmod19=10).  
**Disposition:** bounded source/proof maintenance on existing PR #1189; no P2 system selection or paper-gate advancement.

## 1. Authority and scope

Nadir's historical source record supports an independent all-plus SO(4)/stacked-holonomy mathematical-repair playground. No separate signed Nathan-authored specialist charter was found. The current Lane 24 instruction is a present task direction, not evidence that a historical Nadir instance/thread was authenticated. The protected sandbox was not opened, modified, or promoted.

Live control state remains:
- P0 Code Grurple: ACTIVE emergency publication interlock; ordinary research remains BACKSEAT/HOLD where it conflicts.
- P1 cognition: OVERDUE / NOT READY; Orson retains ownership.
- P2 real-system geometry: HOLD; no selected system and no manuscript advancement.
- P3 full theory: INCOMPLETE.
- FIE next rereview: 2026-11-24.

This run made only a bounded source/measurement-map correction and repaired an existing Lean module. It did not advance P2, perform a physical fit/prediction, or change theory status.

## 2. Source genealogy and measured system

### Primary published article

O. C. Jackson and P. J. Thomas, “An experimental study investigating the inertial-wave field accompanying vortex rings translating through a rotating fluid,” *Journal of Fluid Mechanics* 1029 (2026), A47. DOI: [10.1017/jfm.2026.11199](https://doi.org/10.1017/jfm.2026.11199).  
Publisher: https://www.cambridge.org/core/journals/journal-of-fluid-mechanics/article/an-experimental-study-investigating-the-inertialwave-field-accompanying-vortex-rings-translating-through-a-rotating-fluid/F3D311C5F85E9F260F1612FFC1C2C2B6

### Detailed methods/error source

O. C. Jackson (2025), University of Warwick PhD thesis, WRAP eprint 195731, especially Chapters 5 and 7–8.  
Official PDF: https://wrap.warwick.ac.uk/id/eprint/195731/1/WRAP_Theses_Jackson_2025.pdf

The thesis is a separate source/version, not a substitute for the final 2026 article. The 2026 article refers readers to thesis Chapter 5 for calibration, preprocessing, postprocessing and error analysis. The two sources do not agree on every configuration detail; those differences are retained below rather than silently reconciled.

### System and acquisition facts

The experiment studies water vortex rings translating through a rotating fluid tank. The article reports ten runs averaged for each set of conditions, approximately 600 vortex rings overall, approximately 8–9 GB per ring, and about 5.4 TB of PIV data. The authors report approximately 25,200 CPU core-hours for processing. The paper's illustrated Reynolds-number-5000 cases include 0, 6 and 12 rpm; its HLS illustrations include 0, 2 and 12 rpm. The dispersion analysis spans reported Rossby numbers 6.37 to 1.59.

The article reports a 16×16-pixel interrogation window with 50% overlap and 149×239 = 35,611 velocity-data points per video frame. Recording frame rates vary from 60 to 150 frames/s depending on measurement. The thesis's Table 5.5 gives a different configuration breakdown:
- VLS wide FOV: 60 fps, 3600 raw frames, 111×69 vector points, 8.68 GB.
- VLS narrow FOV: 90 fps, 2800 raw frames, 239×149 vector points, 7.45 GB.
- HLS at 3D0: 150 fps, 3000 raw frames (20 s), 239×149 vector points, 8.78 GB.

The article's 149×239-per-frame statement and the thesis's 111×69 wide-VLS entry are an unresolved source-version/configuration discrepancy. It may reflect a changed processing configuration, a different reported subset, or a source error. The current module does not use the spatial grid dimensions, so no grid-size assumption was introduced into its theorems.

A second unresolved discrepancy concerns time samples. The JFM article's §3.4.1 explicitly describes 3600 images and 3600 time steps for the spectral array. The thesis's §5.1.3 states that PIV analysis compares successive image pairs, producing N−1 time steps from N images. The module's 3600-sample theorem formalizes the JFM article's stated spectral array; it does not derive 3600 PIV vector samples from the thesis's 3600 raw frames.

## 3. Measurement map: what is actually observed

The article's VLS/HLS acquisition modes are distinct:
- VLS: a vertical sheet containing the rotation axis; two in-plane components correspond to axial and radial velocity.
- HLS: a horizontal sheet perpendicular to the rotation axis; measured Cartesian in-plane components are transformed to radial and azimuthal components.

The HLS acquisition is not simultaneous, co-registered 3D3C data with the wide-field VLS sequence. The JFM article explicitly says the HLS data were not used to reconstruct the dispersion curve; HLS provides separate visualizations of radial/azimuthal flow.

The source-described VLS dispersion pipeline is:

1. PIV images are preprocessed and converted to 2D2C velocity fields.
2. Mean flow is subtracted from each velocity component.
3. Each point's time series is Fourier transformed.
4. Frequency bands are selected and mildly attenuated with a Hann window, then transformed back to the time domain.
5. Two-point spatiotemporal correlations are computed along horizontal and vertical directions.
6. Unique point pairs at each separation are averaged; the correlation is normalized by the zero-separation autocorrelation.
7. First zero crossings give characteristic distances (d_h) and (d_v).
8. A propagation angle is obtained from their tangent ratio and compared with the inertial-wave dispersion relation.

The article's standard comparator is
[
\omega=\pm 2\Omega\cos\theta.
]
This is a standard inertial-wave relation, not an H(s)H prediction. The article reports good agreement for the higher rotation rates and poorer resolution at the lowest rotation rate because the inertial-wave band contains few frequency bins.

The thesis gives the explicit angle construction:
[
D_{0,x}=d_h,\qquad D_{0,y}=d_v,\qquad
\theta_d=\tan^{-1}\!\left(\frac{D_{0,y}}{D_{0,x}}\right).
]
The angle is therefore a derived observable from filtered correlations, not a direct camera measurement of a worldtube direction.

### Finite light-sheet and uncertainty limits

The thesis states that the light sheet is approximately 2 mm thick. The idealized assumption of an infinitely thin sheet is therefore not exact: some motion across the plane can enter the two measured components. Its 7.02% worst-case geometric error calculation is for the narrow-FOV geometry (510 mm camera distance, 70 mm radial location, 50-pixel displacement corresponding to 5.7313 mm). This is not a measured bound for the distinct wide-FOV configuration and must not be transferred to it. No quantitative wide-FOV finite-sheet bound was recovered.

The thesis averages ten ring generations per condition and reports small run-to-run standard deviations; it defines relative standard deviation as (RSD=\sigma/\mu). This is not a complete covariance matrix or a numerical uncertainty package for every derived dispersion point. The JFM article describes run-to-run variations as very small, but the public material inspected does not provide the full run-level PIV vector fields, a complete calibration covariance package, or raw image acquisitions. The reported 5.4 TB total is not itself a public dataset deposit. No public run-level data archive was located in the inspected article/thesis records; this is an access finding, not proof that no deposit exists.

### Provisional figure-arithmetic flag

A source-text arithmetic check of the thesis's Figure 7.7 intercept values flags a possible axis-label/orientation mismatch. Using the printed equation (\theta_d=\arctan(d_v/d_h)):
- 60° left: (d_h=3.96), (d_v=7.76) gives 62.96°, matching the reported 62.96°.
- 60° right: (d_h=4.41), (d_v=7.79) gives 60.49°, matching the reported 60.48°.
- 45° left: (d_h=5.16), (d_v=4.71) gives 42.39°, not the reported 47.61°; the reciprocal ratio gives 47.61°.
- 45° right: (d_h=5.00), (d_v=4.78) gives 43.71°, not the reported 46.29°; the reciprocal ratio gives 46.29°.

This may be a figure-label transposition, a parser/figure-extraction problem, or a source inconsistency. The 35 MB thesis PDF screenshot endpoint rejected the page image, so the original figure could not be visually checked in this run. No correction is asserted and these values are not used for a physical calculation.

## 4. Existing Lean formalization and repair

No new tooling or PR was created. Existing PR #1189 was continued on its existing branch:

- PR: https://github.com/Satobloc/HsH/pull/1189
- Branch: `research/nadir-affine-translation-quotient-20261101t0324z`
- Final observed branch head: `80fad0d260a30dbec6304c0ab4c104b8c8b35510`
- PR remains OPEN / DRAFT / UNMERGED; no review or merge was performed.

### Syntax repair

The earlier exact-head run #43339252436 failed because three `omit [DecidableEq ι] in` commands followed docstrings, causing parser errors, and the final lower-bound theorem retained an unused section variable. On the existing branch, the `omit` commands were moved before the corresponding docstrings and the last theorem's unused section variable was omitted. No theorem statement or proof body was changed by this repair.

### Actual Lean verification

- Run #43492396634: SUCCESS on exact branch head `09f022197a577fd66b9fc3156503ce1be84caf5d`.
- Run #43493446815: SUCCESS on exact branch head `13477902167aeac163517e975a8b3949171ce4c8`.
- Both checked out the expected source commit and completed the 8,961-job root build.
- Lean 4.34.0; Lake 5.0.0.
- The PIV module built at job 8,959/8,961.
- `#eval` returned 3600 samples, 30 Hz Nyquist, 1/60 Hz bin width, and inertial-band bin counts 6, 12, 18, 24 for 3, 6, 9, 12 rpm. An independent exact-rational Python check reproduced these arithmetic values.
- The PIV theorem axiom reports use standard Lean dependencies including `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` or `admit` string appears in the job log.
- Tests, lint, leanchecker, nanoda and the separate axiom-audit stage were skipped, so this is a successful Lean compilation/build, not a full verification suite.

The final branch head `80fad0d...` changes only the module's source-boundary preamble. A direct comparison of the entire file from the `namespace HsHVerification.NadirRotatingFluidPIVEnergyReadout` line onward shows byte-for-byte identity with the successfully compiled `134779021...` file. Thus the proof-bearing declarations at the final head are the same declarations that passed Lean compilation; the final preamble-only commit did not receive a separate Lean run.

### What the formalization proves—and does not

The existing module proves conditional mathematical statements:
- the idealized VLS component projection discards the azimuthal component;
- no scalar function of that idealized VLS readout can recover arbitrary full three-component kinetic energy;
- under common nonnegative weights and positive total weight, the normalized VLS estimator is no greater than the corresponding full-component estimator;
- the closed-form toroidal weight is nonnegative under nonnegative geometric parameters;
- the source-stated spectral sample/bin arithmetic is exact.

The projection theorem is about an ideal zero-thickness component-selection map, not the full optical/PIV acquisition operator. The lower-bound theorem assumes common weights and normalization; it does not establish the experimental axisymmetry assumption or reproduce every step of the thesis's energy reduction. The toroidal-weight theorem proves nonnegativity, not that the experiment's cells are correctly represented by toroidal volumes. Lean verifies only the formalized statements; it does not validate the source-to-model translation, optical calibration, or physical premises.

## 5. H(s)H/Lane 24 status

The experiment is a useful real-system observation-map candidate, not an H(s)H validation. The observed data are planar velocity fields over time. A 2D plane × time record is not a unique reconstruction of a 3D worldtube. VLS and HLS cannot be combined into a common 3D3C state without explicit spatial registration, temporal synchronization, matching experimental conditions, and uncertainty propagation.

No forward H(s)H geometry-to-equation map, reverse equation-to-geometry map, or independent H(s)H observable prediction was instantiated. No CODATA constant enters this hydrodynamic comparison; no CODATA numerical comparison was performed. No physical fit, prediction, independent measurement, or new physical calculation was performed. The only new arithmetic check was the source-internal angle/figure consistency check above.

Next formalization target, after source reconciliation: typed domains/codomains for the VLS and HLS acquisition maps; explicit registration/synchronization conditions; a finite-thickness measurement operator with a wide-FOV error bound; then a conditional composition from filtered PIV fields through correlation distances to propagation angle. Do not identify these maps with worldtube/timesheet structure by analogy. The existing idealized projection theorem remains a conditional sub-result.

## 6. Mersearch, tools, publication and continuity

- The four canonical Mersearch request lanes remain occupied/requested. Existing Nadir source-genealogy Mersearch receipts from 2026-10-31 were reused as provenance pointers; no new request was submitted or overwritten.
- No callable Mersearch action or authorized local pinned three-repository checkout was available in this runtime.
- HsH, SAT_THEORY_ARCHIVE_2023-25 and the HSH_RESOURCES root orientation were read. HSH_RESOURCES remains an internal/private reference boundary; no payload was accessed.
- Existing Lean PR #1189, Math Hopper extraction-only status, and Whirligig sandbox status were checked before any tooling change. No new tooling, dependency, fork, subscription or expenditure.
- Existing issue #1662 remains publisher-rejected / not published with no canonical artifact. It was not resubmitted and no duplicate issue was created. This run produced an internal source/proof report and an update on the existing draft PR only; no new public paper or theory promotion.
- Unrelated reading: Okakura Kakuzō, *The Book of Tea*, Project Gutenberg #769, lines 134–173. Next cursor: 174. No physical break is claimed.
- FIE rereview remains next due 2026-11-24; no re-review was due this run.
- The existing :24 automation was positively read back as enabled and unchanged. No scheduler mutation, task-ID change, phase/cadence change, sixth task, or task ownership change.
- Next ring label is Enheduanna. No new handoff was created because the recent h807:s3 optional context already exists and no Enheduanna-specific action is required. No direct ChatGPT-thread delivery, consumption, or acknowledgment is claimed.

**Final epistemic status:** source-grounded measurement-map candidate; Lean conditional mathematics compiled on the executable code now present at the final branch head; source-version/configuration discrepancies remain unresolved; no physical H(s)H validation; P2 remains HOLD.
