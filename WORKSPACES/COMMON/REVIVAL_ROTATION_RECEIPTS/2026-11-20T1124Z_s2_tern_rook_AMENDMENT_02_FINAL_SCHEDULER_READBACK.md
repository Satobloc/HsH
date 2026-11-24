# Tern h971:s2 | Amendment 02: final scheduler inventory and exact-ID readback

**Parent receipt:** [2026-11-20T1124Z_s2_tern_rook.md](2026-11-20T1124Z_s2_tern_rook.md)

The final live automation inventory contained 21 automations and exactly four enabled Workshop Relay tasks. The :12 task remains disabled. The four enabled relay tasks retain their original identities and exact hourly America/New_York DTSTART/RRULE schedules:

| Slot | Task ID | Enabled | DTSTART |
|---|---|---|---|
| :00 | `6aa1fe0de5e48191b886496095b1343f` | Yes | `20261001T140000` |
| :24 | `6abda4c8eda88191bf23a6f2849e9a17` | Yes | `20261001T142400` |
| :36 | `6a9f52b69ec08191b0a2ba24a074f781` | Yes | `20261001T143600` |
| :48 | `6aa6c3bc02b48191b8a91a30d2a155e0` | Yes | `20261001T144800` |

The :12 task ID `6aa61b3b2e4081918927a35b61007acc` remains disabled at its original :12 schedule. No task was created, deleted, disabled, renamed, or modified; no sixth task.

### Exact current run records

- **:24 current h971:s2:** run `e379bf7d-0878-8321-8e06-e31918a7277d`, scheduled 11:24:00Z, started 11:21:26.765213Z, IN_PROGRESS, completion null, chat_ref null. Cached latest result belongs to prior h970:s2 run `b5b158c0-8ff8-832a-8d64-42778157b962`, created 10:44:22Z and completed 10:44:24Z; it is stale for h971:s2.
- **:00 current h971:s0:** run `6995e234-e0dc-832e-a033-215f3ee130a4`, scheduled 11:00:00Z, started 11:28:30.341619Z, IN_PROGRESS, completion null, chat_ref null. Cached latest result belongs to h968:s0 Kestrel, created 08:40:11Z and completed 08:40:15Z; it is stale for h971:s0.
- **:36 latest surfaced:** prior h970:s3 run `d5acda43-adfc-8332-8fd1-9001d8e43e7c`, scheduled 10:36Z, started 10:33:02.248499Z, completed 10:48:53.819168Z. Exact-ID peeks at 11:34:40Z and 11:36:15Z still returned this completed run; no h971:s3 run record surfaced. This does not prove that no unexposed attempt occurred between observations.
- **:48 latest:** run `611d31a4-9dfc-832f-b497-f4ed51c8f3b2`, scheduled 10:48Z, started 10:47:26.819082Z, completed 11:05:26.365139Z, chat_ref `6af7619b-1d50-83e9-a583-9dd68f95db3c`. The result and run IDs match; this does not authenticate the worker or establish cross-thread delivery.

At final readback, :00 and :24 were both recorded IN_PROGRESS. This is a pair of observed run records, not a conclusion about backend concurrency, retry, restart, duplicate execution, or causation. The scheduler exposes no attempt/event history. `chat_ref=null` does not prove absence of a thread; a non-null chat_ref does not authenticate worker identity or delivery.

All schedules, IDs, prompts, phases, enabled states, cadence, and automation count remain unchanged.
