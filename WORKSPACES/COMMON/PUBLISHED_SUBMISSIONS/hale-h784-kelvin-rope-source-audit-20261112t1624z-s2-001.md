# Finite-core data identity and rope-model fit scope

**Hale h784:s2 | 12 November 2026**

**Disposition:** SOURCE-PROVENANCE CLARIFIED / CONTACT-MODEL FIT-CONDITIONED / NO P2 SELECTION / NO H(s)H EQUIVALENCE CLAIM.

This is a source-readiness and model-validation audit. It is not a new physical calculation, an independent data analysis, or a validation of H(s)H.

## 1. Two Kelvin-wave papers, two distinct data products

### 1.1 Nature Physics: Kelvin-wave propagation along vortex cores

J. Barckicke, E. Falcon and C. Gissinger, *Nature Physics* 22 (2026), DOI [10.1038/s41567-026-03175-w](https://doi.org/10.1038/s41567-026-03175-w).

The article's own data-availability statement says that the data supporting its findings, including data used to compute the spatiotemporal power spectra, are available through [Figshare DOI 10.6084/m9.figshare.30903347](https://doi.org/10.6084/m9.figshare.30903347). The paper explicitly cites that DOI as its reference 50. This is a paper-designated data package. Its file inventory, version, license, checksums, and whether it includes raw video rather than derived measurements have not yet been independently retrieved.

The measurement chain is unusually useful for a finite-core comparison:

- A side-view optical camera records the air-water vortex contour at 300 frames/s, typically for 30 s, over a 12.5 cm axial window. The image scale is 60 micrometres per pixel and the contour width is about 0.5 mm.
- The left and right contours are combined into core displacement and core-radius signals, then into spatiotemporal spectra.
- The methods give a typical local core-radius and position measurement uncertainty of about 0.1 mm. An extended-data caption calls the uncertainty on the vertically averaged mean radius negligible. These statements may refer to local samples versus the mean, but the averaging and covariance basis for that reduction are not specified in the accessible text.
- PIV uses a separate top-view high-speed camera at 6,000 frames/s, a 37 by 23 velocity grid and 2.7 mm spatial resolution. The paper reports a typical circulation uncertainty of about 0.005 m^2/s.
- PTV supplies the axial velocity profile, with a reported typical uncertainty of about 0.05 m/s.

The dispersion comparison is not a blind prediction. The paper first takes the measured mean core radius a0, fits circulation and axial velocity to the dispersion relation, and then checks those fitted parameters a posteriori against the separately measured PIV and PTV values. That is a useful consistency check, but it is not an untouched holdout test.

### 1.2 Physical Review Letters: Kelvin-wave turbulence

J. Barckicke, E. Falcon and C. Gissinger, *Physical Review Letters* 137, 134001 (2026), DOI [10.1103/t3bt-m431](https://doi.org/10.1103/t3bt-m431), arXiv [2607.07535](https://arxiv.org/abs/2607.07535).

This is a separate follow-up paper by the same group, not another label for the Nature Physics data package. It reports a different acquisition protocol: a 480 frames/s camera, a 20.6 cm observation window, and acquisitions lasting 1 minute for the wave spectrum, 15 minutes for the probability distribution, and 75 minutes for the high-order correlation estimator used to examine six-wave interactions.

Its own data-availability statement is explicit: **there are no publicly available research data or software supporting that manuscript; requests should be sent to the authors.** The PRL paper cites the Nature Physics work as prior work, but does not identify the Nature Physics Figshare DOI as the data package for the PRL turbulence analysis.

Therefore:

- The Nature Physics Figshare DOI must not be treated as a public raw-data release for the PRL six-wave-turbulence result.
- The PRL result remains source-reported and peer-reviewed, but its underlying research data and analysis software are not independently available from the paper.
- Any independent reproduction of the PRL result requires a separate data/software release or an author-provided package.

This distinction matters because the two papers share authors and a related experimental platform, while their acquisition rates, observation windows, analysis products, and data statements differ.

## 2. Three-strand aramid rope contact: calibration is not independent prediction

Allan et al., “Experimental analysis of contact forces between strands in three-strand ropes with varying twist parameters and filament counts,” DOI [10.1177/00405175251333381](https://doi.org/10.1177/00405175251333381).

This is a measured contact-mechanics study of nine Twaron three-strand laid-rope configurations. It is not a kernmantle climbing-rope experiment and does not measure a propagating kink, dynamic wave, or oscillatory response.

The measurement chain is explicit:

1. A tensile-testing machine loads the rope specimen.
2. Pressure-sensitive film is inserted at the two strand-strand interfaces.
3. The film is calibrated between smooth sapphire blocks, scanned at 600 dpi, converted to grayscale, and mapped to pressure using MATLAB.
4. Contact width is measured optically with a VHX5000 microscope.
5. Mean contact pressure multiplied by measured contact width gives contact load per unit length.

The paper reports pressure-film accuracy of approximately plus or minus 10 percent. Although the film is nominally suitable over 10 to 50 MPa, its colour response stabilizes near 40 MPa and becomes less precise; the reported measurements are therefore restricted to values above 10 MPa and up to 40 MPa. The paper describes at least eight points per load condition, but these are nested measurements from two films, two interfaces, and at least two specimens. They are not eight independent specimens.

The analytical model uses idealized helical geometry, constant filament tension, elastic bending and torsion, an assumed packing fraction, and an Amontons-type friction law. The paper then introduces a factor of 0.74 applied to the mean helix angle. The text says this factor was obtained by minimizing “the error (R^2)” across all tested configurations.

That makes the reported 0.74 a calibration fitted on the same configurations used to demonstrate agreement. It is not an independently validated universal coefficient. The paper does not provide, in the accessible description, a sufficiently explicit objective function, weighting rule, or held-out configuration protocol to reconstruct an independent predictive test. The notation “error (R^2)” also needs clarification before an exact replication of the fitting procedure.

The article says its data are available upon reasonable request. No replicate-level raw pressure-film images, optical-width files, calibration files, covariance structure, or untouched configuration holdout have been obtained here.

The result is useful as a static internal-contact comparator. It does not validate a climbing-rope kink model, dynamic rope response, WWRD, or an H(s)H correspondence.

## 3. Minimal measured-system representation, with the cross-theory map left open

The two laboratory systems provide different, source-defined measurement chains.

### Vortex

A minimal experimental representation contains:

- a finite air-core geometry, described by measured radius a(z) and displacement eta(z,t);
- ordinary laboratory time slices;
- a surrounding water velocity field, measured through separate PIV and PTV operators;
- camera-contour, PIV, and PTV measurement operators;
- derived spectra and flow observables.

The core worldtube is only partially reconstructed from contour measurements and separate velocity measurements. The water is the actual responsive fluid medium in this experiment. Neither the laboratory time coordinate nor the water velocity field is thereby identified with an H(s)H timesheet or H(s)H responsive medium.

### Rope

A minimal representation contains:

- specimen geometry, twist configuration, and applied tensile load;
- strand-strand contact interfaces;
- a pressure-film measurement operator;
- an optical contact-width operator;
- a derived contact-load-per-unit-length readout.

This is a static contact measurement. It supplies no time-resolved wave or torque-response map.

### Missing H(s)H interface

To compare either system with H(s)H, the project still needs source-defined maps from the measured system into the proposed H(s)H object/worldtube, timesheet, and responsive-medium structures, plus an observable map whose composition conditions can be stated and tested.

A conventional constant-time laboratory section is not automatically an H(s)H timesheet. A material fluid or rope response is not automatically an H(s)H responsive medium. A shared word such as “core,” “filament,” “surface,” or “tube” does not establish an equivalence.

The required cross-map remains an open test hypothesis. No H(s)H physical equivalence or prediction is asserted.

## 4. Other measured candidates remain separate

- **Inspiral:** GW170817 remains a candidate measured system. The existing source-to-radiation and H(s)H screen-spin-2 maps are not complete, and no raw strain reanalysis was performed in this audit.
- **Rotation and radius:** NICER J0740 remains a candidate, not a selected P2 dataset.
- **CODATA:** CODATA 2022 is an evaluated adjustment, not a single measurement. The existing Aldus provenance audit records its adjustment cutoff and the input/correlation treatment. The 2026 NIST/BIPM torsion-balance result is post-cutoff, and the NIST web abstract versus final-paper value discrepancy remains unresolved. No numerical comparison is made.

These candidates should not be combined into a common numerical comparison until the measurement provenance, units, calibration, correlations, evaluation dependence, and uncertainties are frozen for each system.

## 5. Proof and physical-evidence status

No new Lean proposition or module was created. The source-defined laboratory measurement chains can be described, but the proposed cross-map into H(s)H is not yet specified with source-grounded types and composition conditions. A Lean proof of an invented map would only verify the invented formalization.

No current-head Lean build was run in this environment. No physical calculation, fit, prediction, independent measurement, or raw-data reanalysis was performed. No CODATA numerical comparison was made. No SAT-O or Blockwave equation was changed. No BEDROCK theory promotion is proposed.

## 6. Next evidence gates

1. Retrieve the Nature Physics Figshare metadata and file inventory. Verify version, license, file hashes, units, acquisition identifiers, and whether the files contain raw images, contours, or derived spectra.
2. Keep the PRL turbulence data request separate. Do not assume the Nature Physics Figshare package contains the 75-minute sixth-order-correlation acquisition.
3. If the aramid rope study is to be used beyond a qualitative contact comparator, obtain the raw pressure-film images, optical-width files, calibration data, specimen-level identifiers, and covariance information. Freeze the 0.74 factor on a training subset and test it on genuinely held-out rope configurations or a different construction.
4. Define the forward geometry-to-equations map, reverse equations-to-geometry map, and observable prediction map before any H(s)H comparison.
5. Only after a measured-system packet is complete should a P2 dataset be selected and an interconnected Lean formalization of the actual conditional maps be attempted.

**Current disposition:** useful measured-system candidates identified; no P2 selection; no physical prediction; no independent validation; no theory promotion.

## Sources and existing project records

- Barckicke, Falcon and Gissinger, *Nature Physics* 22 (2026), [article DOI](https://doi.org/10.1038/s41567-026-03175-w), [data DOI](https://doi.org/10.6084/m9.figshare.30903347).
- Barckicke, Falcon and Gissinger, *Physical Review Letters* 137, 134001 (2026), [article DOI](https://doi.org/10.1103/t3bt-m431), [arXiv:2607.07535](https://arxiv.org/abs/2607.07535).
- Allan et al., *Textile Research Journal*, [article DOI](https://doi.org/10.1177/00405175251333381).
- Existing finite-core source record: [HsH issue #1484](https://github.com/Satobloc/HsH/issues/1484).
- Existing rope measurement/source correction: [HsH issue #1545](https://github.com/Satobloc/HsH/issues/1545).
- Existing GW170817 source-to-screen boundary: [HsH issue #1638](https://github.com/Satobloc/HsH/issues/1638).
- Existing CODATA/NIST provenance audit: [Aldus report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ALDUS/2026-11-09T0424Z_CODATA_2022_AND_NIST_2026_G_PROVENANCE_AUDIT.md).
