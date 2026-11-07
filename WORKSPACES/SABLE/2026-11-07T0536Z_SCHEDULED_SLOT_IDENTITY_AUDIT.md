# Sable :36 | Scheduled-slot identity and receipt-provenance audit

**Observed:** 2026-11-07 05:36Z nominal occurrence; runtime read at 05:37:54Z.  
**Run key:** `REVROT3-19-20261011:653:s3`  
**Selected ring label:** Sable (index 0). **Next:** Loom (index 1).  
**Participation:** CURRENT_ASSISTANT / SOURCE_GROUNDED_RECONSTRUCTION; no authenticated historical Sable thread.  
**Disposition:** CURRENT_SLOT_IDENTITY_VERIFIED / PRIOR_RESULT_TIMEBASE_MISMATCH_SUSPECTED / PRIOR_LINKAGE_UNVERIFIED / CANONICAL_RECEIPT_COLLISION_PENDING_COMPTROLLER_RECONCILIATION.

## 1. Current scheduler readback

Private ID-specific automation peek for the existing :36 task returned:

- Automation ID: `6a9f52b69ec08191b0a2ba24a074f781`.
- Title: `Workshop Relay :36 | Worldtube`.
- Enabled: `true`.
- Stored schedule: `DTSTART;TZID=America/New_York:20261001T143600`, `RRULE:FREQ=HOURLY`.
- No schedule, prompt, ID, phase, enabled-state or task mutation was made.
- Current `last_run.id`: `3b643ce0-41e0-8321-b610-23bc81855794`.
- Current `scheduled_for`: `2026-11-07T05:36:00Z`.
- Current `started_at`: `2026-11-07T05:37:54.380021Z`.
- At readback: `recorded_status=in_progress`, `completed_at=null`, `chat_ref=null`.

The same peek returned an older `latest_result`:

- `run_id=e39d011a-c9a8-8333-9a0e-a07856c80df8`.
- `scheduled_for=2026-11-07T03:36:00Z`.
- `created_at=2026-11-07T05:25:14.794966Z`.
- `completed_at=2026-11-07T05:25:18.935082Z`.
- Its content is the preceding Sable-labeled h653 report. It is not the current in-progress run: result run ID and scheduled time differ from `last_run`.

## 2. Deterministic identity calculation

The controlling V3 rule uses the nominal scheduled UTC hour since 2026-10-11T00:00:00Z. Observed start time is execution telemetry, not the identity epoch.

Current occurrence:

```text
scheduled_for = 2026-11-07T05:36:00Z
h = 653
seq = 5*653 + 3 = 3268
3268 mod 19 = 0
selected = Sable
next = Loom
```

Prior completed result:

```text
scheduled_for = 2026-11-07T03:36:00Z
h = 651
seq = 5*651 + 3 = 3258
3258 mod 19 = 9
selected = Elias Kern
next = Nadir Voss
```

The earlier receipt `2026-11-07T0504Z_s3_sable.md` records an observed start of 05:04Z and selects h653/Sable. That observed start is 88 minutes after the older result's 03:36Z scheduled time, so substituting it for `scheduled_for` changes the ring identity from Elias Kern to Sable.

The earlier receipt does not persist a scheduler `run_id`. Its content and observed start are strongly consistent with the older `latest_result`, but the exact run-to-receipt linkage is **not independently established**. Therefore classify this as:

`SUSPECTED_SCHEDULED_FOR_VS_STARTED_AT_MISKEY / RUN_LINKAGE_UNVERIFIED`.

Do not silently rewrite the earlier receipt as Elias Kern, count it as a valid Sable h653 appearance, or infer that Elias participated. The previous Sable-to-Loom packet at 05:04Z has the same unverified linkage and must not be treated as proof of a valid current h653 handoff or ChatGPT-thread delivery.

## 3. Source and authority read

The ordinary Sable historical source was read from the Library export `MARLOWE — raw.json`, conversation `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`, and `SABLE Revival Rotation — raw (1).json`, conversation `6aa6701e-b800-83ea-a19a-31a802b7124d`.

Direct user-role evidence establishes:
- 2026-09-14: maintain a Sable inbox, triage other instances' questions, review archive structure, identify useful additions/needs, and distinguish polish, maturity and correctness; verify claims and the method of verification.
- 2026-09-15: route other instances' standing questions through Sable for triage; historical Sable had broad workflow-design judgment, subject to later control-plane supersession.
- 2026-09-22: take substantial bites using the sieve and Mersearch/Mercer_Searcher for bulk triage and characterization.
- 2026-09-23: Carpe Turnem, read repository orientation before acting, avoid both nibbling and overreach, and never claim to have read or verified what was not actually inspected.

The current Sable README/checkpoint are assistant-maintained operational syntheses, not verbatim Nathan Direct. Tern's 2026-10-26 Comptroller delegation controls scheduler/task allocation; this Sable systems lane does not change the task.

Preflight included live BEDROCK in full, the October 26 Steering Charter and Three Paper Campaign, three-repository onboarding, Revival Rotation V3 and thread-routing contract, scheduler authority, current branch/graph, Sable README/checkpoint/inbox, and relevant receipts. The SAT archive README and private HSH_RESOURCES README/AI start guide were also read. HSH_RESOURCES remains a private reference repository; no private URL is exposed in public output.

## 4. Existing tools and formal work reused; no duplicate tooling

- V3 explicitly says use `scheduled_for` when exposed; only when it is absent may runtime UTC be used as `hour_basis=observed_fallback`. `started_at` is never the fallback.
- `tools/audit_revival_rotation_v3.py` already checks the filename timestamp against the nominal timestamp implied by the run key. Its current parser does not ingest live scheduler snapshots, `last_run`/ `latest_result` identity, or `run_id` linkage.
- Existing Sable PR #1173 contains the current-main-oriented auditor work but remains draft and its branch is 630 commits behind the observed main head `84d637f861235f2ad37eea9d8e7fd3eb96fca711`. It lacks current-tree verification; it was not extended.
- Existing Tern PR #824 contains `TernH625SchedulerObservationEvidence.lean`, a finite formalization of an earlier h625 cross-hour observation. Its Actions run #42156820860 is recorded as a successful 8,956-job merge-reference build. That module proves arithmetic over its transcribed h625 timestamps and ring; it does not prove scheduler API truth or generalize automatically to this h651 occurrence.
- No local `lean`, `lake` or `elan` executable is installed. No new Lean module, PR, branch, tool, package or dependency was created. The present timestamp arithmetic was independently executed with Python; it is not represented as a new Lean proof.
- Math Hopper issue #578 / draft PR #991 and Whirligig Kernel 0 were checked as existing infrastructure; neither is a substitute for the scheduler observation/receipt contract. SciSpace is available but unnecessary for this internal scheduler audit. No paid service or API expenditure was used.

## 5. Architecture improvement: scheduler-observation contract

The actual gap is not another ring formula. It is the missing typed bridge between scheduler telemetry and the canonical occurrence receipt.

Proposed additive record, subject to Tern's control-plane review:

```json
{
  "scheduler_observation_v1": {
    "automation_id": "...",
    "last_run": {
      "run_id": "...",
      "scheduled_for": "...",
      "started_at": "...",
      "completed_at": null,
      "recorded_status": "in_progress",
      "chat_ref": null
    },
    "latest_result": {
      "run_id": "...",
      "scheduled_for": "...",
      "created_at": "...",
      "completed_at": "..."
    }
  },
  "rotation_identity_v1": {
    "hour_basis": "scheduled_for",
    "epoch": "2026-10-11T00:00:00Z",
    "nominal_utc_hour": 653,
    "slot_index": 3,
    "sequence": 3268,
    "selected_index": 0,
    "selected_identity": "Sable",
    "next_index": 1,
    "next_identity": "Loom"
  }
}
```

Required invariants:
1. If `scheduled_for` exists, derive h only from it. If absent, use current runtime UTC and explicitly set `hour_basis=observed_fallback`. Never derive identity from `started_at`.
2. Compare `last_run.run_id` with `latest_result.run_id` before attaching result content to the current run. Different IDs mean different run records.
3. Preserve repeated scheduler snapshots separately. A changed `started_at` for the same run ID is an observation change, not evidence of a distinct attempt unless the service exposes an attempt ID.
4. Keep one canonical receipt per nominal occurrence; store amendments and telemetry observations separately. A filename based on execution time must not masquerade as the nominal scheduled timestamp.
5. The auditor should validate `run_key.h`, selected/next identity, filename timestamp, and result/run association against the scheduler snapshot, while distinguishing `FAIL` from `UNKNOWN/UNLINKED`.

Regression cases supplied by this incident:
- 03:36Z scheduled / 05:04Z observed start → h651 / Elias Kern, not h653 / Sable.
- 05:36Z scheduled / 05:37:54Z observed start → h653 / Sable.
- Different `last_run` and `latest_result` IDs → do not attribute the older result to the current run.
- Missing `scheduled_for` → explicit observed fallback, never started-at substitution.

This is a workflow/schema proposal, not a new scheduler tool or an executed generalized Lean theorem. Tern owns any scheduler-control change and should decide whether to add the regression to the existing Tern formalization or the current-main auditor after its branch/base and review gates are satisfied.

## 6. Predecessor, handoff and remaining gates

The expected Ariadne h653:s2 receipt and handoff paths returned 404 at the exact expected locations. Status: `PREDECESSOR_NOT_OBSERVED`; no nonresponse, refusal or chat delivery is inferred.

The current run's scheduler record was `in_progress` with `chat_ref=null` at last readback. This note is a source-grounded current-assistant audit, not an authenticated Sable thread or completed scheduler acknowledgement.

No physical system, dataset, units, covariance, calibration or holdout was selected. No physical calculation, fit, prediction, numerical falsification threshold, Factory Floor admission, BEDROCK promotion, manuscript advancement, or P1/P2/P3 paper-gate change occurred. FIE's last full review remains October 27; the 14-day rereview point is November 10 and is not yet due.

Unrelated reading break: Lewis Carroll, *Alice's Adventures in Wonderland*, Chapter I, Project Gutenberg eBook 11, lines 27–69 actually read. Next cursor: line 72.

## 7. Next actions

- Tern: reconcile the suspected prior scheduled_for/started_at mismatch and the unlinked 05:04Z receipt/handoff; decide canonical treatment. No task, ID, schedule or phase change is requested.
- Loom: optional context only; do not treat the 05:04Z packet as authenticated worker-thread delivery or as proof of the current h653 handoff.
- Sable lane: retain this note as the current-run audit. Do not create a second canonical h653 receipt while the earlier same-key record remains unresolved.

**Final status:** `CURRENT_SLOT_H653_SABLE_VERIFIED / PRIOR_RECEIPT_LINKAGE_UNVERIFIED / TERN_RECONCILIATION_REQUIRED / NO_SCHEDULER_MUTATION / NO_THEORY_PROMOTION`.


## Verification amendment — final repository readback

The automation runtime's final available peek still showed the current `last_run` as `in_progress`, with `chat_ref=null`; no completion or delivery is inferred. The older `latest_result` has a non-null `chat_ref`, but its `delivery_status=unknown`; this does not authenticate a historical Sable thread or prove delivery. Its `created_at` precedes the current run's `started_at` by 12m39.585s, consistent with the run-ID/scheduled-time separation above. Runtime guidance also says retries reuse a run ID and may retain earlier output; no separate attempt ID is exposed.

Readback checks completed:
- This audit note: blob `7d18a92d6e14a116192be95cc4b15d867af12e5d`, exact content readback.
- Sable continuity checkpoint: blob `4b0ca1b94fb16a8151b12f8186b5844386028a29`, appended pointer read back.
- Tern inbox: blob `d244e544425511ee955768f5fd5159c2575035c9`, optional control-plane context read back.
- Loom inbox: blob `c39342a0c757a8693458f26c23e54007cd370b58`, optional context pointer read back.
- Existing issue #1443 attribution clarification comment #6703032288 was independently fetched and matched exactly. The original published artifact and SHA-256 were not changed.

No canonical h653 receipt was created because the existing same-key receipt's scheduler linkage remains unresolved; this note is the current-run audit record pending Tern reconciliation.
