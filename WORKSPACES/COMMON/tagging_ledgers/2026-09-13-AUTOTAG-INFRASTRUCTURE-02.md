# Autotag infrastructure update — 2026-09-13

**Purpose:** expand the layered conversation tagger into an archive-wide redundant retrieval/indexing surface, per Nathan's direct request.

## Changes

- `WORKSPACES/COMMON/scripts/layered_autotag_nathan.py`
  - broadened discovery from `*raw*.json`-style conversation files to every `.json` beneath the supplied roots;
  - accepts only JSON objects/lists that actually contain ChatGPT-style conversation `mapping` structures, so ordinary repository JSON is skipped rather than treated as conversation prose;
  - default/root workflow scope is the entire HsH repository (`.`), not only `DEVELOPMENT_FULL_CONVOS` and `LIVE CONVOS`;
  - retains three retrieval layers: conversation, adjacency, message;
  - preserves Nathan/user-message discourse and precision tags without treating them as authorship proof or claim authority;
  - expanded broad topic families across SAT/H(s)H, physics, mathematics, other sciences, AI/computation, archive/repository work, visualization/photography, philosophy, writing/education, creative/media domains, legal/policy/work/biographical material;
  - added compact repository-side per-user-message tag index containing source path, message ID, timestamps, conversation/adjacency/message/discourse tags, retrieval score and duplicate metadata, but no full message text;
  - added conversation-level manifest and Markdown index;
  - compares recognized conversation paths against `indexes/index-state.json` and marks `INDEX-GAP-CANDIDATE` when a tagged conversation path is absent from the structural index;
  - exact duplicate paths remain additive metadata; no source deletion or harmonization is performed.

- `.github/workflows/maintain-navigation.yml`
  - archive-wide autotagging is now part of the normal navigation-maintenance pipeline;
  - structural index is refreshed once before autotagging so the tagger can cross-check current indexed paths;
  - autotag outputs are generated into `indexes/autotag/`;
  - structural index is refreshed again afterward so the new tag surfaces themselves become indexed;
  - durable outputs are committed with normal navigation artifacts;
  - the full message-text analysis JSONL remains an Actions artifact rather than being committed, to avoid needless repository bloat.

- `.github/workflows/layered-nathan-autotag.yml`
  - remains available for explicit/manual and tagger-code refreshes;
  - no longer independently fires on every corpus JSON change because the navigation workflow now owns routine corpus-change refreshes, avoiding competing writes.

## Durable outputs

- `indexes/autotag/CONVERSATION_TAG_INDEX.md`
- `indexes/autotag/conversation-tag-manifest.json`
- `indexes/autotag/user-message-tags.jsonl`
- `indexes/autotag/AUTOTAG_SUMMARY.md`

Full message-level text-bearing analysis remains in the workflow artifact as `WORKSPACES/COMMON/analysis/archive_layered_autotags.jsonl`.

## Index redundancy rationale

The autotag index is intentionally a second discovery system rather than merely a view of the structural index. It discovers conversation-shaped JSON directly, then compares that discovery set with the current structural index. This can expose a conversation file that is taggable but missing from the ordinary index, while the subsequent structural-index pass should normally reconcile the gap.

## Safety / provenance boundary

All output is `AUTO_TAG_ONLY`. Automated topical, discourse, style, adjacency, or conversation-density evidence does **not** promote a message into `NATHAN_VERIFIED_WORDS_COMPENDIUM.md`, does not establish Nathan authorship, and does not convert assistant context into Nathan propositions. Raw provenance verification remains mandatory for VERIFIED material.

## Coordination note

The 2026-09-13 Dashboard/quarantine clarification was observed while doing this change: Dashboard/navigation/index use is permitted; quarantined theory/interpretive dependencies remain non-controlling until cleanly re-established. This tooling change is archive/navigation infrastructure and does not rely on quarantined theory claims.
