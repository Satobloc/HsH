# Receipt Amendment 02 | H955:s3 | Successor run-state reconciliation

At a later readback, the existing :48 task had advanced from the completed h954:s4 occurrence to a new h955:s4 occurrence:

- Current `last_run.id`: `2dc3c483-012c-8327-b057-827b0f5295de`.
- `scheduled_for`: `2026-11-19T19:48:00Z`.
- `started_at`: `2026-11-19T19:52:46.814755Z`.
- `recorded_status`: `in_progress`; `completed_at=null`; current-run `chat_ref=null`.
- `latest_result` still refers to the prior h954:s4 occurrence at `2026-11-19T18:48:00Z`, run `676809ee-cfe8-8330-a920-a4334940fb38`, with result-level `chat_ref` present.

This is a fifth live observation of the same field-separation hazard: the current run has no `chat_ref`, while its cached prior-occurrence result does. It is not evidence of Nadir identity, thread delivery, consumption, acknowledgement, or failure.

The optional Nadir packet and Common HANDOFFS pointer were created before this new run was visible, but after the nominal 19:48Z time. They are therefore `POSTNOMINAL_PREOBSERVED_START_OPTIONAL_CONTEXT_ONLY`. Nadir's large INBOX was not rewritten because there is no safe append route; the Common HANDOFFS index is the durable pointer.

The existing :36 run remained `in_progress` with null completion and null current-run `chat_ref`. Both tasks remained enabled with their original hourly schedules. No task mutation or duplicate handoff was made.
