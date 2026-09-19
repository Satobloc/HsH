# Conversation-Folder Content Index — Working Specification

**Status:** ACTIVE PRIORITY — Nathan directive, 2026-09-19
**Scope:** exported conversation folders and every document/artifact carried inside them, whether or not the item is itself a conversation export.

## Purpose

Build a detailed, provenance-preserving index of the contents of the conversation-folder corpus so workers can see what exists, what has actually been ingested, and where a bounded next read is likely to be useful.

Folder number/upload order is **not** a value ranking, theory chronology, currentness ranking, or deprecation sequence. Value and priority are content-dependent.

## Required indexing unit

Index **every item** in each conversation folder, including:
- raw conversation exports;
- NotebookLM exports/extractions;
- source indices;
- PDFs;
- TXT/MD notes and reports;
- images/diagrams where present;
- scripts/data/metadata files;
- any other document or artifact bundled into the folder.

Do not silently classify a non-conversation file as secondary merely because it shares a conversation folder.

## Minimum per-item fields

Record where determinable:

1. **folder identity** — exact conversation-folder name/number;
2. **exact source path / filename**;
3. **item type** — conversation export, NLM export, NLM source index, PDF, note/report, image, script/data, other;
4. **source/provenance identity** — conversation ID/message span, originating tool/source, dates, authorship/source boundaries where available;
5. **content description** — sufficiently detailed topical/structural description to support retrieval, not merely a title paraphrase;
6. **notable named concepts/people/documents/threads**;
7. **relationship pointers** — duplicates, prefixes/supersets, alternate exports, continuations, branches, source-index -> underlying-document links, related conversations/documents;
8. **ingest status**;
9. **coverage note** — what was actually read/parsed/checked;
10. **tentative value**;
11. **tentative priority**;
12. **rationale** for value/priority;
13. **next useful operation / cursor**;
14. **last assessed date** and, where useful, assessing instance/process.

## Ingest-status vocabulary

Prefer explicit states over a single percentage when possible:

- `UNINVENTORIED`
- `INVENTORIED-METADATA-ONLY`
- `INDEXED-SHALLOW`
- `TARGETED-READ`
- `SUBSTANTIAL-READ`
- `FULL-READ`
- `PROVENANCE-CHECKED`
- `CROSSWALKED`
- `DUPLICATE/SUPERSET-RESOLVED`
- `INGEST-COMPLETE-FOR-CURRENT-PURPOSE`
- `NEEDS-SOURCE-CHECK`
- `BLOCKED/UNREADABLE`

Multiple statuses may apply. `INGEST-COMPLETE-FOR-CURRENT-PURPOSE` must state the purpose; it does not mean no future use remains.

## Tentative value / priority discipline

**Value and priority assessments are deliberately tentative.** They are routing hypotheses, not durable judgments about importance.

Use labels such as:
- `TENTATIVE-VALUE: VERY-HIGH / HIGH / MEDIUM / LOW / UNKNOWN`
- `TENTATIVE-PRIORITY: P0 / P1 / P2 / P3 / UNRANKED`

Every value/priority label should carry a short rationale and enough coverage information to show how provisional it is.

Rules:
- never downgrade or deprecate a folder globally from upload order;
- never infer low value from a dull filename or shallow first pass;
- never infer high authority from apparent polish, recency, NLM packaging, or folder number;
- allow reassessment freely as deeper reading changes the picture;
- preserve prior assessments when useful for audit, but mark the current assessment clearly;
- `UNKNOWN` is preferable to false precision;
- a low-priority item may still be uniquely valuable for chronology, provenance, negative results, historical terminology, authorship, continuity, or an unexpected future question.

## Folder-level rollup

Each folder should have a rollup containing:
- total items by type;
- inventoried count;
- shallow-indexed count;
- targeted/substantial/full-read counts;
- provenance-checked count;
- unresolved duplicate/superset count;
- source-index entries crosswalked / unresolved;
- tentative high-value/high-priority candidates;
- major topics represented;
- major unknowns/gaps;
- next recommended bounded ingest operations.

Folder-level value/priority is also tentative and should be derived from contents, not folder number.

## NLM handling

For NotebookLM material, preserve the distinction between:
1. NLM-generated prose/summary;
2. exact attributable Nathan quotation;
3. NLM source index naming/attesting to an underlying source;
4. the underlying source actually located and inspected;
5. an unresolved/missing-source candidate.

NLM source indices are primarily discovery/wayfinding evidence until crosswalked to underlying sources.

## Continuity / self-reconstruction utility

The index should support revived/continued instances reconstructing themselves from saved conversations. Instance-named conversations are useful first anchors, but the index should expose relevant material across other conversations and non-conversation documents as well.

## Implementation principle

Prefer a machine-readable ledger plus a human-readable rollup/index. Keep source identity stable. Automate metadata/inventory/duplicate detection where safe; keep semantic value/priority explicitly tentative and auditable.

A useful recurrence bite is one folder tranche, one item cluster, or one bounded indexing operation with a durable next cursor.
