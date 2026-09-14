# Nathan Direct tagging ledger — Solve for C family 01

**Date processed:** 2026-09-14
**Lane:** Nathan Direct — corpus-first provenance / training
**Status:** Stage-2 bounded provenance/tag enrichment; no theory construction; no curation/promotion

## Nathan clarification — 2026-09-14

Nathan directly clarified: **“The ‘Solve for’ conversations are meant to be blindered equations for testing with stripped provenance.”**

This clarification controls interpretation of the Solve-for family. Missing semantic labels are deliberate test blinding, not a provenance defect to repair from neighboring conversations.

Additive family-level status:
- `BLINDED-EQUATION-TEST`
- `PROVENANCE-STRIPPED-BY-DESIGN`
- `NO-SEMANTIC-INFERENCE`
- `METHODOLOGY:CONTEXT-CONTROL`
- `WINNOW:NOT-THEORY-LINEAGE-SOURCE`

Do not use these records for SAT/H(s)H variable definitions, terminology lineage, earliest conceptual use, or ancestry unless a separate explicit Nathan-authored source restores the stripped provenance. Existing raw-role, equation, adjacency, and duplicate metadata remain valid.

## Scope

Reviewed three distinct raw conversation exports in `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_12/`, all dated 2025-05-04:

1. `25.05.04•25.05.04•Solve for C — raw.json`
   - conversation_id: `68172d0a-2a14-8002-bf71-ebeec12ed663`
   - Nathan/user message IDs:
     - `4e1888c9-22b4-4c4e-aa0f-2c1d32f75a97`
     - `c33caac0-6d39-4f2a-855a-92cd38e6e981`
   - graph: linear two-user-turn calculation chain with assistant response between turns.

2. `25.05.04•25.05.04•Solve for C — raw (1).json`
   - conversation_id: `68172c8c-afe8-8002-978f-e6f4682c90eb`
   - Nathan/user message ID: `6c5770da-5d7b-479c-b663-9787b069f82f`

3. `25.05.04•25.05.04•Solve for C Percent Difference — raw.json`
   - conversation_id: `68175f70-f8d8-8002-8648-b14b7152a0f4`
   - Nathan/user message ID: `9a84028c-0fdb-47f6-b3ce-ad1a0ec02ce2`

## Authorship verification

All four Nathan records above were verified directly from raw message metadata with `author.role = user`. No authorship inference from style or assistant prose was used.

Assistant responses were read only as adjacency/context and are not Nathan Direct content.

Existing automated/master tags remain attached and unchanged. Tags below are additive Stage-2 review metadata.

## Exact Nathan wording / message-level notes

### `4e1888c9-22b4-4c4e-aa0f-2c1d32f75a97`

> Ok, solve for C with the following givens:
> 1+A=B/C
>
> A=10.957
> B=6.1053

Additive review tags:
- `EQUATION:1+A=B/C`
- `SOLVE-FOR-C`
- `VARIABLES:A,B,C`
- `NUMERIC-CALCULATION`
- `SAT-HSH-RELATION:UNESTABLISHED`
- `PROVENANCE:RAW-ROLE-VERIFIED`

### `c33caac0-6d39-4f2a-855a-92cd38e6e981`

> Ok, solve for A with the following givens:
> 1+A=B/C
>
> C=0.510998950
> B=6.1053

Additive review tags:
- `EQUATION:1+A=B/C`
- `SOLVE-FOR-A`
- `VARIABLES:A,B,C`
- `NUMERIC-CALCULATION`
- `SAT-HSH-RELATION:UNESTABLISHED`
- `PROVENANCE:RAW-ROLE-VERIFIED`

This second Nathan turn restates the equation explicitly, so it does not require inherited/context-dependent equation tagging despite being downstream of the first calculation.

### `6c5770da-5d7b-479c-b663-9787b069f82f`

> Ok, solve for C with the following givens:
> 1+A=B/C
>
> A=10.957 
> B=5.65 

Additive review tags:
- `EQUATION:1+A=B/C`
- `SOLVE-FOR-C`
- `VARIABLES:A,B,C`
- `NUMERIC-CALCULATION`
- `SAT-HSH-RELATION:UNESTABLISHED`
- `PROVENANCE:RAW-ROLE-VERIFIED`

### `9a84028c-0fdb-47f6-b3ce-ad1a0ec02ce2`

> Given the equation:
>
>     (A - B)/B = (C - D)/D
>
> Solve for C, using the following values:
>
> A: 73.0
> B: 67.4
> D: 299792.458
>
> Once solved, calculate the percent difference between C and D.

Additive review tags:
- `EQUATION:(A-B)/B=(C-D)/D`
- `SOLVE-FOR-C`
- `VARIABLES:A,B,C,D`
- `PERCENT-DIFFERENCE`
- `NUMERIC-CALCULATION`
- `NUMERIC-LITERAL:299792.458`
- `SOURCE-SEMANTICS:VARIABLE-MEANINGS-UNESTABLISHED`
- `SAT-HSH-RELATION:UNESTABLISHED`
- `PROVENANCE:RAW-ROLE-VERIFIED`

Historical review note: the exact numeric literal `299792.458` is present in Nathan's raw turn, but the raw turn does not label D. Nathan's later clarification establishes that the missing semantics are deliberate blinding; numerical recognition must not be used to reverse-engineer stripped provenance from this test record.

## Duplicate / prefix / superset disposition

These three exports are separate historical conversations under the Nathan Direct identity rule:

- all three have distinct `conversation_id` values;
- all four user turns have distinct `message.id` values;
- their raw graphs differ;
- numerical givens differ;
- the percent-difference conversation uses a different algebraic relation and an additional variable D.

The two conversations titled `Solve for C` use overlapping wording and the same `1+A=B/C` relation but different B values and separate identities. Treat them as repeated blinded calculation requests, not archive duplicates, absent stronger serialization evidence.

Do not merge the percent-difference conversation into the `1+A=B/C` family merely because both use a variable named C.

## Context / inherited-tag handling

New explicit inherited/context-dependent cases in this pass: **0**.

All four Nathan turns state the operative equation directly. Assistant messages remain adjacency pointers/context only.

## Interpretation boundary

This pass records distinct blinded numerical tests. Nathan has subsequently clarified that provenance was deliberately stripped. Therefore the shared symbols, constants, and algebraic forms must not be mined from this family for SAT/H(s)H semantic reconstruction, theory ancestry, or earliest-use claims. Their legitimate Nathan Direct value is methodological/test provenance, exact equation/request history, and authorship/identity metadata.

No equation repair, physical identification, scientific interpretation, or claim promotion was performed.

## Run accounting

- raw conversations processed: 3
- Nathan/user messages raw-role-verified and enriched: 4
- newly extracted/packaged into master substrate: 0
- inherited/context-dependent cases newly identified: 0
- selectively curated/promoted passages: 0
- duplicate archive copies collapsed in this pass: 0
- destructive tag/status changes: 0
- unresolved authorship cases: 0
- unresolved source-path cases: 0

## Next useful region

Do not spend further review cycles attempting to infer variable meaning from neighboring Solve-for conversations. Resume an independently SAT/H(s)H-relevant correction/definition/provenance candidate from the durable Stage-2 queues unless a separate explicit Nathan-authored source deliberately reconnects a blinded test to its source equation.
