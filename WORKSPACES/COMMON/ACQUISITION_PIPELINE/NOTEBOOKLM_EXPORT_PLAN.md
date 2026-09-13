# NotebookLM / Gemini Notebook archival-export plan

**Goal:** recover a notebook as a provenance-preserving research packet: notebook metadata, chat, source inventory, recoverable source originals/links, notes, reports, tables, audio/video artifacts, and explicit gaps.

## Current documented export surfaces

Google's current Notebook/Gemini Notebook help documents several partial export paths rather than one complete notebook archive:

- notebook reports can be exported to Google Docs;
- data tables can be exported to Google Sheets;
- Audio Overviews can be downloaded;
- notebooks can be shared, and public consumer notebooks can expose a share link;
- Gemini chats associated with a notebook can appear as read-only context/sources in NotebookLM/Gemini Notebook.

A comprehensive documented one-click export containing the complete NotebookLM chat + all source blobs + all Studio artifacts is not currently identified in the official help surface. Google Takeout should therefore be tested as an account-level backup source, but it should not be assumed to be complete until we inspect an actual export.

## Export packet target

```text
NOTEBOOK_<id-or-slug>/
  NOTEBOOK.json
  CHAT/
    chat_raw_capture.html
    chat.md
  SOURCES/
    source_manifest.csv
    source_manifest.json
    DRIVE_ORIGINALS/
    WEB_SNAPSHOTS_OR_LINKS/
    UPLOADED_SOURCE_RECOVERY/
  NOTES/
  REPORTS/
  TABLES/
  AUDIO/
  VIDEO/
  OTHER_STUDIO/
  PROVENANCE/
    acquisition_log.json
    missing_or_unrecoverable.csv
  README.md
```

## Recovery strategy

### Pass 1 — account-level backup

Request/test Google Takeout and preserve the untouched archive. Record exactly what Notebook/Gemini Notebook material appears. Do not normalize it before hashing and inventory.

### Pass 2 — browser notebook manifest

A local browser userscript/extension should read the open notebook UI and capture:

- notebook title and visible notebook identifier/URL;
- source titles, source types, visible URLs/Drive links, and selected/unselected state;
- custom instructions where visible;
- note/report/table/artifact titles;
- share URL if one exists;
- visible timestamps/metadata.

This pass is metadata capture; it should not claim source bytes were recovered merely because a source is listed.

### Pass 3 — chat capture

Capture the complete currently accessible notebook chat by scrolling/loading all history, then save both:

- raw DOM/HTML capture for audit;
- normalized Markdown preserving user/model turn order and citations/links where recoverable.

If chat history is only partially loaded or inaccessible, record the gap explicitly.

### Pass 4 — source recovery

Route by source type:

- **Google Drive source:** recover original from Drive using its stable Drive identity where available.
- **Web source:** retain canonical URL, title, captured metadata, and optionally an archival snapshot where legally/technically appropriate.
- **YouTube/audio source:** retain URL/metadata; do not duplicate media unless the source is owned/locally available and ingestion policy permits it.
- **Local uploaded file:** prefer the user's original local file when available; otherwise attempt Notebook/Takeout recovery and mark whether the recovered object is byte-identical or merely a rendered/derived copy.
- **Copied text:** preserve the Notebook source text directly if accessible.

### Pass 5 — Studio artifacts

Use documented native exports/downloads first:

- Reports → Google Docs;
- Data tables → Google Sheets;
- Audio Overviews → downloaded audio;
- other downloadable artifacts → original downloaded format;
- notes/chat responses → direct text/DOM capture where no bulk native export exists.

## Automation boundary

The browser exporter should use visible UI/DOM and ordinary user-accessible downloads where possible. Undocumented private endpoints may be inspected for debugging but should not become the only preservation path because they can change without notice.

## Deduplication

Every recovered file is SHA-256 hashed and checked against HsH/old-archive manifests. Source titles and filenames alone are not sufficient for duplicate detection.

The intake layer should distinguish:

- `EXACT-DUPLICATE`
- `SAME-SOURCE-DIFFERENT-REVISION`
- `DERIVED-FROM-SOURCE`
- `LINK-ONLY`
- `UNRECOVERED-SOURCE`

## Next implementation

Prototype a Chrome userscript for one test notebook that exports source manifest + chat + artifact inventory. Compare its output to one Google Takeout notebook record before scaling to all notebooks.
