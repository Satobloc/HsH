# Worker → Website Backfill

**Status:** ACTIVE STAGING / NOT AUTOMATIC PUBLICATION  
**Established:** 2026-09-20

## Purpose

Create a direct, low-friction route from useful worker output to the public-site editorial pipeline without requiring Nathan to manually rediscover everything later.

This lane is broader than `quote_candidates/` and `news_candidates/`. It is for durable worker artifacts that may deserve a public-facing representation: source maps, timeline fragments, explanatory diagrams, episode-guide additions, glossary entries, provenance-backed historical notes, Lab visualizations, benchmark cards, tool demos, reconstruction summaries, or other material that is already useful internally.

The principle is:

> **Worker produces something durable → worker or Comptroller notices public value → stage a pointer/packet → editorial/public-site workflow decides presentation and publication.**

Staging is not publication and does not grant theory authority.

## Candidate packet

Use one collision-safe file per candidate where practical. Record:

- candidate ID;
- date;
- nominating instance;
- exact source artifact/path/branch;
- artifact type;
- concise public value;
- proposed site destination/feature;
- provenance/source maturity;
- theory/status classification;
- whether exact Nathan wording is involved;
- privacy/quarantine/exposure check;
- transformation needed for public display;
- mathematical/rendering needs;
- suggested warning/caveat only where materially necessary;
- editorial state;
- downstream disposition;
- return route.

## Editorial states

- `NOMINATED`
- `SOURCE_CHECKED`
- `PRESENTATION_NEEDED`
- `READY_FOR_EDITORIAL`
- `ACCEPTED_FOR_SITE`
- `PARKED`
- `REJECTED`
- `PUBLISHED`
- `SUPERSEDED`

## What belongs here

Good candidates include:

- a source-backed reconstruction that could become a reader-friendly explainer;
- a Lab visualization from the Holo J. F. Light Virtual Optical Workbench;
- a newly recovered historical sketch or timeline anchor with provenance;
- a compact benchmark/comparison result whose status is clearly labelled;
- a useful archive/tool interface that the public site should surface;
- an episode-guide crosslink or glossary improvement discovered during theory work;
- a worker-generated explanatory artifact that is stronger than the current site treatment.

Use the specialized existing surfaces for:

- exact quotations → `PUBLIC_SITE/quote_candidates/`;
- external research stories → `PUBLIC_SITE/news_candidates/`.

## What does not belong

- raw private/quarantined content;
- unverified Nathan attribution;
- speculative theory promoted as established;
- an internal artifact whose provenance/status cannot be represented safely;
- filler created merely to keep the site busy.

## Comptroller relationship

The Comptroller leverage scan should detect:

- valuable internal artifacts with no public-site disposition;
- public-site candidate folders with no traffic;
- accepted candidates stalled before presentation;
- repeated worker recommendations for site treatment;
- public-site needs that could be cheaply backfilled from existing work.

It may issue `WEBSITE_BACKFILL`, `NIBBLE`, `COMMUNICATION_SMOOTH` or `MUSICAL_CHAIRS` signals as appropriate.

## Worker bite

During ordinary work, if a result is obviously useful to public readers, stage the pointer/packet as a tiny side effect. Do not convert every research run into web editing.

## Next cursor

Seed the queue from already-durable current outputs rather than waiting only for future work. Priority seed classes: current onboarding/wayfinding improvements that affect public readability, episode-guide/public explanation artifacts, visual/Lab outputs when available, and source-backed Nathan/history material suitable for the site.
