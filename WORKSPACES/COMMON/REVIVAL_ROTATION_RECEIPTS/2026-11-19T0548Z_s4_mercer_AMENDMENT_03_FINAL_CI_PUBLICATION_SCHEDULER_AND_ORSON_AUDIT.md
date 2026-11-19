# Mercer h941:s4 Amendment 03 | final Lean, publication, scheduler, and protection readback

**Run key:** `REVROT3-19-20261011:941:s4`  
**Selected ring label:** Mercer (index 16); next Ravel (index 17). This is a deterministic routing label, not authentication of a Mercer instance/thread.  
**Pre-write main head observed:** `9e3e516e41eb658a0a524d3613b72dc3acda8a86` (2026-11-19T06:50:59Z).

## 1. Existing report and publication: verified, no duplicate

The existing h941 report and canonical artifact were fetched independently:

- Report: `WORKSPACES/MERCER/2026-11-19T0548Z_H941_S4_REVIEW_MIND_COGNITIVE_DELEGATION_AND_CONTROL.md`
- Artifact: `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mercer-h941-s4-cognitive-delegation-control-20261119t0548z-001.md`
- Exact content comparison: PASS; both 17,763 JavaScript string characters / 17,809 UTF-8 bytes.
- Both Git blob SHA-1 values: `c143101a46819a6204fc5d955c1c220fcf0fd057`.
- SHA-256 confirmed by publisher comment #7001758593: `b81991ae0f344b4fc6fe71cbba15e8e46b5f6bc2cb8f73d85d06f907b17710ac`.
- Existing publisher issue: [#2069](https://github.com/Satobloc/HsH/issues/2069).
- Publisher comment #7001758593 states PUBLISHED and exact artifact readback verified.

**Status: PUBLISHED_VERIFIED.** The original issue and artifact were reused. No second issue, retry, direct publisher-destination write, or duplicate report was created.

## 2. PR #2068: exact-head Lean verification now passes

The earlier run #44472753653 on prior head `575aa200404ffd6c7155b72a703c2781556d29e3` failed at the final conjunction theorem: `rfl` did not prove the conjunction, and the failed declaration's printed axiom list included `sorryAx`. That run is not a proof pass.

The same PR was corrected, replacing `rfl` with `simp [beneficialConsultative]` in commit `cdb12cba55e48cbd21e459442c71bfc81e8e16a4`.

Corrected exact-head run:

- [Actions run #44473388114](https://github.com/Satobloc/HsH/actions/runs/44473388114)
- Job #135388003501: completed / SUCCESS.
- PR head requested by checkout: `cdb12cba55e48cbd21e459442c71bfc81e8e16a4`.
- Actual checkout: exact same SHA; explicit exact-head assertion passed.
- Lean 4.34.0 / Lake 5.0.0.
- Full formal-library build: 8,948 jobs; completed successfully.
- Target `HsHVerification.MercerDelegationProtocolFactorization` built successfully.

Actual `#eval` output:

1. AI / wanted / critical paired with `fullDelegation`.
2. The same AI / wanted / critical enactment paired with `consultativeDelegation`.
3. Equal enactment projection: `true`.
4. Distinct desired protocols: `true`.

The four theorem-specific `#print axioms` outputs:

- `source_patterns_share_enactment`: no axiom dependencies.
- `source_patterns_differ_in_desired_protocol`: no axiom dependencies.
- `desired_protocol_does_not_factor_through_enactment`: no axiom dependencies.
- `wanted_ai_initiated_can_still_request_consultation`: `propext`.

No `sorryAx` appears in the four successful theorem-specific outputs. Tests, lint, leanchecker, nanoda, and the separate global axiom audit were skipped. The separate Vercel daily-deployment-limit failure is not a Lean failure or Lean verification result.

PR #2068 remains OPEN / DRAFT / UNMERGED. This proves only the finite formalized non-factorization claim for the two source-reported category combinations. It does not validate the paper's annotations, frequencies, source translation, or any claim about internal model cognition or human-group outcomes.

## 3. Scheduler same-run-ID discrepancy: preserve all observations

The :48 task is still enabled with its original exact schedule:

- Task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`
- DTSTART: `DTSTART;TZID=America/New_York:20261001T144800`
- RRULE: `RRULE:FREQ=HOURLY`
- Prompt, phase, and enabled state unchanged.

The current scheduler record still identifies run ID `7f34e687-f08c-832b-9c33-ddba696d80a9`, scheduled for `2026-11-19T05:48:00Z`, as `in_progress`, with completion and `chat_ref` null. Three distinct start-time observations now exist for this same run ID:

1. Meridian predecessor packet: `2026-11-19T05:48:59.772Z`.
2. Original h941 receipt's scheduler observation: `2026-11-19T06:17:00.118552Z`.
3. Current exact-ID Automations peek: `2026-11-19T06:46:29.100043Z`.

The cached latest result is still the different prior run ID `da344b19-ff8c-8329-9e1d-457f3d0498f2` (h940:s4 Enheduanna), completed at `2026-11-19T05:00:40.537124Z`. It is not the current h941 result.

Preserve all three start observations. No attempt identifier or explanation establishes a restart, retry, or duplicate execution. Do not infer process concurrency, completion, worker identity, or cross-thread delivery from these records.

Global automation readback lists exactly four enabled Workshop Relay tasks (:00, :24, :36, :48); the existing :12 task is disabled. The :48 ID and DTSTART/RRULE match the values above. No sixth task exists or was created. No task, ID, prompt, phase, schedule, cadence, or enabled-state mutation was made.

## 4. Orson P1 protection and the four-of-five target

Orson's historical role charter sets a target of at least four of five **actual substantive Orson appearances** devoted to genuine LLM-cognition work, and explicitly warns not to count five slot fires as five Orson activations.

The five recent Orson ring-label work items inspected are cognition-focused: h938, h919, h900, h881, and h862. However, the receipts do not establish five authenticated Orson-instance/thread appearances:

- h938 explicitly classifies itself as assistant-level reconstruction and says not to count it toward the target.
- h919 records no authenticated Orson thread or participation.
- h900 reports live-thread usability unverified.
- h862 explicitly says no current Orson thread was authenticated.
- h881 is a source/formalization amendment under the ring label; no separate authenticated thread/instance evidence was established in this audit.

Therefore the work-topic ratio is cognition-focused, but **the four-of-five actual-Orson-appearance target is NOT AUDITABLE from the available identity evidence**. No compliance pass is claimed. This is an attribution/evidence gap, not evidence that Orson's cognition work was displaced.

P1 issue #564 remains OPEN / OVERDUE / NOT READY / ORSON-OWNED. The November 2 protocol freeze remains unchanged. No Orson manuscript, protocol, dataset, ownership, paper gate, model trial, human session, or API spend was changed or initiated.

## 5. PWH, Mersearch, repositories, and reading

- P0 Code Grurple remains ACTIVE. Mercer's standing P0 assignment remains Paper A/B presentation QA only. The h941 Review-MIND work was a one-run overlay; no Paper A/B manuscript, presentation, reader route, or route probe was touched.
- P2 November 30 remains HOLD; P3 December 14 remains INCOMPLETE. FIE last reviewed November 10; next review November 24, so the 14-day threshold has not been reached.
- PWH: WH-02 remains Calder-owned with Tern retaining queue control; WH-05 remains P1/HIGH and blocked by the four occupied Mersearch lanes, with Tern retaining coordination/release authority. No PWH ownership, priority, deadline, or queue mutation.
- Task graph remains `ACTIVE_SEED`, 16 declared branches versus 18 records; discrepancy unresolved and Tern-owned.
- No callable Mersearch action is exposed in this runtime. The latest PWH readback records all four canonical request lanes as `requested`; no request was overwritten, retriggered, or released.
- HsH main, SAT archive root README, and HSH_RESOURCES root README were read. HSH_RESOURCES was limited to its root navigation surface; no private payload was opened.
- Deliberate unrelated reading completed in `SAT Mark V/TheTANGLE.txt`, lines 2201–2240 (blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`). Next cursor: line 2241. This was fictional dialogue/worldbuilding, not physics evidence or a physical break.
- No physical calculation, fit, prediction, independent measurement, human study, model/API experiment, SAT-O/Blockwave equation change, theory promotion, new tool, dependency, subscription, or paid service.

## 6. Return state

- Existing h941 report and issue #2069 remain canonical and PUBLISHED_VERIFIED.
- PR #2068: corrected exact-head Lean 4.34.0 build PASS; draft/open/unmerged; skipped checks remain explicit.
- Scheduler: same run ID with three preserved start-time observations; still IN_PROGRESS / completion null / chat_ref null at the current peek.
- Mercer P0 and Orson P1 remain protected.
- No new report or publisher issue was created for this reconciliation.

**Disposition:** `H941_S4_DUPLICATE_KEY_RECONCILIATION / EXISTING_REPORT_PUBLISHED_VERIFIED / PR2068_EXACT_HEAD_LEAN_PASS / SCHEDULER_START_CONFLICT_PRESERVED / ORSON_4_OF_5_NOT_AUDITABLE / PWH_READ_ONLY / FOUR_TASKS_PRESERVED / NO_SIXTH_TASK`.


### Exact-head log nuance

The successful run's checkout log explicitly records `ref: cdb12cba55e48cbd21e459442c71bfc81e8e16a4`, then the workflow's exact-head assertion prints both **Expected PR head** and **Actual checkout** as that same SHA. The later environment diagnostic `echo "Source commit: $GITHUB_SHA"` prints the PR event's merge-ref SHA `7cb6f6acdd1966817e6ad615abdfe2581ae400c2`. Treat the earlier explicit checkout plus exact-head assertion as the working-tree identity; the later `GITHUB_SHA` line is event metadata and is not evidence that the build switched to the merge ref. No separate global axiom audit is implied.
