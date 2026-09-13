# Offline acquisition / ingestion pipeline

**Status:** active infrastructure plan  
**Date:** 2026-09-13

## Controlling repository rule

`SAT_THEORY_ARCHIVE_2023-25` remains the canonical historical source archive. `HsH` is the preferred home for ingestion tools, derived text, indexes, cross-links, queues, manifests, and automation.

Do **not** maintain a second persistent clone of the old archive as a competing source tree. A temporary CI checkout used to inspect files is disposable implementation detail only. Normal HsH-side integration should use source pointers plus incremental change detection against the canonical old repository.

If a historical raw artifact is newly recovered offline, it can be staged through an HsH intake queue and then routed to its canonical historical location under the old archive using that archive's documented Archive Admin process. HsH should retain the intake manifest, hash, provenance, and derived processing outputs.

## Acquisition lanes

### A. ChatGPT conversations

Two complementary paths:

1. **Official account export — bulk baseline / periodic snapshot.**
   - ChatGPT Data Export supplies chat history in `conversations.json` or numbered conversation JSON files for large exports, plus related assets/account data.
   - Best for complete bulk recovery.
   - Weaknesses: not selective, asynchronous, not an incremental sync mechanism.

2. **Local selective conversation picker — search + multi-select.**
   - Parse the official export locally.
   - Build a full-text index of title + message text.
   - Present searchable results with checkboxes.
   - Export selected conversations as preserved raw JSON plus readable Markdown into the HsH intake queue.
   - This avoids dependence on ChatGPT's changing web DOM and keeps source data local.

3. **Incremental browser helper — later phase.**
   - A userscript/browser extension may add checkboxes to ChatGPT search/sidebar results and batch-capture selected currently accessible conversations between full account exports.
   - Treat this as a convenience layer because the web UI can change.
   - Do not rely on undocumented internal endpoints as the sole archival path.

There is currently no documented consumer ChatGPT API that exposes the user's ChatGPT sidebar/history for direct server-to-server archival. The official export remains the durable bulk source.

### B. Offline file batch intake

Target workflow:

`local folder → hash/deduplicate → manifest → HsH INBOX → classification/extraction/indexing → canonical routing`

A local utility should:

- accept one or more files/directories by drag/drop or path;
- recurse directories while preserving relative paths;
- compute SHA-256 and byte size;
- detect exact duplicate content already known to the intake manifest;
- preserve original filename and filesystem modified time as evidence, without treating filesystem time as authoritative creation date;
- stage files into a dated batch under an HsH intake folder;
- write a machine-readable manifest before upload;
- optionally run `git add/commit/push` from a configured HsH checkout;
- flag files over GitHub's normal size limits rather than silently failing;
- never rename or normalize source files destructively;
- allow later routing to the old archive through its Archive Admin procedures when a recovered artifact belongs there canonically.

A watch-folder mode can be added after the one-shot uploader is proven stable.

### C. NotebookLM / Gemini Notebook recovery

No single documented one-click full-notebook archival format currently covers chat + source bin + all generated artifacts. Use a layered exporter:

1. **Google Takeout snapshot** — test and retain as account-level backup where Notebook data is included.
2. **Notebook manifest scraper** — notebook title/id, source list, source type, URLs/Drive IDs where visible, instructions, timestamps where available.
3. **Chat capture** — export/scrape the full visible notebook chat into raw HTML/JSON-like capture plus normalized Markdown.
4. **Studio artifact harvest** — reports exported to Google Docs, data tables to Sheets, downloadable Audio Overviews, and other downloadable artifacts.
5. **Source recovery** — for Drive-backed sources, retrieve the actual Drive originals independently; for web sources, preserve URL + captured metadata; for uploaded-only source blobs, preserve whatever Notebook/Takeout exposes and flag anything not recoverable.

The exporter should never assume the Notebook copy of a source is the canonical original when a Drive/local original exists.

### D. Podcast / public-exposure corpus

Build a public episode guide from transcripts, episode metadata, thumbnails, statistics, and Spotify/RSS links. This becomes both a reader-facing guide and a provenance surface for earliest public explanations.

## Intake batch structure

Suggested HsH path:

```text
INGEST/
  INBOX/
    YYYY-MM-DD_<source>_<batch-id>/
      RAW/
      manifest.json
      manifest.csv
      README.md
  PROCESSED/
  DERIVED_TEXT/
  QUARANTINE/
  LOGS/
```

The intake manifest should minimally record:

`batch_id, source_system, original_path_or_id, staged_path, sha256, bytes, original_filename, filesystem_mtime, acquired_utc, provenance_notes, canonical_destination_status, duplicate_of, processing_status`

## Incremental old-archive synchronization

HsH should not duplicate the entire old archive. Instead maintain a source-state ledger:

`old_repo_path, blob_sha, last_seen_commit, content_type, accessibility_state, extraction_state, HsH_derived_paths`

On each scheduled or manual sync:

1. fetch the old repository tree/commit state;
2. compare path + blob SHA against the previous ledger;
3. ingest only added/changed source artifacts;
4. mark deletions/moves without deleting prior provenance;
5. trigger extraction/indexing only for affected sources;
6. update HsH cross-links and accessibility coverage.

This gives us a continuously current HsH knowledge layer without maintaining a second authoritative copy of the archive.
