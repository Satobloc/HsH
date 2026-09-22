# Code Grurple provenance tranche 02 — refreshed Viewer route

**Date:** 2026-09-22  
**Worker:** Mercer / Archive QA recurrence  
**Routing:** GRURPLE-A provenance support under `CODE_GRURPLE_ROSTER.md`  
**Status:** bounded retrieval-infrastructure result; **no later-term source recovered in this tranche**

## Purpose

Continue the exact next-source cursor from tranche 01 (`true boson`, `t-boson`, `f-boson`, `ghost neutrino`, `Jarlskog Shadow`) without repeating the exhausted ordinary GitHub indexed-code-search route.

## Result

The Conversation Viewer catalog has materially refreshed since the older Mercer glossary/source inventory. Current `CONVERSATION_VIEWER/data/conversations.json` reports:

- `source_state_at_utc`: `2026-09-22T11:48:24.129980+00:00`;
- 480 represented conversations;
- 464 development conversations;
- 11 live conversations;
- public cross-repository discovery is included through the Viewer discovery model.

The Viewer README confirms that the catalog is a manifest/path layer: it discovers public HsH conversation roots and eligible public GLASS conversations, preserves canonical raw source paths, and loads a selected raw conversation on demand. It supports **within-conversation** search after selection. It is not documented as a corpus-wide body index.

A literal `boson` probe against the fetched catalog produced no match. This is expected to test only catalog metadata/title/path fields, not the bodies of all 480 raw conversations. Therefore it must **not** be interpreted as evidence that the requested terminology is absent from the conversation corpus.

## Provenance consequence

The previous blocker has changed shape. The catalog/path layer is now fresh enough for candidate selection, but exact-term recovery still needs one of:

1. a corpus-wide body-search/index surface that can search the canonical raw conversation bodies; or
2. a defensible small candidate set selected from titles/dates/framework phase, followed by direct raw-conversation inspection / bounded extraction.

Do not manufacture an ancestry link from title/date proximity alone. Do not back-project the older SAT-W particle taxonomy onto the later labels until an attributable later source is recovered.

## Next cursor

Prefer discovery/use of the existing corpus-wide search machinery (Mersearch/Mercer_Searcher or an equivalent generated body index) over manual inspection of hundreds of raw conversations. If no usable body index is available through the current connector surface, select a small, phase-plausible candidate set from the refreshed Viewer catalog and inspect raw bodies directly for the exact later terminology. Preserve message IDs/timestamps/roles when a hit is found.

## Blocker

Current GitHub connector code search reports HsH as not code-search indexed, and the Viewer catalog itself contains metadata rather than corpus bodies. This is a retrieval-interface limitation, not a source-absence finding.
