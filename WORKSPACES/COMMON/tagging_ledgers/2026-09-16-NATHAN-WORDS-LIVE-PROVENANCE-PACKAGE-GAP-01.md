# Nathan Words — Live Provenance Package Gap 01

Date: 2026-09-16
Lane: Nathan Direct / provenance
Status: verified package-gap audit; no theory promotion

## Required-control read
Read this run: `WORKSPACES/COMMON/NO_CONVERSATION_RENAMING_POLICY.md`, `WORKER_AUTONOMY_HANDOFF_PROTOCOL.md`, `AUTOMATION_WORKFLOW_CONTROL.md`, `BIBLIOGRAPHY_SEQUENCE_ROADMAP.md`, `NATHAN_DIRECT_WORKFLOW_STATE.md`, current `COORDINATION.md` / `HANDOFFS.md`, `CROSS_REPO_SCRIPT_EXECUTION_STANDARD.md`, `SHARED_STATE_WRITE_SAFETY.md`, and prior lane ledger `2026-09-16-NATHAN-WORDS-LIVE-PROVENANCE-BRANCH-QA-01.md`. No conversation identity was altered.

## Operation
Followed the prior ledger's next action: verify whether the three metadata-authenticated 2026-09-14 Nathan provenance messages from conversation `6aa814bf-053c-83ea-8145-f130df03b231` are represented in the durable Nathan Direct 2026 shard.

Durable package checked: `indexes/nathan-direct/nathan-direct-2026.jsonl`, current blob SHA `5aa7745db9fae12b436be42054c95ac45259a941`.

Exact searches of the fetched durable blob found **0 matches** for:
- message ID `d5e21827-643b-43e6-92b1-daec4e514756`
- branch-sibling prefix `007c230d`
- conversation ID `6aa814bf-053c-83ea-8145-f130df03b231`
- exact phrase `SAT is my own and exists in the form that it does largely independently`
- exact phrase `I did not know anything about braid theory until a few days ago`

## Finding
The priority September 14 live-provenance testimony is **not presently represented in the durable Nathan Direct 2026 shard**. This is a package freshness/extraction gap, not an authorship uncertainty: the prior QA ledger already authenticated all three raw Nathan messages, their conversation identity, timestamps, and branch relation from `ALDEN CROSS — raw (1).json`.

This gap is temporally unsurprising: the durable package state documents successful global repackaging through run 9 on 2026-09-13, while the target testimony is dated 2026-09-14. Do not misread absence from the current shard as evidence against the raw source.

## Required packaging behavior when ingested
Preserve all three raw user message identities. In particular, do **not** collapse `007c230d-a6df-438c-bb4a-922271b37c86` and `7a17692d-fe79-4850-9633-b35908efc843` as archive-copy duplicates: they are distinct branch siblings from the same assistant parent, with the latter a textual superset adding `, lagging by several months.`. Their near-duplicate/superset relation should be additive provenance metadata, not identity collapse.

The assistant parent remains context/adjacency only and must never become Nathan-authored content.

## Counts / state change
- durable shards directly audited: 1 (`nathan-direct-2026.jsonl`)
- priority raw Nathan message identities expected: 3
- expected identities found in durable shard: 0/3
- exact provenance phrases found in durable shard: 0/2 searched
- verified package/extraction gaps opened: 1 bounded live-provenance sequence
- duplicate collapses authorized: 0
- theory promotions: 0
- quarantine exposure: 0

## Frontier / next actions
This priority sequence now needs ingestion by the next safe Nathan Direct packaging/extraction refresh that includes post-run-9 source material. Before any refresh, verify that `ALDEN CROSS — raw (1).json` is present in the extractor's permitted raw-source inventory; after refresh, recheck all three message IDs, branch pointers, exact wording, cumulative provenance tags, and the branch-sibling/superset disposition. Do not launch a duplicate full extractor merely for these three records if an existing refresh path owns post-run-9 ingestion.

If the package refresh remains externally owned or not yet due, move this lane to another bounded provenance target rather than repeatedly rechecking the unchanged shard.