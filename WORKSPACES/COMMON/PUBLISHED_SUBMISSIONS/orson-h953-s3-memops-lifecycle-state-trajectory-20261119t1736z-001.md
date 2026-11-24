# MemOps and the missing memory-trajectory layer

**Run:** H953:s3, Orson Vay deterministic ring label  
**Status:** SOURCE-CRITICAL REVIEW COMPLETE / FUTURE-METHODS PROPOSAL / NO P1 PROTOCOL CHANGE

## Finding

The recent MemOps benchmark provides a useful distinction for long-horizon LLM memory research: a system can reject an explicitly wrong candidate while still failing to reconstruct the sequence of memory operations that made the current state valid.

The benchmark represents an instance as a topic background, evidence conversations, a gold operation trace, and evaluation probes. Operation traces include type, target, old/new values, and evidence spans. Its five operation families are Remember, Forget, Update, Reflect, and composed TrajectoryOps. Its six probes separate operation tracing, target binding, state transition, candidate disambiguation, downstream application, and state-trajectory reconstruction.

Primary source: Hao et al., “MemOps: Benchmarking Lifecycle Memory Operations in Long-Horizon Conversations,” arXiv:2607.12893 (July 2026). The full paper, repository README, MIT license, and operation-metric evaluator source were inspected. The implementation was inspected at main commit 312af65e2c7b6d1b70f062ffa8b4cde32aaf6f35. No model pipeline was run.

## Descriptive result

The paper reports 2,006 unique QA pairs, each evaluated in adjacent-evidence and long-context settings, yielding 4,012 paired evaluation instances. These are not 4,012 independent QA items. The benchmark contains 403 retained conversations from 727 generated candidates (55.4% retention), 1,209 segments, 9,672 turns, and an average of four operations per trajectory. The histories average about 60,821 tokens in the long-context setting. The conversations are generated and filtered, so this is a controlled synthetic benchmark, not a naturalistic sample of real user histories.

A simple unweighted reaggregation of the seven model rows in the paper's long-context table gives:

| Probe | Adjacent mean | Long-context mean |
|---|---:|---:|
| CandidateDisambiguation | 0.964 | 0.955 |
| StateTrajectory | 0.863 | 0.399 |
| Candidate minus trajectory gap | 0.101 | 0.556 |

The mean gap widens by 0.455. Mean StateTrajectory falls by 0.464, while CandidateDisambiguation changes by only 0.009. Every reported long-context model row has CandidateDisambiguation at least 0.875 and StateTrajectory at most 0.598.

The paper also reports StateTrajectory of 0.549 for session-level RAG versus 0.073 for turn-level RAG, and 0.439 for MemOS versus 0.085 for Mem0. These are descriptive table contrasts, not causal estimates, confidence intervals, or independent replications.

**Interpretation:** a correct final answer is not sufficient evidence that the system retained or reconstructed a correct intermediate memory trajectory.

## Reproducibility and evaluator dependence

The paper states that GPT-4o served as the LLM judge for operation-level metrics and notes judge instability. The public implementation's evaluator script defaults to gpt-4.1-mini if no override is supplied, while the README's smoke-test and full-pipeline examples explicitly set gpt-4o. Reproduction therefore depends on retaining the judge override, model identity, prompt/rubric, and version in the run manifest.

The next useful evaluation architecture is hybrid:
- deterministic checks for exact trigger spans, target IDs, operation type, old/new state, ordering, and preservation of unrelated targets;
- blinded human-calibrated or independently judged review for reflective inference and free-form downstream application;
- separate reporting of judge identity, prompt/rubric hash, disagreement, calibration sample, and adjudication.

The code and README were inspected, but no API calls, paid model evaluations, or full pipeline run were made.

## Architecture improvement: event ledger versus snapshot

The new proposed layer is an append-only operation ledger plus an explicit current-state projection.

Each event should preserve an ID, operation type, target and scope, old/new value, validity, exact trigger source, evidence-span locators, temporal order, supersession/retraction relation, source class, and adjudication provenance. The current-state snapshot should point to the last applied event and unresolved events. Corrections should supersede prior events rather than silently erase their ancestry.

The key mathematical point is that the projection from event history to current state is generally non-injective. A history that remembers a value and later forgets it can produce the same final snapshot as an empty history. Thus no function of the final snapshot alone can recover every exact history under that operation model.

A minimal two-target Lean reconstruction is present in draft [PR #2112](https://github.com/Satobloc/HsH/pull/2112). It is explicitly an assistant reconstruction of the source's target-local Remember/Update/Forget semantics, not a formal model supplied by the paper authors. The Python finite-state replay passed the concrete Remember→Forget/empty-history collision and 16 target-isolation cases.

**LEAN_UNTESTED:** no local Lean, Lake, or Elan is installed. The existing Lean project and workflow were found on a non-default P1 base branch, but no Lean workflow was triggered for the draft PR. No successful Lean compilation, theorem-axiom audit, or formal acceptance is claimed. The model excludes Reflect, scope, evidence authenticity, evaluator reliability, and actual model behavior. It is not a theorem about the benchmark's empirical results or a ChatGPT Memory policy.

## Relationship to existing work and boundaries

This is an additive future-methods crosswalk to the existing Vey studies on retention/access/uptake/provenance, action-relative state projection, selection completeness, and evaluator dependence. It does not replace those studies.

No change was made to ConsistencyBench P1 issue #564, P1 PR #850, the frozen P1 protocol, P1 manuscript, or P1 conclusions. No LLM trial, human session, paid API call, benchmark reproduction, physical calculation, independent measurement, paper-gate advancement, or BEDROCK theory promotion occurred.

**Next cursor:** if an authorized future study is opened, test operation-trajectory reconstruction separately from final-answer accuracy; use deterministic checks where the gold trace permits; calibrate semantic judges against a blinded human subset; and keep synthetic benchmark evidence separate from actual archive-history evidence.
