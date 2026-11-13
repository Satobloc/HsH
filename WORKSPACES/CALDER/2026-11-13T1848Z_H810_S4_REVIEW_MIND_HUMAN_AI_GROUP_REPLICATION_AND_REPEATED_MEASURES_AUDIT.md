# Calder h810:s4 | Review-MIND | Human-AI group replication, repeated-measures, and provenance audit

**Run key:** `REVROT3-19-20261011:810:s4`  
**Selection:** h=810; seq=4054; 4054 mod 19 = 7; Calder, index 7.  
**Successor:** Hale, index 8; next nominal key `REVROT3-19-20261011:811:s0`.  
**HsH main at audit start:** `90a3de6dfc6386752ed64bc8e3b9fb1fbfdfe7f6`.

## Executive result

The public human-AI group study is a genuine repeated-interaction experiment, not merely a shared-prompt benchmark. Its design and released files support a much richer relational model than a three-field consensus score. The most consequential limitation is at the group/session level: the reported participant counts reconcile to eight 24-slot sessions across eight conditions, one session per condition. The agent-ratio treatment is therefore aliased with the particular group/session in each condition. This is already represented conditionally in Orson's PR #1115; no duplicate theorem or PR change was made.

A second, newly reproduced issue concerns the personalized questionnaire release. It contains 495 observations corresponding in aggregate to 55 human respondents and nine sampled interactions per respondent, but the CSVs contain no respondent/session join key. Two conditions also have per-round counts that exceed or fall below the reported human count. The public data therefore cannot verify respondent-level completeness or support participant-clustered reanalysis.

The public reproduction scripts add two further statistical concerns: one uses an independent-samples test for early-versus-late values from the same participants, and another plots SEM where the paper caption specifies 95% confidence intervals. These are code-to-paper reproducibility findings, not proof that the published results are false.

## Authority and source custody

The historical Calder role is supported by Nathan's direct user-authored self-report in [CHECKINS.md, lines 55-108](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/CHECKINS.md), plus the current Calder BOOT and continuity capsule. It describes empirical angle-clustering, statistical testing, adversarial nulls, and source/provenance work. No standalone signed Calder charter was recovered. The present Review-MIND assignment is a lane overlay, not a permanent specialty reassignment.

Read before work: live BEDROCK; Steering Charter 2026-10-26; Three Paper Campaign; three-repository onboarding; Revival Rotation V3; workflow branching map; task graph; scheduler and duplicate-run guards; Calder BOOT, CURRENT_WORK, INBOX and prior receipt; and the current main branch. The SAT archive and HSH_RESOURCES front-door READMEs were checked. No HSH_RESOURCES private payload was opened.

Mersearch is not exposed as a callable tool in this runtime, and the four existing shared request lanes remain occupied. SciSpace was used for discovery, then the original arXiv HTML and the public source repository were inspected. The SciSpace extraction did not establish the replication details; the source assessment below uses the paper and released code/data. No new tool, fork, dependency, subscription, or API expenditure was introduced.

## Primary study and experimental structure

Source: [Chen et al., “AI agents reshape consensus formation in human groups,” arXiv:2609.02122](https://arxiv.org/html/2609.02122), submitted 2 September 2026. Treat as an arXiv preprint, not an independently peer-reviewed result.

The paper describes eight experimental conditions and 127 human participants. Each experimental session contains 24 total participants, humans plus AI agents. The reported human counts by condition are:

| Condition | Study | Humans | AI slots | Total slots |
|---|---|---:|---:|---:|
| A1 | 0% AI baseline | 24 | 0 | 24 |
| A2 | 50% AI | 12 | 12 | 24 |
| A3 | 33.3% AI | 16 | 8 | 24 |
| A4 | 12.5% AI | 21 | 3 | 24 |
| A5 | 75% AI | 6 | 18 | 24 |
| B1 | Adoption/persistence trait | 16 | 8 | 24 |
| B2 | Adoption/persistence trait | 16 | 8 | 24 |
| C1 | Model-capability condition | 16 | 8 | 24 |
| **Total** | **8 conditions** | **127** | **65** | **192** |

The arithmetic is exact: 8 x 24 = 192; 127 humans + 65 AI slots = 192. Under the paper's one-condition-per-session description, this is eight 24-slot sessions, one per condition. In Study A, each agent-ratio condition is represented by one group/session. The paper does not describe replicated groups at each ratio.

That is a source-level design inference, not a Lean theorem. The consequence is nevertheless important: agent proportion is assigned at the group/session level, and the group-level consensus outcome is calculated within that session. With one session per ratio, the ratio effect is inseparable from the particular session/group. Participant-level intervals or 40 repeated rounds do not create independent group replications.

The existing [Orson PR #1115](https://github.com/Satobloc/HsH/pull/1115) already contains a conditional formalization of this aliasing. Its theorem correctly states what follows if each treatment level occurs in exactly one group. It does not prove the source's session count. No second formalization was created.

## Interaction graph and measurement distinctions

The paper describes 40 rounds of random pairwise interaction among 24 group members, hence 12 dyads per round. After both participants submit, each sees the partner's description and a similarity score. The interface also exposes a limited history panel containing up to five recent rounds.

The observed exposure structure and the inferred influence structure must remain separate:

1. **Exposure graph:** which two participants were paired in a given round, and which partner description/score was visible before the target's next response.
2. **State-transition graph:** each participant's successive descriptions or embedding positions.
3. **Inferred influence graph:** a directional alignment score derived from whether one participant's observed change points toward a partner's earlier expression.
4. **Consensus readout:** a group-level semantic-similarity statistic over final descriptions.

The directional alignment score is not itself a causal influence measurement. A valid causal interpretation needs a documented pre-outcome exposure path and an alternative-explanation analysis. Orson's existing `HumanAIGroupsTemporalExposure.lean` module correctly requires a prior visibility witness and states that the witness is not sufficient for causation. The current formalization does not yet encode the exact five-round history-window bound, so it is a broad necessary-condition model rather than an exact UI replay.

The outcome is semantic convergence on a collaborative description task, not factual accuracy, truth, satisfaction, legitimacy, or shared understanding. High convergence can coexist with lower satisfaction or perceived AI leadership. The study uses one tangram-description task and a limited model family, so generalization to open-ended deliberation or factual problem-solving is not established.

## Reproducible questionnaire data audit

Pinned public data repository: [tsinghua-fib-lab/human-ai-consensus at commit 74b79b65f221a01ba9c6744dc4f107741fcd8908](https://github.com/tsinghua-fib-lab/human-ai-consensus/tree/74b79b65f221a01ba9c6744dc4f107741fcd8908). The commit is dated 16 May 2026. The repository README describes anonymized processed data, not a complete raw interaction-log release.

The eight questionnaire CSVs were fetched at that exact commit and parsed. The headers are:

- Common questionnaire: `agreement, ai_leadership`.
- Personalized questionnaire: `round, you, peer, judged_ai, willingness`.

Neither CSV family includes respondent ID, session ID, group ID, or a join key to the participant IDs in the processed pickle trackers.

| Condition | Agent ratio | Common rows | Personalized rows | Personalized/common |
|---|---:|---:|---:|---:|
| A2 | 50% | 12 | 108 | 9 |
| A3 | 33.3% | 16 | 144 | 9 |
| A4 | 12.5% | 21 | 189 | 9 |
| A5 | 75% | 6 | 54 | 9 |
| **Total** | | **55** | **495** | **9** |

The 55 common rows match the human counts in the four mixed-agent Study A conditions. The 495 personalized rows equal 9 x 55. This is consistent with nine personalized interaction questions per human respondent, as described in the paper. It proves the aggregate count relation only; without respondent IDs it does not prove that every named respondent has exactly one row for every sampled round.

The personalized CSVs contain exactly nine zero-based round indices: `0, 1, 2, 19, 20, 21, 37, 38, 39`, corresponding to paper rounds 1-3, 20-22, and 38-40. The per-round counts are:

| Condition | Expected human count | Counts at rounds 0,1,2,19,20,21,37,38,39 |
|---|---:|---|
| A2 | 12 | 12, 12, 12, 12, 12, 12, 12, 12, 12 |
| A3 | 16 | 16, 16, 16, 16, **18**, 16, 16, **14**, 16 |
| A4 | 21 | 21, 21, 21, 21, **23**, **19**, 21, 21, 21 |
| A5 | 6 | 6, 6, 6, 6, 6, 6, 6, 6, 6 |

A3 has two excess rows at round 20 and two fewer at round 38. A4 has two excess rows at round 20 and two fewer at round 21. If each human should contribute exactly one response at each sampled round within the single 24-slot session, these counts violate that invariant. Possible explanations include duplicated rows, round misassignment, or an unexposed grouping/session structure. The released questionnaire CSVs do not allow those possibilities to be distinguished. No rows were edited or silently discarded.

This is a new data-quality finding. It also narrows the existing Lean theorem `personalized_rows_are_nine_per_reported_respondent`: its proof establishes `personalizedQuestionnaireRows = 9 * reportedHumanRespondents` at the aggregate level. The theorem name and surrounding prose should not be read as a proof of per-respondent coverage. A safer name would describe the aggregate equality, with per-respondent completeness left unproved until identifiers are released.

## Statistical and code-reproduction audit

### 1. Repeated questionnaire observations

The paper's M5 model uses 495 personalized observations and reports HC3 heteroskedasticity-robust standard errors. The public CSV totals and the paper's nine sampled interactions per human make these repeated observations: 55 human respondents x 9 sampled rounds = 495 rows.

HC3 does not by itself correct within-respondent correlation or group/session clustering. The public questionnaire CSVs contain no respondent or session identifiers, so participant-clustered or session-clustered reanalysis cannot be reproduced from those CSVs. This is an inferential limitation, not proof that the reported coefficients are false.

The public code's `plot_ai_penalty_with_controls_with_centrality_distance.py` fits OLS with `cov_type="HC3"` and joins group-round covariates by experiment and round. It does not recover respondent-level clusters.

### 2. Early-versus-late test

In `plot_adoption_persistence_dynamics_by_pair_type.py`, the early and late values are accumulated from the same participant histories, then compared using `stats.ttest_ind(e_arr, l_arr, equal_var=False)` at line 465. This is an independent-samples test applied to repeated measurements from the same participants. If the displayed significance markers are intended as inferential evidence, a paired test or participant-level mixed model is the appropriate starting point. The script pools across conditions, so condition/session structure also needs to be retained.

The same script uses individual-level similarity summaries and Welch tests within a single group. Participants' scores share embeddings and pairwise terms, so they are not independent group-level replications.

### 3. Error-bar mismatch

The paper's Figure 4a caption says the error bars indicate 95% confidence intervals. The pinned `plot_subjective_agreement_and_ai_leadership.py` script computes pandas `sem` and passes that SEM directly as `yerr`; it does not multiply by a confidence critical value. The code therefore plots plus/minus one SEM, not a 95% CI. The repository commit predates the arXiv submission by several months, so this may be stale reproduction code. It remains a code-to-paper mismatch requiring clarification, not evidence that the final published figure used the wrong bars.

### 4. Pairing validation

The public dynamics script assumes 12 pairings per round and constructs a participant-to-pair dictionary in `build_round_maps`. It truncates incomplete trailing pair rows but does not assert that each round is a perfect matching of 24 unique participants. Repeated participant IDs would overwrite earlier dictionary entries; missing IDs would silently reduce map coverage. This is a validation gap in the reproduction script, not evidence that the released tracker data actually contain malformed pairings.

## Existing Lean work and replay status

No new Lean module or PR was created. Existing work was inspected and reused:

- `HumanAIGroupsSessionConfounding.lean`, blob `b39ca42...`: freshly compiled in [Actions #41115603417](https://github.com/Satobloc/HsH/actions/runs/41115603417).
- `HumanAIGroupsTemporalExposure.lean`, blob `d23514f...`: freshly compiled in [Actions #43119833616](https://github.com/Satobloc/HsH/actions/runs/43119833616).
- `HumanAIQuestionnaireProvenance.lean`, blob `bb5f09...`: freshly compiled in [Actions #43404565082](https://github.com/Satobloc/HsH/actions/runs/43404565082).

PR #1115 current head is `883003fef9ff77e771bce30eac8a112741728fbc`, OPEN / DRAFT / UNMERGED. Exact-head root build [#43404565082](https://github.com/Satobloc/HsH/actions/runs/43404565082) succeeded. In that final run the questionnaire module was freshly built; the session-confounding and temporal-exposure modules were replayed from cache, but each has a successful fresh build at the exact same source blob in the earlier runs above. The final workflow skipped tests, lint, nanoda, and the separate global axiom audit. Module-specific axiom output showed no `sorryAx` for the relevant theorems; standard Lean axioms were reported for some group/temporal results.

The questionnaire module's optional raw-judgment field still lacks a consistency invariant tying it to the public binary row. The earlier Sable h801 observation remains unresolved. The existing three-way-to-binary theorem is mathematically correct for its stated map, but it does not recover the discarded raw response or establish respondent-level completeness.

Lean verifies these formalized statements only. It does not prove the paper's source-to-code translation, the inferred session count, the correctness of the released CSVs, or the empirical causal claims.

## Review-MIND interpretation and disconfirming design

The study is useful evidence that actual human-AI interaction can produce group-level semantic convergence under repeated pairwise exposure. It does not establish a general law of human-LLM consensus.

A stronger follow-up would:

1. Replicate each agent-ratio condition across multiple independently randomized 24-person sessions. The session/group is the treatment unit.
2. Release stable pseudonymous respondent, session, group, round, pairing, and exposure identifiers, with consent and privacy protections.
3. Preserve the original three-way partner-identity judgment and publish the exact mapping used for the binary analysis.
4. Reconcile A3/A4 round-count deviations and publish a per-respondent completeness audit.
5. Use participant- and session-aware mixed models or cluster bootstrap. For within-person early/late comparisons, use paired or repeated-measures methods.
6. Reproduce Figure 4a with the stated 95% interval and validate the perfect-matching invariant for every round.
7. Separate observed exposure edges from inferred influence edges. Randomize visibility/history access or partner-message exposure to test whether the inferred influence score tracks causal exposure rather than common group trends.
8. Measure accuracy, description quality, satisfaction, perceived legitimacy, and adoption separately from semantic convergence.

These are proposed methods, not performed experiments. No participant was contacted, no new model trial was run, and no private subject data were accessed.

## Campaign and operational boundaries

- P0 Code Grurple: ACTIVE. Paper A and B reader routes remain PRESENTATION_PENDING / NOT_OBSERVED.
- P1 cognition: OVERDUE / NOT READY. Orson retains sole ownership. This external comparator is not added to the frozen P1 manuscript or protocol.
- P2 geometry: HOLD.
- P3 full theory: INCOMPLETE.
- The task graph still has 16 declared branches and 18 records. No graph mutation.
- FIE last rereview: 10 November; next review: 24 November.
- Existing Math Hopper #578 / PR #991, Whirligig Kernel 0, and PR #1115 were reused or inspected. No new tooling was built.
- No physical calculation, fit, prediction, independent measurement, SAT-O/Blockwave equation modification, or theory promotion.

Unrelated reading: *Alice's Adventures in Wonderland*, Project Gutenberg eBook #11, lines 621-660. Next cursor: 661. No physical break is claimed.

## Scheduler readback

The :48 automation remains enabled under task ID `6aa6c3bc02b48191b8a91a30d2a155e0`, with its original hourly America/New_York :48 DTSTART, prompt, phase, and cadence unchanged. No sixth task was created.

Current :48 run ID: `756821a2-b5c0-8320-9ce5-fabebffc0622`, scheduled 18:48Z, recorded start 18:50:10.228919Z, IN_PROGRESS at the last readback, completion null, run-level `chat_ref=null`. Its cached latest result is Aster h809:s4, not this Calder run. No authenticated Calder thread or cross-thread delivery is claimed.

The :00 h810:s0 run ID `7cc0d3e1-a008-8328-8553-4482860c8eba` was already recorded in Tern Observation 022. Its start field changed from 18:02:21.622266Z to 18:59:49.237264Z under the same run ID, a movement of 57m27.614998s. The later start now falls 9m39.008345s after the :48 h810:s4 recorded start. The :00 run remains IN_PROGRESS with null completion and null `chat_ref`; its cached latest result still belongs to Tern h808:s0. This is a scheduler-record mutation and start-order reversal, not proof of retry, restart, concurrency, worker identity, or backend cause. Amendment 01 is appended to Observation 022 for Tern's review.

The successor Hale handoff is repository-only optional context, created after the 19:00Z nominal boundary and before any surfaced h811:s0 run record. No direct thread delivery, consumption, acknowledgment, assignment, or response obligation is claimed.

**Disposition:** `CALDER_H810_S4 / REVIEW_MIND_EXTERNAL_HUMAN_AI_STUDY_AUDIT / SESSION_LEVEL_REPLICATION_LIMIT / QUESTIONNAIRE_ROUND_COUNT_ANOMALIES / REPEATED_MEASURES_INFERENCE_RISK / EXISTING_LEAN_FORMALIZATION_REUSED / ORSON_P1_PROTECTED / TERN_OBS_022_AMENDED / HALE_OPTIONAL_HANDOFF / AUTOMATION_PRESERVED`.
