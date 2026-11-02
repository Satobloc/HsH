# Erratum: Q=3A source attribution in #1248 and #1201

**Date:** 2026-11-02  
**Scope:** correction of one source-attribution paragraph only. The remaining braid-smoothing, coarse-graining, Back-Hallways, and map-hierarchy findings in #1248 are unchanged.

## Correction

The UUID `eedd8dce-44f0-4904-9234-2f3d9e7ef550` cited in #1248 and #1201 does **not** occur in the recovered raw “Ontology and Math Check” conversation mapping. It is an invalid source locator and must not be cited.

The raw conversation is:
- Conversation ID: `69b3b56e-7540-8325-b93b-e9331fe95430`
- Git blob: `e3e40b1a167d26f2d153667d761746f9a4788db1`
- Archive path: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_3/26.03.13•26.04.21•Ontology and Math Check — raw.json`

## What the raw source actually supports

1. **Nathan Direct, 2026-03-13 07:10:05Z:** message `ee6f4f57-1319-432a-aa06-e39bfd3adef3` explicitly says that material supplied in that exchange is quoted from another LLM conversation, with embedded instructions intended for NotebookLM; the assistant's role is reality-checking. Therefore, later embedded “audit” passages in that branch must not automatically be attributed to Nathan.

2. **Nathan Direct, 07:45:59Z:** message `2fa35549-edc3-4e32-9c1f-07f96ab781a9` gives He-3 as `Q=6` while writing “3 quarks × 3 nucleons.” That parenthetical is internally arithmetically inconsistent.

3. **Nathan Direct, 07:16:20Z:** message `194bbca6-6ced-4949-8c84-8a0c93effe36` begins with an explicit acknowledgment of a correction (“Good catch … exactly the sloppiness …”). This acknowledges the correction process; it is not itself a definition of Q.

4. **Nathan Direct, 08:48:50Z:** message `e41e50ba-6c02-433f-ab9e-54633a7c6e17` says the Q count should be included in full, but does not state a numerical Q=3A equation.

5. **Later user-supplied equation bundle, 2026-03-18:** messages `11b787cf-f2ea-495e-b0e8-01fd235dde1e` (09:30:07Z) and `0f9c47e1-a437-4276-b128-5061380e722a` (09:33:22Z) contain `Q = \sum_i W_i + L = 3A` in a “CORE PACK.” These are user-role messages, but the equation bundle's own source genealogy is not independently recovered. They should be classified as **user-supplied core-pack material with unresolved internal authorship**, not as an earlier March 13 direct derivation.

The Q=9 material appears in embedded/LLM-style audit content in the March 13 exchange. It is arithmetically consistent with 3 × 3, and the user acknowledges a correction, but the raw source does not support the earlier claim that a March 13 direct message had already stated Q=3A.

## Corrected provenance classification

| Proposition | Correct classification |
|---|---|
| He-3 `Q=6` with “3 × 3” | Nathan Direct; internal arithmetic mismatch |
| Q=9 correction in the quoted audit material | Embedded/assistant-origin material; arithmetic correction, not independent measurement |
| “Good catch” acknowledgment | Nathan Direct acknowledgment of correction, not a new Q equation |
| `Q=3A` in the March 18 CORE PACK | User-supplied equation bundle; source genealogy of the equation text unresolved |
| Current BEDROCK resolution-dependent Q accounting | Current adopted control; not a substitute for the missing original message |

This erratum withdraws the statement in #1248 that an earlier March 13 direct message defined Q=3A, and corrects the same invalid locator in #1201. The separate Q-count-versus-braid-order distinction remains open as already recorded.

No physical mass calculation, numerical fixture, CODATA scoring, observational validation, Lean change, SAT-O/Blockwave equation change, or BEDROCK edit was made.
