# Review-MIND h917:s4 | Evidence ancestry versus error dependence

**Run:** `REVROT3-19-20261011:917:s4`  
**Selected ring label:** Nadir Voss (index 10)  
**Next ring label:** Enheduanna (index 11)  
**Status:** Literature synthesis + exact numerical check completed; finite Lean countermodel PR opened, corrected after first CI failure, exact-head CI pending. No empirical model experiment or human study.

## New methodological result

**Source ancestry and statistical error dependence are separate axes, not one independence flag.** Source-root provenance can establish whether reports descend from the same evidence. It cannot by itself establish whether their extraction or judgment errors are independent. Conversely, repeated extraction from a shared source can have independent extraction noise while remaining non-independent *evidence roots*.

Use an audit vector, not a binary label:

1. **Evidence genealogy:** authenticated primitive roots, parent claims/messages, copying, paraphrase, relay and transformations.
2. **System lineage:** model weights/family, prompt, retrieval corpus, memory, tools, evaluator and fine-tuning dependencies.
3. **Exposure:** which agent saw which report/claim, timing, order, and whether exposure was randomized or controlled.
4. **Outcome dependence:** gold-labeled repeated trials; error covariance/correlation, uncertainty, and task/domain/condition dependence.
5. **Marginal information:** conditional information or calibration gain attributable to an additional report, when estimable.

Record `unknown` rather than infer independence from distinct agent IDs, provider names, source labels, report text, or agreement. Provenance is a side channel, not a complete dependence model.

## Source review

### Epistemic Sybil Resistance (arXiv:2609.01873)

The authors report more than 20,000 controlled LLM report/extraction calls on synthetic evidentiary documents. At one fixed evidence root, increasing reports from 1 to 32 reduces naive 95% posterior coverage from 0.940 to 0.263. Holding report count fixed while increasing root count from 1 to 16 closes the gap. Out-of-sample extraction-error correlation is reported as `gamma_cal=0.719`. A report-space dedup mechanism responds strongly to a representation manipulation (mean inferred cluster-count change 1.425) but weakly to a fourfold ancestry change (0.040). The report-only theorem shows identical report profiles can arise from clone ancestry or independent corroboration and require different posteriors.

**Limit:** synthetic evidence worlds and controlled LLM extraction. The study does not establish a universal source-lineage detector, nor that every repeated report is useless. Repeated extraction can add information toward a source-level ceiling; correlated extraction noise lowers that ceiling.

Official code/data: https://github.com/marcbara/epistemic-sybil-resistance. README states frozen-output reproduction requires Python 3.11+ and no API credentials; optional live collection uses Anthropic Haiku 4.5. The reported Phase 0/calibration/Grid A-B collection cost was about $18.6 against $10 and $25 caps; the separate 2x2 cost was not checked. The public benchmark has 3,300 instances and an honor-system public-truth split, so it is a useful free sandbox, not a sealed validation set. Repo was inspected, but no checkout/data reproduction was run.

### Agreement Overstates Evidence (arXiv:2609.22512)

On 1,133 RewardBench pairs, a ten-judge bank has mean error correlation 0.206 and reported variance-effective size 3.51. The rounded-value calculation is `10/(1+9*0.206)=3.5039`, consistent with the paper's 3.51 given unrounded correlation. The same bank's reported effective size varies by dataset: 3.36 on UltraFeedback and 2.89 on PKU-SafeRLHF. Three high-accuracy frontier judges across providers have mean error correlation 0.56 and effective size 1.41 on the matched RewardBench set.

A dependence-pattern counterexample is more important than the scalar: controlled weak-dependence, global-co-failure, and vulnerable-subgroup regimes have mean correlations/effective sizes `(0.223,3.32)`, `(0.318,2.59)`, and `(0.133,4.55)`. Yet naive matched-retention precision is 0.956, 0.722, and 0.824, respectively. The vulnerable-subgroup regime has *lower* mean correlation and *higher* effective size than global co-failure, but worse precision than weak dependence. Error concentration and cluster structure matter; mean correlation or `n_eff` alone does not predict majority reliability.

The paper estimates a Ledoit-Wolf-shrunk error-correlation matrix on a calibration set, and explicitly says `n_eff` is a variance summary, not a majority-accuracy prediction. It is a preprint and its controlled failure regimes do not establish their deployment prevalence.

### Behavioral dependence (arXiv:2604.07650)

SciSpace surfaced a supporting study of 18 models from six families. It reports behavioral-dependence indices associated with over-endorsement bias on disjoint MMLU-Pro/MATH-500 evaluation. This is a supplementary dependence measure, not evidence of causal mechanism or source ancestry. No code/data replication was located in this pass.

### Exposure is separate

A controlled single-message study, *When Upstream Messages Override Correct Answers* (arXiv:2609.36855), reports harmful correct-to-wrong changes in up to 32% of cases and 94% answer substitution in the audited harmful subset. It holds evidence/task fixed while manipulating the message. This is evidence about exposure-conditioned revision, not long-horizon debate, internal motive, or human group behavior.

## Exact arithmetic and finite countermodels

One-off Python 3.13.5 / standard-library script, actually run:

- Ten judges, `rho=0.206`: design effect 2.854, `n_eff=3.5039`.
- Ten judges, UltraFeedback `rho=0.219`: 2.971, `3.3659`.
- Ten judges, PKU `rho=0.273`: 3.457, `2.8927`.
- Three frontier judges, `rho=0.56`: 2.120, `1.4151`.
- Six frontier judges, PKU `rho=0.41`: 3.050, `1.9672`.
- Controlled regimes: weak `rho=.223` -> 3.3256; global `.318` -> 2.5893; vulnerable subgroup `.133` -> 4.5517.

The script also enumerates two exact toy countermodels:

- **A:** disjoint roots `{A}` and `{B}`, but a shared latent error bit gives `P(EA)=P(EB)=1/2`, `P(EA∩EB)=1/2`, covariance `1/4`, correlation 1. Root disjointness does not imply error independence.
- **B:** one shared root `{C}`, but independent extraction-noise bits give `P(EC)=P(ED)=1/2`, joint `1/4`, covariance 0. Shared root ancestry does not force extraction-noise dependence. It still does not create independent evidence roots.

These are mathematical examples, not simulated or observed subjects/models. Code: [`CODE/independence_axes_numeric_check.py`](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/NADIR_VOSS/CODE/independence_axes_numeric_check.py) (SHA-256 `322f8273eabc44e9708a24debf92e84da033d3f907aca377c05c8892ef155e86`).

## Formalization

Existing source-overlap formalization `CognitionSourceOverlap.lean` (draft PR #262, base infrastructure branch) proves relabel-invariance and a non-injective-ID collision counterexample; its docstring explicitly excludes statistical independence. Exact-head CI run #43948452979 succeeded, but this branch is 20,633 commits behind current main and is not integrated.

New draft PR **#1959** adds `SourceRootsVsErrorDependence.lean`, a finite Bool uniform-sample-space countermodel. It formalizes disjoint source roots and identical error functions, then proves the joint-error probability is not the product of marginals; concrete `#eval` values are expected to be `1/2, 1/2, 1/2, 1/4`.

Initial exact-head CI failed because the source-overlap predicate was not opened into namespace scope. Corrected at head `c4f9d8b3595ae28c31ce3bf01549d6e6da18d0e7`. Lean verification run #44248258491 is QUEUED/PENDING at this report version. No local Lean/Lake/Elan runtime. A successful CI build would verify only this finite formalized statement, not translation fidelity or actual model dependence. No main integration, merge, theory promotion, or Orson P1 change.

## Proposed disconfirmable evaluation

A bounded next experiment is a factorial LLM-only benchmark with source-root multiplicity, system-lineage diversity, and peer-message visibility randomized independently, using repeated gold-labeled tasks. Log root and parent-message IDs, model/config hashes, retrieval/memory/tool lineage, exposure order, solo and post-message answers, confidence, and verified information uptake. Estimate the full task-conditional error matrix with uncertainty; stratify global co-failure versus subgroup concentration rather than relying on one average `rho`. Measure correction, correct-to-wrong, wrong-to-wrong, calibration, consensus accuracy, and marginal information separately. Pre-register model/task seeds, holdouts and a practical-effect threshold. Human-agent studies require consent and privacy safeguards.

Falsifiers: root multiplicity does not change conditional evidence gain; system lineage has no predictive relation to error covariance after task controls; peer exposure has no effect under matched controls; or dependence-aware metrics fail to improve held-out calibration/decision quality over simple baselines.

## Controls and status

- Review-MIND lane, not Orson's P1 ownership. Orson's primary cognition paper and ~4/5 genuine cognition activations remain protected.
- P0 Code Grurple remains ACTIVE; P1 Orson cognition overdue/not-ready; P2 HOLD; P3 INCOMPLETE. Nov 30 and Dec 14 gates remain separate.
- FIE last reviewed Nov 10; next due Nov 24, not due.
- No human experiment, live model/API call, raw-data reanalysis, physical calculation, fit, prediction, or independent measurement.
- Mersearch not callable; SciSpace search and GitHub source fallback used. No new tooling, dependencies, subscription or API cost. Existing Math Hopper extraction script, Whirligig work, Lean PRs and HsH forks were checked first; Whirligig is unrelated to this cognition question and HsH reports zero forks.
- HSH_RESOURCES private payload not accessed; repository README only. SAT archive public root/readme and current break source accessed.
- No task graph, branch main, automation, ID, cadence, phase or prompt change.

## Source links

- https://arxiv.org/abs/2609.01873
- https://github.com/marcbara/epistemic-sybil-resistance
- https://arxiv.org/abs/2609.22512
- https://arxiv.org/abs/2604.07650
- https://arxiv.org/abs/2609.36855
- https://github.com/Satobloc/HsH/pull/262
- https://github.com/Satobloc/HsH/pull/1947
- https://github.com/Satobloc/HsH/pull/1959
