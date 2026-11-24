# Worker-to-lead evidence continuity in multi-agent LLM systems

**Source:** Hejia Zhang et al., *Multi-Agent Memory Inconsistency: Where Factual Conflicts Disappear in LLM Agents*, arXiv:2611.22245v2, posted 18 November 2026.  
**Primary source:** https://arxiv.org/abs/2611.22245v2  
**Reader status:** Full v2 arXiv HTML inspected, including benchmark, measurement, results, and limitations. No independent reproduction or dataset download.

## Executive finding

The paper isolates a failure between evidence retrieval and evidence use. Mandatory delegation raises the proportion of planted conflicts for which both claims are retrieved, but the gain is largely lost before the lead can make a joint decision. The useful new distinction is not simply memory versus forgetting. It is the difference between:

1. evidence existing somewhere in the distributed execution;
2. both claims being reported and available to the lead;
3. both claims being simultaneously present in the lead's actual decision context;
4. the lead recognizing and correctly handling the conflict.

The paper measures the first, second, and selected-output stages. It explicitly identifies joint availability timing as a missing measurement. This is a bounded empirical result about one controlled document-review benchmark, not a general law of LLM memory or group cognition.

## 1. Study design

The authors introduce 73 controlled numerical conflicts across 11 Harvey LAB due-diligence document-review tasks. They compare three execution policies:

- **None:** one agent reads the documents and writes the report.
- **Optional:** the lead may inspect sources, create workers, and assign overlapping reviews.
- **Required:** workers inspect assigned document partitions while the lead coordinates and synthesizes without reading source documents.

The three model configurations are GPT-5.6 Luna, GPT-6 Luna, and Claude Haiku 5.5. Each model runs each policy twice across all 11 tasks: 198 task executions and 1,314 conflict observations. Generation spending uses a common $59.60 per-round allowance; observed mean spending ranges from 0.95 to 1.02 times that allowance, excluding judging.

The profiler correlates model requests and responses with SDK events, native traces, tool outputs, and report artifacts. It defines four evidence stages:

1. **Source Reads:** endpoints visible in source-tool outputs.
2. **Worker Reports:** endpoints in outgoing worker messages and completion reports, including peer-directed messages.
3. **Lead Evidence:** incoming evidence combined with the lead's permitted source reads.
4. **Final Report:** endpoints in the selected, graded deliverable.

The paper separately measures **Judge Pass**, which requires both identifying the specified discrepancy and accurately treating its quantitative comparison.

For conflict i, the planted pair is G_i = {A_i, B_i}, and E_i(t) is the set of endpoints observed at stage t. Pair Recall is:

R_pair(t) = (1/N) * sum over i of 1[G_i is a subset of E_i(t)].

This is a pooled stage-presence measure. It gives credit when both endpoints occur somewhere in the stage's eligible agents or artifacts, regardless of unrelated evidence. It does not by itself establish that both endpoints were simultaneously available to the same decision-maker.

## 2. Results

| Policy | Source Reads Pair Recall | Worker Reports | Lead Evidence | Final Report | Judge Pass |
|---|---:|---:|---:|---:|---:|
| None | 50.2% | no worker channel | 50.2% | 18.3% | 16.2% |
| Optional | 62.8% | 12.8% | 54.8% | 25.8% | 24.2% |
| Required | 68.7% | 24.4% | 24.4% | 15.8% | 13.2% |

Required improves source-stage pair retrieval over None, from 50.2% to 68.7%, while Judge Pass falls from 16.2% to 13.2%. Optional has the highest pooled Judge Pass at 24.2%, but its behavior differs substantially by model.

Under Required, Source Reads contain both claims in 301 of 438 observations. Of those 301 pairs, 106 also appear in Worker Reports, or 35.2%. Overall Worker Report Pair Recall is 107 of 438, or 24.4%. Worker Reports and Lead Evidence have identical pooled labels in this condition. The measured loss is therefore concentrated between source inspection and worker reporting.

The model-specific results caution against treating delegation policy as model-independent. Under Optional, worker-report Pair Recall is 0.7% for GPT-5.6 and 0.7% for GPT-6, but 37.0% for Haiku. Under Required, the corresponding rates are 24.0%, 18.5%, and 30.8%.

### Same and Split

The paper distinguishes **Same**, where one individual supplies both endpoints, from **Split**, where only the contributors' union contains both. Same takes precedence when multiple routes exist. At the lead, the provenance label refers to immediate contributors, not original source roots.

In the Source Reads cohorts, Required has 34.2% Judge Pass versus 22.5% for None in Same cases, but 10.0% versus 18.9% in Split cases. In the Lead Evidence cohorts, the corresponding rates are 72.2% versus 33.3% for Same and 17.1% versus 28.6% for Split.

These are matched comparisons on identical model, run, task, and conflict instances, but the cohorts are defined by Required's observed evidence distribution. They are not randomized assignments to Same or Split. They therefore do not isolate a causal effect of distributing claims across workers.

## 3. Source-critical limitations

1. **Cumulative presence is not decision-time co-presence.** The profiler measures cumulative endpoint presence through the graded checkpoint. It does not separately report the exact prompt or context snapshot in which both claims were jointly available immediately before the lead's decision. The authors identify this as a natural extension.

2. **Immediate contributor is not source independence.** Same and Split describe which agent supplied an endpoint. They do not establish independent source roots. Two workers may relay derivatives of one upstream document or dataset; one worker may combine genuinely independent sources. Agent count is not an independence measure.

3. **Required is a bundled intervention.** It combines mandatory delegation, partitioned source assignments, and restricted lead source access. The experiment cannot attribute the observed loss to any one component.

4. **The subgroup contrast is selected on observed behavior.** Same and Split cohorts are defined from Required's realized retrieval pattern. Matching the same cases under None is informative, but it does not turn the subgroup comparison into randomized evidence about assignment topology.

5. **The judge is not independently validated.** Claude Sonnet 5 supplies the semantic grades. Manual inspection found three saved Judge Pass labels that credited neighboring comparisons rather than the planted conflict. The authors say broader human review could improve endpoint matching and semantic grading.

6. **Limited task and run coverage.** Evidence comes from 11 tasks with planted numerical conflicts and two runs per model. Repeated conflicts are clustered within tasks. The authors call for more repetitions and uncertainty estimates that account for shared tasks.

7. **The study is not a human-LLM group experiment.** It measures all-LLM delegated document review. It does not establish how human participants respond to these handoffs, nor does it measure belief, consciousness, or subjective experience.

8. **Reproduction status is limited.** No public code or dataset link was located in the inspected paper text. The benchmark and reported figures were not independently reproduced in this review.

## 4. A more discriminating evidence-flow model

A useful next version should separate the following events rather than treating stage presence as a single memory variable:

- source read;
- worker report created;
- report delivered and received;
- claim pair present in the lead's actual decision prompt or context snapshot;
- lead decision and cited evidence;
- final report;
- independent adjudication.

Each claim should retain its source document, source-root lineage, transformation history, sender, recipient, event time, and context-snapshot identifier. A source-root identifier is needed because immediate contributor identity is not equivalent to independent evidence.

Three separate measurements are proposed:

- **Pair co-presence:** both conflicting claims are present in the same decision-maker context snapshot immediately before the decision.
- **Root-collapsed pair recall:** both claims are present after derivative documents and copied reports are traced back to their underlying source roots.
- **Decision use:** the decision actually compares or cites both claims, rather than merely having them somewhere in accumulated context.

These should remain separate from semantic conflict detection, quantitative resolution, calibration, abstention, and final accuracy.

## 5. Falsifiable experiment

Randomize the allocation of the two conflict endpoints to the same worker or to different workers, independently of task difficulty. Hold total source exposure, model, token budget, and lead authority constant. Cross that allocation with two handoff formats: ordinary free-form summaries and a structured paired-claim record containing both values, source excerpts, source-root lineage, uncertainty, and an explicit unresolved-conflict field.

Record the exact lead prompt/context snapshot at decision time. Use multiple task families and model families, enough independent repetitions to estimate task-clustered uncertainty, and blinded human adjudication of the final reports. A separate human-lead arm with consenting participants could test whether the same mechanism appears in actual human-LLM collaboration; the present paper does not supply that evidence.

The proposal is falsifiable:

- If structured paired-claim handoffs improve pooled recall but not decision-time co-presence or conflict detection, evidence retention alone is insufficient.
- If the Same/Split association disappears under randomized allocation, the original subgroup pattern was not evidence of a causal topology effect.
- If an apparent benefit disappears after collapsing derivative documents to source roots, immediate contributor count was not measuring independent evidence.
- If human adjudicators do not reproduce the LLM judge's result, the semantic outcome measure needs revision.

No experiment, human-participant study, model/API trial, dataset download, or numerical reanalysis was performed in this review.

## 6. Formal crosswalk and limits

The paper's evidence stages are projections from a more detailed execution history. An existing HsH formalization provides a reusable condition for this kind of projection.

Let H be the set of complete execution histories, P map a history to the lead-visible evidence state, and T map the complete history to the true planted-conflict status. A perfect deterministic detector D based only on the projected state exists exactly when T is constant on every fiber of P:

P(h1) = P(h2) implies T(h1) = T(h2).

This is the classifier instance of the existing factorization theorem in [HsH PR #1189](https://github.com/Satobloc/HsH/pull/1189), module NadirProjectionCoarseGrainFactorization.lean. The theorem states that an induced map on the image of a projection exists if and only if the target map is constant on projection fibers; the induced map is unique there.

The exact PR head da1e7d5dff0cdbc1d81303e3c573b79832087a38 passed [Lean Actions run #44106198466](https://github.com/Satobloc/HsH/actions/runs/44106198466), including the Lean/Mathlib library compile. The module contains theorem-specific #print axioms commands; their textual output was not independently retrieved in this review. The PR remains open, draft, and unmerged. No new theorem or source-specific Lean module was created.

The formal theorem establishes a conditional mathematical identifiability boundary. It does not show that the paper's observed histories contain a fiber collision, validate the benchmark's labels, verify its percentages, or prove that an actual lead model used a particular prompt snapshot. The paper's Pair Recall equation and empirical values were not independently formalized or recomputed here.

## 7. Project boundary and provenance

This is a separate assistant-authored source review. It is not an amendment to Orson Vay's protected P1 manuscript, protocol, dataset, or research ownership. P1 remains Orson-owned and frozen; no paper gate advanced. P0 remains active, P2 remains on hold, and P3 remains incomplete.

Mersearch was not callable in this runtime and all four existing request lanes remained occupied. SciSpace discovery was checked, then the exact primary source was read directly from arXiv as a bounded fallback. No HSH_RESOURCES private payload was opened. No new tool, dependency, subscription, paid API call, physical calculation, fit, prediction, independent measurement, or SAT-O/Blockwave equation change was made.

**Epistemic status:** external preprint findings are reported as the authors' controlled benchmark results; the limitations and proposed measures are this review's methodological analysis; the experiment is a proposal; the projection theorem is an existing Lean-verified abstract result, not an empirical finding.
