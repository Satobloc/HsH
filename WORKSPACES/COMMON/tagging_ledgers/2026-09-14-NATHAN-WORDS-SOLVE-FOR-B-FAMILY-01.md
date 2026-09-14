# Nathan Direct tagging ledger — Solve for B family 01

**Date processed:** 2026-09-14
**Lane:** Nathan Direct — corpus-first provenance / training
**Status:** Stage-2 bounded provenance/tag enrichment; no theory construction; no curation/promotion

## Scope

Reviewed four distinct raw conversation exports in `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_12/`, all dated 2025-05-04:

1. `25.05.04•25.05.04•Solve for B — raw (2).json`
   - conversation_id: `68172979-67a4-8002-a0c3-8887d677b7fe`
   - Nathan/user message IDs:
     - `727d09db-65f3-4470-8e4b-d589db502371`
     - `b804a857-edf9-4f44-95f5-662d26bab2d4`
     - `5b0567ad-0d31-48b9-9f24-b2b95003424f`
   - graph: one linear three-user-turn calculation chain, with assistant turns between each user turn.

2. `25.05.04•25.05.04•Solve for B — raw (1).json`
   - conversation_id: `68172c66-104c-8002-b276-c52e2e7058b8`
   - Nathan/user message ID: `45b274bd-9670-427e-bc36-9db808c11980`

3. `25.05.04•25.05.04•Solve for B equation — raw.json`
   - conversation_id: `68172cbc-80cc-8002-b1ce-99515e19f371`
   - Nathan/user message ID: `57c8b954-8098-40b6-a8c4-4a78c36eba50`

4. `25.05.04•25.05.04•Solve for B — raw.json`
   - conversation_id: `68173029-14e4-8002-bf0d-b5892a11e416`
   - Nathan/user message ID: `4ee717ba-80b0-45ed-8937-d9aebb374bc2`

## Authorship verification

All six Nathan records above were verified directly from raw message metadata with `author.role = user`. No authorship inference from style or assistant prose was used.

Assistant responses were read only as adjacency/context and are not Nathan Direct content.

## Exact Nathan wording / message-level notes

### `727d09db-65f3-4470-8e4b-d589db502371`

> A=10.957 C=0.510998950 
> 1+A=B/C
> Solve for B

Tags added/preserved:
- `EQUATION:1+A=B/C`
- `SOLVE-FOR-B`
- `VARIABLES:A,B,C`
- `NUMERIC-CALCULATION`
- `SAT-HSH-RELATION:UNESTABLISHED`
- `PROVENANCE:RAW-ROLE-VERIFIED`

### `b804a857-edf9-4f44-95f5-662d26bab2d4`

> Ok, same equation, but solve for A with the following values:
> C=0.510998950
> B=5.65 

Tags added/preserved:
- `EQUATION:1+A=B/C`
- `SOLVE-FOR-A`
- `VARIABLES:A,B,C`
- `NUMERIC-CALCULATION`
- `LOCAL-REFERENT:SAME-EQUATION`
- `CONTEXT-DEPENDENT / INHERITED-TAG`
- `SAT-HSH-RELATION:UNESTABLISHED`
- `PROVENANCE:RAW-ROLE-VERIFIED`

Adjacency pointer: immediately preceding assistant message `e3f57435-1bba-4de9-9305-67a8c81f3525`, which restates the equation. The Nathan turn itself does not repeat the equation, so its equation tag is inherited from explicit local adjacency rather than guessed.

### `5b0567ad-0d31-48b9-9f24-b2b95003424f`

> Ok, same thing but solve for C using the following values:
> A=10.957 
> B=5.65 

Tags added/preserved:
- `EQUATION:1+A=B/C`
- `SOLVE-FOR-C`
- `VARIABLES:A,B,C`
- `NUMERIC-CALCULATION`
- `LOCAL-REFERENT:SAME-THING`
- `CONTEXT-DEPENDENT / INHERITED-TAG`
- `SAT-HSH-RELATION:UNESTABLISHED`
- `PROVENANCE:RAW-ROLE-VERIFIED`

Adjacency pointer: immediately preceding assistant message `9ceb865d-097c-4c13-b095-69f479cd4913`, itself responding to Nathan's preceding `same equation` turn. Full raw conversation pointer retained because the relevant equation is two user-facing turns upstream.

### `45b274bd-9670-427e-bc36-9db808c11980`

> Ok, solve for B with the following givens:
> 1+A=B/C
>
> A=10.957 
> C=0.510998950 

Tags added/preserved:
- `EQUATION:1+A=B/C`
- `SOLVE-FOR-B`
- `VARIABLES:A,B,C`
- `NUMERIC-CALCULATION`
- `SAT-HSH-RELATION:UNESTABLISHED`
- `PROVENANCE:RAW-ROLE-VERIFIED`

### `57c8b954-8098-40b6-a8c4-4a78c36eba50`

> Ok, solve for B with the following givens:
> 1+A=B/C
>
> A'=10.0584
> C=0.510998950 

Tags added/preserved:
- `EQUATION:1+A=B/C`
- `SOLVE-FOR-B`
- `VARIABLES:A,B,C`
- `VARIABLE-NOTATION:A-PRIME`
- `NUMERIC-CALCULATION`
- `SOURCE-SEMANTICS:UNRESOLVED-A-PRIME-VS-A`
- `SAT-HSH-RELATION:UNESTABLISHED`
- `PROVENANCE:RAW-ROLE-VERIFIED`

Important boundary: the assistant explicitly assumes `A'` is the value of `A`; Nathan does not state that equivalence in this raw turn. Do not promote the assistant assumption into Nathan-authored semantics.

### `4ee717ba-80b0-45ed-8937-d9aebb374bc2`

> Ok, solve for B using the following values:
> 1 + A = B / C
>
> A=10.0584
> C=0.4725 

Tags added/preserved:
- `EQUATION:1+A=B/C`
- `SOLVE-FOR-B`
- `VARIABLES:A,B,C`
- `NUMERIC-CALCULATION`
- `SAT-HSH-RELATION:UNESTABLISHED`
- `PROVENANCE:RAW-ROLE-VERIFIED`

## Duplicate / prefix / superset disposition

These four exports are **not archival duplicates of one another** under the Nathan Direct identity rule:

- all four have distinct `conversation_id` values;
- all six user turns have distinct `message.id` values;
- their raw graphs differ;
- numerical givens differ across conversations;
- `raw (2)` contains a three-user-turn linear chain while the other three are single-user-turn conversations.

Repeated title/date and overlapping wording are therefore insufficient for duplicate identity. Preserve them as separate historical events.

The first user turn of `raw (2)` and the sole user turn of `raw (1)` are textually very similar and use the same numerical givens, but still have different conversation/message IDs. Treat as repeated calculation requests, not duplicate archive copies, unless a later source-identity audit establishes a serialization relationship using stronger evidence.

## Context / inherited-tag handling

New explicit inherited/context-dependent cases in this pass: **2**.

- `b804a857...`: `same equation` inherits the explicit equation from local adjacency.
- `5b0567ad...`: `same thing` inherits the equation through the immediately preceding calculation exchange; full-conversation pointer retained.

The other four Nathan turns contain the equation explicitly and do not require inherited equation tagging.

## Interpretation boundary

This cluster establishes repeated Nathan-authored use of the algebraic relation `1 + A = B / C` for numerical solve requests on 2025-05-04. It does **not**, by itself, establish what A, B, or C denote, why the particular constants were selected, or whether the relation belongs to SAT/H(s)H. Do not infer those meanings from assistant calculations or nearby archive material without a source-backed connection.

No equation repair, scientific interpretation, or claim promotion was performed.

## Run accounting

- raw conversations processed: 4
- Nathan/user messages raw-role-verified and enriched: 6
- newly extracted/packaged into master substrate: 0
- inherited/context-dependent cases newly identified: 2
- selectively curated/promoted passages: 0
- duplicate archive copies collapsed in this pass: 0
- destructive tag/status changes: 0
- unresolved authorship cases: 0
- unresolved source-path cases: 0
- unresolved semantic case retained: meaning of `A'` and A/B/C remains unestablished here

## Next useful region

Continue within the same 2025-05-04 calculation/unification cluster only after checking live ledgers/claims. Highest-value next operation is to inspect neighboring equation/unification conversations for an explicit Nathan-authored definition of A/B/C or an explicit connection of `1+A=B/C` to a named SAT/H(s)H construct. Until such a source is found, keep this family as equation-use provenance with theory relation unestablished.
