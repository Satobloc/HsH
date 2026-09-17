# AUTOMATION — Project Systems Checkpoint

**Identity:** backend maintenance loop reporting into Sable/Common; not the human-facing Sable conversation.  
**Established:** 2026-09-15  
**Write model:** automation-owned checkpoint/handoff. Human-facing continuity state remains separately owned.  
**History:** prior bounded-operation detail remains preserved in git history; this surface is kept compact as the current resumable state.

## Current bounded operation — HsH structural index implementation audit

This recurrence performed one bounded archive/infrastructure operation: inspect one next plausible indexing implementation surface to determine whether it reads PDF bytes or emits machine-readable document text.

### Durable boundary reached

- Re-read current BEDROCK before operating; FIE remains Nathan Direct + Foundational Bedrock and the foundational-source routing remains unchanged.
- Inspected `tools/index_archive.py`, the current HsH deterministic structural-index implementation.
- Its own module contract says it builds structural indexes only; locally it recursively enumerates paths and computes SHA-256 by streaming raw file bytes, while GitHub-tree mode consumes path/type/size/SHA metadata.
- The implementation groups entries by path, extension, top-level area, structural role, and duplicate content ID, then emits `indexes/STRUCTURAL_INDEX.md` and `indexes/index-state.json`.
- It does not parse PDF document structure, extract PDF text, emit machine-readable document text, or record a PDF -> extracted-text mapping. Reading raw bytes for hashing is not content extraction.
- Therefore `tools/index_archive.py` is also ruled out as the FIE machine-readable extraction mechanism required by Issue #3.
- No theory state, Dashboard, Q&A queue, automation cadence, Issue state, extraction pipeline, or human-facing continuity surface was changed.

### Infrastructure/reference-lane finding

`tools/index_archive.py` belongs to archive/infrastructure structural cataloguing. Together with the previously inspected archive folder indexer, two distinct index-generation mechanisms are now explicitly ruled out as PDF full-text extraction routes. Issue #3's FIE PDF -> complete machine-readable-text acceptance case remains unresolved.

### One continuation cursor

Rotate away from indexers. Inspect exactly one implementation surface whose name or declared contract plausibly concerns document-content conversion/extraction rather than structural indexing. Determine whether it accepts PDFs or emits complete machine-readable document text; stop after that determination.