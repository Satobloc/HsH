# Orson h786:s2 — Communication revision is not passive error dependence

**Status:** supporting literature crosswalk; not a P1 protocol amendment, experiment, replication, or paper-gate advancement.

## Result

Two previously unindexed 2026 arXiv studies add a useful evidence class to the current LLM-cognition programme: **causal effects of peer-message exposure on a receiver's answer**. They should not be collapsed into the passive error-correlation and shared-evaluator questions already represented in the ConsistencyBench work.

The key distinction is between:

1. errors that are correlated before agents communicate;
2. labels correlated by a shared evaluator;
3. answers changed by exposure to a peer message; and
4. group-level gains or losses produced by deliberation and aggregation.

These are different estimands. Agreement alone does not identify which mechanism produced it.

## New primary-source comparators

### Li et al. (2026): Independent–Communicate–Revise

Shixuan Li, Wei Yang, Peiyu Zhang, Anzhe Cheng, Heng Ping, and Paul Bogdan, “Beyond Final Accuracy: Auditing Communication in LLM Multi-Agent Systems,” arXiv:2610.01042 (1 October 2026).  
[arXiv record](https://arxiv.org/abs/2610.01042) · [PDF](https://arxiv.org/pdf/2610.01042)

The paper introduces an Independent–Communicate–Revise (ICR) framework. Its unit is a directed revision event: agents first reason independently, then a receiver revises under a specified communication condition. The paper compares no message, answer-only, and full-text communication, and also studies latent communication and receiver-policy variation. It reports four reasoning benchmarks, with additional receiver-policy comparisons on MedQA and GPQA-D.

The abstract reports that similar final accuracy can conceal different revision behaviour. Relative to answer-only transmission, full reasoning increases correction while reducing preservation across all four benchmarks. A structured verification policy shifts channels toward greater preservation and lower correction, while selectivity varies by channel and task.

**Interpretation:** richer messages can increase both useful and harmful influence. A receiver policy that preserves more answers may also correct fewer initial errors. Final accuracy alone can hide this trade-off.

**Limit:** the accessible structured extraction did not provide the numerical magnitudes or confidence intervals needed for independent effect-size comparison. It describes a no-message revision control, but its exact operational equivalence to a true no-additional-reasoning counterfactual needs direct PDF/appendix inspection. Execution-cost figures are described as run-specific rather than controlled throughput comparisons. Direct PDF, appendices, raw data, and code were not retrieved in this run.

### Gong et al. (2026): controlled upstream-message effects

Yaxin Gong, Gangyi Zhang, Chongming Gao, Leyang Shen, Chenxiao Fan, Jiakai Wang, Dong Wang, Yang Liu, Wenjie Wang, and Xiangnan He, “When Upstream Messages Override Correct Answers: A Controlled Study of Multi-Agent LLM Collaboration,” arXiv:2609.36855 (29 September 2026).  
[arXiv record](https://arxiv.org/abs/2609.36855) · [PDF](https://arxiv.org/pdf/2609.36855)

The study uses a directed upstream-to-downstream handoff. It holds the downstream task and evidence fixed while varying whether the receiver sees no message, the upstream message, or a message with the opposite conclusion. The paper reports five benchmarks and five receivers, with additional manipulations of conclusion content, message attribution, and evidence availability.

The abstract reports that an incorrect upstream message changes an answer in **up to 32% of cases where the receiver would otherwise be correct**. It also reports that **94% of audited harmful cases** involve copying the upstream agent's specific wrong answer, which the authors call answer substitution.

These are qualified author-reported results: 32% is an “up to” maximum, not a pooled rate; 94% is conditional on an audited harmful subset, not all messages or all tasks. The exact denominators for both headline figures were not recoverable from the structured full-text extraction available in this run. No denominator reconstruction or new percentage calculation is claimed.

**Interpretation:** under the tested handoff conditions, peer-message content can causally displace a receiver's answer even when the receiver has sufficient independent evidence. This is not passive error correlation and not a shared-judge effect.

**Limit:** the result is bounded to the tested models, benchmarks, handoff architecture, and message manipulations. Direct PDF, appendices, raw data, and code were not retrieved; exact per-benchmark denominators and the audited-case selection rule remain open.

## Crosswalk with existing evidence

| Evidence class | Existing or new source | What it measures | What it does not establish |
|---|---|---|---|
| Passive error dependence | Hossain et al. (2026), arXiv:2609.22512; prior VEY-013 review | Correlation among judge errors on common items | Peer-message causation |
| Shared evaluator / within-model revision | ConsistencyBench CGD, frozen P1 archive | Target-model self-history evaluated through a common GPT-4o-mini NLI checker | Cross-model peer exposure or social conformity |
| Peer-message revision | Gong et al. (2026), arXiv:2609.36855 | Receiver changes under manipulated upstream messages with receiver evidence held fixed | General behaviour of all multi-agent systems |
| Communication-channel revision | Li et al. (2026), arXiv:2610.01042 | Correction and preservation under different message channels and receiver policies | A universal ranking of channels independent of receiver policy |
| Deliberative aggregation | Barrera-Lemarchand et al. (2026), arXiv:2609.22497; prior VEY-012 review | Group-level deliberation versus passive aggregation in the tested domains | Independence of individual errors or harmlessness of every message |

The Hossain and Barrera-Lemarchand sources were already reviewed and indexed in VEY-013 and VEY-012 respectively; they are reused here as comparators, not presented as new discoveries.

The current ConsistencyBench CGD archive contains 17 target-model output files and records within-model self-history/self-revision. The same NLI checker is shared across those target outputs. The archive does not expose cross-model peer answers. It therefore supports a bounded study of evaluator and within-model revision structure, not a claim that the 17 target models deliberated with one another.

## Measurement implication

A defensible future design should keep four measurements separate:

- **Baseline error dependence:** estimate error covariance from blind, pre-exposure answers on common items.
- **Evaluator dependence:** score the same frozen answers with both a shared evaluator and independent blinded adjudicators.
- **Peer-exposure effect:** randomize no-message, correct-message, and wrong-message conditions while preserving the receiver's initial answer and evidence.
- **Deliberative gain:** compare a deliberated group decision with passive aggregation and retain individual pre/post answers.

Report correction, preservation, corruption, answer substitution, and group accuracy separately. Pre-register the item universe, condition denominators, model/version matrix, evaluator identity, clustering, and uncertainty procedure. These are design requirements proposed by this crosswalk, not an administered protocol or authorization to run a new trial.

## Formalization boundary

Existing Orson PR #850 contains `HsHVerification.OrsonRevisionBalance.net_gain_identity`, a conditional count-balance identity:

`final - initial = repairs - regress`

The theorem was included in successful Lean 4.34.0 / Lake 5.0.0 build #43245831469, on merge-reference commit `a9f307abf17412651b765a168158626b6a09676d` (8,984 build jobs). Its `#print axioms` output is `[propext, Quot.sound]`. The build merged PR head `4e9b685a031577ec51ed15b02cbdf344a7b6dde5` into base `598a45b3feb9378eb8f14ff069ec9080137113c2`; it is not a standalone exact-head or current-main integration build. Tests, lint, nanoda, and the global axiom audit were skipped.

This theorem checks only the encoded arithmetic identity under its partition premise. It does not formalize the ICR or Gong experimental estimands, authenticate source transcription, or establish empirical premises. No new Lean module or build was created. Formalizing the new estimands is deferred until their source definitions, item denominators, and treatment mappings are recovered and the P1 scope authority is checked.

## Provenance and status

- Scholar Sidekick audited four arXiv references: all four identifiers matched their claimed titles; no retractions or correction notices were flagged.
- SciSpace structured full-text extraction was used as a review aid. Its metadata labels the two new records “Journal Article,” but their identifiers are arXiv DOIs; this report treats them as preprints. Peer-review status is not established.
- The extraction returned an unresolved denominator/cell-count detail for the Gong study. Headline percentages are retained only with their published qualifiers.
- Direct PDFs, appendices, raw datasets, and code were not retrieved. No independent replication, raw-data reanalysis, LLM inference call, human session, or API spend occurred.

## P1 and campaign boundary

P1 issue #564 remains OPEN / NOT READY. Its protocol remains frozen to the public ConsistencyBench CGD methods/archival scope. The OV-49–OV-53 matched-prompt bank remains NOT RECOVERED; an authorized inference endpoint remains NOT AVAILABLE; canonical P1 LaTeX, compiled PDF, readable reader route, independent hostile review, and author disposition remain incomplete.

This crosswalk is supporting literature only. It does not amend the P1 protocol, add cross-model peer exposure to the ConsistencyBench archive, advance the November 9 gate, or alter P2 November 30 / P3 December 14.

**Next source cursor:** retrieve the two primary PDFs/appendices and any released data/code; resolve the exact denominators and no-message control before importing numerical results. Keep the original October 9 Orson role-reset source on the Mersearch recovery list; no occupied Mersearch lane was overwritten or retriggered.
