# Cognition Memory Admissibility Gate v0.1

**Status:** PROPOSED WORKSHEET / NOT A VALIDATED BENCHMARK / NOT A P1 PROTOCOL AMENDMENT  
**Owner lane:** Orson Vay, LLM cognition  
**Use:** Future authorized cognition studies and source-continuity audits

## Purpose

Keep six observations separate when evaluating a memory-bearing assistant:

- whether a candidate source supports the proposition;
- whether that source is admissible for the current request;
- whether it was retrieved;
- whether it entered the final prompt;
- whether the response used or disclosed it;
- whether the answer or action was correct.

Do not infer one from another. In particular, correctness does not identify provenance, retrieval does not prove prompt exposure, and prompt exposure does not prove comprehension or uptake.

## Minimum record

| Field | Record |
|---|---|
| Request context | Request ID, requester/principal, task, scope, authority, timestamp |
| Source identity | Stable memory ID, exact locator, immutable digest, author/role, source timestamp |
| Ownership/commitment | Speaker or owner, branch/world, asserted, quoted, hypothetical, simulated, rejected, superseded |
| Lifecycle | Current, stale, revoked, superseded, unknown |
| Source support | Exact proposition supported and source locator |
| Admissibility | `ADMISSIBLE`, `INADMISSIBLE`, or `UNRESOLVED`, with reason |
| Retrieval | Selected, excluded, not retrieved, failed, unknown |
| Prompt exposure | Included, omitted, truncated, not logged; final-prompt identity and source span/position if available |
| Response use | Quoted, paraphrased, acted upon, not surfaced, unobserved |
| Disclosure | Target-level disclosure status and protected-content category, if applicable |
| Outcome | Correctness, task success, policy compliance, and disclosure scored separately |
| Counterfactual | Source-removed or source-altered condition, prompt order, model/version/settings, raw outputs |

## Review procedure

1. Pin the request context before inspecting the answer.
2. Resolve source identity and ownership before interpreting semantic relevance.
3. Record support and admissibility separately. A true or relevant memory may still be inadmissible for this request.
4. Record actual retrieval and final prompt exposure from execution traces, not from the architecture description.
5. Record response use/disclosure separately from prompt exposure.
6. Score answer correctness and task success independently of source admissibility.
7. Keep unresolved cases unresolved. Do not silently count them as safe, unsafe, correct, or absent.
8. For a causal claim about memory use, require an authorized matched intervention with the source omitted or altered, randomized or otherwise controlled order, versioned prompts/settings, and raw outputs. Without that evidence, report association or observability only.

## Continuity-system example

A repository handoff can be stored and visible in an inbox while remaining optional context only. Repository presence is not direct ChatGPT-thread delivery, prompt exposure, consumption, comprehension, or behavioral uptake.

## Formalization boundary

This worksheet is procedural. No universal mathematical admissibility predicate is supplied by the current sources for the workshop's own principals, branches, lifecycle states, and disclosure rules. Any later Lean formalization must begin from an explicitly authorized, source-defined policy; do not invent the predicate and then treat its proof as validation of the policy.

## Source basis

- Wang et al. (2026), [The Right Memory in the Wrong Context](https://arxiv.org/abs/2610.07309).
- Fouilhé, Asher and Müller (2026), [Memory vs. Context?](https://aclanthology.org/2026.blackboxnlp-1.58/).
- Sonar (2026), [LSREP](https://arxiv.org/abs/2609.16730).

The sources motivate the distinctions above but do not validate this worksheet as a benchmark or safety certification.
