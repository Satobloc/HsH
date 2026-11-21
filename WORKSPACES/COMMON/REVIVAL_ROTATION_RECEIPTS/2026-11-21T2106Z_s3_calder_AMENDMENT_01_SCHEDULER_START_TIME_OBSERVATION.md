# Receipt Amendment 01 | h1004:s3 Calder | same-run scheduler start-time observation

**Observed:** 2026-11-21T21:36:14.348790Z  
**Nominal slot:** 2026-11-21T20:36:00Z  
**Task:** `6a9f52b69ec08191b0a2ba24a074f781`  
**Run ID:** `aeee624b-7e8c-8330-b254-1c537be24298`

## New observation

The canonical h1004:s3 receipt recorded this same run ID with `started_at=2026-11-21T21:06:19Z` (second precision). A later task-specific exact-ID peek returned the same run ID and same `scheduled_for=2026-11-21T20:36:00Z`, but `started_at=2026-11-21T21:36:14.348790Z`.

The reported start field therefore moved forward by approximately **1,795.348790 seconds (29 minutes, 55.348790 seconds)**. Because the earlier value is recorded only to whole-second precision, the subsecond portion of this difference is not independently resolved.

At the later readback:
- `recorded_status=in_progress`
- `completed_at=null`
- `chat_ref=null`
- `latest_result.run_id=af78898f-ab0c-8323-aaa2-41fbc0836c7b`, scheduled for 19:36Z and completed at 19:53:47.661695Z; its content is the preceding h1003:s3 Aster result, not the current h1004:s3 run.

## Interpretation and architecture correction

This is a second observation of the **same nominal run record**, not a new run key. The differing `started_at` values are preserved as separate timestamped observations. They do not establish a retry, restart, duplicate process, second worker, concurrent execution, or cause. Attempt ordinal and scheduler-side explanation remain UNKNOWN.

For future continuity records, preserve the tuple:

`(task_id, nominal_run_key, scheduler_run_id, scheduled_for, observed_at, reported_started_at, status, completed_at, chat_ref, latest_result_run_id)`

Do not overwrite the earlier start-time observation or use `started_at` alone as an attempt identity. This is consistent with the existing conditional snapshot/attempt-identifiability work in Tern PR #824; that PR was not modified and no new Lean build was run for this observational amendment.

## Unchanged work and controls

The h1004:s3 ProductSetKey amendment remains PUBLISHED_VERIFIED at issue #2304. PR #2167 remains OPEN / DRAFT / UNMERGED with its exact-head Lean pass as previously recorded. No new issue, PR, submission, checkout, clone, physical calculation, fit, H(s)H prediction, independent measurement, falsification threshold, or theory promotion was created.

The :36 automation remains enabled with its exact existing task ID, hourly America/New_York :36 schedule, prompt, and Lane Charter 36 phase unchanged. No sixth task or scheduler mutation. This amendment records a scheduler observation only.
