# Glass Sausage Factory — public-site content feed

**Status:** ACTIVE public-facing content infrastructure  
**Scope:** repository-side source material for the SAT/H(s)H Glass Sausage Factory site  
**Authority:** navigation/presentation only; this directory does not define theory truth  
**Established:** 2026-09-20 by Nathan directive

## Purpose

Keep the public site supplied from durable, source-linked repository state instead of letting important public-facing material exist only inside a site-builder session.

This layer is intended to support:

- a genuinely current **Current Work** section;
- rotating **Quotable Nathan** and **Quotable LLM** features;
- later site-facing indexes for documents, podcasts, glossary entries, images, and other presentation-ready material;
- clear separation between readable presentation and source/theory authority.

The controlling project record remains the repositories. A polished site rendering does not promote theory status.

## Current files

- `CURRENT_WORK.json` — curated site-facing snapshot of active work, with source pointers and dates.
- `FEATURED_QUOTES.json` — verified/curated quotes eligible for public rotation.
- `quote_candidates/` — worker nomination lane. Candidate status never implies site eligibility or authorship verification.

## Current Work rule

The site should not manually freeze a stale summary of the project. A refresh should consult, at minimum:

1. `BEDROCK.md` for premise/status authority;
2. `STATE_OF_THE_THEORY.md` for the current theory map;
3. `WORKSPACES/COMMON/ACTIVE_AUTOMATION_ROSTER.md` and current Sable/Common control surfaces for live operational priorities;
4. `!!_RUNNING_COTHEORIST_LOG.md` and the relevant live workspaces for current construction intake, without automatically promoting sandbox results.

Every public Current Work snapshot should show a review date and link back to controlling sources. It should distinguish theory state, sandbox construction, provenance/archive work, mathematical/formal work, and public-access/infrastructure work rather than flattening them into one status.

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

1. A worker notices a candidate in a conversation/source or in its own current work.
2. It writes a small candidate record under `PUBLIC_SITE/quote_candidates/`, preferably one file per worker/date/bite to reduce write collisions.
3. Candidate record includes exact text, speaker class, source pointer, date/message ID when available, context, audience tags, and why it is worth surfacing.
4. Nathan quotes receive authorship/provenance verification before promotion.
5. LLM quotes receive source verification and a conservative model/worker label.
6. A curator promotes suitable entries into `FEATURED_QUOTES.json`.
7. The site rotates only `featured` entries.

Workers may nominate their own newly produced line, but self-nomination does not bypass curation.

## Display / rotation behavior

The site should use approved quotes in several restrained ways rather than one giant quote wall:

- one rotating Nathan line and one rotating LLM line on the home/current-work experience;
- occasional context-appropriate pull quotes on concept, history, document, or podcast pages;
- a browseable quote archive for readers who want the full set.

For accessibility, reproducibility, and indexing, rotation should be deterministic enough that every quote has a stable archive entry and source link. Random visual rotation must not make the underlying corpus uncrawlable or uncitable.

When an excerpt is shortened, the stored record must preserve the exact full-source pointer and the displayed text must remain an exact contiguous excerpt unless the omission is explicitly marked.

## Epistemic boundary

A memorable quotation is not a premise, derivation, validation result, or current theory-state statement by virtue of being featured. Each quote keeps its historical/current status and source context. Site presentation is a reading aid, not an authority transform.

## Next operations

- feed worker nominations into `quote_candidates/`;
- expand the verified quote pool across lay/fun and scientist-facing categories;
- use `CURRENT_WORK.json` as the next Glass Sausage Factory Current Work refresh source;
- when the site publisher is available, wire these files into the public presentation and expose stable quote/source links.
