# Mersearch conversation genealogy / chronology pickup

**Status:** PICKUP NOTE / supporting infrastructure  
**Date:** 2026-10-05  
**Scope:** Do not start a parallel search system. Extend the existing Mersearch roadmap/implementation only after checking current 1.1-dev, sidecars, indexes and tests for work already completed.

## Nathan-direct operating intent

Default archive search should prioritize the curated old SAT working archive:

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25` — primary first stop and first results section. Material here was generally selected into the working archive because it was considered relevant, but presence is not proof of Nathan authorship, endorsement, correctness or currentness.
2. `Satobloc/HsH` — second default corpus. Especially valuable for original conversations, provenance, later development and source recovery when a curated SAT item needs genealogy.
3. `Satobloc/HSH_RESOURCES` — by default return an authorized hit count / expandable route rather than mixing its results into the main result stream. Preserve all exposure, PRIOR_ART and QUARANTINE controls.

Unqualified Mersearch terms already search record **body text**. Preserve that behavior.

Add a specific **search conversations / chronology** option rather than making ordinary searches dump bulky raw-conversation results.

## Conversation chronology target

Search conversation-like material across raw `.json` sources and relevant `.txt` conversation/transcript representations. Sort by earliest **plausible** occurrence while retaining the evidence and uncertainty behind the date.

Date evidence should remain typed, for example:

- native JSON/message timestamp — high confidence;
- explicit standard date in source metadata/title/body — source-extracted confidence;
- Nathan-style dates such as `05OCT26`, `5 OCT 26`, `05.OCT.2026` and separator/case variants — source-extracted confidence;
- date found inside an otherwise undated pasted/archival document — candidate save/copy date, not automatically event date;
- neighboring-file / folder / commit / tranche inference — explicitly low-confidence inferred window, never silently promoted to an exact source date.

Likely Nathan-style date family should recognize a one/two-digit day + three-letter month abbreviation + two/four-digit year with optional spaces/dots/common separators.

## SAT-version enrichment target

Record explicit SAT/version labels when present. Where useful, cross-reference established timeline/versioning sources to produce a separate inferred version or version window with evidence/confidence. Explicit source labels always remain distinct from inference.

## Document ↔ raw-conversation genealogy

Before implementing, census existing Mersearch duplicate/snapshot, conversation-family, source-representation and message-ID sidecars. The existing architecture already anticipates:
- conversation-family / duplicate-snapshot annotations;
- source-representation relations;
- chronology/history mode;
- raw message-ID backfill;
- immutable/incremental indexes.

Missing capability to assess: content-based comparison of curated SAT documents against raw conversation JSON/text to discover previously unknown ancestry/duplicate spans.

If missing, prefer index-time/incremental reconciliation rather than every-query all-vs-all comparison. Candidate approach: normalized chunk/shingle fingerprints or hashes for cheap candidate retrieval, followed by bounded alignment only for promising candidates. Persist relations with exact source/message/span provenance and relation class/confidence.

Do not collapse duplicate representations or infer authority/currentness from duplication, chronology, newest/largest copy, or archive placement.

## Authorship caution

SAT-archive inclusion means selected/relevant working material, not necessarily Nathan-authored text. Where authorship materially matters, use mechanically established role/message provenance when available. If voice/fingerprint evidence is consulted, locate the existing project voice-model/fingerprint sources first and treat voice resemblance as supporting/inferential evidence rather than source authorship proof.

## Pickup sequence

1. Read current Mersearch release/platform/upgrade docs and implementation.
2. Inventory what already exists. Do not rebuild implemented machinery.
3. Implement only the smallest missing tranche that advances the targets above.
4. Preserve stable-release gating, exact corpus/ref/exclusion reporting and current quarantine boundaries.
5. Return a durable handoff stating implemented vs merely proposed behavior.

This note is intentionally a queue item, not authority to derail current theory/recreation lanes into a large infrastructure project.
