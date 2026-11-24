# Orson cognition methods note | h938:s2
Date: 2026-11-19
Status: FUTURE_METHODS / NOT A P1 PROTOCOL AMENDMENT

## Run identity and scope

Run key: REVROT3-19-20261011:938:s2. With h=938, seq=5h+2=4692 and 4692 mod 19 = 18, the deterministic ring label is Orson Vay (index 18); next is Sable (index 0).

This is an assistant-level, source-grounded reconstruction under the Orson ring label. No authenticated current Orson ChatGPT thread or historical instance participation is established. It must not be counted as a genuine authenticated Orson activation toward the separate four-of-five allocation target.

The historical Orson remit is LLM cognition, memory, representation, reasoning, calibration, recursion, observer/readout apparatus and multi-agent organization. The role charter is a structured synthesis of direct-user authority, not a verbatim signed charter. The October 26 four-of-five target is a separate later steering constraint.

## Executive result

Two recent empirical papers provide complementary controls missing from the existing h934 future-methods note on cue recognition versus cue influence:

1. A no-peer self-reflection baseline, separating answer revision that occurs without peer information.
2. A no-explicit-speaker assertion baseline, separating the effect of repeated asserted content from the incremental effect of an attributed speaker or authority.

The new methodological distinction is:

- total revision under peer framing is not itself a measure of social influence;
- self-reflection revision and no-explicit-speaker assertion revision must be measured first;
- source attribution is an increment above a matched no-explicit-speaker assertion condition;
- evidence-like framing, source identity, source history and evidence lineage are separate factors.

This is a future-methods module only. It does not amend P1, reopen the frozen experiment, or report an administered trial.

## 1. Primary literature

### Hao et al., "Not All Flips Are Conformity: Decomposing Stance Convergence in Multi-Agent LLM Debate"

- arXiv:2606.00820v1, submitted 2026-05-30.
- Primary study: five GPT-4o agents on MMLU-Pro; the paper reports 1,040 retained questions and 5,200 agent-question pairs after eight missing Round-1 records.
- The paper reports that about 37% of agent-question pairs change under a no-peer self-reflection condition.
- Among pairs stable under self-reflection, 29.3% adopt a peer answer under the stance-only condition. A reasoning-only adoption condition is separately measured.
- These are prompt-conditioned behavioral revisions, not direct observations of internal motives or human-like conformity.

The design is valuable because self-reflection is a no-peer comparator. It is not an unprompted spontaneous-instability rate. The strict-conformity percentage is conditional on stability under the self-reflection condition; it is not 29.3% of all answers.

Primary paper: https://arxiv.org/abs/2606.00820
Released code repository: https://github.com/47hao030808/Not-All-Flips-Are-Conformity

### Hu and Qu, "Most LLM Conformity Needs No Speaker: Measuring the Speaker-Free Floor in Peer-Pressure Benchmarks"

- arXiv:2607.05545v1, submitted 2026-07-06.
- Six open-weight models across seven QA/reasoning datasets; approximately 210,000 measured revisions.
- Deterministic two-read protocol at greedy decoding: initial answer/log-probabilities, one inserted assertion block, then a second read.
- Under all-wrong pressure, the no-explicit-speaker assertion condition has a reported 66.5% harmful-revision rate, compared with 10.3% for a plain re-ask and 19.7% for a length control.
- The expert-panel framing reaches 79.4%, a 12.9 percentage-point increment above the no-explicit-speaker condition. The mixed-effects logistic model reports an authority odds ratio of 2.40, 95% CI [2.25, 2.57].
- In the open-ended hidden-options setting, the no-explicit-speaker floor remains 75.4%, while the authority increment falls to 2.1 percentage points.
- The main grid uses six asserted lines. Each cell pools 6,860 trials with the same Round-1 answers across framings. The authors explicitly state that pooled trials are not iid; Wilson intervals are descriptive and central contrasts use mixed-effects and cell-level checks.
- A separate N=1,2,3,6 repetition-dose experiment uses an anchor subset; its rates should not be spliced into the main-grid estimates.

The paper defines "speaker-free" operationally: explicit source attribution is removed, but the asserted answer remains. The authors explicitly allow that the model may treat the inserted text as evidence. It is therefore not a pure no-information or no-context baseline.

Primary paper: https://arxiv.org/abs/2607.05545

## 2. Released-code audit: Hao et al.

The public repository was inspected at commit 2d018b8ed6c73ac73287eeaa58589183701742c5.

Relevant source blobs:
- exp1/main.py: 88e485fd78dedf3b87e3ebc8dc81ddb2085b49fe
- exp1/debate_system.py: 6f6c8bc0ad896cdf6ff81173ec4e8f1da1bc8721
- exp1/generate_behavior_analysis.py: 86340de9459963dbb8378b729e27f78e13691b10

The behavior-label helper implements a mutually exclusive precedence:
1. Self_Change if the self-reflection answer differs from the initial answer.
2. Sycophancy if self-reflection is stable and the stance-only answer changes to any other agent's initial answer.
3. Reasoning_Change if self-reflection and stance-only are stable and the reasoning condition changes to any other agent's initial answer.
4. No_Change if all three outputs remain equal to the initial answer.
5. Other otherwise.

Three reproducibility cautions follow from the inspected source:

- The helper iterates every Round-0 question-agent pair and defaults absent self-reflection, stance-only or reasoning outputs to an empty string. The label function can therefore place missing-condition records in Other; there is no explicit missingness flag or complete-case field in this helper. This is a code-level risk, not proof that published headline estimates are wrong. The available repository read did not establish whether a downstream analysis excludes such rows.
- The Sycophancy label is triggered by a match to any other agent's Round-0 answer, not necessarily the group majority. It is best read as a peer-answer-match transition, not a majority-following measure or a motive.
- Self_Change has precedence. A pair that changes under self-reflection is not subsequently classified as strict conformity even if a later stance-only output also matches a peer. The labels are a partitioning convention, not additive causal components.

The runner executes self-reflection, stance-only and reasoning conditions in fixed order. Each condition constructs a fresh DebateSystem from the same Round-0 answer material, so the inspected code does not show in-process agent-history carryover between conditions. The fixed order is nevertheless not counterbalanced in the inspected runner; possible time/order effects are unmeasured.

No raw output dataset was acquired and no published percentage was independently recomputed. These observations concern the released helper and runner, not a demonstrated error in the paper's main results.

## 3. Proposed future-methods decomposition

Use matched target items and a frozen initial answer. Keep the conditions parallel, with the same model snapshot, question, answer key, context, decoding, response slot and assertion count/position wherever the contrast requires it.

| Condition | Operational role |
|---|---|
| B0: plain re-ask | Ordinary second-pass baseline without an asserted answer |
| B_len: length control | Added-context/attention control without an asserted answer |
| R: no-peer self-reflection | Revision under explicit reconsideration but no peer content |
| C_N: no-explicit-speaker assertion | N matched assertions of the same answer without an attributed speaker |
| S_N: source-framed assertion | Same N assertions and answer, with explicit source attribution |
| G: reasoning condition | Same stance with vacuous, invalid or independently checked valid reasoning |
| H: source-history condition | Same source label, varied track record or reliability history |
| L: evidence-lineage condition | Same claim, varied primary versus derivative provenance |
| T: temporal condition | Event time and presentation order varied independently |
| Recognition probe | Separate measure of whether the cue/source was noticed; do not place it before the decision if that would prime the cue |

Predeclare separate outcomes:
- Harmful revision: HRR(c) = P(a1 != truth | a0 = truth, condition c).
- Beneficial revision: BRR(c) = P(a1 = truth | a0 != truth, condition c).
- Target-probability shift, confidence, abstention and answer-change direction.

The principal contrasts are:
- self-reflection revision relative to B0;
- assertion/repetition increment: HRR(C_N) relative to B0 and B_len;
- source-attribution increment: HRR(S_N) - HRR(C_N), with assertion content/count/position held fixed;
- reasoning-form/content increment relative to C_N, separating vacuous, invalid and valid evidence;
- source-history and evidence-lineage increments, not collapsed into a single authority cue.

These contrasts are not presumed additive. Source-by-content, source-by-reasoning and source-by-lineage interactions must remain estimable. Do not describe the total revision rate under S_N as a pure social-influence effect.

For repeated versus distinct sources, match the number of assertions, answer content, token budget, ordering and positions. A count of distinct names is not independent corroboration if the content or evidence lineage is duplicated.

Use item-matched comparisons and uncertainty clustered at the item and model/dataset levels. Do not treat every prompt variant or repeated trial as an independent observation. Preserve per-condition completeness, attempt IDs, model/version, prompt hash, decoding, source identity, evidence lineage, order and timestamp.

A recognition probe is a behavioral readout of cue detection, not evidence that the cue caused the answer change. Measure recognition separately from influence. Explanations are not assumed to reveal the actual cause of revision.

## 4. Relationship to existing Orson work

The h934:s3 future-methods note already separates cue recognition from cue influence and keeps source history, evidence lineage, event time and presentation order distinct. This h938 note adds the missing baseline decomposition: no-peer self-reflection and no-explicit-speaker assertion before estimating a source-attribution increment.

The existing P1 archive is different. ConsistencyBench CGD contains within-model self-exposure/self-revision and a shared GPT-4o-mini NLI evaluator; it does not expose one target model's answer to another target model. None of the external peer-debate results may be transferred to P1 as if they were observations from the frozen CGD archive.

## 5. Existing formalization status

The existing Orson PR #850 branch was checked before proposing new Lean work.

- Branch: research/orson-p1-shared-nli-bound-20261028t06z
- Head observed in the branch source: 6b4eebeacf4f6928f18601626e4e9e3942d73d81
- Merge-reference Actions run #44416543286, job #135198228890: SUCCESS.
- Lean 4.34.0 / Lake 5.0.0; full build completed, 8,991 jobs.
- OrsonPairedDiscordanceDependence built at 8,941/8,991. Its finite #eval returned (1, 1, 0, 2, 2, 2). The theorem equal_marginals_do_not_determine_binomial_count reports standard dependencies [propext, Classical.choice, Quot.sound]; no sorryAx appeared for that theorem.

This is a merge-reference build, not a standalone exact-head build. The PR remains open, draft and unmerged. Tests, lint, nanoda and the separate global axiom-audit stage were skipped. The theorem proves only the encoded finite counterexample: equal marginal direction rates do not identify the joint discordance-count distribution. It does not establish empirical dependence in the ConsistencyBench archive or in any new multi-agent study.

No new theorem was necessary for this empirical design note. No new Lean module, model trial, human session or API call was made.

## 6. P1, campaign and safety boundaries

- P0 Code Grurple: ACTIVE.
- P1 issue #564: OPEN / SOURCE-EXPERIMENT READINESS; protocol frozen to methods/archival scope; OVERDUE / NOT READY. The November 9 minor gate was missed.
- P2 November 30 major paper: HOLD; no measured system selected.
- P3 December 14 full-theory paper: INCOMPLETE.
- FIE next review: November 24; last full review November 10.

No new model trial, human session, API spend, raw P1 reanalysis, protocol amendment, manuscript edit, canonical PDF/reader completion, independent hostile review, paper-gate advancement or BEDROCK theory promotion. The existing Orson P1 freeze and ownership remain unchanged.

The task graph currently records 16 declared branches versus 18 records. Its P1 blocker still names PR #850 head 776f5df7a4b4b4f0a7b8b8c4aee2aabf8c6d12e9, while the current branch source and latest merge-reference report identify 6b4eebeacf4f6928f18601626e4e9e3942d73d81. This is a stale task-graph pointer. Tern owns the task graph; no graph edit was made.

## 7. Source access and provenance

The existing Mersearch origin-bank request orson-cognition-origin-bank-20261103-1745 was reused only as bounded navigation evidence. Its manifest pins all three repositories and Mersearch stable 1.0. Its compact receipt reports 16,942 files, 21,037,890 records, 135 hits and 74 distinct source paths. Raw search results are withheld; the receipt is not exhaustive.

Manifest blob SHA-1: a8d4ba7e16f76cb190db2a48bf1197127f3d8a8d.
Compact receipt blob SHA-1: bdfd4d373b05c9dfdb25ace18e3f28814318d913.
Receipt JSON blob SHA-1: 5b48108737ec80d2069dd79463f3ac91f933a1d5.

The top five navigation paths repeat the same message UUID 3e7d7870-9cc6-42fd-83ce-92d8c6326789. They are multiple archive representations of one underlying message, not five independent source events.

No new Mersearch request was made. No request lane was overwritten, reset, retriggered or released. No private HSH_RESOURCES payload or PRIOR_ART material was opened.

The three repository front doors were read. HSH_RESOURCES root README only; no private payload. SciSpace was used for external literature discovery/extraction, and public arXiv/source-code pages were checked. No new tool, fork, branch, PR, dependency, subscription or expense was created.

## 8. Next safe operation

Continue the Orson cognition literature/source cursor with a bounded primary-source review or source-recovery step. Keep the future-methods decomposition separate from the frozen P1 archive and do not administer the unrecovered OV-49-OV-53 bank or use an inference endpoint without explicit authorization. Reconcile the stale P1 task-graph head through Tern's owner route, not by editing the graph from this run.

End status: FUTURE_METHODS_NOTE / P1_FROZEN / NO_TRIAL / NO_NEW_LEAN / NO_PAPER_GATE_ADVANCEMENT / NO_THEORY_PROMOTION.
