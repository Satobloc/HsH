# Open-data comparator: free-surface profilometry with subsurface PIV

**Status: SOURCE-REVIEWED CANDIDATE ONLY.** This note adds a reproducibility-oriented comparator to the open P2 geometry docket. It does not select a P2 system, validate H(s)H/SAT, or report an independent physical measurement.

## Primary source

Ali Semati, Adharsh Shankaran, Benjamin K. Smeltzer, Eirik Æsøy, R. Jason Hearst, and Simen Ådnøy Ellingsen, “Free-surface profilometry for complex flows,” *Experiments in Fluids* 67, article 120 (2026), published 28 July 2026. DOI: [10.1007/s00348-026-04242-x](https://doi.org/10.1007/s00348-026-04242-x). The article is open access.

The experiment combines Fourier-transform profilometry (FPP) for free-surface elevation with planar particle-image velocimetry (PIV) for subsurface velocity. A point laser-induced-fluorescence (LIF) measurement is used as a separate surface-height validation channel. The reported systems include wave generation, a cylinder wake interacting with waves, and droplet impact.

## Public data and code

The authors' dataset is DataverseNO, DOI [10.18710/MWEHEM](https://doi.org/10.18710/MWEHEM), version 2.0, published 6 July 2026. The repository lists eight public files under a CC0 1.0 dedication. Its description includes raw profilometry-image sets from three wave-generation concentrations (4, 12, and 25 mg/L), images for vortex-wave interaction, and processed surface-elevation and velocity-field data for cylinder-wake experiments.

The eight listed files total approximately 18.6 GB. Two small files are particularly useful for a first metadata/reproduction pass: FPP_validation.nc (250.1 KB) and AttenuationLength.nc (19.2 KB). Larger image sets are multi-gigabyte; the processed cylinder-wake files are approximately 492.6 MB and 545.8 MB. File-level MD5 values are listed by DataverseNO. The dataset metadata is public, but this review did not obtain or inspect the file bytes.

The associated code repository is [asemati/FTProfilometry](https://github.com/asemati/FTProfilometry), with an MIT license. Its README specifies MATLAB R2024b or newer plus the Image Processing Toolbox and Computer Vision Toolbox. The code is for FPP surface-elevation reconstruction; it is not a complete PIV-processing pipeline. The article reports using LaVision DaVis 11.0 for PIV processing. The dataset description does not explicitly promise the raw PIV particle-image stacks, so end-to-end PIV reprocessing is not yet established.

## Measurement and uncertainty notes

The article describes FPP and PIV as synchronized, but they are not the same observable or spatial domain: FPP reconstructs a surface-height field; PIV reconstructs velocity on a subsurface plane. The reported PIV plane is 2 cm below the quiescent surface for the cylinder-wake case and 1 cm below for the droplet-impact case. This is planar PIV, not volumetric 4D-PTV.

For validation, the point-LIF spot and FPP locations are separated by about 4 mm, so the comparison interpolates between nearby FPP points rather than comparing identical spatial samples. At 12 mg/L the article reports an 18 μm mean absolute error; localized errors can reach about 160 μm near regions affected by wall reflections and interpolation. The article also notes temporal-aliasing limitations in a 15 Hz droplet-impact measurement.

The paper's approximate 12 μm error floor can be checked from its reported scales. Under an independent-Gaussian interpretation, using an 8 μm FPP noise scale and a 13 μm LIF ±1-pixel scale gives

\[
\sqrt{2/\pi}\sqrt{8^2+13^2}=12.18\ \mu\mathrm{m}.
\]

This reproduces the order of the reported floor. It is an arithmetic check on published values, not a raw-data reanalysis. The 13 μm quantity is reported as ±1 pixel, not separately characterized as a standard deviation, so the Gaussian interpretation is an assumption rather than a verified uncertainty model.

## Comparison with the volumetric vortex-ring candidate

Han et al. (2026), “Simultaneous free-surface and 3D flow measurements of a vortex ring in head-on collision with the air-water interface,” *Experiments in Fluids* 67, article 91, DOI [10.1007/s00348-026-04256-5](https://doi.org/10.1007/s00348-026-04256-5), reports stereoscopic free-surface measurement paired with volumetric 4D-PTV (three spatial dimensions plus time). Its supporting data are available from the corresponding author upon reasonable request; the listed supplement is a GIF, not the raw measurement package.

The two studies are different experiments and are not interchangeable. Semati et al. is stronger for open data and accessible FPP validation, but its PIV is planar and the full raw PIV acquisition package is not established. Han et al. is higher-dimensional on the subsurface-flow side, but its raw data are not openly deposited in the publisher record.

## Formalization and interpretation boundary

A source-faithful formalization target is the wrapped-phase observation: a phase measurement is periodic modulo \(2\pi\), hence is not injective on all real phases. Unique height reconstruction therefore depends on phase unwrapping, a known reference/anchor, and the pixel-dependent calibration map. This is a mathematical property of the measurement pipeline, not an H(s)H theorem. No source-specific Lean module or build is claimed in this note.

The measured water surface is not automatically an H(s)H timesheet, the subsurface velocity field is not automatically a new theoretical medium, and the laboratory's planar PIV/FPP maps do not establish a worldtube/timesheet equivalence. Any future comparison needs explicit source-defined domains, calibration maps, coordinate registration, acquisition units, uncertainties, and held-out observations.

## P2 disposition

This is an additional source candidate for [P2 issue #565](https://github.com/Satobloc/HsH/issues/565), not a system selection or a gate advancement. No raw-data calculation, fit, prediction, independent measurement, H(s)H/SAT validation, or theory promotion was performed.
