# Source-custody note: CODATA 2022 and a finite-core air-water vortex

**Date:** 2026-11-04  
**Run key:** REVROT3-19-20261011:576:s2  
**Status:** Public-source provenance and formalization audit only. Not an H(s)H interpretation, physical calculation, prediction, paper submission, or theory promotion.

## 1. CODATA version and adjustment

The NIST Reference on Constants, Units, and Uncertainty currently identifies the 2022 CODATA set as the latest recommended values. Its web version is 9.0, dated 2024-05-09. The full adjustment paper is Mohr, Newell, Taylor, and Tiesinga, "CODATA recommended values of the fundamental physical constants: 2022," Journal of Physical and Chemical Reference Data 54, 033105 (2025), DOI https://doi.org/10.1063/5.0279860. It was published online 2025-09-16 and considers data available through 2022-12-31.

The overall 2022 least-squares adjustment combines 133 input data with 79 adjusted constants (54 degrees of freedom). Before uncertainty expansion, chi-squared was 109.6, with an estimated chance probability of 0.001%; eight inputs accounted for about 70% of that value. The evaluation applied expansion factors of 1.7 to specified transition-energy/theory-correction inputs and 2.5 to six inputs related to alpha. The final adjustment reports chi-squared 44.2, p = 0.83, and Birge ratio 0.90. This is an evaluated adjustment over heterogeneous inputs and observational equations, not one direct measurement.

### Newtonian constant G is a special case

The paper treats G separately because it is independent of the other adjusted constants. Its recommended value is a weighted mean of 16 measured values. There were no changes or additions to those G inputs after the 2018 adjustment closing date, so the 2022 recommended G is the same as the 2018 value. The same 3.9 uncertainty expansion factor is retained. The paper reports chi-squared 12.9 for 15 degrees of freedom, p = 0.61, and Birge ratio 0.93.

The 16 inputs are heterogeneous: fiber and strip torsion balances in dynamic or compensation modes, suspended-body displacement, stationary-body weight change, a double atom-interferometer gravity gradiometer, and a cryogenic torsion balance. Three pairs have nonzero reported correlations:

- r(NIST-82, LANL-97) = 0.351
- r(HUST-05, HUST-09) = 0.134
- r(HUST-09, HUSTT-18) = 0.068

**Use constraint:** CODATA G is an evaluated aggregate of those inputs, not a new independent 2022 experiment. A later comparison must preserve the input correlations and the 3.9 expansion choice, and must not count the recommended value as independent of its constituent experiments. For other constants, the paper carries covariances for correlated inputs and uses observational equations containing theoretical corrections. The adjustment model and evaluation choices belong in the provenance record before numerical comparison.

## 2. Measured finite-core system: classical air-water vortex

Barckicke, Falcon, and Gissinger, "Kelvin wave propagation along vortex cores," Nature Physics (2026), DOI https://doi.org/10.1038/s41567-026-03175-w, report a controlled classical air-water vortex experiment.

The apparatus is a 50 cm x 50 cm x 50 cm tank containing a 21 cm-diameter, 45 cm-high Plexiglas cylinder around the vortex. Two pumps feed four symmetric bottom inlets around a 4-10 mm drain. A 14 cm annulus is immersed 3 cm below the top free surface and driven horizontally over 1-6 Hz. The vessel is stationary; water injection generates circulation. The vortex is typically about 40 cm tall, with an air-core radius increasing from roughly 1 mm near the drain to roughly 2 mm halfway up.

### Geometry and acquisition

An optical camera normal to the vortex axis measures opposing contours at theta = 0 and theta = pi. They define two readouts:

- core radius: a(z,t) = [r(z,t,0) + r(z,t,pi)] / 2
- horizontal core displacement: eta(z,t) = [r(z,t,0) - r(z,t,pi)] / 2

For the spatiotemporal spectra, the camera records a 12.5 cm axial window at 300 frames/s for 30 s. Pixel pitch is 60 micrometres/px; contour width is about 0.5 mm; stated typical uncertainty in core radius and position is about 0.1 mm.

PIV uses 10 micrometre hollow-glass tracer particles, a laser sheet, and a 6,000 fps camera. The reported velocity field is a 37 x 23 grid at 2.7 mm spatial resolution. The azimuthal velocity profile gives circulation Gamma = 2 pi r v_theta(r), with typical uncertainty about 0.005 m^2/s. PTV tracks 1.5 mm expanded-polystyrene particles along the core to measure vertical velocity, with typical uncertainty about 0.05 m/s.

### Fit versus prediction

The authors first use the measured mean core radius a0, then fit Gamma and vz to the dispersion data, and afterward check whether those fitted values are consistent with PIV and PTV measurements. The dispersion overlay is therefore fit-conditioned, not a blind prediction on an untouched holdout. The paper notes axial variation of a(z), uses a local treatment for the dispersion analysis, and identifies global stability analysis or direct numerical simulation with realistic boundaries as future work.

Figure 1 is an apparatus schematic, not an H(s)H geometry plot. The laboratory system is a classical water-air vortex. Discussion analogies to quantum turbulence and tornado dynamics do not turn this into a quantum-vortex or tornado measurement. No rope universality or WWRD equivalence follows.

### Dataset custody

The paper states that supporting data, including the spatiotemporal spectra, are available through Figshare DOI https://doi.org/10.6084/m9.figshare.30903347. Direct DOI and API retrieval attempts in this run returned no usable metadata or file listing. The raw dataset, dataset version, file inventory, and checksum were not independently verified. This is not evidence that the dataset is absent; it is an unresolved retrieval step.

## 3. Existing HsH formalization and current CI result

The P2 docket already lists this experiment as a candidate, not a selected system: https://github.com/Satobloc/HsH/issues/565. No duplicate issue was created.

Existing Kestrel PR #873, head 1ddda3876954068855d802c8699956dfa3527029, contains KestrelKelvinVortexReadout.lean. The module formalizes the two-contour map from (r0,rpi) to (a,eta), its inverse, and the fact that one side alone is non-injective. Actual Lean 4.34.0 Actions run #41690832586 replayed that module successfully; its #eval checks produced exact rational outputs for encoded rounded quantities, and its reported theorem dependencies were the standard propext, Classical.choice, and Quot.sound axioms. No sorryAx was reported for that module.

The overall PR build failed, however, in KestrelMovingSlice.lean at lines 114 and 125 with unsolved goals; two moving-slice theorem reports also included sorryAx. PR #873 remains open/draft and unmerged. Thus the existing readout algebra has a successful module-level Lean run, but the full PR does not have a green build. Lean checks the formalized algebra only; it does not validate camera calibration, the physical model, data provenance, or any H(s)H interpretation.

No new Lean file, branch, PR, or code change was made in this run.

## 4. Internal archive and tool status

The current Mersearch guide specifies pinned stable 1.0 (mersearch-stable-1.0, commit 89933c358b67ccbfbbaa680aadeb1f35d22d91b2) and four request lanes. All four lane request files are presently marked requested; their request-scoped output directories are absent. No local three-repository checkout exists in this runtime, and no new request was submitted or occupied lane overwritten. Existing compact Morrow Mersearch results were read, but they are not exhaustive raw results. This note therefore makes no claim of a new Mersearch search or exhaustive internal SAT/H(s)H source coverage.

No SAT-O or Blockwave equation was recovered, transcribed, or corrected here. No private HSH_RESOURCES path or content is used in this public note.

## 5. Disposition

This is a source-custody and formalization-status note only. No physical calculation, CODATA-to-H(s)H numerical comparison, fit, prediction, theory integration, BEDROCK change, or paper-gate advancement was performed. The next empirical step is to retrieve and checksum the Figshare files and metadata before any data-level calculation. The next formal step, if separately authorized, is to preserve the existing readout module's successful result while resolving the independent KestrelMovingSlice build failures.
