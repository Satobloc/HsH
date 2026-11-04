# Review-MIND source addendum: CGD second-pass input boundary and model-call identity

**Status:** source-derived assistant QC; public-safe methodological clarification; owner review requested. This is not an Orson-authored or Orson-accepted manuscript change. No P1 protocol, manuscript, PR, task assignment, or paper gate was modified.

## Finding

The pinned ConsistencyBench evaluator implements a contradiction-triggered second answer from the **same API model identifier**, but it does not pass the current first-pass answer into that second call.

The most precise operational description is:

**same-model-ID, prior-answer-conditioned second-pass answering.**

It is not direct editing of the current answer, and the source does not establish a persistent agent or conversational identity across calls.

## Source basis

Upstream source: `aayambansal/ConsistencyBench`, `src/evaluate.py`, Git blob `0453540cb7c19227601e59fb342fa93e736da849`.

Relevant source ranges:

- Lines 82–95: the repair prompt contains the prior question, prior final extracted answer, relation/premise, and current question.
- Lines 137–151: each `call_model` constructs a fresh system/user message list and calls the supplied model identifier.
- Lines 238–279: the contradiction-triggered branch invokes the second call with the repair prompt; the current first-pass raw response is not supplied.
- Lines 281–290: the result record retains initial and second-pass outputs and extracted labels.
- Lines 299–328: the shared NLI checker compares raw response prefixes, truncated to 500 characters.

Pinned source blob:
https://api.github.com/repos/aayambansal/ConsistencyBench/git/blobs/0453540cb7c19227601e59fb342fa93e736da849

## Typed input-dependency graph

Let Q_t be the current question, R_t^0 its initial raw response, and A_t^0 its initial extracted answer. Let Q_j,A_j^1 denote a prior question and its prior final extracted answer, and let P be the stored relation/premise.

1. Initial call: Q_t -> C_t^0 -> R_t^0 -> A_t^0.
2. Contradiction detector: prior raw response and R_t^0[0:500] enter the shared NLI checker; its stored outcome is a Boolean trigger.
3. Repair input: (Q_j,A_j^1,P,Q_t) -> repair prompt -> C_t^1 -> R_t^1 -> A_t^1.
4. Result record: retains R_t^0,A_t^0, the Boolean trigger, R_t^1,A_t^1, and the reasoning reference.

**Absent edge:** neither R_t^0 nor A_t^0 is an input to the repair prompt or second call. The second answer is generated afresh under prior-answer context. A difference between A_t^0 and A_t^1 is therefore a difference between two completions, not necessarily a direct self-correction of an answer the second call was shown.

The model identifier is reused, but the source creates a fresh request with only system and user messages. It supplies no persistent conversation/session identifier. “Same model” therefore means the same model-ID string in the code, not proof of the same persistent agent, backend instance, or unchanged provider weights.

## What is and is not retained

The result record retains the initial response/label and the second response/final label, so textual and label-level comparison is possible without new model calls.

The record does not retain the exact triggering prior-answer pair, raw NLI request/response, call IDs, prompt hashes, or a provider/backend snapshot. The Boolean contradiction flag is not a reproducible trace of the judge's reasoning.

The checker is a common measurement dependency, not a peer agent. It sees truncated raw answers without the corresponding question or premise and short-circuits on the first detected contradiction. The 17-model replay manifest does not contain an exact gpt-4o-mini target label, although several target labels are from the OpenAI provider family; this does not establish evaluator independence.

The archived target models are not shown one another's answers. Cross-model agreement is a retrospective aggregate comparison, not peer-to-peer deliberation or evidence of social influence.

## Implication for P1 wording

If the paper uses “self-revision,” define it narrowly as a second completion from the same model-ID conditioned on a prior answer and current question. Avoid implying direct editing of the current answer or continuity of a persistent agent.

A faithful source-level claim is:

> CGD can replace an initial extracted answer with a second answer from a fresh call using the same model identifier, conditioned on a prior question/answer pair and the current question; the current initial answer is not included in that repair call.

This clarification does not invalidate the archived results. It narrows the mechanism being measured and the causal interpretations available.

## Formalization and evidence limits

The source yields a definite dependency-graph obligation: under the extracted call signature, the repair prompt is invariant to changes in the current initial response when the prior Q/A, relation/premise, and current question are held fixed.

This is a candidate for a source-faithful Lean 4 formalization. **No Lean proof was run for this graph.** A formal proof of an extracted input relation would not establish that the source extraction is faithful, that an API backend is stable, or that the physical/psychological interpretation is true. No new Lean module or PR was created.

This is an information-flow/data-dependency graph, not a physical geometry plot, not a Factory Floor submission, and not a claim of assistant consciousness or personhood.

## P1 status and ownership

The live P1 protocol remains methods/archival scope unless Orson chooses otherwise. No new model calls, human participants, or human-LLM group sessions were conducted. No peer-influence result is inferred.

As of the reviewed P1 protocol and bounded repository/Library search, no canonical P1 LaTeX source, compiled PDF, readable reader route, or independent hostile review package was recovered. The November 9 P1 gate therefore remains **NOT READY**. P2 November 30 and P3 December 14 remain separate.

Orson retains primary P1 ownership. This note requests owner review only; it does not amend the frozen protocol, assign work, alter a paper, or advance a gate.

## Reproducibility

- Source blob: `0453540cb7c19227601e59fb342fa93e736da849`.
- HsH P1 protocol: `WORKSPACES/ORSON_VAY/P1_PROTOCOL_FREEZE_2026-11-02_METHODS_ARCHIVAL_SCOPE.md`.
- Prior Kestrel source audit: `WORKSPACES/KESTREL/2026-11-04T1548Z_REVIEW_MIND_CGD_SECOND_PASS_INPUT_GRAPH.md`.
- This addendum is a bounded source clarification, not an independent empirical replication.
