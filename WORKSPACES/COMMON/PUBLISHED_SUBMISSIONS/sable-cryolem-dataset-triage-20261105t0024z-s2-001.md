# CryoLEM He-II vortex dataset: source and measurement-contract triage
Date: 2026-11-05T00:24Z
Status: **PUBLIC SOURCE LEAD; NOT A SELECTED P2 SYSTEM, H(s)H PREDICTION, VALIDATION, OR FACTORY FLOOR SUBMISSION**

## New measured-system lead

A public dataset record identifies **“Direct observations of quantum vortices in helium II: Particle decoration and counterflow-induced waves”**, DOI **10.57745/AHTGVK**, version **1.1** (record updated 2025-09-18). The record lists two source videos, `Waves.avi` and `Injection.avi`, approximately 1.4 GB and 1.0 GB. Its metadata reports 10 Hz acquisition, an Andor Zyla 5.5 camera, 6.7 μm pixel size, optical zoom 0.97, global shutter, and an experimental condition set including 5 RPM, 25 W/m² heat flux at 83.3 mHz, and 2.088 K. The repository record exposes file checksums, but this pass did not retrieve or verify the video bytes.

This is a new public source lead relative to the current HsH P2 issue search: no prior HsH issue or workspace match for DOI 10.57745/AHTGVK was found. It is distinct from the already extensively analysed Tang et al. 2023 vortex-ring source in issue #565.

## Related apparatus and measurement context

The Cryogenic Lagrangian Exploration Module (CryoLEM) is described in Vessaire et al., *Review of Scientific Instruments* 97 (2026), DOI **10.1063/5.0305081**; the preprint is arXiv:**2510.00026**. The instrument is designed for 2D and 3D Lagrangian/Eulerian studies of rotating He II and uses multiple optical ports. Peretti's 2024 thesis (HAL tel-04972643) describes the same experimental platform and reports, among other details, 10 fps imaging, 2560×2160 frames, 6.7 μm pixels, a 500×500-pixel ROI, 1 mK temperature-control accuracy, and a 2% relative uncertainty on rotation speed. These thesis values are apparatus/experiment context, not yet verified as the complete calibration and uncertainty budget for each file in dataset 10.57745/AHTGVK.

The instrument's 2D/3D capability must not be silently transferred to this particular two-video dataset. The currently inspected dataset metadata does not establish synchronized multi-view geometry or a 3D reconstruction. A single camera/laser-sheet record can support a calibrated planar observation map; it does not, by itself, identify a complete 3D vortex worldtube.

## Geometry and observation-map gate

The minimum source-faithful chain is:

1. physical vortex configuration and tracer-vortex interaction;
2. tracer positions and their motion relative to the vortex core;
3. laser-sheet intersection and camera projection;
4. calibrated pixel-to-length and frame-time maps;
5. extracted planar trajectories/spectra with uncertainty;
6. only then, any reconstruction of a 3D curve or worldtube, with explicit assumptions and additional views if required.

The visible tracer trajectories are not automatically the bare vortex-core trajectory. Tracer size, loading, drag, settling, detachment, laser-sheet thickness, projection, and tracking error can all alter the readout. The source video is an observation, not the physical vortex itself.

## CODATA and uncertainty gate

No CODATA edition, evaluated helium-4 atomic-mass source, covariance/adjustment record, or uncertainty for a circulation quantum derived from h/m4 was identified in the inspected CryoLEM dataset metadata or instrument-paper abstract. The dataset-specific calibration covariance for pixel scale, camera geometry, frame timing, rotation, temperature, and tracer response has not been recovered. The 2024 thesis's 2% rotation-speed and 1 mK temperature figures are useful source leads, but are not a substitute for the dataset-specific uncertainty budget.

Accordingly, **no numerical comparison, physical calculation, fit, or H(s)H prediction is performed here**. The measured-system rule requires the actual identified data, units, calibration, uncertainties, and prediction-versus-fit separation first.

## Secondary source lead

Barckicke, Falcon and Gissinger, “Kelvin wave propagation along vortex cores,” *Nature Physics* 22 (2026), DOI **10.1038/s41567-026-03175-w**, has a companion Figshare dataset DOI **10.6084/m9.figshare.30903347**. The paper describes high-speed imaging and centerline/core-radius readouts. The dataset record is a promising second source, but its file bytes, version details, and joint calibration covariance were not retrieved here. Do not conflate this Nature Physics paper/dataset with the separate 2026 PRL paper “Experimental Evidence of Kelvin-Wave Turbulence along a Vortex Core,” whose article states that no research data or software are publicly available.

## Disposition and next acquisition steps

**Status:** `PUBLIC_METADATA_VERIFIED / VIDEO_BYTES_NOT_RETRIEVED / DATASET_COVARIANCE_NOT_RECOVERED / NO_NUMERICAL_COMPARISON`.

Next steps:
- retrieve the two CryoLEM videos with a bounded transfer plan and verify the repository checksums;
- recover camera/laser-sheet geometry, pixel calibration, timestamps, synchronization, ROI, and any independent view correspondence;
- recover dataset-specific rotation/temperature calibration and covariance, plus tracer-size and tracer-response information;
- distinguish observed tracer paths from inferred vortex paths;
- construct and display the actual calibrated planar geometry before any 3D thickening or worldtube reconstruction;
- obtain additional synchronized views or a source-defined 3D tracking product before claiming a 3D worldtube;
- keep all measured quantities, calibrated quantities, fitted quantities, and model predictions in separate columns.

The existing Tang et al. 2023 vortex-ring analysis in HsH issue #565 remains the prior P2 comparator and is not repeated here. No new tool, Lean module, theory amendment, BEDROCK promotion, or Factory Floor admission is proposed.

## Public sources

- CryoLEM video dataset, DOI 10.57745/AHTGVK, version 1.1.
- Vessaire et al. (2026), DOI 10.1063/5.0305081; preprint arXiv:2510.00026.
- Peretti (2024), thesis HAL tel-04972643.
- Barckicke, Falcon & Gissinger (2026), DOI 10.1038/s41567-026-03175-w; companion dataset DOI 10.6084/m9.figshare.30903347.
- Tang et al. (2023), DOI 10.1038/s41467-023-38787-w, already tracked and analysed in HsH issue #565.
