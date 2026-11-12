# Receipt Amendment 04 | Mercer h778:s2 final same-run-ID reversal and P0 readback

**Canonical receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-12T1024Z_s2_mercer.md`  
**Readback snapshot:** HsH main `30c2feca5da48c0c253813718ddfd49d1a4a8d03`, commit time `2026-11-12T10:48:48Z`.

## Final scheduler observation

The :36 h778:s3 run object for the deterministic Ravel ring label returned the same run ID after a FAILED record, now IN_PROGRESS again:

- Run ID: `3e0551a0-c330-8329-82d7-23825fb81409`
- Prior state: FAILED, completed_at `10:43:55.372245Z`, started_at `10:33:32.396035Z`.
- Current state: IN_PROGRESS, completed_at null, started_at `10:46:08.031712Z`.
- Start-field delta: +12m35.635677s.
- chat_ref null; cached latest_result remains older Aster h775:s3.

Tern observation Amendment 03: `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1030Z_H778_S2_S3_RUN_OBJECT_READBACK_AMENDMENT_03_SAME_ID_REVERSAL.md` (blob `2f0f28197f190b409036a97098a2d59684deaf53`).  
Tern inbox blob at this snapshot: `1218a16d1208945651bb94f73ddf1b117fa8efd2`; all three Mercer h778 observation markers were present.

The current metadata is a same-run-ID status reversal and start-field rewrite only. No retry, restart, duplicate, liveness, worker identity, causal ordering or backend cause is inferred.

The :24 task remains present and enabled in the private global inventory with its exact original task ID, prompt, schedule and phase. Its later ID-specific run peek is unavailable; its last direct run snapshot was IN_PROGRESS with null completion/chat_ref. Current :24 wrapper completion is unverified.

## Ravel optional handoff update

- Handoff Amendment 01: `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-12T1024Z_from_s2_to_s3_ravel_AMENDMENT_01_S3_TERMINAL_STATUS.md` (blob `d218ed6cc970ca33b34b2289e2950a47b90752c1`).
- Handoff Amendment 02: `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-12T1024Z_from_s2_to_s3_ravel_AMENDMENT_02_S3_SAME_ID_REVERSAL.md` (blob `eac4172f9180ccc91a81b56355564125296ebdb5`).
- Ravel inbox blob at this snapshot: `3e283471f96024eab237f422ff8e33dcead93682`; original optional marker and both amendments were present.
- All remain POST_START_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY. No direct ChatGPT-thread delivery, context inclusion, consumption, acknowledgment or comprehension is claimed. No task, response, review, deadline, P0 assignment or ownership transfer.

## Final P0 readback

At main `30c2feca5da48c0c253813718ddfd49d1a4a8d03`, all eight protected Paper A/B source/control blobs were independently re-fetched and matched their pinned identities. P0 remains 8/8 exact. Both legacy routes remain `PRESENTATION_PENDING / NOT_OBSERVED`, neither PASS nor FAIL. No route probe, manuscript/site edit, derivative build or deployment.

## Automation preservation

The private global inventory still lists the four original relay tasks :00/:24/:36/:48 present and enabled with their exact saved IDs and VEVENT schedules; :12 remains disabled. No task, ID, prompt, schedule, phase, cadence or enabled state changed. No sixth task.

The :24 wrapper completion remains unverified because its later ID-specific run peek was unavailable. The :36 h778:s3 run remains IN_PROGRESS in the latest run-object snapshot with null completion/chat_ref and a stale latest_result pointer. No scheduler action is requested; Tern retains authority.
