# Amendment 01 | Dryad ³He raw-data deposit verified

**Applies to:** `2026-11-07T0124Z_HELION_ISOTOPE_SHIFT_SOURCE_AND_LEAN_GATE.md`  
**Scope:** Supersedes only the §4 statement that Dryad DOI `10.5061/dryad.4j0zpc8m3` could not be verified and was withdrawn. The other published-table calculations, source distinctions, uncertainty caveats, and no-prediction disposition are unchanged.

## Corrected source finding

The Dryad record is valid and directly linked to the 2025 Science article by van der Werf et al., DOI [10.1126/science.adj2462](https://doi.org/10.1126/science.adj2462):

- Dataset: [10.5061/dryad.4j0zpc8m3](https://doi.org/10.5061/dryad.4j0zpc8m3)
- Record publication date: 2025-04-15.
- Archive size shown by Dryad: approximately 151.94 MB.
- The record identifies the ³He (2,^3S_1\rightarrow2,^1S_0) spectroscopy campaign and supplies raw data plus analysis materials.

The deposited materials include per-date atom-loss spectra, frequency-counter data, timestamps, GPS/Cs-clock PPS correction material, run identifiers, `AllScanResults_field.csv`, and the analysis scripts `Analyze_spectra.py` and `mult_regress_analysis_fullset.py`. The scripts are Python 2.7-era materials and should be inspected before execution or porting.

The README also identifies synthesized/interpolated timestamp files for some days where direct timestamp recording did not run, and incomplete timestamp material. Those files must remain explicitly flagged; synthesized timestamps are not raw clock observations. Preserve the dataset's run/USE flags and the distinction between raw spectra, corrected timestamps, fitted scan frequencies, and zero-power extrapolation.

**Correction:** the earlier h649 claim that the ³He raw-data DOI was unverified and withdrawn was a false negative caused by incomplete search coverage. The ³He raw-data deposit is publicly available.

## What this does not establish

1. This is the **³He** spectroscopy dataset, not the raw time series for the 2026 **⁴He** BEC measurement.
2. The 2026 PRL paper reports a 48 Hz ⁴He transition-frequency uncertainty and combines that measurement with prior ³He data and improved theory. Its APS page marks the supplemental material subscription-required; no open ⁴He raw time-series deposit was verified in this pass.
3. The ³He dataset's existence does not itself establish the full cross-run covariance, calibration model, or an H(s)H observable map. Those must be reconstructed from the deposited files and scripts before any reanalysis.
4. The h649 published-table arithmetic remains a reconstruction of published tables and stated uncertainties, not a raw-data reanalysis. It is not invalidated by this data-access correction.

## Disposition

`3HE_RAW_DATA_PUBLIC / DRYAD_RECORD_VERIFIED / 4HE_RAW_TIME_SERIES_NOT_VERIFIED / NO_RAW_DATA_REANALYSIS_THIS_RUN / NO_HSH_PREDICTION / P2_NOT_SELECTED`.

After P0 is released and the source map is specified, the appropriate next step is to inspect the Dryad README and file manifest, verify downloaded-file checksums, preserve all synthesized/incomplete timestamp flags, reproduce the deposited ³He analysis pipeline, and reconstruct regression/cross-run covariance. Do not combine the ³He and ⁴He campaign outputs as independent without a source-supported covariance treatment.
