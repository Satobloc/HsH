# Glass Sausage Factory — Document Dump → Sites Integration

**Status:** ACTIVE Sites integration rule  
**Scope:** cross-project document/reconstruction feeds consumed by Sites

## Consumer rule

When a reconstructed document project exposes a stable `latest.json` / `site-bundle.json`, **read that bundle before treating the source PDFs as the website information architecture**.

The normal hierarchy is:

`latest.json -> site-bundle.json -> editorial-overlay.json + site-feed.json -> source PDFs`

- `site-bundle.json` defines the current website experience, routes, renderable entities, available views, and explicit build instructions.
- `editorial-overlay.json` supplies the current reviewed/provisional editorial structure.
- `site-feed.json` supplies deterministic source/page/reconstruction records.
- source PDFs remain canonical facsimiles and fallbacks.

A PDF viewer is therefore a source view, not the automatic primary presentation when a valid editorial site bundle exists.

## FLC current benchmark

The current FLC reconstruction proposal lives in `Satobloc/SAT_THEORY_ARCHIVE_2023-25`, PR #6, branch `codex/flc-reconstruction-feed`, under:

`flc/_RECONSTRUCTION_V1/`

The stable entry point is:

`latest.json -> site-bundle.json`

The bundle requests a collection home, three issue pages, known contents/bylines, reconstruction status, facsimile/page atlas, and best-guess/source switching. Dedicated story reading routes remain held until page-span mapping is reviewed.

## General contract

The reusable reconstruction-side contract lives in private working infrastructure at:

`Satobloc/HSH_RESOURCES/MAG_RECON/DOC_DUMP_TO_SITE_INTEGRATION.md`

Sites should report missing fields, awkward entity boundaries, route/template problems, and reusable consumer capabilities through the relevant private Sites comm line rather than silently falling back to a generic PDF shelf.
