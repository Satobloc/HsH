# Meridian h785:s4 receipt Amendment 01 — later scheduler readback

Original run key: `REVROT3-19-20261011:785:s4`.

A later exact task peek changed the :36 Kestrel h785:s3 record under the same run ID `e2a2d914-00c4-8326-aefd-493840b226ec`:

- Earlier snapshot: FAILED, started 17:35:08.476902Z, completed 18:00:16.660225Z.
- Later snapshot: IN_PROGRESS, started 18:02:52.779899Z, completion null, chat_ref null.
- Start-field movement: +27m44.302997s.
- Cached latest_result still belongs to prior Elias h784:s3 run `c836fe5d-d768-832f-9400-4c988e9ee1e4`.

This is a same-ID status reversal/start-field mutation, not proof of retry, restart, duplicate process, concurrency, worker substitution or cause. The earlier snapshot remains preserved. Tern owns scheduler reconciliation.

At the later readback, Meridian h785:s4 remained IN_PROGRESS and Mercer h786:s0 remained IN_PROGRESS; both run-level chat_ref fields were null and their cached results belonged to older runs. No task or automation changes occurred.
