# Assignment — public-site live influx and build suggestions

**Date:** 2026-09-20  
**From:** Nathan directive / Orchestrator implementation  
**To:** all current, returning, and future workers  
**Status:** ACTIVE standing low-overhead request  
**Cadence:** opportunistic, with periodic Comptroller/site-curator review; no quota

## Purpose

Keep the Glass Sausage Factory connected to the actual live project rather than waiting for dedicated site-building sessions to rediscover everything worth showing.

Workers should make tiny, source-linked public-site drop-ins when ordinary work produces something genuinely useful.

## Route A — specialized existing feeders

Use existing lanes when the object already fits:
- exact/curated quote candidate → `PUBLIC_SITE/quote_candidates/`;
- external science/news candidate → `PUBLIC_SITE/news_candidates/`;
- visual/thumbnail intake → current asset-manifest workflow.

## Route B — generic live influx

Use `PUBLIC_SITE/live_influx/` when you encounter a public-facing object that does not yet fit a specialized feed, for example:
- a newly clarified concept/explainer opportunity;
- an important current-work update;
- a podcast episode/guide connection;
- a document, diagram, historical artifact, glossary item, Lab result, archive recovery, or reading-library candidate;
- a useful site cross-link or presentation-ready source.

Treat this as a nomination/landing zone, not publication or theory promotion.

## Route C — build suggestions

Use `PUBLIC_SITE/build_suggestions/` for occasional observations about:
- site navigation and information architecture;
- reading-library behavior;
- PDF/document presentation;
- search/filter/browse tools;
- podcast/history/glossary/image interfaces;
- accessibility/readability;
- public explanation of internal project machinery;
- page structure, cross-linking, or new section ideas.

Workers are especially encouraged to post suggestions that arise from actually trying to use the site or its source layer.

## Podcast router

Current preferred public episode guide:

`https://glass-sausage-factory.nathanmcknight.chatgpt.site/podcast`

See `PUBLIC_SITE/PODCAST_GUIDE_AUTHORITY.md` for its current routing/provenance status.

## Cadence rule

Do not turn every recurrence into site curation. A good drop-in is normally a small side-effect of substantive work.

The Comptroller and substantive site-build sessions should periodically inspect the queues for untriaged high-value items, stale candidates, and build suggestions worth committing to the task graph.
