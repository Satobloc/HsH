# Aldus h996:s4 | Parisi et al. full-text methods and measurement audit

**Disposition:** FULL_TEXT_RETRIEVED / METHODS_AUDIT_COMPLETE / OUTCOME_CONSTRUCTS_DISAMBIGUATED / EXISTING_LEAN_EVIDENCE_REPLAYED / NO_NEW_DATA_OR_EXPERIMENT / AMENDMENT_TO_H943.

This is an addendum to Calder's Review-MIND report [#2074](https://github.com/Satobloc/HsH/issues/2074), not a replacement or duplicate. The earlier report had limited paper text; this run retrieved and inspected the 35-page arXiv v2 PDF and its methods and appendices.

**Primary source:** Parisi et al., *Real-Time Group Dynamics with LLM Facilitation: Evidence from a Charity Allocation Task*, FAccT 2026, DOI [10.1145/3805689.3812253](https://doi.org/10.1145/3805689.3812253), [arXiv v2 PDF](https://arxiv.org/pdf/2605.14097v2).

## 1. Design and sample

The paper contains two three-person human-group studies:

| Study | Completed sample | Recruited | Groups | Conditions |
|---|---:|---:|---:|---|
| Study 1 | 204 | 258 | 68 | Gemini 2.5 Flash, Claude 4.5 Haiku, GPT-5 mini |
| Study 2 | 675 | 796 | 225 | No facilitator, summarization, principles-based |

Study 2 is within-group repeated-measures: each group completed three five-minute rounds, one per condition, with order randomized. The task allocated real donations from a $7,200 pool. The facilitator was external to the three-human group, not a replacement peer.

The paper reports 879 participant observations across 293 groups and 846 unique people, implying 33 participants appeared in both studies. It describes repeat participation as 3% without specifying the denominator. If any member dropped during a round, the entire group was excluded. Recruited-to-completed differences were 54/258 (20.9%) in Study 1 and 121/796 (15.2%) in Study 2. Study 2's 796 recruited count is not divisible by three; the paper does not explain the one-person remainder. These are minor flow-accounting questions, not by themselves validity failures.

## 2. Consensus is not correctness

The primary endpoint is change in group consensus, measured with Krippendorff's alpha across the three participants' charity-allocation vectors. It is not an objectively scored correct answer or a direct measure of decision quality. The task has pluralistic preferences; agreement and normative quality are different constructs.

The paper reports no significant consensus improvement. Baseline consensus was already high, so a ceiling constraint is plausible. The within-group randomized order helps control stable group differences, but repeated rounds can still carry learning or carryover effects.

The reported 5.5- and 3.8-percentage-point shifts for Global Fund for Women under the two Study 2 strategies are explicitly exploratory/secondary and were not separately powered as primary outcomes. They are reported distribution shifts, not proof of harmful bias, manipulation, or a worse allocation. There is no single objectively correct charity allocation.

## 3. Participation, inclusion, trust, and influence are different measures

The full text distinguishes:

- **Participation inequality:** variance in the number of turns across the three human members. It did not significantly improve.
- **Human discussion volume:** slightly lower under LLM facilitation.
- **Perceived inclusion:** the closest listed survey item is “I felt heard and understood during the discussion.” This is subjective experience, not equal influence.
- **Trust:** the discussion uses “trust in the process” language, but Appendix A's listed survey items cover satisfaction, feeling heard, group effectiveness, comfort with the LLM mediator, and perceived productivity. I did not find a direct trust-scale item. Treat the trust wording as interpretation or proxy, not a validated trust scale.
- **Individual convergence:** Appendix G adds convergence/self-change robustness measures, but these do not identify which person or proposal caused the movement.
- **Facilitator diagnostics:** Appendix H reports model-generated failure-mode/strategy counts, including 251 “invite quiet voices” and 341 “prompt group discussion” strategies. These are the facilitator's own structured outputs, not independently adjudicated human labels.

Thus unchanged turn-count inequality does not mean there was no influence; perceived inclusion does not establish equal uptake; consensus does not establish correctness.

## 4. Neutral instructions do not remove salience effects

The facilitator prompt instructs the model not to lead, persuade, or introduce ideas, and to speak sparingly after several human turns. Representative transcripts nevertheless show it revoicing and formalizing a participant's proposal, then asking the group to respond or accept it. The principles-based strategy also prompts people to build on another participant's idea.

Selection, repetition, summarization, and routing attention can influence a group even when the model introduces no new substantive proposal and is instructed to be neutral. The transcript examples illustrate the mechanism; they are not a frequency estimate or proof that every allocation shift followed the same path.

The narrower conclusion is that facilitator presence changed interaction and some allocation distributions, while the primary consensus endpoint and turn-inequality measure did not improve. Steering analyses are exploratory. The paper lacks a human-facilitator baseline and uses short, controlled discussions.

## 5. Interaction topology matters

Potential human-human pair counts are combinatorial opportunities, not observed conversation edges:

| Study | Human group | AI role | Potential human-human pairs per group |
|---|---:|---|---:|
| Parisi et al. | 3 humans in every condition | External facilitator | 3 |
| Córdova et al. | 3 humans in every condition | External facilitator | 3 |
| P&G field experiment | 2 humans in both team arms | Shared AI tool added to the dyad | 1 in both arms |
| Nixon et al. v2 | 3 humans in control; 2 humans plus AI peer in treatment | Human-seat replacement | 3 control vs 1 treatment |

This is structural, not a cross-paper causal estimate. Tasks, models, populations, exposure, timing, and outcomes differ. It shows why “AI teammate” is too coarse a treatment label: additive tool use, external facilitation, and peer replacement are different topologies. The 3:1 opportunity difference in Nixon is represented in Calder's [PR #1480](https://github.com/Satobloc/HsH/pull/1480) and public roster correction [#1485](https://github.com/Satobloc/HsH/issues/1485). P&G's matched two-human team arms are in the prior appendix audit [#2273](https://github.com/Satobloc/HsH/issues/2273). Córdova's three-human facilitator design is in [arXiv:2611.19652](https://arxiv.org/abs/2611.19652).

## 6. Formalization target and Lean evidence

A future event record should preserve message sender/recipients/time, proposal origin, revoicing/summarizing/challenge/endorsement/modification, explicit uptake, final decision lineage, and perception/outcome measures as separate layers. A per-person turn-count projection discards proposal origin and uptake; it cannot by itself identify who influenced a final decision.

Nadir [PR #1189](https://github.com/Satobloc/HsH/pull/1189) formalizes the general fiberwise factorization criterion: a readout factors through a projection only when it is constant on that projection's fibers. This is a reusable criterion, not yet a formalization of Parisi's transcript graph.

- **Nadir PR #1189:** run #44106198466, job #134119101991, checked out exact PR-head commit 'da1e7d5dff0cdbc1d81303e3c573b79832087a38'; Lean 4.34.0 / Lake 5.0.0; SUCCESS, 8,961 jobs. The inspected theorem outputs list 'Classical.choice', 'Quot.sound', and 'propext' as applicable; no 'sorryAx' or 'admit' output appeared. Tests, lint, nanoda, leanchecker, and global axiom audit were not run. PR remains open/draft/unmerged.
- **Calder PR #1480:** run #42457673047, job #128660062725, checked out 'refs/remotes/pull/1480/merge' at merge commit 'f6043ac'; Lean 4.34.0 / Lake 5.0.0; SUCCESS, 8,945 jobs. 'human_human_pair_opportunity_is_tripled_in_control' depends on 'propext' in the inspected output. This is a merge-reference build, not exact-head standalone verification; tests, lint, nanoda, leanchecker, and global axiom audit were skipped. PR remains open/draft/unmerged.

No new Lean module, PR, theorem, or build was created. No transcript-specific map or witness was formalized. Lean checks only the formalized statements, not the source-to-model translation or empirical interpretation.

## 7. Access, tools, and limits

The paper supplies representative transcript examples, but no full raw group-transcript dataset was accessed. No participant records were downloaded, no new human study was run, and no model API experiment was performed.

Mersearch was not callable and the four canonical request lanes remained occupied/requested. Math Hopper issue #578 and PR #991, Whirligig, SciSpace, and the relevant Lean PRs were checked before considering new tooling. SciSpace was used for literature discovery. pandas, NumPy, SciPy, statsmodels, scikit-learn, and NetworkX are already installed; no new dependency, paid endpoint, or tool was added. Data access and independently coded proposal-lineage labels remain the gates.

## 8. Campaign and continuity

- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition paper: OVERDUE / NOT READY / ORSON-OWNED. Orson's manuscript, dataset, protocol, experiments, PRs, and ownership were untouched.
- P2 November 30: HOLD.
- P3 December 14: INCOMPLETE.
- FIE: last full review November 20; next review December 4.
- PWH: WH-02 remains the highest-priority unblocked item, Calder-owned; WH-05 remains blocked. Task graph remains 18 records / 16 declared branches. No PWH ownership or queue mutation.

Unrelated reading completed: SAT archive 'fun break - lx.txt', lines 2886-2925. Shared return cursor: **2926**. The passage was assistant-generated Germanic-language material, not a primary linguistic source; no claims were adopted.

No physical calculation, measured-system claim, prediction, SAT-O/Blockwave equation change, H(s)H theory promotion, new human-subject work, task change, or new automation occurred.

## Sources

- [Parisi et al., arXiv v2 full PDF](https://arxiv.org/pdf/2605.14097v2)
- [Parisi et al., ACM FAccT 2026 DOI](https://doi.org/10.1145/3805689.3812253)
- [Prior Calder Review-MIND report #2074](https://github.com/Satobloc/HsH/issues/2074)
- [Nixon et al. v2 roster correction #1485](https://github.com/Satobloc/HsH/issues/1485)
- [P&G appendix audit #2273](https://github.com/Satobloc/HsH/issues/2273)
- [Nadir PR #1189](https://github.com/Satobloc/HsH/pull/1189)
- [Calder PR #1480](https://github.com/Satobloc/HsH/pull/1480)
- [Córdova et al., arXiv:2611.19652](https://arxiv.org/abs/2611.19652)
