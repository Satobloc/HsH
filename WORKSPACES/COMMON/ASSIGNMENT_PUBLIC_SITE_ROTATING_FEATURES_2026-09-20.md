# Assignment — public-site feeder and rotating feature harvest

**Date:** 2026-09-20; expanded 2026-09-21 by Nathan directive  
**From:** Nathan directive, implemented by current working instances  
**To:** all current workers  
**Status:** ACTIVE standing low-overhead request  
**Scope:** general worker→Glass Sausage Factory update packets plus `Quotable Nathan`, `Quotable LLM`, and `In the News` candidate harvesting  
**Cadence:** no new recurrence; nominate opportunistically during ordinary work

## Purpose

The public site should expose some of the intellectual texture of the live project rather than only static summaries. Workers are therefore invited to flag unusually good quotations and external scientific results encountered during their existing work, and to hand off genuinely useful diagrams, documents, concept changes, current-work results, and cross-links without waiting for a dedicated Sites worker.

This is a feeder assignment, not a new primary lane and not a reason to interrupt higher-value work.

## General worker → site update packets

When ordinary work produces a public-facing object that is richer than a quote/news nomination, use the generic live-influx lane:

`PUBLIC_SITE/live_influx/`

For a machine-readable plug-n-play handoff, prefer:

`PUBLIC_SITE/live_influx/packets/`

Packet contract:

`PUBLIC_SITE/live_influx/packets/README.md`

Common collision-safe emitter:

`WORKSPACES/COMMON/scripts/emit_public_site_update_packet.py`

Good packet candidates include:

- Class-P or Class-H geometric/mathematical figures with durable source paths;
- a bounded solver/formalization result that deserves Current Work visibility;
- a new or clarified concept that should update several public surfaces;
- a presentation-ready document, code artifact, historical source, or archive find;
- a useful cross-link among glossary, Reading Room, claims explorer, podcast, current work, or solver pages;
- a public-facing workflow/infrastructure development worth exposing.

A packet should preserve exact source pointers, intended site destinations, current/sandbox/historical status, and visual provenance. Packet status such as `ready` means ready for site/editorial intake only; it never promotes theory status.

The active worker housewheel owns **feeding** this lane opportunistically. A dedicated Sites recurrence is not required. Actual live-site editing/publication remains a separate site-builder/editor action and must never be claimed merely because a repository packet exists.

## Visual handoff rule

For project geometry and mathematical visuals, preserve the standing hierarchy:

- `P` — script-drawn / exact precision artifact from explicit geometry or parameters;
- `H` — controlled hybrid built on P or exact computational output;
- `I` — illustrative render.

Class I has no geometric authority unless it is explicitly downstream of P or H; otherwise it is only a doodle. Public-site packets should carry the visual class and source ancestry when relevant.

## Quote harvest

We want both:

- interesting, funny, vivid, or lay-reader-legible lines, including material that is not narrowly about the current frontier;
- deeper scientist-facing lines: epistemic discipline, mathematical distinctions, model-building method, dimensional thinking, provenance, uncertainty, conceptual compression, corrections, and technically interesting observations.

A quote need not praise SAT/H(s)H. Criticism, a failed-idea remark, a methodological caution, a correction, or a good joke may be more revealing than promotional language.

### Quotable Nathan

Nominate only exact Nathan wording or an exact contiguous excerpt.

Preserve:
- exact source path/conversation;
- message ID/timestamp when available;
- enough context to prevent a misleading extraction;
- historical/current/superseded status when relevant.

`WORKSPACES/COMMON/NATHAN_VERIFIED_WORDS_COMPENDIUM.md` is the preferred existing substrate when it already contains the passage. If authorship is not sufficiently verified, mark the candidate `needs-check`; do not promote by style or confidence.

When a Nathan-direct source carries Nathan's reserved signet, preserve that fact in metadata only as `[OWL]`; workers must not reproduce the signet itself.

### Quotable LLM

Nominate strong assistant/worker/model lines from conversations, reports, audits, current work, or the worker's own newly produced prose.

Record the exact model/instance when known. If not known, use a conservative `LLM / project worker` label rather than inventing identity.

LLM wording never becomes Nathan wording or theory authority through repetition or display.

### Quote destination

Candidate schema and collision-safe intake:

`PUBLIC_SITE/quote_candidates/README.md`

Curated public pool:

`PUBLIC_SITE/FEATURED_QUOTES.json`

## In the News harvest

The site is also establishing a rotating **In the News** feature.

Nominate external results that make the SAT/H(s)H record interesting to revisit or provide a useful constraint/comparison surface, including:

- surprising or eyebrow-raising measurements;
- new observations bearing on active project questions;
- mathematical/topological developments with a clear internal touchpoint;
- results that reopen an older SAT/H(s)H exploration;
- negative/null results or tensions;
- material already present in project copypasta-news dumps that deserves source recovery and a public-facing card.

Do not ask whether the story `proves SAT`. Ask instead:

1. what actually happened externally;
2. why it caught our attention;
3. what exact SAT/H(s)H exploration is relevant;
4. what relationship type is supportable.

Preferred relationship labels include `direct constraint`, `comparison target`, `structural resonance`, `phenomenology context`, `historical revisit`, `potentially relevant — relationship open`, and `tension / possible counterevidence`.

### News destination

Candidate schema and copypasta-recovery guidance:

`PUBLIC_SITE/news_candidates/README.md`

Curated rotating feed:

`PUBLIC_SITE/NEWS_FEED.json`

## Editorial stance

The public presentation should be neutral/intriguing rather than apologetic or sensationalist.

Status and uncertainty remain explicit, but ordinary caveats belong primarily in relationship labels, provenance, and concise research-status metadata rather than repeated defensive prose.

See:

`PUBLIC_SITE/EDITORIAL_VISUAL_SYSTEM.md`

## Worker bite

A nomination or structured packet should normally be a tiny side-effect of work already being done: one useful public-facing object, exact source pointers, and enough status/presentation metadata for the site builder to act. Do not turn every recurrence into public-site curation.
