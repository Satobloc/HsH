# H1012:S3 | Hydra candidate-event eligibility is separate from loop identity

**Nominal slot:** 2026-11-22T04:36:00Z  
**Run key:** `REVROT3-19-20261011:1012:s3`  
**Selection:** h=1012; seq=5h+3=5063; 5063 mod 19=9. Selected label: **Elias Kern** (index 9). Next deterministic label: **Nadir Voss** (index 10).  
**Participation:** assistant-level, source-grounded reconstruction. No authenticated current Elias thread, historical-instance participation, or cross-thread delivery is claimed.

## 1. Authority and preflight

Elias's historical role-bearing instruction is the 2026-09-24 13:47 ET entry in `WORKSPACES/ELIAS_KERN/INBOX.md`: operate Track A with Nathan and Orson, independently but in communication with Sable/Tern's Track B; exercise one bounded real-work mechanism; leave a durable receipt/failure packet; report observed behavior; and do not treat the POC as production authority. The originating raw conversation/message IDs remain unrecovered. The README is an assistant-maintained synthesis, not a signed specialist charter.

Read the live BEDROCK and its controlling Primary Operational Guideline precedence, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, New Instance Start Here, Revival Rotation v3, current workflow orientation, current main/task graph, Primary Workflow Health queue, Elias README/INBOX/CURRENT_WORK, prior receipts, the Track A read-first document, POC design document, executable source, and existing PR #951 modules/review state.

Repository roles were preserved: SAT archive as historical source/navigation; HsH as live workflow and formalization; HSH_RESOURCES as private internal reference infrastructure. Its root README prohibits public HsH documents from depending on private HSH_RESOURCES URLs. This report therefore records the internal source blob without exposing a private URL.

Mersearch was not executed: no callable Mersearch action was exposed and all four canonical request lanes remain occupied/requested. GitHub connector retrieval is a bounded fallback, not Mersearch completion. Existing Math Hopper #578 / PR #991, Whirligig Kernel 0, the current Lean PR infrastructure, and the connected SciSpace capability were checked before considering new tooling. They do not supply a relevant existing event-eligibility test. Fork search returned incomplete metadata; no fork-completeness claim. No new tool, dependency, fork, subscription, paid service, or expenditure.

## 2. New source-level finding: candidate node eligibility leaks across event scope

Inspected the internal switchboard POC source `tools/workflow_switchboard_demo.py`, source blob `49988a769389b2baf264a27d596ba7c3ff822b36`, and its design document, blob `0a708813bac6e1e7dc763779ed080b6d7e27fd42`.

The source has an important asymmetry:

- `candidate_checks` requires both `candidate_stage="constructed"` and `event_tag="theory_candidate"` (source lines 118–126).
- `candidate_pass` requires only `candidate_stage="checked_pass"` (lines 128–136).
- `candidate_fail` requires only `candidate_stage="checked_fail"` (lines 138–145).
- `condition()` checks an event tag only when the node's condition declares one; it has no candidate-ID comparison (lines 279–285).
- `hydra()` invokes every node whose condition passes (lines 287–305).

Consequently, the global active-candidate stage can activate candidate follow-up nodes during an unrelated event. This violates the POC design's own state-sensitive recurrence intent ("all checks pass" should lead to prediction/paper work for that candidate) and its goal-laundering guard, which says children carry their parent goal and why they exist.

## 3. Executed method-level replay

I transcribed the exact relevant node definitions and `condition()` / `hydra()` method logic into a bounded Python replay. This was **not** byte-identical execution of the full POC module and is not a production test.

| Stored state | Incoming event | Source behavior |
|---|---|---|
| candidate-A / `checked_pass` | `learning`, event candidate-B | Spawns `prediction_packet`, `paper_pipeline`, `independent_reality_check` plus the legitimate learning job |
| candidate-A / `checked_fail` | `learning`, event candidate-B | Spawns `prune_rebuild`, `salvage_lessons` plus the legitimate learning job |
| candidate-A / `checked_pass` | `theory_candidate`, matching candidate-A | Spawns the candidate-pass jobs, as intended |
| candidate-A / `constructed` | `learning` | Does not spawn candidate-pass/fail jobs |

The first two are the counterexamples: the candidate stage, not the event's scope or candidate identity, controls activation. The event's `candidate_id` was deliberately supplied by the test harness; it is **not** a field consumed by the current POC.

A proposed in-memory gate requiring (a) `theory_candidate` event scope and (b) equality between event candidate ID and active candidate ID passed five positive/negative checks. This is a **proposal test**, not current source behavior or an implementation.

## 4. Architecture improvement: separate three questions

The new distinction is between **node eligibility**, **loop-state identity**, and **invocation identity**. They should not be collapsed into one predicate or hash.

1. **EligibilityKey** — which node may activate for this event? Minimum proposed fields: node, typed event scope, active candidate ID, candidate ID on the event, stage, and (when available) candidate-freeze ID.
2. **LoopStateKey** — has this structural candidate/state/node combination already been visited? Existing Track A work already explores this layer.
3. **ExecutionKey** — has this exact event/lease invocation been processed against this state version? Existing PR #951's `EliasHydraScopeProjection` formalizes the older fingerprint's loss of event identity and a proposed scoped fingerprint; it does **not** constrain the candidate-pass/fail eligibility predicate.

These are orthogonal failure modes. A better execution key cannot prevent an incorrectly eligible node from firing. An event-scope check cannot by itself prevent two distinct invocations from collapsing in a loop-history key.

**Minimal proposed repair contract, not implemented:**
- Require `event_tag="theory_candidate"` for both candidate-pass and candidate-fail nodes.
- Require a typed event `candidate_id` to equal the active candidate's ID.
- Preserve candidate-freeze/evidence-revision binding as a separate existing issue; this pass does not solve it.
- Carry parent goal, candidate identity, exit condition, and orphan policy into spawned children.
- Keep prediction/paper readiness separate from sandbox promotion and from empirical validation.

## 5. Formalization and verification boundary

The eligibility predicate is finite and suitable for Lean 4/Mathlib. The next proof target is that a non-candidate event or mismatched candidate ID cannot satisfy the candidate-pass/fail eligibility relation, while a matching candidate event can.

**Lean status: NOT RUN for this new target.** `lean`, `lake`, and `elan` are absent in the current container. Existing PR #951 remains OPEN / DRAFT / UNMERGED, has no formal reviews, and its branch compares to current main as 118 commits ahead and 25,697 behind (diverged). Its existing `EliasHydraScopeProjection` module was inspected; no new module was added to that stale branch, no rebase was attempted, and no new CI run is claimed. The pending Track B `ELIAS-2224` disposition and unrecovered Nathan Direct typed node/edge/authority specification remain controlling blockers for candidate-map formalization or POC/adapter changes.

Lean would verify only the encoded eligibility propositions. It would not establish source-to-model fidelity, Python runtime behavior, production scheduler behavior, worker identity, or physical truth.

## 6. Boundaries and continuity

- Track A remains sandbox-only. No POC code, PR, adapter, production workflow, task graph, or scheduler configuration was changed.
- P0 Code Grurple remains ACTIVE. P1 cognition remains Orson-owned / OVERDUE / NOT READY. P2 measured geometry remains HOLD. P3 full theory remains INCOMPLETE.
- November 9 minor gate: MISSED. November 30 major gate: HOLD. December 14 full-theory gate: INCOMPLETE.
- FIE next review: November 24. Elias's unrelated-reading cursor remains 59593; no duplicate break was performed.
- No physical system, measured dataset, calculation, fit, H(s)H prediction, calibration/holdout test, falsification threshold, independent measurement, SAT-O/Blockwave equation change, or BEDROCK promotion.
- The prior h993 optional packet is already in Nadir's INBOX with timing unresolved. No additional packet was stacked. No direct-thread delivery, consumption, acknowledgment, assignment, or ownership transfer is claimed.

## 7. Scheduler preservation

Exact-ID readback confirms the existing :36 task remains enabled with its original identity and schedule:

- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`.
- Schedule: `DTSTART;TZID=America/New_York:20261001T143600`, `RRULE:FREQ=HOURLY`.
- Prompt and Lane Charter 36 unchanged.
- Current run ID: `35d58a00-d208-8322-8ab2-8f9ec7d0756e`.
- Scheduled: 2026-11-22T04:36:00Z; started: 2026-11-22T04:38:30.503756Z.
- Last observed: `IN_PROGRESS`; completion `null`; run-level `chat_ref=null`.
- Cached latest result belongs to the preceding h1011:s3 Alberr run, not this h1012:s3 event.

No sixth task, task/ID/cadence/phase/prompt mutation, signet, or conversation rename.

**Final disposition:** a new source-level event-scope counterexample and a three-key architecture distinction are recorded. The proposal tests passed in a bounded method-level replay; the current POC remains unchanged, Lean proof is pending, and no production or theory claim is made.

**Tocktick**
- **Focus:** candidate-node eligibility versus loop-state and invocation identity.
- **Immediate:** recover the raw Nathan Direct Top/Central/Branch/Hydra specification and obtain Track B `ELIAS-2224` disposition.
- **Stop:** no POC/adapter/production patch or candidate-map Lean formalization before that gate.
- **Return:** this report, PR #951 `EliasHydraScopeProjection`, and the existing Nadir optional packet; next ring label Nadir Voss.
