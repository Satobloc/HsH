# TRAIL: longitudinal persona-memory carryover and identifiability gate

**Classification:** source-grounded platform review plus conditional design theorem; no empirical reanalysis.

**Primary sources**
- Samadi et al., “TRAIL: A Platform for Configurable Human-AI Teaming Experiments,” arXiv:2607.12180v1 (2026-07-13): https://arxiv.org/html/2607.12180v1
- Official TRAIL project site, accessed 2026-11-08: https://trail.aminsamadi.org/

## What the paper specifies

TRAIL describes one configured AI teammate within a human team, with a stored persona/model specification, a four-stage message pipeline (batching, memory integration, participation decision, persona-aligned generation), short-term conversational context plus periodic reflective long-term summaries, chained sessions with persistent team and participant/AI identities, and per-message decision traces plus retrieval-query/context logging.

The reviewed paper does **not** specify whether reflective memory is reset, cloned, or carried across session boundaries, nor does it publish the exact per-team state-isolation contract. These items are NOT_SPECIFIED in the source reviewed, not proven absent from the implementation.

## Study-lineage caution

The paper's demonstration reports six sessions, about 51 students, 99 team-sessions, 4,495 messages, and cognitive-scaffolding versus socially-supportive personas. The official site separately describes an ongoing Temporal HAT study with 17 teams across five sessions and verbose versus terse personas. The relationship between these descriptions is unresolved; their counts, cohorts, and condition labels must not be merged without an author/source crosswalk.

## New design implication

**Persistent identity is not proof of persistent state.** If current persona and memory history vary together, a saturated two-factor mean model,

Y(p,h) = alpha + beta_persona*p + beta_history*h + beta_interaction*p*h,

shows that observing only the diagonal cells cannot separate persona and history effects. For any nonzero delta, shifting beta_persona by +delta and beta_history by -delta leaves both diagonal means unchanged. Observing all four cells identifies the four coefficients algebraically under the stated model. This is a conditional parameter-identifiability result, not causal identification and not evidence that TRAIL actually carries memory across sessions.

A direct-effect design can cross persona A/B with fresh versus standardized carryover memory, randomize at the team level, cluster repeated sessions within teams, and log memory snapshot hashes, parent-snapshot/reset/clone/carry-forward events, model/persona/prompt configuration, retrieval context, message visibility, request IDs, outputs, abstentions, and errors.

For a future multi-LLM peer study, each agent needs separately versioned memory and an explicit directed message-visibility graph. The reviewed TRAIL source describes one AI teammate per human team; it does not establish current multi-LLM-per-team support.

## Verification and limits

A conditional Lean 4/Mathlib formalization was added to draft HsH PR #1115: https://github.com/Satobloc/HsH/pull/1115. **Status: LEAN_NOT_RUN.** No compilation is claimed; the local toolchain is absent and no Lean Actions run is associated with the new PR head.

No participant data, raw team logs, platform code, model trial, human session, API call, API spend, causal result, or independent replication was accessed or produced.