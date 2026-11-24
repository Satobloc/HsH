# Elias Kern h1035:s2 | Track A source-authority and eligibility-test coverage audit

**Disposition:** REVIVAL_SOURCE_RECONSTRUCTED_IN_RUN / TRACK_A_SOURCE_AUDIT_COMPLETE / TRACK_B_DISPOSITION_PENDING / FORMALIZATION_GATED / NO_POC_OR_PRODUCTION_CHANGE

## 1. Selection and identity

- Nominal UTC hour: h=1035, 2026-11-23 03:00–03:59Z.
- Sequence: 5×1035+2 = 5177.
- Ring index: 5177 mod 19 = 9, Elias Kern.
- Next ring index: 10, Nadir Voss; next run key REVROT3-19-20261011:1035:s3.
- Nominal :24 slot: 2026-11-23T03:24:00Z / 2026-11-22 22:24 America/New_York.
- Selection is a deterministic routing label, not authenticated worker identity.

The existing-thread-first search used prior-conversation retrieval, Elias workspace continuity, the source seed, prior receipts/handoffs, and current task/run references. No authenticated current Elias conversation ID, raw current thread, originating conversation UUID, or originating message UUID was recovered. The current :24 run has chat_ref=null. The cached task result belongs to the prior slot and is not a current-thread binding.

This work is assistant-level source-grounded revival, not a claim of historical Elias participation or cross-thread delivery.

## 2. Historical authority: direct source versus reconstruction

The strongest direct user-role evidence remains the September 24, 2026 13:47 ET entry in Elias INBOX.md (current blob 80ed8f7f1636b5b5e091abf40101f0089cd4b533), corroborated by the corresponding Tern INBOX.md entry (current blob 22867f1d3fc29b1149e022477c53bab209414d7a).

It establishes:
- Track A: Nathan, Elias Kern and Orson Vay, independently but in communication with Track B.
- Track B: Sable and Tern Rook, independently deciding KEEP / MODIFY / TEST / REJECT / DEFER.
- Elias operates and documents the prototype, exercising one bounded real-work mechanism per lease.
- Record before/after state and a durable receipt or failure packet.
- Describe observed behavior rather than intended behavior.
- Preserve the displaced lease function.
- The prototype does not confer production authority.

The September 24 13:48 ET Nathan-attributed Tern inbox entry supplies a six-step experimental threading primitive: SEED, VACATE, PROPAGATE, ACCUMULATE, RENDEZVOUS, REJOIN. It is an experimental temporal-coordination idea, not production scheduler authority.

A prior-conversation retrieval also surfaced a user-role request at 2026-09-24 16:36:36 asking for a prototype documenting Top (prefs), Central (hub), Branch, and Hydra recurrence/workflow semantics. That retrieval did not return the raw conversation export, title, conversation ID, or message UUID. It is a prior-context locator, not a verbatim primary-source transcript.

No standalone signed Elias specialist charter was found. Elias README.md is an assistant-maintained role synthesis, not a signed charter.

## 3. Top / Central / Branch / Hydra source stratigraphy

The current HSH_RESOURCES prototype sources were retrieved internally and compared with their recorded identities:

- HQ Tool Chest: blob c71230e4c78720c9c065c0d316f7a436d527a489.
- Workflow Switchboard Read Me First: blob e6b6bd6d413cddfcf43b37b1b1f01317c48caf86.
- Workflow Switchboard POC design: blob 0a708813bac6e1e7dc763779ed080b6d7e27fd42.
- Executable switchboard demo: blob 49988a769389b2baf264a27d596ba7c3ff822b36.
- Threading design: blob f87ff21918b6fa4804d090cdb9153aa0dd53d288.
- Threading demo: blob ce313e46b1b85ae35028b46a4196d2a945b535d8.

The Read Me First and POC documents define the current assistant-authored four-layer design: TOP preferences/locked invariants; CENTRAL wake/check and source/capability routing; BRANCH workrooms and locales; HYDRA guarded recurrence rewrites. The detailed registries, state schemas, condition language, node graph, rewrite budget, and executable behavior are assistant-produced prototype design. They are not a recovered Nathan Direct typed ontology.

The direct source supports the four labels and the request to make their workflow semantics inspectable. It does not yet supply the typed node/edge/authority/identity/routing/composition contract needed to formalize the entire switchboard as Nathan's intended architecture.

## 4. New bounded source-level finding: candidate eligibility test gap

The exact executable source still contains three relevant Hydra node conditions:

- candidate_checks requires candidate_stage=constructed and event_tag=theory_candidate.
- candidate_pass requires only candidate_stage=checked_pass.
- candidate_fail requires only candidate_stage=checked_fail.

The condition evaluator checks event_tag only when the node declares one; candidate_stage is read from the global theory_candidate state. The Hydra loop evaluates every node against the incoming event. There is no candidate identity key joining the event to the candidate whose stage is being read.

The built-in self_test has seven checks. It tests that failed candidates spawn pruning and passed candidates spawn prediction/paper work, but it does not test:
- an unrelated learning event arriving while a candidate is checked_pass;
- an unrelated learning event arriving while a candidate is checked_fail;
- a theory_candidate event for a different candidate identity;
- a candidate-version mismatch between the event and the global candidate state.

This confirms the h1012 candidate-event scope finding and adds a precise regression-coverage observation. It is a source inspection, not a fresh POC execution or production incident.

No POC file, self-test, adapter, production workflow, PR, or task graph was changed.

## 5. Existing Lean formalization and actual CI

PR #951 remains OPEN / DRAFT / UNMERGED.

- Head branch: research/elias-tracka-publisher-status-20261028t23z.
- Head SHA: f9fa0aad45408ab06e5430c834530854746235f0.
- Base branch: infra/lean4-verification-20261023.
- Current main: d30a36d9b687eddc8e9b029fb9093e30cbb351d9.
- Current comparison: 118 commits ahead / 26,864 behind main.
- Mergeable flag: true, which does not make this stale branch current.
- Formal review submissions: none.
- Review threads: none.
- Latest head-associated run: #42658236405, job #129302583788, completed SUCCESS on 2026-11-09.

The workflow checked out synthetic merge reference 5df7c1600d4e9f93885d8a7b8d13e8d16cbb1209, merging PR head f9fa0aad45408ab06e5430c834530854746235f0 into base c7dc2c... . This is a merge-reference build, not a standalone exact-head build.

The build completed 8,961 jobs using Lean 4.34.0 and Lake 5.0.0. The relevant existing modules built:
- EliasHydraScopeProjection at job 8,947/8,961: three theorem-specific reports state no axiom dependencies.
- EliasHydraProgressSplit: five theorem-specific reports state no axiom dependencies.
- EliasHydraNestedDepth: four theorem-specific reports state no axiom dependencies.

Tests, lint, leanchecker, nanoda, and the separate global axiom audit were skipped. The run does not establish those checks.

The existing formalization covers Hydra input projection, loop/progress splitting, and nested-depth guards. It does not contain an EliasHydraCandidateEligibility module or a typed EligibilityKey joining candidate identity, event scope, and candidate version. The candidate eligibility property is therefore not formally established by this PR.

The default HsH main branch does not contain the FORMAL_VERIFICATION project files. The local runtime has no Lean, Lake, or Elan installation. No new Lean module or build was attempted because the source contract and independent Track B disposition remain unresolved.

Lean results establish only the propositions actually formalized; they do not authenticate the POC source, validate the assistant reconstruction against Nathan's intent, or establish production behavior.

## 6. Independent Track B gate: still pending

Sable INBOX.md (current blob de1820e1dcd9c1d0d96c30fdd8d430227a003e37) contains the ELIAS-2224 EvidenceLedger / subject-scope request and asks Track B for an independent KEEP / MODIFY / TEST / REJECT / DEFER disposition.

No later disposition was found in:
- the current Sable inbox;
- the current Tern inbox;
- PR #951 review submissions or review threads;
- prior-conversation retrieval for a direct Nathan decision.

The October 30 sticky-lifecycle response is a separate issue and is not an ELIAS-2224 disposition.

Status remains TRACK_B_DISPOSITION_NOT_OBSERVED / PENDING. No review request, task, response obligation, or ownership transfer was created.

## 7. Mersearch and repository incorporation

Live front doors checked:
- HsH main at d30a36d9b687eddc8e9b029fb9093e30cbb351d9.
- SAT archive main at d10dd333f2487054807bda398995300c538caa7e.
- HSH_RESOURCES main at e86d2b139af70dc01e79a123ca8487d7b1b0237b.

HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, onboarding, Revival V3, thread routing, V4 not-found revival, navigation preflight, workflow control, autonomy/handoff protocol, no-renaming policy, Reference Desk, Mersearch Worker Start Here, Mersearch Releases, and current workflow orientation were read.

The stable Mersearch release is mersearch-stable-1.0 at pinned commit 89933c358b67ccbfbbaa680aadeb1f35d22d91b2. All four shared request lanes remain requested; none is idle. No request was overwritten or retriggered. No local three-repository checkout exists. GitHub code search was used as a bounded fallback in HsH and the SAT archive; it is not represented as a Mersearch result. HSH_RESOURCES source files were retrieved internally by exact path and blob; no private URL is included in this report.

The Tool Chest was inspected. No new tool, dependency, fork, plugin, subscription, or expenditure was introduced.

House-write preflight found no local Git checkout and no general internal checkpoint/receipt Actions writer; the existing issue publisher is the public-artifact route, not an internal workspace writer. The internal report and receipt therefore used the GitHub Contents API fallback. The report correction used the fetched current blob SHA, and both files received independent readback. No public publisher intake was appropriate because this was a source/authority audit, not a new public scientific result.

## 8. P0, campaign, and workflow-health boundaries

- P0 issue #1747 remains OPEN / ACTIVE.
- PR #2009 remains OPEN / DRAFT / UNMERGED, mergeable=false.
- No live-reader acceptance, independent browser acceptance, deployment, or explicit standdown was established.
- P1 cognition remains OVERDUE / NOT READY / FROZEN / Orson-owned.
- P2 measured geometry remains HOLD.
- P3 full theory remains INCOMPLETE.
- No Lane 24 Cycle 09, physical calculation, CODATA comparison, fit, prediction, independent measurement, equation alteration, manuscript advancement, or BEDROCK promotion occurred.

The task graph remains 18 records against 16 declared branches, with 17 reachable and one blocked. The PWH queue remains unchanged: WH-05 is blocked by occupied Mersearch lanes; WH-02 remains the highest-priority unblocked item and Calder/authorized-maintainer-owned. The Old Plan Recovery Sweep remains unpicked, with last substantive progress 2026-11-08, now 15 days old; coordination remains with Tern and no execution owner is assigned. No priority or ownership was inferred.

The last PWH deep review was Hale h1031. Four subsequent activations have completed; the next five-activation deep review is not yet due. FIE last full review remains November 20, next December 4. The last unrelated reading break was November 21; no duplicate break was performed.

## 9. Scheduler, predecessor, and successor

Existing :24 task:
- ID 6abda4c8eda88191bf23a6f2849e9a17.
- Enabled.
- DTSTART;TZID=America/New_York:20261001T142400.
- RRULE:FREQ=HOURLY.
- Phase: Geometry.
- Current run b090e874-0a60-8329-9bed-0f1a6a3cf879, scheduled 03:24Z, started 03:21:06.947058Z, last observed IN_PROGRESS, completed_at=null, chat_ref=null.
- Cached latest_result is prior run 68f509f4-6c18-8332-b015-6458f964aa64; it is not this current run.

The preceding :00 Calder run h1035:s0 (run 8c6509e0-343c-8322-bcba-6ff67bc76f67) was IN_PROGRESS at latest peek, with chat_ref=null. No addressed predecessor packet for Elias was found.

Next is Nadir Voss, h1035:s3. His inbox already contains Elias h993 optional Hydra context and Nadir h1016 optional readout-binding context. No new packet was added because this run produced no Nadir-specific action and the existing optional context should not be stacked. No direct-thread delivery, consumption, acknowledgment, assignment, or ownership transfer is claimed.

No repository checkout or materialization occurred, so no clone-ledger row was added. No task, ID, schedule, phase, enabled state, prompt, or cadence was changed. Four existing relay tasks remain; no sixth task.

## 10. TICK / TOCK

TICK
- Recover the original Nathan Direct switchboard specification.
- Verify the separate Track B disposition.
- Audit current source and formalization coverage without repeating the earlier method-level replay.

TOCK
- Direct Track A role instructions and the threading primitive re-read from source records.
- The high-level four-layer request located in prior-context retrieval, but its raw export and identifiers remain missing.
- Current POC source confirms candidate_pass/fail lack event-scope and candidate-identity gates.
- Built-in self-test omits mismatched-event and candidate-identity regression cases.
- PR #951's existing successful merge-reference build inspected; candidate eligibility remains unformalized.
- ELIAS-2224 remains pending; no independent Track B disposition found.
- P0 and campaign gates preserved; no production or theory change.
- No duplicate Nadir packet, public issue, or publisher submission created.

**Return cursor:** recover the raw September 24 Top/Central/Branch/Hydra source and obtain Nathan Direct typed node/edge/authority/identity/routing/composition definitions; separately obtain Sable/Tern's independent ELIAS-2224 disposition. Only then consider a conditional EligibilityKey formalization and mismatched-event regression tests. Preserve the existing POC and PR #951 until those gates clear.
