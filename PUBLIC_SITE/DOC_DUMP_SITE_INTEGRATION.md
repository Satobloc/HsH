# Glass Sausage Factory — Document Dump → Sites Integration

**Status:** ACTIVE Sites integration rule  
**Scope:** cross-project document/reconstruction feeds consumed by Sites

## Consumer rule

When a reconstructed document project exposes a stable `latest.json` / `site-bundle.json`, **read that bundle before treating the source PDFs as the website information architecture**.

The normal hierarchy is:

`latest.json -> site-bundle.json -> story/index/editorial feeds -> source PDFs`

- `site-bundle.json` defines the current website experience, routes, renderable entities, available views, and explicit build instructions.
- project story/entity indexes expose current reader-ready objects and stable routes.
- editorial overlays supply reviewed/provisional interpretive structure where used.
- source/page feeds supply deterministic reconstruction records.
- source PDFs remain canonical facsimiles and fallbacks.

A PDF viewer is therefore a source view, not the automatic primary presentation when a valid editorial site bundle exists.

## flc current benchmark

`flc` / `floating liars' club` now has a public main-branch story-text tunnel in `Satobloc/SAT_THEORY_ARCHIVE_2023-25`:

- backend entry point: `flc/_SITE_FEED/latest.json`
- site contract: `flc/_SITE_FEED/site-bundle.json`
- story index: `flc/_SITE_FEED/story-index.json`
- story records: `flc/_SITE_FEED/stories/<slug>.json`
- reference consumer: `flc/_SITE_FEED/frontend-consumer-reference.js`

The frontend must use the **absolute URLs returned by the feed** rather than resolving backend-relative paths against the `chatgpt.site` origin.

As of the first working story-feed pass, the backend knows 22 stories and exposes machine-derived text records for the seven stories in the October 2002 inaugural issue. Those records are provisional and may be partial; source/facsimile remains beside them. The purpose of this pass is to establish the live reader route, not to claim completed transcription.

Expected frontend behavior:

1. fetch public `latest.json` fresh on page load;
2. follow its absolute `story_index_url`;
3. merge story state by stable id/slug into issue contents;
4. when `text_url` is present, link title/byline to `/stories/<slug>/`;
5. the story route fetches the story JSON and renders `display_text` with provisional status and facsimile control;
6. `/reconstruction-status/` exposes backend build time/counts, URL actually fetched, and live-vs-fallback state.

Do not silently fall back to a generic PDF shelf when this feed is reachable.

The earlier PR #6 `flc/_RECONSTRUCTION_V1/` feed remains useful for page/facsimile reconstruction work; `_SITE_FEED/` is now the clearer frontend-facing live tunnel.

## General contract

The reusable reconstruction-side contract lives in private working infrastructure at:

`Satobloc/HSH_RESOURCES/MAG_RECON/DOC_DUMP_TO_SITE_INTEGRATION.md`

Sites should report missing fields, awkward entity boundaries, route/template problems, and reusable consumer capabilities through the relevant private Sites comm line rather than silently falling back to a generic PDF shelf.
