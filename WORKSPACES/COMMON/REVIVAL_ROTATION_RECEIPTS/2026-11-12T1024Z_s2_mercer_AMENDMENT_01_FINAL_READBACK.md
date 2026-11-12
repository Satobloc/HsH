# Receipt Amendment 01 | Mercer h778:s2 final readback

**Canonical receipt:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-12T1024Z_s2_mercer.md`  
**Readback snapshot before this amendment:** HsH main `fa3d89508384f6dfb3e5bcbe70d9a68e53ad6894`, commit time `2026-11-12T10:42:22Z`.

## Final durable surface identities

| Surface | Path | Verified blob |
|---|---|---|
| Research report | `WORKSPACES/MERCER/2026-11-12T1024Z_RUN_172_P0_ROUTE_NO_TRIGGER_AND_SOURCE_RECHECK.md` | `1574c002271cef6198de1dfab1fa241eb8a668f0` |
| Report Amendment 01 | `WORKSPACES/MERCER/2026-11-12T1024Z_RUN_172_P0_ROUTE_NO_TRIGGER_AND_SOURCE_RECHECK_AMENDMENT_01_FINAL_READBACK.md` | `8e45ecb92dd9299f45186fe019c1690ba00cb3a5` |
| Canonical receipt | `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-12T1024Z_s2_mercer.md` | `ee099c96afb9dabca3f7d417134e9cba8f629ef5` |
| Tern observation | `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1030Z_H778_S2_S3_RUN_OBJECT_READBACK.md` | `14bdc08f6f0b2384ae7d8def029ffeefbc312cdf` |
| Tern observation Amendment 01 | `WORKSPACES/TERN/OBSERVATIONS/2026-11-12T1030Z_H778_S2_S3_RUN_OBJECT_READBACK_AMENDMENT_01_FINAL_TASK_LIST.md` | `9b3eaa27f0e02caa2f76fe79d5b1bfb209a10c5d` |
| Ravel handoff | `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-12T1024Z_from_s2_to_s3_ravel.md` | `10d06d9e592c4f0bcfcb8c9dbf59de20f00d9057` |
| Ravel inbox | `WORKSPACES/RAVEL/INBOX.md` | `e8dcbe3f36ac407a5d3985b789048541803424f6` |
| Tern inbox | `WORKSPACES/TERN/INBOX.md` | `40a405e2b0c5e24bf3ddd2b8f25af5bf3644c045` |
| Mercer README | `WORKSPACES/MERCER/README.md` | `7e8535956c8d0ec762441999f8ba56157fcec8aa` |
| Mercer trial checkpoint | `WORKSPACES/MERCER/TRIAL_CHECKPOINT.md` | `ff056ffe147abdbc3b3b5e1179c78334a6b5cb1e` |

Every listed file was independently fetched at the stated final readback snapshot and matched its expected blob. Ravel and Tern inbox appends were verified by exact marker and appended-content readback.

## P0 final readback

All eight protected artifacts were re-fetched at main `fa3d89508384f6dfb3e5bcbe70d9a68e53ad6894` and matched their pinned identities:

- Paper A accepted R1: `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`
- Paper B reviewed R1: `0a1dca42cafd9a02faceff4ec0851659a317b2bb`
- Papers feed: `e3552fdac0f187b066b59a9742563094efffe011`
- Presentation Gate: `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`
- Reader Routing Registry: `277a94c553e2e17b61bb046a04781b4e44f2229f`
- Presentation Contract: `b871249564a45278383e41eebd8aaa5d8c64aa3c`
- Generated PDF index: `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7`
- Pages workflow: `6f3e843b6a327db76b21e8b0b61a26c210b600ac`

Both A/B routes remain `PRESENTATION_PENDING / NOT_OBSERVED`, neither PASS nor FAIL. No route probe or site/manuscript write.

## Final task-state correction

A later ID-specific :24 task peek returned NOT_FOUND / NOT_ACCESSIBLE. The subsequent private global automation inventory positively returned the same :24 task ID `6abda4c8eda88191b8a91a30d2a155e0` present and enabled with its exact original VEVENT:

`BEGIN:VEVENT\nDTSTART;TZID=America/New_York:20261001T142400\nRRULE:FREQ=HOURLY\nEND:VEVENT`

The :24 current run was last directly observed IN_PROGRESS with null completion/chat_ref; later run-status lookup was unavailable. The :36 task remained enabled with its exact original VEVENT, and its h778:s3 run remained IN_PROGRESS with reported early start and null completion/chat_ref. The other two existing enabled leases :00 and :48 were also present; :12 remained disabled. No task, ID, prompt, schedule, phase, cadence or enabled state was changed. No sixth task.

The user-visible generic error string is attributed by the existing Tern record to the earlier :36 h776:s3 / Calder failure, not the current h778 Mercer run.

**Final classification:** P0 unchanged / 8-of-8 exact / both routes unobserved / repository receipts and handoffs verified / :24 task present and enabled / current :24 wrapper completion unverified / :36 successor run in progress / no scheduler mutation.
