# 2026 rotating He II vortex-lattice PIV: measurement-map and platform-motion addendum

Date: 2026-11-14

**Status:** `NEW_SOURCE / P2_CANDIDATE_ONLY / RAW_DATA_NOT_RETRIEVED / NO_HSH_VALIDATION`

**Relation to existing records:** This is an additive source note, not a duplicate of HsH issue [#1373](https://github.com/Satobloc/HsH/issues/1373), which tracks the distinct 2025 CryoLEM particle-decoration video dataset (DOI 10.57745/AHTGVK) and apparatus, or issue [#1643](https://github.com/Satobloc/HsH/issues/1643), which covers the existing finite-core and rope-contact candidate map. The 2026 PIV preprint below was not found in the bounded HsH/SAT archive search.

## 1. New measured-system source

Florian Lorin, Charles Peretti, Corentin Bourjaillat, Patrik Švančara, Pierre-Philippe Cortet and Mathieu Gibert, **"Visualization of Inertial and Kelvin Waves on the Quantum Vortex Lattice in Superfluid Helium"**, arXiv:2607.00821. Submitted 2026-07-01; current manuscript version dated 2026-10-05. This pass verified the arXiv preprint, not a journal publication.

- Primary article: https://arxiv.org/abs/2607.00821
- Related CryoLEM apparatus paper: Vessaire et al., *Review of Scientific Instruments* 97, 025206 (2026), DOI https://doi.org/10.1063/5.0305081
- Apparatus preprint: https://arxiv.org/abs/2510.00026

The new experiment reports 22 runs on CryoLEM at 10 rpm, \(\Omega=1.047\ \mathrm{rad\,s^{-1}}\), and \(T=(2.088\pm0.005)\ \mathrm{K}\), with heater power varied from 0 to 50 mW. The channel has a 2 cm by 2 cm cross-section, area \(4\times10^{-4}\ \mathrm{m^2}\), and an 8 cm height.

Solid hydrogen tracer particles decorate vortex cores. A vertical laser sheet is approximately 100 micrometres thick. Image pairs separated by 0.1 s are processed by PIV using 64-pixel interrogation windows corresponding to about 428 micrometres, with 50 percent overlap and a nominal vector spacing of 214 micrometres. The reported field of view is 14.5 mm by 17.2 mm. Individual records span 21 to 50 rotation periods.

**Data availability:** the preprint says data are available from the authors on reasonable request. No raw image sequences, PIV vector fields, masks, calibration files, per-run table or covariance package were retrieved. No reanalysis of the 22 runs is claimed.

## 2. Instrument cross-reference and a concrete systematic-control question

The published CryoLEM apparatus paper reports:

- 2 percent relative uncertainty in rotation speed, using an angular-position probe and accelerometers;
- a deterministic, periodic displacement of the experimental cell relative to the cameras, with maximum amplitude 50 micrometres;
- the 50 micrometre motion was documented at 15 rpm and 2.08 K, and the authors say its amplitude was consistent across their experiments.

The vortex-lattice preprint uses the same apparatus at 10 rpm and 2.088 K. The apparatus paper therefore supplies a concrete potential measurement systematic, but it does **not** supply the run-specific displacement amplitude or phase for the 10 rpm PIV records.

The preprint identifies low-frequency peaks at normalized frequencies \(\omega^*=0.5\) and \(1\), nearly independent of heat input, and discusses global harmonic perturbations such as sloshing from balancing imperfections or Earth rotation. At 10 rpm, these normalized locations correspond to \(\omega=\Omega\) and \(2\Omega\), or approximately 0.1667 Hz and 0.3333 Hz. The apparatus paper's measured periodic cell-camera motion is a plausible contributor to investigate, not proof that the peaks are artefacts.

A decisive control would track the cell-window contour or a fixed fiducial in every frame, estimate and remove rigid-body cell-camera motion before PIV, and publish the residual. Repeat no-heat and heated controls at multiple rotation speeds. A platform-synchronous component should track \(\Omega\) and its harmonics in absolute frequency; a laboratory-fixed contribution such as Earth rotation has a different dependence when normalized by \(\Omega\). The current single-\(\Omega\) experiment cannot separate these explanations.

## 3. Source-derived scale check

The preprint gives the quantum of circulation as \(\kappa\approx9.97\times10^{-8}\ \mathrm{m^2\,s^{-1}}\), the core-radius scale as \(a_0\approx10^{-10}\ \mathrm{m}\), and the expected intervortex spacing as

\[
\delta=\sqrt{\frac{\kappa}{2\Omega}}.
\]

Using the paper's central \(\kappa\) and measured \(\Omega\) gives \(\delta\approx218.2\) micrometres. Propagating the apparatus paper's 2 percent rotation-speed uncertainty while holding \(\kappa\) fixed gives approximately 216.1 to 220.4 micrometres, or about 2.2 micrometres one-sided from the central value. This is a rotation-only interval, not a complete uncertainty budget, because the preprint does not state an uncertainty for \(\kappa\).

The nominal instrument-scale ratios are:

| Quantity | Ratio to \(\delta\) |
|---|---:|
| PIV vector spacing, 214 micrometres | 0.98 |
| PIV interrogation-window width, 428 micrometres | 1.96 |
| Laser-sheet thickness, 100 micrometres | 0.46 |
| Apparatus motion amplitude reported at 15 rpm, 50 micrometres | 0.23 |

The 50 micrometre motion is also about 0.23 of one PIV vector spacing. It is a documented displacement amplitude, not a statistical error bar and not a measured correction for the 10 rpm runs.

The 214 micrometre vector spacing is about \(2.14\times10^6\) times the stated \(10^{-10}\) m core-radius scale. The measurement is therefore not core-radius-resolved. It samples tracer-decorated vortex-lattice motion at approximately the intervortex-spacing scale. A reported 500 micrometre perturbation spans about 2.34 vector spacings but only 1.17 interrogation-window widths, so the smallest claimed structures are near the spatial-resolution limit and should receive a window-size / resolution-sensitivity test.

The 0.1 s frame-pair interval gives 60 samples per 10 rpm rotation period. Temporal sampling is less immediately restrictive for the reported band \(\omega^*\leq4\) than the spatial averaging and motion-registration questions.

## 4. Measurement map and reverse-map limit

The source-supported observation chain is:

`ordinary He II vortex-core configuration`
`-> tracer-vortex interaction and particle decoration`
`-> finite laser-sheet intersection`
`-> camera projection`
`-> 64-pixel PIV window over a 0.1 s pair`
`-> planar velocity components u_x(x,z,t), u_z(x,z,t)`
`-> spatial spectra and median energy summaries`

Each stage is lossy. A single planar velocity field does not uniquely determine the full three-dimensional vortex configuration. The later spectral aggregation also discards phase and much local spatial information. The CryoLEM apparatus can support multiple views and 3D measurements, but this particular preprint does not report a synchronized multi-view 3D reconstruction.

The conventional He II quantum-vortex core is a physical defect in the superfluid medium. Its ordinary spacetime history must not be identified with an H(s)H/SAT worldtube. No H(s)H object, embedding, projection map or physical equivalence is established by this experiment.

## 5. Model result versus observation

The preprint reports an increase in high-frequency spectral energy above approximately 30 mW. Its simplified Donnelly-Glaberson estimate gives \(P_{DG}=31.4\) mW. The nominal 4.5 percent difference between these rounded values is not a statistical agreement test: the observed onset is approximate and the model has no reported complete uncertainty budget.

The threshold estimate uses source-reported fluid properties and a model-dependent geometric factor \(r=1.36\), associated with a Poiseuille/plug-profile approximation. The vortex-line-tension parameter is itself model-derived from \(\kappa\), \(\log(a_m/a_0)\), and the assumed intervortex scale. The supplement says mutual friction is omitted, discusses tilted-wave instabilities that may lower the threshold substantially, and explicitly leaves a quantitative explanation of the observed threshold for future work.

The spectral anisotropy and high-frequency behavior are interpreted as supporting an emergent Kelvin-wave ensemble. They are not a direct reconstruction of individual three-dimensional vortex-core histories. The paper itself calls for further tests.

**CODATA:** no CODATA comparison was made. The circulation quantum and helium properties used here are the values reported or cited by the paper; they are not represented as a CODATA 2022 adjustment. No CODATA numerical substitution or comparison is warranted without a separate versioned evaluation, covariance and uncertainty audit.

## 6. Falsifiable next acquisition

Before treating this as a usable P2 dataset, obtain:

1. Raw image sequences, per-run PIV vectors, quality masks and exact processing parameters.
2. Per-run rotation, temperature, heater-power and heat-flux logs, including calibration and covariance.
3. Frame-synchronous cell-window / fiducial tracks and the residual after rigid-body registration.
4. Tracer size, loading, attachment, detachment and response information.
5. Any synchronized orthogonal camera views needed for a 3D reconstruction.

Then freeze the PIV processing and frequency bands, hold out **whole experimental runs** rather than PIV windows, and test the threshold and spectral-anisotropy predictions across independent \(\Omega\) and \(T\) settings. A no-heat rotating control and a fiducial-registration ablation should precede any interpretation of the \(\Omega\) and \(2\Omega\) peaks as fluid modes.

## 7. Disposition

`PUBLIC_PREPRINT_VERIFIED / APPARATUS_CROSS_REFERENCE_VERIFIED / RAW_2026_PIV_DATA_NOT_RETRIEVED / POTENTIAL_MOTION_SYSTEMATIC_IDENTIFIED / ROTATION_ONLY_SCALE_UNCERTAINTY / P2_CANDIDATE_ONLY`.

No physical fit, independent validation, CODATA comparison, H(s)H prediction, theory amendment or P2 selection is performed. The rope-contact and 3He-B finite-size studies remain separate physical systems in the existing issue #1643. No WWRD climbing-rope equivalence is asserted.
