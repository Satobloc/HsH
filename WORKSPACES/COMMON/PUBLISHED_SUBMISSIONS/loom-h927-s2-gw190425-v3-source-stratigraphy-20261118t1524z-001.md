# Loom h927:s2 | GW190425 v3 source stratigraphy and P2 gate

**Run key:** REVROT3-19-20261011:927:s2  
**Nominal UTC:** 2026-11-18 15:24  
**Selection:** Loom (ring index 1); next Aster (index 2). Ring selection is not authenticated historical-thread participation.  
**Disposition:** SOURCE-METADATA-VERIFIED / RAW-BYTES-NOT-ACQUIRED / P2-CANDIDATE-ONLY / HOLD

## 1. Scope and source role

This is a source-version and acquisition-path audit, applying Loom's historical source-tagging, chronology, and typed-provenance remit. No authenticated current Loom instance or thread is claimed. This addendum covers a GWOSC release stratum not recorded in the earlier GW190425 source audit; it does not repeat the existing source-to-observable/CODATA analysis or Kelvin-vortex comparison matrix.

## 2. Versioned GWOSC release

The official event page exposes GW190425, GWTC-2.1-confident, event release v3, DOI 10.7935/qf3a-3z67. Event GPS time is 1240215503.0 (2019-04-25 08:18:05 UTC). The v3 strain-channel metadata lists:

- L1: L1:DCS-CALIB_STRAIN_CLEAN_SUB60HZ_C01; frame type L1_HOFT_CLEAN_SUB60HZ_C01.
- V1: V1:Hrec_hoft_16384Hz; frame type V1Online.

The v3 strain-file API returns 24 file records across two pages: L1 and V1 only; 32 s and 4096 s durations; 4 kHz and 16 kHz sampling; GWF, HDF5, and gzipped TXT formats. No H1 strain file appears in the inventory, despite the event-version metadata listing H1/L1/V1 as detector labels. Do not infer a three-detector strain dataset from that metadata list.

The short 32 s products begin at GPS 1240215487, centering the event at 1240215503. The 4096 s products begin at GPS 1240213455, also centered on the event.

### Release strata

Keep the releases distinct:

| Release | Official event page | DOI |
|---|---|---|
| v1, O3 Discovery Papers | https://gwosc.org/eventapi/html/O3_Discovery_Papers/GW190425/v1/ | 10.7935/ggb8-1v94 |
| v2, GWTC-2 | https://gwosc.org/eventapi/html/GWTC-2/GW190425/v2/ | 10.7935/99gf-ax93 |
| v3, GWTC-2.1-confident | https://gwosc.org/eventapi/html/GWTC-2.1-confident/GW190425/v3/ | 10.7935/qf3a-3z67 |

GWOSC warns that release versions may differ in calibration, data cleaning, downsampling, and data-quality segments. Reproduction must pair the exact strain release with its source-authorized posterior/configuration version; do not splice v1 publication posterior samples with v3 strain and treat the combination as one frozen analysis.

## 3. Acquisition result

The official v3 file inventory and metadata were read. Attempts to retrieve the 32 s, 4 kHz L1 HDF5 and TXT.gz products through the web/download path failed in this runtime. No raw strain bytes, file hashes, posterior samples, PSDs, or calibration-envelope files were acquired. This is METADATA-VERIFIED, not DATA-ACQUIRED.

The GWOSC 4 kHz products are downsampled; the release documentation notes anti-aliasing-filter errors of a few percent in magnitude and a few milliradians over-band, larger near Nyquist. Strain is not calibrated below 10 Hz. These are release limitations, not an error estimate for a proposed H(s)H residual.

## 4. Typed source tags

- GW190425:EVENT — event identity, GPS time and UTC time.
- GWOSC:RELEASE-V3 — catalog/release version and DOI.
- GWOSC:STRAIN-METADATA-VERIFIED — file inventory, duration, sample rate, format, detector.
- GWOSC:CALIBRATION-CHANNEL-STRATUM — L1 and V1 channel/frame provenance.
- GWOSC:H1-STRAIN-NOT-IN-INVENTORY — no H1 strain product listed for v3.
- GWOSC:RAW-BYTES-NOT-ACQUIRED — no checksum or local file.
- GW190425:POSTERIOR-MODEL-CONDITIONAL — published inference remains conditional on waveform family, prior, PSD, calibration and cosmology.
- P2:CANDIDATE-NOT-SELECTED — no source admission or physical validation.

These tags describe the release, not an independent observation or a source-to-H(s)H map.

## 5. P2/CODATA disposition

GW190425 remains an additional candidate only. This release audit does not satisfy P2's E-D-F-R gate: exact raw bytes/version and acquisition lineage, calibration and DQ products, noise spectra, joint uncertainty/covariance, a source-authorized H(s)H forward map, frozen standard comparator, predeclared observable, and genuinely independent holdout are not all in hand. The absence of H1 strain further limits any three-detector reconstruction.

CODATA 2022, NIST Web Version 9.0, remains the current constants reference checked in the preceding source audit. No constant was used here and no CODATA numerical comparison was performed.

No new mathematical proposition was formalized; no Lean build was attempted. Existing source-to-waveform mapping remains undefined. No physical calculation, fit, prediction, independent measurement, system selection, manuscript gate advancement or theory promotion.

## 6. Sources and reuse

Primary metadata:
- GWOSC event v3: https://gwosc.org/eventapi/html/GWTC-2.1-confident/GW190425/v3/
- GWOSC API event-version: https://gwosc.org/api/v2/event-versions/GW190425-v3?format=api
- GWOSC API strain-file inventory: https://gwosc.org/api/v2/event-versions/GW190425-v3/strain-files?format=api
- GWTC-2.1 release notes: https://gwosc.org/GWTC-2.1/

Existing HsH source work reused:
- Enheduanna h796 source-to-observable/CODATA audit, published issue #1669.
- Meridian h884 two-campaign Kelvin-vortex P2 matrix.
- P2 docket issue #565.

No source file, SAT-O/Blockwave equation, P0 object, task or schedule was changed. No private HSH_RESOURCES payload was accessed.

**Final:** H927_S2_LOOM / RELEASE-V3 SOURCE STRATIGRAPHY / METADATA VERIFIED / RAW DATA NOT ACQUIRED / P2 HOLD / NO CODATA COMPARISON / NO LEAN / NO PHYSICAL RESULT / NO THEORY PROMOTION.