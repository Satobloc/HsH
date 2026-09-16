# Nathan Words — live provenance ingest-boundary audit 01

**Date:** 2026-09-16
**Lane:** Nathan Direct corpus / provenance
**Status:** bounded source-ingest audit; no theory authority

## Startup / boundaries checked

Read current Common controls before this operation: `NO_CONVERSATION_RENAMING_POLICY.md`, `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, `BIBLIOGRAPHY_SEQUENCE_ROADMAP.md`, `NATHAN_DIRECT_WORKFLOW_STATE.md`, `COORDINATION.md`, `HANDOFFS.md`, and the immediately preceding lane ledger `2026-09-16-NATHAN-WORDS-LIVE-PROVENANCE-PACKAGE-RECHECK-01.md`. Conversation titles were not changed or proposed for change. Quarantine was not accessed. No direct theory work was performed.

## Operation chosen

Resolve the previous run's source-ingest frontier for the metadata-authenticated 2026-09-14 `ALDEN CROSS` provenance testimony. The question was no longer whether Nathan Direct had refreshed, but whether the raw export that supplied the authenticated message IDs is actually present under the repository roots consumed by the package pipeline.

## Result — ingest gap confirmed at current repository boundary

The current `LIVE CONVOS` source inventory was checked through both the directory contents endpoint and its freshly generated date manifest. The manifest was generated at `2026-09-16T11:44:21.860521+00:00` and inventories the current LIVE raw sources through 2026-09-10. It contains no September-14 raw conversation and no `ALDEN CROSS` source.

Repository code search on current `main` for:

- conversation ID `6aa814bf-053c-83ea-8145-f130df03b231`;
- title string `ALDEN CROSS`;

returned no source-file result.

The package owner `.github/workflows/layered-nathan-autotag.yml` consumes conversation sources under `DEVELOPMENT_FULL_CONVOS/**/*.json|txt` and `LIVE CONVOS/**/*.json|txt`. The current Nathan Direct manifest has refreshed to 73,200 input records / 22,758 user records / 15,133 unique packaged messages / 9,067 records in the 2026 shard, but the authenticated September-14 source is outside the current repository ingest inventory.

**Narrow diagnosis:** the priority testimony's absence from durable Nathan Direct is now best classified as a **source-ingest/upload gap**, not a stale-package problem and not a package-deduplication problem. The metadata-bearing raw export exists in the user's Library (`ALDEN CROSS — raw (1).json`) and was previously authenticated there, but it is not currently represented under the HsH conversation-source roots that drive packaging.

This does not authorize copying or publishing the Library export automatically. Source admission/upload is a repository-ingest action and should preserve the raw export unchanged, source identity, conversation/message IDs, branch structure, and any applicable privacy/routing review.

## Provenance boundary retained

- Existing authenticated September-14 Nathan message identities remain the controlling direct-authorship evidence.
- Both sibling branch records remain distinct identities with their recorded textual superset relation; do not collapse them as archive-copy duplicates.
- No assistant prose was converted into Nathan-authored content.
- No novelty, priority, current-theory, or correctness claim follows from the provenance testimony.
- No earliest-use claim was made.

## Counts for this run

- current Common/control surfaces read: 7 plus prior lane ledger
- current LIVE source inventory surfaces checked: 2 (directory + generated date manifest)
- package owner workflow checked: 1
- exact repository identity/title searches: 2
- newly authenticated Nathan records: 0
- newly packaged/promoted Nathan Direct records: 0
- duplicate dispositions changed: 0
- theory/sandbox outputs: 0
- quarantine accesses: 0

## Current frontier / best next actions

1. Do not spend another cycle waiting for ordinary repackaging or repeating repository phrase search; the source is not in the current ingest inventory.
2. Preserve `ALDEN CROSS — raw (1).json` as the authenticated external/Library source pointer until an authorized raw-source admission/upload places it under an eligible conversation-source root.
3. When/if source admission occurs, require unchanged raw provenance and then let the existing autotag/package pipeline regenerate normally.
4. Post-ingest QA must verify all three authenticated priority message identities, exact wording/timestamps, both sibling branches, raw parent/child relationships, and the sibling textual-superset relation in Nathan Direct.
5. Until then, provenance testimony is recovered/authenticated but durable-package coverage remains explicitly incomplete through this source boundary.

No Nathan action is currently required; the project can continue safely with the ingest gap explicitly recorded rather than manufacturing package completeness.
