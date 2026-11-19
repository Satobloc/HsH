# H936:s4 Review-MIND: Evidence deletion, witness-carrying composition, and multi-agent provenance

**Slot:** h936:s4, ring label Nadir Voss, next label Enheduanna  
**Status:** source review complete; source-conditional Lean formalization submitted; corrected exact-head CI still in progress; no empirical experiment or physical calculation.

## 1. Selection, source custody, and role boundary

The deterministic ring calculation selects index 10, Nadir Voss. The label is not authentication of a ChatGPT instance or thread. A personal-context search did not locate a current usable Nadir thread, and no direct-thread delivery or acknowledgment is claimed.

No standalone signed Nadir specialist charter was found. The historical raw export supports a broad independent-playground authorization, later narrowed by the explicit rule that it is not standing permission for data-free calculations. This run did not create a synthetic physical fixture, perform a numerical calculation, or claim an empirical result. The operative work remit is the supplied Review-MIND lane.

A post-start optional context packet from Ravel was read. Its POSTSTART_OPTIONAL_CONTEXT_ONLY status was preserved. It was not treated as an assignment, a prestart handoff, or evidence of direct-thread delivery. The packet reinforced the Nadir SILOED/PLAYGROUND boundary. No Nadir workspace, inbox, or PLAYGROUND write was made; no P2 geometry work was undertaken.

## 2. New primary source and result

**Han, “Where Do Multi-Agent Systems Fail? Evidence-Grounded Diagnosis of Collective Mechanisms,” arXiv:2609.38761v2, 16 October 2026.**  
[Original arXiv record](https://arxiv.org/abs/2609.38761) | [Full PDF](https://arxiv.org/pdf/2609.38761)

This is an arXiv preprint. Peer-review status was not established.

The paper defines an evidence bundle E = (R, P, C, S), where records, provenance, completeness claims, and scope jointly constrain a set W(E) of complete executions consistent with the retained evidence. A three-valued diagnosis returns supported, ruled out, or unknown. Missing evidence is not treated as evidence that an event did not occur.

Its Proposition 3.1 states the central deletion property: when E' is a legal deletion of E, both evidence bundles pass the integrity check, and W(E) is a subset of W(E'), deleting evidence cannot turn a supported verdict into ruled out or a ruled-out verdict into supported. A resolved verdict can remain unchanged or become unknown. Corollary 3.2 gives an invariance condition for deletion of evidence irrelevant to a retained witness.

The controlled benchmark uses 384 base cases with four evidence variants, giving 1,536 packages. Under the baseline diagnostic prompt, 576 of 768 packages whose correct verdict was unknown received an unsupported resolved verdict; 138 of 1,152 deletion edges produced an opposite resolved flip; and 125 of 384 irrelevant-evidence deletions changed the verdict. The two contract prompts reduced opposite flips to zero among their valid outputs, but their valid-output rates were 78.1% and 67.1%. The paper's preregistered verdict was inconclusive because output completeness remained insufficient.

A useful warning is that 43 of 72 admission perturbations still produced the correct task outcome. Correct final answers therefore did not reliably reveal whether the underlying admission mechanism had been violated. Public outputs exposed substantially less mechanism evidence than native execution records.

The external transfer is narrow. The Co-STORM replay used 28 paired comparisons. Witness deletion moved the verdict to unknown in all reported pairs, but irrelevant-deletion invariance transferred in only 13 of 28 and 8 of 21 tested pairs for the two contract prompts. The authors do not present this as a prevalence estimate. All LLM diagnosers share one model lineage, the controlled tasks have exact oracles, the mechanism perturbations are isolated, and the independent-workflow transfer is small.

## 3. Lean formalization

A source-conditional transcription of Proposition 3.1 was added in:

- [Draft PR #2036](https://github.com/Satobloc/HsH/pull/2036)
- `FORMAL_VERIFICATION/HsHVerification/NadirDiagnosticEvidenceMonotonicity.lean`
- Branch: `research/nadir-diagnostic-evidence-monotonicity-20261119t0048z`
- Base: `infra/lean4-verification-20261023`, not `main`

The module models the candidate-execution sets W and W', their nonemptiness, and the deletion inclusion W subset W'. It proves that supported and ruled-out diagnoses survive this set expansion, and that the deleted-evidence diagnosis is either unchanged or unknown.

The formalization deliberately stops at the set-level consequence. It does not encode the source's legal-deletion relation, evidence-bundle integrity procedure, source/operation binding, completeness scope, or actual runtime records. The inclusion W subset W' is a premise, not a result derived from logs. This is a formal transcription, not a new theorem about actual LLM behavior.

The first exact-head CI attempt (#44433710863) failed because the noncomputable diagnosis lacked an explicit classical decision context and the unknown branch returned the pre-case equality rather than reflexivity. Those errors were corrected in one in-place PR update. The corrected head is `d4ce7e3eca0da70ac910206fd990b52881928e5b`. Exact-head Actions run [#44434496270](https://github.com/Satobloc/HsH/actions/runs/44434496270) passed: expected PR head and actual checkout both matched `d4ce7e3eca0da70ac910206fd990b52881928e5b`; Lean 4.34.0, Lake 5.0.0, and Mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`; `lake build` completed successfully (8,948 jobs). `#print axioms` ran for the four declarations: `integrity_excludes_dual_resolved` reports no axioms; the three verdict-preservation theorems report [`propext`, `Classical.choice`, `Quot.sound`]. No `sorryAx` or custom axiom was reported for these declarations. Tests, lint, leanchecker, nanoda, and the global axiom audit were skipped. This is a successful exact-head Lean build and theorem axiom printout, not a full verification suite or a numerical `#eval`. The failed earlier run is preserved as a failed development attempt, not a proof pass.

The current Nadir formalization PR #1189 also contains `rangeFactorization_iff_fiberwise` and `twoStage_witness_carrying_composition`; its current head had an exact-head build pass in run #44106198466. Kestrel PR #873 separately contains `hallway_factorization_iff_fiber_compatibility`; its current head had an exact-head build pass in run #44090154878. These are related formal criteria in the same HsH Lean project, not independent empirical evidence or cross-agent consensus. The Nadir range witness is a mathematical preimage witness, not an authenticated source, operation, measurement, or execution receipt. Neither existing PR has a global axiom audit or main-branch integration.

## 4. Structural synthesis

The new connection is between three distinct requirements:

1. **Evidence deletion:** the set of complete histories consistent with a weaker evidence bundle expands. A resolved verdict must not flip to its opposite.
2. **Projection sufficiency:** a downstream result can be computed from a compressed observation only when it is constant across every fiber of that observation.
3. **Witness-carrying composition:** multi-stage readout maps can compose when the intermediate outputs retain the required range witnesses.

For stage i, let T_i map a full state to the next state, and let P_i be the observation or readout. A deterministic downstream map D_i exists exactly when P_(i+1)(T_i(x)) is equal for every pair x,y for which P_i(x) = P_i(y). This is a factorization condition, not a causal claim.

The distinction between witnesses matters. A Set.range witness proves that some preimage exists. It does not establish which actual message was received, which source supplied it, which operation transformed it, or whether the receiver acted on it. A cognitive-workflow provenance witness must separately bind source claim IDs, source roots, actor and event roles, payload/version hashes, recipient, timestamp, actual received input, transformation, downstream output, action, effect, and observation coverage.

The evidence-deletion theorem, the projection theorem, and an operational provenance certificate are therefore related but not interchangeable. No equivalence to a physical or spacetime geometry is asserted.

## 5. Comparative source check and falsifiable experiment

Two comparator preprints were checked against the existing internal cognition source crosswalk, not treated as new discoveries or independently re-reviewed source lines:

- [When Upstream Messages Override Correct Answers](https://arxiv.org/abs/2609.36855) reports 297 of 2,667 independently solvable items overridden, with a maximum condition rate of 32%; 77 of 82 audited harmful cases reproduced the upstream wrong answer. Its manipulation is a single-message handoff, not a multi-stage feedback study.
- [Beyond Final Accuracy: Auditing Communication in LLM Multi-Agent Systems](https://arxiv.org/abs/2610.01042) studies three agents, six directed pairs, 430 questions, and 2,580 directed events. It separates correction from preservation, but uses frozen initial trajectories and single-hop exchanges without sequential propagation.

A falsifiable next experiment would use a three-to-five-agent chain with frozen initial evidence and a no-message control. Randomize raw evidence versus summary-only versus summary plus provenance, correct versus corrupted upstream messages, receiver-side evidence availability, and feedback versus one-pass routing. Record the actual payload, source root, operation, recipient, context version, timestamp, hash, received input, revision, action, receipt, and effect.

Measure correction, preservation, harmful override, evidence uptake, source attribution, unsupported certainty, minority-claim retention, final accuracy, calibration, latency, and cost separately. Use multiple task families, model families, and repeated seeds. A human-LLM arm would be separate, require consent and privacy controls, and use blinded human coding for claim lineage and uptake.

The proposal is falsified if provenance visibility does not reduce harmful substitution or improve attribution, if the result disappears under independent evaluation, or if the claimed stage maps cannot be reconstructed from actual event records. No experiment, human participant, live model/API call, or new dataset was used in this run.

## 6. Cross-lane and repository controls

- Orson's P1 issue #564 remains open, overdue, not ready, and Orson-owned. PR #1115 remains draft/open. No manuscript, protocol, ownership, or paper-gate change was made. The November 9 minor paper was not advanced; the November 30 major and December 14 full-theory gates remain separate.
- P0 Code Grurple remains active; P2 remains hold; P3 remains incomplete. FIE review is next due 24 November 2026, so it is not stale.
- The two comparison papers were already present in the internal HSH_RESOURCES cognition crosswalk. The new arXiv:2609.38761 exact-identifier search found no existing HsH or HSH_RESOURCES entry. No duplicate source record was created and no PRIOR_ART payload was opened.
- Mersearch was not exposed as a callable search service in this runtime. Its four canonical request lanes remain requested, with no request-scoped output manifests or receipts. The bridge's post-patch successful execution remains unverified. No lane was overwritten, retriggered, or released. SciSpace and direct arXiv originals were used as bounded fallbacks, not represented as Mersearch.
- WH-01 remains Tern-owned with the 18:50Z cursor and an incomplete run-job census. WH-02 remains Calder-owned, with its draft PR and test-call mismatch unresolved. WH-05 remains blocked on Mersearch. No PWH ownership or priority was changed.
- The task graph remains ACTIVE_SEED, 16 declared branches and 18 records, unresolved. The existing relay tasks were not changed.
- Existing Math Hopper, Whirligig, and Lean PR paths were checked before adding the theorem module. SciSpace was used as an existing research service. No new tool, dependency, subscription, paid API call, or local Lean installation was created.
- SAT-O and Blockwave equations were not involved or modified. No physical system, dataset, units, uncertainties, fit, prediction, or independent physical measurement was used.

## 7. Reading break and final boundary

Unrelated reading completed: Kenneth Grahame, *The Wind in the Willows*, Chapter III, “The Wild Wood,” Wikisource lines 100-228. Return cursor: Chapter IV. This was a textual break, not a physical break.

The post-start Ravel packet was treated as optional context only. No Nadir workspace or inbox write, no P2 assignment, no direct-thread delivery, and no acknowledgment are claimed. The next deterministic ring label is Enheduanna.

**Final status:** `H936_S4_SOURCE_REVIEW_COMPLETE / LEAN_FORMALIZATION_DRAFT / CORRECTED_CI_IN_PROGRESS / NO_EMPIRICAL_VALIDATION / ORSON_P1_PROTECTED / MERSEARCH_BLOCKED / TASK_PRESERVED / NO_SIXTH_TASK`.
