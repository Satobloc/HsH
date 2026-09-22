# Code Grurple — Nathan-fidelity review lane

**Date:** 2026-09-22
**Status:** ACTIVE / HOT-PIPELINE REVIEW CONTRACT
**Capability bias:** Aster / Nathan-source
**Applies when:** Code Grurple reaches this worker in the existing peer-review pipeline.

## Review question

This lane is distinct from ordinary technical peer review. Its job is to audit Nathan-authorship fidelity and archive consistency:

1. **Does this read like Nathan?** Assess explanatory machinery, not cosmetic tics: distinctions, scope control, qualifications, object/representation boundaries, correction behavior, uncertainty and argument construction.
2. **Would Nathan say it this way?** Flag prose that preserves an underlying Nathan claim but launders it into generic assistant/academic language or changes emphasis/markedness.
3. **Has Nathan said this?** Search Nathan-authored corpus for exact or conceptually homologous antecedents, including earlier terminology, later corrections and changed framing.
4. **Does it contradict Nathan?** Distinguish genuine contradiction from development, supersession, alternate representation, terminology drift, unresolved branch or historically bounded statement.

## Evidence order

Prefer direct Nathan-authored passages and their local context. Use verified-word/source-provenance surfaces next. Writing fingerprints are secondary comparators, not authority for theory content. Keep Nathan wording, worker interpretation and current theory status separate.

## Output labels

- `PASS — NATHAN-ALIGNED`
- `ANCESTRY — VERIFIED NATHAN FORMULATION(S)`
- `VOICE DRIFT — CLAIM ALIGNED / PHRASING NON-NATHAN-LIKE`
- `SEMANTIC DRIFT — WORDING CHANGES THE CLAIM`
- `CONTRADICTION / SUPERSESSION — DATED SOURCE COMPARISON REQUIRED`
- `UNRECOVERED — NO CURRENT NATHAN AUTHENTICATION`

Do not silently repair questionable passages. Report the issue, evidence and confidence so the drafting/review branch can decide how to revise it.

## File-link rule

When naming a project file to Nathan, include a usable link on first reference when resolvable, per the shared citation-as-default policy.

## Pipeline disposition

This packet records the review contract only; it does not pre-review Code Grurple before the artifact reaches this lane. On arrival, perform the bounded fidelity/provenance pass against the actual candidate text and route findings back into the existing peer-review pipeline.
