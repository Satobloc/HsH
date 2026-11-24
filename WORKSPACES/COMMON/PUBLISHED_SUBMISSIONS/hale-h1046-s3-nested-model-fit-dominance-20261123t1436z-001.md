# Hale h1046:s3 | Nested-model training-fit dominance and prediction gate

**Nominal slot:** 2026-11-23T14:36:00Z  
**Run key:** `REVROT3-19-20261011:1046:s3`  
**Selection:** h=1046; seq=5h+3=5233; 5233 mod 19=8, Hale.  
**Next ring label:** Elias Kern, index 9.  
**Disposition:** `MODEL_SELECTION_WORKFLOW_EXTENSION / PR_OPEN / LEAN_PENDING / NO_PHYSICAL_TEST / P2_HOLD`.

## 1. Identity, role, and authority

Hale is a deterministic routing label, not an authenticated current ChatGPT instance or thread. The active :36 automation run has `chat_ref=null`; no historical Hale conversation was recovered or delivered into.

The historical specialist remit is reconstructed from Hale's 2026-09-12 check-in and Sable's REV-006 reentry packet: external-literature landscape scanning, matched-period comparisons, statistical analysis, calibration, controls, uncertainty, and evidence provenance. These are a historical worker self-report and an assistant-maintained reconstruction, not a separately signed Nathan-authored charter. Hale was externally exposed by design and is not a blind theory reviewer.

The current user-supplied Lane Charter 36 governs this run.

## 2. Preflight and source boundary

Read the live BEDROCK, 2026-10-26 Steering Charter, Three Paper Campaign, three-repository onboarding, current workflow orientation, revival rotation, thread-first rule, duplicate-run-key guard, current branch, current receipts, Hale continuity/BOOT/inbox, Hale's historical reentry packet, and the preceding Hale :36 report.

Preflight source pins at start:
- BEDROCK: `2629ab29a5838d933c31727455553d206577a258`
- Steering Charter: `9e6a3615f3b83e0ab8a6c530dc2613d3d4693d89`
- Three Paper Campaign: `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`
- Three-repository onboarding: `fe40260cda5ce360909f2adfd64a3cc3e2c92a05`
- Hale reentry packet: `2840500bec1873fc634e564f83d7eda7d1da74f0`
- Hale continuity: `da76bd0145e55dc30545591ebb29d076fc2c00e2`
- HsH main at preflight: `c3b18d864191d644e9dcdb54547c17cd902a356a`

Mersearch was not callable in this runtime. The canonical request file is already occupied; no request lane was overwritten, released, or retriggered. A bounded GitHub search/fetch fallback was used across HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES with PRIOR_ART/QUARANTINE exclusions. This was not exhaustive Mersearch and does not establish complete archive coverage. No private HSH_RESOURCES file was opened or reproduced.

Existing Math Hopper #578 / PR #991, Lean infrastructure PR #262, Whirligig Kernel 0, current Lean PRs, and SciSpace availability were checked. All three repositories are on main; no local git checkout or Lean/Lake/Elan executable is available in this runtime. Existing GitHub Actions is therefore the actual Lean execution path. No new tool, dependency, fork, subscription, or expenditure was introduced.

## 3. The precise gap

The existing draft [PR #1487](https://github.com/Satobloc/HsH/pull/1487) already formalizes:
- a non-compensatory evidence gate for source, maps, measured data, units, uncertainty, matched comparator, nuisance-adjusted identifiability, frozen parameters, acquisition-unit integrity, holdout, and prediction/falsification protocol;
- a componentwise complexity footprint;
- set-level predictive equivalence, one-sided and two-sided predictive separation, and the effect of widening a prediction region after seeing a holdout.

It does not yet formalize the parameter-space consequence of a genuinely nested model.

This matters because a larger model class can include every baseline candidate while also admitting additional responses. If the expanded model preserves the baseline training score under an embedding, its best attained training fit cannot be worse. A lower calibration/training residual is therefore not, by itself, evidence that H(s)H has added predictive content.

## 4. New formal contract

Added `IsGlobalMinimumOn` and theorem `expandedModelBestTrainingLoss_le_baseline` to the existing `ModelSelectionPreference.lean` module.

The theorem assumes:
1. a baseline parameter domain and an expanded parameter domain;
2. an embedding from every admissible baseline parameter into the expanded model;
3. the embedding preserves the same training loss exactly;
4. an attained global minimizer exists in each domain.

It concludes:

[
L_1(\theta_1^*) \le L_0(\theta_0^*).
]

In words: the expanded model's best attained training loss cannot exceed the baseline's when the baseline is genuinely embedded with the same training objective.

The exact implementation is in [PR #2427](https://github.com/Satobloc/HsH/pull/2427), branch `research/hale-nested-model-fit-dominance-20261123t1436z`, head `2e2f250603a27e7bb09127a0f8fe15adbe75dc71`, module blob `7079a12a16d6036b9d92ac2a44355ab255fdfcb7`.

### Why this changes the comparison workflow

Before fitting, record the relation between the two admissible model classes at the same observation operator and domain:

| Relation | Interpretation | What can count as discrimination |
|---|---|---|
| Equal prediction sets | Observationally equivalent for this readout/domain | No discriminator in this channel |
| H(s)H predictions are a strict subset of standard predictions | H(s)H is more constrained | A standard-only outcome can falsify H(s)H; no H(s)H-only outcome exists in the set-membership sense |
| Standard predictions are a strict subset of H(s)H predictions | H(s)H is an extension | A lower training loss is non-diagnostic; require an H(s)H-only, predeclared holdout prediction |
| Overlap, neither subset | Non-nested alternatives | Predeclare a separating observable and compare on matched holdout data |
| Maps, domains, or embedding not defined | Unclassified | No model-class or physical-equivalence claim yet |

This table is a proposed pre-fit record, not a claim that the actual H(s)H/GR relation has been established. PR #1487 already contains the set-level prediction relations; PR #2427 adds the missing parameter-embedding/training-loss consequence.

## 5. What the theorem does not prove

- It does not establish that any actual H(s)H model embeds GR or another standard comparator.
- It does not prove that the model is overfitting; it proves only the monotonicity of attained training minima under the stated nesting and score-preservation assumptions.
- It does not establish that the minima exist, that an optimizer finds global minima, or that parameters are identifiable.
- It does not establish holdout performance, calibration, statistical independence, coverage, or a numerical falsification threshold.
- It does not prove a physical projection, worldtube thickness law, twist/normal connection, or contact law.

The embedding and score-preservation hypotheses must be checked against the same real training acquisitions, measurement mode, instrument/readout operator, shared parameters, nuisance budget, and scoring convention. If those differ, the theorem does not apply.

## 6. Statistical calibration from external literature

These are standard references used to calibrate the workflow, not H(s)H premises:

- Yates, Aandahl, Richards & Brook (2022), [Cross validation for model selection: a review with examples from ecology](https://scispace.com/papers/cross-validation-for-model-selection-a-review-with-examples-rz325euq?utm_source=chatgpt&utm_medium=tool), *Ecological Monographs*. The review emphasizes score choice, bias correction, uncertainty in model selection, and selection rules to mitigate overfitting.
- Veksler, Myers & Gluck (2015), [Model flexibility analysis](https://scispace.com/papers/model-flexibility-analysis-pgt2zwb13i?utm_source=chatgpt&utm_medium=tool), *Psychological Review*. The paper argues that the fraction of possible outcomes a model can fit may be more informative than parameter count alone; number of free parameters need not track flexibility.
- Schmidt, Emelko & Thompson (2020), [Recognizing structural nonidentifiability](https://scispace.com/papers/recognizing-structural-nonidentifiability-when-experiments-3ko6l68u60?utm_source=chatgpt&utm_medium=tool), *Risk Analysis*. The paper shows why good fit can coexist with weakly identified mechanistic parameters and misleading predictions.
- Lopez et al. (2025), [The importance of choosing a proper validation strategy in predictive models, Part 2](https://scispace.com/papers/the-importance-of-choosing-a-proper-validation-strategy-in-g414gu02yfny?utm_source=chatgpt&utm_medium=tool), *Analytica Chimica Acta*. The tutorial reviews leakage, biased selection, and validation failures that inflate apparent performance.

Consequent workflow rule: the componentwise complexity ledger remains useful but is not a complete measure of model flexibility. A future empirical comparison should separately document the breadth of the admissible predictive family and the rule used to score an untouched holdout. No flexibility statistic is calculated here.

## 7. P2 / geometry boundary

The P2 issue [#565](https://github.com/Satobloc/HsH/issues/565) remains HOLD. Its November 23 first-draft/hostile-review gate is NOT MET; November 30 remains a separate major-paper gate and December 14 remains the full-theory gate.

The current Ratz propeller dataset/source-readiness updates by Calder remain candidate-only. No measured system was selected for this run; no raw dataset was downloaded or analyzed; no units, acquisition IDs, covariance, fit, physical prediction, uncertainty propagation, or numerical falsification threshold was computed.

The current feature-status distinction is unchanged: finite-core thickness is source-committed within the finite-core construction, but its profile/embedding/readout remain uninstantiated; twist/normal connection is additional structure without a frozen law; a contact surface/law is not inferred from a tube boundary. This report does not alter that ledger.

No SAT-O or Blockwave equation was retrieved, rewritten, or changed. No BEDROCK, manuscript, or theory-status promotion was made.

## 8. Verification and return

PR #2427 is OPEN / DRAFT / UNMERGED and stacked on parent PR #1487. The parent PR's merge-reference build #44968816552 succeeded, but the new child theorem has its own run:

- [Actions run #45198038464](https://github.com/Satobloc/HsH/actions/runs/45198038464)
- Head: `2e2f250603a27e7bb09127a0f8fe15adbe75dc71`
- At the report snapshot: IN_PROGRESS during Lake dependency-manifest generation; Lean compilation had not started.

No successful compilation, theorem-specific axiom output, exact-head-only certification, independent review, or merge is claimed. The next action is to inspect this same run, not dispatch a duplicate.

FIE last full review: November 20; next due December 4. Unrelated-reading break: November 21; no repeat was due.

**Next ring label:** Elias Kern, h1046:s4. His standing switchboard-prototype remit is not a model-selection assignment. No task or ownership transfer is requested.
