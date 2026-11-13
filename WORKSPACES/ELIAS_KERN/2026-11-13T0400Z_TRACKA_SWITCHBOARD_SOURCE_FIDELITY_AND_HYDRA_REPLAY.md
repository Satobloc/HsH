# Elias Kern h796:s0 | Switchboard / Hydra / Threading Source-Fidelity Audit

**Disposition:** SOURCE-FIDELITY AUDIT COMPLETE / SOURCE-DERIVED SOFTWARE REPRODUCTION PASSED / EXISTING LEAN MERGE-REF BUILD VERIFIED WITH LIMITS / TRACK B DISPOSITION PENDING / NO POC OR PR CHANGE / INTERNAL ONLY.

## 1. Rotation, authority, and continuity

- Nominal slot: 2026-11-13T04:00:00Z.
- h=796; seq=5×796+0=3980; 3980 mod 19=9.
- Selected deterministic role label: Elias Kern, index 9.
- Next ring label: Nadir Voss, index 10.
- Run key: REVROT3-19-20261011:796:s0.
- Current automation run observed: 00ee0deb-e858-832c-b275-2d618c9b6f7c; scheduled 04:00Z; recorded start 04:20:01Z; final available state IN_PROGRESS, completion null, chat_ref null.
- Existing task ID: 6aa1fe0de5e48191b886496095b1343f. Enabled state and original hourly America/New_York :00 schedule were preserved exactly. No task, prompt, schedule, phase, cadence, or enabled-state change was attempted.

The selected name is a deterministic routing label, not authentication of a persistent Elias instance or thread. Elias's workspace README is an assistant-maintained role synthesis; the inbox preserves a role-tagged Nathan instruction dated 2026-09-24 13:47 ET to exercise one bounded real-work mechanism per activation, observe actual behavior, preserve displaced work, and leave a durable receipt or failure packet. The originating raw conversation ID/message UUID and a standalone signed Elias role charter remain unrecovered. Historical conversation search independently confirms the bounded Track A remit: prototype operation/documentation, no production-workflow authority, and no SAT/H(s)H theory authority.

The h795:s4 Hale receipt names Elias as h796:s0 successor. Its final state is IN_PROGRESS and its optional handoff was written after the successor had nominally started. It is not treated as authenticated predecessor-thread delivery, consumption, or acknowledgment.

## 2. Live control, branch, and repository preflight

Read/rechecked the live BEDROCK governing sections, the Primary Operational Guideline precedence, Steering Charter 2026-10-26, Three Paper Campaign, three-repository Mersearch onboarding, current task graph, Elias continuity, Sable inbox, and the h794:s0 Orson and h795:s4 Hale receipts.

Key source identities:
- HsH BEDROCK: blob 0253ace674bbc361464b7bbaac2c41aa3d8e8867, 667 lines. Primary Operational Guideline outranks BEDROCK where they directly conflict; FIE remains foundational.
- Steering Charter: blob 04822f3e48f746e9e464d893636ed4a670d68683.
- Three Paper Campaign: blob 2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4.
- Mersearch three-repository onboarding: blob 086778737a004c467b0b52142d71aa5b961fc166.
- Task graph: blob 05283edaa44e2163406c8b005a7fbbca95d76c7f; branch_count 16 versus 18 records remains explicitly unresolved and Tern-owned. No graph edit.
- HsH, SAT archive, and HSH_RESOURCES default branches are main. Latest observed commits in repository search: HsH 0871de803f827d40965aea3f7e55c423487dcc79; SAT archive 37fcbdc49b331cd11209d203384c0b64a604c7b9; HSH_RESOURCES 88957555cc933ac986b5a291de45aafd6efd063e.

The named standalone Revival V3/V4 documents were not resolved at the candidate paths checked. The current prompt's fixed ring/formula and the h794/h795 receipts agree on the rotation calculation, so no alternate rotation was inferred.

## 3. Source cluster and provenance

This pass stays inside Elias's software-prototype remit. It does not undertake the SAT/H(s)H physical-geometry assignment, which Elias is not authorized to own.

Primary/near-primary material inspected:
- Nathan-signed War Room declaration, HSH_RESOURCES internal copy, blob 1506a3c8030f446b08990dac88dc45227dfa3463. It calls for distinct worker roles/workspaces/inboxes, visible communication, evidence-based disagreement, and deliberate alternation between broad and narrow attention. This is a direct source, but it is not a complete specification of the later switchboard code.
- Elias role-tagged inbox record for the 2026-09-24 bounded Track A instruction. This is a preserved source summary, not the recovered raw originating message.
- Assistant-maintained switchboard POC guide, blob 0a708813bac6e1e7dc763779ed080b6d7e27fd42.
- Python switchboard demo, blob 49988a769389b2baf264a27d596ba7c3ff822b36.
- Assistant-maintained threading protocol, blob f87ff21918b6fa4804d090cdb9153aa0dd53d288.
- Python threading demo, blob ce313e46b1b85ae35028b46a4196d2a945b535d8.

The architecture labels TOP / CENTRAL / BRANCH / HYDRA and the detailed data structures are assistant-produced operational reconstructions. They must not be quoted as Nathan Direct ontology. The Python switchboard is a deterministic planner/state transformer: it returns wake data, route records, spawn plans, recurrence rewrite proposals, and guards. It does not itself schedule workers, execute branches, enforce information isolation, or deliver work to other ChatGPT threads.

## 4. Stable glossary

| Term | Source-faithful working meaning | Implementation boundary |
|---|---|---|
| TOP | Global invariants and locked control rules | A mutable Python dictionary with a lock marker, not a genuinely immutable type |
| CENTRAL / WAKE | Resolve actor, locale, sources, fresh directives, capabilities, blockers, and next operation | Returns a Wake record; does not execute the selected operation |
| BRANCH / ROUTE | Typed work paths such as serial, parallel, perpendicular, and gated | Returns branch metadata; does not instantiate independent workers or contexts |
| HYDRA | State-conditioned spawn and recurrence-rewrite planner | Returns plans and guards; does not run a scheduler |
| THREADING | Temporal seed / vacate / propagate / accumulate / rendezvous / rejoin process | Separate state machine; no demonstrated composition with the Hydra executor because no executor exists |
| node_id | Which Hydra rule is eligible | Not the identity of a particular event |
| event_id / lease_id | Which concrete event or lease is being processed | Not present in the legacy fingerprint projection |
| state_version | Version of the state snapshot against which a plan was made | Not included in the legacy fingerprint |
| source route | A selected source category or repository path | Not evidence that the source was actually read |
| perpendicular | Intended exposure separation until outputs freeze | In the POC it is metadata, not enforced noninterference |
| sticky candidate | Captured possible lesson | Current Python method appends directly; no candidate/promoted lifecycle |
| receipt | Evidence record associated with an event or output | Human-readable labels alone do not authenticate producer, thread, reviewer, or exposure |

## 5. Mapping diagram

Current planner path:

Event + actor + locale + state
  → WAKE: source routes, fresh directives, capability gaps, blockers
  → ROUTE: branch plan with relation/share labels
  → HYDRA: spawn plan + recurrence rewrite proposal + guards
  → [NO EXECUTION / SCHEDULER ADAPTER]
  → [NO ENFORCED BRANCH ISOLATION]
  → [NO TYPED OUTPUT-TO-STATE COMMIT]

Separate threading path:

SEED
  → VACATE
  → PROPAGATE
  → ACCUMULATE receipts
  → RENDEZVOUS when threshold/time cap is met
  → REJOIN / synthesize

Required but currently absent composition:

HydraPlan × BranchPlan × ThreadState × authenticated SchedulerContext
  → ExecutedEffects × scoped Receipts × next StateVersion

Without this composition map, the POC's route/spawn records cannot be treated as actual execution, and a Threading receipt cannot be assumed to prove that a Hydra plan ran.

## 6. Original versus translated propositions

| Direct / source-level proposition | Assistant translation or implementation | Fidelity result |
|---|---|---|
| Workers should retain distinct roles and useful individual methods while communicating and debating through evidence. | TOP/CENTRAL/BRANCH/HYDRA common control model with actor/locale overlays. | Compatible design proposal, not a direct quotation or proven implementation of the instruction. |
| The 2026-09-24 role-tagged instruction asks for one bounded real-work operation, observation of actual behavior, and durable output/receipt. | Python POC returns plans and the demo self-test checks seven expected outputs. | A planner test is not evidence that the proposed jobs executed or that a durable output receipt exists. |
| Independent/perpendicular checks should remain exposure-separated until their outputs freeze. | BRANCH records relation=perpendicular and share=false. | Metadata only; no separate execution contexts or information-flow barrier are implemented. |
| Only a transfer-tested lesson should become sticky. | HYDRA nested_learning rewrite says this, but sticky(actor,kind,text) appends directly to experience. | Direct implementation mismatch. |
| A temporary lease should be restored only after a durable output receipt or explicit failure packet. | receipt_gate emits verifier and restore job records with a dependency label. | A plan dependency is not an executed receipt verification or enforced restoration gate. |
| A bounded override expires after one quantum and applies only to its intended scope. | override_rules emits the expires_after string as a rule label. | Expiry and actor/locale/operation scope are not enforced by the Python source. |
| Threading return should reflect accumulated evidence and an actual VACATE interval. | should_rejoin uses state_threshold OR time_cap. | The source transition does not require that the author actually vacated, that propagation began, or that a vacate timestamp exists. |

## 7. Discrepancy ledger and bounded software test

### A. Hydra fingerprint collapses distinct events

The Python source's legacy fingerprint is derived from node ID, candidate stage, and directive ID/incorporation flags. The Hydra method receives the event payload, but the fingerprint does not include a concrete event ID, lease ID, actor, locale, thread, seed version, parent goal, state version, or prior wake/branch context.

A source-derived minimal reproduction copied the relevant condition(), hydra(), receipt_gate, and nested_learning logic. It was run with two distinct lease IDs in unchanged state, then two distinct learning IDs in unchanged state.

- Command: python /tmp/hydra_guard_repro.py
- Exit: 0.
- Reproduction file SHA-256: 196da0696ee377a0b813d087eaadc4fcb2b9b8d71aca0b62c86e224265041df1.
- First temporary-lease event: two jobs spawned, one lease-return rewrite proposed, no guard.
- Second distinct temporary-lease event: no jobs and no rewrite; loop_guard:receipt_gate.
- First learning event: bounded-work plan spawned and actor-education rewrite proposed.
- Second distinct learning event: no plan and no rewrite; loop_guard:nested_learning.

This is a source-derived minimal reproduction, not a full execution of the upstream file. The full upstream POC's seven built-in self-tests were previously run against exact source bytes in h784:s3 and passed 7/7; the source blob is unchanged. Those seven tests do not cover this repeated-distinct-event case.

### B. Existing Lean formalization already captures the projection defect

PR #951 contains EliasHydraScopeProjection in EliasHydraRewriteStarvation.lean. Its legacy projection is:

K_legacy = (node_id, candidate_stage, directive_flags).

The proposed scoped projection adds actor, locale, event_id, lease_id, thread_id, seed_version, parent_goal, state_version, wake fingerprint, and branch fingerprint.

The formal propositions are:
- distinct event IDs can coexist with equal legacy projections;
- the proposed scoped projection separates records with different event IDs.

This is the right conditional structural statement. It is already present in the existing PR, so this pass created no duplicate theorem or module.

Actual CI evidence:
- Actions run #42658236405, job #129302583788: SUCCESS.
- Lean 4.34.0 / Lake 5.0.0; full library build 8,961 jobs.
- EliasHydraScopeProjection replayed at 8,947/8,961. The three theorem-specific #print axioms outputs report no axioms.
- EliasHydraProgressSplit also compiled; its #eval outputs show a zero-budget step emitting the plan while deferring the rewrite, then a retry admitting the rewrite without duplicating the plan. Its five theorem-specific axiom reports are no-axiom results.
- The target module blob at PR head f9fa0aad45408ab06e5430c834530854746235f0 and merge reference 5df7c1600d4e9f93885d8a7b8d13e8d16cbb1209 is identical: c1af57093f7cbeed780f00977fa361c290758c5a.

Limits: this is a successful merge-reference build, not a standalone exact-head build or current-main integration. The workflow set build=true but test=false, lint=false, nanoda=false, axiom-audit=false, and nanoda-allow-sorry=true. The three projection theorems' own outputs were inspected; no global no-sorry or global axiom-free claim is made. Lean proves the formal projection statements, not that the translation is faithful or that the Python code implements the proposed scoped key.

### C. Other source/formalization mismatches already in the existing PR

1. Rewrite budget/history: the Python Hydra loop can record a node fingerprint even when its rewrite was denied by the two-rewrite budget. The same key is then suppressed on retry. EliasHydraRewriteStarvation formalizes the finite loss; EliasHydraProgressSplit proposes separate plan-emitted and rewrite-admitted progress. Neither is a Python patch.
2. Sticky lifecycle: the Python sticky method accepts actor/kind/text and appends immediately. wake() does not read stored experience. The Lean candidate/promoted abstraction is not source-equivalent. Its current validTransferReceipt predicate also admits contradictory expected/observed behavior strings, a reused actor as reviewer, and the same exposure manifest at capture and test. Nonempty references are not authenticated identity or independence.
3. Route budget: source_routes returns only the first four matches. Excess routes have no explicit deferred/unrepresented disposition. EliasRouteBudgetCoverage proposes selected/deferred/unrepresented accounting, but is an abstract contract, not a proof of Python behavior.
4. Override expiry: Python checks field presence and emits strings; it does not evaluate a clock/turn or enforce actor/locale/operation scope. EliasOverrideExpiryGate specifies a typed lease contract, not implemented source behavior.
5. Threading receipt scope: OutputReceipt has no typed thread_id and add_receipt checks seed-version equality only. The same-seed receipt can be accepted into more than one thread state. EliasThreadingReceiptTransfer formalizes a source-shaped counterexample; its synthetic witness is not an actual worker event.
6. VACATE prerequisite: should_rejoin and mark_rejoin_if_ready can admit rejoin from active/seeded state when the threshold is already true. EliasThreadingVacateGate proposes a guard requiring vacated state, propagating phase, timestamp, and a return condition.
7. Worker identity: Threading counts distinct worker strings, not authenticated worker subjects or independent reasoning sources. EliasThreadingWorkerIdentity demonstrates that identical visible receipts can be compatible with different hidden identity assignments.
8. TOP immutability: checking TOP["mutation"] == "locked" at construction does not make the global dictionary or its rules list immutable.
9. Actor coverage: the demo registry contains four exact strings. Only Sable and Meridian match names in the 19-person ring; 17 ring labels are unregistered. The POC explicitly does not claim 19-worker support, so this remains a declared sandbox boundary, not a production defect. The earlier nine-assertion Elias registry fixture is a sandbox fixture only and was not promoted.

## 8. Full-system interpretation

Hydra and Threading are not synonyms and should not be collapsed:
- Hydra asks how a recurrence plan changes as state changes.
- Threading asks who vacates, who uses a seed, what accumulates while the author is absent, and what return condition makes reentry valuable.

The architecture currently has two planning abstractions and no verified composition into a scheduler/execution engine. The phrase “perpendicular” describes intended exposure geometry, not demonstrated independence. The phrase “sticky” describes intended memory promotion, not current behavioral uptake. The phrase “locked TOP” describes a design invariant, not a runtime immutability guarantee.

No physical geometry, SAT-O/Blockwave equation, CODATA score, measured system, dataset, fit, or physical prediction was part of this pass.

## 9. Research and governance controls

- All four Mersearch request files remain status=requested: lane 1 calder-angle-geometry-source-fidelity-20261102-1337; lane 2 archive-harvest-20261025-optics-01; lane 3 calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001; lane 4 kestrel-finite-core-geometry-source-fidelity-20261102-2200. Their request-scoped RUN_MANIFEST.json and SEARCH_RECEIPT.json paths returned 404. No Mersearch run occurred; no lane was overwritten or retriggered.
- Existing Math Hopper, formalization pipeline, PR #951, Whirligig references, and installed SciSpace connector were checked before considering new tooling. No new tool, dependency, fork, subscription, or expense was introduced.
- No local Lean/Lake/Elan is installed in this runtime. The Lean status above is based on the actual existing GitHub Actions job log.
- PR #951 remains OPEN / DRAFT / UNMERGED on research/elias-tracka-publisher-status-20261028t23z, head f9fa0aad45408ab06e5430c834530854746235f0, base infra/lean4-verification. It has zero formal reviews and zero review threads. The independent ELIAS-2224 Track B EvidenceLedger/subject-scope disposition remains pending. No POC, PR, adapter, or production change was made.
- P0 Code Grurple remains ACTIVE; P1 Nov 9 cognition remains OVERDUE / NOT READY and Orson-owned; P2 Nov 30 geometry remains HOLD; P3 Dec 14 full theory remains INCOMPLETE. No paper gate advanced.
- FIE was last reviewed November 10; next review November 24. No rereview due.
- The unrelated-reading cursor remains MIX TAPES line 421. The root path attempted in this pass returned 404, so no new reading quantum is claimed. No physical break is claimed.

## 10. Next deeper cursor

1. Await and record the independent Track B disposition of ELIAS-2224 before changing the POC or PR.
2. Keep the current source and proposed Lean model separate until a source-to-Lean adapter specifies every field and transition.
3. If Track B permits a sandbox change, add a typed event identity and state-versioned Hydra progress record. Duplicate event IDs should be idempotently suppressed; distinct event IDs should remain processable even when node/stage/directives are unchanged.
4. Separate plan emission from rewrite admission and retain deferred rewrites for retry.
5. Add explicit selected/deferred/unrepresented route accounting rather than silent first-four truncation.
6. Make branch isolation executable or describe it only as intended metadata; do not call it independent checking until an exposure barrier and merge contract are tested.
7. Type receipts with thread ID, seed version, artifact digest, producer identity, reviewer identity, and exposure ancestry. Compare expected and observed behavior rather than merely requiring both strings to be nonempty.
8. Require a recorded VACATE transition before a threading rejoin can be admitted; enforce override expiry against a monotone turn/clock and exact actor/locale/operation scope.
9. Re-run the full source self-test and targeted regression tests on an exact reviewed sandbox copy, then compare unchanged outputs byte-for-byte. Only a separate Track A/Track B decision can authorize transfer to the controlling POC.

## 11. Publication and handoff

This is internal POC QA using an HSH_RESOURCES private-reference source. It is not a public-safe theory result. No public issue or publisher submission was created, and no PUBLISHED_VERIFIED status is claimed. The internal workspace report and canonical receipt are the durable outputs. Nadir Voss is the next deterministic ring label, but Nadir's protected finite-core/geometry remit excludes Track A; no Track A task or handoff was assigned. No direct cross-thread delivery, consumption, or acknowledgment is claimed.

**Final classification:** ELIAS_H796_S0_SOURCE_FIDELITY / HYDRA_EVENT_SCOPE_REPRODUCED / EXISTING_LEAN_MERGE_REF_BUILD_VERIFIED_WITH_LIMITS / TRACK_B_PENDING / NO_POC_OR_PR_CHANGE / MERSEARCH_LANES_OCCUPIED / NO_PUBLICATION / AUTOMATION_PRESERVED.
