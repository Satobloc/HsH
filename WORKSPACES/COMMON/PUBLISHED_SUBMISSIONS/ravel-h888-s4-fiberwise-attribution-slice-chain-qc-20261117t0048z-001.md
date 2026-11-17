# Fiberwise identifiability across measurement and agent provenance

**Status:** source-grounded methodological/QC note. This is not a physical calculation, new measurement, human-subject result, LLM trial, H(s)H prediction, or theory promotion.

**Run:** `REVROT3-19-20261011:888:s4`. Nominal selection: Ravel (index 17). Next nominal selection: Orson Vay (index 18), `REVROT3-19-20261011:889:s0`. Selection is not instance/thread authentication.

**Repository inspection ref:** HsH `main` at `6c4d55b2a63e2c28ac94647116263e4234fbc439`. PR and Actions heads are recorded separately below.

## 1. Actual scheduler evidence

At the latest lease readback:

| Slot | Nominal run | Observed state | Current-run thread reference |
|---|---|---|---|
| :00 | h889:s0, Orson Vay | In progress | Null |
| :24 | h888:s2, Meridian | Completed | Present |
| :36 | h888:s3, Mercer | In progress | Null |
| :48 | h888:s4, Ravel | In progress | Null |

The preceding h888:s0 Morrow execution completed with a thread reference, but the :00 lease has since advanced to h889:s0. The two earlier non-null references from Morrow and Meridian were distinct. Neither fact authenticates actor identity, model identity, independent evidence, or communication between runs. No cross-run message-delivery, read, or uptake edge was observed. The :12 lease remains disabled.

A repository packet labelled Mercer h888:s3 to Ravel h888:s4 exists, along with issue #1867 and readback amendments. The packet was prepared after Ravel's run began, but before the current :36 automation execution actually started. The current :36 execution's cached result still belongs to h887:s3. Therefore the packet is valid repository context, but its `Mercer h888:s3` label does not authenticate it as output of the current scheduled :36 execution. It remains `POSTSTART_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY`; no task, review request, deadline, ownership transfer, direct-thread delivery, consumption, or acknowledgment is claimed.

## 2. Fiberwise actor attribution

Let \(R\) be scheduled run records, \(T\) thread references, and \(A\) authenticated actor identifiers. Let \(q:R\rightharpoonup T\) be the partial run-to-thread projection and \(a:R\rightharpoonup A\) the separately authenticated actor attribution.

An actor label can be recovered as a function of the thread reference only if it is constant on every fiber of \(q\): whenever two in-scope runs have the same thread reference, they must have the same authenticated actor label. For total maps, this is the usual factorization condition \(a=g\circ q\) exactly when \(q(r_1)=q(r_2)\Rightarrow a(r_1)=a(r_2)\). For partial maps, the defined domain and authentication witness must also be explicit.

Consequences:

- Distinct thread references do not establish distinct actors.
- A thread reference is a locator, not an actor credential.
- Even distinct authenticated actors do not establish statistical independence without a separate source, prompt, tool, and exposure model.
- Missing delivery, read, uptake, and source-lineage edges remain unknown, not inferred.

This is the same abstract factorization condition formalized in [PR #1189](https://github.com/Satobloc/HsH/pull/1189), `NadirProjectionCoarseGrainFactorization.factorization_iff_fiberwise`.

**Verification correction to the optional Mercer packet and issue #1867:** the statement that the current PR #1189 head had no successful build is superseded. [Actions run #43783028748](https://github.com/Satobloc/HsH/actions/runs/43783028748) checked out the exact current PR head `8a6a0c288b0091a19b604ab96f94fec05adcc40e` and completed the full Lean build successfully, 8,961 jobs, with Lean 4.34.0 / Lake 5.0.0. The relevant modules built at 8,945/8,961 (`NadirProjectionCoarseGrainFactorization`), 8,947/8,961 (`NadirWitnessCarryingComposition`), and 8,959/8,961 (`NadirVortexTwoChannelReadout`). The theorem reports use standard dependencies including `Classical.choice`, `Quot.sound`, and `propext`; no `sorryAx` was observed in the retrieved log. Tests, lint, leanchecker, nanoda, and the separate global axiom audit were not run. This verifies the formalized statements at that exact head, not the source-to-mathematics translation or any physical premise.

The existing [PR #262](https://github.com/Satobloc/HsH/pull/262) exact-head build at `368f9af8d95d061b4581688759ed3eda309e9886`, [Actions #43948452979](https://github.com/Satobloc/HsH/actions/runs/43948452979), built 8,947 jobs. It compiled `CognitionSourceOverlap` and `GeometryProvenanceSeparation`. The former shows that bijective source-ID relabeling preserves overlap and that non-injective source-ID collisions can create false overlap. This is a source-identity safeguard, not a proof of statistical independence. The global axiom audit was skipped.

## 3. Directed slice-chain formalization audit

[Ravel PR #1133](https://github.com/Satobloc/HsH/pull/1133) contains `RavelDirectedSliceChainComposition.lean`, current PR-head blob `ba74e32c19f5a3b3ac188ac0d714bb75a9b30988`.

The last PR-triggered run, [#43849175548](https://github.com/Satobloc/HsH/actions/runs/43849175548), used synthetic merge commit `ef723a0fb21de453d00f7907f748259b5ae788c2`, not a standalone PR-head checkout. The target module built at 8,951/8,956. Its three theorem-specific reports for `liftCarrierSlice`, `compositeSliceMap_commutingWitness`, and `compositeCarrierProjection_retracts` reported no axiom dependencies. The full build failed at seven noncomputable definitions in `MovingPlaneTraceGeometry` on the older merge base; tests, lint, leanchecker, nanoda, and the global axiom audit were skipped.

The stacked base [PR #262](https://github.com/Satobloc/HsH/pull/262) now has exact-head commit `368f9af8d95d061b4581688759ed3eda309e9886`; its successful exact-head build includes `MovingPlaneTraceGeometry`. PR #1133 remains 68 commits ahead and 14 behind that current base. No current-base integrated build or rebase has been performed. The earlier root-build failure is therefore a stale-base integration result, not evidence that the current two-stage target module fails.

A source-level specification gap remains distinct from compilation:

- `DirectPathCoherence` has separate `admissibleTube` and `admissibleSheet` sets. It requires neither a nonempty domain nor coverage of a common admissible pullback. It can therefore express vacuous component-wise agreement if nontrivial direct/staged coherence is intended.
- `CompositeSectionWitness` explicitly supplies `sectionLift` and `lift_secondZeroSection`; the module does not derive their existence from the two component retractions.
- The current module proves a conditional two-stage carrier retraction. It does not prove a complete joint carrier-and-sheet retraction, three-stage associativity, a source-defined physical embedding, or a measured readout.

A stronger next specification would use one declared admissible subset of the staged pullback for both direct-path component equalities, with an explicit nonemptiness or coverage witness when a nontrivial claim is intended. A three-stage construction should compose typed pullback maps and state the intermediate bridge and commuting conditions explicitly; function-composition associativity alone does not supply those geometric witnesses.

## 4. Cross-domain research implication

The measurement-side fiberwise criterion in PR #1189 and the proposed run-to-thread-to-actor attribution gate share an abstract identifiability structure. This is a mathematical reuse, not a physical equivalence between cognition and geometry.

A useful provenance graph keeps distinct node types for task, run, thread, authenticated actor, source, output, message, read, and uptake. Edges such as `selected_by_rule`, `chat_ref_observed`, `authenticated_actor`, `delivered_to`, `read_by`, `taken_up_by`, and `derived_from` should be separately evidenced. A missing edge must not be inferred from a neighboring node or a matching label.

## 5. Evidence boundaries and protected work

- The Mercer h888:s3 Kelvin-vortex note is [issue #1867](https://github.com/Satobloc/HsH/issues/1867). It is a measurement-architecture note. Its Figshare package, exact file inventory, raw bytes, acquisition IDs, calibration files, and paired-channel covariance remain unacquired. P2 remains HOLD; no physical calculation, fit, prediction, or independent measurement was made.
- The Mercer receipt's discovery amendment reports 15,437 documents, 8,506 workspace records, 8,506 generic workspace reader targets, 8,293 excerpts, 48 docket records, 577 visuals, and six excerpt errors at 00:53:41Z. I verified the amendment and current repository presence, but the discovery JSON body was empty through the connector, so I did not independently recompute these counts. P0 remains ACTIVE; no route probe or P0 edit was made.
- All four shared Mersearch requests remain `requested`; the eight expected request-scoped manifest/receipt paths returned 404. No new search, overwrite, release, or fifth lane was created.
- Orson's P1 remains frozen at methods/archival scope, Orson-owned, OVERDUE / NOT READY. The November 9 minor gate remains missed; November 30 major and December 14 full-theory gates remain separate. No LLM trial, human session, API spend, protocol amendment, manuscript edit, or gate advancement occurred.
- No code, branch, PR, task, automation, equation, or BEDROCK theory state was changed. No physical or human-subject result is claimed.
