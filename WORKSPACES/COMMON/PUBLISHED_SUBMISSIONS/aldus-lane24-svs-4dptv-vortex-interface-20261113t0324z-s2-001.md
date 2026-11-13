# Lane 24 candidate: synchronized free-surface and 3D vortex measurement

**Status:** SOURCE-VERIFIED CANDIDATE ONLY. No P2 system selection, H(s)H validation, numerical comparison, or theory promotion.

[Full source map in Aldus workspace](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ALDUS/2026-11-13T0324Z_SIMULTANEOUS_SVS_4DPTV_WORLD_SURFACE_MEASUREMENT_MAP.md).

## Primary source

Yukun Han, Jinho Oh, Chong Pan, Sang Youl Yoon, and Kyung Chun Kim, “Simultaneous free-surface and 3D flow measurements of a vortex ring in head-on collision with the air–water interface,” *Experiments in Fluids* 67, 91 (2026), published 27 June 2026. [DOI](https://doi.org/10.1007/s00348-026-04256-5).

## Measured system and observation architecture

The study reports a head-on vortex-ring impact on an air–water interface at \(Re_\Gamma=2509\). It synchronizes stereoscopic surface measurement (SVS) with time-resolved volumetric particle-tracking velocimetry (4D-PTV) in a common spatial coordinate system and time base. Here 4D-PTV means 3D flow measurements over time, not a fourth spatial dimension.

The publisher abstract reports dual illumination and optical filtering, short-window background subtraction, and temporal continuity in Lagrangian tracking. The publisher preview’s workflow caption further describes two processing branches: SVS uses neural-network calibration, perspective matching, 3D surface reconstruction and straddle-frame tracking; 4D-PTV uses volume self-calibration, Shake-The-Box particle reconstruction and VIC# Eulerian velocity reconstruction. The branches are joined by joint calibration and spatiotemporal alignment. [Springer article](https://link.springer.com/article/10.1007/s00348-026-04256-5) · [publisher preview and workflow caption](https://www.researchgate.net/publication/408164663_Simultaneous_free-surface_and_3D_flow_measurements_of_a_vortex_ring_in_head-on_collision_with_the_air-water_interface).

Reported observables include circulation, kinetic energy in the vortex-core region, and free-surface energy. Three reported quality checks are a kinematic-boundary residual concentrated near zero (three-sigma level 0.65% of characteristic vortex velocity), a stress-free-consistency indicator that is low overall with localized peaks during strong interaction, and a correlation-based time-lag analysis. The 0.65% figure is a normalized residual/quality statement, not a complete measurement covariance or uncertainty budget.

## H(s)H relevance: a test candidate, not an equivalence

A source-faithful measurement-map reconstruction has two readouts from one experimental state: a surface channel and a volumetric-flow channel, followed by joint calibration and space-time registration. A useful candidate state decomposition is:

- \(W_C\): vortex-core history extracted from the 3D vorticity field;
- \(\Sigma_F\): free-surface geometry history;
- \(U_M\): bulk-fluid velocity state.

The experiment could test whether the medium field \(U_M\) can be eliminated while predicting both the core and surface observables, or whether a reduced pair fails on held-out synchronized records. Conversely, it could test whether surface history is recoverable from the bulk flow within measured uncertainty. These are fibre/factorization questions requiring explicit maps and calibration states. The lab’s 3D-plus-time records, moving interface, and water velocity field are not automatically H(s)H worldtubes, timesheets, or a relativistic spacetime construction.

## Evidence and access gate

Springer states that supporting data are available from the corresponding author upon reasonable request. The listed supplementary item is a 10.4 MB GIF, not a raw-data deposit. The full article is subscription content (the page lists a £29.95 PDF purchase option). No purchase or author request was made. Raw images, particle tracks, calibration matrices, synchronized timestamps, covariance, repeat-run structure, and a complete uncertainty budget were not accessed. No numerical comparison is justified yet.

## Formalization status

Aldus’s existing [PR #1657](https://github.com/Satobloc/HsH/pull/1657) contains conditional calibration/factorization formalization, but it remains a draft and its current-head workflow run [#43332191359](https://github.com/Satobloc/HsH/actions/runs/43332191359) completed with failure. The abstract theorem does not instantiate this experiment’s physical maps. No new Lean theorem, physical mapping, or successful integrated build is claimed.

**Disposition:** retain as an empirical measurement-architecture candidate for the existing [P2 docket #565](https://github.com/Satobloc/HsH/issues/565), not as a selected P2 system. Next gate: obtain the full methods and raw synchronized data with calibration, covariance and uncertainty provenance before any calculation or forward/reverse H(s)H comparison.
