# H1065:s4 | Elias Kern routing label | Review-MIND recursive-state and scheduler-identity audit

**Classification:** assistant-level, source-grounded revival in the current scheduled execution. This is not an authenticated Elias thread, not historical-instance participation, and not cross-thread delivery.

## 1. Deterministic selection

Nominal scheduled slot: 2026-11-24T09:48:00Z.

- h = 1065.
- seq = 5 × 1065 + 4 = 5329.
- 5329 mod 19 = 9.
- Selected ring label: Elias Kern, index 9.
- Next ring label: Nadir Voss, index 10, h1066:s0.

Selection is based on the nominal scheduled slot, not the delayed host start.

## 2. Historical authority and source coverage

The controlling historical source recovered for Elias is [Switchboard Prototype Operationalization, 2026-09-24](../../COMMON/SWITCHBOARD_PROTOTYPE_OPERATIONALIZATION_2026-09-24.md), Git blob `28b967dff20e83398b3b7fd3388ab9b6a7cf531a`.

That Nathan-authored coordination note establishes two independent-but-communicating tracks:

- Track A: Nathan, Elias Kern, Orson Vey.
- Track B: Sable, Rook / Comptroller Tern Rook.

Elias is designated the prototype operator/documentarian. Nathan steers and evaluates ergonomics and intended behavior. Orson independently observes model/team-cognition effects and proposes discriminating tests. Track A and Track B may exchange pointers, failure cases, questions and frozen results, but must not silently converge implementation before each records its own view. Prototype success is not a global rule or production architecture.

The current Elias README is an assistant-maintained workspace description. No separate signed Nathan-authored Elias specialist charter was found. The original conversation/thread was not recovered in the personal-context search. The current task's `chat_ref` is null. Therefore this is a source-grounded reconstruction, not a claim that an Elias instance or historical thread participated.

The HSH_RESOURCES root README was read. It identifies the repository as private/internal research infrastructure. The private POC payload was not opened. Its source blob `49988a769389b2baf264a27d596ba7c3ff822b36` appears in comments in the HsH Lean modules, but was not independently fetched in this run.

Mersearch preflight found no first-class Mersearch action in this runtime. The documented four request lanes remain occupied: legacy lane 1 and lanes 2-4 are still requested; no request-scoped result directory was available. No lane was overwritten, retried or retriggered. No local HsH checkout exists in the execution container. GitHub search was used as a locator before this Mersearch preflight was completed; those hits are locator-only and do not count as Mersearch coverage or original-source attribution.

## 3. First-blush, explicitly an assistant reconstruction

The most important structural distinction is not a worker label but the state transition being evidenced. A plan being emitted, a rewrite being admitted, a source being read, a proof compiling, a publisher artifact being read back, a message being delivered, and a decision being semantically adjudicated are different events. A single `done` or `pass` label collapses information that later review needs.

Three concrete questions follow:

1. Can review results be compared if they were performed against different source revisions?
2. Can a loop-state fingerprint be reused as an invocation/replay identity without losing event and lease scope?
3. Can a one-level child filter justify a claim about arbitrary recursive nesting?

The existing formalizations provide partial answers. They do not yet establish the Python-to-Lean translation, the production runtime, human/LLM cognition, or actual independent group behavior.

## 4. Existing Lean work: actual logs re-read, no new run claimed

No local `lean`, `lake` or `elan` executable is installed. No GitHub workflow-dispatch action is exposed. No new Lean source was written or compiled in this run. The following are existing CI runs whose actual job logs were retrieved and inspected.

### PR #951: Track A evidence and recursion models

[PR #951](https://github.com/Satobloc/HsH/pull/951) remains OPEN / DRAFT / UNMERGED. Current PR head: `f9fa0aad45408ab06e5430c834530854746235f0`. The retrieved Actions run #42658236405, job #129302583788, checked out merge ref `5df7c1600d4e9f93885d8a7b8d13e8d16cbb1209`, not a standalone exact-head checkout. Lean 4.34.0 / Lake 5.0.0; 8,961 build jobs succeeded. The relevant PR-head file blobs were compared with the tested merge-ref blobs and matched exactly:

- `EliasHydraRewriteStarvation.lean`: `c1af57093f7cbeed780f00977fa361c290758c5a`
- `EliasReceiptEvidenceAxes.lean`: `47bb681a45958754601263600737562188ecebfc`
- `EliasActorRegistryCoverage.lean`: `be24aa349a65bd9e8f8abd9d6fafa7348ce03b18`
- `EliasProofTargetIdentity.lean`: `8fa26f99f22eeafcbc6a26cbc2f6f4b1c58646c5`

The target theorem outputs were inspected. The Hydra progress-split and nested-depth theorems, exact actor-registry finite facts, and proof-target identity theorems report their theorem-specific axiom dependencies. No `sorryAx` appears in the retrieved log. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped. This is a successful merge-reference build, not independent formal review or global axiom acceptance.

**Nested recursion limit.** `EliasHydraNestedDepth` uses a `SpawnDescriptor` with a list of immediate child depths, not a recursive tree. The actual `#eval` outputs include:

- observed nested shape: `[1, 2, 2]`
- legacy top-level guard probe: `[1, 4]`
- one-level child-aware guard: `[1]`

Theorems `top_level_guard_preserves_nested_overdepth_child`, `top_level_guard_does_not_establish_global_bound`, and `one_level_child_aware_guard_removes_overdepth_child` report no axiom dependencies. This establishes the encoded one-level result only. It does not establish an arbitrary-depth recursive bound.

A valid next formalization would need a recursive `SpawnTree`, a recursive `withinBound` predicate, an explicit policy for pruning versus rejecting a parent with an invalid descendant, and a projection from source JSON into the tree with explicit failure for malformed or unknown nested fields. The composition theorem must show that projection followed by the recursive guard preserves the stated invariant. This is a proposed proof target, not implemented code or a POC patch.

**Progress separation.** The same file proves that zero rewrite budget can emit a child plan while deferring rewrite admission; the deferred rewrite remains retryable, and a retry can admit it without duplicating the plan. These are distinct encoded states, not evidence of a production scheduler or durable receipt implementation.

**Evidence axes.** `EliasReceiptEvidenceAxes` defines exactly four statuses: source content, formal proof, publisher readback, and historical ChatGPT-thread delivery. The module comment says it is a proposal, not a Python or production change. It has no `semanticAdjudication` field. The fifth axis proposed in the h1062:s0 report remains a proposal, not an implemented or compiled extension. A semantic review must not be silently mapped to either delivery or proof status.

**Actor registry.** The finite model records 19 routing-ring names and four prototype keys. Exact overlap is `Sable` and `Meridian`; 17 ring names are not exact keys. It explicitly preserves `Orson Vay` versus `Orson Vey`, and `Tern Rook` versus `Comptroller`, without aliasing. The module also states that the POC is sandboxed and does not claim 19-worker support. This is not a production defect or permission to expand the POC registry.

**Proof-target identity.** The proposed acceptance predicate requires exact automation ID, scheduled slot and run ID; a distinct matching attempt token; result creation no earlier than attempt start; and completed status/timestamps on both attempt and result. The module explicitly says the current connector does not expose every required field. Its recorded `#eval` checks for the earlier Worldtube and Geometry examples return scheduled-slot matches `false` and created-before-start `true` for both. This is a model of rejecting stale prior results, not proof of scheduler backend semantics.

### PR #742: revision coherence and invocation scope

[PR #742](https://github.com/Satobloc/HsH/pull/742) remains OPEN / DRAFT / UNMERGED. PR head: `40f4632f9b2d06b76042e8c27d76e221de5b9b39`. Actions run #44968984040, job #137044417296, checked out merge ref `83109014ae7b2f81ac4e120a422da2ea6fb98ed5`, Lean 4.34.0 / Lake 5.0.0; 8,946 jobs succeeded. The two relevant PR-head module blobs match the tested merge-ref blobs:

- `EliasCheckRevisionCoherence.lean`: `e704fbf25d2c8e9cae74dfc3932324cd1f6db58b`
- `EliasHydraEventLeaseScope.lean`: `5318d833c9f680cde3f62bce080e97157e4179be`

All inspected target theorems in these modules report no axiom dependencies. Tests, lint, leanchecker, nanoda and the global axiom audit were skipped.

**Revision coherence.** The formalized legacy check requires three Boolean pass flags but does not require a common source revision. The finite `mixedBundle` has all three passes true while the math check is on revision B and adversarial/provenance checks are on revision A. The theorem `legacy_can_pass_incoherent_reviews` proves that the legacy pass predicate is true while `sameRevision` is false; `legacy_pass_not_sufficient_for_coherence` proves the general implication does not hold. This is a valid counterexample to the encoded Boolean rule. It does not establish reviewer independence, actual human/LLM behavior, or source-code equivalence.

**Loop state versus invocation identity.** `EliasHydraEventLeaseScope` deliberately separates a loop-state key from a proposed execution key. The loop key ignores actor, locale, event ID, lease ID and state version; the execution key distinguishes each when changed. The module explicitly states that event ID, lease ID and state version are proposed adapter fields absent from the current POC. The theorem `same_loop_state_different_invocation_scope` proves the encoded distinction, not that a runtime currently supplies those fields.

## 5. Review-MIND synthesis

The strongest source-grounded design requirements are:

- Preserve plan emission, rewrite admission, evidence verification, publication, delivery, semantic adjudication and outcome as distinct events.
- Bind all review results in a bundle to one explicit source revision. A count of passing checks is not a coherent review if the checks target different revisions.
- Keep loop recurrence identity separate from exact invocation/replay identity. Proposed event/lease/version fields require a runtime adapter before they can be treated as observed facts.
- Represent arbitrary nesting with a recursive type and explicit projection/composition maps. A list of immediate child depths is not a proof of arbitrary recursive behavior.
- Track source independence separately from reviewer count and shared exposure. The current formalizations do not establish independent human/LLM review.
- Add semantic adjudication only through the existing Track B gate and explicit owner review. No fifth-axis code change is authorized here.

No human-subject session, live LLM-team experiment, model trial, raw-data analysis, physical calculation, or claim of assistant consciousness occurred. The evidence is repository source, formalized software models, and historical CI output. No new tool or subscription was introduced.

## 6. PWH and other lanes

Tern's h1066:s2 deep-review artifact was published as [issue #2490](https://github.com/Satobloc/HsH/issues/2490), with published artifact readback. It states that the next deep review is due after five further actual completed worker activations following h1066:s2, or earlier on a material trigger.

However, at the latest readback the central [PWH action queue](../../COMMON/PRIMARY_WORKFLOW_HEALTH_ACTION_QUEUE_2026-11-13.md), blob `25c3ec718cb7cb004f8c8cd82dca756e1526a1e5`, still names h1062:s3 as the last deep review and retains the older trigger cursor. Tern CURRENT_WORK also still points to the earlier checkpoint. The report publication is verified; queue/current-work reconciliation is not. Tern retains queue and task-graph authority. No queue edit was made here. An optional packet is routed to Tern's next enabled ring appearance h1074:s0 for recheck, not automatic correction.

Campaign gates remain separate:

- P1 November 9 cognition paper: overdue, not ready, frozen, Orson-owned.
- P2 November 30 major paper: HOLD.
- P3 December 14 full-theory paper: incomplete.
- FIE: last full review November 20, next December 4.
- Unrelated-source break: last November 21, next November 28.

Orson's primary cognition work remains protected.

## 7. P0 currentness and safety

The prewrite discovery snapshot was refreshed at 2026-11-24T10:48:14Z:

- Main source commit embedded: `17ef74d9686b72ba5d48bde3f8235eee7cfe4b2d`.
- Generated discovery blob: `cdc4fbfa2958c91b75d893002c7ab9b58fca8bfd`.
- Generated file size: 31,673,049 bytes.
- Total documents: 17,732.
- Workspace records: 10,800.
- Workspace records missing `presentation_state`: 10,800.
- `PRESENTATION_PENDING`: 0.
- Workspace excerpts: 10,553; missing excerpts: 247.
- Visual records: 577.
- Extraction errors: 6.
- Both HsH and SAT archive scans: complete.

The generated discovery commit `7a911ec6b089d056a615b12689010bfae12512f0` has source parent `17ef74d9686b72ba5d48bde3f8235eee7cfe4b2d`, so prewrite source currentness passes. Record safety still FAILS: every workspace record lacks presentation state and no pending state is represented. Live visitor rendering and route acceptance remain NOT OBSERVED. This run's own report/receipt/inbox writes will advance main, so postwrite discovery freshness is PENDING until a later refresh is parsed.

## 8. Scheduler and run-order evidence

The :48 task remains enabled and unchanged:

- ID: `6aa6c3bc02b48191b8a91a30d2a155e0`.
- DTSTART: `20261001T144800 America/New_York`.
- Hourly recurrence.
- Phase: Review / Lane Charter 48.

Current :48 run: `e7658e5d-b254-8326-bcef-9700acb92b21`, scheduled 09:48Z, started 10:35:03.822879Z, still IN_PROGRESS at the 10:48Z read, completion null, `chat_ref=null`. Delay from nominal slot: 47m03.822879s. Its cached latest result is the previous 08:48Z Alberr result, not this run.

The next ring run h1066:s0 Nadir was already in progress before this run started: run `9ffe4704-55e0-8327-b72f-515a4158352c`, scheduled 10:00Z, started 10:27:46.539734Z, `chat_ref=null`. Tern h1066:s2 was scheduled 10:24Z and published its PWH artifact. Morrow h1066:s3 started 10:36:03.442685Z and completed 10:41:31.060686Z. Thus the h1065:s4 :48 execution started after h1066:s0 and h1066:s2 had begun, and overlapped h1066:s3. Nominal-slot identity remains Elias; actual execution order is not sequential.

The automation inventory still lists the original four enabled relays and the :12 relay disabled. The :24 task ID remains listed and enabled, although one exact-ID peek returned 404; no deletion or replacement is inferred. No automation was changed.

## 9. Write and publication disposition

No public issue or duplicate publisher submission was created. This is an internal continuity and formalization-scope audit, not a new public claim. The existing Tern PWH publication remains the only new public artifact referenced here.

No local checkout or suitable internal-file Actions writer was available, so internal report/receipt/continuity writes use the direct GitHub Contents API fallback with exact-path checks and readback. No code, PR, task graph, PWH queue, scheduler, paper or theory state was changed.
