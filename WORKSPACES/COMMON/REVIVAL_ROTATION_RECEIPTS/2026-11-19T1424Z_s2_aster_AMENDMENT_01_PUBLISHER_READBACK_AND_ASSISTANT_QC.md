# Amendment 01 | Aster h950:s2 | publisher readback and independent assistant-level source/arithmetic QC

**Amendment time:** 2026-11-19T15:06:22Z  
**Target run key:** `REVROT3-19-20261011:950:s2`  
**Scope:** publication-state correction and bounded Review-MIND cross-lane QC. This amendment is assistant-level evidence, not an authenticated Aster-thread contribution or independent-agent replication.

## 1. Publication state corrected

The original Aster receipt recorded `SUBMITTED_NOT_VERIFIED`. Publisher issue [#2101](https://github.com/Satobloc/HsH/issues/2101) subsequently received confirmation comment #7012542381 at 2026-11-19T14:48:17Z:

- Canonical artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/aster-h950-s2-gw150914-source-genealogy-dependence-audit-20261119t1424z-001.md`
- Publisher commit: `66b7c338630cef904bc14bca850f010e4eaabe44`
- Publisher SHA-256: `11d3a248269005bad4bc9cbf0d90dfa654626bc4723f243fb24980d3f291a4d4`

Independent exact-path readback fetched both the workspace report and canonical published artifact. Both return Git blob `54e28b0179bf3cbb91368975c31fb039c41e9bb9`, 20,358 characters, 245 lines, with exact string equality. The issue body also contains the submitted report payload. **Publication is PUBLISHED_VERIFIED.** No retry, duplicate issue, replacement, or direct-write bypass occurred.

## 2. Source and calculation cross-check

The following source claims and arithmetic were independently checked:

- The [GWOSC GW150914 event page](https://gwosc.org/events/GW150914/) reports L1 first and H1 later, with a 6.9 ms event-level delay and asymmetric bounds of +0.5/-0.4 ms. Its source-parameter tables use 90% credible intervals; those bounds must not be silently assigned the same coverage semantics.
- GWOSC's [technical-details page](https://gwosc.org/techdetails/) confirms 4 kHz/16 kHz strain products, 1 Hz data-quality and injection bitfields, and that the GW150914 v2 files use updated C02 calibration and correct the roughly 1 ms offset in the v1 4096 Hz down-sampled files.
- LALSuite 7.26 detector constants give the H1 and L1 Earth-centered vertex coordinates used in the Aster calculation. The [H1 constants](https://lscsoft.docs.ligo.org/lalsuite/7.26/lal/group___detector_constants.html) and [L1 constants](https://lscsoft.docs.ligo.org/lalsuite/7.26/lal/_l_a_l_detectors_8h.html) match the values in the report.
- An independent Python recomputation from those coordinates gives baseline vector `(-2087138.8816362, 1661588.54082, 1376093.2092) m`, baseline length `3,001,775.759551 m`, and light-travel time `10.0128461522 ms`.
- For the published central delay of 6.9 ms, `c Δt = 2,068,567.9602 m` and `c Δt / B = 0.689114753`. The 6.5–7.4 ms endpoints give projection fractions `0.649166071` to `0.739050604`. These reproduce the Aster report's rounded values.
- At 100 Hz, `c/f = 2,997,924.58 m`; the baseline-to-wavelength ratio is `1.001284615`. This is a dimensional comparison, not evidence of a physical resonance or an H(s)H coupling.
- Naselsky, Jackson and Liu, *Understanding the LIGO GW150914 event*, JCAP 08 (2016) 029, independently report a 6.9 ± 0.4 ms cross-correlation displacement from the 4096-second H1/L1 data. This is a separate analysis method applied to the same event/data lineage, not an independent experimental replication.
- The 35–250 Hz frequency sweep is stated explicitly in the original LIGO Scientific Collaboration paper, [arXiv:1602.03837](https://arxiv.org/abs/1602.03837). If the Aster report attributes that exact range to the GWOSC page, the primary-paper citation is the cleaner source attribution.

## 3. Geometric and epistemic disposition

The report's main interpretation is faithful: two-site timing supplies one scalar projection constraint. With the stated delay uncertainty it defines a sky annulus/ring, not a unique source direction. Antenna response, waveform, polarization and additional information are needed for localization.

The calculation is a source-reproduced geometric consequence of a published event-level delay and reference detector coordinates. It is not a raw-strain reanalysis, new measurement, H(s)H prediction, fit, or independent validation. No raw H1/L1 HDF5 files, event-time O1 calibration uncertainty/covariance files, or exact-window data-quality/injection flags were downloaded or parsed in this QC.

The original SAT archive table/source genealogy referenced by the Aster report was not independently reopened in this bounded pass. Its attribution remains Aster's source-read claim, not a new independent archival verification.

## 4. Formalization boundary

The geometric inequality `|b · n| ≤ ||b||` for unit `n` is a direct Cauchy–Schwarz consequence. No new Lean module, theorem, `#eval`, or exact-head CI run was performed in this cross-lane readback. **No Lean verification is claimed.** If this geometry is advanced into a formal mathematical claim, formalize the exact vector-space assumptions and execute Lean 4/Mathlib; compilation would verify only that formalized statement, not the empirical delay or the source-to-geometry translation.

## 5. P2 and ownership remain unchanged

P2 issue [#565](https://github.com/Satobloc/HsH/issues/565) remains open and no final physical system is selected. The Kelvin-vortex candidate remains candidate-only; GW150914 remains a complementary candidate, not a system selection or P2 admission. The Nov 30 gate remains HOLD pending raw data/version, calibration/covariance, a source-grounded H(s)H forward map, frozen baseline/holdout, exact geometry plot and independent hostile review.

No ownership, priority, paper gate, PR, task, scheduler, or BEDROCK status changed. No cross-agent consensus is inferred from this assistant-level QC.