# Glass Sausage Factory — Presentation Gate

**Status:** CURRENT backend presentation contract  
**Date:** 2026-09-30  
**Scope:** public reader/library navigation and rendering only. This file does not define theory status.

## Core rule

The public site must never make repository serialization or authoring markup the default reading experience.

Repository objects fall into three presentation classes:

1. **READER DOCUMENT** — a human-readable primary/source document. It must be routed through a presentation derivative before ordinary display.
2. **MACHINE / CONTROL** — JSON feeds, manifests, live-influx packets, scripts, workflow/control documents, build suggestions, indexes intended primarily for machines/operators. These are backend inputs and are not ordinary Reading Library documents.
3. **RAW SOURCE** — exact original bytes/text retained for provenance. Raw view is secondary and explicitly requested; it is never the default presentation.

## Hard exclusions from generic browse-as-document

The generic reader must not offer these as ordinary reader documents:

- `PUBLIC_SITE/live_influx/**`
- `PUBLIC_SITE/runtime/**`
- `PUBLIC_SITE/build_suggestions/**`
- `PUBLIC_SITE/*_FEED.json`, `CURRENT_WORK.json`, `ASSET_MANIFEST.json`
- workflow/control files whose purpose is operating the site rather than explaining SAT/H(s)H
- executable/source-code files unless the visitor explicitly chooses a source/code view

The 2026-09-28 CALIPER JSON packet is the motivating regression. It points to a presented method document; the packet itself is not the document.

## Presentation derivative

For reader documents, prefer this chain:

`source -> audience-calibrated preface -> RevTeX source -> compiled PDF -> site PDF/document viewer`

The ordinary visitor sees the compiled presentation. The source/original remains available through a clearly secondary **SOURCE / RAW** affordance.

Presentation must preserve source identity, date, status, and provenance while allowing formatting repair. Formatting repair may normalize broken Markdown/LaTeX/math serialization but must not silently alter scientific content.

### PDF acceptance

A presentation derivative is eligible only when:

- section hierarchy is rendered, not exposed as markup;
- inline/display mathematics is typeset;
- tables, figures, boxes, references, URLs, and equations respect page boundaries;
- long equations and URLs wrap or break safely;
- no text or box crosses printable/viewer bounds;
- narrow-screen viewer reflow/zoom remains usable;
- a short plain-English preface identifies what the document is, intended audience, historical/current status, and where it sits in SAT/H(s)H;
- technical readers receive direct links/pointers to the highest-value equations, calculations, findings, assumptions, tests, and source record where applicable.

## Reader routing

A generic repository path is not sufficient evidence that an object belongs in the Reading Library.

If a backend packet/feed nominates a source:
1. resolve its intended human-facing source;
2. find/build the presentation derivative;
3. route the public card/link to that derivative;
4. retain packet/feed/raw source only as provenance/backend controls.

If no presentation derivative exists, show a concise **presentation pending** state or omit it from ordinary browse. Do not dump markup as fallback.

## Live-update behavior

Backend feeds may refresh automatically, but live updating must not bypass the presentation gate. New source material can become discoverable as **pending presentation** without becoming a raw public reading page.

Use explicit state:
- PRESENTED
- PRESENTATION PENDING
- CACHED / snapshot timestamp
- OFFLINE
- SOURCE ONLY

Never leave indefinite `Loading…` as the public state.

## Lane separation

This contract is Sites presentation infrastructure only. Do not inject Sites policy, licensing mechanics, staging workflow prose, or internal coordination language into theory documents.

Theory sources remain theory sources. Presentation metadata belongs here.
