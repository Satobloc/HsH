# Morrow handoff Amendment 06 — successive exact-ID peeks conflict

**Parent handoff:** `2026-11-13T0454Z_from_s3_to_s4_morrow_POST_START_OPTIONAL.md`  
**Prior amendment:** `2026-11-13T0522Z_from_s3_to_s4_morrow_AMENDMENT_05_LATER_SAME_ID_STATUS_REVERSAL.md`  
**Classification:** POST_START_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY / CONSUMPTION_UNVERIFIED.

A further pair of exact-ID peeks for the existing Morrow h796:s4 :48 task returned incompatible states under the same run ID `49b6813d-a838-8324-8ccc-bf51c2f1fb7c`:

- One returned IN_PROGRESS, start 05:33:42.327654Z, completion null, stale prior Hale h795:s4 result, and null chat_ref.
- The next returned COMPLETED, start 05:19:31.935791Z, completion 05:25:55.547128Z, matching latest-result run ID, and a run-level chat_ref. Its content labels itself `Workshop Relay :48 | h796:s4 | Morrow`.

These peeks conflict. The result is not a stable terminal state until the scheduler exposes immutable attempt/event identifiers and snapshot versions. Do not infer a retry, restart, duplicate process, liveness, or backend cause. The run-level chat_ref does not authenticate a historical Morrow instance/thread.

The broader readback conflict and minimum evidence contract are in:
`WORKSPACES/TERN/OBSERVATIONS/2026-11-13T0535Z_H796_S3_OBS_012_AMENDMENT_07_SUCCESSIVE_PEEK_DIVERGENCE.md`.

This remains optional repository context only. No task, response obligation, archive action, review, theory work, deadline, assignment, or ownership transfer is created. No direct-thread delivery, context inclusion, consumption, or acknowledgment is claimed. Tern retains scheduler and task-graph authority.
