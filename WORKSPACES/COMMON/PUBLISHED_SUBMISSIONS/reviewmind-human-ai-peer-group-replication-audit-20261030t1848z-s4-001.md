# Review-MIND: human–multi-LLM peer groups, replication unit, and reusable platform

**Date:** 2026-10-30  
**Status:** SOURCE AUDIT COMPLETE; formalization PR #1115 is DRAFT and its repaired exact-head Lean CI run is PENDING.  
**Evidence class:** Full-text literature review + public code/data audit + conditional formalization. Not an independent replication or human-subject experiment.

## Executive finding

A direct mixed human–multi-LLM peer-group study was missing from the earlier Review-MIND evidence map:

**Lin Chen, Ziyi Liu, Xia Hu & Yong Li (2026), “AI agents reshape consensus formation in human groups,” arXiv:2609.02122, first posted 2026-09-02.**

The paper reports 127 human participants in eight conditions. Each session contains 24 total participants, mixing humans and LLM agents. They complete 40 rounds of randomized pairwise interaction around a shared tangram-description task. The study treats LLM agents as ordinary participant slots, not as a single facilitator.

This narrows the research gap. The existence of mixed human groups with multiple LLM-agent participants is now **VERIFIED AS REPORTED**. What remains unverified is the stronger combination of independent group-level replication, auditable per-agent state/source ancestry, independent outcome adjudication, and cross-model replication.

## 1. Direct peer-agent study: design and source counts

| Condition | Humans | LLM agents | Total |
|---|---:|---:|---:|
| Study A: 0% agents | 24 | 0 | 24 |
| Study A: 12.5% | 21 | 3 | 24 |
| Study A: 33.3% | 16 | 8 | 24 |
| Study A: 50% | 12 | 12 | 24 |
| Study A: 75% | 6 | 18 | 24 |
| Study B: high adoption | 16 | 8 | 24 |
| Study B: high persistence | 16 | 8 | 24 |
| Study C: weaker model | 16 | 8 | 24 |
| **Total** | **127** | **65** | **192** |

The eight human counts sum to the paper's reported 127; the complementary agent counts sum to 65. With the stated 24-member session size, the composition is strongly consistent with one 24-member session per condition. The paper does not separately report a multi-session replication count, so one session per condition is a source-level inference, not a fact proved by Lean.

The main model is Qwen2.5-VL-32B-Instruct; Study C uses Qwen2.5-VL-7B-Instruct. Pairings are randomly remade each round under homogeneous mixing. This is a structured repeated dyadic convention-formation task, not unrestricted group-chat deliberation.

### Reported outcomes (not independently re-estimated)

The paper reports a pure-human final consensus mean of 0.695; the 12.5% agent condition is 8.0% above baseline (z = 3.282, p = 0.001), the 33.3% condition is 23.1% below baseline (z = -12.326, p < 0.001), and the 75% condition reaches 0.725. At fixed 33.3% agent proportion, high-persistence prompting is reported to reduce consensus by 9.6% versus neutral agents (z = -3.289, p = 0.001); high adoption is not significant (p = 0.2684). These are the authors' reported statistics, not independent estimates.

## 2. Main inferential limitation: group/session replication

The manipulated agent proportions, agent traits, and model capability are group/session-level conditions. The reported counts strongly imply one 24-member session per condition. Participants and 40 rounds are repeated observations inside those sessions, not independent group replications.

The public figure-reproduction repository contains processed data and scripts, not the complete live experiment-serving code or per-agent request/context traces. The A2–A5 personalized-question CSVs contain 108, 144, 189, and 54 rows. The supplement says each human answered questions about nine sampled interaction rounds, so those counts correspond to 12, 16, 21, and 6 humans. Across these files, 495 rows = 55 humans × 9 sampled interactions, exactly matching the paper's M5 regression N=495.

M5 uses OLS with HC3 heteroskedasticity-consistent standard errors. HC3 does not account for repeated responses nested within a participant or the session as the treatment-assignment unit. The code loads one tracker per A2–A5 experiment and does not provide session-clustered inference. The 495 rows are not 495 independent people or 495 groups.

Consequently, the reported pattern is a real descriptive result in these sessions, but the design does not establish a replicated group-level causal effect. With one session per arm, between-session variance cannot be estimated and session-specific effects are inseparable from condition effects.

A second measurement limitation: the same all-MiniLM-L6-v2 embedding model supplies the similarity feedback/payoff participants receive and the primary embedding-based consensus measure. That measures convergence under the task's reward metric, not independent semantic truth or decision accuracy. A separate LLM-as-judge analysis of text properties is useful secondary evidence, but not independent adjudication of the primary consensus outcome.

The paper describes multiple LLM-agent participant slots and their pairwise interactions. However, the released repository does not expose per-agent request IDs or separate context histories. Independent model-session/state isolation is reported but not independently auditable from the public artifacts.

## 3. Replicated facilitator comparator

Alsobay et al. (2026), “Bringing Everyone to the Table,” PACM HCI 10(6), CSCW059, DOI 10.1145/3816907, studied 1,475 participants in 281 five-person groups, with 70 groups per condition (one additional group in the message condition). The preregistered experiment used a GPT-4o facilitator, not multiple LLM peer participants.

The LLM facilitator increased unique factual information shared but did not significantly improve the final rate of optimal group decisions. This is a stronger example of group-level replication, but it tests a shared facilitator rather than peer agents.

## 4. Existing platform check: GRAIL

Microsoft Research's GRAIL repository (MIT) already provides synchronous human-group sessions, treatment assignment, private stimuli, consent/onboarding, exit surveys, shared chat, LLM request/response logs, and server-side timestamp guidance. The current repository page shows three forks; a targeted search did not surface a fork implementing multiple peer agents, but fork coverage is not exhaustive.

The current implementation is one shared LLM facilitator: one model configuration, one facilitator prompt, and one sender identity. It does not instantiate multiple independently stateful LLM players. A peer-agent extension would need per-agent identities and context histories, model/prompt configuration, turn scheduling, communication-visibility rules, and per-agent source/request lineage.

Reuse GRAIL rather than build a new group-chat platform. It is an adaptation, not configuration-only. It uses Empirica and a user-supplied LLM endpoint/API key. The platform has no license cost, but it does not supply model access, hosting, participant recruitment, or compensation. A dollar estimate is not credible until groups, agents, turns, context lengths, model/provider, and recruitment are specified. IRB approval and consent are required; the default consent form is a placeholder and the project is not security-hardened or production-ready.

The Chen et al. figure-reproduction repository has zero forks and one star; it provides scripts and processed data, not the full live experiment platform. Math Hopper is an equation-extraction/triage workflow, not a theorem prover; Whirligig is a geometry relationship engine, not a group-experiment platform. SciSpace is available and was used for literature discovery. No new tooling, paid API calls, or human-subject sessions were initiated.

## 5. Lean formalization

Draft HsH PR #1115: https://github.com/Satobloc/HsH/pull/1115  
Branch: review/human-ai-group-unit-identifiability-20261030t1848z

The new module transcribes the eight condition counts and proves their arithmetic totals. It also proves a conditional identifiability theorem: if a treatment level occurs in exactly one group/session, its treatment indicator equals that group's indicator; shifting a nonzero amount between the group intercept and treatment coefficient leaves every fitted value unchanged. Thus those coefficients are not separately identifiable under that premise.

The first exact-head run failed on three proof errors; the module was repaired in commit c029318b96a07fc433ed16a9082cb2e7b29002ea. The repaired exact-head run #41115603417 is still in progress at publication time. **Do not call the module compiled until the repaired exact-head CI completes successfully and theorem-specific axiom output is inspected.**

Lean proves only the formalized conditional arithmetic and algebra. It does not prove the source interpretation that there was one session per condition, validate the data, establish soundness of the translation, or determine whether the paper's causal claims are true.

## 6. Revised VEY-004 research direction

A stronger experiment should have:
1. multiple independent groups per condition, randomized and analyzed at the group/session level;
2. at least two independently stateful LLM peer agents per relevant group;
3. shared-source versus disjoint-source evidence packets;
4. agent-agent communication on/off as a separate factor;
5. exact model/version, prompts, source ancestry, per-agent context, and every message logged;
6. blinded semantic adjudication independent of the feedback/reward model;
7. multiple model families or an explicitly limited single-family scope;
8. preregistered outcomes and cluster-aware inference;
9. informed consent, privacy controls, and IRB approval.

Do not choose a sample size by intuition. Power analysis requires a pilot estimate of between-group variance and the planned primary outcome. GRAIL can provide the human-group substrate, but its facilitator callback must be extended for peer agents.

## 7. Limits and disposition

- Full-text and public-code audit, not an independent replication.
- Live experiment-serving code and raw per-agent model request logs for Chen et al. were not recovered.
- No model calls, human participants, or private instance experiments were used.
- No paid API, hosting, recruitment, or IRB activity occurred.
- VEY-004 remains QUEUED.
- Orson's ConsistencyBench P1 work remains separate and protected. No Nov 9 minor, Nov 30 major, or Dec 14 full-theory paper gate was advanced.
- HSH_RESOURCES remains a research shelf, not H(s)H theory bedrock.
