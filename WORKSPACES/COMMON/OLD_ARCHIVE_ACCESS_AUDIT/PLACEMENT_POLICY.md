# Old archive machinery / extraction placement policy

**Controlling directive — 2026-09-13**

`SAT_THEORY_ARCHIVE_2023-25` is the historical source archive. New durable ingestion hardware, accessibility audits, extraction stores, cross-reference machinery, and derived indexes should live in `Satobloc/HsH` unless a small repo-local component is genuinely required to operate on the old archive itself.

Any necessary new buildout inside `SAT_THEORY_ARCHIVE_2023-25` must follow that archive's institutional/admin documentation, including its request-driven Archive Admin pattern, logs, provenance, loop guards, and index-first/tag-second discipline.

Operational consequences:

1. **Old archive remains canonical for its historical source artifacts.** Do not move, rewrite, or normalize originals merely to make them easier to process.
2. **HsH becomes the preferred home for derived accessibility layers.** PDF text, OCR text, source-access manifests, terminology indexes, provenance cross-links, equation/theory indexes, and future ingestion tools should be stored here with source pointers back to the old archive.
3. **Existing old-repo extractions are migration candidates, not disposable duplicates.** Preserve source→extraction mappings, engine/status metadata, hashes where available, and extraction provenance when re-homing them.
4. **Old-repo machinery should be minimized, not abruptly removed.** Existing workflows may remain until HsH replacements are verified. Retire or reduce them only after equivalent functionality and provenance are confirmed.
5. **No unsanctioned direct buildout in the old archive.** If a repo-local change becomes necessary, read and follow `.[⚙️_AI_FILES]/ORIENTATION.txt`, `🪧_WAYFINDING.txt`, `INSTITUTIONAL_MAP.txt`, `RESOURCES.txt`, and `SHARED_RESOURCES/ARCHIVE_ADMIN_TASKS.md`, then use the documented request/log workflow.
6. **Audit before migration.** First establish what is natively readable, extracted, indexed, parser-dependent, or still opaque. Then migrate/rebuild derived layers into HsH without losing links to canonical originals.

The current accessibility audit in this folder is intentionally read-only against the old archive and commits all new machinery/results to HsH only.
