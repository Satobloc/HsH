# Worldtube-to-observable gate: typed maps, identifiability, and the M87 readout

**Status:** additive architecture note and source reconciliation. This is not a new physical prediction, fit, or theory promotion. It extends [HsH #1407](https://github.com/Satobloc/HsH/issues/1407), [#1341](https://github.com/Satobloc/HsH/issues/1341), [#1301](https://github.com/Satobloc/HsH/issues/1301), and [#1385](https://github.com/Satobloc/HsH/issues/1385). M87 remains a candidate readout, not the selected P2 system.

## 1. Typed map chain

Theta_H(s)H -> history H -> finite-core worldtube W -> trace S_Sigma = W intersect Sigma -> source state X -> polarized transfer (I,Q,U,V) -> calibrated interferometric visibilities -> reconstructed images -> beta_2.

The missing map is G: S_Sigma -> X, where X must contain the declared metric, magnetic field, electron density, emissivity and other physical state variables required by the standard radiative-transfer calculation. G must be derived from the source geometry and interaction law, not supplied as an unconstrained per-epoch fit.

A direct readout D: Theta_H(s)H -> O must agree pointwise with the staged composition. This is the operational use of the projection-coherence result in [PR #388](https://github.com/Satobloc/HsH/pull/388). It checks consistency of supplied maps, not their physical correctness.

## 2. Dimension/type gate

In a 4D ambient spacetime, under submanifold and transversality conditions, generic intersection dimension is dim(A)+dim(Sigma)-4. For a 3D timesheet:

| Carrier/support | Generic trace dimension |
|---|---:|
| 1D curve/worldline | 0D |
| 2D worldsheet | 1D |
| 3D hypersurface | 2D |
| 4D worldtube region | 3D |

A 1D centerline alone cannot produce a 3D trace on a 3D timesheet under transverse intersection. If a 3D trace is required, the source must specify a 4D support region or another explicitly typed construction. Existing conditional formalizations are in [PR #1133](https://github.com/Satobloc/HsH/pull/1133) and [PR #873](https://github.com/Satobloc/HsH/pull/873).

## 3. Identifiability and evidence lineage

For a projection pi:X->Z, a target observable g:X->Y can be represented downstream of pi only if it is constant on every fibre of pi. If two admissible states collapse to the same projected state but predict different target observables, the proposed readout has discarded information needed by the claim. See [PR #873](https://github.com/Satobloc/HsH/pull/873).

Attach provenance to every map: source/acquisition IDs, transformation and pipeline versions, instrument/calibration IDs, units, covariance/uncertainty source, calibration/holdout assignment, standard comparator and pre-registered falsification statistic. The existing [Ariadne evidence-lineage contract](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ARIADNE/2026-10-30T1913Z_EVIDENCE_LINEAGE_IDENTIFIABILITY_CONTRACT.md) supplies the proposed fields. Repository readback is not independent measurement.

## 4. M87 beta_2 is a downstream image readout

The published ring-mode observable is built from complex linear polarization P=Q+iU:
beta_m = (1/I_ring) integral over the specified annulus of P(rho,phi) exp(-i m phi) rho dphi d rho.
The EHT analysis notes sensitivity to image centering, resolution and restoring-beam size. These belong in the measurement map and shared calibration record; beta_2 is not a direct measurement of worldtube twist.

The 2025 EHT M87* 230-GHz cross-epoch table reports |beta_2| ranges of 4.0–7.0% (2017), 0.5–2.0% (2018), and 1.8–3.9% (2021), with phase ranges -163° to -127°, -156° to -99°, and 156° to 168°. The 2017 row is sourced to the 2021 EHT analysis. The 2025 paper notes that the earlier analysis covered four 2017 observing days, whereas its own 2017 discussion focuses on April 11. Therefore the narrower 2017 April-11 interval used in [HsH #1297](https://github.com/Satobloc/HsH/issues/1297) (4.5–5.5%, phase -141° to -128°) must remain labelled as a distinct date/method subset until its exact extraction and uncertainty source are recovered. Do not mix it with the 4.0–7.0% cross-day range or combine their endpoints into one ratio.

The official EHT data portal lists a 2017 product (2023-D01-01) and a 2018+2021 calibrated-polarimetry product (2026-D01-01, updated 2026-06-29). Catalog availability is confirmed; files, cross-hand products and full covariance were not downloaded or independently checked in this run.

Primary sources: [EHT Collaboration 2025, arXiv:2509.24593](https://arxiv.org/abs/2509.24593); [EHT Collaboration 2021, First M87 EHT Results VII](https://arxiv.org/abs/2105.01169); [official EHT data products](https://eventhorizontelescope.org/for-astronomers/data).

## 5. Conditional test matrix

| Hypothesis | Predicted observable | Standard comparator | Calibration/holdout | Falsification condition |
|---|---|---|---|---|
| Pure spatially uniform phase rotation | P -> exp(i delta_chi)P; for a fixed annulus and image operator, |beta_2| is invariant | Standard Faraday rotation under the same transfer and imaging operator | Freeze center, annulus, beam, frequency, Jones/D-term calibration and reconstruction. Reject this narrow phase-only map only if matched uncertainties exclude the invariant-amplitude prediction. Published ranges alone do not supply joint covariance. |
| Spatially varying H(s)H twist or finite-core response | A source-derived delta_chi(rho,phi,t,nu) or mode-coupling law predicts a specific complex beta_2 change | GRMHD plus polarized synchrotron transfer and internal/external Faraday-screen alternatives through the same instrument pipeline | Freeze geometry/coupling on calibration data; hold out an epoch or frequency without refitting | Reject the frozen map if its pre-registered visibility-domain statistic crosses threshold while the matched standard comparator passes. G:W->X is not defined, so no H(s)H prediction or threshold exists today. |
| Core thickness epsilon, coil scale or contact surface | No unique beta_2 signature until geometry is mapped to fields/emissivity and transfer | Same GRMHD/radiative-transfer baseline | Requires an independent channel or spatially resolved observable | Not identifiable from beta_2 alone; do not fit a free thickness/twist/contact parameter and call it a prediction. |

A uniform phase-only effect is not a distinctive H(s)H signature: standard Faraday rotation can also supply a phase rotation. A distinguishable H(s)H result must predict constrained spatial/frequency/epoch structure that the matched standard comparator cannot absorb. The candidate p_PPC<0.01 criterion in #1385 remains a proposal, not a frozen threshold.

## 6. Forced versus optional geometry

Forced by the current source commitments, conditional on accepting them: keep the 1D centerline, finite-core 4D worldtube support, and 3D interacting timesheet as different typed objects; keep core thickness epsilon distinct from first-order coil scale; and provide an explicit map if a 3D intersectional trace is claimed.

Not yet forced: a particular normal-bundle construction, cross-sectional profile, twist connection, contact-surface topology, boundary law, per-rotation creation mechanism, or map from the worldtube to electromagnetic/plasma variables. These remain optional until derived and independently tested. A Kerr spatial section is a candidate fibre, not a completed embedding. The WWRD climbing-rope picture remains a first-blush heuristic, not a physical equivalence.

## 7. Formal and epistemic status

- PR #388 (projection coherence), PR #873 (projection-fibre identifiability/incidence), and PR #1133 (carrier/slice dimension gate) have successful merge-reference Lean builds. Their workflows skipped some combination of tests, lint, nanoda and the separate axiom audit; these are not exact-head/full-audit receipts.
- PR #790 has a successful exact-head Lean build for claim-scoped lineage, but its stronger independent-support outcome remains unreachable in the current schema.
- PR #1296, which attempts the uniform-phase-rotation lemma, currently fails compilation; no Lean proof is claimed for that lemma.
- Lean checks only the formalized statements under their premises. It does not validate the translation from H(s)H geometry to these maps, physical premises, calibration or observations.

No new physical calculation, fit, raw-data download, H(s)H prediction, paper-gate advancement or BEDROCK promotion is made here. M87 remains a candidate readout, not the selected P2 system. Next empirical step: retrieve and hash the public EHT products, preserve calibration/provenance, establish a common measurement operator and covariance, then freeze the geometry-to-source-state map before holdout scoring.

## 8. Source-equation provenance boundary

No SAT-O or Blockwave equation was altered or corrected here. Keep originals separate:
- SAT4D_LIVE_DRAFT.txt, blob 2a79fe25018cce7e99a2c33786d88b0551db6ae7, archive file dates 2025-06-08 / 2025-06-09; bylined historical draft with AI assistance acknowledged.
- SAT O1 4D.txt, blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc, archive file dates 2025-06-07 / 2025-06-09; separate, unbylined file with a different printed centreline parameterization.
- BLOCKWAVE.txt, blob ffdb8aadb6ac93e3c9d5f48aad8153dcedaf997d, uploaded 2025-09-16; embedded author unresolved. The 2025-10-19 assistant re-output is an assistant reconstruction, not an independent original. No complete corrected J2/J3 action is established.

This is an architecture and source-lineage aid only. It promotes no equation, model or empirical claim to BEDROCK.
