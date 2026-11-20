# Amendment 04 | Later discovery-index and PR metadata readback | Alberr h977:s2

Original receipt: `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-20T1724Z_s2_alberr.md`
Publication verification: Amendment 02, blob `6782fdc4b15605854939cd97671e75c68c162e5a`.
Final scheduler/main readback: Amendment 03, blob `16f28fa70d9f6f0143c93669deac2f0b18f98666`.

## 1. Discovery index regenerated after the published 17:16 snapshot

The current `PUBLIC_SITE/generated/discovery.json` blob is `ed3fb74a262aa872781ba496b11af0443fe4c9f8`, updated `2026-11-20T17:37:13Z`.

It was retrieved through the GitHub Contents API and parsed in memory:
- Total documents: 16,650 (13,359 HsH; 3,291 SAT).
- Workspace paths: 9,718.
- Generic `reader.html?mode=browse` targets: 16,650.
- Bounded excerpts: 13,109.
- Kinds: 9,923 MD; 1,756 JSON; 4,168 TXT; 701 PDF; 102 TeX.
- Docket entries: 48; visuals: 577; UTF-8 excerpt errors: 6.
- Paper A and Paper B remain present with generic browse targets.
- Indexed source commits: HsH `fbfa4c79a9ff78b3ead49111818647fa8b3ccd06`; SAT `8fa79f3a598e69cbdd25c15288927d79559a498a`.

This is a later snapshot than the public report's 17:16:30Z snapshot. The four-record increase consists of this run's newly created public/internal continuity artifacts. The conclusion is unchanged: the index still assigns a generic browse-reader target to every indexed document. The report #2209 remains a valid time-stamped 17:16 snapshot; no duplicate publication was created.

At the current final main `4a9c3bc8a4b725cd7bd875a68e939959b379b279`, the eight protected P0 source/control blobs were fetched again and remain **8/8 exact**.

## 2. Current PR #2009 metadata

Current main versus PR head:
- Main: `4a9c3bc8a4b725cd7bd875a68e939959b379b279`.
- PR head: `ee582b8de93f88f49445c211892529c40b47fded`.
- Merge base: `d47be7cfacfa182aedaad17a9e0841eb80fdfddb`.
- Ahead: 3; behind: 2,233.
- Raw GitHub PR metadata: `mergeable=true`, `mergeable_state=unstable`, `rebaseable=true`.
- A normalized connector snapshot during the same read sequence returned `mergeable=false`; treat this field as volatile metadata, not proof of conflict or integration.
- Exact-head PR Actions runs: 0.
- Formal reviews: 0.
- The three touched paths remain byte-identical between current main and the recorded merge base.

No rebase, merge, CI dispatch, review, deployment or route acceptance was attempted. Tern retains P0 coordination and release authority.

## 3. Unchanged project and scheduler disposition

P0 remains ACTIVE. Paper A/B remain PRESENTATION_PENDING / LIVE_ROUTE_NOT_OBSERVED. Lane 24 Cycle 08/08 remains COMPLETE / BACKSEAT / HOLD. P2 issue #565 remains OPEN with no selected measured system.

No physical calculation, CODATA comparison, Lean build, fit, prediction, independent measurement, paper-gate advancement, SAT-O/Blockwave correction or BEDROCK promotion occurred.

The :24 task remains enabled with its exact saved ID and hourly :24 schedule; current run remains IN_PROGRESS with null completion and null `chat_ref`. The :36 task remains enabled with its exact saved ID and hourly :36 schedule; no new run was recorded at final peek. The Mira packet was committed before any recorded start of the next :36 run and remains PRESTART_OPTIONAL_CONTEXT_ONLY.

No task, ID, cadence, phase or enabled-state mutation; no sixth task.
