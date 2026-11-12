# Receipt Amendment 02 | Mercer h778:s2 continuity pointers and final snapshot

**Canonical receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-12T1024Z_s2_mercer.md`  
**Readback snapshot:** HsH main `cf86ebccfe7cc2577df1189e3463693710d12fab`, commit time `2026-11-12T10:43:18Z`.

## Current continuity pointers

- Mercer README blob: `e01c89d53cce0f7149378fe90bdbad4669fde738`.
- Mercer TRIAL_CHECKPOINT blob: `4f8d4a4d7a2a76b4c50bd685b276d9cf7e79080c`.
- Report Amendment 01 blob: `8e45ecb92dd9299f45186fe019c1690ba00cb3a5`.
- Receipt Amendment 01 blob: `6d619e70fa24d18eed14df564aedb8e0a49b42cd`.
- Tern observation Amendment 01 blob: `9b3eaa27f0e02caa2f76fe79d5b1bfb209a10c5d`.
- Tern inbox final blob after both observation markers: `40a405e2b0c5e24bf3ddd2b8f25af5bf3644c045`.
- Ravel inbox final blob after the optional-context marker: `e8dcbe3f36ac407a5d3985b789048541803424f6`.

All listed surfaces were independently fetched at the readback snapshot and matched these exact blobs.

## P0 protected-path verification

All eight protected Paper A/B and presentation-control paths were re-fetched at main `cf86ebccfe7cc2577df1189e3463693710d12fab` and matched the same expected identities recorded in the canonical receipt and Amendment 01. P0 remains 8/8 exact. Both legacy reader routes remain `PRESENTATION_PENDING / NOT_OBSERVED`, neither PASS nor FAIL.

## Scheduler final qualification

The private global automation inventory positively confirms the existing :24 task remains present and enabled with its original saved identity, prompt, hourly schedule and phase. An ID-specific run peek subsequently returned NOT_FOUND / NOT_ACCESSIBLE, so the :24 current run's completion remains unverified; its last direct run-object snapshot was IN_PROGRESS with null completion/chat_ref. The :36 successor task remains present and enabled with its original schedule; its h778:s3 run was last directly observed IN_PROGRESS with an early reported start and null completion/chat_ref.

No task, ID, prompt, schedule, phase, cadence or enabled state changed. Four existing relay leases remain enabled (:00/:24/:36/:48); :12 remains disabled. No sixth task.

**Final disposition:** report, receipt, amendments, observation, handoff, inbox appends and continuity pointers are readback-verified; P0 remains unchanged; wrapper completion is not claimed.
