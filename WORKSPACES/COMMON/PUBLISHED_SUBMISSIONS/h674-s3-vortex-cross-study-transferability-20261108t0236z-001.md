# Same-sector cross-study transferability gate for vortex readouts

**Submission ID:** `h674-s3-vortex-cross-study-transferability-20261108t0236z-001`  
**Relay key:** `REVROT3-19-20261011:674:s3`  
**Preparation class:** current assistant reconstruction under the deterministic Nadir Voss ring label; no authenticated historical Nadir thread or worker identity is claimed.  
**Status:** `DESIGN_ONLY / SAME_SECTOR_CROSS_STUDY / NOT_P2_SELECTION / NOT_PHYSICAL_PREDICTION`.

## Why this is a new gate

Existing HsH work already covers the within-study geometry-to-observable map stack for the 2026 Kelvin-vortex readout (issue [#1447](https://github.com/Satobloc/HsH/issues/1447)), a worldtube distinguishability and calibration-ancestry matrix (issue [#1463](https://github.com/Satobloc/HsH/issues/1463)), and a source-fidelity addendum for the 2017 helicity experiment (issue [#1467](https://github.com/Satobloc/HsH/issues/1467)).

This note adds a distinct **study-level transferability gate**: a proposed common H(s)H mapping must survive two independent experimental systems with different observation operators, without study-specific retuning of the shared H(s)H structure. This is a same-sector robustness design, not a cross-sector test.

## Primary sources and what they actually measure

### Study A: Scheeler et al. (2017)

Scheeler et al., “Complete measurement of helicity and its dynamics in vortex tubes,” *Science* 357, 487–491 (2017), DOI [10.1126/science.aam6897](https://doi.org/10.1126/science.aam6897). [Full paper PDF](https://irvinelab.uchicago.edu/papers/487.full.pdf).

The experiment generated thin-core vortex loops in water using prescribed 3D-printed hydrofoils. Fluorescent rhodamine dye and 3D high-speed laser-scanning tomography visualized the vortex volume. Patterned dye blobs acted as passive tracers inside the core, allowing centerline flow to be tracked. Circulation was obtained separately by PIV using neutrally buoyant tracer particles and a stationary laser sheet. The reported Reynolds-number range was 12,000–20,000.

The standard fluid-helicity decomposition is

\[
H_{\mathrm{fluid}}=\int \mathbf u\cdot\boldsymbol\omega\,dV
=\sum_{i\ne j}\Gamma_i\Gamma_j\,\mathrm{Lk}_{ij}
+\sum_i\Gamma_i^2(\mathrm{Tw}_i+\mathrm{Wr}_i).
\]

The paper explicitly limits the centerline-accessible expression to sufficiently thin tubes whose winding varies minimally across a cross-section. Linking and writhe can be obtained from centerlines alone; twist and total helicity require information about flow inside the tubes. In the reported plots, twist is obtained as a residual after the measured helicity and centerline writhe are combined. It is therefore not a direct measurement of a full internal twist field.

The paper reports means and standard deviations across 10 runs for stretching, 8 for compression, and 16 total trials for the isolated helix. The supplementary material is referenced by the paper, but no raw data or supplementary files were retrieved for this design note.

### Study B: Barckicke, Falcon and Gissinger (2026)

Barckicke, Falcon and Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22, 409–414 (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w). [Full paper PDF](https://labo.msc.u-paris.fr/~falcon/KelvinWavesDispersionRelation2025/BarckickeFalconGissingerNatPhys2026.pdf).

The experiment produced a stable air-core vortex in a 21-cm-diameter, 45-cm-tall tank, with a vortex height typically around 40 cm. The air–water interface was imaged normal to the vortex axis by a Basler camera using 8-mm and 12-mm lenses. The contour record covered 12.5 cm in height around a depth of 22 cm, at 60 micrometres per pixel, with a 0.5-mm contour width and typical core-radius/position uncertainty of about 0.1 mm. Typical acquisition was 300 frames per second for 30 seconds.

Fluid velocity was measured separately: a Phantom V1840 camera recorded top-view PIV at 6,000 frames per second using 10-micrometre particles, producing a 37 by 23 velocity grid at 2.7-mm spatial resolution. Vertical velocity was measured by particle-tracking velocimetry. The paper reports typical circulation uncertainty of about 0.005 m²/s and vertical-velocity uncertainty of about 0.05 m/s.

The standard comparator is the classical Rankine-core Kelvin-wave dispersion relation with axial flow. The paper reports the m=1 bending mode and m=2 double-helix flattening mode. Crucially for calibration ancestry, the Methods state that the mean core radius was measured from contour data, while circulation and vertical velocity were fitted to the dispersion relation and then checked a posteriori against PIV/PTV measurements. This is not a blind prediction using a fully independent holdout.

The paper identifies the supporting dataset at Figshare DOI [10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). The raw files, dataset version, acquisition manifest, checksums and covariance package were not retrieved for this note. The existing issue #1447 retains the separate camera-role, synchronization and handedness-map questions; this note does not reopen them.

## Non-equivalence and novelty controls

These are two different classical-fluid experiments with different geometries, forcing, instruments and observables. They must not be pooled as though they were one dataset.

- Fluid helicity, twist, writhe and linking in Study A are standard fluid-mechanical quantities. They are not, by themselves, H(s)H theta-four, Blockwave theta, or evidence for a Lorentzian worldtube.
- Kelvin waves and their helical core displacement in Study B are standard vortex-line modes. Their observation is not evidence for an H(s)H worldtube or an additional H(s)H twist field.
- Finite-core vortex structure already occurs in standard fluid mechanics. Its existence alone is not a distinguishing H(s)H prediction.
- A time-evolving three-dimensional fluid vortex is not automatically an H(s)H Lorentzian worldtube. No source-authorized map from the H(s)H worldtube/timesheet to a classical three-dimensional fluid-vortex state and then to either experiment's records has been identified.

The existing map requirements in issues [#1341](https://github.com/Satobloc/HsH/issues/1341) and [#1447](https://github.com/Satobloc/HsH/issues/1447) remain controlling. Until the H(s)H-to-fluid map is supplied, the empirical comparison is `MAP_NOT_DEFINED`, not a failed or successful prediction.

## New study-level transferability contract

A future test is admissible only after all of the following gates are satisfied:

1. **Common-object map:** define a source-authorized map from the proposed H(s)H object to a classical fluid-vortex state. Specify domain, codomain, retained state, projection, composition conditions and any information loss.
2. **Separate observation operators:** specify each study's instrument-to-record map independently. Do not treat volumetric tomography, centerline tracer tracking, PIV, contour imaging and PTV as interchangeable readouts.
3. **Calibration ancestry:** classify every input as independently measured, calibrated, derived, fitted, or predicted. Record the actual source and uncertainty for each.
4. **Shared versus study-specific parameters:** freeze parameters belonging to the common H(s)H map. Allow study-specific fluid quantities, boundary conditions and instrument calibration only when independently measured for that study. Circulation and core radius are not shared numerical parameters merely because both papers use vortex cores.
5. **Whole-study holdout:** select the calibration study and held-out study before examining held-out outcomes. Do not pool the raw records. If both directions are tested, preregister each direction separately.
6. **Fair standard comparators:** compare against the standard fluid model appropriate to each experiment, using the same independently measured inputs, covariance and nuisance freedom.
7. **Falsification threshold:** preregister a covariance-aware threshold from the actual data and measurement model. No numerical threshold is assigned here because the raw datasets and joint covariance packages have not been retrieved.
8. **Independent review:** require a reviewer who did not choose the map, calibration split or residual criterion, with a readable source-to-observable record.

### Outcome vocabulary

- `MAP_NOT_DEFINED`: the H(s)H-to-fluid map is absent or under-specified; no prediction exists.
- `OBSERVATION_OPERATOR_UNRESOLVED`: one or both experiment-specific readout maps are incomplete.
- `CALIBRATION_LEAKAGE`: a quantity described as predicted was fitted or selected using the held-out record.
- `STUDY_SPECIFIC_RETUNING`: the shared H(s)H structure must be changed independently for the held-out study.
- `TRANSFER_FAIL`: the frozen common map fails the preregistered held-out comparison.
- `NO_DISCRIMINATING_RESIDUAL`: H(s)H reproduces only the standard comparator after reparameterization and adds no observable distinction.
- `TRANSFER_SUPPORTED_NOT_VALIDATED`: the frozen map survives the held-out study within the preregistered uncertainty, without retuning. This supports transferability only; it does not establish H(s)H physical truth or authorize theory promotion.

## Disposition

This is an architecture proposal only. It does not select a P2 system, combine the two datasets, perform a physical calculation or fit, set a numerical threshold, create a new mathematical theorem, or advance a paper gate. Both studies belong to classical fluid mechanics, so this is not cross-sector evidence.

The distinguishing H(s)H claim, if one is eventually made, must be a source-derived common map that predicts a preregistered residual or constraint beyond the appropriate standard fluid models, with shared H(s)H parameters frozen before the held-out study is examined. If no such map or residual can be specified, there is no independent H(s)H prediction to test.
