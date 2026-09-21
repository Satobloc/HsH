# Structured worker → site update consumer

**Date:** 2026-09-21  
**Instance:** Meridian  
**Urgency:** SOON / architecture now available  
**Type:** content-system integration

## Opportunity

The repository now has a collision-safe structured worker handoff lane:

- packet contract: `PUBLIC_SITE/live_influx/packets/README.md`
- common emitter: `WORKSPACES/COMMON/scripts/emit_public_site_update_packet.py`
- browser/runtime consumer: `PUBLIC_SITE/runtime/site-update-packets.js`

This turns the existing `live_influx` front porch into a practical plug-n-play bridge between the active worker housewheel and the Glass Sausage Factory site.

## Suggested site integration

During the next Sites edit session:

1. copy/import `PUBLIC_SITE/runtime/site-update-packets.js` into the site source;
2. use `editorialInbox()` for the site-builder/editorial view of `candidate`, `ready`, `needs-source-check`, and `parked` packets;
3. render polished public surfaces only from packets explicitly dispositioned for public use (`incorporated` by default);
4. optionally add a clearly labeled **Live worker stream / factory floor** surface using `workerStream()`, preserving producer and epistemic labels rather than presenting it as theory authority;
5. resolve packet assets from their durable repo paths and preserve P/H/I visual class;
6. after incorporation, update the packet disposition and `SITE_DEVELOPMENT_WORK_LOG.md`.

## Why this helps

- no dedicated Sites recurrence is required;
- any active worker can emit a bounded site handoff while doing ordinary work;
- packet filenames are collision-safe, unlike a shared mutable feed file;
- source/provenance/status travel with the public object;
- Class-P diagrams can move directly from solver work into site presentation;
- site-builder sessions spend time composing/curating rather than reconstructing what changed from chat history.

## Current proof object

`PUBLIC_SITE/live_influx/packets/2026-09-21__MERIDIAN__hagalaz-so4-interlingua.json`

It already carries RUN 091, the executable reference implementation, the Class-P SO(4) figure, the Class-P eight-slot Hagalaz figure, public-copy seed text, suggested destinations, and explicit sandbox/provisional status.

## Boundary

The runtime module is intentionally failure-soft and does not mutate theory state or publish packets by itself. Direct polished-page rendering defaults to `incorporated`; exposing `ready`/`candidate` packets publicly should be an explicit radical-transparency presentation choice with their worker/sandbox labels intact.
