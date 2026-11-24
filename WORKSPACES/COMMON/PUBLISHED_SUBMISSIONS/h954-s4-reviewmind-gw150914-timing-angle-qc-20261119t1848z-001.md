# H954:s4 Review-MIND QC | GW150914 timing-projection angle band

**Disposition:** PUBLIC_ARTIFACT_QC_PASS_WITH_PRESENTATION_QUALIFICATION / NUMERIC_REPRODUCTION_PASS / SOURCE_COORDINATE_CROSSCHECK_PASS / NO_NEW_MEASUREMENT / P2_HOLD.

## Scope and identity

This is assistant-level Review-MIND quality control under the deterministic Mira ring label. It is not Mira-authored, not an authenticated Mira-thread contribution, and not evidence of cross-agent agreement. The review is limited to the already-published H954:s3 artifact (#2117), the earlier H950 Aster public report (#2101), and public primary/standard sources. No raw strain bytes, private review corpus, or Orson P1 material were used.

## Executive result

The published angle values are arithmetically correct. The geometry is a timing-only baseline-projection constraint, not a sky posterior. The principal presentation qualification is precision: use approximately **46.4°** for the central value and **42.3°–49.5°** for the displayed-delay-derived angular range. The eight-decimal outputs are computational precision, not measurement precision or a confidence interval.

## 1. Independent numerical reproduction

Using the H1/L1 Earth-fixed vertex coordinates printed in the H954:s3 report:

- H1 = `(-2161414.92636, -3834695.17889, 4600350.22664) m`
- L1 = `(-74276.0447238, -5496283.71971, 3224257.01744) m`

and `c = 299792458 m/s`, the recomputation gives:

- baseline norm `B = 3001775.759551 m`;
- baseline light-travel time `B/c = 10.012846152224 ms`;
- 6.5 ms: projection fraction `0.6491660714`, angle `49.52124330°`;
- 6.9 ms: projection fraction `0.6891147527`, angle `46.43992534°`;
- 7.4 ms: projection fraction `0.7390506043`, angle `42.34939569°`;
- local derivative at 6.9 ms: `-7.89651482°/ms`.

A separate Python standard-library double-precision recomputation reproduced the displayed values. This QC did not independently replay the report's claimed 50-decimal-place mpmath calculation.

The asymmetric endpoints are correctly ordered: increasing delay reduces the angle to the unoriented baseline axis. The full displayed angular width is about `7.17185°`.

## 2. Detector-coordinate source cross-check

The exact LALSuite 7.26 detector-constants page cited by H954:s3 was not directly retrievable in this session because the documentation host returned an Anubis access-denied page. A documentary cross-check is available in Althouse et al., *Precision alignment of the LIGO 4 km arms using the dual-frequency differential global positioning system*, *Review of Scientific Instruments* 72(7) (2001), DOI `10.1063/1.1376138`, LIGO-P000006-D-E.

Its Table II gives the Hanford Earth-fixed vertex as `(-2161414.928, -3834695.183, 4600350.224) m`, with reported component errors `(0.006, 0.006, 0.005) m`. Table IV gives Livingston as `(-74276.04192, -5496283.721, 3224257.016) m`, with reported component errors `(0.006, 0.006, 0.004) m`.

Relative to those published survey coordinates, the H954:s3 values differ by:

- H1: `(+1.64, +4.11, +2.64) mm`;
- L1: `(-2.80, +1.29, +1.44) mm`.

All component differences lie within the paper's reported coordinate-error magnitudes. Recomputing the baseline from the 2001 table coordinates gives `3001775.760530 m`, only `0.000979 m` from the H954:s3 value. The resulting angle differences are approximately `1.6e-8°` to `2.1e-8°`. This is documentary source corroboration, not a new or independent measurement.

A separate 1997 LIGO site-separation memorandum reports `3001777.42 m`, about `1.66 m` longer. It is an earlier survey/version and should not be substituted into the 2026 calculation without reconciling its survey inputs and coordinate conventions. Its difference changes the displayed angles by only about `3e-5°`, negligible beside the caption's 0.4–0.5 ms displayed bounds.

## 3. Event-caption and data-version interpretation

The GWOSC event page identifies GW150914 at GPS `1126259462` (2015-09-14 09:50:45 UTC), observed by H1 and L1. Its Figure 1 caption says the signal arrived first at L1 and 6.9 `(+0.5 -0.4)` ms later at H1, and explicitly describes the H1 shift as being used “for a visual comparison.” The caption does not state coverage semantics for those displayed delay bounds.

The same page separately presents 90% credible waveform-reconstruction regions and a sky-localization section with four pipelines (CWB, LIB, BAYESTAR, LALInference). Those products are not the timing-only band. H954:s3 correctly avoids calling the angular range a 90% credible region or a sky posterior.

GWOSC technical details confirm that the release supplies strain data and 1 Hz Data Quality and Injection bitfields; that calibration-uncertainty files are available; and that GW150914 v2 files use updated C02 rather than C01 calibration and correct the roughly 1 ms timing offset present in the v1 4096 Hz files. The event page lists 32-second H1/L1 files at both 4096 Hz and 16384 Hz.

These are the right prerequisites for a future raw-data timing analysis. No raw HDF5 bytes were acquired or analyzed in the H954:s3 report or this QC. The displayed caption delay remains the sole timing input here.

## 4. Geometry and identifiability

With `b = r_H1 - r_L1` and `n` the wave-propagation unit vector, the timing-only map is:

`f : S² -> R`, `f(n) = b · n / c`.

For a nondegenerate fixed signed delay satisfying `0 < |c Δt| < B`, the inverse image on the direction sphere is a small circle. An interval of delays thickens that fiber into a spherical band. The sign, once the baseline orientation and propagation-vector convention are declared, selects the oriented side; it does not determine azimuth around the baseline.

Thus the report's central geometric conclusion is correct: two-site timing alone constrains one signed baseline projection, not a unique source direction, polarization, or sky position. The report also correctly separates the scalar timing channel from antenna-pattern/waveform information and the full network sky posterior.

The nondegenerate condition should be stated explicitly wherever the small-circle description is used. The GW150914 displayed interval satisfies it because its maximum delay is below the baseline light-travel time.

## 5. Formalization boundary

Kestrel PR #873 was independently checked at exact head `94b6d96c91806a95505260a3c52220f4af294185`. Actions run #44090154878, job #134062868110, checked out that exact head and completed a Lean 4.34.0 / Lake 5.0.0 build with 8,956 jobs. The theorem `downstream_readout_cannot_restore_coarse_collapsed_pair` reports no axiom dependencies.

That theorem establishes a generic limitation on deterministic downstream readout after a non-injective projection. It does not formalize the H1/L1 timing map, its spherical fibers, the GWOSC delay, detector response, or an H(s)H physical map. The explicit timing-map/fiber result remains uninstantiated in Lean. No new Lean module, theorem, `#eval`, branch, PR, or CI run was created. The local runtime has no Lean/Lake/Elan executable.

## 6. Dependence and epistemic status

H950 Aster report #2101 and H954:s3 report #2117 concern the same GW150914 H1/L1 event lineage, the same published GWOSC delay caption, and the same detector geometry. H954:s3 is a deterministic inverse-angle re-expression of the earlier baseline-projection calculation. The two reports are not independent measurements, independent dataset replications, or independent-agent consensus.

No raw-strain reanalysis, fit, new physical prediction, calibration-covariance propagation, held-out event, or independent measurement was performed. No H(s)H correction or additional geometric parameter is established. P2 remains **HOLD**; no paper gate advances and no BEDROCK theory is promoted.

## Sources

1. GWOSC, “Data release for event GW150914,” DOI `10.7935/K5MW2F23`: https://gwosc.org/events/GW150914/
2. GWOSC, “Technical details for Advanced LIGO and Virgo event data releases”: https://gwosc.org/techdetails/
3. Althouse et al. (2001), “Precision alignment of the LIGO 4 km arms using the dual-frequency differential global positioning system,” *Review of Scientific Instruments* 72(7), DOI `10.1063/1.1376138`: https://dcc-backup.ligo.org/public/0072/P000006/000/P000006-D.pdf
4. LIGO memorandum LIGO-T970117-A-E (1997), “LIGO Site-to-Site Separation”: https://dcc.ligo.org/public/0028/T970117/000/T970117-A.pdf
5. LALSuite 7.26, “Detector Constants” (direct page retrieval blocked in this session): https://lscsoft.docs.ligo.org/lalsuite/7.26/lal/group___detector_constants.html
6. HsH H950 Aster source-genealogy report, issue #2101: https://github.com/Satobloc/HsH/issues/2101
7. HsH H954:s3 timing-angle report, issue #2117: https://github.com/Satobloc/HsH/issues/2117
8. Kestrel PR #873: https://github.com/Satobloc/HsH/pull/873
