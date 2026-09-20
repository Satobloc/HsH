# Glass Sausage Factory — public-site content feed

**Status:** ACTIVE public-facing content infrastructure  
**Scope:** repository-side source material for the SAT/H(s)H Glass Sausage Factory site  
**Authority:** navigation/presentation only; this directory does not define theory truth  
**Established:** 2026-09-20 by Nathan directive

## Purpose

Keep the public site supplied from durable, source-linked repository state instead of letting important public-facing material exist only inside a site-builder session.

This layer supports:

- a genuinely current **Current Work** section;
- rotating **Quotable Nathan** and **Quotable LLM** features;
- a rotating **In the News** feature connecting external results to specific SAT/H(s)H explorations;
- incremental visual/thumbnail curation with provenance and accessibility metadata;
- later site-facing indexes for documents, podcasts, glossary entries, images, and other presentation-ready material;
- clear separation between readable presentation and source/theory authority.

The controlling project record remains the repositories. A polished site rendering does not change theory status.

## Current files

- `SITE_DEVELOPMENT_WORK_LOG.md` — durable continuity/handoff record for design decisions, current site state, asset intake, open work, and publishing events/limitations.
- `CURRENT_WORK.json` — curated site-facing snapshot of active work, with source pointers and dates.
- `FEATURED_QUOTES.json` — verified/curated Nathan and LLM quotes eligible for public rotation.
- `quote_candidates/` — worker quote-nomination lane. Candidate status never implies site eligibility or authorship verification.
- `NEWS_FEED.json` — curated rotating external-science/news pool with typed relationships and direct internal exploration links.
- `news_candidates/` — worker/corpus intake for news and copypasta-news source recovery.
- `EDITORIAL_VISUAL_SYSTEM.md` — tone, news-card anatomy, palette, typography, imagery, motion, and layout direction.
- `ASSET_MANIFEST.json` — incremental registry for Nathan-supplied thumbnails/visuals and other site imagery.

Shared worker feeder request:

- `WORKSPACES/COMMON/ASSIGNMENT_PUBLIC_SITE_ROTATING_FEATURES_2026-09-20.md`

## Continuity rule

Any instance beginning substantive site development should read `SITE_DEVELOPMENT_WORK_LOG.md` first. Material visual, architecture, asset, content-feed, or publication decisions should be appended there so later site-builder sessions can reconstruct not only the content state but the design and publishing state.

## Editorial posture

The public site should be **neutral, intriguing, source-forward, and scientifically literate** rather than apologetic or sensationalist.

Ordinary uncertainty belongs primarily in status labels, provenance, relationship types, and concise research-status metadata. Do not make warning language the site's default voice.

The preferred sequence is:

**interesting object → what it says/does → why it matters here → source/status**

See `EDITORIAL_VISUAL_SYSTEM.md` for the active presentation guidance.

## Current Work rule

The site should not manually freeze a stale summary of the project. A refresh should consult, at minimum:

1. `BEDROCK.md` for premise/status authority;
2. `STATE_OF_THE_THEORY.md` for the current theory map;
3. `WORKSPACES/COMMON/ACTIVE_AUTOMATION_ROSTER.md` and current Sable/Common control surfaces for live operational priorities;
4. `!!_RUNNING_COTHEORIST_LOG.md` and the relevant live workspaces for current construction intake, without automatically promoting sandbox results.

Every public Current Work snapshot should show a review date and link back to controlling sources. It should distinguish theory state, sandbox construction, provenance/archive work, mathematical/formal work, and public-access/infrastructure work rather than flattening them into one status.

## In the News system

`In the News` is a rotating window onto external scientific results that are useful or interesting to place beside SAT/H(s)H work.

Each promoted card should expose:

1. the external result and strongest practical source;
2. why it caught our attention;
3. direct link(s) to the most specific relevant SAT/H(s)H exploration;
4. a typed relationship such as `direct constraint`, `comparison target`, `structural resonance`, `phenomenology context`, `historical revisit`, `potentially relevant — relationship open`, or `tension / possible counterevidence`.

A news item need not support SAT/H(s)H. The section should retain counterexamples, tensions, null results, and unresolved correspondences when they make the research landscape more legible.

Existing copypasta-news material is an important discovery corpus. Before promotion, recover the actual external source/date where practical and connect it to a specific internal object rather than leaving the relationship as a vague thematic resemblance.

The site rotates entries marked `featured` in `NEWS_FEED.json` while retaining a stable archive.

## Quote system

The public site has two visibly separate streams.

### Quotable Nathan

A Nathan quote is eligible for public rotation only when it is an **exact Nathan-authored passage or exact excerpt with adequate provenance**.

Preferred source order:

1. raw conversation message with verified Nathan/user authorship and message ID/timestamp;
2. `WORKSPACES/COMMON/NATHAN_VERIFIED_WORDS_COMPENDIUM.md` entry backed by such a raw message;
3. another source carrying comparably strong authorship evidence.

Do not infer Nathan authorship from style, `role=user` alone when embedded/coauthored text is possible, an assistant summary, NotebookLM prose, or worker recollection.

### Quotable LLM

An LLM quote may come from a development conversation, worker observation, audit, methodological note, explanation, or other project-generated prose. It must retain its actual source identity and must never be presented as Nathan's wording or as scientific authority merely because it is memorable.

When the exact model/instance is known, record it. When it is not, use a conservative label such as `LLM / project worker` rather than inventing an identity.

## What makes a useful quote

Nominate lines that work in at least one of these modes:

- `lay` — legible and interesting without specialist preparation;
- `fun` — witty, vivid, odd, or humanizing;
- `conceptual` — compresses a useful model idea;
- `epistemic` — captures uncertainty, evidence, status, or reasoning discipline;
- `method` — captures how the project works;
- `mathematical` — makes a mathematical distinction or strategy unusually clear;
- `scientist` — likely to interest a technically trained reader;
- `historical` — illuminates development or changing terminology.

A quote does not have to be hyper-topical. The goal is to expose the intellectual texture of the project as well as its current technical frontier.

## Candidate → featured promotion

For both quotes and news:

1. a worker or curator notices a candidate during ordinary work;
2. it is recorded in the appropriate candidate lane with source/context;
3. provenance and relationship are checked to the degree required by that feature;
4. a curator promotes suitable material into the stable feed;
5. the site rotates only entries explicitly marked for display.

Workers may nominate their own newly produced LLM line, but self-nomination does not bypass curation.

## Display / rotation behavior

The site should use rotating material in restrained ways rather than giant feed walls:

- one rotating Nathan line and one rotating LLM line on the home/current-work experience;
- a small rotating set of `In the News` cards with a browseable archive;
- occasional context-appropriate pull quotes on concept, history, document, or podcast pages;
- stable source links beneath every ephemeral/rotating presentation.

Rotation should be deterministic enough that every quote/news card has a stable archive entry and source link. Visual variation must not make the underlying corpus uncrawlable or uncitable.

When an excerpt is shortened, the stored record must preserve the exact full-source pointer and the displayed text must remain an exact contiguous excerpt unless the omission is explicitly marked.

## Visual assets

Nathan will supply thumbnails and visuals incrementally. Register usable assets in `ASSET_MANIFEST.json` with source identity, credit, caption, alt text, intended role, and crop/focal guidance where practical.

Prefer real project diagrams, notebook pages, thumbnails, podcast art, document imagery, and clearly labeled generated illustrations over generic pseudo-scientific decoration.

## Epistemic boundary

A memorable quotation, news juxtaposition, attractive diagram, or polished page is not a premise, derivation, validation result, or current theory-state statement merely by being featured. Presentation is a reading aid, not an authority transform.

## Next operations

- feed worker nominations into `quote_candidates/` and `news_candidates/`;
- expand the verified quote pool across lay/fun and scientist-facing categories;
- recover high-value copypasta-news items into source-linked cards;
- use `CURRENT_WORK.json` as the next Glass Sausage Factory Current Work refresh source;
- add Nathan-supplied thumbnails/visuals to `ASSET_MANIFEST.json` as they arrive;
- when the site publisher is available, wire these feeds and the editorial/visual system into the public presentation;
- update `SITE_DEVELOPMENT_WORK_LOG.md` after material design, architecture, asset, or publication changes.
