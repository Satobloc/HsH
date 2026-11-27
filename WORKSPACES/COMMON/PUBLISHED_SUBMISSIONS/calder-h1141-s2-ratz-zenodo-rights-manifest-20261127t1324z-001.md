# Calder h1141:s2 — Ratz Zenodo rights/manifest amendment

**Run key:** `REVROT3-19-20261011:1141:s2` · **Date:** 2026-11-27  
**Disposition:** additive source-readiness update to Hale's H1031 report and [P2 register #565](https://github.com/Satobloc/HsH/issues/565); not a new candidate or Lane 24 cycle.

## Source and rights correction

Ratz et al.'s low-Reynolds-number accelerating/decelerating hover-propeller experiment is associated with [Zenodo record 10.5281/zenodo.23083730](https://zenodo.org/records/23083730) and arXiv `2611.07862v1`. The record is version 1.0.0, published 2026-10-05; the arXiv v1 preprint was submitted 2026-11-05. The README describes the paper as “to appear” in *Aerospace Science and Technology*; no final journal DOI/version was verified.

**Correction:** the current Zenodo landing page explicitly displays **CC BY 4.0**, superseding the earlier H1031 `license not verified` snapshot. This is a source-reported rights field, not an independent legal opinion.

| File | Displayed size | Zenodo MD5 (source-reported) |
|---|---:|---|
| `data_piv_slipstream.h5` | 108.0 MB | `8a989c06eda8706fc9307e504b9b4282` |
| `data_piv_span.h5` | 321.0 MB | `afd64ac608bfc00462493677a9a9872b` |
| `data_thrust.h5` | 1.8 MB | `71152df1562c12212d6bb7948f86c63c` |
| `example_script.py` | 3.1 kB | `b3fb50416865891f8ecebe59690a455a` |
| `experimental_setup.pdf` | 718.2 kB | `7e6b065fa5e69bdd874646e677760b3a` |
| `README.md` | 21.7 kB | `09392b956886108d66d16319c494527d` |

The displayed file package is about 431.5 MB; Zenodo's separate 28.0 GB `data volume` statistic is not the downloadable-file sum. HDF5 payloads were not downloaded; MD5 values are not independently recomputed.

## Measured system and acquisition limits

The README describes a two-bladed 310.5 mm diameter propeller in hover (\(R=0.15525\ \mathrm{m}\)); air density is supplied as \(\rho=1.2\ \mathrm{kg\,m^{-3}}\). No CODATA constant is used and no CODATA comparison is attempted.

The experiment uses 0°, 5°, and 10° pitch offsets and step-up/step-down transients. The documented transient programme has 500 repetitions per step response in five batches of 100 cycles. Thrust/torque and rotor speed use a FUTEK QMA150 cell and CUI AMT11 encoder. PIV is 2D-2C (LaVision sCMOS / Quantel Evergreen), acquired at 15 Hz and phase-locked to revolution count (every sixth revolution at maximum speed; six \(M\bmod6=k\) phase classes). Thrust/speed include 10 kHz channels, but the released time-series arrays are ensemble averages over the 500 repetitions.

Documented units include \(T\) in N, \(n\) in rpm, \(t\) in s, PIV velocity normalized by tip speed, positions by \(R\), and tip-vortex circulation by \(u_{\rm tip}R\), with \(u_{\rm tip}=2\pi nR/60\).

Raw camera images and instantaneous PIV velocity fields are not included. The slipstream HDF5 does include derived instantaneous tip-vortex detections (`x_tip_inst`, `y_tip_inst`), arranged by vortex-age row and snapshot column; these are detector outputs, not raw fields or persistent material markers. The documented schema exposes no per-cycle acquisition IDs or batch IDs for a run-stratified holdout. Do not treat repetitions, snapshots, detections, or pixels as independent experimental units without source-backed parentage.

The README documents `T_fit_coeffs`, `T_fit`, and `CT_fit`: a second-order polynomial fit to steady thrust versus rpm. Transient \(\Delta C_T\) is defined relative to that fitted baseline, so it is a **fit-conditioned deviation**, not a blind prediction. `Unc_Delta_CT` is an expanded 95% uncertainty (\(k=1.96\)); the prior H1031 report contains the paper-derived uncertainty details. No full joint covariance/registration package is supplied in the documented release.

## Explicit projection boundary

The two released PIV products are separate observation maps:

\[
\Pi_{\rm span}:\ \text{flow}\to(U,V)_{\rm blade}(x/c_x,y/c_x;r/R,\text{phase}),
\qquad
\Pi_{\rm slip}:\ \text{flow}\to(U,V)_{\rm lab}(X/R,Y/R;r/R,\text{phase}).
\]

They are different 2D-2C planes in different frames, not one registered 3D velocity field. A composition to a 3D worldtube needs calibrated blade-to-lab registration, synchronized time/phase identity, and source-backed acquisition parentage. Those maps are not supplied. This is a rotation-response / processed-vortex-observable candidate, not a complete finite-core/contact/inspiral worldtube measurement or an H(s)H equivalence.

## Existing conditional Lean work; no duplicate

- [PR #1189](https://github.com/Satobloc/HsH/pull/1189), head `3f344a3f120a9ed63c1836549e3bcb696589eaea`, exact-head Lean 4.34.0/Lake 5.0.0 build [#45616238757](https://github.com/Satobloc/HsH/actions/runs/45616238757), 8,963 jobs; includes `NadirVortexTwoChannelReadout`, `NadirProjectionCoarseGrainFactorization`, and `NadirWitnessCarryingComposition`.
- [PR #1515](https://github.com/Satobloc/HsH/pull/1515), head `b34a74885c79dbec983ad071b6f86db5676d5e28`, exact-head Lean 4.34.0/Lake 5.0.0 build [#44011692583](https://github.com/Satobloc/HsH/actions/runs/44011692583), 8,958 jobs; includes `CalderKelvinAngularSampling`, `CalderUnitLineageHoldout`, and `CalderIndependenceProfile`.
- [PR #2330](https://github.com/Satobloc/HsH/pull/2330) is not exact-head verified: inspected build checked out `1694c184ab74a796500481ce04b995f0b00cd4c6`, while current PR head is `07ae5a4c342dea19f7734da6ba867ea85d7958c3`.

These formal results establish conditional projection/sampling algebra and the requirement that folds factor through a declared acquisition-unit map. They do not establish real-world independence, authenticate IDs, recover missing raw data, or validate physics. The Ratz release does not expose the per-cycle IDs needed to instantiate the unit-lineage theorem. No new Lean module/build was created because the relevant mathematics already exists and the empirical premises are absent. The theorem-specific standard axiom reports and skipped global audit/tests/lint remain as recorded in the build logs.

## Disposition

P2 remains **HOLD**; Lane 24 remains Cycle 08/08 complete / BACKSEAT / HOLD; no Cycle 09. No physical calculation, fit, prediction, uncertainty propagation, CODATA comparison, independent measurement, Mersearch request, or H(s)H promotion was made. No WWRD rope universality is asserted; climbing-rope material remains a first-blush heuristic. No new tool, dependency, fork, subscription, or expenditure.

**Next evidence gate:** source-backed batch/run IDs and per-cycle or raw PIV data, calibration/covariance, and cross-plane registration. Only then freeze a whole-run/whole-batch holdout and compare a predeclared H(s)H observable against a standard rotor-wake baseline.
