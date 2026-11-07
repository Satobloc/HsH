# VEY-032 | Answer-paired judge contrasts and the one-judge boundary

**Date:** 2026-11-07  
**Status:** External-methods comparator and prospective measurement architecture. This is not a new P1 observation, trial, or scope change.

## Executive finding

The current ConsistencyBench P1 archive contains 17 target-model labels but one shared GPT-4o-mini NLI evaluator. That is one evaluator channel applied to many target outputs, not a 17-judge panel. It establishes a shared measurement instrument in the data-generation pipeline; it does not provide multiple judge-error streams from which inter-judge error covariance can be estimated.

Two recent external studies illuminate different missing estimands:

1. **Same-family judge leniency:** Selvam and Ghosh's *Eval-Pair Matrix* uses a crossed generator-by-judge design and compares judges on the exact same candidate answer. The answer-paired contrast controls answer composition when estimating a matching-family judge effect.
2. **Inter-judge error dependence:** Hossain, Yousefi, and Lim's *Agreement Overstates Evidence* evaluates multiple judges on common items against trusted labels and estimates correlations between their errors.

These are different questions and require different data. A common judge identity is not itself an estimate of correlated judge errors. Conversely, a multi-judge panel is not automatically a peer-interaction experiment.

## Source audit

### A. Selvam and Ghosh (2026), arXiv:2607.10626

*Eval-Pair Matrix: Answer-Paired Meta-Evaluation of LLM Judges for Grounded RAG*, first posted 2026-07-12.

Source depth in this run: arXiv abstract, SciSpace bibliographic record, and structured extraction of methods, results, limitations, dataset, and future research. The full PDF was not independently retrieved in this run. The author site lists acceptance to the GroundLM Workshop at EMNLP 2026; this note relies on the arXiv record and structured extraction, not a proceedings version.

The study reports a 3 x 3 generator/judge matrix using GPT, Grok, and Gemini: 300 core records, 897 generator outputs, and 2,683 judge verdicts; the primary analysis uses 275 validated records. It estimates the same-model judge effect by comparing matching and nonmatching judges on the exact same answer rather than comparing diagonal and off-diagonal cells containing different answers.

Reported results: the answer-paired same-model recall effect is -0.5 percentage points (95% cluster-bootstrap interval [-2.7, +1.7]). The remaining robust paired difference is lower matching-judge flagging (-4.3 points) for answers that avoided the induced claim.

Important limitations: one exact endpoint per provider; single-shot judge calls; behavior/adoption labels produced by one GPT-5.4 label evaluator; targeted human review was diagnostic and single-adjudicator rather than a double-annotated population estimate. The result is task- and instrument-specific. It is not a general proof of evaluator independence.

### B. Hossain, Yousefi, and Lim (2026), arXiv:2609.22512

*Agreement Overstates Evidence: Error Dependence in LLM Judge Consensus*, first posted 2026-09-18.

The author-maintained project page and public code repository were inspected. The primary ten-judge open-weight bank reports mean pairwise error correlation about 0.206 and effective panel size about 3.51. The author page also reports a 0.56 error correlation for a six-model frontier bank and up to 28% of resampled panel comparisons changing significance verdict when item-level dependence is respected.

The study uses common items, trusted reference labels, and multiple judge channels. Its calibration set contains 1,195 stratified RewardBench pairs, with 1,133 answered by all ten judges. The project reports 73 alternative bank compositions and a 1-10% label-noise sensitivity sweep.

Limits matter: controlled global and subgroup co-failure interventions identify possible dependence regimes but do not establish their natural prevalence. The authors report no universal best filter; several factuality/code transfer screens do not show a filter advantage. The work is an arXiv preprint under review, not a universal calibration constant. Its correlation and effective-size estimates must not be transferred to ConsistencyBench.

The public eliashossain001/Automatic-Jury-Consensus repository has no forks at inspection. Cached-vote analysis can run without GPU or API calls; new judge collection and some training stages require GPU resources or provider/API credentials. No code was imported, no new tooling was built, and no paid calls were made.

## Current P1 evidence boundary

The frozen P1 scope remains the public ConsistencyBench CGD archive:

- 17 target-model labels use the same hardcoded GPT-4o-mini NLI checker.
- Each target model is exposed to its own earlier answers within a question set; this is within-model self-history, not cross-model peer exposure.
- The checker receives answer text without the corresponding question/premise, short-circuits on the first contradiction, and the archive retains only a Boolean flag.
- The triggering answer pair and raw judge input/output are not retained.

The source-audited finite-corpus E1 comparison uses 14,450 eligible later-position records and reports 6,702 flags; key-relative PPV 46.1504%, sensitivity 51.8612%, and specificity 57.4711%. These are descriptive ratios against the published answer key, not semantic-validity estimates, population rates, or causal effects.

The 17 target-model labels are not 17 judge channels. The one shared checker is a structural common-measurement dependency. It may create common-method vulnerability, but the archive does not estimate covariance between independent judge errors. The existing VEY-031 distinction remains controlling: shared provenance is not, by itself, correlated statistical error.

## Estimand and identification matrix

| Estimand | Minimum identifying structure | Current P1 status |
|---|---|---|
| E1 (frozen): checker-flag / published-key relationship | Archived flag and key on the eligible finite corpus | DESCRIPTIVE FINITE-CORPUS RESULT |
| E2 (frozen): semantic validity of a checker flag | Exact triggering pair, full judge prompt/input/output, and blinded independent adjudication | NOT IDENTIFIED |
| E3 (frozen): causal revision efficacy or cross-model peer influence | Randomized self-history or recipient-level peer-exposure arm, prompt snapshots, pre/post answers, independent outcome scoring | NOT IDENTIFIED |
| E4 (frozen): independence across model systems | Source, family, prompt, retrieval, evaluator, and interaction dependency audit | NOT ESTABLISHED |
| E5 (frozen): covariance-aware effective sample size | Empirical covariance matrix plus the actual aggregation-weight vector | NOT AVAILABLE |
| E6 (proposed): same-family judge leniency | Crossed generator x judge matrix; each exact answer scored by matching and nonmatching judges | NOT ESTIMABLE |
| E7 (proposed): inter-judge error dependence | At least two distinct judge channels on the same items, independent reference labels, retained raw outputs and repeated calls where stochasticity matters | NOT ESTIMABLE |

### Prospective design, not authorized or administered

If a future study is separately authorized, preserve the following as distinct stages:

1. Freeze a source-defined answer set and generator identity/version/settings.
2. Cross multiple judge systems over the same exact answers; blind judges to generator identity and randomize presentation.
3. Estimate same-family leniency with within-answer paired contrasts, not unmatched diagonal/off-diagonal averages.
4. Separately estimate judge-error dependence by comparing multiple judges on the same items against independent reference labels; report the full error-correlation structure, not only its mean.
5. Use a stratified, independently double-adjudicated subset to audit label validity and disagreement categories.
6. Preserve raw prompts, candidate answers, judge inputs/outputs, model/provider versions, request IDs, retries, abstentions, and truncation.
7. Test self-history revision and cross-model peer influence in separate randomized exposure arms with recipient-level prompt snapshots.
8. Pre-register the unit of analysis, cluster/bootstrap unit, missingness and tie rules, smallest effect of interest, equivalence margin, and falsification thresholds before examining holdout results.

A null answer-paired effect would bound same-family leniency for the tested task and instrument; it would not establish universal judge neutrality. A low error correlation would bound dependence for the tested judge bank and task; it would not establish universal independence.

## Lean formalization

A new module, OrsonAnswerPairedJudgeContrast.lean, was added to the existing Orson P1 PR #850 branch. It formalizes an assistant-derived additive score abstraction:

- pairing on the same answer cancels a common additive answer component;
- an unpaired contrast decomposes into judge effect plus answer-composition difference;
- under that abstraction, the unpaired contrast equals the judge effect alone if and only if the two answer-population means are equal;
- one judge channel yields zero distinct judge pairs; two yield one.

This is not a verbatim equation from either paper. It is a conditional algebraic bridge explaining the identification role of answer-pairing and the combinatorial limit of a singleton judge channel. The module is on existing PR #850 head 75aea2e1711710d740ea0e4b9fbbb89e35024b84; Actions run #42327251357 was still in progress when this artifact was prepared, so no compile success is claimed here. Lean checks only the formalized algebra and counting statements; it does not validate the source translation, empirical data, judge behavior, semantic labels, or causal premises.

## Disposition and non-claims

- P1 remains frozen to methods/archival scope. November 9 remains NOT READY.
- The original OV-49-OV-53 answer-keyed bank remains NOT RECOVERED; no authorized inference endpoint is available.
- No new model trial, human session, API spend, manuscript completion, PDF/reader certification, independent-review sign-off, or paper-gate advancement occurred.
- P2 November 30 and P3 December 14 remain separate gates.
- No P1 protocol freeze, BEDROCK theory, scheduler, task ID, cadence, branch ownership, or paper scope was changed.

## References

- Selvam, S. and Ghosh, A. (2026). *Eval-Pair Matrix: Answer-Paired Meta-Evaluation of LLM Judges for Grounded RAG*. arXiv:2607.10626.
- Hossain, E., Yousefi, N., and Lim, S.-N. (2026). *Agreement Overstates Evidence: Error Dependence in LLM Judge Consensus*. arXiv:2609.22512.
- ConsistencyBench public evaluator source: src/evaluate.py, Git blob 0453540cb7c19227601e59fb342fa93e736da849.
- HsH P1 protocol freeze: WORKSPACES/ORSON_VAY/P1_PROTOCOL_FREEZE_2026-11-02_METHODS_ARCHIVAL_SCOPE.md.
