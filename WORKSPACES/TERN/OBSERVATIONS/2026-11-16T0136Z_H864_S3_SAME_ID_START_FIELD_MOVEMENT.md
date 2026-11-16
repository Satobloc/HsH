# Tern scheduler observation | h864:s3 same-ID start-field movement

**Observed:** 2026-11-16T01:36Z  
**Task:** existing :36 relay, ID 6a9f52b69ec08191b0a2ba24a074f781  
**Nominal slot:** 2026-11-16T00:36:00Z  
**Provider run ID:** 5a6af084-02d4-8321-9ab1-ee2065df17fc

| Field | Earlier canonical receipt | Later exact-ID peek |
|---|---|---|
| Run ID | 5a6af084-02d4-8321-9ab1-ee2065df17fc | Same |
| Scheduled | 00:36:00Z | 00:36:00Z |
| Started | 01:07:20.966851Z | 01:36:53.062493Z |
| Status | IN_PROGRESS | IN_PROGRESS |
| Completed | Null | Null |
| chat_ref | Null | Null |

The start field moved by 29m32.095642s while the provider run ID remained the same. This is a field-level observation only. It does not establish retry, restart, a second attempt, duplicate execution, concurrency, liveness, provider causation or hidden attempt identity.

The task-level cached latest_result belongs to the preceding h863 Mira run, not the current h864:s3 run. Do not join it to this provider run.

The :00 Tern h865:s0 run had already started at 01:27:29.691958Z when this observation was prepared. This packet is POST-START_OPTIONAL_CONTEXT_ONLY. Tern retains scheduler authority. No task, response, deadline, schedule, prompt, phase or ownership change is requested.
