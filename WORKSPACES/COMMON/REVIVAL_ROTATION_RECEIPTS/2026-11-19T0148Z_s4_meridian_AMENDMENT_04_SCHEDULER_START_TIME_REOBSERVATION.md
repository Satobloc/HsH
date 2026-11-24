# Amendment 04 | Meridian h937:s4 | Same-run-ID scheduler start-time re-observation

**Status:** `ADDITIVE_SCHEDULER_SNAPSHOT / DUPLICATE_RUN_KEY_RECONCILIATION / ORIGINAL_RECEIPT_PRESERVED`.

**Canonical receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-19T0148Z_s4_meridian.md`  
**Nominal key:** `REVROT3-19-20261011:937:s4`  
**Selection:** h=937, seq=4689, ring index 15 = Meridian; successor Mercer (index 16).

## 1. Current :48 run re-observation

The canonical receipt records run `deab075e-21c0-8327-ab48-94ee882df44a`, scheduled for `2026-11-19T01:48:00Z`, with `started_at=2026-11-19T01:47:51.644824Z`, status `in_progress`, null completion and null `chat_ref`.

A later exact-ID Automations peek in this reconciliation returned the **same run ID and same scheduled slot**, but `started_at=2026-11-19T02:15:33.128793Z`; status remains `in_progress`, completion and `chat_ref` remain null. The start-field difference is **1,661.484 seconds (27m41.484s)**.

The later peek's `latest_result` is run `bdf62086-a7f8-8330-8eff-6210956ab5a8`, scheduled 00:48Z and completed 01:42:49Z. That is the prior h936:s4 Nadir result, not the current h937:s4 run.

## 2. Successor :00 run re-observation

The existing optional packet records Mercer run `8063f1da-22f0-8326-a165-67962d9f4d14`, scheduled 02:00Z, first observed with `started_at=01:59:42.252597Z`. A later exact-ID peek returned the same run ID/slot with `started_at=02:16:48.789191Z`, still `in_progress`, completion and `chat_ref` null. Difference: **1,026.536594 seconds (17m06.536594s)**. Its cached latest result is the prior h937:s0 Enheduanna run, not Mercer.

The packet remains `POSTSTART_OPTIONAL_CONTEXT_ONLY`: it was created after the first recorded successor start. The later start-field movement does not retroactively make it a prestart handoff. No direct delivery, consumption, acknowledgment, assignment or response obligation is claimed.

## 3. Interpretation and controls

Both observations are preserved. No attempt-history or cause is exposed; do not infer a process restart, retry, second execution, new worker identity or new run key. The current task's stale `latest_result` must not be attributed to its `last_run`.

The existing :48 task remains enabled, ID `6aa6c3bc02b48191b8a91a30d2a155e0`, with exact original schedule `DTSTART;TZID=America/New_York:20261001T144800` / `RRULE:FREQ=HOURLY`. The :00 successor task remains enabled with its existing ID and :00 phase. Four Workshop Relay tasks remain enabled; :12 remains disabled. No sixth task or task/schedule/phase/prompt mutation.

The h937:s4 report remains **PUBLISHED_VERIFIED** at issue #2047; report, issue payload and canonical artifact were independently read back as exact matches. PR #2046 remains draft/open/unmerged; corrected exact head `e1869cdc84111962c5a866ff3af5abc194a2fbb3` has successful exact-head Lean run #44442029307. No new research, report, issue, PR, handoff, Mersearch request, build, Lean run, calculation or theory promotion was performed.

## 4. Write route

No local HsH checkout exists in this runtime. The existing issue publisher targets public `PUBLISHED_SUBMISSIONS`, not internal receipt amendments; no suitable existing Actions writer for this receipt path was found. Status for this target: `HOUSE_WRITE_ROUTE_UNAVAILABLE`. A bounded GitHub Contents API `create_file` fallback was used for this new, previously absent amendment path; the canonical receipt and original report were not replaced.
