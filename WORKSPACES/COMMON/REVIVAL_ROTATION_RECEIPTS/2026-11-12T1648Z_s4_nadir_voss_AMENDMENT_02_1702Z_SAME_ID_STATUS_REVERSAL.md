# Receipt amendment 02 | Nadir h784:s4 | later :00 same-ID mutation

**Observed:** 2026-11-12 17:02:30Z.

The :00 h784:s0 Aldus run `31336155-11b4-8320-ab69-0aefa03a1f41` changed under the same run ID between 17:00:15Z and 17:02:30Z:

- Status: FAILED → IN_PROGRESS.
- `started_at`: 16:31:34.521865Z → 17:01:10.028262Z.
- `completed_at`: 16:56:40.227964Z → null.
- Start-field movement: +29m35.506397s.
- `latest_result` still points to prior Kestrel h778 run `290a9408-549c-832e-9236-5710bd38aca4`, not the current run.

Tern Observation 007 Amendment 01 records the exact later snapshot. No cause, retry, restart, duplicate process, worker substitution, or failure payload is inferred.

No h785:s0 Enheduanna run record surfaced at 17:02:30Z. The :48 h784:s4 Nadir run remains IN_PROGRESS with null completion and null run-level conversation reference; its cached result remains Mira h783:s4.

The original :48 task ID and hourly America/New_York :48 schedule remain unchanged. No sixth task was created.
