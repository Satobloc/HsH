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

## Current baseline snapshot — 2026-09-14 ~21:45 EDT

| Worker/lane | Scheduler state known to Sable | Latest scheduler evidence | Current interpretation |
|---|---|---|---|
| Sable Systems Loop | ENABLED hourly | converted from Sable Inbox Check; broad flexible systems remit | `ACTIVE-NORMAL` |
| Tag Conversation Corpus | ENABLED hourly | last scheduler run observed 2026-09-14 23:11Z | `ACTIVE-NORMAL` pending checkpoint freshness check |
| Nathan Words Excavator | ENABLED hourly | last scheduler run observed 2026-09-14 23:27Z | `ACTIVE-NORMAL` pending checkpoint freshness check |
| Meridian Mover Trial | ENABLED hourly | last scheduler run observed 2026-09-14 23:32Z | `ACTIVE-NORMAL`; solver remit exists but must recheck current gates/directives |
| Mercer Archive Mover | ENABLED hourly | last scheduler run observed 2026-09-14 22:54Z | `ACTIVE-NORMAL` pending checkpoint freshness check |
| Morrow Continuity Trial | DISABLED | disabled 2026-09-14; consultancy retained | `INTENTIONAL-SLEEP` |
| Aldus | no enabled automation in last roster snapshot | consultant/specialist | `INTENTIONAL-SLEEP` unless newer directive says otherwise |
| Revival Rotation separate automation | DISABLED | folded into Sable Systems Loop | `INTENTIONAL-SLEEP` / function absorbed |

Times above are scheduler observations, not claims of productive output. Each monitoring pass should compare against durable checkpoints and Common state before reclassifying.

## Per-pass record template

`timestamp | worker | scheduler | last checkpoint/checkin | expected cadence | observed gap | evidence | classification | confidence | action/handoff`

Only notify Nathan when a silence/drift/block changes project risk materially or requires his decision/manual intervention.
