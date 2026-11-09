# TRAIL demonstration: causal-language, design-unit, and memory-state addendum

**Relationship:** Addendum to HsH issue #1490, “TRAIL persona-memory carryover identifiability gate.” This note records additional source-critical findings from a full-text review. It does not replace or repeat the earlier report.

**Primary sources**
- Mohammad Amin Samadi et al., “TRAIL: A Platform for Configurable Human–AI Teaming Experiments,” arXiv:2607.12180v1 (2026-07-13), especially §§4.2–5.5 and §6: https://arxiv.org/abs/2607.12180
- Full-text HTML mirror used for section/line inspection: https://academ.us/article/2607.12180/
- Official TRAIL site, accessed 2026-11-09: https://trail.aminsamadi.org/
- Conditional design formalization: HsH PR #1115, current head 7e3b3e5e1ac9933cd6a7c0f5c42879b469f34c7e.

## 1. The paper's own inferential boundary is narrower than its headline language

The demonstration-study introduction describes the deployment as a real longitudinal deployment “rather than a controlled experiment” (§5; full-text mirror lines 129–145). The Discussion states that it “was not a controlled causal contrast” and included no deep discourse coding (§6; line 210). The persona-contrast section reports the “design-consistent double dissociation” without significance tests (§5.5; line 190).

Accordingly, the cognitive-scaffolding versus socially-supportive contrast is a **descriptive, design-consistent pattern**, not an inferential statistical dissociation, causal effect estimate, or identified cognitive mechanism. The phrase “single blind persona change” should be read as a between-condition configuration contrast: two configured personas were reused across six sessions and presented under the same neutral nickname. The paper does not describe a within-team persona switch.

The platform's general ability to randomize conditions is not, by itself, proof that this particular demonstration supplies a fully reported randomized causal contrast. The article text does not provide enough allocation detail to independently verify the randomization procedure, allocation unit, or sequence for this deployment.

## 2. The experimental unit and repeated-measures structure are not fully reconstructable from the article

The demonstration reports approximately 51 students (52 from session six onward), 99 team-sessions, 4,495 messages, and six sessions. Table 2 lists 16, 17, 15, 17, 17, and 17 team-sessions across Tasks 1–6. The text says teams of three were formed each session and the same participant roster persisted.

The platform architecture describes persistent teams and stable participant/AI identities across chained sessions (§4.3). However, the demonstration text does not publish the session-by-session participant-to-team map or enough allocation detail to reconstruct whether the same three-person teams remained intact, were rematched, or changed after absences. The 99 team-session total also leaves three fewer observations than 17 teams across all six sessions; the article does not explain those missing team-sessions.

This is a reporting/replication limitation, not evidence of a defect in the platform or a claim that the underlying exports do not exist. It matters because the paper itself says valid inference should respect the nesting of messages within members and members within teams (§4.4). The public article does not provide the membership and assignment map needed to independently reconstruct that dependence structure.

## 3. Identity persistence does not establish memory-state persistence

The paper describes short-term conversational context plus periodic reflective long-term summaries, and says these are intended to maintain persona coherence over a session (§§4.2–4.3). It also describes chained sessions with persistent teams and stable participant/AI identities. It does **not** specify whether reflective memory is reset, cloned, or carried forward across session boundaries, or publish a per-team state-isolation contract.

Therefore the source supports:
- a dual-memory architecture within the described interaction pipeline;
- longitudinal chaining and persistent identity;
- no independently verified cross-session memory transition semantics.

It does not establish actual memory carryover, reset, or cloning. This preserves the earlier issue #1490 distinction: persistent identity is not proof of persistent state.

## 4. The official site's ongoing study is not safely mergeable with the paper's demonstration

The official TRAIL site currently labels “Temporal HAT — Going Longitudinal” as Study 3, described as 17 teams followed across five sessions with verbose versus terse AI personas. The paper's demonstration instead reports six sessions, approximately 51 students, and cognitive-scaffolding versus socially-supportive personas.

The relationship between these descriptions remains **UNRESOLVED** without an explicit author/source crosswalk. They may represent separate deployments or differently reported stages; neither identity nor separation should be assumed. Do not merge their cohorts, counts, persona labels, or outcomes.

## 5. The PR #1115 theorem is a conditional algebraic design result, not a result about TRAIL's observed data

The current `HumanAIMemoryCarryover.lean` source (blob `bc2aeb0b533fe85933bcb151d0642d222e0b4e21`) defines the saturated mean model

`Y(p,h) = α + β_P p + β_H h + β_PH p h`.

Its diagonal-cell theorem exhibits a nonzero `δ` transformation, `β_P → β_P + δ` and `β_H → β_H − δ`, that preserves both `(0,0)` and `(1,1)` means while changing the coefficient tuple. Its full-factorial theorem states that equality of all four cell means identifies the four coefficients under the stated model. The inverse relations are:

- `α = μ00`
- `β_P = μ10 − μ00`
- `β_H = μ01 − μ00`
- `β_PH = μ11 − μ10 − μ01 + μ00`

This is algebraic parameter identifiability conditional on the saturated model and observed cells. It is not causal identification, a power calculation, a repeated-measures analysis, or evidence that TRAIL manipulated memory history. The paper's reported demonstration does not include a persona × memory-history factorial manipulation.

**Formal verification status: LEAN_NOT_RUN.** The local runtime has no `lean`, `lake`, or `elan` executable. The current PR head has one associated workflow run, `conversation-json-content-ci`, which failed; it is not a Lean build. No Lean Actions run is associated with the current head. Manual inspection found no obvious gap in the two elementary algebraic arguments, but this is not compilation and no theorem is represented as compiled or independently checked. The PR remains draft/unmerged.

## 6. A stronger follow-up design

A first controlled study could cross persona A/B with fresh/reset versus standardized carryover memory, randomizing at the team level and pre-registering the estimands. If the question is whether memory content is team-specific rather than merely present, add a yoked-other-team-memory condition as a separate factor level. Repeated sessions require the actual participant/team map and an analysis that respects team and participant dependence; if membership changes, the design must record and model that cross-classification rather than assume stable teams.

At minimum, log immutable memory-snapshot IDs/hashes, parent-snapshot links, reset/clone/carry-forward events, team and session IDs, persona/prompt/model configuration hashes, retrieval context, message visibility, request IDs, contributions, abstentions, and errors. Obtain appropriate human consent and protect participant privacy. These are proposed design requirements, not actions performed.

## Limits

No raw participant data, team transcripts, platform source code, memory snapshots, or study exports were accessed. No empirical reanalysis, new model call, human session, API spend, independent replication, or causal result was produced. This addendum does not advance Orson's P1 manuscript gate or alter its ownership.
