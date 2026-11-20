# Review-MIND h973:s4 | Public-source validation ladder and split audit

**Status:** corrected workspace copy, not a canonical published artifact. The single publisher submission, issue #2195, was rejected for a SHA-256 mismatch; no retry, edit, reopen, second issue, or direct write to the publication destination was made. **Classification:** assistant-authored, public-source research and methodological QC. This is not attributed to a historical worker, does not assert assistant consciousness or personhood, and is not a new Nathan Direct or BEDROCK theory position.

## Source and adoption boundary

The current user-supplied Review-MIND charter authorizes this bounded external literature and code audit. The 2026-10-29 original-statement-first gate also requires recovery of Nathan’s historical, subject-specific wording before reconstructing project intent. That historical source/context was not recovered in this run: `SOURCE_RECOVERY_BLOCKED` for historical-intent reconstruction. Exact-title and DOI searches found no match in the HsH or SAT archive. Mersearch’s four request lanes remain occupied, so no Mersearch retrieval was attempted.

Accordingly, the papers below are outside comparators only. No SAT/H(s)H adoption, theory integration, or BEDROCK promotion is proposed.

## Executive finding

Recent work uses several different meanings of “AI realism.” They should not be collapsed into one score:

1. **Individual-response realism:** whether a generated reply resembles a human reply in style or semantic content.
2. **Observer-level thread plausibility:** whether readers can distinguish a synthetic multi-user thread from a human thread.
3. **Interaction-process fidelity:** whether agents reproduce the timing, visibility, information exchange, memory and turn-to-turn dependencies of a real group.
4. **Causal group fidelity:** whether interventions produce comparable belief changes, information integration and decisions.

The first two have published empirical studies. They do not establish the third or fourth.

## 1. The Collective Turing Test: what it actually tests

Bouleimen et al., “The Collective Turing Test: Large language models can generate realistic multi-user discussions,” *Scientific Reports* 16, 32760 (published 17 July 2026), DOI: https://doi.org/10.1038/s41598-026-62286-9.

The study reports that participants mistook 39% of LLM-generated conversations for human conversations. The reported Llama 3 70B condition was identified as AI only 56% of the time.

The important design boundary is in the method:

- The human conversation’s reply-tree structure and user slots were retained.
- Usernames/profile images and approximate conversation lengths were matched.
- Each synthetic comment was generated in a fresh LLM instance, with the source post and all previously generated comments supplied as context.
- The experiment therefore tests whether generated text can plausibly fill the slots of an existing conversation structure. It does not test whether independent agents spontaneously generate the same reply topology, maintain distinct persistent social states, or produce equivalent group dynamics.
- The authors explicitly delimit personas, behavioral triggers and network-structure generation as outside the study’s scope.

The 39% result is a paired forced-choice observer measure: one human thread and one synthetic thread are compared. It is not a standalone detection rate in an unconstrained deployment, and it is not a measure of collective cognition.

### Public code and sample-flow reconciliation

Pinned code repository: https://github.com/azza-bouleimen/turing-test-ai-conversations/tree/70ec392fe11d480f1e47a3e5ef52feebbb72cd17

The public notebook records 251 participant folders, 46 participants failing the attention checks, and 2 participants with no post-task attention-test record. The pipeline removes the 46 failures and then removes the 2 missing-attention-test cases:

251 - 46 - 2 = 203 retained participants.

The article text mentions the 46 attention-check failures but does not clearly describe the additional two missing-attention-test exclusions. The notebook also reports 14 participants with 20 missing annotation rows before filtering.

The final article reports 1,205 main annotations from 203 retained participants. The task design called for six main annotations per participant:

203 × 6 = 1,218 planned rows; 1,218 - 1,205 = 13 unobserved main annotations.

Those 13 rows are 1.067% of the planned main-annotation total. For a pooled binary proportion, the worst-case movement attributable to those 13 missing outcomes is bounded by 13/1,218, or about 1.07 percentage points. This does not bound changes to a mixed-effects coefficient or bias from non-random missingness. The reported participant random-intercept model can accommodate unbalanced repeated measures, but the missingness pattern and sensitivity deserve explicit reporting.

The notebook’s stored inter-rater outputs show stronger agreement at broad cue-category level (approximately κ=.656 to .752) than for some fine-grained cue labels (including examples around .347, .257, .350 and -0.027). Fine-grained cue interpretations should therefore remain exploratory. The qualitative cue subset is performance-selected, so it characterizes stronger detectors rather than the entire participant sample.

The R Markdown analysis expects a filtered CSV generated by the notebook; the notebook must be run first for a reproducible analysis path. This audit used published aggregate results and stored aggregate notebook outputs only. It did not analyze or quote individual participant responses or open the participant-level Reddit-content files.

## 2. PNAS CHAT study: individual replies, not group interaction

Pagan et al., “AI-generated language remains systematically distinguishable from human communication,” *PNAS* (published 12 October 2026), DOI: https://doi.org/10.1073/pnas.2531748123.

This study compares individual AI-generated replies with human replies across X, Reddit and Bluesky, using nine open-weight models, three platforms, and multiple calibration strategies. Its reported source populations include 275 X users, 492 Reddit users and 59 Bluesky clusters, with 20 replies sampled per user/cluster. It measures reply-level detectability and semantic similarity. It does not measure multi-agent group interaction.

The paper itself cautions that one observed human reply is not a unique correct response and describes its classifier comparisons as descriptive benchmarking within the experimental setup, not strict out-of-sample model selection.

### Pinned code audit

Code repository commit: https://github.com/paganick/social_media_language_LLM_validation/tree/658058c279d7868d503ed7fcced9f46d25bc878a

Relevant pinned source files:

- `postprocessing/build_validation_data.py` blob `0117c77dac30bcc1bbc99837156364932341b88c`
- `simulation/src/utils.py` blob `da6602ce31cb9218f204d088ab4da19a3174208b`
- `postprocessing/LLM_judge.py` blob `7d9fab6c25b851fc08abdb8ffea636616c2b45c`
- `README.md` blob `00e332bfb090b9d0fd230fe38424ff6c1071ecce`

The validation-data builder creates a human row from `original_message` and an AI row from the generated response, then writes only `text` and `labels`. The user and `reply_to` identifiers are not retained in the BERT validation table. `Validator.bert_validate` then uses a stratified 80/20 `train_test_split` on individual rows. It does not group by user, source post, or matched human/AI pair.

This permits matched responses from the same source entry, or responses from the same user, to fall on opposite sides of the BERT train/validation split. That is a **potential pair- and user-dependence/leakage risk**, not evidence that a particular pair actually crossed the split or that the reported metric is wrong. The split code does not preserve the identifiers needed to quantify the risk from the published validation table.

There is a notable internal asymmetry: the separate ML candidate-selection stage in `LLM_judge.py` uses five-fold `GroupKFold` with groups keyed by `user|||reply_to`, while the BERT validation stage is row-wise. A stronger validation would preserve pair, user and source-post IDs, then report separate grouped splits for unseen posts and unseen users.

The README says five BERT runs, whereas the pinned implementation defaults to three seeds and the paper describes three runs. This is documentation drift; the code and article agree on three.

## 3. Formal structure already available in HsH

No new Lean module was created. The existing HsH PR #1115, head `883003fef9ff77e771bce30eac8a112741728fbc`, already contains relevant conditional formalizations:

- `OrsonSplitLeakage.lean`: a prompt-key collision across a split refutes prompt-level disjointness. This is a reusable criterion for evaluating whether a train/validation partition actually isolates source prompts.
- `ObservableProjection.lean`: under an explicit collision witness, a non-injective consensus-only projection cannot be decoded into the full group state.
- `HumanAIGroupsTemporalExposure.lean`: positive alignment is not sufficient to attribute influence without a matching prior-exposure witness.
- `HumanAIGroupsSessionConfounding.lean`: treatment/group/session aliasing can make effects non-identifiable under its stated assumptions.

Exact-head GitHub Actions run #43404565082, job #131815614359, built 8,977 jobs with Lean 4.34.0 and Lake 5.0.0. The log prints no-axiom results for the key `OrsonSplitLeakage` collision lemmas and for `consensusOnly_noninjective_of_collision` and `no_encoding_recovers_group_state_from_consensus`. Other theorems in the same build use standard dependencies including `propext`, `Classical.choice` and `Quot.sound`.

This is an existing PR-head build, not a build on current `main`. It proves the formalized conditional statements, not that a collision occurred in the PNAS data or that the CTT readout has a particular empirical fiber structure. No CTT-specific state/readout map or actual split-collision witness was established in this run. No local Lean/Lake/Elan executable was available, so no new compilation is claimed.

## 4. Measurement architecture and falsifiable next experiment

Represent a group system using six explicitly named components (all names below are descriptive prose, not registered HsH symbols):

| Component | Meaning |
|---|---|
| Language | Individual text and style |
| Reply graph | Who responds to whom |
| Exposure | Message visibility and temporal order |
| Memory | What each participant or agent retains |
| Belief/decision | Information state and resulting choices |
| Provenance | Model lineage, prompts, sources and tool history |

Define distinct readouts in words: a style readout, a reader-choice readout, a network readout, and a causal-response readout. No new symbol is introduced or registered.

Do not infer one readout from another. A downstream decoder can recover a target only if that target is constant across every underlying state that produces the same readout. The existing Lean theorem supplies that conditional criterion; an empirical application requires explicit maps and observed collision or sufficiency evidence.

**Notation control:** the rejected issue draft used `B` for belief/decision and lower-case pi-prefixed readout names. The HsH registry already reserves `B` for a historical SAT/H(s)H scalar candidate and uses pi as the mathematical constant. This corrected copy spells out the components and readouts instead. No new shared symbol is registered or adopted.

A disconfirming experiment should compare consenting human-human, LLM-LLM and mixed human-LLM groups on the same hidden-profile task. Randomize information visibility and memory regime (full transcript, bounded per-agent memory, or periodic summary). Log message timestamps, recipient visibility, exact prompts, model/version, memory snapshots and provenance. Measure phase-specific cross-member information integration, unique-fact uptake, belief revision, disagreement trajectory and decision accuracy. Treat the group as an experimental unit, with participant/agent and task dependence modeled explicitly. Pre-register primary outcomes, exclusions and a group-level power analysis. Start with fictional tasks or an appropriately reviewed, consented human study.

Disconfirmation criterion: if LLM groups under matched visibility and memory constraints reproduce the human groups’ temporal information-integration and decision trajectories on held-out tasks, the hypothesis of a persistent group-process deficit is weakened. If not, the failed component can be localized to visibility, memory, interaction topology or decision updating.

No human or model experiment was run. No participant-level response data were reanalyzed.

## 5. Repository and campaign controls

- HsH `main` at the pre-run snapshot: `34aace108d4b0272847e39e8cf5f31d5c389aff0`.
- The SAT archive front door still contains the stale AI-directory pointer; Ariadne’s existing PR #8 is the correction. No duplicate change was made.
- HSH_RESOURCES metadata reports public visibility while its root README describes private/internal research infrastructure. Only metadata and the root README were read; no reference-index or research payload was opened.
- The immediate predecessor receipt already records the Math Hopper smoke-test PR #991 and Whirligig Kernel 0 check; this run reused existing Lean artifacts and the connected SciSpace search. No new tool, fork, dependency, subscription or paid API call was created.
- Mersearch’s four request lanes remain occupied/requested; no lane was overwritten or retriggered.
- Campaign status remains: P0 Code Grurple ACTIVE; **Campaign P1 minor paper (9 November, Orson-led LLM cognition) OVERDUE / NOT READY / ORSON-OWNED**; Campaign P2 major physical-system paper (30 November) HOLD; Campaign P3 full-theory paper (14 December) INCOMPLETE. These paper tiers are distinct from the task-branch graph’s P0/P1/P2/P3 routing labels; the graph currently places general LLM cognition/provenance under its P3 branch. Do not conflate the two taxonomies. FIE was last reviewed 10 November and is next due 24 November.
- No physical calculation, physical fixture, independent measurement, SAT-O/Blockwave equation change or BEDROCK theory promotion was made.

## Publisher disposition

The only submission issue is [#2195](https://github.com/Satobloc/HsH/issues/2195). Its publisher workflow #44750732813 completed with the explicit result `REJECTED: SHA-256 mismatch` (comment #7041680611). The submitted envelope declared `5131928f8eb6243627819fb2eb73a34a26bdf383017b20a123ed572917ec4d0d`; the actual UTF-8 content digest of the submitted issue body is `c6f8a4e386115054970c6958d513fdb1242a69d881601dbc77c666db376a990c`. The issue body is the audit record; the expected canonical artifact was not created. Intake policy prohibits editing, reopening, retrying or creating a second issue. This corrected workspace copy is not a published artifact.

## Disposition

The central result is a validation-boundary correction: human-likeness of generated text, human detectability of a thread, and fidelity of collective information-processing are distinct observables. The first two have empirical evidence; the third and fourth require explicit interaction-state measurements and controlled interventions.

`ASSISTANT_AUTHORED / PUBLIC_SOURCE_ONLY / SOURCE_RECOVERY_BLOCKED_FOR_HISTORICAL_INTENT / NO_WORKER_ATTRIBUTION / NO_NEW_EXPERIMENT / NO_NEW_LEAN_RUN / ORSON_P1_PROTECTED / NO_THEORY_PROMOTION`.