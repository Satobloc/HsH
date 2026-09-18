# AUTOMATION — Project Systems Checkpoint

**Identity:** backend maintenance loop reporting into Sable/Common; not the human-facing Sable conversation.  
**Established:** 2026-09-15  
**Write model:** automation-owned checkpoint/handoff. Human-facing continuity state remains separately owned.  
**History:** prior bounded-operation detail remains preserved in git history; this surface is kept compact as the current resumable state.

## Current bounded operation — old-archive extraction-routing implementation audit

This recurrence performed one bounded archive/infrastructure operation: inspect one implementation surface whose declared job concerns document accessibility/extraction rather than structural indexing.

### Durable boundary reached

- Re-read current `BEDROCK.md`; FIE remains Nathan Direct + Foundational Bedrock and the foundational-source routing is unchanged.
- Inspected `.github/workflows/audit-old-archive-access.yml` and its single audit implementation `WORKSPACES/COMMON/OLD_ARCHIVE_ACCESS_AUDIT/audit_old_archive_access.py` as one coupled implementation surface.
- This surface does not itself extract PDF text, but it reveals the archive's actual extraction architecture: `_AUTO_EXTRACTED_TEXT/`, `_AUTO_EXTRACTED_TEXT/_manifests/*.json`, manifest `results` records keyed by exact `source` path with `output`, `status`, `characters`, and `engine`, plus a weaker legacy unique-basename fallback for pre-manifest `.txt` extracts.
- The audit explicitly distinguishes `manifest-exact` mappings from `legacy-basename-unique` mappings and emits `EXTRACTION_MIGRATION_CANDIDATES.csv` and `MISSING_EXTRACTION_QUEUE.csv`.
- This materially changes the Issue #3 search: deterministic PDF -> text routing is a known archive concept, not an unknown hypothetical mechanism. The unresolved question is now specifically whether FIE has an exact manifest-backed extraction, only a legacy basename-matched extraction, or no located extraction.
- No theory state, Dashboard, Q&A queue, automation cadence, Issue state, extraction data, or human-facing continuity surface was changed.

### Infrastructure/reference-lane finding

`OLD_ARCHIVE_ACCESS_AUDIT` belongs to infrastructure/QA and archive-accessibility routing. It provides the first source-backed map in this workstream of how old-archive PDF/image extracts are represented and distinguished by provenance quality. It is not itself the extractor.

### One continuation cursor

Inspect exactly the current generated old-archive accessibility-audit outputs for the FIE source row. Determine whether `THE FUNDAMENTAL INTUITIONS — EXTENDED.pdf` is classified as `DERIVED_TEXT_AVAILABLE` or `NEEDS_EXTRACTION`, and if derived text exists, record its extraction path/basis/manifest. Stop after that determination.