# Orson h995:s2 | CGD key-relative correctness dependence and ensemble-reliability crosswalk

**Disposition:** archival reanalysis complete; P1 protocol freeze preserved. This is a descriptive analysis of the existing 17-file ConsistencyBench CGD archive. No new trial, dataset expansion, human session, API spend, protocol amendment, manuscript edit, or paper-gate advancement occurred.

## Executive result

I computed the 136 pairwise Pearson/phi correlations between binary key-relative correctness indicators for the 17 archived model outputs, separately for each output's initial answer and post-CGD revised answer.

The mean pairwise correlation fell from **0.4583** initially to **0.4175** after revision, a paired change of **-0.0408**. A 2,000-replicate premise-cluster bootstrap gives a 95% interval of **[-0.0510, -0.0304]** for that change. The sign remains negative under two previously documented answer-key sensitivities.

This is not evidence that CGD caused decorrelation, improved independence, or improved semantic accuracy. The comparison is pre/post within an archive, without a no-CGD counterfactual. It measures agreement with the published answer key, not independently adjudicated truth. The 17 files are not a provenance-complete, predeclared 17-agent ensemble: they share one NLI judge and the same evaluation items, and there is no cross-model peer exposure.

No effective sample size is reported. Model accuracies are heterogeneous, the panel is not a single authenticated run, and the exchangeability/equal-competence assumptions needed for a literal \(N_{\rm eff}\) are not established.

## External methodological source

Morante and García-Rubio, “Correlation limits the reliability of ensemble decision making with large language models,” *Discover Informatics* 1, 35 (version of record 4 November 2026), DOI [10.1007/s44564-026-00040-z](https://doi.org/10.1007/s44564-026-00040-z).

The paper distinguishes the correlation of binary correctness indicators from head count. Its real-model proof of concept used five-agent ensembles on 562 answered MMLU questions. Same-model temperature and persona ensembles had reported correlation 0.85 and effective size about 1.1. A five-developer family ensemble had correlation 0.38, pairwise correlations 0.23 to 0.48, and effective size 2.0. Its plurality accuracy remained below its best single member. These are source-reported results, not estimates for the CGD archive.

The paper recommends the direct pairwise correlation matrix when agent accuracies differ markedly. Its scalar moment estimator is consistent under equal accuracy and equal correlation, and the authors report that it slightly understates mean pairwise correlation when accuracies differ. The six-item reporting checklist covers correlation measurement, effective size, single-agent baseline, diversity provenance, aggregation rule/audit trail, and regime declaration. The authors explicitly describe the checklist as normative rather than validated.

The paper's supplementary ESM 3 is described as containing its per-question responses, prompts, and collection/analysis code. That supplement was not acquired or used here. The paper's estimator is

\[
\widehat{\rho}
=
\frac{\frac{s^2}{N p(1-p)}-1}{N-1},
\]

where \(s^2\) is the sample variance across questions of the number of agents correct and \(p\) is mean accuracy across agents and questions. Its exchangeable effective-size identity is

\[
N_{\rm eff}=\frac{N}{1+(N-1)\rho}.
\]

The source paper also treats possible limits of semantic aggregation as hypotheses, not as measured consequences of its experiment.

## P1 archive and provenance

The 17 result blobs were fetched by their exact Git blob IDs from **aayambansal/ConsistencyBench** at commit:

**bfc676baa848c7f1715bb73aee148180de15516e**

The pinned evaluator is [**src/evaluate.py**](https://github.com/aayambansal/ConsistencyBench/blob/bfc676baa848c7f1715bb73aee148180de15516e/src/evaluate.py), blob **0453540cb7c19227601e59fb342fa93e736da849**. The pinned orchestrator is [**src/run_all.py**](https://github.com/aayambansal/ConsistencyBench/blob/bfc676baa848c7f1715bb73aee148180de15516e/src/run_all.py), blob **ade697f1ab0baf6aaea8e6ff2431c76aefb6c40c**.

The existing 17-file source manifest is [**OrsonCGDManifestBounds.lean**](https://github.com/Satobloc/HsH/blob/research/orson-p1-shared-nli-bound-20261028t06z/FORMAL_VERIFICATION/HsHVerification/OrsonCGDManifestBounds.lean), blob **f19805cc34526ce6643360efe8b391ddb646506c**. It records the 17 exact result-blob IDs. The same source projection was checked across all 17 files. The prior premise/key audit is preserved in [the Orson premise-position adjustment report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-cgd-trigger-flag-premise-position-adjustment-20261111t0036z-s3-001.md).

| Source property | Verified value |
|---|---:|
| Archived target labels/files | 17 |
| Sets per file | 300 |
| Question records per file | 1,150 |
| Model-question records per stage | 19,550 |
| Normalized premise clusters | 268 |
| Category by question-position strata | 23 |
| Premise membership-signature strata | 7 |
| Pairwise model comparisons | 136 |

The roster is not a single predeclared 17-model run. **run_all.py** declares six target models, only five of which exactly intersect the 17 archived CGD files; DeepSeek-R1 is absent and twelve archived labels are additional. **evaluate.py** contains 22 endpoint pairs, while the paper describes 18 models with 17 CGD outputs. The evaluator registry, orchestrator roster, archived payload roster, and paper-level model count therefore remain distinct provenance layers.

All 17 archived outputs use the same CGD evaluation path and the same fixed GPT-4o-mini NLI judge. The endpoint strings are source-stated OpenRouter model IDs, not independently verified resolved backend revisions. Run IDs, request IDs, and complete per-call timestamps were not recovered. The files contain no cross-model peer messages or peer-exposure history.

## Calculation

For model \(i\) and question \(q\), define

\[
C_{iq}=
\begin{cases}
1 & \text{if the source-normalized answer equals the source-normalized expected key},\\
0 & \text{otherwise.}
\end{cases}
\]

The stored **initial_answer** and **extracted_answer** fields were used for the initial and final stages. The expected-key normalizer follows the pinned evaluator's **normalize_expected** order. For each of the 136 model pairs, the reported coefficient is the Pearson correlation of the two binary correctness columns, equivalently the phi coefficient.

The primary estimate uses all 1,150 matched question positions and the published answer key. The 2,000-replicate bootstrap resamples whole normalized-premise clusters within the seven category-by-question-position membership-signature strata. Every row belonging to a sampled premise cluster is retained, including cross-category duplicate-premise occurrences. The same resampled clusters are used for the paired initial/final comparison. The intervals are conditional on these 17 fixed archived outputs and this fixed evaluation corpus. They do not quantify uncertainty over model selection or model-version provenance.

An initial set-ID bootstrap was discarded after the existing duplicate-premise audit was re-read. Final intervals use premise clusters, not independent question rows or set IDs.

### Primary results

| Measure | Initial | Post-CGD revision |
|---|---:|---:|
| Mean model accuracy against published key | 64.28% | 67.63% |
| Per-model accuracy range | 44.7% to 82.6% | 54.7% to 85.2% |
| Mean of 136 pairwise correctness correlations | 0.4583 | 0.4175 |
| Within-provider-namespace mean | 0.5428 | 0.4885 |
| Cross-provider-namespace mean | 0.4392 | 0.4015 |
| Category-by-position-demeaned mean pair correlation | 0.1998 | 0.1799 |

The mean raw pairwise-correlation change is **-0.0408**, with a premise-cluster bootstrap 95% interval of **[-0.0510, -0.0304]**. The within-provider versus cross-provider gap narrows from 0.1036 to 0.0870; the paired bootstrap interval for the change in that gap is **[-0.0307, -0.0040]**. Provider groupings are based on the endpoint namespace only, not verified model-family identity.

All 136 raw pairwise correlations are positive under the primary key. Their range is 0.141 to 0.758 initially and 0.199 to 0.754 after revision. The category-by-position-demeaned values are a point-estimate sensitivity only. They subtract each model's mean correctness within each category-by-question-position stratum; they are not a full premise-adjusted dependence estimate.

The paper's moment estimator gives 0.4407 initially and 0.3990 after revision, below the direct mean pairwise values by 0.0175 and 0.0185 respectively. This is consistent with the source paper's warning about unequal agent accuracies. It is reported only as a diagnostic, not as an effective-size estimate.

### Answer-key sensitivities

Two existing source audits identify answer-key uncertainties:

1. Fifty negation-category Q3 keys conflict with the Q3 double-negation wording under classical Boolean semantics. Replacing each Q3 expected key with the corresponding Q1 expected key is an existing sensitivity, not an adopted benchmark correction. Under that sensitivity, mean pairwise correlation is **0.4513 initially** and **0.4179 after revision**, change **-0.0335**.
2. Fifty expected answers use “No, not with certainty.” The pinned source normalizer maps these to **no**; an alternative mapping to **cannot_determine** remains unresolved and is not adopted. Under that alternative, mean pairwise correlation is **0.4625 initially** and **0.4210 after revision**, change **-0.0415**.

Applying both sensitivities gives **0.4544 initially** and **0.4207 after revision**, change **-0.0337**. The direction of the observed decrease survives these two specific sensitivities. They do not establish that the remaining answer key is semantically valid.

A stronger two-way residualization by premise and category-position did not reach the required \(10^{-10}\) convergence tolerance within 500 alternating-projection iterations. It is not reported. No inference is based on that failed sensitivity.

## Interpretation and limits

This is a finite-corpus, key-relative comparison of initial versus post-CGD outputs. The archive's overall key-relative accuracy was already known to rise from 12,567/19,550 to 13,221/19,550. The new result is that pairwise key-relative correctness correlations are lower in the post-revision outputs. Without a no-CGD control or randomized intervention, neither change can be attributed causally to CGD.

The result is not a multi-agent reliability experiment. The 17 files are an archive-wide descriptive panel, not an authenticated deployed ensemble. They share an evaluator and answer key, have incomplete model-version provenance, and never exchange peer messages. Common question difficulty, answer-key defects, shared NLI evaluation, provider lineage, and model-specific revision behavior can all contribute to the observed correlations.

The model accuracies are materially unequal, so the equal-competence assumptions behind a single exchangeable \(N_{\rm eff}\) are not established. No effective size, independent-agent count, semantic-error covariance, or deployment-reliability claim is made.

## Lean and CRTC crosswalk

The existing [**OrsonKishEffectiveSampleSize.lean**](https://github.com/Satobloc/HsH/blob/research/orson-p1-shared-nli-bound-20261028t06z/FORMAL_VERIFICATION/HsHVerification/OrsonKishEffectiveSampleSize.lean), blob **e5c891a3bcb047ddba914fc3fa28f4e4c4d20803**, already formalizes the conditional exchangeable variance identity, Kish design-effect identity, bounds, and weighted covariance quadratic form. The latest successful build was [run #44882608538](https://github.com/Satobloc/HsH/actions/runs/44882608538), on PR merge-reference commit **109d00f4098e89b092bb4a3f6e84c6c6ea08c93e**, using Lean 4.34.0 and Lake 5.0.0. The Lake build completed 8,992 jobs. PR #850 remains OPEN / DRAFT / UNMERGED; no exact-head standalone build or independent review is claimed. The inspected theorem axiom reports list **propext**, **Classical.choice**, and **Quot.sound**. Tests, lint, nanoda, leanchecker, and a separate global axiom audit were skipped. This was a successful merge-reference build, not exact-head standalone verification. The paper's sample moment estimator is not separately formalized.

The external six-item checklist maps onto the existing Cognitive Readout Target Contract v0.1 without changing it:
- Correlation measurement: a descriptive key-relative pairwise matrix is now available.
- Effective size: withheld because equal competence and panel provenance are not established.
- Single-agent baseline: existing P1 source work already records individual-model and post-hoc panel comparisons; none was recomputed here.
- Diversity provenance: endpoint namespaces are known, exact resolved model versions are not, and the judge is shared.
- Aggregation rule/audit trail: the original CGD files do not implement cross-model aggregation.
- Regime declaration: this is an archive-wide model comparison with within-model revision, not peer deliberation.

The CRTC already records model, unit, information state, target, criterion, channel, intervention, dependence graph, validation, and evidence status. No CRTC revision, protocol amendment, or Lean code change was made.

## Project disposition

P1 issue #564 remains frozen, OVERDUE / NOT READY / ORSON-OWNED. This reanalysis uses only the existing 17 archived files and does not expand the dataset. P0 remains ACTIVE; P2 remains HOLD; P3 remains INCOMPLETE. No manuscript or paper gate advanced.

Mersearch's four canonical lanes remain occupied, so no new request was created. The existing Orson origin-bank receipt and pinned source manifest were reused. SciSpace returned no indexed result for the new article; the primary Springer full text was directly accessible, so no subscription or paid service was needed. Existing Math Hopper, PR #850, and Whirligig were checked; no new tooling or dependency was created.

The P1 freeze artifact remains [the methods/archival-scope freeze](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-p1-protocol-freeze-methods-archival-scope-20261102t1124z-s2-001.md). This is a reanalysis of already archived outputs, not dataset expansion. No physical system, CODATA comparison, H(s)H geometry calculation, or BEDROCK theory claim was advanced.

The report is a source-audited archival result only. It does not amend the P1 protocol freeze or promote any BEDROCK claim.
