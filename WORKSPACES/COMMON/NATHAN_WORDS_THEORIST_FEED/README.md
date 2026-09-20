# Nathan Words → Theorist Feed

**Status:** CURRENT / DOWNSTREAM INGEST SURFACE  
**Established:** 2026-09-20  
**Primary upstream substrate:** `WORKSPACES/COMMON/NATHAN_VERIFIED_WORDS_COMPENDIUM.md`

## Purpose

The excavation pipeline already preserves verified Nathan-authored wording with provenance. This feed adds the missing downstream layer:

> **Found → verified → context-checked → visible → ingestable → usable by theorist/formalization workers.**

The feed is a router and readiness layer. It does **not** replace the verified compendium, raw conversation source, or theory-status process.

The goal is to prevent high-value Nathan-authored geometry/method/correction material from remaining trapped in excavation artifacts that downstream workers do not know to consult.

## Hard distinction

Three things remain separate:

1. **Exact Nathan wording** — source/provenance object;
2. **normalized interpretation / why it matters** — downstream routing aid, which may be worker-authored;
3. **current theory status** — adjudicated elsewhere and never granted automatically by this feed.

A verified quote can be historically important and currently superseded. A current clarification can still require formalization. Do not collapse these states.

## Readiness states

- `FOUND` — candidate located, not fully verified;
- `SOURCE_VERIFIED` — authorship/source identity verified;
- `CONTEXT_VERIFIED` — enough adjacency/later-correction context checked to route safely;
- `THEORIST_READY` — suitable for direct downstream use with status/provenance attached;
- `NEEDS_REVIEW` — material issue prevents safe downstream use;
- `SUPERSEDED` — preserved historically but a later Nathan correction controls the relevant point.

## Theorist-ready packet schema

Each promoted packet should carry:

- stable feed item ID;
- topic/title;
- readiness state;
- exact upstream compendium entry or raw-source pointer;
- source repository/path/conversation;
- message ID/date/timestamp where available;
- authorship verification;
- exact wording or exact-compendium pointer;
- immediate-context coverage;
- later correction/refinement/supersession pointer;
- historical/currentness label;
- tags;
- normalized interpretation **clearly marked as worker-written**;
- why the item matters to current construction;
- candidate target branches/Labs/workers;
- exposure/quarantine state;
- downstream disposition/history;
- unresolved ambiguity.

Do not duplicate long passages unnecessarily when a stable compendium anchor is sufficient.

## Consumer workflow

Theorist/formalization/solver workers should consult this feed when:

- reconstructing the intended geometry behind an equation or diagram;
- deciding whether a historical formulation reflects Nathan or assistant extrapolation;
- handling terms whose meaning changed over time;
- encountering a persistent 3D-vs-4D interpretation problem;
- testing worldline/worldtube/timesheet/intersection/readout relationships;
- formalizing a point where Nathan supplied an explicit correction;
- checking methodological intent before promoting or rejecting a construction.

The feed is **not** mandatory reading for every task. Use topic-indexed packets rather than saturating every worker with the full Nathan corpus.

## Producer workflow — Nathan Words Excavator / Aster

During ordinary excavation:

1. preserve/source-verify the raw Nathan message in the compendium or equivalent provenance surface;
2. assess whether it has meaningful downstream construction/method value;
3. if yes, create/update a compact feed packet or index item;
4. classify historical/currentness and later corrections;
5. name likely downstream branches without asserting theory authority;
6. leave an explicit return route for ambiguity.

Aster should favor `THEORIST_READY` promotion for:

- direct geometry definitions;
- Nathan corrections to assistant dimensional assumptions;
- explicit model-object relationships;
- method/promotion/rejection rules;
- terminology shifts whose flattening would mislead formalization;
- source-backed statements resolving current branch ambiguity.

## Initial high-value source substrate

The verified compendium already contains source-backed material including:

- 4D thinking and dimensional provenance;
- timesheet/worldline vocabulary;
- worldline/worldtube distinctions;
- projection/readout and helix geometry;
- explicit Nathan corrections;
- changing terminology and historical status;
- methodology statements.

This feed should progressively index those entries by current downstream need rather than re-copying the whole compendium.

## Feed-forward rule

When a theorist consumes an item, record its disposition where practical:

- `INGESTED — INFORMED DEFINITION`
- `INGESTED — CONSTRAINED INTERPRETATION`
- `INGESTED — GENERATED TEST`
- `INGESTED — SOURCE ONLY`
- `CONFLICT FOUND`
- `SUPERSEDED`
- `NOT CURRENTLY RELEVANT`
- `NEEDS NATHAN`

That closes the loop from excavation to use and lets the Comptroller detect feed stalls.

## Relationship to public-site quotation

The same verified source may separately become a `Quotable Nathan` candidate, but theorist readiness and public-display suitability are different decisions. Do not conflate them.

## Next implementation cursor

Create a compact machine-readable index of the highest-value existing compendium entries and progressively add `THEORIST_READY` packets from current branch needs. The first priority should be direct 4D/timesheet/worldline-worldtube/intersection/readout corrections relevant to active solver/formalization work.
