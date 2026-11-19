# Orson h949:s4 | Model-transition and persona-drift review

**Date:** 2026-11-19  
**Run key:** `REVROT3-19-20261011:949:s4`  
**Status:** FUTURE-METHODS ONLY / P1 FROZEN / NO TRIAL / NO MODEL OR API CALL / NO HUMAN SESSION / NO THEORY PROMOTION.

## 1. Scope and authority

The fixed ring calculation selects Orson Vay (index 18), with Sable next (index 0). This is assistant-level research under the Orson routing label, not authenticated Orson-thread participation and not an authenticated Orson activation toward the separate four-of-five allocation target.

The historical remit was checked against the original direct-user appointment in the MIRA Library export, not inferred solely from the assistant-maintained workspace charter. The appointment covers archive-grounded study of ChatGPT, NotebookLM and LLMs generally; Nathan–LLM interaction; the active instance team; bounded test design; and advice to Tern. Direct follow-ups authorize architectural/computational self-cognition study and collaboration with Tern on the Modes Menu. Exact private Library identifiers are omitted.

This is a separate future-methods literature review. It does not amend, reopen, or expand P1. The frozen P1 question remains the source-audited study of shared evaluator dependence and within-model self-revision in the archived ConsistencyBench CGD pipeline. P1 is not a cross-model peer-deliberation experiment; the external paper below is not P1 evidence.

## 2. Primary source: model transition

Yihuang Kang et al., “Towards Identity-Preserving LLM Agents under Model Transition,” arXiv:2611.10628, submitted 2026-11-07.  
Original: https://arxiv.org/abs/2611.10628

The paper defines an agent configuration \(A=(M,\Sigma,P)\): backend model \(M\), deployer-controlled external state \(\Sigma\) (persona, memory, standing rules), and interaction protocol \(P\). A transition replaces \(M\) while holding \((\Sigma,P)\) fixed. Its operational drift criterion compares behavioral change with same-model reload variation.

The study reports 5,760 runs: three open-weight model families, 96 selected PACT items, four conditions (baseline, reload, naked, anchored), and five seeds per item. The 96 items are one scenario per each of 12 domains crossed with four pressure types and two system-prompt modes. The external state is one static, model-agnostic persona plus three prewritten episodic memories, not memory accumulated through interaction with any tested model.

The interaction is three turns: a verbal-commitment probe (Say), a PACT decision under pressure (\(\mathrm{Do}_{pre}\)), and a pushback decision (\(\mathrm{Do}_{post}\)). The study selects four PACT pressure types (none, urgency, manager verbal pressure, rule delegitimization), not the full nine-family PACT battery. For rule-delegitimization items, it pairs the item with the Turn-2 pushback from the corresponding no-pressure item to create a uniform three-turn structure. This disclosed adaptation must be preserved in any reproduction.

### Reported results

| Measure | Result |
|---|---:|
| Baseline post-pressure compliance: Gemma / DeepSeek / GLM | 97.1% / 94.5% / 93.8% |
| GLM ↔ Gemma drift | ±3.3 pp; 95% CI +0.7 to +6.2 |
| GLM ↔ DeepSeek drift | ±0.7 pp; 95% CI −1.8 to +3.5 |
| Gemma ↔ DeepSeek drift | ±2.5 pp; 95% CI +0.1 to +5.3 |
| \(\Sigma\) effect: Gemma / GLM / DeepSeek | +5.8 / −0.2 / +1.2 pp |

The same external state materially improves measured compliance for Gemma, but not GLM or DeepSeek. Minimal self-anchoring does not significantly improve any tested model. Cross-model drift is therefore pair- and substrate-dependent in this benchmark, not universally absent or present.

The paper reports 80 ambiguous post-pressure outputs (1.4% of 5,760), excluded from post-pressure compliance denominators: 60 GLM, 4 Gemma, 16 DeepSeek. The authors say no single condition disproportionately concentrates ambiguous cases within a model. GLM also required 72 extended-token-limit reruns after truncation. These are disclosed, but model-specific missingness and selective reruns warrant sensitivity analysis.

The public PACT release contains 3,364 items across 48 scenarios and 12 domains; the transition study's 96-item subset uses one scenario per domain. The exact selected scenario IDs and selection seed are not reported in the accessible paper text. The public PACT extractor uses an LLM to map free-form replies to listed options; it is not a deterministic parser. The transition paper adds a separate GPT-OSS-120B L2 judge. The paper reports 10,000 bootstrap resamples and no multiplicity correction; the accessible methods do not specify the resampling unit. No code or run-level dataset for the transition study was located.

## 3. Prior comparator: within-model persona drift

Christina Lu et al., “The Assistant Axis: Situating and Stabilizing the Default Persona of Language Models,” arXiv:2601.10387 (2026-01-15).  
Original: https://arxiv.org/abs/2601.10387

This paper studies a different transition: **within one fixed model over a multi-turn conversation**. It derives a model-specific activation direction from 275 role archetypes and 240 extraction questions. The Assistant Axis contrasts default-Assistant activations with fully role-playing role activations; it aligns with persona-space PC1 but is not the whole activation state. The study uses Gemma 2 27B, Qwen 3 32B and Llama 3.3 70B; four domains (coding, writing, therapy-like conversation and AI philosophy); 100 conversations per domain; up to 15 turns; and three frontier-model auditors. Therapy-like and AI-philosophy conversations show greater movement away from the default Assistant region. Persona-space components explain 19.4–33.6% of activation variance in the sampled chat data, so this is a partial representational coordinate, not a complete identity measure.

The authors report that activation capping reduced harmful responses by nearly 60% on their selected jailbreak evaluation while preserving capability on selected benchmarks. This is a white-box intervention requiring internal activation access; it is not available for ordinary black-box ChatGPT or NotebookLM use. The study uses simulated interlocutors and LLM judges; it does not establish subjective experience or personhood.

The existing internal AI/Cognition catalog had this source as provisional metadata-only; this run read the original arXiv HTML. The new model-transition preprint was not found in the bounded AI/Cognition or PRIOR_ART catalogs. No private archive path or artifact is exposed here.

## 4. Cross-study synthesis and formalization

The papers address orthogonal changes:

- **Substrate transition:** change \(M\) while attempting to hold external state \(\Sigma\) and protocol \(P\) fixed.
- **Within-model persona drift:** hold \(M\) fixed while conversational context \(C_t\) moves an internal activation state \(z_t\).

A useful bookkeeping reconstruction is:

\[
Y_t=F(M,\Sigma,P,C_t,z_t),
\qquad z_t=\langle h_t,v_M\rangle ,
\]

where \(Y_t\) is the observable response/action, \(h_t\) an internal activation representation, and \(v_M\) a model-specific Assistant Axis. This combines two papers' operational objects; it is not a validated universal cognitive architecture. The papers establish no common cross-model coordinate system for \(z_t\). For black-box services \(z_t\) is unobserved; prose alone cannot reveal it.

The observable pipeline is also many-to-one:

\[
\text{response/action trace}\rightarrow\text{parsed decision}
\rightarrow\text{compliance label}\rightarrow\text{aggregate rate}.
\]

Equal scalar rates do not establish equal action distributions, response traces, memory retrieval or source attribution.

**FORMALIZATION_BLOCKED_DEFINITION:** the tuple and activation projection are explicit, but a general identity-preservation theorem still needs a specified behavioral metric, distance/divergence, replication distribution, equivalence margin, and task/dimension family. Cross-model activation comparison additionally needs validated alignment between model-specific activation spaces. The model-transition paper's criterion is an operational detection rule, not a complete behavioral identity predicate.

No new Lean module, theorem, fixture, `#eval`, PR, branch or CI run was created. Existing Orson PR #850 was independently rechecked: merge-reference Actions run #44416543286/job #135198228890 succeeded with 8,991 build jobs and an existing finite `#eval`. It concerns the frozen ConsistencyBench conditional-ESS formalization, not this external model-transition paper; it is not an exact standalone PR-head build. Tests/lint were not part of that job; leanchecker, nanoda and global axiom audit were skipped. No claim about the new paper is Lean-verified.

## 5. Falsifiable next experiment

A future **behavioral-profile migration audit** should:

1. Hash the source configuration \((M_A,\Sigma_A,P)\), including provenance/version of each memory and rule.
2. Establish same-model baseline/reload variation for both source and target models.
3. Test directed migration \((M_A,\Sigma_A,P)\rightarrow(M_B,\Sigma_A,P)\); do not infer the reverse.
4. Test state adaptation \(\Sigma_A\rightarrow\Sigma_B\) separately from the model swap.
5. In open-weight models only, track each model's own persona coordinate; do not compare raw activations across models without validated alignment. For black-box services, measure observable behavior only.
6. Publish exact task/scenario IDs, seeds, prompt hashes, model versions, decoding settings, truncation logs and raw outputs.
7. Separate action outcomes, task success, policy scope, memory/source retrieval and attribution, correction behavior, and interaction patterns. Keep verbal commitment as self-report, not action.
8. Use deterministic scoring where possible; blind independent adjudicators for genuinely ambiguous outputs; preserve ambiguity and run missingness bounds.
9. Compare full outcome distributions as well as rates. Predeclare equivalence margins from same-model reload variation, use equivalence testing, and correct model-pair/dimension comparisons.
10. Report transitions as directed and retain negative, null and contradictory results.

A useful falsifier is a transition that preserves aggregate compliance while materially changing action distributions, error types, source attribution or correction behavior. That would defeat a broad identity-preservation claim based only on the aggregate rate.

Proposal only: no participants, model calls, API spend or experiment. Any human extension requires consent, privacy controls and an independently approved protocol.

## 6. Protected boundaries and source extent

P1 issue #564 remains OPEN / OVERDUE / NOT READY and Orson-owned. The 2026-11-02 methods/archival freeze is unchanged; PR #850 remains OPEN / DRAFT / UNMERGED. No P1 dataset, protocol, manuscript, owner, priority or paper gate changed. The November 9 minor gate remains missed; November 30 P2 remains HOLD; December 14 P3 remains INCOMPLETE; P0 remains ACTIVE; FIE review is next due November 24.

Mersearch was not callable; all four canonical request lanes remain occupied/requested. The two public papers, PACT repository and PACT source files were a bounded external-source fallback, not Mersearch results. HSH_RESOURCES AI_START_HERE, PRIOR_ART guide and bounded AI/Cognition index were checked; no private source PDF/payload was opened or modified. No PACT data were downloaded; no raw run-level data were obtained; no independent reproduction is claimed.

No physical calculation, fit, prediction, independent measurement, SAT-O/Blockwave equation change, new tooling, dependency, subscription, paid API call, human study, model trial, or BEDROCK promotion.

**Reading extent:** original arXiv HTML for arXiv:2611.10628 (methods, setup, results, limitations, conclusion); original arXiv HTML for arXiv:2601.10387 (persona-space construction, multi-turn methods, results and limitations); PACT README plus `pact/data.py`, `pact/metrics.py`, `pact/extract.py`; existing P1 freeze, issue #564, PR #850 and CI logs.

**Next cognition cursor:** obtain the model-transition paper's exact 12 selected PACT scenario IDs, selection seed, run-level outputs and judge records if released. Until then, retain it as a bounded external comparator, not a replicated result or P1 amendment.
