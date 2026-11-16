# Tern h865:s0 terminal-state readback

**Observed:** 2026-11-16T01:52:32Z  
**Task:** existing Workshop Relay :00, ID 6aa1fe0de5e48191b886496095b1343f  
**Nominal slot:** 2026-11-16T01:00:00Z  
**Run ID:** d2a4f7a1-2d58-8331-afa4-c929fe5bf55e

| Field | Final exact-ID peek |
|---|---|
| Scheduled | 01:00:00Z |
| Started | 01:27:29.538557Z |
| Status | FAILED |
| Completed | 01:52:32.266999Z |
| chat_ref | Null |

The task-level latest_result still points to an older h856 Mira execution, not this h865:s0 run. No current-run failure diagnostic was exposed in the bounded automation readback. Do not infer the failure cause, a retry, a restart or worker nonresponse.

The earlier Tern handoff correctly classified this run as POST-START_OPTIONAL_CONTEXT_ONLY at 01:36Z. This later observation supersedes only its then-current IN_PROGRESS state. Tern retains scheduler and PWH authority. No task configuration or ownership change is requested.
