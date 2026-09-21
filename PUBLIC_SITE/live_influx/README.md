# Public Site — Live Influx Queue

**Status:** ACTIVE / opportunistic feeder  
**Purpose:** collision-safe landing zone for public-site-worthy material noticed during ordinary project work when it does not yet belong cleanly in an existing specialized feed.

This is the generic front porch for the Glass Sausage Factory content pipeline.

Use it for:
- a newly clarified concept that deserves a public explainer/update;
- a document, diagram, podcast item, historical artifact, glossary term, Lab result, workflow development, or archive find that the site should probably expose;
- a useful cross-link between existing site sections;
- a presentation-ready source that should enter the Reading Library or another browse surface;
- something newly important in current work that `CURRENT_WORK.json` may need to reflect;
- a candidate that is clearly site-relevant but not yet classified.

Do **not** use this as a duplicate for:
- quote candidates → `PUBLIC_SITE/quote_candidates/`;
- news candidates → `PUBLIC_SITE/news_candidates/`;
- pure design/UX/build ideas → `PUBLIC_SITE/build_suggestions/`;
- theory-status changes → controlling theory/project surfaces first.

## Suggested prose entry

Create an individual file:

`YYYY-MM-DD__INSTANCE__short-slug.md`

Include only what helps the site-builder/curator act:
- what was noticed;
- why it may matter publicly;
- exact source/pointer;
- suggested destination or presentation form, if obvious;
- current status/provenance caveat where necessary;
- whether it is time-sensitive;
- whether a follow-up source check is needed.

A live-influx nomination does not change theory authority or guarantee publication.

## Structured plug-n-play packets

For an update with enough structure to be consumed directly by a later site-builder session, prefer:

`PUBLIC_SITE/live_influx/packets/`

Packet contract:

`PUBLIC_SITE/live_influx/packets/README.md`

Common emitter:

`WORKSPACES/COMMON/scripts/emit_public_site_update_packet.py`

The structured packet is the preferred route for things such as:
- a new Class-P/Class-H visual plus its exact source;
- a current-work result with explicit public destinations;
- a concept update that should touch several site surfaces;
- a document or implementation artifact that needs a public cross-link;
- a worker result whose sandbox/current/provenance status must travel intact into presentation.

A packet can carry source pointers, visual class, assets, suggested public copy, destinations, epistemic status, and follow-up requirements. It is a handoff object, **not** a publication event and not an authority transform.

Site-build sessions should be able to enumerate `ready` packets, selectively inspect `candidate` packets, route them by destination, and leave a disposition trail after incorporation or parking.

## Worker cadence

This should normally be a tiny side-effect of substantive work. Workers are encouraged to drop something here when they encounter a genuinely useful public-facing object. Do not manufacture entries to satisfy a quota.

This feeder belongs to the shared generalist worker housewheel: it does not require a dedicated Sites recurrence. Any active worker may emit a bounded packet as a side effect of ordinary work, while site-builder/editor sessions remain responsible for actual presentation and publication.

Curators/site-build sessions should periodically triage this queue into stable site feeds, implementation work, parking, or rejection with a short disposition trail.
