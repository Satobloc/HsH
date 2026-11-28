# Enheduanna h1157:s2 — Lean verification and measured-system screen

**Disposition:** bounded research follow-up to [issue #2732](https://github.com/Satobloc/HsH/issues/2732) and [PR #2730](https://github.com/Satobloc/HsH/pull/2730). This is not a new theorem, P2 system selection, physical calculation, paper-gate advancement, or theory promotion.

## 1. Existing Lean result: merge-reference build verified

The existing PR #2730 merge-reference run [#46095621226](https://github.com/Satobloc/HsH/actions/runs/46095621226), job 140826163921, completed successfully. The job checked out merge commit `947ccd5e5ea...`, containing PR head `d68f6f4878f...`, and built the connected HsHVerification project with Lean 4.34.0 and Lake 5.0.0 (8,958 jobs).

The TimesheetQuotientComplement module formalizes the following conditional construction:

- Assume subspaces `L ≤ U` and `IsCompl L W`.
- Assume `finrank U = 3` and `finrank L = 1`.
- Then the quotient `U/L` has dimension 2 and is equivalent to the selected complement representation `U ∩ W`.

The theorem-specific `#print axioms` outputs for the four principal statements report `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` or `admit` appeared in those observed outputs. This is not a global axiom audit. Tests, lint, leanchecker, nanoda, and the global axiom audit were skipped. The result is a successful merge-reference build, not an exact-head standalone build or a merge.

**Physical-premise boundary:** the inclusion `L ≤ U` and complement `W` are explicit mathematical hypotheses selected for this formalization. The direct-source material summarized in the [Nathan Verified Words Compendium](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/NATHAN_VERIFIED_WORDS_COMPENDIUM.md) describes a four-dimensional tube, a one-dimensional core, a three-dimensional boundary, and possible timesheet-mouth/worldsheet structures, but does not itself select this quotient inclusion or complement. The proof does not derive those premises from H(s)H, construct the smooth embeddings/projection maps, establish time evolution or responsive-medium coupling, or yield an observable prediction.

The existing Kestrel moving-slice and transverse-intersection modules also compiled in the same connected project. They remain separate conditional toy-geometry results, not physical equivalences. PR #2730 remains OPEN / DRAFT / UNMERGED.

## 2. Measured-system candidate screen

This screen distinguishes actual experiments and open observational data from raw-data availability and model readiness.

| Candidate | Measurement evidence | Data and uncertainty status |
|---|---|---|
| Wire rope under periodic excitation in a friction hoist (2020) | A measured 6×19WS+FC, 8 mm wire rope in a moving friction-hoist rig; total acquisition 2 kHz and individual groups 500 Hz. | The paper says supporting data are available from the corresponding author upon request. Sensor identity, calibration, synchronized timebase, signal units, and quantitative uncertainty/covariance are not fully specified in the article. [DOI 10.1155/2020/8506016](https://doi.org/10.1155/2020/8506016) |
| Seven-wire helical fretting contact (2023) | Six 1 mm outer steel wires around a 1.1 mm core, tested under helical contact and tension–torsion coupling. | Open-access article, but no raw-data repository or quantitative uncertainty/covariance was identified in the accessible record. Sampling/timebase and calibration details remain unverified. [DOI 10.1007/s40544-022-0665-y](https://doi.org/10.1007/s40544-022-0665-y) |
| Vortex-ring / moving-wall PIV (2016) | Actual time-resolved PIV experiments on finite-core vortex-ring interaction with a moving wall. | Raw-data repository, acquisition rate, calibration, and quantitative uncertainty were not established from the accessible abstract. [Record](https://scispace.com/papers/time-resolved-piv-measurements-of-the-flow-field-associated-5cwc485frz) |
| Vortex-ring transition by 3D scanning TomoPIV (2016) | Experimental time-resolved scanning tomographic PIV; reports a 4D flow field and secondary vortex-filament formation at piston-based `Re_p = 4650`. | Raw-data repository, sampling/timebase, calibration, and quantitative uncertainty were not established from the accessible record. [Record](https://scispace.com/papers/transition-of-a-vortex-ring-visualized-by-3d-scanning-ygcnmo231h) |
| GWOSC / GWTC inspiral strain | Public calibrated LIGO/Virgo strain time series, including O1/O2 and later catalog releases. | 16,384 Hz strain is available; 4,096 Hz downsampling introduces documented anti-aliasing errors near Nyquist. The calibrated band is 10 Hz–5 kHz, and calibration-uncertainty files are available. This is a strong data-access candidate for an inspiral comparator, but no H(s)H forward observable has been specified. [GWTC-1 documentation](https://gwosc.org/GWTC-1/), [O2 technical details](https://gwosc.org/o2_details/), [GWTC-5.0 documentation](https://gwosc.org/GWTC-5.0/), [LIGO/Virgo calibration uncertainty files](https://dcc.ligo.org/LIGO-T2100313/public). |

The rope experiments are actual measured contact/torsion systems, but they are not evidence of a universal climbing-rope law or of physical equivalence to H(s)H. The vortex-ring studies are closer to finite-core contact and 3D flow geometry, but their raw-data and uncertainty packages have not been verified. GWOSC provides the strongest open-data path for inspiral, but the H(s)H observable and waveform/model-dependence contract are still missing.

## 3. Gate disposition

- No measured system is selected for P2.
- No raw measurement data were downloaded or analyzed.
- No physical calculation, fit, prediction, uncertainty propagation, or CODATA numerical comparison was performed.
- No corrected SAT-O/Blockwave equation, manuscript, BEDROCK entry, or theory status was changed.
- The WWRD climbing-rope construction remains a first-blush geometric heuristic, not a physical equivalence.

The next valid step is to select one measured system only after its exact dataset/version, provenance, units, acquisition/calibration, uncertainties/correlations, and a falsifiable H(s)H observable are all specified. Until then, P2 remains HOLD.
