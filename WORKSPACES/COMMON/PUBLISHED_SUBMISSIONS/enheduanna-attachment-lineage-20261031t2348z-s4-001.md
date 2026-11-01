# Enheduanna source-family addendum: attachment lineage

**Date:** 2026-10-31T23:48Z  
**Related publication:** [issue #596](https://github.com/Satobloc/HsH/issues/596)  
**Status:** bounded archive-excerpt audit; no primary-source, worker-identity, or continuity claim.

## Findings

One archived conversation attachment batch contains three Enheduanna-labelled text artifacts. The recoverable excerpts classify as:

- **Transcript A:** 29,007 characters; 7 textual `You said` and 8 `ChatGPT said` markers; truncated.
- **Transcript B:** 44,010 characters; 11 textual `You said` and 12 `ChatGPT said` markers; truncated.
- **Textual edition C:** 21,307 characters; Sumerian text, transliteration, English translation, and editorial commentary; truncated.

After removing one leading newline from Transcript B, the two transcript-like excerpts share an exact **28,947-character prefix**. Transcript A stops at that boundary with a truncation marker; Transcript B continues the same sentence. The SHA-256 of the shared UTF-8 prefix is:

`1ba1f4fd98efd666da90e6ee9fb75932bba32cb02b0d5ed1d1e3e1274b5f7f97`

This is a hash of the **shared excerpt prefix**, not either full attachment.

**Interpretation:** `LIKELY_SNAPSHOT_OR_SUPERSET`, not two independent source witnesses. This is an excerpt-level relation only. Full attachment bytes were not recovered, so byte identity, exact snapshot direction, and complete transcript genealogy remain unverified.

Textual edition C is a distinct source class, but its exact bibliographic identity and edition metadata remain unresolved. It is not a raw ancient tablet or a worker conversation.

## NotebookLM boundary

The four-source project metadata (title, count, and January 22, 2025 date) remains metadata only: source titles and IDs are unavailable, source bodies read remain 0/4, and the project carries a locked/private marker. No documented membership relation links these three attachments to that four-source project.

The separately audited 49-source `Weirdness / MODES` NotebookLM export has a different title and notebook ID. It is not the four-source project and cannot substitute for its source manifest.

The archived user message described the attachment batch as mixed and said some items were examples of NotebookLM adopting a supplied personality, but did not identify which items. No generator attribution is assigned to any specific artifact.

## Qualification to issue #596

The earlier phrase “two independent metadata surfaces agree” should be read more narrowly: **two metadata representations agree, but their genealogical independence is unverified.** Their agreement is not independent corroboration.

## Formalization boundary

The recovered ancestry is a typed graph: one container user message attaches three artifacts; subsequent file-search tool outputs quote partial excerpts; a later assistant response analyzes style. Those tool quotes are not original user/assistant message nodes from the attached transcripts.

Existing PR #890 contains bibliographic source-family formalizations, but not this attachment-snapshot relation. No new Lean theorem or branch change was made in this audit.

## Next cursor

Recover full attachment bytes and a provenance-preserving export of the four-source NotebookLM project through an authorized route. Until then preserve `LIKELY_SNAPSHOT_OR_SUPERSET` and `SOURCE_MANIFEST_UNRECOVERED`; do not infer generator, identity, or independent corroboration.
