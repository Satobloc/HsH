# Aldus | Lane 24 | Synchronized surface/volume vortex measurement map

**Run:** REVROT3-19-20261011:795:s2  
**Worker label:** Aldus, selected by the fixed ring; this does not authenticate a ChatGPT instance or thread.  
**Status:** SOURCE-VERIFIED EMPIRICAL CANDIDATE / NOT A P2 SELECTION / NO H(s)H VALIDATION / NO NUMERICAL COMPARISON.

## 1. Why this source is new

Yukun Han, Jinho Oh, Chong Pan, Sang Youl Yoon, and Kyung Chun Kim, “Simultaneous free-surface and 3D flow measurements of a vortex ring in head-on collision with the air–water interface,” *Experiments in Fluids* 67, 91 (2026), published 27 June 2026. [Version of record and DOI](https://doi.org/10.1007/s00348-026-04256-5).

The exact DOI/title was not found in HsH issue/code search or the SAT archive search. HSH_RESOURCES payload was not searched because its README describes a private boundary while GitHub metadata reports public visibility. A related January 2026 *Physics of Fluids* paper by the same group is already recorded in [issue #1339](https://github.com/Satobloc/HsH/issues/1339); this June 2026 paper is distinct because its stated contribution is simultaneous, registered surface and volumetric-flow measurement. Existing Lane 24 candidates remain distinct: [Aalto two-drop interaction, issue #1336](https://github.com/Satobloc/HsH/issues/1336), [rotating-fluid vortex-ring PIV, issue #1662](https://github.com/Satobloc/HsH/issues/1662), and the [P2 docket #565](https://github.com/Satobloc/HsH/issues/565).

SciSpace exact-title search did not surface this article; it returned the related January 2026 study instead. No new software or paid research service was used.

## 2. What was actually measured

The source reports a head-on vortex-ring impact on an air–water interface at \(Re_\Gamma=2509\). It integrates stereoscopic surface measurement (SVS) and four-dimensional particle-tracking velocimetry (4D-PTV) in a common spatial coordinate system and synchronized time base. In this experimental usage, 4D-PTV means 3D spatial tracking over time, not a fourth spatial dimension.

The publisher abstract reports:
- dual illumination and optical filtering to separate free-surface and underwater particle images;
- short-time-window background subtraction to suppress surface reflection;
- temporal continuity in Lagrangian tracking to identify valid underwater trajectories;
- circulation, kinetic energy within the vortex-core region, and free-surface energy as derived observables.

The publisher preview’s workflow caption describes two branches:
- **SVS:** neural-network calibration, perspective matching, 3D free-surface reconstruction, and straddle-frame tracking;
- **4D-PTV:** volume self-calibration, Shake-The-Box with iterative particle reconstruction, and VIC#-based Eulerian velocity reconstruction;
- **joint stage:** joint calibration and spatiotemporal alignment.

The article reports three dataset-quality checks: a kinematic-boundary-condition residual concentrated near zero, with a three-sigma level of 0.65% of characteristic vortex velocity; a stress-free-consistency indicator low overall with localized peaks during strong interaction; and a correlation-based time-lag analysis consistent with upward propagation of vortex-induced disturbances before direct impact. The 0.65% statement is a normalized residual/quality result, not a complete uncertainty budget or covariance matrix.

**Source access:** Springer’s page identifies the article as subscription content and lists a £29.95 PDF purchase option. Its data-availability statement says supporting data are available from the corresponding author upon reasonable request. The listed supplementary item is a 10.4 MB GIF, not a raw-data deposit. No purchase or author request was made. Raw images, particle tracks, calibration matrices, synchronized timestamps, repeat-run structure, covariance, and the complete uncertainty budget were not accessed. The full methods text was not available in the inspected sources; workflow details above that exceed the abstract come from the publisher preview’s figure caption.

Sources: [Springer version of record](https://link.springer.com/article/10.1007/s00348-026-04256-5); [ResearchGate-hosted Springer publisher preview and workflow caption](https://www.researchgate.net/publication/408164663_Simultaneous_free-surface_and_3D_flow_measurements_of_a_vortex_ring_in_head-on_collision_with_the_air-water_interface).

## 3. Assistant-reconstructed observation map

The experiment appears to have one physical laboratory state with two synchronized readout branches. A useful *candidate formalization*, not a source-authored equation, is:

\[
O_{\rm joint}
=
J\circ\langle O_{\rm SVS},O_{\rm PTV}\rangle .
\]

Here:
- \(S\) is the physical state/history of the water and moving interface;
- \(O_{\rm SVS}:S\times C_{\rm SVS}\to D_{\rm surface}\) is the surface-vision readout with its calibration state;
- \(O_{\rm PTV}:S\times C_{\rm PTV}\to D_{\rm volume}\) is the volumetric-flow readout with its calibration state;
- \(J:D_{\rm surface}\times D_{\rm volume}\times C_J\to D_{\rm joint}\) represents joint calibration, spatial registration, and temporal alignment.

The exact domains, codomains, calibration parameter spaces, and composition order must be extracted from the full methods and calibration package before this becomes a source-faithful formal model. The diagram is a reconstruction from the publisher abstract and figure caption, not an experimentally verified invertible map.

A candidate physical-state ledger is:
- \(U_M(x,t)\): measured bulk-fluid velocity field;
- \(\Sigma_F\): free-surface geometry history reconstructed from SVS;
- \(W_C\): vortex-core history extracted from the 3D vorticity field.

Important typing caution: \(W_C\) is derived from the volumetric flow reconstruction, not established as an independently measured primitive. \(\Sigma_F\) is a moving physical interface history, not automatically the H(s)H timesheet. \(U_M\) is a measured medium field, not automatically an H(s)H primitive. All are laboratory quantities in a Newtonian 3D-space-plus-time setting.

## 4. H(s)H discriminant and proof boundary

The current H(s)H working question is whether worldtube and timesheet can generate the relevant observables without an independent responsive-medium state, or whether the medium must remain explicit. This experiment is a useful candidate because it measures surface and subsurface flow simultaneously.

For a proposed reduced state \(\pi:S\to R\) and target observable \(\beta:S\to Y\), the relevant conditional criterion is:

\[
\beta=\widehat{\beta}\circ\pi
\quad\Longleftrightarrow\quad
\pi(s_1)=\pi(s_2)\Rightarrow\beta(s_1)=\beta(s_2)
\]

over the declared domain. The actual test would compare candidate reductions such as \((W_C,\Sigma_F)\), \((W_C,U_M)\), and \((\Sigma_F,U_M)\), retaining calibration state or proving it is fixed/invariant. A failure of fibre constancy beyond the measurement uncertainty would falsify that particular reduction for this experiment. It would not, by itself, establish a universal H(s)H ontology.

Aldus’s existing [PR #1657](https://github.com/Satobloc/HsH/pull/1657) contains conditional calibration/factorization formalization. It remains a draft; its current-head workflow run [#43332191359](https://github.com/Satobloc/HsH/actions/runs/43332191359) completed with failure. The abstract theorem does not instantiate this experiment’s physical maps. No new Lean theorem, integrated proof, source-specific type assignment, or successful full build is claimed.

| Direction | Current status |
|---|---|
| Forward geometry → equations | Not performed; source equations and full calibration are not accessible. |
| Reverse equations → geometry | Not performed; raw synchronized data and exact reconstruction maps are unavailable. |
| Observable prediction → independent data | Not performed; no H(s)H prediction was frozen and no raw dataset was obtained. |
| Null/falsifier result | None; this is source reconnaissance, not a test outcome. |

No CODATA constants were used. No physical calculation, parameter fit, numerical comparison, or H(s)H prediction was made.

## 5. Next evidence gate

Before any calculation or theory comparison, obtain (with appropriate authorization):
1. synchronized SVS raw images and reconstructed surface time series;
2. raw 4D-PTV images, particle tracks, and reconstructed velocity fields;
3. camera geometry, NN calibration, volume self-calibration, joint-registration transforms, and time-synchronization records;
4. spatial/temporal resolution, repeat-run structure, uncertainty budget, and covariance across the two branches;
5. definitions and data for the kinematic-boundary residual, stress-free-consistency indicator, and correlation-based time lag;
6. the full methods and governing-equation sections.

Then define a frozen core-only reduction and a medium-retaining alternative, specify explicit projection/composition maps and units, and test held-out synchronized records against uncertainty. If the data or covariance cannot be obtained, retain the study as a measurement-architecture candidate only.

**Disposition:** add as a source-grounded candidate to the existing P2 evidence queue; do not select it as the P2 system, promote a BEDROCK claim, or infer equivalence from shared geometry vocabulary.
