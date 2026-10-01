# Cross-repo Visual Catalog

Purpose: inventory, deduplicate, tag, and triage images across the three SAT/H(s)H repositories without moving or renaming source files.

## Source repositories

- `Satobloc/HsH`
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- `Satobloc/HSH_RESOURCES`

The source repositories remain authoritative storage. This catalog is an index/review layer only.

## Pipeline

1. Inventory all common image formats in the three repositories.
2. Record cheap objective metadata: repo/path/name, bytes, dimensions, aspect/shape, SHA-256, perceptual dHash.
3. Group exact duplicates by SHA-256 and near-duplicates by perceptual hash distance.
4. Preserve directory/filename clues as suggestions, never as human-confirmed semantics.
5. Review thumbnail cards in `app/index.html`.
6. Export Nathan's review decisions as JSON.
7. Merge reviewed decisions into `derived/visual_catalog.jsonl` in a later ingestion step.

## Tag axes

These are deliberately independent. An image can be a notebook sketch + H(s)H + historical + explanatory + publishable at the same time.

- `what`: diagram, photograph, notebook, generated_art, screenshot, podcast_art, chart, ui, document_scan, other, unknown
- `topic`: SAT, H(s)H, ᚼ, torus, cosmology, particle, podcast, archive_process, other, unknown
- `role`: explanatory, historical, source_evidence, decorative, website_flavor, thumbnail_candidate, gallery, internal_only, unknown
- `style`: technical, hand_drawn, photoreal, infographic, schematic, abstract, text_heavy, other, unknown
- `display`: publish, candidate, hold, private, duplicate, junk, unreviewed

Every semantic value also carries provenance where applicable: `machine_suggested`, `path_derived`, `Nathan_confirmed`, or `source_confirmed`.

## Review philosophy

The default human action should be one click:

- accept suggestion
- correct
- skip/unsure
- no display

Coarse triage comes before detailed tagging. Duplicate families should be reviewed as families whenever possible.

## Files

- `build_catalog.py` — cross-repo scanner/deduper
- `app/index.html` — interactive review UI; decisions persist locally and can be exported
- `schema.json` — canonical record schema
- `derived/visual_catalog.jsonl` — generated catalog
- `derived/review_data.json` — compact browser payload

The existing `tools/visual_archaeology/` machinery may contribute optional measurements later, but it is not the authority or center of this catalog.
