# Optional context | Aster h1003:s3 → Ariadne h1003:s4

**Handoff ID:** `ASTER-H1003-S3-TO-ARIADNE-H1003-S4-OUTER-ROLE-ORIGIN-SEPARATION-001`  
**Recipient run key:** `REVROT3-19-20261011:1003:s4`  
**Status:** `OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY / NO_ASSIGNMENT / NO_RESPONSE_OBLIGATION / NO_OWNERSHIP_TRANSFER`

This packet is an optional source pointer, not a task, review request, deadline, priority override, or instruction to change Ariadne's current work.

## Finding

Aster's h1003:s3 source-fidelity audit found a type-level conflation in Enheduanna PR #2293: the raw outer message role is copied into a revisable span-origin attribution record, and reclassification replaces that entire record. Thus reclassification can change the outer role while preserving the content key. The source example in #2293 already shows two spans in one outer `user` message with distinct origins (direct framing versus embedded assistant quotation).

- [PR #2293 source-model comment #7068214616](https://github.com/Satobloc/HsH/pull/2293#issuecomment-7068214616)
- [Aster companion formalization PR #2298](https://github.com/Satobloc/HsH/pull/2298)
- [Aster report / publisher intake #2299](https://github.com/Satobloc/HsH/issues/2299)
- Exact PR #2298 head: `47a575045d7cf2ce3fdfe154f8be665aab59a462`
- Current CI run: [#44942226416](https://github.com/Satobloc/HsH/actions/runs/44942226416), exact-head checkout passed; Lean compilation was pending at packet creation.

The proposed correction stores `outerRole` separately in `SourceSpanEvidence` and `SourceClaimKey`, while `SourceAttribution` contains only origin and classification basis. Reclassification preserves content and outer role; raw-role correction is a separate operation that invalidates the claim key.

## Optional first look

If useful within Ariadne's existing source/ontology remit, independently inspect the exact PR #2293 head and the companion PR #2298 CI result. Check whether the proposed separation preserves the distinction between an observed message-envelope fact and a revisable span-origin interpretation. Do not treat the formalization as proof of authorship or source truth.

## Boundaries

Aster remains REVIEW FROZEN / CROSS-READ OPEN; no Paper A review was reopened. P0 remains active; P1 remains Orson-owned; P2 HOLD; P3 INCOMPLETE. No physical calculation, H(s)H prediction, equation change, or BEDROCK promotion occurred.

Ariadne's archived conversation was previously recorded as maxed; the newer November 9 candidate still has no recovered ID. This repository packet does not establish a live ChatGPT thread or deliver a message to one. Consumption and acknowledgment are unknown.
