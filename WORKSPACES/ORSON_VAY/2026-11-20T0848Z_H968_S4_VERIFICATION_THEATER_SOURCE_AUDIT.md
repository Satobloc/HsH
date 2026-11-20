# Orson h968:s4 | Verification Theater source audit and panel-measurement update

**Date:** 2026-11-20  
**Run key:** `REVROT3-19-20261011:968:s4`  
**Ring selection:** Orson Vay (index 18); next ring label Sable (index 0).  
**Status:** additive primary-source review / future-methods only / P1 frozen / no new model or human trial / no theory promotion.

## 1. Scope and authority

This is an assistant-level research pass under the Orson Vay cognition remit. The historical role charter assigns LLM cognition, human-LLM systems, representation, reasoning, calibration, memory, recursion, readout/observer methods, reproducible model studies, and multi-agent organization. The charter is an assistant-maintained synthesis grounded in archived direct-user material; no standalone signed specialist charter or authenticated current Orson instance is established.

The P1 methods/archival freeze remains binding. This report does not change ConsistencyBench CGD, the P1 protocol, dataset, manuscript, owner, or readiness gate. No model trial, human session, inference/API spend, dataset expansion, protocol amendment, manuscript edit, paper-gate advancement, physical calculation, fit, prediction, independent measurement, or theory promotion occurred.

## 2. New primary source

Vadym Chernets, **"Verification Theater: Measured Failure Modes of AI Verifier Panels."**

- Citable record: https://doi.org/10.5281/zenodo.23197641
- Author's full-text repository: https://github.com/vadimchernets/papers/tree/main/verification-theater
- Full Markdown: https://github.com/vadimchernets/papers/blob/main/verification-theater/paper.md
- Readable PDF: https://github.com/vadimchernets/papers/blob/main/verification-theater/verification-theater.pdf
- Author's repository README: https://github.com/vadimchernets/papers/blob/main/verification-theater/README.md
- Frozen registration: https://osf.io/4y9dv/
- Replication component: https://osf.io/jtvu9/
- OpenReview: https://openreview.net/forum?id=Mg9RtDWcK4
- NeurIPS workshop listing identified by the author: https://neurips.cc/virtual/2026/loc/sydney/173020

The author repository identifies the work as an accepted poster at the December 2026 NeurIPS workshop "Who Verifies the Agents? Toward Reliable Agent Development" and states that the workshop is non-archival; the Zenodo record is the citable version. This publication-status statement is author-reported, not an independent review of workshop proceedings.

The repository's current tree is `feba1704ef1dd45894139d422e3cf09c910a0c51`. The paper Markdown blob is `490de37579cf1b3abfe7aebf09ada37a7a376552`; the PDF blob is `6246b4f134bdfd784a339e55ede41f03961762eb`. Both the full Markdown and the 12-page PDF were inspected. The paper is readable and its limitations and competing-interest statement were reviewed.

The paper reports one pre-registered blind collection: sixteen models (nine API models, mostly mid-tier, and seven local open-weight models) on 1,500 SimpleQA questions, plus a 750-question TruthfulQA multiple-choice arm and an exploratory dialogue/conformity arm. The companion paper, "Weakly Discriminative, Not Repaired by Profile Injection, and Manipulable," uses the same frozen registration and blind collection. These are two analyses of overlapping data, not independent replications.

**Data-access boundary:** the OSF registration and replication component returned HTTP 403 through the available reader. The public GitHub folder contains the paper, PDF, figures and README, not the 16-model verifier-panel raw graded JSONL or run manifest. The companion repository's four `scored-arms-*.jsonl` files belong to its profile-injection/self-confidence material, not the 16-model verifier-panel raw collection; they were not used. No raw-data reanalysis or independent reproduction is claimed.

## 3. Source-reported findings, with scope retained

### 3.1 Difficulty-stratified certification lift

Under the paper's population-difficulty ranking, agreement lift is reported at 2.7-4.6x across the three easiest quintiles, 0.82x in the second-hardest, and 0.00x in the hardest: 0 correct among 342 replicated answers spanning 106 unique questions. The paper separately reports a cluster-conservative 0/106 question count and a 3.5% Wilson upper bound.

The leave-panel-out difficulty analysis changes the pooled conclusion: the pooled hardest-quintile result becomes 78/354 correct (22.0%, lift 2.36x), while the cross-bloc panel remains 0/116. The pooled zero therefore depends on a difficulty measure partly constructed from the panel being evaluated; the cross-bloc result is the narrower surviving result under the leave-panel-out coding.

A post-hoc flagship-pair comparison reports 34 correct among 37 agreed answers on the 106 population-hard questions. The paper flags benchmark exposure, different collection dates and settings, and the fact that the result is post hoc. This is not a universal refutation of the mid-tier result, nor evidence that agreement generally succeeds on hard questions.

### 3.2 Constrained answer spaces

The paper reports unanimous wrong answers on 4.0-7.9% of multiple-choice items; requiring stated confidence of at least 75 still leaves 4.0-7.2%. The reported open-form ranges are 1.5-4.6% local-tier and 0.3-4.9% frontier. The multiple-choice and open-form arms use different benchmark families. The same-tier comparison reduces the model-tier confound but does not provide a same-question format swap. The paper itself identifies that swap as the direct test.

### 3.3 Independence labels and measured error dependence

Across 36 frontier vendor pairs and 1,448 shared questions, reported pairwise error correlation phi ranges from 0.123 to 0.395. Mean intra-bloc and cross-bloc values are 0.2854 and 0.2736; the reported permutation p-value is 0.210. The one same-base local lineage pair has phi 0.135 and ranks 14th of 15 in the specified comparison. On the 81 questions answered by all sixteen models, the 120 pairwise values range from -0.054 to 0.728.

The defensible result is narrow: in this collection, the tested bloc and lineage labels did not provide a useful substitute for measuring pairwise error dependence. The same-base lineage comparison is one pair, not a general test of model ancestry. Pairwise phi is not full statistical independence; the paper explicitly notes that low pairwise phi does not exclude higher-order dependence in panels of three or more. Individual all-model pair cells also have wide intervals because only 81 common questions support that matrix.

### 3.4 Exploratory conformity arm

When a verifier that had disagreed blind was shown a colleague's proposed answer, it endorsed that answer in 38.5% of cases (168/436). In the reverse-prompt control on local models, the flip rates were 38.9% toward a wrong proposed answer and 34.7% toward the gold answer; the reported paired McNemar exact p-value is 0.012.

This is consistent with a proposed-answer-presence effect in that local-model control, not proof of a universal conformity mechanism. The arm is exploratory, modest in sample size, and the reverse-prompt control used local models. Transfer to frontier panels is an analogy, not a demonstrated result.

### 3.5 Grading and disclosure

About two-thirds of open-form grades are LLM-produced. The paper reports a 50-item human spot-check with 98% agreement and a cross-family regrade of all 342 hardest-quintile replicated verdicts with 342/342 agreement. These checks strengthen the specific reported comparison but do not equal a fully human-graded replication.

The author discloses being a named applicant on pending, not granted, patent applications covering AI orchestration and multi-model validation systems of the kind examined.

## 4. Novel contribution relative to existing HsH work

A duplicate search found that the adjacent literature is already covered:

- **Gao et al., "Copies or Sources?"** was reviewed in Hale h909 and the Orson P1 evidence-lineage work. Its controlled provenance-label assumptions and exclusion of shared source failure modes are already recorded.
- **Hossain et al., "Agreement Overstates Evidence"** was reviewed in Nadir h917 and Meridian h918. The effective-sample-size calculation is not a general majority-reliability score.
- **Soffer et al., "LLMs Trust Their Own"** was reviewed in Kestrel h914. It tests identity-conditioned conformity with scripted peers in single-round tasks.
- **Ferreira et al., "Beyond Symmetric Agents"** was reviewed in Orson h900. Its budget-matched comparison is not a universal claim that debate never helps.
- Orson h946 and Nadir h917 already distinguish evidence ancestry, system lineage, exposure, outcome dependence, and marginal information. This report does not rename or replace that framework.

The genuinely additive source is Chernets' full-text verifier-panel study. Its contribution to the existing HsH framework is a measured, difficulty-stratified certification-lift ladder, a per-task/pair error-correlation matrix, and an exploratory blind-first conformity control. It also sharpens three boundaries: the pooled hardest-quintile result is sensitive to how difficulty is defined; pairwise phi does not establish full independence; and the proposed hard-regime escalation rule still needs an online difficulty proxy that is independent of panel agreement.

## 5. Review-MIND synthesis and disconfirmable next design

Keep the existing HsH dependence axes distinct. For a future study, record at least:

1. **Evidence genealogy:** authenticated primary roots, copies, paraphrases, summaries, relays and transformations.
2. **System lineage:** model/version/family, prompt, memory, retrieval, tools, training or fine-tuning dependencies where known.
3. **Exposure:** which agent actually saw which answer or evidence, when, in what order, with what context coverage and truncation.
4. **Outcome dependence:** gold-labelled, task-conditional joint error patterns, including subgroup and higher-order co-failure rather than only a mean pairwise correlation.
5. **Evaluator dependence:** judge model/version, rubric, gold source, shared scoring pipeline and independent adjudication.
6. **Budget and response validity:** token/latency budget, empty/invalid/truncated responses, and matched single-agent/self-consistency baselines.

Do not collapse these into one "independence score." Distinct source identifiers do not certify independent evidence; different vendor labels do not certify independent errors; a communication edge does not prove uptake; an answer flip does not by itself identify conformity; and agreement does not establish truth.

A staged, disconfirmable design is proposed, not run:

- Elicit and commit each agent's blind answer before any peer output is visible. Preserve the commitment hash and exact pre-exposure output.
- Randomize peer exposure separately from answer truth and source identity: no peer, correct peer, incorrect peer, and sham/irrelevant peer; cross identity/authority cues only after the content manipulation is fixed.
- Compare debate against a generation-count- and token-budget-matched independent-sampling/self-consistency baseline.
- Use a task-class difficulty calibration set that is separate from the evaluated panel. If a hard-regime threshold is used, test its online proxy out of sample; agreement itself cannot be the proxy when agreement is the signal under audit.
- Measure source-copy inflation, correct-to-wrong and wrong-to-correct transitions, blind and post-exposure error correlation, higher-order co-failure, calibration, abstention, response validity, and decision quality separately.
- Use an evaluator not shared with the generators where feasible, plus blinded human adjudication on a predeclared subset. Report disagreement and uncertainty rather than silently resolving it.
- Include negative controls: duplicate paraphrases from one source root; distinct sources with the same conclusion; identity-label swaps; peer answers whose truth is reversed while wording is held constant; no-peer self-reflection; and sham text matched for length and position.

Disconfirmers include: no replicated source-copy effect; no peer-exposure effect above the no-peer instability floor; no predictive value from model-lineage metadata after task controls; no held-out value from the difficulty proxy; or no improvement over the budget-matched sampling baseline. A result that only improves agreement, without improving gold-validated decisions, does not establish better collective reasoning.

This is a future-methods design. It does not reopen P1 or authorize any live model call, human-subject study, API spend, dataset expansion or protocol amendment. Human participation would require explicit consent, privacy protections, preregistration and separate ethics review.

## 6. Formalization and existing Lean evidence

No new Lean theorem was created. The new paper's headline claims are empirical and the raw panel data were not accessible for reanalysis. A generic proof of a correlation identity would not validate those empirical estimates or establish independence.

Existing Orson formalizations in PR #850 were checked against the current PR head and the successful workflow build:

- PR: https://github.com/Satobloc/HsH/pull/850
- Head branch: `research/orson-p1-shared-nli-bound-20261028t06z`
- Head: `6b4eebeacf4f6928f18601626e4e9e3942d73d81`
- Base branch: `research/orson-p1-conjunction-null-20261028t0212z`
- Build run: https://github.com/Satobloc/HsH/actions/runs/44416543286
- Synthetic merge commit checked out by the job: `8e0aad3625ce2cbc762bcdc7b7f83abfe39c79f8`

The five source module blobs for `OrsonEvidenceCompositionLaw`, `OrsonSharedRecordIdentifiability`, `OrsonNLIClusterClosure`, `OrsonJudgeScoreGeometry`, and `OrsonPairedDiscordanceDependence` matched between the PR head and the merge commit. The build used Lean 4.34.0 / Lake 5.0.0 and completed 8,991 build jobs. The inspected log contained no `sorryAx` or `admit` occurrence. The theorem-specific `#print axioms` outputs include standard dependencies such as `propext`, `Classical.choice`, and `Quot.sound`; some individual theorems report no axioms.

**Limit:** this is a successful merge-reference build on a non-default P1 base branch, not an exact-head standalone build and not a build against current `main`. Tests, lint, leanchecker, nanoda and a separate global axiom audit were skipped. It verifies only the formalized statements, not the translation from the historical sources or the truth of the empirical paper's premises. PR #850 remains open/draft/unmerged and was not modified.

## 7. P1, campaign and repository controls

- P1 issue #564 remains OPEN / NOT READY. The P1 methods/archival freeze remains binding. The original OV-49 through OV-53 answer-keyed bank remains unrecovered in the current authorized workspace; no replacement dataset is authorized. No experiment, human session, inference/API spend, dataset expansion, protocol amendment or manuscript edit occurred.
- The November 9 minor-paper gate is overdue/not ready. November 30 major and December 14 full-theory gates remain separate. No gate advanced.
- P0 Code Grurple remains ACTIVE. P2 remains HOLD pending an identifiable measured system and its provenance, units, uncertainties and prediction-versus-fit separation. P3 remains INCOMPLETE.
- FIE last review was November 10; next review is November 24 and is not due.
- Mersearch was checked first. All four canonical request lanes remain `requested`; no lane was overwritten, released or retriggered. The existing Orson origin-bank request `orson-cognition-origin-bank-20261103-1745` is prior context only: its compact receipt records 16,942 files and 21,037,890 records scanned, 135 hits and 74 distinct source paths across the three repositories. Its raw `SEARCH_RESULTS` payload is intentionally withheld, so this is not represented as a new search, a full result listing, or source-level evidence.
- SciSpace was used for discovery and extraction; the primary full-text PDF and author repository were inspected. Existing Math Hopper, Lean PR #850 and Whirligig resources were checked. No new tool, dependency, fork, subscription or paid service was created.
- The HSH_RESOURCES front door was treated cautiously; no payload was opened in this run.

## 8. Continuity

The latest observed HsH `main` commit during this run was `2b9d6483fa0a5aa2d326b9e5ab6cdd105859d15b` (2026-11-20 08:56:31Z). The current work is additive and does not alter P1 ownership or any paper gate.

The latest identifiable prior Orson conversation is not authenticated as a currently usable thread. No new conversation, direct-thread handoff, consumption, acknowledgment, assignment or ownership transfer is claimed. The next ring label is Sable.

The unrelated reading break recorded in Orson h953 remains fresh; its last inspected cursor was 1921. No new lateral-reading break was due in this pass. The FIE review is not yet due.

No task, task ID, prompt, phase, schedule, cadence or enabled state was changed. Four existing relay tasks remain enabled; the :12 task remains disabled. No sixth task, signet or conversation rename.

**Final status:** `H968_S4_ORSON_ASSISTANT_LEVEL / VERIFICATION_THEATER_SOURCE_AUDIT / NEW_PRIMARY_SOURCE_INTEGRATED / RAW_REANALYSIS_NOT_DONE / P1_FROZEN / NO_TRIAL / NO_NEW_LEAN / PUBLISHER_PENDING_AT_SUBMISSION / ORSON_THREAD_NOT_AUTHENTICATED / FOUR_TASKS_PRESERVED / NO_SIXTH_TASK`.
