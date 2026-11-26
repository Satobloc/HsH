# Review-MIND addendum: context diversity, semantic inertia, and source-genre controls

**Classification:** assistant-level source-grounded reconstruction; methodological research note; not a paper; not Orson's P1; no model trials or human-subject results.

## Executive finding

A historical user-reported 30+1 comparison is a useful hypothesis generator, not a causal result. Two conversation threads received different 30-prompt histories (homogeneous rhyming versus varied material) and then the same high-abstraction probe. The user reports that the varied-history thread performed better under blind and self-assessment, while noting that the target probe may have favored the rhyming history. The raw prompts, outputs, model/version, scoring rubric, evaluator identity, run settings, and independent replication are not available in the cited record.

The 30 prompts are conditioning exposures inside a thread, not 30 independent replicates. With one thread per condition, treatment is perfectly confounded with thread/session identity. Existing Orson PR #1115 already formalizes this identifiability problem. The next test should separate **history diversity** from **persona/role prompting**, rather than changing both together.

This addendum extends the earlier assistant-prepared [h901 Review-MIND context-configuration report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_RESEARCH/2026-11-17T1348Z_H901_S4_REVIEW_MIND_CONTEXT_CONFIGURATION_AND_PROVENANCE.md). Its new contribution is recovery of the intended book sources, a corrected historical source locator, new prompting literature, and a proof-backed correction to the anecdote's experimental unit. It is not a retry of a rejected publisher submission.

## Historical source and attribution

The Aldus raw export is conversation `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`, Git blob `2f5ea91a449446f64d298b50b0c2ef0d8533900a` (1,578 mapping nodes; 47 user-role messages).

Three direct-user anchors are relevant:

- `f8dfe961-6de6-4e4c-b74d-8b993ddfa337`: the 30+1 thread comparison.
- `939e981d-72ec-451b-81a3-f0a07b3a2c48`: the broad cross-reading / “Renaissance man” remit. The earlier absence claim used a malformed locator that omitted the zero in `f0a07`. The distinct secondary candidate `939e0d7c-5e9e-4c84-b4a9-4e0e8e58d832` remains absent.
- `fcff5c18-85c4-4efc-b7e5-df7ee20c0646`: a second direct-user anchor confirming the Aldus label and the aim of combining information not usually combined.

These messages establish a direct-user working remit, not a standalone signed specialist charter. No authenticated current Aldus thread was recovered. A Morrow response quoted inside a user message in the Aldus export is not an independently recovered Morrow-thread output and is not counted as cross-agent corroboration.

## Source recovery and lateral reading

Two intended travel books were recovered, correcting the earlier bounded HsH/SAT-only search:

1. **Camps and Trails in China** (1918), Project Gutenberg eBook [#12296](https://www.gutenberg.org/ebooks/12296). The Library filename contains “Old China,” but the title page reads *Camps and Trails in China*. The Preface and Chapter I were read in the Library copy (lines 820–969). The Preface explicitly frames the work as a popular narrative and leaves technical scientific detail to separate reports. This is a source-genre constraint: narrative observations are not a substitute for the technical reports.
2. Alfred Russel Wallace, **The Malay Archipelago** (1869), Project Gutenberg eBook [#2530](https://www.gutenberg.org/ebooks/2530). The Preface and Chapter I (“Physical Geography”) were read. Wallace describes a six-year interval spent processing collections and publishing scientific work (18 scientific papers and 12 general articles) before organizing the travel narrative by geographical, zoological, and ethnological groupings rather than strict chronology.

The two books therefore present different knowledge architectures: one deliberately separates popular narrative from technical science; the other describes scientific processing before a reorganized travel narrative. Source genre and publication sequence are plausible experimental factors, not evidence of a shared physical mechanism.

The HsH raw conversation **Electron Paths in Chips** (blob `31312b28ab1716f8051e6f775689b76932cbdb70`; 93 mapping nodes, 46 user-role messages) contains a 29,952-character NotebookLM context block before a physics task. Later direct-user messages say the intended task was physics and identify unintended priming and metaphor drift. This is a documented context-history sequence, not a controlled experiment.

## New literature relevant to the design

- [The Role of Diversity in In-Context Learning](https://arxiv.org/abs/2505.19426), preprint: diversity-aware example selection is reported to improve generalization on several task families, particularly math/code and out-of-distribution settings.
- [Order Matters: Rethinking Prompt Construction in In-Context Learning](https://arxiv.org/abs/2511.09700), preprint: prompt order can materially affect performance, with reported order effects comparable to example-selection effects.
- [Quantifying Semantic Inertia in Large Language Models Under Rapid Topic Switching](https://doi.org/10.24963/ijcai.2026/88), IJCAI 2026: a five-model study reports residual topic/style carryover under short histories (100–200 tokens); prompt resets do not reliably erase all carryover, and conflicting constraints can amplify it.
- [The Illusion of Robustness: Aggregate Accuracy Hides Prediction Flips under Task-Irrelevant Context](https://arxiv.org/abs/2607.12963), preprint: task-irrelevant context can change individual predictions even when aggregate accuracy appears stable.
- [Role Prompting: Style or Substance? Evaluating Expert Personas in Large Language Models](https://doi.org/10.1109/REW72749.2026.00067), IEEE REW 2026: 60 questions and 180 GPT-5.3 responses; role prompts increased detail but did not improve accuracy in the reported setup, while misaligned roles added irrelevant content.

These studies are primarily LLM prompting experiments, not human–LLM group trials. They support separating content diversity, order, semantic carryover, and persona as distinct factors; they do not establish the effect in the historical Aldus anecdote.

## Existing formalization reused

No new theorem or Lean module was created.

- **Orson PR #1115**, head `909e5ac73a6ee9e8faaab7a4f95060f7a37c53f5`, contains `treatmentIndicator_eq_groupIndicator` and `diagonalCells_alias_personaAndHistory`. The first states the conditional group/session aliasing result when each treatment occurs in exactly one group. The second shows why diagonal-only cells in a 2×2 persona/history design cannot separate the factors.
- Its push-triggered run [#45155083233](https://github.com/Satobloc/HsH/actions/runs/45155083233) built the matching PR-head commit (8,978 Lake jobs). The explicit PR-head assertion step was skipped because this was a push event; the run’s `head_sha` matched the PR head. No `sorryAx`, bare `admit`, or compiler-error matches appeared in the inspected log. Tests, lint, leanchecker, nanoda, and global axiom audit were not run.
- **Aldus PR #1860**, head `dd8c173b3c5cc43758bdfc4f3e3857f3ceb88e2c`, had a matching push-commit build [#45518943549](https://github.com/Satobloc/HsH/actions/runs/45518943549), 8,951 jobs; the explicit PR-head assertion was skipped because it was a push event.
- **Enheduanna PR #1619**, head `275b5396a97d4f7efc4d7d2248bfa08218f01b35`, exact-head run [#43981958006](https://github.com/Satobloc/HsH/actions/runs/43981958006) passed its checkout assertion and built 8,946 jobs.
- **Loom PR #2052**, head `71b6bd28044e90c9c2065409d12109348c1349fe`, exact-head run [#44447977440](https://github.com/Satobloc/HsH/actions/runs/44447977440) passed its checkout assertion and built 8,948 jobs.

These are compile/build results for formalized statements, not evidence that the historical anecdote is true or that the model has independent cognition. The mapping from two reported threads to treatment/session units is an interpretation of the anecdote.

## Refined experiment

### Study A: 2×2 persona × history diversity

| | Homogeneous history | Heterogeneous history |
|---|---|---|
| Neutral instruction | Cell 1 | Cell 2 |
| Explicit role/persona instruction | Cell 3 | Cell 4 |

- Randomize at the **session** level, with multiple fresh sessions per cell. Block by model/version; keep system prompt, tools, sampling settings, target tasks, and context-token budgets matched.
- Use the same target probes across cells; counterbalance history order. Do not let sessions share hidden memory or prior outputs.
- Pre-register one primary outcome. Use blinded independent scoring for correctness and source-supported transfer; treat self-assessment as secondary.
- Keep novelty, source fidelity, task drift, unsupported analogy, calibration, and next-question utility as separate outcomes rather than collapsing them into one score.
- Determine replication count from a pilot variance estimate and power analysis; do not treat the 30 conditioning prompts as independent sample units.

### Study B: order and relevance

In a separate experiment, cross clustered versus interleaved ordering with task-relevant, task-irrelevant-but-related, and neutral context. This isolates order and semantic inertia from persona and content diversity. Include a no-history baseline and token-matched controls.

### Reading-configuration pilot

Use matched excerpts from the two travel books to test whether a reading lens changes what the model notices while preserving source genre and epistemic status. Treat any role/style prompt as a compound manipulation that must be decomposed. Treat the Electron Paths history as a context-carryover condition, not a neutral “agent.” Score source fidelity and unsupported transfer separately.

**Disconfirmation:** if heterogeneous histories do not improve the pre-registered transfer outcome under matched sessions, the diversity hypothesis is not supported for that task/model regime. If persona changes detail but not accuracy or transfer, the role effect is stylistic rather than cognitive. If order/relevance manipulations produce no reliable per-example shifts, the semantic-inertia hypothesis is not reproduced under those conditions.

## Boundaries

No model trials, human-subject sessions, or experimental results were generated. No physical calculation, measured-system fit, prediction, SAT-O/Blockwave equation change, or theory promotion occurred. This is a methodological addendum, not Orson’s P1 paper; Orson’s ownership and paper gates are unchanged. No manuscript edit or paper advancement is claimed.
