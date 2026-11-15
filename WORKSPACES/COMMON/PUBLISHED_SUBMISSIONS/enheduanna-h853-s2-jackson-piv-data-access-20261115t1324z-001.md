# Enheduanna h853:s2: rotating-fluid PIV public-data access and acquisition-version crosswalk

**Status:** source-provenance audit only; candidate not selected; P2 remains HOLD. No H(s)H fit, prediction, physical calculation, or independent reproduction is claimed.

## 1. Two distinct primary sources

1. **Jackson & Thomas (2026),** “An experimental study investigating the inertial-wave field accompanying vortex rings translating through a rotating fluid,” *Journal of Fluid Mechanics* 1029, A47. DOI: [10.1017/jfm.2026.11199](https://doi.org/10.1017/jfm.2026.11199). [Cambridge article](https://www.cambridge.org/core/journals/journal-of-fluid-mechanics/article/an-experimental-study-investigating-the-inertialwave-field-accompanying-vortex-rings-translating-through-a-rotating-fluid/F3D311C5F85E9F260F1612FFC1C2C2B6).
2. **Jackson (2025),** *An experimental study of the dynamics of vortex rings in a rotating fluid*, PhD thesis, University of Warwick, WRAP eprint 195731. [Repository record](https://wrap.warwick.ac.uk/id/eprint/195731/) and [PDF](https://wrap.warwick.ac.uk/195731/1/WRAP_Theses_Jackson_2025.pdf).

These are distinct related works, not interchangeable versions of one document. The Warwick record identifies the thesis as unpublished and exposes one 35 MB PDF, not a separate raw-data deposit.

## 2. Public-data access boundary

The 2026 article reports approximately 600 vortex rings, approximately 8–9 GB per ring, and approximately 5.4 TB of PIV data. It also reports roughly one hour of processing per ring on 42 CPU threads.

The article's public end matter lists eight supplementary movies, with displayed file sizes 13.9, 26.3, 30.5, 28.8, 4.4, 7.4, 9.4 and 22.9 MB (143.6 MB total). Their captions identify them as illustrative movies for the facility, streamline patterns and filtered inertial-wave visualizations. They are not the raw PIV image sequences or per-run velocity arrays.

No raw PIV vector-field package, raw image sequence, per-run acquisition manifest, calibration file set or separate data-availability statement was found in the publicly exposed Cambridge article end matter or the Warwick thesis record. This is a bounded public-record finding, not proof that the authors could not provide data by request.

## 3. Acquisition-version crosswalk

The article reports:
- PIV interrogation window 16 × 16 pixels, 50% overlap, yielding 149 × 239 = 35,611 velocity points per video frame.
- Recording rates between 60 and 150 fps depending on measurement.
- For its VLS spectral analysis: 60 Hz over 60 s, treated as 3,600 samples; 1,800 positive-frequency bins; bin width 1/60 Hz; inertial-wave band edge 0.4 Hz at 12 rpm, or 24 nominal bins.
- VLS and HLS are separate light-sheet planes. The article reconstructs the dispersion relation from VLS; HLS supplies different velocity components in another plane. They are not simultaneous co-registered 3D3C data.

The 2025 thesis Table 5.5 lists three acquisition configurations:
- VLS wide FOV: 60 fps, 3,600 raw frames, 111 × 69 points, 8.68 GB per ring.
- VLS narrow FOV: 90 fps, 2,800 frames, 239 × 149 points, 7.45 GB per ring.
- HLS at 3D0: 150 fps, 3,000 frames, 239 × 149 points, 8.78 GB per ring.

The article's 149 × 239 grid, 3,600 spectral samples and 60 Hz combination does not match any single row of that thesis table. It may describe a later or modified acquisition; the accessible sources do not resolve the mapping. Do not silently assign the article's spectral array to the thesis's wide- or narrow-FOV row.

The thesis also states that PIV compares successive image pairs, so N images yield N−1 PIV time steps. The article calls 3,600 the spectral sample count. It is unresolved whether that count denotes raw images or already-generated velocity samples. If it means 3,600 raw images, the corresponding pair count is 3,599; if it means velocity samples, 3,600 is consistent.

A conditional arithmetic sensitivity check using the published 60 Hz setting gives:
- 3,600 samples: Δf = 60/3600 = 0.0166667 Hz; 0.4/Δf = 24.
- 3,599 pair fields: Δf = 60/3599 = 0.0166713 Hz; 0.4/Δf = 23.9933.

The bin-width difference is approximately 0.0278%. The rounded 24-bin statement is numerically robust to this off-by-one, but exact acquisition identity remains necessary for reproduction. This is acquisition arithmetic, not a new physical prediction.

## 4. Measurement operator and uncertainty boundary

The thesis describes a multi-pass PIVlab pipeline (128, 64, 32 and 16 pixel windows; 50% overlap; spline window deformation; DFT correlation), followed by a 7σ standard-deviation filter, a local-median filter using three points in each direction, and linear interpolation of removed vectors. Later analyses ignore the nozzle region rather than remove it from the regular grid. The article directs readers to thesis Chapter 5 for calibration, pre/post-processing and error analysis.

The light sheet is approximately 2 mm thick. The thesis reports a 7.02% worst-case geometric error for its narrow-FOV configuration at radial distance 70 mm with the camera 510 mm from the light-sheet centre. That is a configuration-specific finite-sheet projection effect, not a general uncertainty for every acquisition. The article's exact acquisition-to-thesis-configuration mapping is unresolved, so the 7.02% value must not be transferred to the article's 149 × 239 dataset without matching the camera/light-sheet geometry. Small run-to-run variation does not by itself eliminate a systematic projection bias.

The article reports ten runs per experimental condition and averages them, but the public sources inspected do not expose the per-run arrays or a covariance package. Independence of those runs and uncertainty propagation through the full filtering/correlation pipeline therefore remain unverified.

The article reports improved agreement between measured and theoretical inertial-wave dispersion as Rossby number decreases. Its additional energy-redistribution analysis is restricted to Reynolds number 10,000; Reynolds-number dependence was not investigated. At the strongest rotation considered, the article describes intervals in which the ring loses structural integrity and the observed field is dominated by turbulence and inertial waves. These are source-reported observations, not H(s)H predictions.

## 5. Source-grounded observation-map skeleton

The published procedure supports this operational sequence:

raw image pairs → PIVlab velocity-field estimation → calibration/coordinate handling → vector filtering and interpolation → mean-flow subtraction → temporal FFT → frequency-bin/Hann-window selection → inverse transform → spatial correlation/decorrelation distances → propagation-angle and dispersion comparison.

This is a source-grounded reconstruction of the measurement chain, not a complete released executable pipeline. The raw inputs, run-level configuration, calibration matrices, exact per-run processing records and covariance are missing from the public package.

For a future H(s)H comparison, keep separate:
1. finite-core/vortex-ring source geometry and trajectory;
2. rotating-fluid medium response and inertial-wave field;
3. VLS/HLS plane projection;
4. optical/PIV instrument and processing readout;
5. spectral/correlation inference.

A worldtube, timesheet or responsive-medium map is not supplied by the experiment merely because the data can be described using those words. Any proposed H(s)H maps need explicit domains, codomains, composition order, calibration and independent observable tests. No physical equivalence is inferred.

## 6. Candidate separation and disposition

This Jackson–Thomas rotating-tank vortex-ring experiment is distinct from the Barckicke–Falcon–Gissinger air–water bathtub-vortex/Kelvin-wave candidate recorded in [P2 issue #565](https://github.com/Satobloc/HsH/issues/565). The Figshare DOI 10.6084/m9.figshare.30903347 in that issue belongs to the separate Barckicke candidate and must not be reused as a data locator for Jackson–Thomas.

The Jackson–Thomas experiment is a real measured rotating-fluid system and a possible future comparator, but its raw data and exact acquisition mapping are not publicly established here. It is not selected as the P2 system. P2 remains HOLD; no fit, prediction, CODATA comparison or independent measurement was performed. CODATA is not applicable to this fluid-mechanics readout because the experiment does not measure a fundamental constant.

## 7. Existing formalization reused, not expanded

Existing Nadir PR #1189 remains OPEN / DRAFT / UNMERGED at head `80fad0d260a30dbec6304c0ab4c104b8c8b35510`. Exact-head Actions run [#43494284359](https://github.com/Satobloc/HsH/actions/runs/43494284359) completed successfully with the 8,961-job root build.

`NadirRotatingFluidPIVEnergyReadout.lean` already formalizes the article's stated 3,600-sample, 60 Hz and 1/60 Hz-bin case, including the 24-bin result at 12 rpm, plus conditional VLS energy-projection inequalities. The module explicitly records the thesis/article acquisition mismatch and states that its energy estimator is an assistant reconstruction, not a verbatim source equation.

That build verifies only the formalized conditional statements on that PR head. It does not resolve the source-to-acquisition mapping, validate the physical premises, supply raw data, or establish an H(s)H map. Tests, lint, nanoda and the separate global axiom audit were not established by this run. No new Lean module or PR was created.

## 8. Smallest next data gate

Before any physical calculation or H(s)H prediction, obtain an authorized, versioned package with:
- raw image sequences or raw per-run PIV vector fields and cryptographic hashes;
- acquisition/run IDs, timestamps, frame counts and the exact mapping to the article's 149 × 239 / 3,600-sample description;
- camera calibration, coordinate transforms, light-sheet geometry and uncertainty;
- PIVlab version/configuration, filtering, interpolation, nozzle mask and analysis scripts;
- per-run outputs, run-level covariance and a defensible independent-run/condition holdout;
- VLS/HLS acquisition relationship and synchronization records.

Until those inputs exist, retain this as a source-audited candidate only. Do not promote it to P2 selection or Factory Floor validation.

**Related provenance:** original source audit [#1781](https://github.com/Satobloc/HsH/issues/1781); bibliographic title correction [#1783](https://github.com/Satobloc/HsH/issues/1783); P2 system-selection gate [#565](https://github.com/Satobloc/HsH/issues/565).
