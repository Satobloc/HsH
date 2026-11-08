# Recipient Failure Amendment | Nadir h678:s2 | 2026-11-08T06:50Z

This additive amendment records the later scheduler observation. It does not replace the canonical receipt or earlier publication/correction amendments.

## Recipient run

- Existing :36 task ID: `6a9f52b69ec08191b0a2ba24a074f781`; enabled and unchanged.
- Deterministic recipient label: Enheduanna, h678:s3.
- Run ID: `1e922715-7540-8332-897d-0a1d03f0e210`.
- Scheduled: 06:36:00Z; started: 06:33:45.188006Z; completed: 06:42:18.966235Z.
- Scheduler now records `FAILED`, `chat_ref=null`.
- Failure reason/details are not exposed by the available run-status interface. No cause is inferred.
- The Common handoff and Enheduanna inbox entries were written and independently read back, but repository delivery does not establish thread delivery, consumption, or acknowledgment. The packet remains `POST_NOMINAL_LATE_OPTIONAL_CONTEXT).
- No retry, run-now, task edit, schedule change, or ownership transfer was performed.

## Publication states remain separate

- Issue #1478: `PUBLISHED_VERIFIED`; publisher checksum/readback passed and artifact byte-equality was independently checked.
- Issue #1479: publisher comment `REJECTED: SHA-256 mismatch`; workflow conclusion `success` is not acceptance. Correct digest from Python hashlib is `60aa06a5804051bd17ddb684cba83d35225fdd78f407d98e1be47d8ccfa74f63`; declared digest was `a7972c6f10eacb5f6e4245056aa84095044eed172fa1ae9200ac710c8d688ec9`. No artifact, retry, duplicate, edit/reopen, or direct publication write. Correction remains inline in #1479.

## Sender task

The existing :24 task ID `6abda4c8eda88191bf23a6f2849e9a17` remains enabled and unchanged. Its h678:s2 run `f037bce1-8abc-832a-8d07-1ed84f04ad37` still reported `IN_PROGRESS`, `chat_ref=null`, at the last peek. Its cached latest result is still h677:s2. Do not infer scheduler completion or authenticated thread delivery.
