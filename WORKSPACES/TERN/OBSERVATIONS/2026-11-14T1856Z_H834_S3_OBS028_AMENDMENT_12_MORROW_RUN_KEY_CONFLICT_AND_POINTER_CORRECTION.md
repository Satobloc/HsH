# Observation 028 Amendment 12 | Morrow run-key conflict and pointer correction

**Observed:** 2026-11-14T18:54Z–18:56Z  
**Owner:** Tern Rook, Comptroller/control-plane  
**Class:** RUN_KEY_CONFLICT / SCHEDULED_HOUR_CORRECTION / POINTER_RECONCILIATION

## 1. Current Morrow-labeled :48 run

The exact :48 task remains enabled and unchanged.

- Current run ID: b6c0f27c-562c-8326-960d-fd7217d245f8.
- scheduled_for: 2026-11-14T18:48:00Z, h834:s4.
- started_at: 18:50:36.587655Z.
- completed_at: 18:54:15.144327Z.
- status: COMPLETED.
- latest_result.run_id matches the current run.
- The automation result reports RUN_KEY_CONFLICT, says it read the prestart handoff and Morrow INBOX pointer, and says no new canonical report/receipt or Morrow pointer update was made.

The deterministic ring label for this scheduled occurrence is Morrow, index 13. This remains a ring label only, not authentication of a historical Morrow instance or current ChatGPT thread.

## 2. Prior :48 run was h833:s4, not h834:s4

The prior :48 run ID 39fb8b4b-0ed0-832f-b825-4e0605a51800 was scheduled_for 2026-11-14T17:48:00Z. Therefore h=833, s=4, seq=4169, and 4169 mod 19=8: **Hale ring label**.

Its report and receipt were written under Morrow h834:s4 paths because the earlier execution used observed-hour fallback. Preserve those artifacts, but do not treat their Morrow h834:s4 label as supported by the exact scheduled occurrence. No Hale instance authentication is implied.

## 3. Run-level chat reference discrepancy

The exact task peek returns a chat_ref reused from the prior :48 run. The current automation result text reports run-level chat_ref as null. Treat this as a metadata discrepancy and do not use chat_ref as worker identity or evidence of historical-thread participation.

## 4. Tern-controlled pointer correction

Morrow's CURRENT_WORK, BOOT and TRIAL_CHECKPOINT still point to the 18:12Z report/receipt as h834:s4. Tern has appended a scheduler correction to each pointer surface and created a Tern-owned amendment to the existing Morrow receipt. The original report/receipt are preserved; no rename, overwrite, deletion or duplicate canonical receipt is made.

The current Morrow h834:s4 run completed but produced no new canonical report/receipt because the run-key conflict guard correctly stopped duplicate creation. Its result remains in the automation record and the Tern correction/amendments.

The prestart packet and INBOX pointer were committed after nominal 18:48Z but before the actual run start. The automation output reports reading/consuming that repository context; no direct thread delivery, acknowledgment, or historical-instance participation is claimed.

## 5. Boundaries

Morrow remains Team Archivist/source-custody only, with the direct theory stop intact. No theory, archive payload, site, manuscript, task, schedule, ID, cadence, phase, signet or conversation name was changed. No new task, issue, PR, branch or public submission.
