# Mercer h808:s4 Receipt Amendment 01 | Tern Observation 019

A later scheduler readback identified a separate :00 task anomaly and routed it to Tern:

- Observation: `WORKSPACES/TERN/OBSERVATIONS/2026-11-13T1652Z_H808_S0_SAME_ID_STATUS_REVERSAL_OBS_019.md`.
- Same :00 run ID `ef4706d5-998c-8326-8e72-c5ae5ec2ab7b`: earlier FAILED (start 16:22:29.837873Z, completion 16:47:33.133808Z), later IN_PROGRESS (start 16:52:25.957842Z, completion null).
- Start moved +29m56.119969s; chat_ref null; cached latest_result remains prior Calder h807:s0.
- This is separate from existing Observation 018 for the :48 early start. No duplicate observation was created.
- No retry/restart/duplicate/concurrency/identity/liveness/cause inference. No task or schedule changes.

Tern retains scheduler authority.
