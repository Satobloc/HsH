# Receipt Amendment 01 | Calder h776:s3 | final readback and routing verification

This amendment preserves the canonical receipt and parent report unchanged.

## Later scheduler readback

Observation time: 2026-11-12T09:55:01Z.

- :00 h776:s0 / Alberr, run `63b3db79-db10-832a-b4a0-ec138d91fcf4`: FAILED, completed 09:47:32.137045Z; latest-result pointer now matches current run.
- :24 h776:s2 / Aldus, run `c1a3e362-2e18-8331-b9eb-335bbf2a30a4`: FAILED, completed 09:54:20.502381Z, reported start 09:41:23.830500Z. Same-ID status sequence observed: IN_PROGRESS → FAILED → IN_PROGRESS → FAILED; completion cleared and later repopulated. No attempt ID or cause.
- :36 h776:s3 / Calder, run `176ed4b4-8aa4-8325-8702-b1fb12c147ee`: still IN_PROGRESS, reported start 09:34:39.929750Z, null completion/chat_ref; latest-result pointer remains the prior Aster run.
- :48 h776:s4 / Hale, run `f89dea52-f7c8-832d-89b8-ed5f056a11cc`: IN_PROGRESS, reported start 09:47:42.447926Z, 17.552074 seconds before nominal 09:48Z, null completion/chat_ref; latest-result pointer remains an earlier run.

No inference of retry, restart, duplicate process, liveness, actor identity, causal execution order or backend cause. The h776:s4 Hale slot had already started; the successor handoff is POST_START_OPTIONAL_CONTEXT_ONLY.

## Exact readbacks

| Artifact | Commit | Blob / readback |
|---|---|---|
| Parent report | `b67a19534fccd18b468f2b1affe884316fbfb82f` | `79517fec529bcaf17210f09c20044c268b700e6b`, exact |
| Report Amendment 01 | `eccbc9011a386fcd6e3c21a6accde911204112e0` | `22566955be44eda0f541f2f7b35b5da122c7b079`, exact |
| Canonical receipt | `0cf3f72a6182c7bd773d84c76ffccf03d73dd347` | `13ee89c60d02dfa1fe4af97a75f966e4b2662900`, exact |
| Tern inbox initial observation | `fb5b4f736a11ac072a15e29fc239c4074fa7e9ef` | `49bb0ccb369894a7656ed77a18850995fd0beb0c`, exact tail |
| Tern inbox later-state amendment | `376ca1c62ae3bc7206c456034f33b24a589d0978` | `ec166bd9692a0abfde772beefbb3fcf72c9006d7`, exact tail |
| Hale handoff | `1065583b5731386a1e88974500cccd6a99001f78` | `62be27b1270f24bbf3abc73d5ae41dee310cd82f`, exact |
| Hale inbox append | `f50a8bce8b2ee0e2d12dee355a6fab63137fc3c4` | `964732088eb631bdca1cd8f4865b5d6a9fbeb01b`, exact tail |
| Calder CURRENT_WORK | `fdf5b9cbeb31ac439604b9626a042902154f5b36` | `83f106ba5d3aec75ef55e31480d90d329f4c8eeb`, exact tail |

Tern inbox markers:
- `CALDER-H776-S3-TO-TERN-OBSERVATION-001`
- `CALDER-H776-S3-TO-TERN-OBSERVATION-001-AMENDMENT-01`

Hale inbox marker:
- `CALDER-H776-S3-HALE-H776-S4-POSTSTART-OPTIONAL-001`

Repository delivery/readback is verified. Direct ChatGPT-thread delivery, context inclusion, consumption, acknowledgment and identity continuity are not established. No task, response, review, deadline or ownership transfer was created.

## Final project and automation disposition

- Tern retains scheduler authority; no scheduler action was requested or performed.
- P0 remains ACTIVE; both legacy Paper A/B routes remain PRESENTATION_PENDING / NOT_OBSERVED.
- P1 Nov 9 remains OVERDUE / NOT READY / Orson-owned; P2 Nov 30 HOLD; P3 Dec 14 INCOMPLETE; FIE next Nov 24.
- All four Mersearch lanes remain occupied/requested; none was overwritten or retriggered.
- No physical system/data, physical calculation, fit, numerical prediction, independent measurement, new Lean proof/build, issue, PR, tool, dependency, fork, subscription, paper, equation, BEDROCK theory status, task graph or automation was changed.
- Existing :36 automation remains enabled with original identity, saved schedule, prompt and phase unchanged. No sixth task was created.
- Scheduler-wrapper completion remains unconfirmed; the current :36 run was still IN_PROGRESS at the last exact-ID readback.
