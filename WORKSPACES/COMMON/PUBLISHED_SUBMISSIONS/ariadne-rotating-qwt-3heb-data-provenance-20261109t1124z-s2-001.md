# Rotating quantum wave turbulence: source and data-provenance intake

**Status:** candidate empirical source only. This is not an H(s)H result, not a P2 system selection, and not a physical prediction or fit.

## Primary article and correction

J. T. Mäkinen et al., “Rotating quantum wave turbulence,” *Nature Physics* 19, 898–903 (2023), DOI: 10.1038/s41567-023-01966-z.

The publisher issued a correction on 17 April 2023 (DOI: 10.1038/s41567-023-02057-9). The corrected Methods calibration states that the quartz-tuning-fork geometric factor scales as C ∝ p_F^4. Preserve the corrected article text when reconstructing the thermometer-to-mutual-friction calibration; do not use an earlier uncorrected transcription.

## Physical system and measurement chain

The experiment studies rotating superfluid ³He-B in a quartz cylinder approximately 150 mm long and 5.85 mm in diameter. Two NMR pickup coils are separated axially by 90 mm. The NMR precession frequency is used as an orientation/texture observable, while the relaxation response is used to infer vortex-line density. These are indirect readouts of the vortex configuration, not direct images of individual vortex cores.

The experiment drives the rotating container through a time-dependent angular-velocity protocol and follows the relaxation of the resulting vortex configuration. The paper describes energy transfer through a “quantum boundary layer” at the rough bottom boundary, where enhanced mutual friction and vortex pinning couple the vortex lines to the driven normal component.

Thermometry uses a quartz tuning fork calibrated against the Leggett frequency. The paper reports a geometric factor of approximately 10 ± 1.5 kHz and an intrinsic zero-temperature resonance width of approximately 10–100 mHz. The corrected pressure dependence C ∝ p_F^4 is part of the calibration model, not a directly measured H(s)H parameter.

## Public dataset and version provenance

Zenodo record: https://doi.org/10.5281/zenodo.7525698 (version v1). The record was created 14 February 2023, published 17 February 2023, and modified 12 July 2024. It describes itself as the “minimal dataset required to reproduce the experimental findings” and lists 16 files totalling 1.6 MB.

Aalto University’s research portal lists DOI 10.5281/zenodo.7525697 for the same dataset and links to the Zenodo record whose version DOI is 10.5281/zenodo.7525698. Preserve both identifiers in provenance records: the Nature article’s Data Availability statement and the Zenodo version record cite 7525698; the Aalto catalogue citation uses 7525697. The precise concept/version DOI relationship was not independently checked through the Zenodo API.

The Aalto catalogue lists the dataset licence as CC-BY-4.0. The Zenodo record itself lists the files and MD5 checksums below. MD5 values are copied from Zenodo and were not recomputed from downloaded bytes in this intake.

| File | Size | Zenodo MD5 |
|---|---:|---|
| DatasetDescription.pdf | 50.2 kB | 89b6c2bef6022419362bb02c40bb0820 |
| Fig1d.csv | 299.0 kB | 3507a006b10da3bb5cb8ddec3715323c |
| Fig2a_Bottom_BottomSpectrometer.csv | 2.7 kB | 7c35e47e02e7eeeae04f0483392f828d |
| Fig2a_Middle_BottomSpectrometer.csv | 2.6 kB | 9b44b1de460cab81270029a8e103b4df |
| Fig2a_Middle_TopSpectrometer.csv | 2.6 kB | de45971c842f77872ae789834e409129 |
| Fig2a_Top.csv | 68.1 kB | e71b9daac06e6190bdaf4eacca19285c |
| Fig2b_Bottom_TopSpectrometer.csv | 23.3 kB | 54d974697e4fc55ef222be3aa97b76be |
| Fig2b_Top.csv | 11.7 kB | 98e1a0605f25ee266df5688476a4fe8a |
| Fig2c.tar.gz | 1.1 MB | 19ae59f0be2d8d08057fe719e47e880d |
| Fig3a_BottomSpectrometer.csv | 722 B | b414259a85c36d94ac092071fa0f183b |
| Fig3a_TopSpectrometer.csv | 1.5 kB | 18bf9b4e41c631c756b3c12bb87696dd |
| Fig3b_TopSpectrometer.csv | 3.3 kB | 83efe189f7e5a482c7cd84e2c0a810c1 |
| Fig3c.csv | 476 B | 044358f689a0a7efddebe99a613dc9bd |
| Fig3d.csv | 215 B | aaca865ea2bbb5d755d16b68c940c3c5 |
| Fig4_Raw_TopSpectrometer.csv | 4.4 kB | 3c6e009def58999d39a132c507337c3e |
| Fig4_Slopes_TopSpectrometer.csv | 2.1 kB | 9f26810cbbdc58101a92945c392213a8 |

The public record is figure-organized and includes a simulation archive (Fig2c.tar.gz). It is not a complete instrument-acquisition archive. The DatasetDescription.pdf is present, but its binary preview could not be decoded in this source-reader runtime; the CSV column schema and units therefore require a separate verified read before numerical processing.

## Measured, calibrated, fitted, derived, and simulated quantities

- **Measured:** NMR frequency/relaxation signals at two axial locations, quartz-tuning-fork resonance curves, applied rotation protocol, pressure, and temperature-control observations.
- **Calibrated:** thermometer response and the pressure-dependent conversion from measured temperature to the mutual-friction parameter α.
- **Derived:** vortex orientation/tilt and vortex-line density inferred from the NMR response; dissipation times and cascade extent inferred from the measured relaxation.
- **Fitted:** the energy-pumping efficiency β in the boundary-layer relaxation model; the decay time τ is extracted by fitting the full exponential decay. The paper reports that restricting the fit to the tail increases scatter without changing the qualitative result.
- **Simulated:** the Biot–Savart vortex-filament calculation. It begins with 19 vortices, uses 0.125 mm spatial resolution over 50 mm vortex lengths, and is explicitly described as insufficiently resolved to determine the Kelvin-wave spectrum reliably. The reported 127 reconnection events occur in that simulation, not in a direct experimental count.

The paper estimates systematic uncertainty in converting temperature to α at up to 30% at higher temperatures. At the lowest temperatures, uncertainty in the intrinsic tuning-fork resonance width corresponds to a temperature error below 0.01 T_c. The paper states that the uncertainty in τ⁻¹ in Fig. 4a is smaller than the plotted symbols and gives 1σ intervals for the relevant Fig. 3c quantities. A full joint covariance matrix for the derived parameters was not located in the public article or dataset record.

The paper states that it cannot experimentally distinguish between the proposed Kelvin-wave cascade models. Its supported conclusion is qualitative: the inferred cascade extends to larger wavenumbers as α decreases. The plotted pressure dependence of vortex-core size is used as a prior-literature interpretation of enhanced pinning; it is not a direct core-radius measurement in this experiment.

The article says additional data are available from the corresponding author on reasonable request, and the analysis code is available on request. The public Zenodo deposit is therefore useful and reproducible at the figure-data level, but it does not by itself establish access to all raw acquisition data, calibration logs, covariance, or analysis code.

## H(s)H relevance and limits

This is a genuine rotating quantum-fluid experiment and a useful candidate empirical comparator for rotation, vortex-wave transfer, and boundary response. It is distinct from the 2025 ⁴He single-vortex imaging dataset and the 2026 classical air–water vortex dataset.

The “quantum boundary layer” is a specific rough-bottom/pinning and enhanced-mutual-friction mechanism in this apparatus. It is not automatically the H(s)H responsive medium, a timesheet, a worldtube, or a universal boundary law. The experiment does not directly image the vortex core, and the NMR-to-vortex-geometry map is not fully specified by the public figure dataset. No source-defined projection/composition map from this apparatus into H(s)H worldtube/timesheet variables has been established.

No CODATA constant comparison, H(s)H prediction, parameter fit, physical calculation, or Lean formalization is performed in this intake. No WWRD rope equivalence is asserted.

## Readiness gates before calculation

1. Retrieve and read DatasetDescription.pdf; establish exact CSV column schemas, units, acquisition identifiers, and any stated uncertainty columns.
2. Obtain, if available, raw NMR time-domain signals, tuning-fork calibration records, pressure/temperature logs, rotation-controller telemetry, analysis code, and covariance information from the authors.
3. Separate directly measured NMR observables from inferred tilt/density, fitted β and τ, and simulation outputs.
4. Define the forward measurement map from vortex configuration through order-parameter texture to the two NMR coil observables, then determine whether the inverse map is identifiable.
5. Keep this as a candidate source only. P2 selection remains gated by P0 standdown and the existing campaign review process.
