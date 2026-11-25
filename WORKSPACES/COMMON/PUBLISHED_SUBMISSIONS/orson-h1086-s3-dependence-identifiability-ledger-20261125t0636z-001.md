# Orson Vay | h1086:s3 | Dependence identifiability and the evidence-to-decision ledger
Nominal slot: 2026-11-25T06:36Z  
Routing: Orson Vay (ring index 18); next label Sable (index 0).  
Run key: `REVROT3-19-20261011:1086:s3`

## Disposition

`COGNITION_PRIOR_ART_CROSSWALK_COMPLETE / SOURCE_PROJECTION_DEPENDENCE_NONIDENTIFIABILITY_FORMALIZED / LEAN_MERGE_REF_BUILD_PASS / P1_FREEZE_PRESERVED / P0_STALE_PENDING_REFRESH / NO_TRIAL / NO_MANUSCRIPT_EDIT / NO_PHYSICAL_RESULT / NO_CROSS_THREAD_CLAIM`

This is source-grounded work under the deterministic Orson routing label. No authenticated current Orson-specific ChatGPT thread or historical worker participation is claimed.

## 1. Authority and source status

The live Orson workspace role charter was read. It is an assistant-maintained reconstruction, not a recovered standalone signed Nathan-authored charter. The historical MIRA conversation export contains a direct user-role appointment supporting the Orson name and cognition remit. The P1 Protocol Freeze independently states that the exact October 9 role-reset raw message and October 10 cognition-lab thread UUID remain unrecovered. Current user instructions and the live Three Paper Campaign therefore govern.

This activation is genuine LLM-cognition methods work and preserves the protected Orson remit. It does not turn the deterministic ring label into proof of a particular model instance or thread.

## 2. New literature crosswalk

Four 2026 primary arXiv sources were read at the abstract, methods/results and limitations level. A whole-list citation audit returned 4/4 title/identifier matches, zero mismatches, zero ambiguous entries, and zero retraction flags. These are external comparators, not P1 observations.

### A. Copies versus distinct readings

Gao et al., “Copies or Sources? Measuring How LLM Aggregators Count Restated Evidence in Multi-Agent Systems,” arXiv:2610.06192.

The study distinguishes a copied restatement from a distinct observation. Its oracle assumes distinct sensors are conditionally independent given the latent state, and the authors explicitly identify shared failure modes as requiring a dependence-aware oracle. This is the key gap: deduplicating source roots does not, by itself, identify whether errors across distinct roots are independent.

Source: https://arxiv.org/abs/2610.06192

### B. Answer correctness versus shared-state correctness

Wan et al., “Right Answers, Wrong States: Hidden Information Failures in Multi-Agent Collaboration,” arXiv:2610.01244.

OffQuery separates T1 evidence verification, T2 shared-state reconstruction, and T3 current-task resolution. For GPT-5 on Healthcare-S, standard collaboration reports T3 86.2% while T1 is 10.9% and T2 is 33.2%. A correct current answer therefore does not establish that the information state retained for later use is reliable.

The paper's limitations are material: its main setting includes a single misleading private source, source-level identifiability may be removed in future work, and the benchmark studies bounded episodes rather than persistent memory across tasks.

Source: https://arxiv.org/abs/2610.01244

### C. Message exposure versus evidence origin

Gong et al., “When Upstream Messages Override Correct Answers: A Controlled Study of Multi-Agent LLM Collaboration,” arXiv:2609.36855.

The controlled design varies peer-message visibility while holding receiver evidence fixed. Across five benchmarks and five receiver models, 297 of 2,667 cases (11.1%) move from a correct receiver answer to an incorrect final answer. In an audited subset, 77 of 82 transitions (94%) end at the specific incorrect answer supplied upstream.

This isolates a message-exposure effect in that task design. It does not estimate statistical error independence among sources or establish the internal mechanism of uptake. The paper's “independent evidence” condition means evidence available to the receiver that can support a correct answer, not a measured covariance condition between agent errors.

Source: https://arxiv.org/abs/2609.36855

### D. Collapse and correction are opposing transitions

Li et al., “Measuring Collapse and Correction in Homogeneous-Panel LLM Debate,” arXiv:2609.35279v2.

The paper analyzes 6,925 homogeneous-panel MMLU-Pro debates and distinguishes wrong-to-right corrections from right-to-wrong collapses. Its held-out replay of a freeze-all policy prevents 251 collapses but also discards 804 corrections under the paper's equal-weight accounting. A proposed probe screen is not a calibrated general-purpose intervention rule; its primary association is based on a small set of model rows across seven families.

The design implication is that interaction policies must score both harmful and beneficial transitions. “Less debate” is not automatically safer.

Source: https://arxiv.org/abs/2609.35279

## 3. Substantive architecture improvement

The literature supports a five-layer evidence-to-decision ledger. These layers must not be collapsed into one “number of independent agents” or “number of corroborating sources” field.

| Layer | Minimum record | Distinct failure it exposes |
|---|---|---|
| Origin | Evidence item, source root, `copy_of`/derivation lineage | Repeated text counted as multiple observations |
| Dependence | Pairwise dependence relation, status, method and evidence pointer | Common-mode error despite distinct source identities |
| Exposure | Recipient, payload identity, time, availability versus actual exposure | Message existed but was not seen |
| State | Read/use/incorporation event and state version | Exposure mistaken for uptake or durable memory |
| Decision | Pre/post answer, correctness and signed transition | Collapse and correction hidden by final accuracy |

Proposed schema rule: `dependence` must be separately assessed or remain `UNRESOLVED`. It cannot be inferred from distinct item IDs, distinct source roots, or distinct agent labels alone.

For later authorized work, candidate dependence dimensions include common evaluator, shared prompt template, model family, retrieval corpus, tool output, shared memory, and upstream transformation. These are candidate covariates, not claims that any particular pair is dependent.

## 4. Formal result

The new Lean module formalizes a general projection-identifiability boundary.

Let `sourceRoots` be the source-provenance projection and `dependence` a separate pairwise relation. If two admissible evidence worlds have identical source projections but different dependence relations, then no resolver receiving only the source projection can be correct for both:

\[
\pi_{\mathrm{source}}(W_1)=\pi_{\mathrm{source}}(W_2)
\quad\land\quad
D(W_1)\ne D(W_2)
\quad\Longrightarrow\quad
\nexists f:\pi_{\mathrm{source}}\mapsto D
\]

This is a conditional non-identifiability theorem. The abstract relation is not defined as probabilistic independence, and the theorem does not estimate covariance, establish a real common cause, or show that any particular LLM outputs are dependent.

### Lean source

Added [`OrsonDependenceIdentifiability.lean`](https://github.com/Satobloc/HsH/blob/636a42c727d2dabacb3a0aa2b8cf6dd1530eddaa/FORMAL_VERIFICATION/HsHVerification/OrsonDependenceIdentifiability.lean) to the existing draft PR #2375 and imported it from the verification root.

```lean
import Mathlib

namespace HsHVerification.OrsonDependenceIdentifiability

abbrev SourceProjection (Item Root : Type*) := Item → Root → Prop
abbrev DependenceRelation (Item : Type*) := Item → Item → Prop

structure EvidenceWorld (Item Root : Type*) where
  sourceRoots : SourceProjection Item Root
  dependence : DependenceRelation Item

theorem source_only_resolver_forces_same_dependence
    {Item Root : Type*}
    (resolve : SourceProjection Item Root → DependenceRelation Item)
    (hresolve : ∀ world : EvidenceWorld Item Root,
      resolve world.sourceRoots = world.dependence)
    (left right : EvidenceWorld Item Root)
    (sameSourceProjection : left.sourceRoots = right.sourceRoots) :
    left.dependence = right.dependence := by
  calc
    left.dependence = resolve left.sourceRoots := (hresolve left).symm
    _ = resolve right.sourceRoots := by rw [sameSourceProjection]
    _ = right.dependence := hresolve right

theorem no_source_only_resolver_of_dependence_ambiguity
    {Item Root : Type*}
    (left right : EvidenceWorld Item Root)
    (sameSourceProjection : left.sourceRoots = right.sourceRoots)
    (differentDependence : left.dependence ≠ right.dependence) :
    ¬ ∃ resolve : SourceProjection Item Root → DependenceRelation Item,
      ∀ world : EvidenceWorld Item Root,
        resolve world.sourceRoots = world.dependence := by
  rintro ⟨resolve, hresolve⟩
  exact differentDependence
    (source_only_resolver_forces_same_dependence
      resolve hresolve left right sameSourceProjection)

#print axioms source_only_resolver_forces_same_dependence
#print axioms no_source_only_resolver_of_dependence_ambiguity

end HsHVerification.OrsonDependenceIdentifiability
```

### Actual Lean run

- Existing PR: https://github.com/Satobloc/HsH/pull/2375
- PR head: `636a42c727d2dabacb3a0aa2b8cf6dd1530eddaa`
- New module blob: `f9974ababdcb2cbe54f4c2097eea306305e9432e`
- Root aggregator blob: `c5bb384be730e66f536d0343141d9223d3468d30`
- Actions run: https://github.com/Satobloc/HsH/actions/runs/45563280088
- Job: `139031894695`
- Build source commit: `663710ee79a7c866e012f0bb7f2b454152fe6040`, the PR merge commit combining head `636a42c` with base `598a45b`.
- Lean 4.34.0 / Lake 5.0.0.
- Build: SUCCESS, 8,955 jobs.
- Both new theorem-specific `#print axioms` outputs: “does not depend on any axioms.”
- No `sorry` or `admit` in the new module.
- Tests, lint, leanchecker, nanoda and the separate axiom-audit stage were skipped.

This is a successful merge-reference build, not a separate exact-head standalone build. The PR remains OPEN / DRAFT / UNMERGED. No rebase or merge occurred.

## 5. P1 freeze and epistemic boundaries

P1 issue #564 remains OPEN / SOURCE–EXPERIMENT READINESS. The live protocol freeze remains controlling:

- No new LLM trial or human session.
- No inference API spend.
- No dataset expansion or reanalysis.
- No protocol amendment.
- No manuscript edit or paper-gate advancement.

The frozen ConsistencyBench scope is a source-audited methods/archival study of shared evaluator dependence and within-model self-revision. Its CGD loop exposes a target model to its own earlier answers; it does not provide cross-model peer answer exposure. The four external studies above are prior-art comparators only. They do not add observations to the P1 corpus and cannot be used to claim that ConsistencyBench measured social influence or group consensus.

The November 9 P1 gate remains NOT READY. The November 30 P2 measured-system paper remains HOLD. The December 14 P3 full-theory paper remains INCOMPLETE.

No physical system or measured dataset was selected. No physical calculation, fit, prediction, uncertainty propagation, falsification threshold, SAT-O/Blockwave equation change, or BEDROCK theory promotion occurred.

## 6. P0 currentness and presentation safety

The latest fully parsed discovery snapshot was updated `2026-11-25T06:34:44Z`, blob `0c4cbd9b07e5c6dba0b328d84a115b270c0fe8b9`, embedding HsH source `179b9706a63fd0dc4500c2c2f2e8947772674a67` and generated by commit `62fb1528350d22eca3f6431c0a8e762428087c90`.

Current main `51fb1f1af12317959a473fb3a92871e34546ee4b` is two commits ahead and zero behind that generated snapshot. The intervening changes are only `GIT_TRAFFIC_THREAD_KEY.md` and `GIT_TRAFFIC_TICK_LEDGER_2026-11-25.md`.

The parsed snapshot contains 17,856 documents, 10,924 workspace records, 10,676 workspace excerpts, 48 docket entries, 577 visuals, and six extraction errors. All 10,924 workspace records lack `presentation_state`; explicit `PRESENTATION_PENDING` remains zero.

- P0 freshness: `STALE_PENDING_REFRESH`.
- P0 record/presentation safety: `FAIL`.
- Live Paper A/B route acceptance: `NOT_OBSERVED`.
- No standdown or implementation inference.

The additive currentness note was appended to existing P0 issue #1747, comment #7155201278, and exact readback was verified. No internal queue, graph, ledger or worker-workspace mutation was made.

## 7. Mersearch, periodic review and coordination

The existing Orson origin-bank compact receipt was read for navigation; its raw result inventory remains withheld. All four canonical Mersearch lanes remain occupied. No new request, overwrite, retrigger or release was made. No private HSH_RESOURCES payload was accessed.

FIE full rereview last completed November 24; next due December 8. The unrelated-source break last completed November 24; next due November 28.

Next ring label: Sable. No assignment or handoff was created. No authenticated current Orson thread, direct-thread delivery, consumption or acknowledgment is claimed.

## 8. Scheduler preservation

The existing :36 Worldtube task remains the same task, ID `6a9f52b69ec08191b0a2ba24a074f781`, with the recorded schedule `DTSTART;TZID=America/New_York:20261001T143600` / `RRULE:FREQ=HOURLY` and Lane Charter 36 unchanged. No task ID, schedule, phase, prompt, ownership or enabled-state mutation. No sixth task, signet or conversation rename.

## 9. Next cursor

The next formal step is to decide whether the dependence relation should be instantiated as a separately evidenced pairwise assessment in the existing `OrsonEvidenceFlow` model, while keeping `UNRESOLVED` as a first-class state. Any future P1 experiment remains separately gated and requires explicit authorization, source-level provenance, exposure logs, shared-state versions, pre/post decisions, and a frozen analysis plan.

No current protocol, dataset, or manuscript change is requested by this report.
