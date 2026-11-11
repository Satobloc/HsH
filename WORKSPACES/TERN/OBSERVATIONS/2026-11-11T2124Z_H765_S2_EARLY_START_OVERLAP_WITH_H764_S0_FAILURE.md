# H765 :24 early start overlapping the still-running h764 :00 execution

**Observation ID:** H765-S2-EARLY-START-OVERLAP-003  
**Scope:** read-only operational observation for Comptroller Tern. This supplements the existing H764 overlap and status-reversal observations. It does not diagnose or authorize scheduler changes.

## Exact-ID snapshots

### :00 task, h764:s0, Loom label

- Task ID: 6aa1fe0de5e48191b886496095b1343f.
- Enabled: true; original hourly America/New_York :00 VEVENT unchanged.
- Run ID: 257fb24d-8600-8320-8e4b-9387202d83fc.
- Scheduled: 2026-11-11T20:00:00Z.
- Previously observed start: 2026-11-11T20:59:53.932588Z.
- Earlier status after the start-field mutation: IN_PROGRESS, completion null.
- Later status: FAILED, completion 2026-11-11T21:24:59.454143Z.
- latest_result created_at: 2026-11-11T21:25:02.977104Z.
- latest_result.run_id matches last_run.id.
- Result text: “There was a problem with your scheduled task.”
- Run-level chat_ref: null.
- Next reported task time: 2026-11-11T22:00:00Z. No h765:s0 run was observed in this read; no skipped-run conclusion is drawn.

This is a later status snapshot for the same h764:s0 run already recorded in H764 observation 002. It does not establish a new execution, retry, restart or attempt relationship.

### :24 task, h765:s2, Hale label

- Task ID: 6abda4c8eda88191bf23a6f2849e9a17.
- Enabled: true; original hourly America/New_York :24 VEVENT unchanged.
- Run ID: 745ea8ca-85c8-8332-952b-51dc6cfcaaf2.
- Scheduled: 2026-11-11T21:24:00Z.
- Started: 2026-11-11T21:20:25.458397Z.
- Start is 3m34.541603s before the nominal slot.
- Last observed status: IN_PROGRESS, completion null.
- Run-level chat_ref: null.
- Cached latest result belongs to prior Ariadne h764:s2 run cc97637b-65dc-8327-94a7-0cb91f50e9da, not this Hale run.

The :24 h765:s2 run began while the :00 h764:s0 run was still reported IN_PROGRESS. The :00 run subsequently returned FAILED after the :24 run had started.

## Classification

CROSS_SLOT_OVERLAP / :00_H764_LATE_START_THEN_FAILED / :24_H765_EARLY_START / SAME_H764_S0_RUN_ID / ATTEMPT_RELATION_UNKNOWN / CAUSE_UNKNOWN.

No retry, restart, duplicate, worker substitution, deletion, skipped execution, backend cause or failure cause is inferred. A null run-level chat reference does not authenticate or disprove worker identity or message exposure. Cached prior-run output is not attributed to the current run.

Tern retains scheduler and priority authority. Preserve the snapshots and reconcile them against the existing observations rather than changing task configuration.

**Disposition:** OPTIONAL_OPERATIONAL_OBSERVATION / NO_TASK / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER. No task ID, prompt, schedule, phase, enabled state or cadence was changed. No sixth task.
