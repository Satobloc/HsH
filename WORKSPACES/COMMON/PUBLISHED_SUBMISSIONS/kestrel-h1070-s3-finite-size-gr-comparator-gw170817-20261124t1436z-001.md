# Worldtube-to-waveform discriminator: finite-size GR comparator and GW170817 candidate

**Date:** 2026-11-24  
**Run key:** `REVROT3-19-20261011:1070:s3`  
**Routing label:** Kestrel (ring index 14); next label Meridian (index 15). This is an assistant-level, source-grounded synthesis, not an authenticated Kestrel instance or thread.  
**Status:** Public-safe architecture addendum. Candidate test design only. No physical calculation, data download or reanalysis, fit, H(s)H prediction, P2 system selection, or theory promotion.

## Scope and non-duplication

This note extends, without replacing:

- P2 candidate ledger, issue [#565](https://github.com/Satobloc/HsH/issues/565);
- source-to-observable map contract, issue [#1341](https://github.com/Satobloc/HsH/issues/1341);
- the existing M87 holdout and four-outcome comparator gate, issue [#1385](https://github.com/Satobloc/HsH/issues/1385);
- Kestrel's near-fiber/frozen-readout composition work and the existing evidence-gated readout formalizations;
- the November 24 source-authority correction, [Morrow h1066:s3](https://github.com/Satobloc/HsH/issues/2489).

It does not repeat the M87 test design, select a P2 system, or change P2 ownership. The proposed BNS waveform path is a new candidate branch of the existing measurement architecture, not a final system selection.

## 1. New comparator requirement: GR finite-size theory, not point-particle GR alone

A worldtube or finite-core description is not, by itself, an H(s)H-specific prediction. Standard general relativity already has mature descriptions of extended bodies and finite-size response:

- Goldberger and Rothstein encode internal finite-size structure in effective worldline couplings; tidal response enters through higher-order curvature operators whose coefficients are fixed by matching ([Phys. Rev. D 73, 104029](https://doi.org/10.1103/PhysRevD.73.104029), [arXiv:hep-th/0409156](https://arxiv.org/abs/hep-th/0409156)).
- Harte treats extended bodies with essentially arbitrary shape, spin, internal composition, and multipole structure in GR ([Class. Quantum Grav. 29, 055012](https://doi.org/10.1088/0264-9381/29/5/055012), [arXiv:1103.0543](https://arxiv.org/abs/1103.0543)).
- Higher multipoles are not an exotic H(s)H signature by themselves. Harte and Ramond's 2026 analysis shows that octupole and higher moments can affect motion in GR ([arXiv:2607.21314](https://arxiv.org/abs/2607.21314)).

Therefore the minimum standard comparator for a binary-neutron-star waveform is not merely a point-mass GR waveform. It must include the relevant standard spin, tidal, multipole, equation-of-state, waveform-systematic, and detector-calibration freedoms. A H(s)H core, twist, or contact parameter that simply re-labels an allowed GR finite-size coefficient does not create a distinct observable.

**New discriminator rule:** H(s)H must derive a source-constrained relation among the standard finite-size response coefficients, or a detector-level readout outside the matched GR predictive fibers. The relation must be fixed before holdout access. If the H(s)H geometry can be absorbed by a reparameterization of the standard multipole/tidal coefficients, the result is representational equivalence within that measurement domain, not a new prediction.

## 2. Source authority: what is forced, and what remains optional

The November 24 Morrow correction is the controlling source-authority record. It distinguishes a directly named object from a mathematically specified support and map.

| Item | Current source status | What is not yet forced |
|---|---|---|
| Finite-core worldtube/filament object | Directly supported as an object-role description | Intrinsic support dimension, embedding, normal-fiber construction, quantitative thickness law/profile |
| 4D filament / 3D trace language | Directly described as a geometric relation | That the finite-core object itself has a 4D support, or that one unique intersection map produces the trace |
| 3D time-surface / slice / bulk interacting with matter | Directly described as an interaction role | A typed interaction operator, coupling, domain, codomain, or composition law |
| RΣ | Directly named readout role | A complete map from H(s)H support to a physical state and then to measured data |
| Twist / framing | Optional unless separately sourced and typed | A normal-bundle connection, frame, transport law, or independent twist observable |
| Contact surface | Optional as a specific geometric object | A second support, contact relation, boundary condition, or constitutive interaction law |
| 2D worldsheet reduction | Optional representation | A section, quotient, projection, and composition conditions |

The direct November 8 Crullerverse source keeps the fourth spatial direction `w` distinct from time-proper and leaves three mouth/timesheet constructions open; see the source-to-Lean crosswalk in [H1044:s0](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/KESTREL/2026-11-23T1200Z_H1044_S0_CRULLERVERSE_W_TIME_PROPER_SAT4D_TYPE_FIDELITY.md). That source does not supply a map from the spatial geometry and time-proper parameter to a Lorentzian spacetime or gravitational-wave phase. The earlier assistant inference that the finite-core object itself has a mathematically specified 4D support is not adopted; the November 24 Morrow correction controls. The three mouth/timesheet alternatives remain separate.

Within BR-006, geometric interaction/constraint is a framework premise. That does not force a particular material contact hypersurface or boundary topology. A contact surface becomes necessary only if a source-defined interaction law or a measured response requires one.

## 3. Minimum typed map chain for a gravitational-wave comparison

The candidate chain is:

```text
H(s)H finite-core geometry, w, time-proper, timesheet
  -> Phi_core: geometry to stress-energy / multipoles / tidal response
  -> Phi_metric: geometry and time to Lorentzian metric and causal propagation
  -> Phi_dyn: interaction law to orbital dynamics and energy-momentum exchange
  -> Phi_wave: source dynamics to h_plus(t), h_cross(t)
  -> Phi_det: polarizations to H1/L1/V1 detector response
  -> Data: calibrated strain, PSD, calibration uncertainty, data-quality masks
  -> Frozen common readout and held-out predictive score
```

The first three H(s)H-specific maps are not yet defined. In particular:

1. `Phi_core` must say how the finite-core object becomes a stress-energy distribution or a set of multipole/tidal-response coefficients.
2. `Phi_metric` must reconcile the H(s)H spatial `w` and time-proper construction with the Lorentzian metric and causal propagation used by the GR waveform comparator, or provide an explicit alternative field equation and wave-propagation law.
3. `Phi_dyn` must show how twist, timesheet interaction, or interbraid constraint changes the orbital dynamics or waveform. A geometric noun is not a constitutive law.
4. `Phi_det` must use the same detector operator, calibration record, sampling, and measurement mode for both candidate models.

Every arrow needs a declared domain, codomain, units, frame/gauge convention, conditions, uncertainty transfer, and composition order. No map may be inferred from shared vocabulary.

## 4. Candidate test matrix: GW170817 waveform sector

This is a candidate matrix, not an executed analysis or final P2 system selection.

**Measured system and data provenance candidate**

- Event: GW170817, 2017-08-17 12:41:04.43 UTC; GPS `1187008882.43`.
- Detectors: LIGO Hanford (H1), LIGO Livingston (L1), Virgo (V1).
- Observable: calibrated strain `h(t)`, dimensionless; published data products include 16,384 Hz and 4,096 Hz sampling.
- Primary event page and dataset DOI: [GWOSC GW170817](https://gwosc.org/events/GW170817/), DOI [10.7935/K5B8566F](https://doi.org/10.7935/K5B8566F).
- Data products must not be mixed: LIGO [P1700337](https://dcc.ligo.org/LIGO-P1700337/public) contains the pre-noise-subtraction C00 data with online calibration (4,096 seconds); [P1700349](https://dcc.ligo.org/LIGO-P1700349/public) contains the 2,048-second noise-subtracted products used with offline parameter estimation. The latter removes the L1 glitch but has documented H1/L1 excess noise below 20 Hz and an H1 window-function artifact in roughly the last 150 seconds. The raw product retains the L1 transient about 1.1 seconds before coalescence. Virgo's signal is below the noise level for this event. These are distinct analysis products, not interchangeable files. P1700349 records H1 C00 calibration v2, L1 C00 calibration v3, and Virgo V1O2Repro1A, with LIGO `DCS-ANALYSIS_READY_C01:1` and Virgo `ITF_SCIENCE:2` science segments. P1700337 uses the online C00 calibration and the earlier `DMT-ANALYSIS_READY:1` / `ITF_SCIENCE:1` segments.
- A primary product, exact release version, checksums, PSD, calibration uncertainty, data-quality mask, and posterior-sample source must be frozen before analysis. GWOSC supplies 1 Hz data-quality and injection bitfields; preserve the DATA/CAT1/CAT2/CAT3 flags and reject or explicitly model invalid intervals. Calibration files quantify frequency-dependent magnitude and phase uncertainty. The public strain is high-pass filtered at 8 Hz and is not calibrated below 10 Hz; 4,096 Hz files are decimated from 16,384 Hz and must not be silently mixed with the native-rate product. The published GW170817 tidal analysis demonstrates that finite-size tidal response already changes the waveform and is constrained by the data ([LIGO/Virgo radius and EOS analysis](https://arxiv.org/abs/1805.11581)).

**Candidate event-level holdout**

GW190425 is a possible independent compact-binary holdout, not a clean BNS replication by default. Its [LIGO P2000026-v2 release](https://dcc.ligo.org/LIGO-P2000026/public) provides posterior/prior samples, L1 and V1 PSDs, calibration-uncertainty envelopes, and the parameter-estimation configuration; strain is available through GWOSC. The discovery analysis says the component masses are consistent with neutron stars but does not rule out one or both being black holes ([arXiv:2001.01761](https://arxiv.org/abs/2001.01761)). The published discovery analysis reports an L1 detection and says Virgo data were used only for subsequent parameter estimation because of low SNR; the cited P2000026 release supplies PSDs for L1 and V1 only. Treat this as a conditional holdout or stress test until the source-class assumptions and detector coverage are accepted. A later well-classified BNS event may be preferable.

| Hypothesis to test | Shared parameters and calibration | Candidate calibration / holdout | Predicted observable | Matched standard comparator | Current eligibility |
|---|---|---|---|---|---|
| H(s)H recovery limit | Component masses, spins, distance, inclination, sky position, EOS/tidal priors, waveform family, PSD, calibration and data-quality treatment | GW170817 calibration; independent BNS event required for holdout | Same calibrated strain and waveform posterior as the GR limit | GR finite-size waveform with matched priors and detector model | `MAP_INCOMPLETE`; recovery is a consistency target, not distinctive support |
| Finite-core response | All shared parameters above; H(s)H-only coefficients must be derived, not tuned on holdout | GW170817 candidate calibration; GW190425 only conditional holdout | Constrained relation among tidal response / multipole coefficients and the frequency-domain phase `Psi(f)` | GR worldline EFT with tidal and multipole operators | Not eligible until `Phi_core`, `Phi_metric`, and the H(s)H coefficient relation exist |
| Twist / framing response | Shared spin priors and calibration; no extra free twist parameter without a source-defined map | Same candidate event split; event-level replication required | A derived spin-coupled multipole or phase relation not absorbable into standard spin-induced moments | GR spin and higher-multipole response | Not eligible until a source-defined frame/connection and transport law exist |
| Contact / interbraid response | Shared EOS, tidal, merger, detector and calibration treatment | Late-inspiral / merger data, then an independent event or detector regime | A derived, localized phase/amplitude or post-merger feature | GR tidal/merger waveform with the same EOS and numerical-relativity uncertainty | Not eligible until a second support, contact relation, and constitutive law exist |

The existing [issue #1385](https://github.com/Satobloc/HsH/issues/1385) already supplies the four possible H(s)H-versus-comparator outcomes and the separate `MAP_INCOMPLETE`, `UNIDENTIFIABLE`, `UNSCORABLE`, and eligible states. Reuse that table; do not create a second outcome taxonomy.

**Falsification rule:** after the H(s)H map, exact data product, common readout, shared nuisance parameters, model discrepancy, PSD, calibration uncertainty, and holdout split are frozen, preregister a predictive criterion on the held-out strain. Reject only the frozen H(s)H map for that system and observable if its holdout prediction fails the predeclared criterion while the matched comparator passes. If both pass, the result is nondiscriminating at the tested resolution; if both fail, report joint misfit. No numerical threshold is assigned here because the data product, covariance, and H(s)H predictive map are not yet fixed.

## 5. Existing formal architecture reused; no new Lean theorem

The required detector-level mathematics already exists in the current draft stack. The inspected Actions logs report Lean 4.34.0 / Mathlib:

- [PR #2327](https://github.com/Satobloc/HsH/pull/2327) formalizes shared-readout fiber separation and an evidence-gated common readout. Current head `2b641ce6b552747045eaa1e2844f6b0e810d65ea`; Actions run [#45094406016](https://github.com/Satobloc/HsH/actions/runs/45094406016) built merge commit `b564c38` with 8,948 jobs. Six theorem-specific axiom reports for the readout module report no axioms. This is a merge-reference build, not a standalone exact-head build; tests, lint, leanchecker, nanoda, and the separate axiom audit were skipped. The theorem is set-level and does not itself provide a physical map, noise model, or covariance.
- [PR #2323](https://github.com/Satobloc/HsH/pull/2323) supplies Kestrel's near-fiber error-bound layer. Actions run [#45091725762](https://github.com/Satobloc/HsH/actions/runs/45091725762) compiled the merge reference at head `62198155` with 8,959 jobs. The relevant `observedNearFiberSeparationBound` and its corollaries report `propext`; tests, lint, nanoda, and axiom audit were skipped. Its abstract bound is not a detector covariance.
- [PR #2397](https://github.com/Satobloc/HsH/pull/2397) supplies a factorized detector-error transfer layer. Run [#45107637381](https://github.com/Satobloc/HsH/actions/runs/45107637381) built the merge reference with 8,959 jobs. The three new theorem-specific reports list `propext`, `Classical.choice`, and `Quot.sound`; tests, lint, nanoda, and axiom audit were skipped.
- [PR #2330](https://github.com/Satobloc/HsH/pull/2330) is the important heterogeneous-carrier and evidence-gated admission bridge. It requires declared source-system, dataset, and readout identities; an external binding witness; H(s)H and standard maps/state sets; and two-sided detector separation through one frozen readout. Current head `1ce668b23bfa4513e6dfb92a2420d1eed13171e5`; run [#45125583538](https://github.com/Satobloc/HsH/actions/runs/45125583538) built merge commit `2a07796` with 8,952 jobs. The new `EvidenceGatedAdmission`, `HeterogeneousReadoutFiberSeparation`, and `UncertaintyRobustSeparation` theorem-specific reports contain no axioms. Tests, lint, leanchecker, nanoda, and global axiom audit were skipped. PR remains open/draft/unmerged and the build is a merge-reference, not a standalone exact-head run. All four cited PRs remain open/draft/unmerged; no mainline integration is implied.

These Lean builds check the formalized statements on their recorded commits. They do not authenticate the external binding witness, validate the source translation, establish a physical premise, or prove that GW170817 is an H(s)H system. No new Lean code was needed for this architecture addendum.

## 6. Decision and next cursor

- `P2`: HOLD. GW170817 is a candidate only, not a selected P2 system.
- Current eligibility: `MAP_INCOMPLETE / PREDICTION_NOT_FORMED / NO_REANALYSIS / NO_THRESHOLD`.
- The next substantive step is to source and type the H(s)H geometry-to-stress-energy/multipole map, the spatial-geometry/time-proper-to-Lorentzian metric map, and the interaction-to-waveform map. In parallel, freeze one exact GW170817 data product and recover its strain, PSD, calibration uncertainty, data-quality masks, posterior-sample provenance, and checksums.
- Then instantiate the existing evidence-gated heterogeneous comparison object with the same detector readout for H(s)H and GR. Only after those gates pass should a physical calculation or held-out prediction be run.

No physical calculation, dataset download, reanalysis, fit, prediction, numerical falsification threshold, new Lean module, SAT-O or Blockwave equation correction, manuscript edit, P2 selection, or BEDROCK promotion occurred. No new tool, dependency, fork, subscription, or paid service was introduced.
