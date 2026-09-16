# Nathan Words — live provenance package recheck 01

**Date:** 2026-09-16
**Lane:** Nathan Direct corpus / provenance
**Status:** bounded package-state recheck; no theory authority

## Startup / boundaries checked

Read current Common controls before this operation: `NO_CONVERSATION_RENAMING_POLICY.md`, `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, `BIBLIOGRAPHY_SEQUENCE_ROADMAP.md`, `NATHAN_DIRECT_WORKFLOW_STATE.md`, `COORDINATION.md`, `HANDOFFS.md`, plus script/write-safety surfaces `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md` and `SHARED_STATE_WRITE_SAFETY.md` because packaging infrastructure was inspected. Conversation titles were not changed or proposed for change. Quarantine was not accessed. No direct theory work was performed.

## Operation chosen

Recheck the previously identified September-14 live-provenance packaging gap rather than repeat raw-source discovery. The priority testimony had already been metadata-authenticated in prior bounded work; the open question was whether the durable Nathan Direct package had since converged.

## Current durable package state

Direct fetch of `indexes/nathan-direct/MANIFEST.json` on current `main` now reports:

- input records: **73,200**
- raw/input user records: **22,758**
- packaged unique user messages: **15,133**
- duplicate archive user records collapsed: **7,625**
- context-dependent/inherited-tag records: **14,451**
- missing conversation/message IDs: **0**
- resolved parent graph pointers: **14,455**
- records with child graph pointers: **9,893**
- 2026 shard records: **9,067**

This is a material advance over the older workflow-state checkpoint (run 9: 69,927 inputs / 21,451 user records / 14,306 unique packaged messages / 8,906 records in the 2026 shard). Therefore a newer archive-wide packaging pass has landed since that checkpoint.

## Priority-message identity check

Repository code search on current `main` for authenticated September-14 priority message ID `d5e21827-643b-43e6-92b1-daec4e514756` returned no result. A shorter-ID search (`d5e21827`) likewise returned no result. Search for the raw conversation title/identity string `ALDEN CROSS` also returned no result.

Interpretation is deliberately narrow: **the durable package has refreshed, but current searchable repository state still does not expose the known priority message identity.** Do not infer that the message is absent from every underlying source solely from code-search behavior; the package shard itself is too large for the connector's direct full-content fetch, so exact shard-level membership could not be independently enumerated in this run. The earlier package-gap finding therefore remains unresolved rather than closed.

## Pipeline observation

`.github/workflows/layered-nathan-autotag.yml` remains the owner of archive-wide autotagging → Nathan Direct packaging → Stage-2 generation. It triggers on conversation-source changes under `DEVELOPMENT_FULL_CONVOS/**` and `LIVE CONVOS/**` plus relevant tooling changes, and has manual dispatch. The workflow publishes generated indexes using fetch/reset-to-current-main + retry rather than force-push.

The refreshed manifest combined with the still-unsearchable priority identity suggests the likely frontier is **source-ingest coverage / source location**, not merely a stale package run. This is an infrastructure/provenance diagnosis, not a claim about the testimony itself.

## Provenance / duplicate handling

- No new Nathan-authored wording was created or inferred.
- No assistant prose was converted into Nathan-authored content.
- Existing authenticated September-14 message identities and branch/superset relation remain the controlling provenance evidence from prior bounded recovery.
- No duplicate disposition changed.
- No earliest-use, novelty, or scientific-priority claim was made.

## Counts for this run

- current durable package manifests directly checked: **1**
- current package-owner workflows directly checked: **1**
- exact/identity repository searches run against priority record: **3**
- newly authenticated Nathan records: **0**
- newly promoted Nathan Direct records: **0**
- theory/sandbox outputs: **0**
- quarantine accesses: **0**

## Unresolved source/context issue

The metadata-authenticated September-14 provenance testimony is known from prior recovery, but its raw export still does not appear to be represented in the searchable HsH source/package path that feeds current Nathan Direct generation. Because the durable package has demonstrably refreshed, waiting for another ordinary packaging pass alone is no longer a sufficient next action.

## Current frontier / best next actions

1. Locate the exact repository/source-ingest path (or missing upload boundary) for the metadata-bearing `ALDEN CROSS` raw export using already-known conversation ID/message IDs rather than broad phrase searches.
2. Compare that path against the autotagger's declared source roots (`DEVELOPMENT_FULL_CONVOS/**`, `LIVE CONVOS/**`).
3. If the raw export is present under an eligible source root, diagnose why the priority IDs do not reach generated searchable output; if it is not present, preserve the authenticated external/library source pointer and mark this specifically as an ingest gap rather than a packaging-staleness gap.
4. After any source-ingest repair by the appropriate owner, verify all three authenticated message identities, both sibling branch records, exact wording, date/timestamp, and branch/superset relation in the durable package.

No Nathan action is currently required.
