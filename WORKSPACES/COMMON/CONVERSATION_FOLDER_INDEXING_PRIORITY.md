# Conversation / Upload Folder Indexing Priority

**Current as of:** 2026-09-18  
**Authority:** Nathan-direct  
**Status:** ACTIVE shared indexing priority

## Purpose

Build and maintain a detailed, content-driven index of the conversation/upload folders and the documents they contain.

These folders are transport/upload groupings. Their numbering or upload order does **not** establish source importance, theory chronology, currentness, or authority. Index value comes from what is actually found in each item.

## Scope

Index **all substantive items** in each conversation/upload folder, including:
- conversation exports;
- NotebookLM exports;
- source indices;
- pasted documents;
- PDFs/text/markdown/JSON and other supporting documents;
- non-conversation artifacts bundled into the same folder;
- duplicate, prefix, superset, or derivative files where relevant.

Do not assume an item is a conversation merely because it lives in a conversation-numbered folder.

## Required per-item fields

Where practical, record:

1. **Folder / source location** — exact folder and filename/path.
2. **Item type** — conversation export, NLM export, source index, raw doc, derivative, supporting file, unknown, etc.
3. **Source identity / provenance** — what the item claims to be, authorship/source metadata, and whether that identity is verified, inferred, or uncertain.
4. **Date / chronology clues** — source date, export date, internal date range, or unknown; do not substitute upload date for source date.
5. **Contents summary** — detailed enough to support later wayfinding, not merely a title paraphrase.
6. **Key topics / entities / concepts** — useful retrieval vocabulary.
7. **Notable Nathan-direct material** — exact or near-exact direct material worth provenance extraction, with authorship boundary caution.
8. **Methodological / epistemic controls** — where present.
9. **Source-index / archive-wayfinding clues** — named underlying documents, archive paths, references, missing-source leads.
10. **Duplicate / overlap / relationship notes** — identical, near-duplicate, prefix, superset, excerpt, derivative, sibling branch, etc.
11. **Current ingest status** — e.g. UNSEEN, INVENTORIED, PARTIALLY READ, SUBSTANTIALLY READ, FULLY READ, PROVENANCE-CHECKED, CROSSWALKED, EXTRACTED, or other clearly defined status.
12. **Ingest completion note** — what has and has not actually been done; distinguish file presence from inspection.
13. **Tentative value** — a provisional estimate of likely usefulness.
14. **Tentative priority** — a provisional estimate of what should be inspected next.
15. **Why tentative** — brief basis and uncertainty; value/priority must remain revisable as contents and cross-links become clearer.
16. **Next useful action** — one bounded next step.

## Tentative value / priority discipline

**Emphasis: tentative means tentative.**

Value and priority labels are routing aids, not judgments of theory truth, historical importance, or ultimate usefulness.

Do not let early triage harden into de facto canon. Specifically:
- do not downgrade or ignore an item merely because its title looks unpromising;
- do not infer low value from an older/lower-numbered folder;
- do not infer high value from a newer/higher-numbered folder;
- revise rankings when new context, provenance, duplicate relationships, or source crosswalks emerge;
- preserve uncertainty explicitly when only a title/index/partial read is available;
- distinguish `high apparent value based on partial inspection` from `high value confirmed by detailed ingest`;
- allow items to have different value for different tasks: provenance, theory reconstruction, methodology, bibliography, archive gap recovery, instance continuity, chronology, etc.

Prefer descriptive rationales over opaque scores. If numeric/tier labels are used, they must be visibly provisional and accompanied by the basis.

## Folder-level summary

For each folder, maintain a roll-up that includes:
- item count by type;
- ingest completion distribution;
- notable themes;
- major source indices / archive-gap candidates;
- high-tentative-value items with rationale;
- high-tentative-priority items with rationale;
- unresolved provenance or extractor-integrity concerns;
- major duplicate/superset clusters;
- coverage gaps and next ingest frontier.

Folder-level roll-ups must not imply that the whole folder shares one value/status.

## NotebookLM-specific rule

For NLM exports, preserve the distinction between:
1. NotebookLM-generated summary/paraphrase;
2. quoted or embedded Nathan-authored text;
3. source index / named underlying source;
4. underlying source actually located and inspected.

Use source indices as discovery/wayfinding evidence. Build index-entry → underlying-document crosswalks where useful, especially into `Satobloc/SAT_THEORY_ARCHIVE_2023-25`. Flag unlocated underlying sources as archive-gap candidates with actual search coverage stated.

## Current practical frontier

As of 2026-09-18:
- folder 19 contains a very large mostly-NLM tranche and should receive substantial indexing attention;
- folder 20 is being created/populated and should be inventoried as arrivals land;
- folder 18 and all earlier folders remain fully eligible for high-value recovery and should not be deprecated by later upload order.

## Output / discoverability

The index should be durable, repo-visible, and easy for workers to query. Prefer one structured master index plus folder-specific sections/files rather than scattered notes.

Link it from Common/README/orientation once the initial index surface exists.

The index is a living map, not a final verdict. Preserve revision history and provenance for material reclassification when practical.
