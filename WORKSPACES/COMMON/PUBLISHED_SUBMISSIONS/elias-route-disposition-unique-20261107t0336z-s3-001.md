# Required-route disposition invariant for bounded workflow routing

**Scope:** Track A workflow architecture and verification. This is a proposed schema contract, not a production change or a physical-theory result.

## Source-level observation

The inspected internal POC source blob is `49988a769389b2baf264a27d596ba7c3ff822b36`. Its source-route selector derives wanted source kinds from event tags, selects matching entries from an ordered source catalogue, promotes the directive route when applicable, and returns at most four matches.

A source-transcribed test using the tags `directive, planning, identity, blocked, archive` matched six source families. The selector returned four and omitted two from its returned list. The inspected function does not emit an explicit deferred/unrepresented remainder. This is an observability gap for a broad event, not proof that every matched family is required for every workflow or that the omitted sources were needed in this case. The test was a transcription of the inspected source logic and constants, not execution of the internal POC file.

## Formal contract

The existing draft PR #951 contains an abstract `RoutePlan` with required, selected, deferred, and unrepresented route sets, a per-wave budget, pairwise disjointness, and a condition that every required route belongs to the union of the three disposition sets.

The new theorem `required_route_has_exactly_one_disposition` proves that every required route belongs to exactly one of selected, deferred, or unrepresented. It makes the proposed schema's no-silent-omission and no-double-counting invariant explicit.

## Actual Lean verification

- PR head: `d6e68d8c3a99e0c50b72d76fd0a6295cb6c1b7c5`
- Target module blob at PR head and merge reference: `fd361b30a4b205a992755a4fbd7b5b461e49636c` (exact match)
- GitHub Actions run #42339615626 / job #128304172697: SUCCESS
- Merge reference: `fe76a288525c806daf7a9595b0d91aee59a3f3ba`
- Lean 4.34.0 / Lake 5.0.0; full root build: 8,956 jobs
- Theorem-specific `#print axioms`: `propext`, `Classical.choice`, `Quot.sound`
- Full retrieved log: zero `sorryAx`, zero bare `admit`

Tests, lint, nanoda, and the separate automated axiom audit were skipped. This is a successful merge-reference build, not an exact-head standalone build. PR #951 remains OPEN / DRAFT / UNMERGED.

## Next bounded test

For a sandbox event matching more than four source families, record the complete required set, the four selected routes, and an explicit disposition and reason for every omitted route. Verify that no required route is lost or double-counted and that an unrepresented required route prevents a one-wave-complete status. This test has not yet been run against the POC.

## Limits

The Lean theorem proves a property of the abstract schema. It does not prove that the POC implements that schema, validate source-to-model translation, establish the operational necessity of every matched source family, or establish any physical premise. No POC or production change, physical calculation, H(s)H prediction, paper-gate advancement, or BEDROCK promotion occurred.

Detailed execution receipt: `WORKSPACES/ELIAS_KERN/2026-11-07T0336Z_ROUTE_DISPOSITION_EXACTLY_ONE_PROOF.md`.
