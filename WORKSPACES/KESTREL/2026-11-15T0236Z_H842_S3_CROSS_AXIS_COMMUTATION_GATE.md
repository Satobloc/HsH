# Cross-axis commutation gate for O0-A modes and representation allocation

**Run:** H842:S3, 2026-11-15T02:36Z  
**Worker label:** Kestrel  
**Next ring label:** Meridian  
**Disposition:** NEW CONDITIONAL MAP-COMPATIBILITY TEST PROPOSED / SOURCE MAPS NOT YET DEFINED / NO PHYSICAL TEST OR P2 SELECTION.

## Executive result

The archive already contains two different classification axes. This report does not introduce a second taxonomy and does not assume the axes are independent:

1. **O0-A interpretive/development modes:** the historical Mode 1 / Mode 2 / Mode 3 ladder, with distinct freeze-outs and different roles assigned to the time surface.
2. **Representation allocation:** a reported spectrum that redistributes dynamical description between filament/worldline shape and time-field/timesheet distortion.

The new result is a test for whether transformations along these two axes commute. The source statements separately suggest mode inheritance and representation conversion, but neither supplies the maps needed to establish their joint compatibility. A commuting-square witness makes that missing condition explicit.

This is a proposal for falsifiable bookkeeping, not a claim that the axes commute, are equivalent, or describe one ontology.

## 1. Source and authority separation

### O0-A mode ladder

The archived `SAT BIG PAPER` source describes a three-mode ladder: a frozen/True-Block baseline; a semi-dynamic mode in which the time surface triggers local filament-parameter changes; and a crystallization mode in which the sweep fixes the block and the time surface serves as an ordering label. The source says higher modes inherit lower-mode results while relaxing a freeze-out, but it does not provide explicit state-space embeddings or transition maps.

The July `SAT4D_8` source contains distinct Mode 2 high-strain/entanglement language and a Mode 3 solidification/decoherence-front treatment. These are not silently merged with the June descriptions. The July Mode 3 source itself restricts that treatment away from the falsifiability-grounded SAT.O modules.

### Representation allocation

The archived `NEOSAT 2025` dialogue file and the separate HsH `SAT_DEC2025` copy describe a range of representational allocations between time-field distortion and filament/vector-shape distortion. The archived dialogue is not role-tagged at message level; it is treated here as historical source material with unresolved speaker attribution, not as a newly authenticated Nathan Direct statement.

Ariadne's 2026-11-05 two-axis note is an assistant reconstruction of this material. Its reported direct clarification has no raw message locator in the note. Accordingly, the allocation spectrum and any equivalence across it remain test hypotheses, consistent with the current instruction not to promote supposed equivalences by analogy.

### Source identities

- [`_AUTO_EXTRACTED_TEXT/✅SAT BIG PAPER.txt`](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/_AUTO_EXTRACTED_TEXT/%E2%9C%85SAT%20BIG%20PAPER.txt): blob `69b0085c86f6c4876aacc0556243dd2fccdc0aef`.
- [`SAT 4D Theory Work/SAT4D_8.txt`](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT%204D%20Theory%20Work/SAT4D_8.txt): blob `6a1ef773c40f805aace5fd61e3584ba50c21241d`.
- [`SATOBLOC MISC/NEOSAT 2025.txt`](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SATOBLOC%20MISC/NEOSAT%202025.txt): blob `e985d599fffdff05fc859be98c6cdb827ed211a0`.
- [`DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/SAT_DEC2025.txt`](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/SAT_DEC2025.txt): blob `af62e4b31216703687fd39e4f1182a55796d1c63`.
- [Ariadne's two-axis reconstruction](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ARIADNE/2026-11-05_EQUIVALENT_SAT_TIME_FILAMENT_FORMULATIONS.md) is a synthesis aid, not an independent source witness.

Original source bytes were not edited. No SAT-O or Blockwave equation was changed.

## 2. New condition: cross-axis commutation

Let \(m,n\) denote O0-A modes and \(a,b\) denote representation allocations. Use \(X_{m,a}\) for the state space associated with one pair of choices.

- \(T_m^{a\to b}:X_{m,a}\rightharpoonup X_{m,b}\) is a proposed representation-conversion map at fixed mode.
- \(\iota_a^{m\to n}:X_{m,a}\rightharpoonup X_{n,a}\) is a proposed mode-extension/embedding map at fixed allocation.
- \(R_{m,a}\) is the fully composed readout map to the declared observables.

On the common domain where both paths are defined, the compatibility question is:

\[
\iota_b^{m\to n}\circ T_m^{a\to b}
\stackrel{?}{=}
T_n^{a\to b}\circ\iota_a^{m\to n}.
\]

The weaker, experimentally relevant condition is equality after the same declared readout:

\[
R_{n,b}\circ\iota_b^{m\to n}\circ T_m^{a\to b}
\stackrel{?}{=}
R_{n,b}\circ T_n^{a\to b}\circ\iota_a^{m\to n}.
\]

The maps may be partial or lossy. Their domains, codomains, boundary conditions, coordinate/frame conventions, parameter maps, and loss of information must be stated. No invertibility, Cartesian-product structure, or commutation is assumed.

### Outcome classes

- `MAPS_UNDEFINED`: one or more source-to-model maps are absent.
- `STATE_PATHS_COMMUTE`: both paths agree on the declared common domain.
- `READOUTS_COMMUTE_ONLY`: state representations differ, but all declared readouts agree.
- `OBSERVATIONALLY_UNRESOLVED`: path differences lie inside the frozen joint uncertainty.
- `NONCOMMUTING_OBSERVABLE`: a pre-registered joint observable distinguishes the paths.
- `RETUNING_REQUIRED`: agreement appears only after changing parameters that were supposed to be shared. This is not parameter-free representation equivalence.

A noncommuting square does not automatically falsify the whole theory. It shows that the two transformations are coupled, mode-specific, or not interchangeable under the tested conditions. A result that agrees only after lossy projection is readout-equivalence for those observables, not identity of the underlying states.

## 3. Integration with existing freeze architecture

Do not create another general-purpose freeze object. Reuse the existing [ComparisonFreeze](https://github.com/Satobloc/HsH/issues/1735), [boundary-provenance witness](https://github.com/Satobloc/HsH/issues/1741), and [SourceRunWitness](https://github.com/Satobloc/HsH/issues/1768) architecture. Bind this witness to the existing `ModelFreeze` and `ObservationFreeze`:

- The `ModelFreeze` supplies the exact mode-source version, allocation-source version, state-space identifiers, map definitions, shared/model-specific parameter manifest, and composed observable definitions.
- The `ObservationFreeze` supplies raw-data identity, instrument/calibration versions, coordinate registration, time synchronization, masks, covariance/uncertainty, and calibration/holdout split.
- The existing comparator and analysis-plan freezes supply the standard model and the pre-registered decision rule.

The new `CrossAxisCommutationWitness` adds only the two paths, their common domain, map versions, readout comparison, and outcome class. It complements candidate-freeze and source-run coherence; it does not replace them.

## 4. Real measured-system test matrix

A suitable **candidate system**, not a selected P2 system, is Han et al. (2026), “Simultaneous free-surface and 3D flow measurements of a vortex ring in head-on collision with the air-water interface,” *Experiments in Fluids* 67, 91, published 27 June 2026, DOI [10.1007/s00348-026-04256-5](https://doi.org/10.1007/s00348-026-04256-5).

The experiment reports a vortex ring with \(Re_\Gamma=2509\), synchronized stereoscopic surface measurement and four-dimensional particle-tracking velocimetry (4D-PTV), registered to a common spatial coordinate system and time base. It reports three data-quality checks: a kinematic boundary-condition residual with a 3-sigma level of 0.65% of characteristic vortex velocity, stress-free consistency, and a correlation-based time-lag check. The raw supporting data are available from the corresponding author upon reasonable request.

A separate 2026 *Physics of Fluids* article by overlapping authors, DOI [10.1063/5.0312376](https://doi.org/10.1063/5.0312376), reports \(Re=4500\) and \(Re=7400\). It is a distinct article and must not be merged with the \(Re_\Gamma=2509\) synchronized-measurement dataset.

| Test | Held fixed | Varied | Observable | Comparator / holdout | Failure condition |
|---|---|---|---|---|---|
| Within-mode representation test | One O0-A mode, shared parameters, one data/calibration freeze | Allocation \(a\to b\) | Joint surface deformation and subsurface velocity | Same standard fluid model and instrument operators | Held-out joint readout falls outside the pre-registered 99% predictive region |
| Mode-inheritance test | One allocation and shared lower-mode parameters | Mode \(m\to n\) | Lower-mode observables on the claimed inherited subspace | Lower-mode prediction retained as a holdout | Higher mode cannot recover the lower-mode result on its declared inherited domain within the frozen 99% predictive region |
| Cross-axis square | Same model and observation freezes | Order of allocation conversion and mode extension | Both paths to the same joint readout | No path-specific retuning | The two held-out path predictions fall outside the same pre-registered 99% joint predictive region |
| June/July Mode 2 separation | Source version and mode label | June curvature-target variant versus July high-strain/entanglement variant | Only after each has its own trigger/update map | Same measured system, separate model freezes | No combined result is admissible until a source-backed bridge exists |
| June/July Mode 3 separation | Source version and mode label | Crystallization/order-label variant versus solidification/decoherence-front variant | Only after each has its own state and readout maps | Same measured system, separate model freezes | No merged Mode 3 prediction without a source-backed transition map |
| Standard baseline | Data, calibration, masks, coordinate/time registration | No H(s)H mode or allocation change | Surface and subsurface fields, circulation, core kinetic energy, free-surface energy | Navier-Stokes/free-surface boundary-value model with the same measurement operators, frozen before comparison | Baseline itself fails its own pre-registered 99% predictive check |

### Calibration, holdout, and identifiability

The paper's shared spatial/time registration makes a joint readout possible, but it does not make the two channels statistically independent. The full cross-channel covariance, calibration files, raw surface reconstructions, particle tracks, and any independent repeat runs must be obtained before numerical comparison.

A defensible design would freeze calibration on an independent repeat or a declared pre-impact interval, then hold out a contiguous post-impact interval and the opposite measurement channel. Randomly splitting adjacent frames is not acceptable because temporal dependence can leak the same dynamics into both sets. If only one run is available, cross-channel prediction is a consistency test, not independent replication.

Allocation \(a\) is identifiable only if the joint readout changes with \(a\) after shared parameters and calibration are frozen. If all declared readouts are constant along the allocation map, that allocation is observationally redundant at the available resolution. If agreement requires separate parameter retuning, the representations have not been shown equivalent.

The reported 0.65% kinematic residual is an instrument/data-quality check, not an H(s)H falsification threshold. **Proposed decision rule:** reject the specific frozen model if its held-out joint observable falls outside a pre-registered 99% posterior-predictive region, with the multiplicity policy fixed in advance. The numeric boundary must be computed from the retrieved joint covariance and uncertainty model; no numerical residual cutoff is claimed here.

### What is and is not forced

- **Worldtube thickness:** not forced by the existence of a finite-core fluid vortex. It becomes necessary only if a source-defined map and joint observable cannot factor through the reduced representation.
- **Twist:** not forced by an azimuthal vortex structure. A distinct source-defined twist variable and a non-absorbed joint signature are required.
- **Contact surface:** the air-water interface is a standard fluid boundary, not automatically an H(s)H contact surface. A separate interaction/contact map must be supplied.
- **Timesheet role:** mode-dependent in the historical O0-A ladder; it must not be treated as one universal readout/trigger/order object.
- **Additional nesting:** required only when the corresponding projection and composition maps are defined and the observable-sufficiency test fails for the simpler representation.

## 5. Proof-first status and limits

The existing Kestrel PR #873 contains a prior fiber-compatibility/factorization result relevant to the readout-level test. It remains OPEN/DRAFT/UNMERGED on a stale research base (`infra/lean4-verification-20261023`, head `7dbcb5f18690232d921db74f25dfdf222ee51b8c`, base `61cc8b65ffed70296e0121dbae067892a79c81d4`). Its historical CI success is not a current-main or exact-head verification.

The new commutation statement cannot yet be instantiated faithfully: the source does not define \(T\), \(\iota\), their common domains, or the shared readout maps. Local `lean`, `lake`, and `elan` are absent, and the existing PR is not a current-base proof route. No new Lean theorem, build, or proof is claimed. Once source-defined maps exist, the formal target is the typed equality of the two compositions on their common domain, followed separately by the readout-level equality.

No physical calculation, fit, H(s)H prediction, independent measurement, P2 selection, new tool, PR, equation correction, or BEDROCK promotion was performed.

## 6. Next decision

The next ring label is Meridian. The useful next check is narrowly scoped: determine whether the source archive supplies actual mode-extension and representation-conversion maps, and whether the two paths can be composed without adding unrecorded parameters. Until then the cross-axis result remains `MAPS_UNDEFINED`, not a failed physical test.
