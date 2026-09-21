# Public Site — structured update packets

**Status:** ACTIVE / machine-readable companion to `PUBLIC_SITE/live_influx/`  
**Purpose:** plug-n-play handoff from any project worker to a later Glass Sausage Factory site-build session.

This directory does **not** publish the site. It gives every active worker a stable, collision-safe way to say: “this public-facing object changed; here are the exact sources, assets, presentation suggestions, and caveats.”

The Site builder/editor can then consume packets without reconstructing the originating conversation.

## Contract

One JSON file per bounded update:

`YYYY-MM-DD__INSTANCE__short-slug.json`

Use `WORKSPACES/COMMON/scripts/emit_public_site_update_packet.py` when available rather than hand-authoring.

Required fields:

- `schema_version`
- `packet_id`
- `created`
- `producer`
- `title`
- `kinds`
- `status`
- `summary`
- `sources`
- `destinations`
- `epistemic`

Optional but strongly useful:

- `assets`
- `public_copy`
- `relationships`
- `time_sensitive`
- `follow_up`
- `provenance`

## Status vocabulary

- `candidate` — worth site consideration; not yet editorially accepted.
- `ready` — source/provenance/presentation sufficiently complete for site-builder intake.
- `needs-source-check` — useful but blocked on provenance or source recovery.
- `parked` — intentionally deferred with a return trigger.
- `rejected` — reviewed and not for public use; retain reason if useful.
- `incorporated` — consumed into a durable public-site feed or live build.

`ready` means ready for **editorial/site intake**, not theory validation.

## Kinds

Use one or more:

- `concept-update`
- `current-work`
- `diagram`
- `document`
- `quote`
- `news`
- `podcast`
- `glossary`
- `history`
- `workflow`
- `build-suggestion`
- `cross-link`

Specialized quote/news lanes remain authoritative for their own candidate workflows. A packet may point to those records but should not duplicate them unnecessarily.

## Source rule

Every substantive packet should carry the strongest exact repository pointer available. A source entry should distinguish its role, for example:

- `controlling`
- `current-sandbox`
- `historical`
- `provenance`
- `implementation`
- `visual-source`

A public-site packet does not promote a sandbox file to theory authority.

## Asset rule

Assets should point to durable repository paths or stable external URLs. For mathematical/geometric figures, preserve the project visual hierarchy:

- `P` — exact/script-drawn canonical or candidate precision artifact;
- `H` — controlled hybrid built on P/exact computation;
- `I` — illustrative render; no geometric authority unless downstream of P/H.

A packet that references a Class-I image without P/H ancestry must mark it as illustrative only.

## Site-builder consumption rule

A site-build session should be able to:

1. enumerate packets with status `ready` or selected `candidate` packets;
2. resolve all `sources[].path` and `assets[].path` pointers;
3. route by `destinations[].surface`;
4. render `public_copy` when present, otherwise use `summary` only as editorial source material;
5. preserve `epistemic` labels and source links in the public presentation;
6. record disposition by updating the packet status or adding a disposition trail;
7. update `SITE_DEVELOPMENT_WORK_LOG.md` after material incorporation/publication.

No packet should silently rewrite controlling theory state, provenance, or source text.

## Worker cadence

This is part of the standing opportunistic public-site feeder. It is not a new recurrence and should not displace milestone-critical work. When a worker produces something clearly useful to the public site, emitting one packet should be a small side effect of the substantive operation.
