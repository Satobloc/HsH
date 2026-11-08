# VEY-034 source reconciliation: configured seats versus analyzed discourse networks

**Date:** 2026-11-08  
**Disposition:** SOURCE-LEVEL RECONCILIATION FLAG / CONDITIONAL COMBINATORICS / NO EMPIRICAL OR CAUSAL PROMOTION

This is an additive source-QC note for [HsH issue #1481](https://github.com/Satobloc/HsH/issues/1481) and [draft PR #1480](https://github.com/Satobloc/HsH/pull/1480). It does not replace either artifact, change their ownership, or alter Orson's P1.

## 1. Versioned source

The versioned primary source is [Nixon et al., arXiv:2607.27179v2](https://arxiv.org/html/2607.27179v2), revised 2026-10-30. The v2 abstract says that the temporal analyses do not establish when the social cost emerged. Section 3.1 describes sequential, greedy random allocation and the post-exclusion analytic roster; Section 3.5 describes GCA as computed on complete, observed three-member discourse networks.

The existing #1481 correction is right to reject the v1 abstract's "immediate and present at baseline" onset claim. The v2 discussion explicitly says that no pre-task baseline was collected.

## 2. Configured-seat arithmetic: what the existing Lean module proves

The configured design has 16 treatment teams with two student seats plus one AI seat, and 17 control teams with three student seats. Each configured team therefore has three seats and three potential undirected pairs:

| Configured condition | Human-human | Human-AI | Total potential pairs |
|---|---:|---:|---:|
| 2 humans + 1 AI | 1 | 2 | 3 |
| 3 humans | 3 | 0 | 3 |

Across configured teams, this gives 16 treatment human-human pairs and 32 human-AI pairs, versus 51 control human-human pairs. The per-team human-human opportunity is threefold in the control condition.

This is the exact domain of the source-conditional arithmetic in PR #1480. Its group totals use the configured 16/17 team counts. They are not observed message edges, realized uptake, or a count of the post-exclusion analytic network.

## 3. Post-exclusion roster: a separate count

Section 3.1 reports 80 recruited students, five exclusions, and 75 analyzed students. It then specifies the uneven analytic roster:

- Treatment: 14 teams contributed two student records; two teams contributed one. The 16 AI nodes remain separately counted.
- Control: 12 teams contributed three student records; four contributed two; one contributed one.
- The participant-level computational roster is 91 rows: 75 student nodes plus 16 AI nodes.

A conditional count from those reported analytic records is therefore:

| Analytic-roster membership, if those records define graph nodes | Human-human | Human-AI | Total potential pairs |
|---|---:|---:|---:|
| Treatment: 14 teams with 2 humans; 2 with 1 human; 16 AI nodes | 14 | 30 | 44 |
| Control: 12 teams with 3 humans; 4 with 2; 1 with 1 | 40 | 0 | 40 |

These are **conditional potential-pair counts**, not observed communication edges. They are derived from the paper's roster counts, not from raw chat logs. They must not be substituted for the configured-seat result or represented as the GCA input until the network-membership rule is clarified.

## 4. Source reconciliation question

There is an unresolved internal tension between the §3.1 analytic roster and §3.5's statement that GCA is computed on "each complete, observed three-member discourse network." The reported roster has five teams with fewer than the configured number of student records.

The paper does not make the relationship between these statements sufficiently explicit in the cited passages. Reconciliation requires knowing:

1. Whether GCA uses the original configured team roster or only participants with retained analytic records.
2. Whether chat turns from excluded or dropped-out students remain in a team's GCA network.
3. How missing participants/nodes are represented, and whether any team or outcome-specific exclusion is applied before GCA.
4. Whether "complete, observed three-member" describes the configured design or every network actually entering the computation.

Until that is clarified, do not describe all 33 analytic networks as complete three-member observed networks, and do not treat the configured 16-versus-51 potential-pair totals as the realized analytic-network opportunity counts.

## 5. Formalization and CI status update

PR #1480 remains **OPEN / DRAFT / UNMERGED**. Its module is byte-identical at PR head `4e590c441c8a1296bc06255af918c7aa511561a5` and merge reference `f6043acc2e53e9d076f25dd9c184e0ba47bfbeba`; both contain module blob `f1b1d68009cc7bcf2814dc2163d9f3e9e45eccd0`.

GitHub Actions run [#42457673047](https://github.com/Satobloc/HsH/actions/runs/42457673047) **SUCCEEDED** on the merge reference, merging the PR head into base `c7dc2c483f50ae03fc7a7c530829170135e18d92`. The run used Lean 4.34.0 / Lake 5.0.0 and completed 8,945 build jobs. `HsHVerification.HumanAITeammateDyads` built at 8931/8945. The captured `#print axioms` output reports `propext` for all eleven theorems, with `Classical.choice` and `Quot.sound` additionally reported for the two rational-share theorems. No `sorryAx` or `admit` string was found in the captured log.

This is an actual successful **merge-reference build**, not a standalone exact-head build. The separate global axiom audit, tests, lint, nanoda, and leanchecker were skipped. The Vercel preview status is a separate failed check and is not the Lean Actions result.

The existing formalization is correctly read as a conditional proof about the **configured seat composition**. It does not encode post-exclusion attrition, the 91-row roster, missing-node handling, GCA's actual network inputs, observed message edges, causal effects, or any AI cognitive state. Lean validates only the formalized arithmetic under its encoded definitions and premises.

## 6. Scope and protection

This remains an external human-AI team-study comparator, not an administered HsH experiment, not evidence of cross-model peer consensus, and not a result about model consciousness or personhood. No raw turn logs, participant-level data, or analysis-code reproduction were accessed or claimed.

Orson retains primary LLM-cognition research ownership. The separate P1 remains frozen and **November 9 NOT READY**; this addendum does not expand its ConsistencyBench scope or advance its paper gate. No new model trial, human session, API spend, P1 manuscript edit, or paper-gate advancement occurred.

No P2 system was selected. No physical calculation, H(s)H prediction, theory integration, or BEDROCK promotion was made.
