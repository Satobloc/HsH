# P2 candidate note: HPD 3He-B soliton spectroscopy as a measured-system benchmark

**Status:** candidate only; no P2 selection, H(s)H prediction, fit, or physical calculation.

## Finding

A new, unusually useful measured-system candidate is the 2018 homogeneously precessing domain (HPD) experiment in superfluid 3He-B. The 2024 paper by Zavjalov, Savin, Sergeicheva and Hakonen reports roughly 600 measurements, with oscilloscope records, spectrograms and extracted oscillation modes. The associated Zenodo record is open and lists 8.2 GB across four files.

This is a stronger access candidate than an author-request-only dataset, but it is not automatically the better geometry experiment: its most useful soliton geometry is inferred from spectra and simulations, not directly imaged.

## What is measured, and what is inferred

The experimental chain is:

1. CW NMR excitation and a calibrated magnetic-field sweep.
2. Lock-in NMR signal plus parallel digital-oscilloscope time series.
3. Fourier spectrograms and symmetric sidebands around the NMR carrier.
4. Extracted mode frequencies Ω as functions of frequency shift δω, temperature, field gradient and RF-field amplitude.
5. Physical interpretation of some localized modes as oscillations of ϑ-solitons.

The paper writes the 3He-B order parameter as A_aj = R_aj(n̂, ϑ) exp(iφ), where R is a 3D rotation matrix. Its ϑ is the order-parameter rotation angle, not the H(s)H θ₄ variable.

The standard comparator is the nonlinear Leggett spin/order-parameter dynamics, with Leggett–Takagi relaxation for the HPD steady state, plus numerical 1D ϑ-soliton simulations. For low-temperature modes the reported relation is Ω² = S_LT(δω − δω₀). For the two common high-temperature modes, the proposed circular-membrane interpretation gives Δ_n = a_n C/r, with Bessel zeros a₁ = 2.405 and a₂ = 5.520, hence a₂/a₁ ≈ 2.295. The authors report that the measured gap ratio is close to this value. The membrane interpretation is a model inference, not a direct image of a membrane.

## Data provenance and access

- Primary paper: Zavjalov et al., *Journal of Low Temperature Physics* 214 (2024), 385–398, DOI 10.1007/s10909-024-03051-y.
- Dataset: *HPD experiments — DryDemag cryostat, Low-temperature laboratory, Aalto University, Finland, 2018*, Zenodo DOI 10.5281/zenodo.8431264.
- Zenodo record: https://zenodo.org/records/8431264
- Four published file parts and publisher-provided MD5 values:
  - data2018_dd_hpd_1.tgz, 2.1 GB, eabdfb00b7f948c8036866b035993386
  - data2018_dd_hpd_2.tgz_aa, 2.1 GB, c72cde20703637978f0a1536d5fcf6b9
  - data2018_dd_hpd_2.tgz_ab, 2.1 GB, 03375d26708b7bbc8d9992e4cffb9a2b
  - data2018_dd_hpd_2.tgz_ac, 1.9 GB, 6722c2d6a3f287214897ba0b1219cdf9
- Access state: public/open metadata and file manifest verified; raw bytes not downloaded and no local checksum recomputed.
- License state: the Aalto portal labels the dataset CC-BY-4.0, but the canonical Zenodo record's displayed License field is blank. Treat reuse permission as unresolved until the record or depositors confirm it.
- Citation metadata: the Aalto portal's displayed citation DOI says 8431263, while its access link, Lancaster record, the article's Data Availability section and the canonical Zenodo record point to 8431264. Use 8431264 as the dataset record; preserve the portal discrepancy as a metadata defect.

## Measurement conditions and uncertainty limits

The paper reports 25.7 bar, 34.67 mT, a cylindrical cell 7.8 mm in diameter and 9 mm long, field homogeneity 1.5×10⁻⁴ (about 5 μT variation across the cell), field gradients from 0 to 20 μT/cm, RF amplitudes including 238, 297 and 357 nT, and a field sweep rate of 0.807 μT/s.

Important limits are not optional footnotes:

- The temperature correction and thermometry accuracy are about 0.1 T_c; the sample also overheats by about 0.2 T_c during strong excitation.
- Field inhomogeneity limits the absolute δω calibration; relative changes are described as accurate.
- The actual field profile and HPD growth are not fully defined.
- The high-temperature localization point is assumed when assigning the frequency-shift origin.
- Modes 3 and 4 are not confirmed; modes 7 and 8 have too little visibility for confident classification.

The approximately 10 μm dipolar core scale and 0.15–0.5 mm magnetization scale are 3He-B quantities. They are not H(s)H worldtube thicknesses.

## The H(s)H bridge is not defined

The current HsH BEDROCK working definition treats θ₄ as the angle between the filament tangent and the local time-surface normal. The 3He-B paper's ϑ is the rotation angle in a matrix-valued spin/orbital order parameter. Shared Greek lettering and soliton vocabulary do not establish a physical equivalence.

A test requires two source-defined maps:

1. A typed state map from the H(s)H variables (including θ₄ and any declared worldtube/timesheet structure) into the 3He-B state variables (R, n̂, ϑ, φ, and spin S), with domain, units, symmetry action, boundary conditions and dynamics.
2. A readout map from that mapped state to the actual NMR signal/spectrum, including instrument transfer and calibration.

Neither map is presently established in the controlling sources. The 3He-B dataset is therefore a candidate analogue and a measurement-pipeline benchmark, not evidence for H(s)H and not yet an H(s)H test.

## Candidate-admission architecture

Do not collapse candidate quality into one score. Track five independent axes:

- **D — data access:** metadata, raw bytes, file integrity, calibration records.
- **G — geometric observability:** direct spatial measurement, inferred geometry, or spectral-only observables.
- **M — model-map closure:** source-defined map from H(s)H state to physical state and instrument readout.
- **U — uncertainty closure:** units, calibration, covariance, nuisance parameters and dependence structure.
- **C — comparator closure:** standard model, shared parameters, frozen calibration, holdout and pre-registered rejection rule.

Admission for a particular claim requires M, U and C to close, with D and G adequate for that claim. A dataset can be highly accessible but geometrically indirect; another can be geometrically rich but inaccessible. These are different constraints, not a single ranking.

Applied comparatively:
- HPD 3He-B is promising for temporal soliton-mode spectra and has public raw-data access, but its geometry is inferred and its H(s)H state/readout map is absent.
- Han et al. (2026), DOI 10.1007/s00348-026-04256-5, is promising for direct spatial interface/flow geometry through synchronized stereoscopic surface measurements and 4D-PTV, but the associated raw data were reported as available on request. It is a different measurement problem, not a substitute for HPD spectroscopy.
- GW190521 already has a separate polarization/readout architecture in the existing Hale work; this note does not reopen it.

## Proposed HPD test contract if the bridge is later supplied

- **Hypothesis:** a source-frozen H(s)H map predicts a definite joint distribution of sideband frequencies and mode-appearance boundaries as functions of δω, T, ∇B and B_RF. It may not introduce independent per-mode or per-cycle fit parameters after seeing the holdout.
- **Shared parameters:** magnetic-field and gradient calibration, RF amplitude, cell geometry, instrument transfer function, temperature correction, and any relaxation parameters required by the standard model.
- **Calibration:** use the paper's normal-state NMR field/gradient calibration and obtain the underlying calibration records; freeze the nuisance model before comparing theories.
- **Holdout:** reserve entire demagnetization/warm-up cycles and distinct RF/gradient settings. Do not randomly split adjacent time windows or treat all ~600 measurements as independent before establishing cycle/run dependence.
- **Predicted observables:** raw time-domain NMR/oscilloscope signal, sideband spectrum, Ω(δω), low-temperature slope/offset, high-temperature gaps and mode-appearance boundaries.
- **Standard comparator:** Leggett dynamics plus Leggett–Takagi relaxation and the published numerical 1D soliton-mode model, with the circular-membrane/Bessel interpretation evaluated separately rather than silently treated as directly observed.
- **Falsification rule:** after the maps, covariance and holdout are frozen, reject a model if its held-out joint observables fall outside a pre-registered 99% posterior-predictive region while the competing model remains inside. No numerical boundary is claimed until the raw records and full uncertainty/covariance model are obtained.

## Disposition

**P2_CANDIDATE_ONLY / METADATA_AND_FILE_MANIFEST_VERIFIED / RAW_BYTES_NOT_RETRIEVED / DATASET_LICENSE_NEEDS_CONFIRMATION / HSH_MAP_UNDEFINED / NO_P2_SELECTION / NO_PHYSICAL_CALCULATION.**

No dataset was downloaded, no numerical fit or prediction was performed, no H(s)H equation was altered, and no theory claim was promoted.

## References

1. V. V. Zavjalov, A. Savin, E. Sergeicheva and P. J. Hakonen, “Spectroscopy of Oscillation Modes in Homogeneously Precessing Domain of Superfluid 3He-B,” *Journal of Low Temperature Physics* 214 (2024), 385–398. https://doi.org/10.1007/s10909-024-03051-y
2. “HPD experiments — DryDemag cryostat, Low-temperature laboratory, Aalto University, Finland, 2018,” Zenodo. https://doi.org/10.5281/zenodo.8431264
3. Y. Han et al., “Simultaneous free-surface and 3D flow measurements of a vortex ring in head-on collision with the air–water interface,” *Experiments in Fluids* 67 (2026), 91. https://doi.org/10.1007/s00348-026-04256-5
