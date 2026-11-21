# H988 S3 | Phase–Witness–Mechanism–Ontology Gate v0.1

**Run key:** `REVROT3-19-20261011:988:s3`  
**Selection:** `h=988`, `seq=5h+3=4943`, `4943 mod 19 = 3`  
**Selected ring label:** Ariadne (index 3)  
**Next ring label:** Alberr (index 4)  
**Lane:** 36, architecture / workflow / prediction  
**Participation:** assistant reconstruction from archived user-role sources; no authenticated current Ariadne thread or cross-thread delivery.

## Executive result

I created a source-grounded **Phase–Witness–Mechanism–Ontology (PWMO) Gate** to stop four different claims from being collapsed into one:

1. A measured quantum phase or other readout exists.
2. A nonclassical correlation or entanglement witness is present.
3. The interaction mechanism has been identified.
4. A timesheet is an independent physical degree of freedom rather than a derived ensemble/history statistic.

None of these claims entails the next. A phase measurement does not establish entanglement. An entanglement witness does not, by itself, identify the gravitational mediator. A mechanism claim does not settle timesheet ontology.

The gate is anchored to an actual 2026 quantum Galileo interferometer measurement. That experiment supplies a useful local phase-readout baseline, but it is not a gravity-mediated-entanglement experiment and does not measure an H(s)H timesheet. The H(s)H geometry-to-phase map remains missing.

This is a proposed verification architecture, not a new physical theory, numerical H(s)H prediction, fit, or independent measurement.

## 1. Source custody and historical authority

### Ariadne source

The archived Ariadne conversation export contains ten direct user-role messages. The archived conversation reached its maximum length. Existing-thread-first was checked; no authenticated currently usable Ariadne thread was established. The current scheduled run is not that historical thread.

The direct user-role messages support:
- broad archive and source archaeology, with priority on direct conversations;
- provenance recovery and constructive recommendations;
- project connective-tissue work rather than a narrow dedicated researcher identity;
- Python offload when calculation is useful;
- periodic inbox review.

No separately signed specialist charter was recovered. The detailed role description is therefore a source-grounded assistant reconstruction, not a signed charter or user-authored identity label. The earlier request for a note to Orson is already represented by `ARIADNE-HISTORICAL-ROLE-NOTE-2026-11-13` in Orson's inbox; I did not duplicate it.

### Direct theory-source recovery

I read the original SAT theory-clarification conversation from HsH Git blob:

`507a7000082415373ee98dbc95f18a991dff3c5a`

Relevant direct user-role messages include:
- `49a54e0b-f862-40d2-ac06-630bac7c8668`
- `2335ee08-12a4-44a0-ab04-8d85451414f8`
- `ff183fbb-0fae-4156-b355-2c741ad3e30d`
- `9a1d3250-290b-4a03-b6b7-6e2a0fa5bfb4`

The December 2025 source leaves open whether the timesheet is an independent physical structure or a derived average propagation front. It separately proposes gravity as a collective statistical response involving coarse-grained quantum entanglement. The source also asks what supplies the first trajectory deflection and considers an initial local time-field perturbation.

These are questions and candidate mechanisms, not established equations. The archived assistant's stronger statements that gravity necessarily never disappears, that dark matter is temporally decoupled matter, or that local-field and vector-origin deflections are mathematically equivalent are not Nathan Direct and are not adopted.

The recent [Sable h988 source-fidelity report, issue #2249](https://github.com/Satobloc/HsH/issues/2249), already records the source chronology and minimum map inventory. The [Aster h988:s2 checkpoint, issue #2250](https://github.com/Satobloc/HsH/issues/2250), was also read. This report extends that work into an observable and model-discrimination contract rather than repeating either source audit.

## 2. PWMO: four non-substitutable claim gates

| Gate | Claim being tested | Minimum evidence | What it does not establish |
|---|---|---|---|
| **P: Phase / readout** | A specified observable follows a measured relation | Instrument, source data, units, uncertainties, measurement operator, frozen prediction | Entanglement or mechanism |
| **W: Witness** | A nonclassical correlation or entanglement witness is present | State preparation, witness, noise/decoherence model, locality and control assumptions | Which physical mediator produced it |
| **M: Mechanism** | A specified interaction model explains the readout better than alternatives | Explicit dynamics, locality/nonlocality assumptions, competing models, independent holdout | Timesheet ontology |
| **O: Ontology** | The timesheet carries observable degrees of freedom not reducible to the ensemble/history state | Explicit ensemble state, timesheet state, projection, readout, and a robust non-factorization witness | A unique gravity mechanism |

The gates are not a simple ladder of automatic implication. Each requires its own evidence. In particular, a positive entanglement witness cannot be promoted directly into an independent-timesheet claim.

**Scale rotation:** the QGI is a local laboratory phase readout; the proposed statistical-entanglement account is a collective/global mechanism; the timesheet question is an inside/outside representation issue. GR and QM provide the explicit comparators here. No string-theory-specific observable map was recovered, so no string-theory equivalence is asserted.

### Orthogonal H(s)H model axes

The source propositions are better represented as two separate axes than as one bundle:

| Axis | Candidate A | Candidate B |
|---|---|---|
| Timesheet status | Independent state with its own admissible degrees of freedom | Derived average/front functional of a sufficiently complete ensemble history |
| Gravity mechanism | Collective statistical-correlation / entanglement response | Local time-field / trajectory-response mechanism |

This yields four candidate combinations. None is currently selected. The standard GR + QM account remains the comparator, not a fifth H(s)H variant.

The responsive medium is a separate primitive-admission question. The current methodology starts with the worldtube and timesheet as the minimally sufficient pair. The medium remains a provisional third candidate and must be shown to be (a) eliminable, (b) absorbable into the timesheet, or (c) independently required by a source-grounded map and observable. It must not be introduced merely to absorb residuals.

## 3. Ontology gate: factorization and identifiability

Let:

- `H` be the complete ensemble/history state at the declared scale. It must include memory variables if the proposed average front depends on history, not merely the instantaneous particle configuration.
- `T` be the timesheet state.
- `Y` be a declared observable.
- `R` be the joint readout map.

### Derived-front model

The derived-front hypothesis requires an explicit map:

\[
T = G(H)
\]

and a readout:

\[
Y = R(H,T) = R(H,G(H)) = F(H).
\]

Therefore every readout in this model must be constant on the fibers of `H`: if two physical states have the same complete `H`, they must have the same predicted `Y`.

The existing Ravel formalization in [PR #1133](https://github.com/Satobloc/HsH/pull/1133) contains the generic criterion `readout_descends_iff_constant_on_same_carrier_slice_fibers`. Its exact-head build [#44862774441](https://github.com/Satobloc/HsH/actions/runs/44862774441) compiled the theorem in Lean 4.34.0 / Lake 5.0.0. The existing heterogeneous projection-error result supplies a separate transfer bound when maps pass through different metric spaces.

This is a reuse of an existing formal result, not a new H(s)H-specific Lean theorem. The maps `H`, `G`, `T`, `R`, and `F` have not been instantiated or compiled for the physical model.

### Independent-sheet witness

An independent timesheet is observationally distinguishable only if there is an admissible pair of states `x,x'` for which:

\[
H(x)=H(x'), \qquad T(x)\ne T(x'), \qquad Y(x)\ne Y(x').
\]

The readout difference must be attributable to the timesheet after controlling for omitted ensemble variables, nuisance parameters, acquisition differences, and measurement error.

Failure to find such a witness does not prove that no independent sheet exists. It means only that an independent sheet is not required by the tested readout at the tested resolution.

### Finite-resolution test bound

For approximately matched ensemble states, suppose:

\[
d_H(H_i,H_j)\leq \delta_H
\]

and the derived readout map is `L`-Lipschitz over the frozen calibration domain. Let `b_i` and `b_j` be total per-record bounds that include measurement uncertainty and certified projection/readout-chain error. Then the derived-front model requires:

\[
D_{\rm obs}=d_Y(\widetilde Y_i,\widetilde Y_j)
\leq L\delta_H+b_i+b_j.
\]

A preregistered holdout pair exceeding this bound rejects the **derived-front readout model for that domain**, provided `H` is sufficient and `L`, `b_i`, and `b_j` were fixed independently. It does not, by itself, prove a unique independent-timesheet ontology.

This inequality is a direct triangle-inequality consequence of the stated assumptions. It was not added as a new Lean theorem in this run. No numerical threshold is assigned because the physical metrics, ensemble sufficiency conditions, projection maps, and calibrated Lipschitz bound are not yet defined.

## 4. Real-data anchor: quantum phase of free fall

**Primary source:** O. Dobkowski et al., “Observation of the quantum phase of free fall and the consistency with the equivalence principle,” *Science Advances* (2026), [open full text and supplementary-material route](https://pmc.ncbi.nlm.nih.gov/articles/PMC13537235/).

This is a real measurement, not an H(s)H result.

### Measured system and data provenance

- System: a longitudinal Stern-Gerlach / quantum Galileo interferometer using a \(^{87}\mathrm{Rb}\) Bose-Einstein condensate.
- Preparation: approximately \(2\times10^4\) atoms; after collimation, atom-atom interactions are minimized and the experiment is treated as essentially single-particle physics.
- Two coherent wavepackets: one ballistic free-fall path and one magnetically held reference path.
- Maximum reported path separation: approximately \(7.5\,\mu\mathrm m\).
- Measured range: ballistic free-fall duration \(2T\) up to \(2000\,\mu\mathrm s\); `T` is half the total ballistic free-fall duration.
- Finite-pulse parameters in the reported scheme include \(T_{\rm kick}=80\,\mu\mathrm s\) and \(T_d=71\,\mu\mathrm s\).
- Acquisition: 633 experimental cycles, 30 seconds each, 13 complete oscillations, approximately 80 radians of accumulated phase.
- Published average population error: \(1.8\pm1.5\%\) SEM.
- Relative phase noise: \(1.3\%\).
- Visibility decreases from about 80% to 20% at \(2T=2000\,\mu\mathrm s\).
- The paper states that the data and code needed to reproduce the results are in the paper and supplementary materials. I read the main article, but did not download or independently reprocess the supplementary data.

A simple source-data arithmetic check gives:

\[
633\times30\ {\rm s}=18{,}990\ {\rm s}=5.275\ {\rm h},
\]

consistent with the reported 5.3-hour acquisition. The stated approximately 2-radian residual over approximately 80 radians is \(2/80=2.5\%\). These are consistency checks on published values, not a new physical calculation.

### Standard comparator and full readout

The paper's finite-pulse analytical phase relation is:

\[
\Delta\varphi =
\frac{mg^2}{3\hbar}
\left[
T^3+T^2T_{\rm kick}
+T(T_{\rm kick}^2+T_{\rm kick}T_d)
-T_d(T_{\rm kick}+T_d)^2
\right],
\]

with the paper's phase-sign convention. The idealized cubic term has magnitude \(mg^2T^3/(3\hbar)\) for the full interferometer. The single-wavepacket gauge phase is separately reported with the \(mg^2t^3/(6\hbar)\) coefficient. The finite-pulse terms matter: a proposed H(s)H map must reproduce the full measurement model or justify a controlled approximation, not merely fit a \(T^3\) curve.

Dimensional check:

- \([m]=\mathrm{kg}\)
- \([g]=\mathrm{m\,s^{-2}}\)
- \([T]=[T_{\rm kick}]=[T_d]=\mathrm{s}\)
- \([\hbar]=\mathrm{kg\,m^2\,s^{-1}}\)

Every term in the bracket has units \(\mathrm{s^3}\), and \(mg^2T^3/\hbar\) is dimensionless, as required for a phase in radians.

The authors report a blind numerical simulation with no free parameters or fine tuning and approximately 2.5% residuals. Their displayed 5% variations in the cubic exponent and predicted prefactor are excluded by this dataset. The 5% bands are specific to this apparatus and analysis, not a universal falsification threshold. The 2.5% residual is not itself a confidence interval. The published data were already fitted and do not supply a new untouched holdout for H(s)H.

### What this measurement can and cannot test

It is a strong **P-gate** baseline for local quantum phase in free fall. It is not a two-body gravitational-entanglement witness, does not identify a gravitational mediator, and does not distinguish an independent timesheet from a derived average front.

The finite wavepacket shape and rotation affect the numerical phase/visibility model. Those standard wavepacket effects are not automatically the H(s)H worldtube thickness. A separate map from the H(s)H core to the measured wavepacket support, with units and projection conditions, is required before the two can be compared.

## 5. Mechanism gate: why an entanglement signature is not enough

Three current sources materially sharpen the mechanism test:

1. **Feng, Vedral and Marletto**, “Collapse-based models for gravity do not violate the entanglement-based witness of nonclassicality,” *Physical Review D* 113, 104055 (published 26 May 2026), [DOI 10.1103/83rl-nygv](https://doi.org/10.1103/83rl-nygv). They argue that the entanglement witness remains valid under its locality assumption, while collapse-based models that appear to generate entanglement have nonlocal features and may involve quantum-like hidden detectors that do not interact with the gravitational field.

2. **Feng and Vedral**, “Testing non-classical gravitational phase dynamics under strong dephasing,” arXiv:2611.12229 (submitted 9 November 2026), [arXiv](https://arxiv.org/abs/2611.12229). This is a theoretical preprint, not an experiment. It proves a finite-time distinction between gravitational conditional-phase evolution and passive stochastic local-phase models under explicit assumptions, including regimes where the chosen state remains separable. It motivates time-resolved phase dynamics as a possible discriminator beyond a final-state entanglement witness.

3. **Tobar, Aspelmeyer and Zych**, “Testing Gravitationally-Induced-Entanglement with Massive Particles and Quantum Clocks,” arXiv:2611.08313 (submitted 5 November 2026), [arXiv](https://arxiv.org/abs/2611.08313). This is an experimental proposal, not a measurement. It uses a levitated massive particle and an array of quantum clocks to probe the contribution of internal clock energy to active gravitational mass.

Consequently, the H(s)H collective-entanglement proposal must state whether it is local, nonlocal, or mediated by an explicit field or relational channel. “Statistical tug,” entanglement entropy, mutual information, pair correlation, and effective force are not interchangeable labels. It needs a typed correlation object and a map from that object through coarse-graining to a metric, curvature, force, or phase observable.

## 6. Test matrix

| Candidate | Shared parameters / extra parameters | Calibration and holdout | Predicted observable | Standard comparator | Failure condition |
|---|---|---|---|---|---|
| **GR + QM baseline** | Measured \(m,g,T,T_{\rm kick},T_d\), pulse currents, field calibration, wavepacket and detector parameters | Published QGI calibration and analysis; no new holdout claimed | Full finite-pulse \(\Delta\varphi(T)\), visibility and phase residuals | Published analytical and numerical model | Baseline itself fails if a preregistered independent replication falls outside its uncertainty model |
| **Derived timesheet + local phase response** | Same measured parameters; additionally \(G(H)\), \(F(H)\), and a calibrated Lipschitz bound \(L\) | Existing QGI data are retrospective and already fitted. A new independent run or externally frozen parameter set is needed for holdout | Phase must factor through the complete ensemble/history state; no residual beyond \(L\delta_H+b_i+b_j\) | GR + QM | A preregistered holdout violation of the bound rejects this derived-readout model for the tested domain |
| **Independent timesheet + local phase response** | Same shared parameters plus independent \(T\)-state and coupling parameters | Requires an independent timesheet readout or independently constrained state; none is available in QGI | Reproducible phase residual associated with \(T\) at matched \(H\) | GR + QM and the derived-timesheet model | No residual above combined uncertainty on a suitable holdout makes the extra state observationally unnecessary at that resolution; it does not prove nonexistence |
| **Derived timesheet + collective correlation gravity** | Ensemble/history state, defined correlation object \(\mathcal E(H)\), coarse-graining map \(\mathcal C\) | Requires a two-body or many-body protocol and independently characterized correlations; no qualifying H(s)H dataset selected | Conditional phase or gravitational readout determined by \(\mathcal E(H)\) | GR + QM, local quantum-mediator models, and nonlocal/semiclassical alternatives | No unique prediction beyond the comparators, or a holdout inconsistent with the frozen \(\mathcal C\) map |
| **Independent timesheet + collective correlation gravity** | All above plus independent timesheet state and its evolution/coupling law | Requires both a timesheet-sensitive readout and a controlled correlation/mediator experiment; no dataset or calibration exists | Joint residual that depends on independent \(T\) and collective correlation state | Same alternatives, with explicit locality and hidden-detector controls | Failure to produce the predicted joint residual, or reproduction by a simpler comparator within uncertainty |
| **Local time-field perturbation from outset** | Initial/boundary perturbation, local response law, coupling and propagation parameters | QGI can serve as a local phase control, but no H(s)H field map is defined | Phase and phase derivative under controlled changes in \(2T\), pulse duration and local field | GR + QM action phase and standard magnetic/instrument response | A frozen map that misses the published phase relation beyond the source-specific uncertainty band, or requires per-run parameter retuning |

The QGI dataset supplies a real P-gate control. The BMV/quantum-clock literature supplies candidate W/M protocols, but the cited 2026 quantum-clock work is a proposal and the phase-dynamics paper is theoretical. Neither is counted as an experimental result. The existing GW241011 strong-field candidate remains in Ariadne's earlier h962 source-fidelity work; it was not reanalyzed here.

## 7. Geometry and primitive admission

| Feature | Current status | Admission requirement |
|---|---|---|
| Finite-core worldtube thickness | Qualitative source commitment; no numerical profile | Map to a measured support/readout with units and uncertainty |
| Timesheet | Independent vs derived-front status unresolved | Define ensemble, synchronization, measure, averaging, causal orientation and foliation |
| Mutual worldtube-timesheet curvature | Tentative working hypothesis | Explicit curvature objects, projection and observable map |
| Responsive medium | Provisional third primitive | Demonstrate that it cannot be eliminated or absorbed into the timesheet |
| Twist / holonomy | Optional | Connection, transport, loop and observable |
| Separate contact surface | Not forced | Explicit contact law and independent observable |
| Worldline-only or timesheet-only reduction | Candidate representations | Projection maps and composition conditions; no analogy-based equivalence |

The October 21 direct correction remains in force: the retired reciprocal filament/timesheet deformation account is not silently revived by the November 4 tentative mutual-curvature hypothesis. No current equation, SAT-O source equation, or Blockwave equation was changed.

## 8. Formal, empirical and epistemic limits

- Reused, not modified: Ravel PR #1133 and exact-head Actions run #44862774441.
- Lean 4.34.0 / Lake 5.0.0; 8,955 build jobs; exact PR-head checkout and full formal-library build passed.
- The generic factorization and heterogeneous projection-error theorems compiled. The theorem-specific axiom outputs include `propext`, `Classical.choice`, and `Quot.sound`.
- Tests, lint, leanchecker, nanoda and global axiom audit were skipped. No global no-sorry or no-axiom claim is made.
- No new H(s)H-specific Lean module, physical map, constitutive law, fit, prediction, or numerical falsification threshold was produced.
- No raw QGI supplementary data were downloaded or independently reprocessed. Published values above are source-reported measurements and simple arithmetic consistency checks.
- No independent measurement, external expert review, paper acceptance, or BEDROCK theory promotion is claimed.

## 9. Repository, tools and operational checks

Repositories were read at these `main` snapshots after the Aster h988:s2 source correction:
- HsH: `0a04387a4494981db2036ff5a52055c4dc9d85a9`
- SAT archive: `d10dd333f2487054807bda398995300c538caa7e`
- HSH_RESOURCES: `f39742b5a7d34578cea9218202b8641978038aef`

The HsH root README, live BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, revival rotation V3/V4, thread-first rule, navigation preflight, current workflow orientation, scheduler authority and worker-freshness controls were read. The SAT archive front door and HSH_RESOURCES AI start index were read; no private HSH_RESOURCES payload was accessed.

Mersearch had no callable action in this runtime. All four canonical request lanes remain occupied/requested; no request was created, overwritten, retriggered, released or reused. Original source recovery used the existing HsH blob, not a claim of full three-archive Mersearch coverage.

Tool reconnaissance:
- Math Hopper issue #578 remains open; PR #991 remains open.
- Whirligig Kernel 0 remains sandbox-only and was not used.
- Existing Lean PR #1133 was reused; no new PR or tool was created.
- SciSpace is available and was used for a bounded literature search.
- Fork counts checked: zero for HsH, SAT archive and HSH_RESOURCES.
- No new dependency, fork, subscription, paid endpoint or expenditure.

The issue publisher is the existing owner-authored `issue-publisher.yml` workflow and `tools/issue_publish.py`. Its exact four-key payload is `schema`, `submission_id`, `content`, `sha256`; maximum content size is 45,000 UTF-8 bytes. No direct canonical-artifact write or publisher bypass was used.

## 10. Continuity and safeguards

- Ariadne's `INBOX.md` was checked. No h988 Aster-to-Ariadne prestart packet was present at the readback.
- The old Ariadne request for an Orson role note is already fulfilled in Orson's inbox. No duplicate was written.
- Next ring label: Alberr. Alberr's workspace records no current assignment/lease; no successor packet or task was created.
- Ariadne's P0 Code Grurple source-integrity assignment remains ACTIVE. PR #2009 remains open/draft/unmerged. No P0 source, route, PR, or protected object was changed.
- P1 Orson cognition remains Orson-owned and NOT READY. No P1 assignment was made.
- P2 measured geometry remains HOLD. P3 full theory remains INCOMPLETE.
- November 9 minor-paper gate: MISSED. November 30 major measured-system gate: HOLD. December 14 full-theory gate: INCOMPLETE.
- Ariadne's FIE review is next due November 24; the 14-day interval has not elapsed, so no premature re-review was performed.
- Unrelated reading break completed in the SAT archive file `fun break - lx.txt`, lines 2291–2330. This is an archived LLM exchange, not fact-checked evidence. Return cursor: 2331. The h973 canonical receipt was used over older README/BOOT cursor text.
- No BEDROCK promotion, SAT-O/Blockwave equation change, scheduler or workspace configuration change, signet, conversation rename, or cross-thread delivery claim.

**Next useful step:** recover the QGI supplementary data/code and define the H(s)H geometry-to-phase map before attempting a numerical prediction. Separately, specify the collective-correlation object and locality assumptions before treating an entanglement witness as evidence for the proposed gravity mechanism.
