# Public Library tagging guide

`library_manifest.toml` is a sidecar index for material worth exposing through the public H(s)H library. The historical SAT archive remains unchanged and remains the source of truth.

The intended workflow is simple:

1. Encounter a strong document or passage in the historical archive.
2. Add one manifest entry with an exact source path.
3. Mark it `candidate`, `showcase`, `excerpt`, or `raw_pick`.
4. Run `python tools/build_public_library.py --check` to validate paths and line ranges.
5. Run `python tools/build_public_library.py --write` to rebuild the public library index and generated verbatim presentation pages.

## Selection states

- `showcase` — a standout document suitable for the curated public library.
- `excerpt` — a selected passage from a much larger document or log.
- `raw_pick` — a worthwhile raw source exposed with minimal editorial framing.
- `candidate` — tagged for later review; not shown on the public library page.

## Source fidelity

Generated pages are deliberately conservative. They add presentation metadata, source links, and navigation around the historical text, but the source body itself is preserved verbatim after newline normalization. The renderer does not silently rewrite sentences, equations, or terminology.

For a paper or essay that deserves a more polished hand-formatted presentation, set `render = "manual"` and create a curated Markdown page separately. The original archive link should still remain prominent.

## Whole documents

```toml
[[documents]]
id = "short-stable-id"
title = "Human-readable title"
source_path = "2026/example.txt"
date = "2026-03"
phase = "4DHH"
categories = ["geometry", "foundations"]
selection = "showcase"
render = "verbatim"
note = "One-sentence public orientation."
```

## Excerpts

Ranges are 1-based and inclusive. Multiple passages from one source may be collected on the same generated page.

```toml
[[documents]]
id = "photoneutrino-excerpt"
title = "Photoneutrino development"
source_path = "2026/example-long-log.txt"
date = "2026-03"
phase = "4DHH"
categories = ["particles", "development"]
selection = "excerpt"
render = "verbatim"
note = "Selected developmental passage."

  [[documents.ranges]]
  start = 820
  end = 1040
  label = "Photoneutrino construction"
```

## What not to encode here

Do not use the manifest to declare correctness, priority, or present-day canonicity. It is a selection and presentation index. Those judgments belong in explicit editorial notes, provenance/status records, or later audit work.
