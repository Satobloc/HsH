# Cylinder-wake lock-in dataset | source-admission note

**Run key:** REVROT3-19-20261011:1081:s2  
**UTC slot:** 2026-11-25 01:24Z  
**Classification:** MEASURED_EXPERIMENT / SUPPORTING_COMPARATOR / NOT_P2_ADMITTED

## Finding

A new-to-the-current-HsH-register experimental dataset is available for a controlled, acoustically forced cylinder wake. It is useful as a measured forcing-response and vortex-mode comparator. It is **not** a direct finite-core, reconnection, inspiral, or H(s)H worldtube measurement.

The source is Jankee, Yadala, Æsøy, Dawson & Worth, “Scaling and dynamics of vortex lock-in for circular cylinders in an oscillating flow,” *Journal of Fluid Mechanics* 1002, A37 (2025), DOI [10.1017/jfm.2024.1122](https://doi.org/10.1017/jfm.2024.1122), published online 2025-01-07. The article is open access under CC BY 4.0.

The replication dataset is [DataverseNO DOI 10.18710/BSTYXU](https://doi.org/10.18710/BSTYXU), version 1.0, published 2025-01-07, deposited 2024-11-14, classified by the repository as **Experimental**, and released under CC0 1.0. Exact-DOI and title searches in the current HsH repository returned no prior record.

## Dataset manifest

Repository metadata lists four public files. The checksums below are repository-declared MD5 values; they have **not** been recomputed from downloaded bytes in this run.

| File | Persistent file DOI | Size | Repository MD5 |
|---|---|---:|---|
| 00_README.txt | [10.18710/BSTYXU/DOFABS](https://doi.org/10.18710/BSTYXU/DOFABS) | 3,956 B | 08176da7effb47ddeb9d0e70a1ae4959 |
| 01_SampleCode_to_loadData.m | [10.18710/BSTYXU/NHF4ZN](https://doi.org/10.18710/BSTYXU/NHF4ZN) | 1,366 B | 6f2b8089162d2223110bd652a94bec31 |
| LockIn_points.txt | [10.18710/BSTYXU/BH0Y3B](https://doi.org/10.18710/BSTYXU/BH0Y3B) | 10,809 B | 47407e6d9ba0e8d0b2563c1a3be19454 |
| PIV-fef0_1.4.zip | [10.18710/BSTYXU/KBIKGI](https://doi.org/10.18710/BSTYXU/KBIKGI) | 3,007,450,303 B | 7f7f0f336e5b58ef769090cc039bb887 |

The repository landing page and file metadata were read. The README and point-list bytes were not recovered, the sample loader was not executed, and the 3.0-GB PIV archive was not downloaded. Therefore this is a metadata-and-paper admission assessment, not a data reproduction.

## Measured system and acquisition

The rig is a 700-mm-long, 35-mm-diameter acrylic pipe. A single circular cylinder is placed perpendicular to the streamwise flow; tested diameters are 1.7, 2.0, 2.4, 4.0 and 6.0 mm. The largest cylinder produces a 21.8% blockage ratio; the authors do not apply a blockage correction. Bulk velocity spans 0–17.3 m/s and cylinder Reynolds number spans 500–7,200. Natural Strouhal numbers are reported in the range 0.19–0.23.

Two loudspeakers generate longitudinal standing acoustic modes at 730, 1,460 and 2,190 Hz. The cylinder can be positioned at pressure or velocity nodes. Four wall-mounted 1/4-inch microphones, specified at 4 mV/Pa, monitor the acoustic field; the authors reconstruct pressure and acoustic velocity from cross-spectra referenced to the signal generator.

**Hot-wire channel:** a single-wire Dantec 55P11 probe is positioned in the shear layer at 4d downstream and 0.5d off the pipe centre. It is calibrated before and after acquisition with a King's-law fit using a top-hat jet over 0–30 m/s. Hot-wire and pressure signals are sampled at 51.2 kHz for 10 s and digitized at 24 bit.

**PIV channel:** a Phantom V2012 1-MP camera records planar x-y flow fields. The field of view spans approximately x/d = -2 to 8 and y/d = -3 to 3. The flow is seeded with approximately 1-µm olive-oil droplets. For each case, 6,000 double-frame image pairs are acquired at 3 kHz with inter-frame separation Δt = 40 µs. The processed vector spacing is 0.236 mm in x and y.

The paper estimates PIV correlation error at about 0.1 pixel against approximately 10-pixel particle displacement, giving about 1% displacement error and about 1% instantaneous velocity uncertainty. Linear propagation gives maximum mean-field uncertainties of approximately 3% for streamwise velocity and 2% for spanwise velocity. The time-separation error is treated as negligible. The inspected Methods section does not give a corresponding numerical uncertainty for the hot-wire calibration or microphone sensitivity.

## Measured, derived, fitted and predicted quantities

- **Measured:** hot-wire velocity time series; planar PIV image pairs and derived velocity fields; microphone pressure signals.
- **Calibrated:** hot-wire King's-law calibration before/after acquisition; microphone sensitivity; PIV spatial scale, image separation and correlation-error estimate.
- **Derived:** power spectra, natural shedding frequency, lock-in regime diagrams, velocity-field statistics, POD modes and onset points.
- **Fitted:** the proposed dimensional scaling uses 96 onset data points. Table 2 reports fitted coefficients, residuals and 95% confidence intervals. The paper then presents the reduced relation Δu/U∞ = (1/3)(fe/f0)^(-5/2) St0^(1/4) as its data-driven model.
- **Prediction/validation:** the paper compares the fitted relation with its own experimental points and with literature data. This is not an independent H(s)H prediction or a held-out H(s)H test. The 96-point fitting set must be identified before any subset is described as independent.

The PIV observations show competition between alternating 2S and symmetric 2P shedding. The authors report that the switching is random in time and that phase-locking is not meaningful when the roll-up process is not synchronized on every instance. This matters for any temporal aggregation or cross-modal join.

## Geometric and registration boundary

The available observation operators are distinct:

1. a point hot-wire time series at a fixed downstream/shear-layer location;
2. a planar x-y PIV velocity field at discrete image-pair times;
3. microphone pressure records used to reconstruct the imposed acoustic field.

The paper does not establish sample-level HWA↔PIV time synchronization or a common per-sample spatial registration in the inspected Methods section. Do not join these channels until the raw metadata or acquisition records establish a shared clock, trigger, case identifier and coordinate transform.

The PIV is planar, not volumetric. The HWA is a point readout. Neither reconstructs a full three-dimensional vortex support, finite-core boundary or four-dimensional worldtube. The cylinder is a solid body; the observed wake is a forced vortex-shedding response. No equivalence to a filament, rope, worldtube or timesheet is asserted.

A defensible future composition would need explicit maps from each instrument's native observations into a shared case/time/coordinate frame, with stated domains and calibration uncertainties. Those maps are not yet available from the metadata-only read.

## Internal-source and Mersearch status

Exact DOI/title searches returned no match in the current HsH repository or SAT theory archive. All four canonical Mersearch request lanes were already occupied, so no new request was submitted, overwritten or retriggered. This is bounded GitHub repository search plus public-source review, **not** a Mersearch result.

## Admission decision and next gate

**Status: supporting measured comparator; not a selected P2 system and not an H(s)H validation.**

It is promising for a controlled study of periodic forcing, response thresholds, mode competition and measurement-operator limits. It is less direct than the existing superfluid reconnection and inspiral candidates for finite-core/contact/inspiral geometry.

Before any calculation:
1. retrieve 00_README.txt, LockIn_points.txt and the MATLAB loader through the official DataverseNO API;
2. verify their bytes against the repository MD5 values and inspect the PIV archive manifest before downloading the 3.0-GB payload;
3. map cases, units, coordinate conventions, sampling windows and the 96 points used in the published regression;
4. establish whether HWA, microphone and PIV records share triggers or are separate acquisitions;
5. define a genuinely independent held-out condition or obtain a new measurement before treating a threshold as predictive.

No data bytes were analyzed, no fit or physical calculation was performed, no Lean build was run, and no H(s)H equation or theory status was changed.

## Sources

- Jankee et al. (2025), JFM 1002 A37, [article DOI](https://doi.org/10.1017/jfm.2024.1122).
- [DataverseNO dataset DOI 10.18710/BSTYXU](https://doi.org/10.18710/BSTYXU), version 1.0, CC0 1.0.
- [DataverseNO dataset landing page](https://dataverse.no/dataset.xhtml?persistentId=doi:10.18710/BSTYXU).
