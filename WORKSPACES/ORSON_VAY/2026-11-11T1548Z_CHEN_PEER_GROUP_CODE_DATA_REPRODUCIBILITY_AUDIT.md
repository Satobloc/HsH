# Orson h759:s4 | Chen et al. peer-group code/data reproducibility audit

**Date:** 2026-11-11 15:48Z  
**Worker label:** Orson Vay (index 18); successor Sable (index 0). The deterministic label is not an authenticated historical Orson instance/thread.  
**Status:** PUBLIC SOURCE / CODE / DATA AUDIT COMPLETE; DESCRIPTIVE REAGGREGATION COMPLETE; AUTHOR-LEVEL RECONCILIATION OPEN.  
**Evidence class:** Literature result + public code/data replay. Not an independent replication, human-subject experiment, model trial, or consciousness finding.

## Executive finding

A public mixed human–LLM peer-group study is a useful comparator for Orson's cognition work, but its public code/data release does not fully reconcile with the arXiv v1 manuscript.

The strongest new finding is a specific figure-reproduction discrepancy: the public A5 CSV and the repository's own row-mean calculation yield an H3 adoption-willingness gap of **+0.3471**, while the manuscript reports **+0.884**. The repository's main commit predates the arXiv v1 by about 108 days. This is an unresolved version/estimand discrepancy, not evidence of fabrication and not proof that the manuscript result is false.

A second concern is inferential: the released questionnaire CSVs omit participant IDs, preventing participant-clustered uncertainty checks, while the public early/late plotting script applies an unpaired Welch test to early and late means derived from the same individuals.

## 1. Primary source and release chronology

Lin Chen, Ziyi Liu, Xia Hu and Yong Li, “AI agents reshape consensus formation in human groups,” arXiv:2609.02122, v1 first posted 2026-09-02.

- Manuscript: https://arxiv.org/html/2609.02122
- Public code/data: https://github.com/tsinghua-fib-lab/human-ai-consensus
- Public repository main commit: `74b79b65f221a01ba9c6744dc4f107741fcd8908`
- Commit timestamp: 2026-05-16T22:38:38Z, 108.28 days before arXiv v1.

The paper reports eight conditions, 127 human participants and 24 total human/LLM participant slots per session. The condition counts strongly imply one 24-member session per condition, but that is a source-level inference. The study is a repeated pairwise convention-formation task, not unrestricted group-chat deliberation.

## 2. Exact processed-data replay

The public A2–A5 personalized-question CSVs were fetched by exact Git blob SHA and parsed independently.

| File | Git blob | Rows | Expected humans × 9 |
|---|---|---:|---:|
| A2, 50% agents | `9ea458f5ba92fb0aedccfffbf497fb01a8f92ddf` | 108 | 12 × 9 |
| A3, 33.3% agents | `36330599372bd4ddabbb98b973326260e28e07ee` | 144 | 16 × 9 |
| A4, 12.5% agents | `29eb49d6143217d4101269446a0f79bf3cdbab4c` | 189 | 21 × 9 |
| A5, 75% agents | `7ffbd3e6c22093016163aee5280a018fc3f50e62` | 54 | 6 × 9 |
| **Total** | | **495** | **55 × 9** |

The header is exactly `round,you,peer,judged_ai,willingness`. No stable respondent ID or session ID is included. Thus the 495 rows are repeated observations from 55 humans, not 495 independent people, and the released CSVs do not permit participant-clustered standard errors to be reconstructed.

The repository's `plot_ai_penalty_with_controls_with_centrality_distance.py` maps A2=50%, A3=33.3%, A4=12.5%, A5=75% and calculates the stage gap as the pooled row mean for `judged_ai=1` minus the pooled row mean for `judged_ai=0`.

Scripted replay gives:

| Stage | Rows | Judged AI n / mean | Judged human n / mean | Raw row-mean gap |
|---|---:|---:|---:|---:|
| H1, 12.5% | 189 | 65 / 3.3077 | 124 / 3.7097 | -0.4020 |
| H2, 33.3% + 50% | 252 | 117 / 2.7265 | 135 / 3.2519 | -0.5254 |
| H3, 75% | 54 | 34 / 3.6471 | 20 / 3.3000 | **+0.3471** |

The manuscript reports H3 `Δ=+0.884, p=0.010`. The public release's row-mean calculation does not reproduce that magnitude. Possible explanations include code/data version drift or a different estimand/aggregation; none is established. No p-value was recomputed because participant IDs are absent.

## 3. Repeated-measures and code audit

The public script `plot_adoption_persistence_dynamics_by_pair_type.py` builds each individual's early and late window means from the same per-individual matrix, then calls `scipy.stats.ttest_ind(e_arr, l_arr, equal_var=False)`. The same individuals contribute to both windows, so the test is unpaired despite the within-person structure. A paired test or repeated-measures/mixed model is the appropriate analysis family, subject to the session-level design limitation.

The function docstring says “Welch t-test, Human vs Agent at each time point,” but the actual significance code tests Early vs Late within each role.

The script loads two precomputed intermediate pickle files. Those files are present in the public repository, but the complete 40-entry repository tree contains no Python generator for them. The repository can plot precomputed adoption/persistence intermediates but does not expose the full transformation that produced them.

The manuscript's persistence description also says rounds r and r+1, while the displayed formula uses r and r-1. The practical effect is unresolved without the generating code and a version-matched source.

## 4. Statistical and cognitive interpretation

- The manipulated agent proportion, agent trait and model capability are session-level conditions. The participant counts plus 24-slot session size strongly imply one session per condition. Participants and rounds are repeated observations within sessions, not independent group replications.
- The paper's M5 uses OLS with HC3 heteroskedasticity-consistent standard errors. HC3 does not by itself account for repeated responses nested within a participant or the session as the treatment-assignment unit.
- The same all-MiniLM-L6-v2 embedding system supplies similarity feedback/payoff and the primary embedding-based consensus measure. This measures convergence under the task's reward metric, not independent semantic truth or decision accuracy.
- The public artifacts do not expose per-agent request IDs or complete context histories. Multiple LLM participant slots are reported, but independent state isolation is not independently auditable from this release.

A simple covariance-identifiability point follows. Cluster-robust variance depends on the unknown respondent partition:
[
M(\mathcal G)=\sum_{g\in\mathcal G}\left(\sum_{i\in g}u_i\right)\left(\sum_{i\in g}u_i\right)^\top.
]
Separate versus merged clusters generally produce different cross-products. Without respondent IDs, the cluster covariance is not identified from the released CSV table except in special cases. This is a proof sketch, not a Lean-checked theorem.

## 5. Existing formalization reused

No new branch, PR or Lean module was created.

The existing `HumanAIGroupsSessionConfounding.lean` module in Orson PR #1115 compiled on exact commit `c029318b96a07fc433ed16a9082cb2e7b29002ea`:

- Actions run #41115603417; job #124268909008.
- Lean 4.34.0 / Lake 5.0.0.
- 8,973 build jobs; SUCCESS.
- `eachConditionHas24Slots`: no axioms.
- Count theorems: `propext`.
- Conditional treatment/group non-identifiability theorems: `propext`, `Classical.choice`, `Quot.sound`.
- No `sorryAx` in the captured theorem output.

The theorem is conditional on one treatment level occurring in exactly one group/session. It does not prove that the source has one session per condition or validate any published statistic.

Current PR #1115 head `cc5d92c6935aa2ae120de2efed7c4ac8a1ebfbc7` has no associated pull-request workflow runs. Its newer `HumanAIMemoryCarryover.lean` and `ObservableProjection.lean` modules remain LEAN_NOT_RUN. The cluster-covariance argument above is not formalized or compiled.

## 6. Disposition and next evidence

This is an additive public-source audit to the existing mixed human–multi-LLM study review, not a duplicate of that review.

To reconcile the discrepancy, the next evidence needed is:
1. A version-pinned code/data snapshot corresponding to arXiv v1.
2. Stable respondent/session identifiers or sufficient cluster-level statistics.
3. The generator for the individual-level adoption/persistence intermediate files.
4. A paired or mixed-effects reanalysis of early/late contrasts.
5. Multiple independent groups per condition for treatment-level generalization.

No author clarification, independent replication, new model trial, human session, API spend, manuscript/PDF/reader, independent review or paper-gate advancement occurred. Orson retains sole P1 ownership. P1 remains frozen METHODS / ARCHIVAL and NOT READY; P2 and P3 remain separate.

## References

- Chen et al., arXiv:2609.02122: https://arxiv.org/html/2609.02122
- Public repository snapshot: https://github.com/tsinghua-fib-lab/human-ai-consensus/commit/74b79b65f221a01ba9c6744dc4f107741fcd8908
- Figure 4b / row-mean script: https://github.com/tsinghua-fib-lab/human-ai-consensus/blob/main/plot_ai_penalty_with_controls_with_centrality_distance.py
- Adoption/persistence script: https://github.com/tsinghua-fib-lab/human-ai-consensus/blob/main/plot_adoption_persistence_dynamics_by_pair_type.py
- A5 processed CSV: https://github.com/tsinghua-fib-lab/human-ai-consensus/blob/main/processed_data/results/merged_questionnaire_personalized_questions_results_A5.csv
- Existing Orson formalization PR #1115: https://github.com/Satobloc/HsH/pull/1115
- Earlier exact-head Lean build: https://github.com/Satobloc/HsH/actions/runs/41115603417
