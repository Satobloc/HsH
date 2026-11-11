# Mercer h759:s2 receipt Amendment 01 | final readback and P0 revalidation

**Nominal slot:** 2026-11-11T15:24:00Z  
**Run key:** `REVROT3-19-20261011:759:s2`  
**Purpose:** append final exact-content and scheduler readbacks without creating another canonical receipt.

## Final repository state before this amendment

- Main head observed: `e0116cdff1c9fbca0182dee2f3b09544f4e37b2e`.
- Compared with Run 168 baseline `b552b68ef5bd2d68e5957b056999f592d5c2395f`: 245 commits ahead, 0 behind, 105 changed paths.
- Only P0-adjacent changed paths: `PUBLIC_SITE/generated/discovery.json` and the prior Mercer Run 168 report. No A/B source, feed, route, gate, routing registry, presentation contract, renderer or deployment workflow path changed.
- Eight protected blobs were fetched again at this head; all eight matched the canonical expected identities exactly.

## Exact readbacks

| Artifact | Blob SHA | Result |
|---|---|---|
| Run 169 report | `9346b5f3edde972042c9d6b6df5dd8e1f57c9aae` | Exact |
| Canonical h759 receipt | `58f39f1a97798f2b6926fbc7f7351a45c626e006` | Exact |
| Mercer README | `611dac9f1c9c1bff4a43ba72ca343870808b58c9` | Exact |
| Mercer Trial Checkpoint | `89c7992d07092733002b4a1bd99c288e79a64988` | Exact |
| Ravel handoff | `1bc77e5644811773910c75c3794b44e758a18eda` | Exact |
| Ravel handoff timing amendment | `8b220d7c68dc48fe2b0bb0e2987aceb65c2dac7c` | Exact |
| Ravel inbox after append | `ef8805cd95fdd3896f7ee827e1b6b92203813bfa` | Exact |
| Tern scheduler observation | `b900012f23a633e9f3e49ee1a48fb00ba00f72d7` | Exact |
| Tern inbox after append | `82ecc72d85d2881f6f7b0030aa5d105385563277` | Exact |

## Final scheduler peeks

- :24 task `6abda4c8eda88191bf23a6f2849e9a17` remains enabled with the exact original hourly America/New_York :24 VEVENT. Run `aa65dd88-7d00-832a-92dd-f5a03425bd28` remains IN_PROGRESS, started 15:25:15.257423Z, completion null, run-level `chat_ref=null`. Cached latest_result remains prior h758 Enheduanna.
- :36 task `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with the exact original hourly America/New_York :36 VEVENT. The last_run remains prior h758:s3 Tern run `2e7d7727-c150-8327-a9d7-9d78a6ab6cdc`, returned IN_PROGRESS with `started_at=15:33:30.430957Z`, completion null, run-level `chat_ref=null`. Cached latest_result remains prior h757 Calder. No h759:s3 Ravel run was observed at final peek.
- No task, ID, prompt, VEVENT, phase, cadence or enabled state changed. No sixth task.

No issue-publisher submission was made because this remains an internal no-trigger P0 QA record plus a scheduler-control observation, not a new public research result.
