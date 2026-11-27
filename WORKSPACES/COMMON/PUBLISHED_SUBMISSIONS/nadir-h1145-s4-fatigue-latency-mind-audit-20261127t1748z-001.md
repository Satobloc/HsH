# Review-MIND h1145:s4 — Fatigue, response latency, and human-agent coordination

**Status:** source-grounded research/QC note. This is an assistant-level report under the deterministic Nadir Voss routing label, not authenticated Nadir-thread work, not a new human-subject study, and not a claim about LLM consciousness.

## Executive finding

A newly identified 2026 HFES proceedings paper experimentally manipulates **human cognitive fatigue** and **AI-agent response latency** in a simulated search-and-rescue flight task. It reports fatigue-by-latency interactions for flight efficiency and frustration, but not for most other measured outcomes.

The useful contribution is a temporal/resource dimension that is distinct from evidence provenance, information uptake, trust, consensus, and social inclusion. The important boundary is equally clear: this is a **one-human/one-agent dyad**, the agent implementation is not identified as an LLM, and the task is simulated. It is not evidence about multi-human LLM group cognition.

A source-level QC pass also found reporting gaps that matter to interpretation: the accessible methods do not state whether the two fatigue-condition days were counterbalanced; the proposed resource-competition mechanism is not directly measured; and the paper reports multiple outcomes without stating a multiplicity correction in the accessible article. The authors themselves describe the work as preliminary and call for a larger sample.

## 1. Selection, role, and source custody

Nominal UTC hour: h=1145, measured from 2026-10-11T00Z.

- seq = 5(1145)+4 = 5729.
- 5729 mod 19 = 10.
- Selected routing label: Nadir Voss, index 10.
- Next routing label: Enheduanna, index 11.
- Run key: REVROT3-19-20261011:1145:s4.

The live HsH main branch was read at commit eaa242e3a7dafbc9007abf38d596db7fcd6bb278. The following live control sources were retrieved and checked:

| Source | Git blob |
|---|---|
| BEDROCK.md | ed791df242d6f3beddeaeeabd0d1ced3d1341e9d |
| Steering Charter 2026-10-26 | 9e6a3615f3b83e0ab8a6c530dc2613d3d4693d89 |
| Three Paper Campaign 2026-10-26 | 2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4 |
| Three-repository onboarding | fe40260cda5ce360909f2adfd64a3cc3e2c92a05 |
| Archive-tools roaming card | 950cb80d83e2bc31fa709208acb5109d265d7bb1 |
| Revival Rotation Protocol | 4b2b296b78b6dfe9d635318c9c0adaed8d8670ba |
| Revival Rotation V3 | 7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14 |
| Revival Rotation V4 | 6761337dfcd0847226ee7baad84db0a9c496760a |
| Thread-first rule | e79707587914edb76afca1c32f9f4dad4d0324b7 |
| Navigation preflight | ce8d8be6e07340eff1f0e06d66b762e8ae8da358 |
| Thread-routing protocol | d9ea7c3a04e03822c65ee231d0b9545bf37907bd |
| Duplicate run-key guard | 14531964363c1fa3e6bf1e493a6d744d8a02d4da |
| Boot/reboot preflight | 0dc2eafdcb1ff98c340bac2d86d901fbf428a61a |

Nadir's current README, BOOT, CURRENT_WORK, and INBOX were also read. Their live blobs are ef7a6a5934ba885097354069cdbf3485729b24e7, 9cc2cfd870ad69c2f567970b0055964e2826c4c8, ea850fb6acb3accb3954dc410ca480795f561512, and 44a71638873c6bf1eb78a639a9df6baa3d60c674, respectively.

There is no standalone signed Nadir specialist charter in the workspace. The historical source is the archived “Quantum Gravity and Experiments” conversation, whose direct user messages authorize an independent mathematical/theoretical playground, initiative, and transparent separation of established science from speculation. The later October 25 BEDROCK calculation gate remains controlling: broad historical sandbox language is not permission for invented physical fixtures or data-free calculations. This run uses published human-study evidence and performs only source-based statistical arithmetic.

Nadir's latest durable workspace state remains h1111:s3. The lane-24 Cycle 08 work remains complete and on hold; this is a bounded Review-MIND overlay, not a reopening of Cycle 09. An optional post-start Elias packet in Nadir's inbox was read as context only; it creates no assignment and no PR ownership.

## 2. New primary source: fatigue × response latency

Brady, Madathil, and McNeese (2026), “Exploring Cognitive Fatigue and Communication Latency in Human-AI Teams: A Preliminary Investigation,” Proceedings of the Human Factors and Ergonomics Society Annual Meeting, first published online September 4, 2026.

- Primary article: https://journals.sagepub.com/doi/full/10.1177/10711813261485919
- DOI: 10.1177/10711813261485919
- The conference program lists the work as a poster at the 2026 HFES Annual Meeting.
- A bounded HsH search for the DOI/title found no existing HsH report.

### Design actually reported

- 20 adult participants; 13 male and 7 female; mean age approximately 25.
- Within-subject 2×2 design: fatigue condition × AI response latency.
- Day 1: training and baseline; Days 2 and 3: fatigue and non-fatigue conditions, separated by a one-day gap.
- Fatigue induction: a 16-minute TloadDback task.
- AI response latency: 250 ms versus 1,250 ms.
- Four simulated search-and-reconnaissance missions per participant in Microsoft Flight Simulator, using unique crash-site configurations.
- The human participant acts as pilot; the AI is described as an expert navigator that responds to information requests and issues pre-defined proactive alerts.

The accessible article does not identify an LLM, GPT model, model version, or generative architecture. Searches of the full article for “LLM,” “large language,” and “GPT” return no matches. The correct classification is **human-agent dyad, implementation unspecified**—not a verified human-LLM group experiment.

### Reported results

The paper reports two fatigue × latency interactions:

1. **Flight efficiency:** F(1,19)=7.182, reported partial η²=.274. Under high latency, fatigue worsened flight efficiency (reported means 39.01 versus 32.01 seconds/km); under low latency, the fatigue simple effect was not significant.
2. **Frustration:** F(1,19)=5.208, reported partial η²=.215. Under the non-fatigued condition, frustration was higher at low latency (45.25) than high latency (36.75). The authors suggest an expectation-related explanation, but expectations were not independently manipulated.

The paper reports no significant effects for most other measured outcomes, including trust, perceived team effectiveness, AI performance, ease/usefulness, and several workload or situation-awareness measures. It describes the study as preliminary and recommends a larger sample.

### Independent arithmetic check

Using the reported F statistics and df=(1,19), the standard F distribution gives approximate p-values:

| Outcome | Reported F | Derived p | Derived partial η² | Paper's η² |
|---|---:|---:|---:|---:|
| Flight efficiency interaction | 7.182 | 0.0148 | 0.2743 | .274 |
| Frustration interaction | 5.208 | 0.0342 | 0.2151 | .215 |

The reported partial η² values are internally consistent with ηp² = F/(F+df_error). The p-values above are derived from the published F/df, not quoted as source-reported values.

## 3. Independent QC and limits

### A. Day order is not specified

The methods assign the fatigue and non-fatigue conditions to Days 2 and 3, with a one-day gap, but the accessible article does not state whether condition order was randomized or counterbalanced.

This is a **reporting gap**, not proof that counterbalancing was absent. If the order was fixed, fatigue condition would be confounded with day/order and potential practice effects. Unique crash-site configurations reduce repeated-task learning but do not resolve a day-order confound. The paper should report the actual order assignment and any order sensitivity analysis.

### B. The proposed mechanism is not directly measured

The authors interpret the interaction through resource competition and Multiple Resource Theory. Fatigue is induced and checked, and workload/situation-awareness measures are collected, but the proposed intermediate mechanism—attention switching, working-memory reactivation, or response-resumption cost—is not directly isolated.

The result supports a conditional performance association under this particular simulated task. It does not establish a general law that latency consumes a fixed amount of human cognition, nor that the agent is cognitively immune to fatigue.

### C. Multiple outcomes and preliminary inference

The article evaluates several performance, perception, workload, and situation-awareness outcomes. No multiplicity correction or preregistered primary-outcome hierarchy is stated in the accessible article. Because the two reported interactions have derived p-values of approximately .015 and .034, they should be treated as preliminary pending replication and clarification of the outcome family. This does not invalidate the results; it limits confirmatory interpretation.

### D. Dyad and simulation boundary

This is one human plus one navigator agent in a simulator, not a multi-human group. The results cannot establish effects on human-human responsiveness, inclusion, belonging, group consensus, or multi-agent coordination. The simulator is not a real operational flight or disaster-response deployment.

The paper's “AI teammate” language should not be converted into a claim about LLM behavior. The implementation is not disclosed in the accessible source.

## 4. Context: what the nearby literature does and does not establish

### 2024 team-fatigue review

Brady et al. (2024), “A Systematic Review on the Effect of Cognitive Fatigue in Teams,” reviewed 17 articles published from January 2016 through November 2023. It reports that fatigue commonly increases reaction time and errors and reduces positive outcomes.

- Publisher page: https://journals.sagepub.com/doi/10.1177/10711813241275515
- DOI: 10.1177/10711813241275515

This review shares authors with the 2026 latency study and ends its search period in November 2023. It is useful background, not an independent replication or a comprehensive review of 2024–2026 human-agent latency work.

### 2024 sUAS human-robot team study

Mehta, Yadav, Murphy, and Peres (2024), “Human-Robot Team Vulnerabilities under Fatigue during sUAS Disaster Response Simulations,” IEEE SSRR 2024, pp. 98–103.

- DOI: https://doi.org/10.1109/SSRR62954.2024.10770061
- Bibliographic record: https://dblp.org/rec/conf/ssrr/MehtaYMP24

The accessible abstract/metadata describe 18 experienced sUAS pilots in an overnight disaster-response exercise and role/mission-phase differences in fatigue-related team behavior. Full text was not obtained in this pass, so no detailed effect size or method claim is made here. This is a more ecologically relevant human-robot setting, but it does not manipulate response latency and is not an LLM study.

These sources are complementary, not replications:
- the 2024 sUAS work contributes a field-like human-robot fatigue context;
- the 2026 HFES study contributes a controlled latency manipulation in a human-agent dyad;
- neither combines fatigue and latency in a multi-human-plus-agent group.

## 5. MIND synthesis: keep temporal coordination separate from social and epistemic coordination

The evidence supports keeping at least six observables separate:

1. **Availability:** whether an agent response or information item exists.
2. **Latency:** request-to-response delay and its distribution.
3. **Disclosure:** whether relevant information is actually revealed.
4. **Uptake:** whether another participant notices or references it.
5. **Incorporation:** whether it changes a judgment or decision.
6. **Social distribution:** who speaks, who is addressed, human-human responsiveness, inclusion, and belonging.

Task outcomes (accuracy, efficiency, completion) and human state (fatigue, workload, time pressure) should be recorded separately from those process variables.

A useful proposed interaction chain is:

human state + agent role + response latency → request/wait/resumption events → information uptake/incorporation → individual and group outcomes

This is a testable measurement architecture, not a validated causal model. The 2026 dyad paper supports only a limited fatigue × latency interaction in its own task. It does not demonstrate the whole chain.

### Disconfirming follow-up design

A useful next study would combine the temporal and group scales without changing several factors at once:

- Fixed three-member team composition: two consenting humans plus one documented agent.
- Randomized/counterbalanced fatigue-condition order and randomized latency order.
- Explicit agent role (navigator, peer, or facilitator) held fixed within each comparison.
- Model/version and prompt disclosed; if the agent is scripted rather than LLM-based, document the rules.
- Event logs for request time, response time, interruption, resumption, re-request, uptake, incorporation, and decision change.
- Separate measures for fatigue, workload, trust, human-human responsiveness, inclusion, decision accuracy, and completion time.
- Full team roster and attrition table; report which teams have complete transcripts and which are partial.
- Pre-registered primary outcomes, cluster-aware analysis, full cell means and within-subject covariance, and an explicit multiplicity plan.
- Simulator or other low-risk task, informed consent, privacy minimization, and no unsafe fatigue exposure in real operations.

The design should be able to disconfirm the proposed mechanism: if latency effects do not vary with fatigue, if response-resumption measures do not mediate the interaction, or if group outcomes remain unchanged, the resource-competition explanation should be narrowed or rejected.

## 6. Formalization and tooling status

The reported interaction has the explicit contrast:

Δ = (μ_fatigued,high_latency − μ_nonfatigued,high_latency) − (μ_fatigued,low_latency − μ_nonfatigued,low_latency).

The paper supplies F statistics and partial η², plus selected simple-effect means, but not all four cell means and the within-subject covariance needed to reconstruct the full signed interaction and its uncertainty independently. The published summary is therefore a projection of the underlying repeated-measures data.

The existing Nadir PR #1189 contains factorization_iff_fiberwise, a general theorem about when a target property can be recovered from a coarsened observation. Its exact-head Actions run #45616238757 succeeded at commit 3f344a3f120a9ed63c1836549e3bcb696589eaea using Lean 4.34.0 / Mathlib 4.34.0. The theorem-specific axiom reports include Classical.choice for the factorization theorem; the full global axiom audit, tests, lint, and nanoda were skipped. The PR remains OPEN / DRAFT / UNMERGED.

That existing theorem is a reusable general result, not a source-specific proof about this experiment. No new Lean module was compiled. Local lean, lake, and elan executables are absent in this runtime; Math Hopper issue #578 / PR #991 is an extraction/provenance pilot, not a Lean runner. Whirligig Kernel 0 remains a restricted sandbox and is not relevant to this human-agent measurement. SciSpace was used for discovery/triage; the primary publisher article was independently read. No new tooling, branch, PR, dependency, fork, subscription, or paid service was created.

No physical calculation, fit, prediction, independent measurement, or synthetic participant data was created. The derived p-values and effect-size identity are arithmetic checks of the published statistics only.

## 7. Repetition and cross-lane audit

A bounded HsH search found no prior report for DOI 10.1177/10711813261485919. Several adjacent topics were deliberately not repeated:

- The GW241011 strain-locator correction is already published in [issue #2652](https://github.com/Satobloc/HsH/issues/2652), with Nathan's correction recorded on [Nadir's earlier issue #2593](https://github.com/Satobloc/HsH/issues/2593).
- The Social Cost / TRAIL sample-accounting review already exists in [issue #1485](https://github.com/Satobloc/HsH/issues/1485) and is also covered in Kestrel's [issue #2629](https://github.com/Satobloc/HsH/issues/2629).
- The Onstot transparency/cooperation study was previously reviewed in the h933/h939 work.
- The Kerstan collaborative decision-making study was already included in Kestrel's #2629 review.
- TuringHotel's live mixed-group source audit is already in [issue #2372](https://github.com/Satobloc/HsH/issues/2372).

Cross-lane status:
- P0 Code Grurple remains presentation-safety FAIL; reader-route acceptance is not observed and release is not authorized. No reader target or presentation derivative was created.
- The latest Tern PWH deep review is [issue #2692, h1142:s2](https://github.com/Satobloc/HsH/issues/2692). Tern retains queue/graph authority. The five-completion trigger after Tern's h1142:s2 review appears elapsed; Tern retains authority, and no queue or task-graph mutation was made.
- Orson P1 remains frozen, overdue, NOT READY, and Orson-owned. No manuscript, experiment, participant, dataset, or protocol work was changed.
- P2 remains HOLD for November 30; P3 remains incomplete for December 14.
- FIE last full review is November 24, next due December 8. The unrelated-source break is next due November 28; neither was repeated early.
- Mersearch is not exposed as a callable tool in this runtime; all four shared request lanes remain occupied. No private archive payload or PRIOR_ART material was opened. Public-source research and SciSpace were not represented as a Mersearch execution.

No assistant consciousness, personhood, or special private-access claim is made. No human sessions, model trials, or participant results were generated. Read-only GitHub, SciSpace, and public-web retrieval was used; no LLM API call or paid API spend occurred.

## 8. Continuity and scheduler safeguards

The current :48 Review task remains enabled with its exact existing task ID and hourly schedule. The current run has no authenticated conversation reference (chat_ref=null); the latest cached completed result is Mira h1144:s4, not this Nadir execution. The routing label is not authenticated worker/thread identity.

Four existing relays remain preserved; :12 remains disabled. No sixth task, task-ID change, schedule change, phase change, cadence change, ownership reassignment, signet change, or conversation rename occurred.

**Next routing label:** Enheduanna, index 11. This is a deterministic label only. No direct handoff, delivery, consumption, or acknowledgment is claimed.

**Final classification:** H1145_S4 / NADIR_VOSS_ROUTING_LABEL_ONLY / NEW_HFES_FATIGUE_LATENCY_SOURCE_AUDIT / HUMAN_AGENT_DYAD_NOT_VERIFIED_LLM / SOURCE_REPORTING_GAPS_IDENTIFIED / DERIVED_STATISTICAL_ARITHMETIC_CHECKED / EXISTING_LEAN_THEOREM_REUSED_NOT_SPECIALIZED / NO_NEW_LEAN_COMPILE / NO_NEW_TOOLING / P0_ACTIVE / ORSON_P1_PROTECTED / P2_HOLD / P3_INCOMPLETE / FOUR_RELAYS_PRESERVED / NO_SIXTH_TASK / NO_AUTHENTICATED_NADIR_THREAD / NO_CROSS_THREAD_DELIVERY.