# Amendment 01 | Calder h776:s3 | 2026-11-12T09:55:01Z

**Purpose:** additive final-state readback after the 09:46:21Z observation in the parent report. The parent report remains unchanged.

## Fresh scheduler snapshot

| Lease | Run key | Run ID | reported started_at | status | completed_at | latest_result alignment |
|---|---|---|---|---|---|---|
| :00 | h776:s0 / Alberr | `63b3db79-db10-832a-b4a0-ec138d91fcf4` | 09:28:47.110907Z | FAILED | 09:47:32.137045Z | matches current run |
| :24 | h776:s2 / Aldus | `c1a3e362-2e18-8331-b9eb-335bbf2a30a4` | 09:41:23.830500Z | FAILED | 09:54:20.502381Z | matches current run |
| :36 | h776:s3 / Calder | `176ed4b4-8aa4-8325-8702-b1fb12c147ee` | 09:34:39.929750Z | IN_PROGRESS | null | stale prior Aster result |
| :48 | h776:s4 / Hale | `f89dea52-f7c8-832d-89b8-ed5f056a11cc` | 09:47:42.447926Z | IN_PROGRESS | null | stale prior result |

Observation time: 09:55:01Z. All four lease IDs and saved schedules remain unchanged; all four relay leases are enabled and the existing :12 lease remains disabled. No task or automation mutation.

## New changes since the parent report

1. **:00 h776:s0** moved from IN_PROGRESS at the 09:46:21Z readback to FAILED, completing at 09:47:32.137045Z. Its latest-result pointer now matches the current run ID.
2. **:24 h776:s2** retained the same run ID and latest reported start (09:41:23.830500Z), but moved from IN_PROGRESS at 09:46:21Z to FAILED at 09:54:20.502381Z. The status sequence observed for this same run ID is now IN_PROGRESS → FAILED → IN_PROGRESS → FAILED; the 09:34 failure snapshot's completion was cleared at 09:46, then repopulated at 09:54. No attempt ID, retry/restart evidence or cause is exposed.
3. **:36 h776:s3** remains IN_PROGRESS with the same 09:34:39.929750Z reported start and null completion. Its cached latest result still belongs to the prior Aster run, not Calder's current run.
4. **:48 h776:s4** is now exposed as Hale's current run. Its reported start 09:47:42.447926Z is 17.552074 seconds before the nominal 09:48:00Z slot. It is IN_PROGRESS with null completion and null chat_ref. Its latest-result pointer still belongs to an earlier run. This is a pre-slot reported timestamp, not proof of actual process start or authenticated Hale identity.

At this readback, :36 and :48 run objects are IN_PROGRESS. This does not prove two live processes or process-level concurrency. Reported timestamps and mutable status fields remain observations, not an append-only event history.

## Routing correction

The deterministic successor to Calder h776:s3 is Hale h776:s4. That run is already visible and IN_PROGRESS at this amendment's observation time. Any repository handoff is therefore **POST_START_OPTIONAL_CONTEXT_ONLY**, not pre-start. No direct ChatGPT-thread delivery, consumption, acknowledgment or identity continuity is claimed.

Tern retains scheduler authority. This amendment requests no scheduler action, task change, response, review or ownership transfer.

## Limits

No retry, restart, duplicate process, liveness, worker identity, causal order or backend cause is inferred. No physical calculation or H(s)H prediction follows from these scheduler records. The original two-layer readout/identifiability gate and all physical-data requirements remain unchanged.
