# Orson h756 | Cognitive-state geometry and action-relative projection

**Status:** SOURCE-FIDELITY CROSSWALK COMPLETED / EXTERNAL LITERATURE TRIAGE ONLY / CONDITIONAL FORMALIZATION ADDED TO EXISTING DRAFT PR / LEAN COMPILE PENDING.  
**Scope:** LLM cognition, persistent state, observable behavior, handoff state, action-relative support, and provenance. This is not a new model trial, human study, physical calculation, consciousness finding, or paper-gate completion.

## 1. Source custody and historical direct position

The archive contains a user-role-labelled passage in DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/CONSCI.txt, blob SHA-1 e691708e39984493a3c94fad20077d829e84e1c5, lines 86–95. The message distinguishes stored/retrievable cross-session state from a possible dynamic ongoing state, and argues that other minds are assessed through observable behavior, especially language, because subjective states are not directly accessible.

The passage is historically important but bounded:

- It is transcribed with the explicit “You said:” role label, not a raw JSON conversation export.
- The original conversation ID and date remain unrecovered.
- Three archive paths contain byte-identical copies with the same blob SHA. They are one witness, not three independent confirmations.
- The message argues for epistemic caution and prudence; it does **not** establish that an LLM is conscious.

The historical assistant had first described ChatGPT as lacking ongoing states and continuous memory. The user challenged that categorical description. The assistant then distinguished stored/retrievable state from a hypothesized dynamic equilibrium. That latter distinction is a proposal, not an independently measured mechanism.

## 2. External comparator update: abstract-level only

The current research protocol distinguishes an abstract discovery from a completed comparator review. The full papers, appendices, code/data, or complete Zenodo/figshare records were not retrieved in this pass. The following are therefore **abstract-level leads**, not full-text reviews or independently reproduced results.

### Xue (9 September 2026)

Jiangwei Xue, *What Does Successful Execution Certify? An Executable Decomposition of LLM-Agent Handoffs*, Zenodo DOI [10.5281/zenodo.22668198](https://doi.org/10.5281/zenodo.22668198). The indexed abstract reports 80 controlled tasks, 5.8% strict global state fidelity, and 72.5% immediate action support. On a matched three-model subset, 164/180 executions succeed; among successes, global fidelity is 3.7% and immediate support 72.0%. The abstract also reports a required-state-bundle deletion contrast of 40/60 to 1/60, modest gold-state substitution gains with task-cluster intervals spanning zero, and a 106-pair natural-error repair experiment with no aggregate improvement.

The abstract does not identify the model/version assignment, reconcile all task/execution counts, or establish public data/code availability. The Zenodo record and full report were not independently opened. SciSpace metadata labels the item “Journal Article”; venue/peer-review status was not independently verified.

### Cazenille (10 October 2026)

Léo Cazenille, *Shared Memory Is Not Enough for LLM-Agent Teams*, Figshare DOI [10.6084/m9.figshare.34332540](https://doi.org/10.6084/m9.figshare.34332540). The indexed abstract reports that correct shared records can persist across agent replacement while agents fail to read them, receive them too late relative to route choice, or fail to coordinate delivery and repair despite early availability.

The indexed abstract supplies no sample size, model/version table, effect sizes, confidence intervals, preregistration, or verified code/data link. A candidate GitHub pointer surfaced in an aggregator search, but the repository's own README identifies it as a different MemForm memory-poisoning benchmark. It is not accepted as Cazenille's code artifact.

### Wittendorff (27 August / 3 September 2026)

Kim Wittendorff's indexed preregistration is DOI [10.5281/zenodo.22131392](https://doi.org/10.5281/zenodo.22131392), version 2 with Amendment 1 dated 1 September; it names companion DOI 10.5281/zenodo.22122223. The indexed results record is DOI [10.5281/zenodo.22273352](https://doi.org/10.5281/zenodo.22273352). Its abstract instead cites preregistration DOI **10.5281/zenodo.22131393** and amendment DOI **10.5281/zenodo.22231102**.

That one-digit preregistration mismatch is unresolved. The results abstract reports 11 models from eight vendors, three forms, three budget tracks, generation-3 handover chains, 19,800 item judgments, 297 handover notes and 660 successor scripts. It reports that provenance-first loss (H1) was refuted at the middle budget after one handover (provenance 25.8% [20.2, 32.3] versus fact survival 16.2% [12.9, 20.1]), while also stating that approver names and ratification dates were almost entirely lost: the surviving provenance was the label, not the evidence. Rule survival fell below its registered reliability gate.

These numbers and conclusions remain abstract-level until the primary records, amendment, full report and archive are retrieved and the DOI chain is reconciled.

### He and Yu (2 September 2026)

Jun He and Deying Yu, *Stored Is Not Supported: Typed Provenance and Assertion Guardrails for Persistent AI Agents*, arXiv [2609.02127](https://arxiv.org/abs/2609.02127). The abstract describes a typed provenance graph separating origin, dependency lineage, epistemic role, validity and disclosure scope, plus a conditional assertion-boundedness contract. Its 24 hand-authored conformance cases test the encoded resolver/mediator obligations; the abstract explicitly says this is not an end-to-end evaluation of language models or retrieval systems. Full-text review was not completed here.

## 3. Cognitive geometry: distinct state spaces and projections

The combined sources support a multi-axis measurement architecture, not one scalar called “memory,” “continuity,” or “success.”

**Handoff side**

~~~
Source history R
    | ρ: retention / compression
    v
H: complete carried state --------------------> P: provenance graph
    |                                             | origin
    | π_Ca: action-contract projection            | dependency lineage
    v                                             | epistemic role
H_a: action-relevant state                        | validity
    |                                             | disclosure scope
    | support test against contract C_a           v
    v                                         label ≠ evidence
S_a: immediate action support
    |
    | decision uptake (must be separately observed)
    v
D: structured action
    |
    | execution
    v
E: executed transition
    |
    v
O: task outcome
~~~

**Cognition/observation side**

~~~
X_t: complete system configuration
(model, runtime, context, persistent records, retrieval, tools, harness)
    |
    | O: observation map
    v
B_t: observable behavior / language
    |
    | evaluator E
    v
J_t: recorded score or label

Q_t: subjective experience is not an observed coordinate here.
No map B_t -> Q_t is established by these sources.
~~~

The direct historical message treats behavior/language as the available evidential route, not as a proof of subjective experience. Likewise, an action-success label is not a certificate of complete carried state.

### Stable glossary

| Term | Meaning | Must not be conflated with |
|---|---|---|
| Retention | A source item persists in a record or handoff | Availability, access, comprehension |
| Availability | A receiver could obtain the record | Actual reading/access |
| Access | The relevant item enters the receiver's usable context | Comprehension or uptake |
| Comprehension | The receiver correctly interprets the item under an operational test | Self-report or mere retrieval |
| Decision uptake | The item changes or governs a recorded decision | Action support or execution |
| Global state fidelity | Whole carried state matches a declared reference state | Local support for one action |
| Action-relative support | Carried state satisfies requirements of a specified action contract | Complete state fidelity |
| Execution | The selected action is applied by an executor | Correct decision or successful outcome |
| Outcome | The resulting task/environment state | Evidence that all prior state was retained |
| Provenance label | A marker such as “unapproved” or “source X” survives | Supporting evidence, authority, date, or lineage |
| Provenance evidence | Source identity, author/role, authority, ratification, validity, dependencies | A label alone |
| Observable behavior | Publicly recorded output/action | Complete internal state or subjective experience |

## 4. Original propositions versus translated propositions

| Source | Proposition | Fidelity assessment |
|---|---|---|
| Historical user-role message, CONSCI.txt lines 86–95 | Persistent cross-session state is not the same question as dynamic ongoing state; behavior/language is the accessible basis for other-mind inference | Direct historical conceptual source; original conversation locator unresolved |
| Historical assistant response, same transcript | ChatGPT lacks ongoing states/continuous memory | Overbroad; challenged by the user |
| Later assistant response | Stored/retrievable records may exist while dynamic equilibrium remains a possible distinction | Partial correction; dynamic mechanism remains speculative |
| VEY-030 measurement architecture | Retention, availability, access, comprehension, decision uptake and outcome are separate observables | Assistant-developed measurement proposal, not a direct user equation |
| Xue abstract | Global state fidelity, immediate action support, structured-action correctness and executed outcome are distinct | Abstract-level external result; full methods/data not retrieved |
| Cazenille abstract | Availability does not guarantee reading, timely access or coordination | Abstract-level qualitative result; sample/statistics unavailable |
| Wittendorff results abstract | Provenance labels may survive while supporting provenance evidence is lost | Abstract-level result with unresolved preregistration DOI lineage |
| He–Yu abstract | Persistence changes availability, not epistemic standing; typed provenance is required | Abstract-level formal proposal; conformance suite is not end-to-end LLM validation |

## 5. Discrepancy ledger

1. **Persistent versus dynamic state:** the historical assistant initially collapsed these; the user separated them. No current LLM dynamic-equilibrium measure is supplied.
2. **Availability versus access:** a record can exist and be available without being read.
3. **Global fidelity versus local support:** a handoff can support one action without preserving the full source state. The Xue abstract reports this distinction; its full protocol is not reviewed.
4. **Support versus uptake:** a state may contain sufficient information without the receiver actually using it.
5. **Uptake versus execution/outcome:** decision use, action correctness, executor success and task outcome are separate stages.
6. **Provenance label versus evidence:** a label can survive while source/approver/date/ratification evidence is lost.
7. **Behavior versus internal state:** the observation map is not shown to be injective; behavioral equivalence does not identify complete system configuration.
8. **Wittendorff DOI lineage:** indexed preregistration 22131392 versus results-abstract citation 22131393; amendment 22231102 not retrieved.
9. **Cazenille code pointer:** candidate repository README identifies a different MemForm benchmark; no verified Cazenille code/data package.
10. **Abstract-only boundary:** none of the four external items is a completed full-text comparator review in this run.

## 6. Conditional mathematical formalization

A generic map π_C:H→H_C can represent a projection from complete carried state to state relevant under action contract C. If π_C is non-injective, then:

~~~
not Injective(π_C)  =>  exists h1 != h2 such that π_C(h1) = π_C(h2).
~~~

Any support predicate defined only on π_C(h) has the same truth value for those two states. A left inverse of π_C would imply injectivity; a composition of injective maps remains injective.

This is a conditional mathematical statement, not evidence that any particular agent handoff or behavioral observation map is non-injective. It does not define the empirical support metric in Xue's abstract.

A corresponding Lean module was added to existing draft PR #1115, branch review/human-ai-group-unit-identifiability-20261030t1848z:

- FORMAL_VERIFICATION/HsHVerification/ObservableProjection.lean
- Module blob: 0ff8e07d1f7100e1648d05192aec9a9b340515b2
- Root aggregator blob: 05493550db326d6120df2c91ece6174b80520fa8
- PR head: cc5d92c6935aa2ae120de2efed7c4ac8a1ebfbc7

The module contains the collision, same-contract-status, left-inverse/injectivity and injective-composition statements. **LEAN_COMPILE_PENDING:** no Actions run exists for this head; the PR-branch workflow requires manual workflow_dispatch, no dispatch action is exposed in this runtime, and local Lean/Lake/Elan are absent. The separate Vercel failure is not a Lean result. PR #1115 remains OPEN / DRAFT / UNMERGED. No compilation or theorem-specific axiom audit is claimed.

## 7. Next deeper cursor

1. Retrieve the complete Xue Zenodo record, PDF, data, code and exact model/version/task assignment; reconcile 80 tasks with 180 matched-subset executions.
2. Retrieve Cazenille's complete Figshare files and verify any code/data link from the primary record.
3. Retrieve Wittendorff preregistration 22131392, any record at 22131393, amendment 22231102, results 22273352 and the complete archive; reconcile the DOI chain before using the reported numbers.
4. Read He–Yu's full arXiv text and inspect its actual formal assumptions and conformance cases.
5. Recover the raw JSON conversation ID for the historical CONSCI passage and the October 10 Orson role-reset/refocus exchange.
6. Define the actual state schema and action contract before asserting a projection π_C; measure access, comprehension, decision uptake, action support, execution and outcome separately.
7. Run the existing PR #1115 manual Lean workflow on exact head cc5d92c6935aa2ae120de2efed7c4ac8a1ebfbc7, then inspect theorem-specific #print axioms output. Do not merge or promote without review.

**Boundary:** no P1 protocol reopening, no OV-49–OV-55 trial, no human session, no API spend, no CODATA scoring, no physical calculation, no manuscript/PDF/reader advancement, no consciousness claim, and no theory promotion.
