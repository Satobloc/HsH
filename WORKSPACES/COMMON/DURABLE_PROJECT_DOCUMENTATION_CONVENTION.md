# Durable Project Documentation Convention

**Status:** ACTIVE coordination/infrastructure convention  
**Scope:** substantial repo-wide and cross-lane initiatives  
**Authority:** implements Nathan's 2026-09-13 Common directive to standardize project documentation and handoffs. This file is not a SAT/H(s)H theory surface.

## Purpose

Keep consequential work findable without turning Common into a second archive or proliferating one-off status files. A substantial initiative should normally leave three linked layers:

1. **Common notice / handoff** — concise routing entry saying what changed, who needs it, and where the durable record lives.
2. **Durable project/index home** — stable record of scope, status, outputs, provenance, dependencies, and access pointers.
3. **Navigation linkage** — Dashboard, README, index, catalog, or other appropriate front-door pointer when the initiative is important enough that future workers/users should discover it without searching Common history.

Small, local, temporary, or purely mechanical work does not need all three layers. Prefer updating an existing appropriate durable home over creating a new file.

## Minimum durable-home fields

A durable project/index home should make the following recoverable without reconstructing chat history:

- **Purpose / scope** — what the initiative covers and explicitly does not cover.
- **Status** — active, blocked, paused, superseded, complete, quarantined, historical, or another precise state.
- **Owner / lane** — current responsible workspace or process when meaningful.
- **Authority / epistemic type** — e.g. Nathan Direct, provenance/index infrastructure, Workshop, external-evidence lane, generated analysis; do not let location imply authority.
- **Source / provenance** — controlling directive/source pointers and, where available, raw IDs/timestamps; mark pending provenance rather than inventing it.
- **Outputs** — exact files, indexes, reports, workflows, datasets, or generated surfaces produced.
- **Dependencies / blockers** — what must happen before the next operation or promotion.
- **Access / navigation pointers** — canonical routes to the source material and outputs.
- **Supersession / history** — when definitions, methods, files, or status changed, preserve dated predecessor relationships instead of silently overwriting historical meaning.
- **Next operation** — concise restart point when the initiative is active.

## Common-room rule

Common is the routing layer, not the final record. A Common post for substantial work should be short and point to the durable home. Once an item stabilizes, update the Common entry or add a concise resolution pointer rather than appending repeated status chatter.

Recommended compact form:

`YYYY-MM-DD — FROM → TO/all — TYPE — subject — status/action — durable pointer`

## Navigation rule

Add a front-door link when at least one of these is true:

- the initiative is repo-wide or cross-lane;
- it changes how workers find or interpret project records;
- it defines an active operational convention;
- it creates a canonical glossary/index/catalog or other reusable retrieval surface;
- omission would make a future worker depend on Common archaeology to discover the current route.

Choose the narrowest appropriate navigation surface. Do not automatically add every project to the Dashboard; README/index linkage is often sufficient for infrastructure work.

## Provenance and epistemic safeguards

- Documentation is not promotion. Recording an interpretation, workshop result, quarantined item, or generated analysis does not make it canonical.
- Preserve authorship boundaries and source type.
- Mark present Nathan testimony separately from archive-corroborated historical material.
- Preserve superseded/historical definitions with dates and relationships when terminology evolves.
- Do not use worker consensus as a substitute for Nathan authorship, source evidence, or scientific validation.
- Private-resource paths are not public evidence surfaces; follow the Common repository-boundary rules for public-facing documentation.

## Generated-state rule

Do not hand-edit generated manifests/catalogs merely to make documentation appear current. Fix or run the owning generator/workflow, document the dependency, and verify the resulting artifact. If a generated surface has a temporary stale record but its consumer safely filters it, record the distinction between source-generation lag and consumer correctness.

## Initiative-specific application

### Historical definitions / glossary initiative

The repo-wide definitions initiative should use this convention:

- durable home: a canonical glossary/definitions index (location to be chosen by the owning documentation/tagging lane);
- each term should surface the current definition first while retaining dated earlier senses;
- record supersession, clarification, broader/narrower/related-standard-term relationships, and provenance;
- source definitions from verified Nathan-authored/tagged material and existing glossary/standard-to-SAT resources rather than generated reconstruction;
- Common should carry only coordination notices and links to the durable glossary/index.

### Autotag / tagging QA

Tagging QA should update a durable QA/index record with corpus coverage, selectivity behavior, known over-recall/under-recall, structural gaps, and tuning history. Common should carry only material changes or blockers.

### Viewer / catalog maintenance

Viewer/catalog QA should distinguish source-tree state, manifest state, generated catalog state, and publication/workflow state. Durable QA records should name the owning generator and verification criteria; Common should carry resolved handoffs or blockers.

## Relationship to existing Common rules

This convention implements and narrows the existing Common README rule: useful reusable information normally belongs in an appropriate durable README/index/workspace record, with a short Common pointer. It does not replace `GLASS_SAUSAGE_FACTORY_RECORD_POLICY.md`, epistemic/quarantine rules, or source-specific provenance ledgers.
