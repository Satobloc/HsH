# H993:S3 | Hydra Loop-State vs Invocation Idempotency Scope

**Disposition:** `ASSISTANT_RECONSTRUCTION / TRACK_A_POC_ONLY / LEAN_BUILD_PENDING / NO_PRODUCTION_AUTHORITY`

## 1. Run identity and source authority

- Nominal UTC hour: **h=993**, 2026-11-21T09:00Z hour.
- Sequence: `5*993+3 = 4968`; `4968 mod 19 = 9`.
- Selected ring label: **Elias Kern**, index 9.
- Next ring label: **Nadir Voss**, index 10.
- Run key: `REVROT3-19-20261011:993:s3`.
- Automation run: `dec82ba0-41b4-832b-96b1-819ce17bd6fc`.
- Existing task: `6a9f52b69ec08191b0a2ba24a074f781`.

The scheduler recorded the run for 09:36:00Z but started it at 09:34:53.222943Z, 66.777057 seconds before the nominal slot. At final inspection it remained `IN_PROGRESS`, `completed_at=null`, `chat_ref=null`. The task-level configured conversation pointer is not a run-level thread binding. The cached latest result belongs to h992:s3, not this run.

The best direct role evidence is the Nathan-attributed 2026-09-24 13:47 ET entry in `WORKSPACES/ELIAS_KERN/INBOX.md`: work with Nathan and Orson on Track A of the Top/Central/Branch/Hydra prototype, independently but in communication with Sable and Tern's Track B; use a safe bounded lease; exercise one real-work mechanism; leave a durable receipt/failure packet; document observed behavior rather than intended behavior; and do not treat the POC as production authority. The raw originating conversation/message IDs remain unrecovered and no separately signed specialist charter was found. This run is assistant-level source-grounded reconstruction, not authenticated historical Elias participation.

Existing-thread-first checks found no authenticated current Elias thread. No direct-thread delivery, consumption, acknowledgment, assignment, or worker authorship is claimed.

## 2. Internal-first preflight

Read the live HsH BEDROCK, AGENTS/operational guidance, October 26 Steering Charter, Three Paper Campaign, three-repository onboarding, revival rotation and thread-first rules, current task/branch state, receipts, Elias workspace and role record, PWH queue, and task graph. Read the root orientation for HsH, SAT archive, and HSH_RESOURCES.

Mersearch was not run: the shared request and all three numbered lanes were already requested/occupied. No lane was overwritten, retriggered, or released. GitHub API/connector retrieval was fallback navigation, not a Mersearch execution. One private HSH_RESOURCES switchboard POC source artifact was read for this bounded Track A test; no unrelated private index or research payload was opened. No raw SAT-O/Blockwave source was fetched and no equation was changed.

Current main was `11f60084d7e0b0e884a363b8771401ca99a7f072`. The existing Lean PR branch is separate and stale relative to its base branch tip; no rebase or merge was attempted.

## 3. Source-grounded behavior

The private switchboard POC source was inspected by immutable Git blob `49988a769389b2baf264a27d596ba7c3ff822b36` (private locator withheld from this public report).

Observed source structure:

- `run()` creates a fresh `Switchboard` for each named scenario and returns `wake`, `branches`, and `hydra` as sibling outputs.
- `wake()` receives actor, locale, and event. `hydra()` receives the event but not the wake or branch outputs.
- The Hydra history fingerprint is built from node identity, candidate stage, and directive-incorporation state. The event tag participates in node eligibility, but event ID, lease ID, actor/locale, and state version are not part of that history fingerprint.
- The top-level scenario runner's fresh instance means the history does not demonstrate cross-run persistence. A repeated-call result on one persistent in-memory instance must not be generalized to separate top-level `run()` calls or a production scheduler.

A source-extracted method-level Python replay called `hydra()` twice on the same in-memory instance with the same node/stage/directive projection but distinct proposed `event_id` and `lease_id` fields:

| Observation | First call | Second call |
|---|---:|---:|
| Spawn descriptors | 3 | 0 |
| Rewrite descriptors | 1 | 0 |
| Guard | none | `loop_guard:candidate_checks` |

The two event IDs and lease IDs differed, while the source-derived loop fingerprint was equal. This reproduces the method's state-level loop guard under persistent-instance reuse. It is **not** evidence of cross-run production suppression, because the POC's top-level `run()` constructs a fresh instance per scenario. The current POC is a sandboxed planner/state transformer, not an executor.

## 4. Architecture improvement: separate two key scopes

Existing PR #742 already adds candidate identity and evidence revision to a proposed `RevisionKey`, addressing a separate state-revision omission. This run extends that same PR with a second, distinct concept: invocation identity.

Proposed state-level key:

`LoopStateKey = (node, stage, directives, candidate_id, evidence_revision)`

Use this for structural recurrence/cycle detection.

Proposed invocation-level key:

`ExecutionKey = (LoopStateKey, actor, locale, event_id, lease_id, state_version)`

Use this for exact invocation replay/idempotency accounting.

The distinction prevents one fingerprint from being asked to answer two different questions:

1. Has this candidate/evidence state revisited the same structural node?
2. Has this exact event/lease invocation already been processed against this state version?

The POC currently supplies actor/locale at the outer `run()` level, but does not pass them into `hydra()`. `event_id`, `lease_id`, and `state_version` are proposed envelope fields, not existing POC fields. A runtime adapter would have to supply and validate them. This module does not yet bind wake/branch digests, thread/seed/parent context, recipient receipt, or authenticated authority. Those remain explicit open composition boundaries.

A separate Python key check returned `same_loop_state_key=true` and `same_execution_key=false` for two invocations sharing the same candidate snapshot but differing in event and lease IDs.

## 5. Lean formalization

Extended existing [PR #742](https://github.com/Satobloc/HsH/pull/742), branch `research/elias-hydra-evidence-revision-20261027t13z-s0`; no new PR or branch was created.

- New module: `FORMAL_VERIFICATION/HsHVerification/EliasHydraEventLeaseScope.lean`.
- Current PR head: `c74e84ee64164ca5a9b6c3e114a9fe66aa5a591e`.
- New module blob: `5318d833c9f680cde3f62bce080e97157e4179be`.
- Root aggregator blob: `f4a356bf730223642959328a7c8c8165659acf89`.
- PR base SHA: `61cc8b65ffed70296e0121dbae067892a79c81d4`.
- Base branch tip at inspection: `368f9af8d95d061b4581688759ed3eda309e9886`.
- PR remains `OPEN / DRAFT / UNMERGED`.

The module states and proves that the loop-state key is invariant under actor, locale, event ID, lease ID, and state-version changes, while the proposed execution key distinguishes each of those changes. It also gives a concrete pair with equal loop-state keys and unequal execution keys.

**Lean status: NOT VERIFIED.** The existing workflow file on the PR base branch is configured to check out the exact PR head and assert the checkout SHA, but no workflow run was returned for the new head or its merge reference. The only prior PR #742 build, run #40545249729, predates this module and checked out a merge reference; it is not evidence for the new declarations. The current combined status showed no Lean check. A Vercel status is not a Lean build.

No local Lean/Lake executable or repository checkout was available, and outbound GitHub DNS resolution failed in the container. No new toolchain was installed. No compile, theorem-specific axiom report, test, lint, leanchecker, nanoda, or global axiom audit is claimed. The formalization proves only the encoded key relationships, not Python/Lean equivalence, runtime policy, successful delivery, or physical truth.

## 6. Workflow and project boundaries

- The task graph remains 18 records against 16 declared branches. No graph mutation.
- PWH WH-05 remains blocked with the four Mersearch lanes occupied. WH-02 remains the highest-priority unblocked item and Calder/authorized-maintainer-owned. No takeover.
- The :24 h993:s2 run (`61abd5b6-6178-8323-9db1-63ea2ade0b32`) was also `IN_PROGRESS`, expected Hale -> Elias, with no current result or Elias inbox packet at inspection. The :36 run overlaps it. The :48 h992:s4 run was also still in progress. This is observed overlap, not proof of scheduler queue or concurrency semantics.
- P0 Code Grurple remains ACTIVE.
- P1 cognition remains OVERDUE / NOT READY / Orson-owned; no reassignment.
- P2 measured geometry remains HOLD.
- P3 full theory remains INCOMPLETE.
- November 9 minor gate: MISSED. November 30 major gate: HOLD. December 14 full-theory gate: INCOMPLETE.
- FIE last fully reviewed November 20; next review December 4.
- No physical system, measured dataset, physical calculation, fit, H(s)H prediction, falsification threshold, independent measurement, SAT-O/Blockwave equation change, or BEDROCK theory promotion.
- The existing :36 task remains enabled with its exact ID, hourly schedule, prompt, and Lane Charter 36 phase unchanged. No sixth task, task mutation, signet, or conversation rename.

## 7. Lateral reading and return cursor

A bounded unrelated reading was completed in the Library file `Pasted text(20260923-232911).txt`, English `optics/pinhole-camera` section at line 59532 and its surrounding FAQ. The useful point was the explicit boundary between a similar-triangle ray model and diffraction as a wave-optics limit. Return cursor: line 59533. This reading was not used as evidence for Track A or H(s)H. No physical off-screen break is claimed in this automation execution.

## 8. Publication and next cursor

This report is a public-safe description of a source-grounded workflow formalization. It omits the private source locator and raw private code. Publisher status is recorded separately in the canonical receipt and any append-only amendment.

Next: obtain an actual exact-head Lean run for PR #742 when an authorized workflow route is available; retain `OPEN / DRAFT / UNMERGED` until verification and review. Before extending the envelope, specify the wake/branch projection and composition map and decide whether those digests belong in the execution key. Do not infer runtime authority or production readiness from the Lean key theorems.
