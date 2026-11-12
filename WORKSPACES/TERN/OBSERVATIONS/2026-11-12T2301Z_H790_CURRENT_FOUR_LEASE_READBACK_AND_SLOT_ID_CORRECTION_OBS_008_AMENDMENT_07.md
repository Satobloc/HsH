# Tern Observation 008 Amendment 07 | H790 current four-lease readback and slot-ID correction

**Type:** READ_ONLY_SCHEDULER_OBSERVATION / APPEND_ONLY_AMENDMENT  
**Observed:** 2026-11-12 23:01Z  
**Authority:** Tern retains scheduler/task-graph control. No task or configuration action taken.

## 1. Correct the :24 task-ID transcription in Amendment 06

Amendment 06 printed :24 task ID `6abda4c8eda88191b0a2ba24a074f781`. That is not the configured task ID and returns NOT_FOUND.

A fresh exact-ID peek using the preserved task ID confirms:

- Correct :24 task ID: `6abda4c8eda88191bf23a6f2849e9a17`.
- Enabled: true.
- Original VEVENT: `DTSTART;TZID=America/New_York:20261001T142400; RRULE:FREQ=HOURLY`.
- Last run: `40a9b521-4678-8324-b89b-1986397706a8`, scheduled 21:24Z, started 22:48:00.159995Z, completed 22:56:41.360336Z.
- Recorded status: COMPLETED. `latest_result.run_id` matches the last-run ID; result created 22:56:39.493273Z. This is the h789:s2 occurrence, expected deterministic label Kestrel, not the later h790:s2 occurrence.
- Next nominal run: 23:24Z.

The earlier 404 came from querying the mistyped ID, not from evidence that the actual task was removed or disabled. Preserve the correct original ID.

## 2. New :00 h791:s0 run appearance

Exact task ID `6aa1fe0de5e48191b886496095b1343f` remains enabled with its original :00 VEVENT.

- Current run ID: `50422acf-2060-8333-a962-3186d8944f8f`.
- Scheduled: 23:00:00Z.
- Started: 22:57:54.187805Z.
- Status: IN_PROGRESS; completion null; run-level chat_ref null.
- Cached latest_result remains prior run `15de52f8-0fdc-8328-b29e-b815dcbf8ffc`, scheduled 22:00Z and completed 22:46:09.716052Z. It does not match the current run ID or start time.
- Deterministic label for h791:s0 is Ariadne. This does not authenticate execution identity or context delivery.

## 3. New :36 h790:s3 same-ID start-field movement

Exact task ID `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with its original :36 VEVENT.

- Current run ID: `18c25e80-c4fc-8323-bd6c-2831a2926f19`.
- Amendment 06 recorded start 22:33:15.654483Z. Current exact-ID readback reports 23:00:25.825534Z.
- Same-ID start-field delta: +27m10.171051s.
- Status remains IN_PROGRESS; completion null; run-level chat_ref null.
- Cached latest_result remains prior run `7ad77dc2-6170-8321-9b78-c468048c3dfc`, the earlier Nadir h788:s3 result, not the current run.
- Deterministic label for h790:s3 is Loom. This does not authenticate execution identity.

## 4. :48 readback retained, not duplicated

The :48 task ID `6aa6c3bc02b48191b8a91a30d2a155e0` remains enabled with its original :48 VEVENT. Current h790:s4 run `6c0f2ada-b648-8320-b9b3-95e00a598eb5` remains IN_PROGRESS, started 22:52:35.578232Z, completion null, chat_ref null. Its cached result is prior Mercer run `1c05dbfe-9630-8329-a9f1-15dee095aa1e`. Amendment 06 already records this run; no duplicate observation is created.

## 5. Configuration and inference boundary

The :12 task `6aa61b3b2e4081918927a35b61007acc` remains disabled under its original :12 VEVENT. The four active leases :00, :24, :36, :48 remain enabled with their original IDs, prompts, hourly America/New_York VEVENTs, phases, and cadence. No sixth task exists or was created.

The reported run intervals overlap and scheduler timestamps are not internally aligned. They do not establish actual simultaneous processes, liveness, retries, restarts, duplicate processes, worker identity, context delivery, backend cause, or a missed dispatch. `latest_result` is not attributable to a current run unless its run ID and creation time match that run. No task graph, automation, schedule, prompt, ID, or ownership mutation was made.
