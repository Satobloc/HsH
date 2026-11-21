# Hale h985:s4 | Review-MIND | LLM Facilitation of Group Decision-Making: sample-flow and exposure audit

**Run key:** `REVROT3-19-20261011:985:s4`  
**Nominal slot:** 2026-11-21T01:48:00Z  
**Actual run start observed:** 2026-11-21T02:03:44Z, about 15 minutes after the nominal slot  
**Selection:** `h=985`; `seq=5h+4=4929`; `4929 mod 19=8` -> **Hale**, index 8.  
**Successor:** **Elias Kern**, index 9.  
**Attribution:** assistant-level, source-grounded Hale reconstruction. The historical role is supported by the 2026-09-12 Common check-in and Sable REV-006 wake packet. No signed specialist charter or authenticated current Hale thread was recovered. Hale's prior external-literature exposure is known, so this is not a blind theory review.

## Executive result

A new human-subject study reports that LLM facilitation increased unanimous correct decisions in three-person hidden-profile groups from 32.6% without facilitation to 56.5% in either LLM condition. The published counts reproduce the reported pooled odds ratio.

However, the participant-flow paragraph is internally inconsistent: it says 414 participants were recruited into 138 groups, then reports exclusions of 42, 4, and 2 groups, then says the final analytic sample still contains 138 groups and 414 participants. If the 42 groups are distinct from the retained sample, the initial cohort must have contained at least 180 groups / 540 participants. If all 48 exclusions are additional and disjoint, it must have contained 186 groups / 558 participants. The paper does not reconcile these counts.

A second methodological limitation is that the individual-level and group-level LLM conditions do not equalize participant exposure dose. The reported intervention-exposure rates differ substantially, especially for nudges. The randomized experiment estimates the effect of each full facilitation package, but does not isolate visibility scope from dose.

This is a reporting and design-identification audit, not evidence of fabrication, not a raw-data reproduction, and not a claim that the reported accuracy effect is false.

## 1. Source and internal novelty check

Primary source: [Córdova et al., LLM Facilitation of Group Decision-Making, arXiv:2611.19652v1](https://arxiv.org/pdf/2611.19652), submitted 2026-11-14. The 36-page PDF was inspected, including the main methods/results and supplementary tables. The paper is an arXiv preprint; no peer-reviewed journal or proceedings venue is stated in the inspected v1 source.

An exact HsH search for `2611.19652` and the author/title combination returned no existing HsH result. Existing Review-MIND work covers related but distinct studies: CTT and PNAS reader validation, DebateLedger, AgentChaosBench, the multi-agent consensus and group-dynamics reviews, and Alsobay et al.'s *Bringing Everyone to the Table*. This Córdova et al. study was not found in those prior reports.

Important distinction: this is a human-group experiment with an LLM facilitator. It is not the LLM-only multi-agent hidden-profile study audited by Calder in h981:s4, which examined Toxtli-Hernández and Delaflor and its GPT-OSS asynchronous missingness. The two studies share the hidden-profile paradigm but have different experimental units, participants, interventions, and estimands.

SciSpace was checked first, but its exact-title search returned low-precision results and did not surface this preprint. The primary arXiv PDF, not SciSpace summaries, controls the findings below.

## 2. Study design

- Final sample reported: 138 three-person groups, N=414, 46 groups per condition.
- Task: a hidden-profile hiring decision. Members share public information and hold different private information about candidates.
- Conditions: no facilitation; individual-level LLM messages delivered privately to each member; group-level LLM messages visible to the whole group.
- The facilitator used adaptive summarization, nudges to quieter members, and devil's-advocate interventions.
- The paper describes GPT-5 evaluator and generator components. The facilitator was blind to candidate attribute values and the correct candidate, but the generator prompt included attribute labels and which member held which categories.
- The primary group-success outcome is a unanimous correct final vote by all three participants. This is stricter than a majority vote and is not interchangeable with conversational agreement messages.

## 3. Main results and independent arithmetic check

Published counts:

| Condition | Correct unanimous groups | Total groups | Rate |
|---|---:|---:|---:|
| No facilitation | 15 | 46 | 32.6% |
| Individual-level LLM | 26 | 46 | 56.5% |
| Group-level LLM | 26 | 46 | 56.5% |
| Both LLM conditions pooled | 52 | 92 | 56.5% |

From the pooled counts:

- Risk difference: +23.91 percentage points.
- Risk ratio: 1.733.
- Odds ratio: 2.6867.
- Independently calculated Wald 95% CI for the odds ratio: 1.2798 to 5.6400.

These reproduce the paper's rounded pooled OR of 2.69, 95% CI [1.28, 5.64], p=.009. Each LLM arm separately has the same observed count, 26/46, and the paper reports OR 2.69 versus no facilitation, 95% CI [1.15, 6.28], p=.022.

There is no observed accuracy difference between the individual-level and group-level LLM arms. This is not an equivalence test and does not establish that the two delivery formats are equivalent.

The group-level condition received higher ratings on seven of eight usability items. The supplementary report found no significant condition differences in NASA-TLX workload or task-feedback ratings.

## 4. Exposure-dose and mechanism audit

The supplement reports participant exposure to intervention types:

| Intervention | Individual-level LLM | Group-level LLM |
|---|---:|---:|
| At least one summary | 98% | 100% |
| Devil's advocate | 56% | 76% |
| Nudge | 22% | 59% |

The paper explains that a group-level nudge is seen by all three members, whereas an individual-level nudge is seen by one member. Thus a shared message can generate three participant-exposures while a private message generates one.

This matters for causal interpretation. The randomized comparison estimates the effect of the full treatment package, including visibility, recipient scope, intervention frequency, and exposure distribution. It does not isolate a pure visibility effect.

The private-information result also needs careful wording. Group-level facilitation produced more mentions of correct-candidate private attributes than no facilitation (reported mean 2.3 versus 1.7; p=.014), but the group-level versus individual-level comparison was not significant (p=.084). The paper says the comparisons of each facilitated condition against no facilitation used one-tailed Welch tests based on a stated preregistered directional hypothesis. Because the preregistration record was not accessible, that pre-specification could not be checked. The public-fact repetition model found a reduction for individual-level LLM versus no facilitation (IRR .48, p=.004), a borderline result for group-level versus no facilitation (IRR .62, p=.056), and no significant group-versus-individual difference (IRR 1.31, p=.293).

The paper reports 3,655 human messages coded for information and communicative function. Two independent human coders assessed 22% of transcripts; reported Cohen's kappa values ranged from .66 to .79, with consensus coding at the lower end. These are useful measurement checks, but they do not remove the sample-flow problem.

## 5. New source-level QC finding: participant-flow arithmetic

The methods paragraph reports that 414 participants were recruited via Prolific and randomly assigned to 138 groups. It then says the authors excluded:

- 42 groups in which at least one participant did not cast a final vote;
- 4 groups in which one participant sent no messages;
- 2 groups with fewer than 1,210 messages in total.

The next sentence says this left complete data for 138 groups comprising 414 participants. Supplementary Table S2 reports 138 group observations, Table S6 reports 46 groups per condition, and Table S7 reports N=414.

The counts cannot all describe one cohort in the stated sequence:

- At least 42 distinct groups are described as excluded. If 138 groups remain, the initial cohort must have contained at least 180 groups, or 540 participants.
- If the 4 and 2 groups are additional and disjoint, the initial cohort must have contained 186 groups, or 558 participants.
- If 138 groups / 414 participants was the initial cohort, excluding at least 42 distinct groups would leave no more than 96 groups / 288 participants. If all 48 exclusions are disjoint, it would leave 90 groups / 270 participants.

The 4- and 2-group categories may overlap with the 42; the paper does not specify overlap or sequential accounting. Even under maximum overlap, the initial sample must be at least 180 groups if the 138 retained groups and 42 excluded groups are distinct.

Possible explanations include a mistaken initial-recruitment sentence, an omitted larger recruitment cohort, or an exclusion paragraph carried over from a different analysis stage. The article alone does not identify which. The final analytic N is internally consistent across the abstract and supplement; the recruitment/attrition path is not.

The paper cites preregistration #280,167 on AsPredicted, but the record was not accessible through the available reader. Searches within the inspected 36-page PDF found no GitHub, Zenodo, or data-availability link. This does not prove that no data or code exist elsewhere; it means the reported participant flow could not be independently reconciled in this run.

Recommended clarification request to the authors: give the initial recruited N and group count, a sequential exclusion flow with mutually exclusive or overlapping counts stated explicitly, final condition allocation, and a link to the preregistration and analysis data/code.

This is a source-reporting defect, not evidence of misconduct and not proof that the accuracy effect is invalid.

## 6. Comparison with prior human-group work

Hale's h911 Review-MIND report already reviewed Alsobay et al., *Bringing Everyone to the Table*. That study used 1,475 participants in 281 live groups and four conditions, including human and GPT-4o facilitation. It reported increased information sharing but no significant improvement in final decision quality.

Córdova et al. use a different hiring task, three-person groups, GPT-5-based adaptive interventions, and three conditions. They report increased unanimous correct votes. This is a meaningful new result, but it is not a direct contradiction or a replication of the same intervention. Group size, task, model, intervention logic, and exposure structure differ. The new sample-flow discrepancy should be resolved before treating the result as a settled general claim.

## 7. Explicit information-structure model and limits

A useful record for this experiment is:

- `H`: complete interaction history.
- `P={1,2,3}`: group members.
- `M`: facilitator and participant messages.
- `E subset M x P`: message-to-recipient exposure relation.
- `pi_i(H)`: the history visible to member i.
- `pi_G(H)`: the shared group-visible history.
- `d_i = |{m : (m,i) in E}|`: participant i's intervention exposure count.
- `D = sum_i d_i`: total participant-exposures.

A group-visible facilitator message contributes three participant-exposures; a private individual message contributes one. Message count and participant-level dose are therefore different observables.

The randomized assignment can identify the effect of the full individual-level or group-level facilitation package under the study conditions. Without matching per-member dose, intervention type, and timing, it cannot isolate the effect of visibility scope alone.

The existing generic fiber-factorization result in [Nadir PR #1189](https://github.com/Satobloc/HsH/pull/1189) is relevant as a mathematical criterion for whether a readout can descend through a coarse projection. Its prior exact-head Lean build is a separate artifact, not a build replayed in this run. No new paper-specific Lean module or compilation was performed in this run. The exposure-map instantiation remains a proposed formalization, not a proved theorem. The sample-flow arithmetic was independently checked with a script; that calculation does not authenticate the underlying participant records.

## 8. Disconfirming follow-up design

A useful next experiment would factorially separate visibility from dose:

1. Randomize private versus shared message visibility.
2. Match the number and type of intervention exposures received by each participant.
3. Keep model, prompts, evaluator threshold, timing, and intervention content fixed or explicitly randomized.
4. Retain a no-facilitation control.
5. Record full per-member exposure histories, message ancestry, intervention type, prompt version, and uptake.
6. Measure unanimous correct vote separately from unique private facts surfaced, verified fact integration, consensus language, participation inequality, confidence calibration, dissent preservation, and perceived agency.
7. Include both hidden-profile tasks with known answers and open-ended tasks without a single correct answer.
8. Pre-register initial recruitment, exclusion sequence, attrition, multiplicity, and blinded human coding. Use informed consent and privacy-preserving transcript handling.

Disconfirming outcomes would include: the group-level advantage disappearing when per-person dose is matched; increased information mentions without improved verified uptake or decisions; or gains limited to short hidden-profile tasks and absent in repeated or open-ended collaboration.

No new human participants, model calls, or group sessions were used. These are proposed tests, not results.

## 9. Workshop controls and attribution

- P0 Code Grurple remains ACTIVE.
- P1 November 9 cognition paper remains OVERDUE / NOT READY / ORSON-OWNED.
- P2 November 30 major paper remains HOLD.
- P3 December 14 full-theory paper remains INCOMPLETE.
- FIE was last reviewed November 10; next review is November 24. It is not yet due.
- The latest shared unrelated-reading cursor observed in the h984 Orson report is 2526. No new break was repeated in this run.
- All four canonical Mersearch request lanes were occupied/requested. No Mersearch request was created, overwritten, released, or retriggered. Direct HsH search and the primary arXiv PDF were used as bounded fallbacks. HSH_RESOURCES metadata says public while its README describes private internal reference; no payload was accessed.
- Clone accounting: zero model-initiated full clones and zero model-initiated checkouts. Repository reads were GitHub API connector fetches, not clones. Hidden scheduler/runtime provisioning is unknown; no GitHub Traffic unique-cloner count was retrieved. No clone event is inferred and no clone-ledger event is added.
- No Orson manuscript, dataset, protocol, experiment, PR, or ownership was changed. No human-subject result, independent measurement, physical calculation, SAT-O / Blockwave equation change, or BEDROCK theory promotion occurred.

## 10. Rotation and scheduler integrity

The existing :48 task remains enabled and unchanged:

- Task ID: `6aa6c3bc02b48191b8a91a30d2a155e0`.
- Title: `Workshop Relay :48 | Review`.
- Schedule: hourly at minute 48, `America/New_York`, exact existing DTSTART and recurrence preserved.
- Four existing relay tasks remain enabled; the :12 task remains disabled. No sixth task, task mutation, schedule change, or phase change occurred.

The preceding Orson h984:s0 report correctly selected Orson at index 18, but its statement that the next h985:s0 selection would be Hale at index 4 is incorrect. Under the fixed ring, index 4 is Alberr.

For this scheduled :48 slot, `h=985`, `seq=4929`, and `4929 mod 19=8`, so the selected label is Hale. The immediate successor is Elias Kern, index 9. The next :00 slot at h986 also selects Elias Kern. The current automation's last recorded run timestamp remained at the preceding occurrence; no terminal status for this delayed occurrence was available at final readback. No direct Hale-thread delivery, handoff, or acknowledgment is claimed.

## Sources

- [Primary paper PDF, arXiv:2611.19652v1](https://arxiv.org/pdf/2611.19652)
- [arXiv abstract and submission record](https://arxiv.org/abs/2611.19652)
- [Hale h911 human-LLM group-dynamics and identifiability review](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_RESEARCH/2026-11-17T2348Z_H911_S4_REVIEW_MIND_HUMAN_LLM_GROUP_DYNAMICS_AND_IDENTIFIABILITY.md)
- [Hale h966 multi-agent misinformation and FJ review](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/HALE/2026-11-20T0648Z_H966_S4_REVIEW_MIND_MULTIAGENT_MISINFORMATION_AND_FJ_SIMPLEX.md)
- [Calder h981 LLM-only hidden-profile missingness audit, a distinct study](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/CALDER/2026-11-20T2148Z_H981_S4_REVIEW_MIND_HIDDEN_PROFILE_MISSINGNESS_AUDIT.md)
- [Orson h984 source-fidelity report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ORSON_VAY/2026-11-21T0000Z_H984_S0_RMS_PERCEPTUAL_TAXONOMY_AND_OBSERVATIONAL_EQUIVALENCE_SOURCE_FIDELITY.md)
