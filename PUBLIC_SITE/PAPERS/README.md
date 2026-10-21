# Automatic papers and ordered addenda

Every registered paper has an automatic follow-up lane. Publish a typeset PDF plus metadata; the website renders the PDF pages continuously, then every published addendum in order. No Sites edit or intake packet is needed.

## New paper

Create `PUBLIC_SITE/PAPERS/<paper-id>/paper.json` and put its PDF in the same folder. Use the paper template in `_templates/`. IDs are lowercase hyphenated slugs. All file paths in metadata are **repository-root-relative**, not relative to the JSON file. Commit the PDF, source (if provided), and metadata together.

Required metadata: `schema_version: 1`, `id`, `title`, `authors` (list), `date` (YYYY-MM-DD), `status`, `preface` (short plain-English orientation), `pdf` (repository path), and `published` (boolean). `source` is optional. The paper ID must match its folder. `reader_id` optionally associates an existing curated Sites reading entry; do not reuse another paper's ID.

`published: false` is a draft and never enters the index. Set it to `true` to authorize public website display. Publication does not confer external review or a stronger scientific status. Keep the exact version/status in the PDF and metadata.

## Addendum / follow-up

Create two files under `PUBLIC_SITE/PAPERS/<paper-id>/addenda/`:

- `001-<addendum-id>.pdf` — complete, typeset, visually checked PDF.
- `001-<addendum-id>.json` — metadata using the addendum template.

Use the same fields as a paper, plus `parent_id` matching the parent paper ID and a unique positive integer `sequence`. These determine placement, not filename, upload time or title. Sequence gaps are fine. Addenda retain their own authors, date, preface and status. Published IDs and sequences must be unique within the paper. Never overwrite earlier addenda to silently rewrite their history; use another sequence for a correction or follow-up.

For Crullerverse the parent ID is `cruller-rubin`; the first addendum uses sequence 1. Its stable site URL is `https://glass-sausage-factory.nathanmcknight.chatgpt.site/reader.html?doc=cruller-rubin`. New papers use `https://glass-sausage-factory.nathanmcknight.chatgpt.site/reader.html?paper=<paper-id>`.

## What happens automatically

1. A push touching these packets or SAT_VISUALS triggers `.github/workflows/publish-paper-series.yml`.
2. `python tools/publish_papers.py` validates published metadata, paths, PDF completeness, page readability and sequence uniqueness. A failed run keeps the last good public index. Validation errors are visible in the Action log; fix and commit again.
3. The workflow commits `PUBLIC_SITE/generated/papers.json`, pinned to the source revision containing the PDFs. An open reader checks every 30 seconds while visible; new follow-ups are appended below the existing paper, without moving the reader's scroll position. The Papers shelf and reading-room index discover registered papers from the same feed.

Publication is automatic **after the Action completes**, not instantaneous at GitHub commit time. Allow workflow/CDN propagation. The reader shows its last-check state, offers Refresh, and retains the last good content during outages. There is also an hourly recovery run and manual workflow dispatch.

## PDF and mathematics contract for saving LLMs

Typeset the paper/addendum before publication, preferably with LaTeX/RevTeX for mathematics. Include a short audience-calibrated plain-English preface; respect page margins, boxes and equation breaks. Render and inspect every page. Keep selectable text so Listen can read the entire series. A raster-only scan needs OCR before useful audio.

The indexer **does not convert raw Markdown/TeX into a polished PDF** and will not publish those as substitutes. Do not claim visual review, calculation, external review or publication you have not performed. Source files can accompany the PDF for provenance; normal site links go through the reader. Only explicit Raw PDF buttons open original bytes.

Local check before committing: `python tools/publish_papers.py --check`. Publication command: `python tools/publish_papers.py`. Never hand-edit the generated index.
