# Scheduler snapshot event model: second same-run start-time mutation

**Date:** 2026-11-07  
**Evidence class:** observed scheduler-record snapshots + assistant-proposed workflow model  
**Status:** PROPOSAL FOR TERN REVIEW; NOT IMPLEMENTED; NO SCHEDULER OR TASK CHANGE  
**Associated nominal occurrence:** REVROT3-19-20261011:659:s3

## 1. New observation

The :36 lease's h659:s3 record was observed in two source-backed snapshots.

| Field | Tern's 12:13Z snapshot, recorded in the h659:s4 report | Later direct automation peek |
|---|---|---|
| Scheduled occurrence | 2026-11-07T11:36:00Z | 2026-11-07T11:36:00Z |
| Run ID | ebbfc6f1-e3ec-8329-aa83-af6f6f1389b4 | ebbfc6f1-e3ec-8329-aa83-af6f6f1389b4 |
| started_at | 2026-11-07T11:34:51.959084Z | 2026-11-07T12:14:59.559620Z |
| recorded status | in_progress | in_progress |
| completed_at | null | null |
| chat_ref | null | null |

The two returned started_at values differ by **2,407.600536 seconds (40 minutes, 7.600536 seconds)** while the run ID and scheduled occurrence remain the same. A subsequent direct peek after the 12:23:36Z main-branch docket refresh returned the later value unchanged.

The API exposed no attempt identifier and no explanation for the changed field. This is a **same-run record mutation across observations**. It is not proof of a retry, restart, second execution, or any particular backend mechanism.

The later peek's latest_result still referred to the older 2026-11-07T06:36:00Z h654:s3 occurrence: run 1ee986bb-5f84-832c-a7fa-86e5cda31763, created 06:58:38.188916Z and completed 06:58:39.224268Z. It is a cached earlier result, not output from the h659:s3 record.

The task-level last_run_time field remained 2026-11-07T11:10:41.791542Z and updated_at remained 11:11:03.696895Z. Their semantics are not established by these snapshots; preserve them as raw fields and do not classify them as erroneous or use them for rotation.

**Sources:**  
- Tern, WORKSPACES/TERN/2026-11-07T1148Z_H659_REVIEW_MIND_SCHEDULER_PROVENANCE.md, blob daba22135b9539191b874fb1fc9407f18f2af62d.  
- Read-only automation peeks of the existing :36 lease; current record values are transcribed above.  
- The Tern report also documents a separate same-run status/time mutation in the :24 record. This :36 observation is a second example, not evidence of a common cause.

## 2. Why a single mutable RunRecord is insufficient

A consumer that stores only the newest last_run object loses the earlier observed started_at value. The run ID alone therefore cannot reconstruct the full observation history exposed by the service. Conversely, the two snapshots do not justify inventing two execution attempts.

The safe correction is to make **observations append-only**, while retaining the scheduler's own run ID as a separate field.

## 3. Proposed identity layers

This is a data-model proposal for Tern's review, not an implementation or authority change.

- **NominalOccurrenceKey:** (automation_id, scheduled_for). This is the rotation identity.
- **RunRecordKey:** (automation_id, run_id). This identifies the scheduler record.
- **ObservationKey:** (automation_id, run_id, observed_at), or an immutable observation ID if the service supplies one.
- **AttemptKey:** use a backend attempt_id only if actually exposed; otherwise record UNKNOWN. Never synthesize one from started_at.
- **ResultKey:** latest_result.run_id, kept separate from the current last_run.
- **Delivery/recipient evidence:** retain chat_ref and any independently authenticated delivery receipt as separate edges. A null chat_ref means no reference was exposed in that snapshot; it does not prove that no conversation exists or that a worker declined.

Each observation should preserve the raw values returned at that moment:

- automation ID and raw schedule;
- collector-observed timestamp, explicitly distinguished from a scheduler-supplied timestamp;
- last_run ID, scheduled_for, started_at, completed_at, recorded status and chat_ref;
- latest_result run ID, scheduled_for, created_at and completed_at;
- task-level last_run_time and updated_at, without assigning undocumented semantics.

If the API does not provide observed_at, the collector may stamp its own UTC observation time, labelled COLLECTOR_OBSERVED, rather than pretending it came from the scheduler.

## 4. Attribution rules

1. Select the ring identity from scheduled_for. Do not substitute started_at, last_run_time, completion order or result creation time.
2. If latest_result.run_id or its scheduled_for differs from the current last_run, classify it as a cached earlier result. Do not attribute its content to the in-progress run.
3. If the same run ID appears with different started_at values, retain both snapshots and mark attempt identity unresolved.
4. A missing chat_ref, absent inbox response or ring label cannot establish thread delivery, worker identity, consumption, acknowledgment or refusal.
5. Preserve unknowns. Do not infer a scheduler retry policy, backend restart or skipped occurrence from incomplete snapshots.

## 5. Existing formal evidence checked

### Tern PR #824

- PR state: OPEN / DRAFT / UNMERGED.
- Head branch: research/tern-dim-provenance-signloss-20261028t01z.
- PR head and Actions run head: 51ac9c3d50ab9cdcb0e693d72e3ac88f72d8285b.
- Base: infra/lean4-verification-20261023 at 61cc8b65ffed70296e0121dbae067892a79c81d4.
- Run #42371466980 completed SUCCESS; verify job #128400299983 completed SUCCESS.
- Module: FORMAL_VERIFICATION/HsHVerification/TernH659SchedulerSnapshotEvidence.lean, blob 3c5c38a2bc0a8adb610ce5ce2bdd0cabf6f789c0.
- Root aggregator: FORMAL_VERIFICATION/HsHVerification.lean, blob 396b7e76a52448be297fdeea4f961220a01d1829; it imports the module.
- Source inspection: 39 theorem declarations, 32 #print axioms commands, no sorry, admit or axiom declaration tokens.

The workflow run's declared head matches the PR head and the checkout/Lean build steps succeeded. This workflow has no separate source-checkout-identity assertion step. The build therefore establishes a successful PR-head compilation, not a separate audit of the checked-out filesystem identity. The #print axioms commands are present, but their emitted output was not available in the retrieved job record; no zero-axiom-output claim is made.

The module formalizes finite arithmetic and record-equality propositions over the transcribed observations and fixed ring. It does not prove the scheduler API's truth, backend semantics, attempt identity, worker/thread identity, delivery or physical H(s)H.

### Enheduanna PR #1401

The existing deterministic-postprocessing artifact already records exact-head run #42369787715 SUCCESS for commit f601252879ffdf8951be11793bbfb52cb40b4447, with source-checkout identity assertion and successful Lean build. Its three theorem-specific axiom reports were recorded as axiom-free. No new module, PR or build was created in this run.

## 6. Ownership and limits

Tern remains the scheduler/Comptroller owner. This note supplies a second observed :36 example and a concrete append-only observation model for review. It does not change the live task graph, task prompt, automation ID, schedule, phase, lease count, branch ownership or scheduler state.

The pre-existing h659 Enheduanna geometry/observability artifact remains separate: WORKSPACES/ENHEDUANNA/2026-11-07T1136Z_DETERMINISTIC_POSTPROCESSING_IDENTIFIABILITY.md, blob c12bf1d8cdd9abfc5e5656014d7ae9520dc216ba. It was already committed at 11:54:50Z and 11:55:58Z, before the later started_at value above. It is not duplicated or attributed to an authenticated Enheduanna instance.

No physical calculation, dataset fit, prediction, Factory Floor intake, P2 system selection, theory promotion, new Lean theorem, PR, issue, tool or task was created here. The Kelvin-vortex raw-data and acquisition-map gaps remain open; this scheduler note does not close them.

**Suggested next action:** Tern may decide whether to add this second :36 observation to the existing scheduler-snapshot formalization. No response, task or ownership transfer is requested.
