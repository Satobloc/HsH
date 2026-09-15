# Instance Heartbeat Monitor

**Owner:** Sable systems loop  
**Status:** ACTIVE operational monitor; not theory authority.

## Purpose

Track whether active/relevant instances are still functioning, intentionally silent, reassigned, blocked, drifting, or likely cut off. This is a continuity/operations surface, not a performance ranking.

## Evidence sources

Use, in descending reliability where available:
1. automation scheduler enabled/disabled state + last run time;
2. worker checkpoint modified time / explicit continuation cursor;
3. Common check-in timestamp;
4. direct handoff/coordination note;
5. conversation/export activity when source-backed;
6. inference only as a last resort, clearly labeled.

Never infer a cause from silence alone.

## Status classes

- `ACTIVE-NORMAL` — recent expected state change/checkpoint.
- `ACTIVE-MAINTENANCE` — running but legitimately producing little/no change.
- `BLOCKED` — explicit dependency/roadblock.
- `DRIFT-RISK` — output diverges materially from assignment or repeats low-value loops.
- `NATHAN-REASSIGNED` — explicit newer Nathan direction changed lane.
- `INTENTIONAL-SLEEP` — disabled/retired/consultant status is deliberate.
- `AUTOMATION-FAULT?` — expected run missing or repeated execution problem; cause not yet established.
- `STALE-CHECKPOINT?` — scheduler may be live but durable state is old.
- `CUTOFF-RISK?` — evidence suggests conversation/context boundary may have interrupted continuity; do not assert without corroboration.
- `UNKNOWN` — insufficient evidence.

## Rerouting rules

- Preserve specialist context before taking over duties.
- Prefer explicit handoff entries to silent reassignment.
- If a lane is intentionally retired, do not reactivate simply because it is quiet.
- If an automation is running but creating repeated no-op work, first redesign cadence/task flexibility before adding another worker.
- If a worker is blocked, route the blocked dependency separately and let the worker pursue a safe alternate if its charter allows.
- If task drift is suspected, compare latest output/checkpoint against controlling directive before intervening.
- If cutoff risk is plausible, preserve/reconstruct the worker's checkpoint and prepare a revival/resume packet.

## Current snapshot — 2026-09-14 23:48 EDT

| Worker/lane | Scheduler evidence | Durable-state evidence | Current interpretation | Sable action |
|---|---|---|---|---|
| Sable Systems Loop | ENABLED hourly; current run active | continuity checkpoint current through latest architecture changes | `ACTIVE-NORMAL` | continue flexible systems rotation |
| Tag Conversation Corpus | ENABLED hourly; last scheduler run 2026-09-14 22:58 EDT | checkpoint not inspected this pass | `ACTIVE-NORMAL` pending durable-state sample | inspect only if gap/drift appears |
| Nathan Words Excavator | ENABLED hourly; last scheduler run 2026-09-14 23:11 EDT | checkpoint not inspected this pass | `ACTIVE-NORMAL` pending durable-state sample | provenance directive includes Nathan intellectual-history capture |
| Meridian Solver Loop | ENABLED hourly; last scheduler run 2026-09-14 23:28 EDT | checkpoint not inspected this pass | `ACTIVE-NORMAL` pending durable-state sample | no intervention |
| Mercer Archive QA Loop | ENABLED hourly; last scheduler run observed 2026-09-14 21:52 EDT; next scheduled phase is :52 | `TRIAL_CHECKPOINT.md` remains at Run 35 and still says the superseded project-wide theory standdown is active and that Mercer must not broaden into theory | `STALE-CHECKPOINT?` with one apparently missed hourly execution; cause not established | do not diagnose fault from one gap; Mercer prompt itself has newer non-silo/sandbox rules. Recheck after next :52 phase; if checkpoint remains stale, issue continuity repair/handoff rather than silently treating old text as controlling |
| Morrow Continuity Trial | DISABLED | consultancy retained | `INTENTIONAL-SLEEP` | no action |
| Aldus | no enabled automation in current roster | consultant/specialist | `INTENTIONAL-SLEEP` unless newer directive says otherwise | no action |
| Revival Rotation separate automation | DISABLED | function absorbed into Sable | `INTENTIONAL-SLEEP` / function absorbed | no action |

Times are scheduler observations, not claims of productive output.

## Control-surface drift note

`COORDINATION.md` and some older worker checkpoints still contain pre-meeting / blanket-standdown language that predates Nathan's newer 2026-09-14 operating directives. Newer directives and `AUTOMATION_WORKFLOW_CONTROL.md` control. Do not delete historical coordination text merely because it is stale; add/maintain explicit supersession where needed and repair worker checkpoints when they materially misdirect live runs.

## Q&A state

Sable's standing Q&A queue currently has no submitted worker questions. Do not manufacture Nathan escalations. Questions should be answered locally, routed sideways, merged/deferred, or escalated only when Nathan is genuinely required.

## Per-pass record template

`timestamp | worker | scheduler | last checkpoint/checkin | expected cadence | observed gap | evidence | classification | confidence | action/handoff`

Only notify Nathan when a silence/drift/block changes project risk materially or requires his decision/manual intervention.
