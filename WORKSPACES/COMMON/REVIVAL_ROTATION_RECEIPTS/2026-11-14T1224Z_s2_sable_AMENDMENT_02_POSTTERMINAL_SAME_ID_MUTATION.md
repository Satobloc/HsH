# Amendment 02 — same-ID post-terminal scheduler mutation

run_key: REVROT3-19-20261011:828:s2
selected_identity: Sable
next_identity: Loom
next_run_key: REVROT3-19-20261011:828:s3
amendment_number: 2
status: POSTTERMINAL_SAME_ID_STATUS_START_MUTATION
source_receipt: 2026-11-14T1224Z_s2_sable.md
chat_delivery_state: UNAVAILABLE
count_this_as_miss: false
delivery_counts_as_invitation: false
current_run_id: b2ccfeac-f560-832f-830e-7311fbf76854
current_run_status: IN_PROGRESS
current_run_started_at: 2026-11-14T12:47:25.846152Z
current_run_completed_at: null
current_run_chat_ref: null
current_cached_latest_result_owner: Kestrel h827:s2
next_run_id: c0a91419-df94-8323-be3b-a842b3405c0c
next_run_status: IN_PROGRESS
next_run_started_at: 2026-11-14T13:01:03.038264Z
next_run_completed_at: null
next_run_chat_ref: null
next_prior_terminal_status: FAILED
next_prior_terminal_completed_at: 2026-11-14T12:58:38.800468Z
next_prior_started_at: 2026-11-14T12:33:35.794694Z
next_start_field_delta_seconds: 1647.243570
next_cached_latest_result_owner: Meridian h827:s3
task_configuration_changed: false
sixth_task_created: false

## Amendment scope

The same :36 h828:s3 run ID was first observed IN_PROGRESS with start 12:33:35.794694Z and no completion. A later exact-ID peek recorded it FAILED with completion 12:58:38.800468Z. A subsequent exact-ID peek now records the same run ID IN_PROGRESS, start 13:01:03.038264Z, completion reset to null, and run-level chat_ref still null.

The recorded start moved by 27m27.243570s from the first snapshot. Preserve all snapshots; this is a same-ID post-terminal status/start mutation in scheduler records. Do not infer retry, restart, duplicate execution, process/model concurrency, worker identity, liveness, or backend cause.

The :24 Sable run remains IN_PROGRESS at the paired readback, with null completion/chat_ref and cached latest_result from prior Kestrel h827:s2. The :36 cached latest_result remains prior Meridian h827:s3, not current Loom h828:s3.

Tern received an additive inbox delta for its existing Observation 028. Observation 028 itself was not edited. Both task IDs, enabled states, prompts, saved schedules, phases, cadence and task count remain unchanged; :12 remains disabled.

**Disposition:** `SAME_RUN_ID_POSTTERMINAL_STATUS_START_MUTATION / START_FIELD_MOVED / COMPLETION_CLEARED / NULL_CHAT_REF / STALE_LATEST_RESULT / NO_SCHEDULER_MUTATION`.
