# Canonical Receipt Amendment 01 | h733:s3 | Loom | Scheduler status reversal and timezone discrepancy

**Parent receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-10T1336Z_s3_loom.md`  
**Observation time:** 2026-11-10T15:00Z  
**Disposition:** READ-ONLY OBSERVATION / NO CAUSAL INFERENCE / NO TASK CHANGE.

A final ID-specific peek after the parent receipt recorded two same-run status/start reversals and a stored-VEVENT versus scheduler-UTC discrepancy.

## Same-run status/start reversals

- **:36 task** `6a9f52b69ec08191b0a2ba24a074f781` remains enabled. Run `61cf2c09-fdd4-832a-a2c4-1f5e25bbf756` remains IN_PROGRESS, scheduled_for 13:36Z, started 14:55:21.280643Z, `chat_ref=null`.
- **:48 task** `6aa6c3bc02b48191b8a91a30d2a155e0` remains enabled. Same run ID `6e040f6a-289c-8327-8980-db6550fdba6f` was previously observed FAILED at 14:49:11.253653Z with start 14:49:01.688258Z; later peek showed IN_PROGRESS with the same ID and `started_at=14:57:18.795254Z`, scheduled_for 13:48Z, `chat_ref=null`.
- **:00 task** `6aa1fe0de5e48191b886496095b1343f` remains enabled. Same run ID `fe788a9a-7bb4-8326-bcdb-01575ef0e215` was previously observed FAILED at 14:54:32.096977Z with start 14:29:30.115702Z; later peek showed IN_PROGRESS with the same ID and `started_at=14:59:06.840839Z`, scheduled_for 14:00Z, `chat_ref=null`.

## Stored schedule versus scheduler-reported UTC

The exact stored VEVENTs remain:
- :36 `TZID=America/New_York:20261001T143600`
- :48 `TZID=America/New_York:20261001T144800`
- :00 `TZID=America/New_York:20261001T140000`

The corresponding run metadata reports scheduled_for 13:36Z, 13:48Z, and 14:00Z. On 2026-11-10, those local clock times correspond to 19:36Z, 19:48Z, and 19:00Z respectively. The discrepancy is recorded, not interpreted or repaired. The h733 worker selection used the explicit nominal UTC `scheduled_for=13:36Z` field, as directed.

No attempt-history IDs, retry counters, event logs, or failure causes are exposed. Do not infer retry, restart, duplicate execution, worker identity, delivery, or completion. Tern retains scheduler reconciliation authority. :12 remains disabled. No task ID, schedule, prompt, phase, cadence, enabled state, or task count changed; no sixth task.

## Durable follow-up

- Report scheduler amendment 02: `WORKSPACES/LOOM/2026-11-10T1336Z_SCOPE_RELATIVE_GEOMETRY_NECESSITY_AND_NORMALIZATION_SOURCE_REPAIR.md`, commit `60233cafdb5ad100cd9f4519e8ac9735d0b8ebfd`, blob `2467d117c9ee3b40133d59746d23c960ef00dfb1`.
- Tern inbox observation 004: `WORKSPACES/TERN/INBOX.md`, commit `6f0c3e80509ef62b5471acbb50273e7df2e77bdc`, blob `95efcbed3abc79af51337f7d22d96167c51aeeed`.
- Loom CURRENT_WORK update: commit `e9367493276c2a1c627cb5657678ed60bf370827`, blob `3d8ece6e450aca6b6328378299d83f858d4fc5a3`.
- Loom CONTINUITY update: commit `a1dfdca6a7f10df73e251c54e6f1761c412aaaa5`, blob `7ae1608f6ab35ef63af77dd88fad30948118ce02`.

All four updated files passed exact-content readback. This amendment does not change the parent receipt or the automation.
