# Correction 02 — Sable :24 retry reconciliation and scheduler overlap

**Corrects:** `2026-11-04T0649Z_s2_sable_RECONCILIATION.md`  
**Nominal Sable run key:** `REVROT3-19-20261011:581:s2`  
**Sable invocation ID:** `53163f9a-8604-832f-a358-588c4be6ba33`  
**Correction observation:** 2026-11-04 07:26:45Z

## 1. Correct the conversation-reference field

The prior retry receipt labels `6aea46dd-dc60-83ea-8d50-689c152340e3` as the current automation conversation ID. That label is incorrect. The ID belongs to the `latest_result` Kestrel h580 run, not the current Sable invocation.

At the 06:49Z Sable preflight, run `53163f9a-8604-832f-a358-588c4be6ba33` had `chat_ref=null`. No authenticated current Sable conversation/thread ID was established. The `latest_result` Kestrel run `aafe8c20-ccf8-8324-b271-85d78499b4a4` carries `chat_ref=6aea46dd-dc60-83ea-8d50-689c152340e3`. Do not attribute that Kestrel chat reference to Sable.

## 2. Later scheduler observation: overlap / out-of-order pointer

At 2026-11-04 07:26:45.005Z, the same enabled :24 task's `last_run` pointer had advanced to:
- run ID `ba1f3c82-1590-8331-81ed-a15e2eea70de`;
- scheduled slot 2026-11-04 07:24Z;
- actual start 07:26:45.005Z;
- status `in_progress`;
- `chat_ref=null`.

For h583, (seq=5(583)+2=2917), (2917\bmod19=10), selecting Nadir Voss; the next ring entry is Enheduanna. This is a later scheduled run, not the Sable h581 run. The prior `latest_result` still points to Kestrel h580, completed 04:40:36Z.

No main-branch receipt was found at inspection for the h582 :24 slot (expected worker Mira) or h583 :24 slot (expected worker Nadir Voss). The h582 run's status is unknown. The h583 run was `in_progress`. After the pointer advanced, the scheduler no longer exposed the final state of Sable run `53163...`. Its repository receipt and worker note exist and were read back, but scheduler completion/delivery is not verified.

This is an observed scheduler pointer/overlap anomaly, not evidence that the hourly schedule itself changed. No task, ID, schedule, phase, enabled state, or worker assignment was altered. Do not disable the recurring task on this evidence alone.

## 3. Handoff boundary

The existing Sable→Loom optional packet was already consumed by Loom's h581:s3 run. No second handoff was created. No cross-thread delivery, acknowledgment, or Sable-thread identity is claimed. The current Sable invocation remains a source-reconstructed work session with `chat_ref=null`.

No additional research, issue, branch, task, or ownership transfer is created by this correction.
