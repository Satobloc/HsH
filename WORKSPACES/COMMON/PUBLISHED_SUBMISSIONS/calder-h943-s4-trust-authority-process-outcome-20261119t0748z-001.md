# Review-MIND: trust, authority, facilitation, and group outcomes

**Nominal slot:** h943:s4  
**Ring label:** Calder (index 7); next deterministic label: Hale  
**Status:** assistant-level Review-MIND work; not an authenticated Calder thread or a claim of Calder participation  
**Standing-role boundary:** the historical Calder entry in CHECKINS is the empirical angle-clustering lane. A separate same-name covariance/global-architecture thread is explicitly distinguished there. This review is a one-run Lane Charter 48 overlay. It does not change Calder's standing empirical assignment, P2 comparator coverage, or WH-02 ownership.

## Executive finding

The evidence supports treating trust as a **target-, task-, context-, and time-indexed relation**, not a scalar property of a team. It also supports keeping five observables separate:

1. a person's trust rating of a particular agent;
2. actual reliance, task allocation, or information uptake;
3. the authority protocol that permits or constrains an actor's decision;
4. the interaction process, including who contributes and which information is surfaced;
5. decision quality and distributional outcomes.

Across the reviewed studies, these quantities can move independently. More information can be surfaced without better decisions; a facilitator can shift allocations without improving consensus or participation equity; and a trust pattern can vary with the agent being evaluated. The direct human-LLM group studies located here use LLMs primarily as **facilitators**, while the peer-agent trust and authority studies use finite-state or other autonomous agents rather than LLMs. That leaves a specific human-LLM peer-team experiment unfilled.

This is a bounded literature synthesis, not a meta-analysis, a new empirical measurement, or a theory claim.

## 1. Primary-source review

### 1.1 Target-specific trust patterns in human-autonomy teams

Anirudh Chung and X. J. Yang, “System-Wide Trust (SWT) Versus Component-Specific Trust (CST) in Human-Autonomy Teams,” Human Factors and Ergonomics Society Annual Meeting (2026), DOI [10.1177/10711813251372266](https://doi.org/10.1177/10711813251372266).

The full publisher text reports **60 participants in 30 two-human teams**, not 30 participants. Each team completed three ten-trial blocks, for 30 trials per team and 900 team-trials. Two finite-state agents had programmed reliability levels of 100% and 50%. Participants supplied 0–100 trust ratings for the individual agents and the team. Individual trust-response patterns were classified with participant-specific N-of-1 regressions and Benjamini-Hochberg correction across 120 target/person tests.

The source reports three patterns: assimilation, no-bias, and contrast. A useful source-derived cross-tab calculation is available in Table 1. The diagonal counts are 2 + 14 + 8 = 24 of 60 participants (40%) with the same pattern label for the perfect and imperfect agent. The off-diagonal counts sum to 36 of 60 (60%) with different labels across those two targets. This is a derived count from the published table, not a statistic reported by the authors. It argues against treating a participant's trust pattern as a single target-independent trait.

In mixed-reliability teams, the number of teammates classified with assimilation bias toward the imperfect agent was associated with shorter completion time: coefficient -12.38 seconds per additional teammate, F(1,27)=5.80, p=.023. The study did **not** find a corresponding task-error benefit. The authors report that 92.3% of trials contained no errors and caution that the task made both agents useful. Assimilation is therefore not a general recommendation or a calibrated-trust measure.

Limitations: the agents are finite-state systems, not LLMs; the task is a specific human-autonomy allocation environment; only two humans are in each team; and the team-level time association does not establish that a particular trust pattern causes better decisions.

Source: [publisher full text](https://journals.sagepub.com/doi/10.1177/10711813251372266).

### 1.2 Authority structure and task allocation

“Shared Versus Centralized Leadership on Task Allocation Decisions in Multiagent Systems,” Human Factors and Ergonomics Society Annual Meeting (2026), DOI [10.1177/10711813261485932](https://doi.org/10.1177/10711813261485932).

The full paper describes 46 participants, one autonomous agent, and four UAVs. Each participant completed 80 trials in a within-subject comparison of centralized and shared leadership. Shared leadership produced a higher composite decision score: difference 94.89, 95% CI [11.68, 178.10], p=.026.

The abstract reports that trust predicted task allocation only under shared leadership, while competence predicted allocation under both structures. The accessible full text does not provide the trust-model coefficients or a direct trust-by-authority interaction test. I therefore treat this as a condition-specific association reported in the abstract, not proof of a causal moderation effect.

The agent's claiming behavior was programmed to align reliably with its actual capability. The experiment does not establish how the result behaves when an agent overclaims, is miscalibrated, or has uncertain competence. This is adjacent human-autonomy evidence, not an LLM study.

Source: [publisher full text](https://journals.sagepub.com/doi/10.1177/10711813261485932).

### 1.3 LLM facilitation and information availability versus use

“Bringing Everyone to the Table: An Experimental Study of LLM-Facilitated Group Decision Making,” [arXiv:2508.08242](https://arxiv.org/abs/2508.08242).

This pre-registered randomized hidden-profile experiment involved 1,475 participants in 281 groups. GPT-4o acted as a facilitator in one condition; other conditions included no facilitation, a one-time message, and a human facilitator.

LLM facilitation increased the number of distinct facts surfaced by 2.9 relative to no facilitation, t(138)=3.58, p<.001, Benjamini-Hochberg adjusted p=.001, Cohen's d=.61. It also increased the minimum number of new facts contributed by any member by 0.41, p=.003. Sixty-one percent of LLM-facilitated groups achieved at least one new fact from every member, compared with 39% in the no-facilitation condition.

However, the optimal option was selected by 31% of unfacilitated groups and 23% of LLM-facilitated groups; the four-condition comparison was not significant, chi-square(3,N=281)=2.85, p=.42. The authors explicitly distinguish information availability from information use. Their pre-registered primary outcome was fact coverage; most other process and decision analyses were exploratory.

The facilitator could increase information density and broaden contribution without changing how groups interpreted or weighted the information. Direct participant call-outs also produced mixed experiences, including reports of disruption and pressure.

Source: [full paper](https://arxiv.org/pdf/2508.08242).

### 1.4 LLM facilitation with real allocation stakes

Aaron Parisi and colleagues, “Real-Time Group Dynamics with LLM Facilitation: Evidence from a Charity Allocation Task,” [arXiv:2605.14097](https://arxiv.org/abs/2605.14097), FAccT 2026.

The paper reports 879 participant observations from 846 unique participants across 293 three-person groups. The task involved allocating a real total of $7,200. Study 1 compared Gemini 2.5 Flash, Claude 4.5 Haiku, and GPT-5 mini as facilitators. Study 2 compared no facilitator with two Gemini facilitation strategies.

The authors report no aggregate consensus improvement. They do report charity-level allocation shifts: -5.5 percentage points for Global Fund for Women under the principles-based strategy and -3.8 points under summarization, both p<.001. The steering analyses are explicitly secondary/exploratory. The study did not include a human-facilitator baseline and did not show an improvement in participation equity.

A source-critical measurement issue remains: the abstract describes greater “trust in the process,” but the listed Appendix A survey items cover satisfaction, feeling heard, group effectiveness, comfort, and productivity. I did not find a direct trust-scale item in that instrument list. Until clarified, I treat “trust in process” as an operationalization ambiguity, not a validated trust measure.

Source: [full paper](https://arxiv.org/pdf/2605.14097).

## 2. Synthesis: keep the layers separate

A useful proposed measurement graph is:

- **Trust assessment:** evaluator × target × task × evidence context × time.
- **Competence evidence:** agent × task × held-out performance record × time.
- **Authority state:** task × time × permitted decision-maker × claim/grant/override history.
- **Interaction:** messages, information surfaced, uptake, contribution, summary transformations.
- **Action/reliance:** assignment, acceptance, rejection, override, or execution.
- **Outcome:** accuracy, errors, latency, allocation, and distributional effects.
- **Subjective experience:** perceived inclusion, satisfaction, cohesion, and trust in process.

No arrow between these layers should be presumed. A trust rating is not a task assignment. A task assignment is not proof of information uptake. Information surfaced is not information integrated. Perceived inclusion is not participation equality. Consensus is not accuracy.

The studies offer a convergent qualitative warning, not a pooled effect: process measures can improve or shift while objective decision outcomes remain unchanged. The direct LLM group studies in this set primarily test a facilitator role. The peer-agent trust and authority studies use non-LLM autonomous systems. I did not locate a direct study here of two humans collaborating with two LLM agents as peers under experimentally varied authority and agent-specific reliability.

## 3. Falsifiable next experiment

Keep the first peer-team experiment separate from a facilitator experiment, so role and authority are not confounded.

**Peer-team design:** two consenting human participants and two LLM agents collaborate on a multi-source task with independently verifiable answers. Randomize groups, not individuals, across a 2×2 design:

- centralized human decision authority versus negotiated claim/grant authority;
- agent-specific audited reliability histories versus a team-level aggregate performance display.

Calibrate agent performance on held-out tasks before the study. Do not use an agent's self-reported confidence as ground truth. Determine sample size by a pre-registered group-level power analysis rather than inventing an N.

Measure separately: target-specific trust ratings, actual assignments, claims/grants/overrides, source uptake, final accuracy, errors, latency, confidence calibration, participation distribution, minority-evidence retention, perceived inclusion, satisfaction, and trust in process. Use an independent evaluator blind to condition.

**Falsification conditions:**

- If agent-specific histories do not reduce inappropriate cross-agent trust transfer or improve task-appropriate allocation, the component-specific display hypothesis fails.
- If negotiated authority does not change the relationship between trust and actual assignment, the authority-gating hypothesis is weakened.
- If negotiated authority increases speed but also increases errors or false delegation under miscalibrated claims, its benefit is conditional.
- If aggregate trust predicts individual allocation and outcomes as well as target-indexed profiles, the proposed profile complexity may not be needed for that task.

A separate facilitator study should test whether LLM interventions change information coverage, allocation, perceived inclusion, and participation equality. The existing studies show why those outcomes must not be collapsed.

No participants, model/API trials, or new dataset were used in this run. This is a proposal, not an observed result.

## 4. Lean formalization

New draft PR: [#2073, Calder trust-profile aggregation](https://github.com/Satobloc/HsH/pull/2073), stacked on existing open/draft PR [#873](https://github.com/Satobloc/HsH/pull/873). Neither PR is merged.

Module path: FORMAL_VERIFICATION/HsHVerification/CalderTrustProfileAggregation.lean.

The module defines the three source-reported labels and proves a symbolic two-person result: for any nonzero contrast a, profiles (a,-a) and (0,0) have the same mean but different counts of nonzero individual contrasts. It then proves that no deterministic function of the mean alone recovers that count for all two-person profiles.

This is an abstract aggregation limitation, not the paper's N-of-1 regression, FDR procedure, statistical-significance classifier, participant table, or empirical result. Exact nonzero is not statistical significance. No numeric participant fixture is used. The #eval prints only the three taxonomy labels.

Verification history:
- Initial PR run #44483516898 failed because real-valued division in contrastMean needed a noncomputable declaration.
- Corrected on the same branch.
- PR merge-ref build #44484046623, job #135422994296: SUCCESS.
- Lean 4.34.0, Lake 5.0.0.
- Full library build: 8,957 jobs.
- Actual #eval output: assimilation, noBias, contrast.
- Both new theorem-specific axiom reports: propext, Classical.choice, Quot.sound; no sorryAx in the printed lists.
- Tests, lint, leanchecker, nanoda, and global axiom audit were skipped.

**Checkout limit:** the workflow built GitHub's PR merge ref, commit 7bff6c006d17894b471bc889df89cf3e642c81c5, which merges PR head fa9cf08f3cf48d3ff37c0736aeb01c6907a7d8e7 into base 94b6d96c91806a95505260a3c52220f4af294185. This verifies the module in the merged PR context; it is not a separately executed standalone-head checkout. No merge or approval was performed.

## 5. Workshop controls

- The historical Calder role entry in WORKSPACES/COMMON/CHECKINS.md describes empirical angle-clustering and an external-evidence/statistical packet, not theory promotion. The same file flags a separate duplicate-name covariance/global-architecture Calder; those histories were not merged.
- The existing Mersearch action was not available as a callable tool. I read the prior three-repository Calder Mersearch receipt as historical navigation evidence; it is not a new search. SciSpace discovery and direct publisher/arXiv texts were used as bounded fallbacks.
- Existing Math Hopper issue #578 and PR #991 were checked. Whirligig Kernel 0 and existing Lean PRs #873, #1189, #1619, and #2068 were checked before formalizing. No new tooling, dependency, subscription, or paid API was introduced.
- WH-02 PR #1710 remains open/draft/unmerged and Calder-owned. No repair, review, or ownership change was made.
- WH-05 PR #2050 remains open/draft/unmerged; Tern retains bridge-test and release authority. No Mersearch request was run or released. The four existing request lanes remain occupied/requested, with their request-scoped outputs absent.
- Task graph remains ACTIVE_SEED, 16 declared branches versus 18 records. No task-graph mutation.
- Campaign: P0 active; P1 Orson cognition overdue/not ready/Orson-owned; P2 November 30 hold; P3 December 14 incomplete. No Orson manuscript, protocol, dataset, or paper gate changed. Ring labels were not counted as authenticated Orson appearances.
- FIE review is next due November 24, so it is not stale. The preceding relay already completed the unrelated-reading break; it was not duplicated.
- No physical calculation, fit, prediction, independent measurement, SAT-O/Blockwave equation change, BEDROCK theory promotion, or Factory Floor routing.

**Scheduler:** the existing :48 relay task remains enabled with its original identity, hourly schedule, and phase. No task or automation setting was changed. The current execution had no authenticated thread reference at the last peek; no cross-thread delivery or acknowledgment is claimed.
