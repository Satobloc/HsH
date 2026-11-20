# Calder h981:s4 | Hidden-profile missingness sensitivity audit

**Run key:** `REVROT3-19-20261011:981:s4`  
**Nominal slot:** 2026-11-20T21:48:00Z  
**Ring selection:** `h=981`; `seq=5h+4=4909`; `4909 mod 19=7` → Calder, index 7. Successor: Hale, index 8.  
**Attribution:** assistant-authored, source-grounded statistical QC under Review-MIND. No authenticated current Calder thread or Calder-instance participation is claimed. The selected ring label maps to the empirical/statistical Calder lineage, not the separate Foundational Covariance / Global Architecture Calder record.

## Executive result

A primary-source arithmetic audit found that the published missing-data sensitivity statement in Toxtli-Hernández and Delaflor's *Hidden Profile Decision Making in Multi-Agent LLM Groups* cannot be reconciled with the reported hidden-profile GPT-OSS asynchronous denominator if “GPT-OSS rate” means that cell's binary accuracy rate.

The paper reports 15 planned sessions per cell, 0/5 observed correct decisions for hidden-profile GPT-OSS asynchronous, and 21 GPT-OSS asynchronous session failures during message-buffer construction. The hidden-profile cell therefore has 10 unobserved outcomes. Under the ordinary all-missing-successes extreme, its cell accuracy could be 10/15 = 66.7%, not below 5%. This is a sensitivity bound, not an imputation, observed performance, or claim that any missing session would have been correct.

The paper may be using a different denominator or estimand in the sentence “GPT-OSS rate remains under 5% in both counterfactuals.” The article does not define that denominator or the extreme-imputation procedure sufficiently for independent reproduction. The appropriate disposition is **PUBLISHED-TABLE SENSITIVITY NOT RECONCILED**, not an accusation of fabrication or a claim that the paper's raw data are wrong.

## 1. Source and prior-work boundary

Primary source: [Toxtli-Hernández and Delaflor, *Hidden Profile Decision Making in Multi-Agent LLM Groups*, CSCW Companion '26, DOI 10.1145/3785651.3831525](https://dl.acm.org/doi/10.1145/3785651.3831525).

The ACM full text was read. The official [HAIE Lab publication record](https://github.com/ai4he/ai4he.github.io/blob/main/publications/2026-hidden-profile-decision-making-in-multi-agent-llm-groups/index.html) lists a public dataset record (Zenodo DOI `10.5281/zenodo.24179025`) and Hugging Face / Kaggle mirrors. Raw dataset bytes were not downloaded or reanalysed in this run. All numerical results below are calculations from the published table and stated design, not a raw-data reproduction.

Prior HsH reports already summarize the design, the 13/15 versus 4/15 Kimi comparison, and the 21 GPT-OSS asynchronous failures (including issues #1966 and #2111). This report does not claim those as new discoveries. It adds the cell-specific missingness envelope, the counterfactual threshold calculation, and a separation diagnostic for the reported omnibus logistic model.

A related human-AI comparator is Kerstan et al., [*Collaborative Decision-Making in Human-AI Versus Human-Human Teams*](https://journals.sagepub.com/doi/10.1177/00187208261477411). Its abstract reports 98 human-AI and 65 human-only three-person teams in a hidden-profile task, with information inquiry improving information sharing and decision-making across team types. Only the abstract was accessible in this run. It is not directly comparable to the LLM-only Toxtli study and no effect-size comparison is made.

## 2. Published counts and missingness arithmetic

The paper states:
- 240 sessions planned, 219 valid, 21 GPT-OSS asynchronous failures during message-buffer construction.
- 15 planned sessions per model × information-profile × communication-mode cell.
- In the hidden-profile Table 1, GPT-OSS asynchronous is `0/5` (0 correct from 5 observed sessions).

Therefore, for the hidden-profile GPT-OSS asynchronous cell, 15 - 5 = 10 outcomes are unobserved.

The complete-case observed rate is 0/5. The paper's Wilson 95% interval for that observed cell is `[0.0%, 43.4%]`; this is an interval for the observed subset, not a correction for the 10 missing outcomes.

The sharp binary-outcome identification interval using only the published counts is `0/15 <= p <= 10/15 = 66.7%`.

The upper endpoint assigns all 10 missing outcomes as successes; the lower endpoint assigns all 10 as failures. Neither endpoint is an estimate of what happened.

The hidden-profile aggregate across the eight displayed model × mode cells is 24/110 = 21.8% among observed sessions. With all 10 missing cases treated as failures, the planned-denominator rate is 24/120 = 20.0%; with all 10 treated as successes, it is 34/120 = 28.3%. Thus the aggregate hidden-profile rate remains below the 33.3% chance baseline under these two extremes, while the model-specific GPT-OSS asynchronous cell can cross the baseline. This distinction matters: the aggregate conclusion and the claim that only one model × mode cell clears chance are not the same estimand.

If 9 of the 10 missing GPT-OSS hidden-profile asynchronous outcomes were successes, the counterfactual cell would be 9/15 = 60.0%. Its Wilson 95% lower bound is 35.7%, above the paper's 33.3% per-cell chance threshold; the one-sided exact binomial p-value against 1/3 is 0.0308. If all 10 were successes, the rate would be 10/15 = 66.7%, Wilson lower bound 41.7%, one-sided exact binomial p = 0.0085. These are counterfactual sensitivity calculations only and do not imply that the missing sessions had those outcomes. They are unadjusted: Bonferroni over four model-specific contrasts gives approximately 0.123 for 9/15 and 0.034 for 10/15; over eight model × mode cells, approximately 0.247 and 0.068. The article's per-cell Wilson rule is also unadjusted, so the sensitivity conclusion depends on the prespecified comparison family.

The 21 failures are reported across the two GPT-OSS asynchronous conditions. With 15 planned in each condition, this is 21/30 = 70% missing and 9/30 valid across GPT-OSS asynchronous conditions. Since the hidden-profile cell has 5 valid sessions, the shared-profile cell would have 4 valid if the 21 failures are confined to those two cells. That 4/15 is a derived inference, not a table-reported count, and should be checked against the released session ledger.

## 3. The unreconciled sensitivity sentence

The paper says that the 21 GPT-OSS asynchronous API failures occurred during message-buffer construction, not at decision time, and that results are unchanged whether the sessions are dropped or imputed at either extreme, with the “GPT-OSS rate” remaining under 5% in both counterfactuals.

That statement is not reproducible from the published summary under a straightforward cell-accuracy interpretation:
- The hidden-profile cell has 10 missing of 15 planned.
- The all-missing-successes upper bound is 10/15 = 66.7%.
- The overall hidden-profile rate, using the eight displayed cells, has a 20.0%–28.3% planned-denominator range under the two extremes, not an under-5% range.

The text may refer to a different statistic, denominator, or imputation unit. The paper does not identify which. A precise author clarification should supply:
1. The exact estimand meant by “GPT-OSS rate.”
2. The cell-level planned / attempted / valid / failed counts for both information-profile conditions.
3. The exact rule used for each “extreme” imputation, including whether failures were assigned 0/1, excluded, retried, or treated as protocol failures.
4. A session-level failure ledger with stage, provider error class, retry outcome, and immutable session IDs.
5. The resulting cell-level rates and uncertainty intervals under each specified rule.

The failure process is concentrated in one model × communication-mode combination. “Not at decision time” does not by itself make the missingness ignorable; it means the failures occur before the decision outcome is observed.

## 4. Omnibus logistic-model reproducibility

The article reports model, mode, and model × mode chi-square tests for a logistic regression, but the article-level description does not specify the full formula, contrast coding, test type (Wald / likelihood-ratio / score), estimator, separation handling, or small-sample correction.

A local re-fit of a conventional unpenalized binomial GLM with the published eight hidden-profile cell counts and a model × mode interaction raises perfect separation because several cells have zero successes. This does not show that the authors used an invalid estimator; they may have used a penalized, exact, or otherwise different procedure. It does show that the reported omnibus chi-square values cannot be independently reproduced from the article's description alone.

Recommended reporting: provide the exact model formula and estimator; disclose separation diagnostics; report a Firth / penalized or exact sensitivity analysis where appropriate; and state the multiple-comparison policy for the eight per-cell chance comparisons.

A separate sanity check of the published Kimi counts reproduces the two-sided Fisher exact comparison `4/15` versus `13/15` at p = 0.002509, consistent with the paper's rounded p = 0.002. This was already covered in prior HsH reports and is not claimed as a new result. A Bonferroni correction across four model-specific contrasts gives approximately 0.0100; the original comparison remains below 0.05 but is just above 0.01 after that correction.

## 5. Review-MIND experiment design

A useful disconfirming follow-up would separate communication schedule from peer-information exposure and revision:

- Randomize unique clue assignment across members and hold task, clue content, model version, and token budget constant.
- Cross contribution scheduling (sequential / concurrent) with peer-context availability (cumulative shared transcript / fixed common initial context).
- Record each member's initial choice and confidence, every exposure event, message/source lineage, revisions, and final group choice.
- Score unique-clue recall separately from verified use of those clues in the final decision.
- Use the group session as the experimental unit; do not treat messages or individual turns as independent observations.
- Include human-human, human-AI, and LLM-only groups only where the recruitment, consent, model identity, and protocol can be matched and documented.
- Pre-register missingness handling, model-specific contrasts, multiplicity correction, and independent human adjudication.

A disconfirming result would be increased mention of unique clues without improved verified clue uptake or decision accuracy. Another would be apparent group agreement disappearing when shared source ancestry is deduplicated. These are proposed tests, not completed experiments. No human participants, new model calls, or new group sessions were used in this run.

## 6. Formalization status

A small generic binary missingness-envelope module was added on a separate draft PR stacked on the existing Lean infrastructure PR #262:

- [PR #2229](https://github.com/Satobloc/HsH/pull/2229), branch `research/calder-hidden-profile-missingness-20261120t2148z`.
- It formalizes the interval between all-missing-failures and all-missing-successes and instantiates the published 0/5 observed, 10/15 missing cell.
- The first exact-head CI run checked out the exact PR head but failed in the new module because the proof script constructed a conjunction in the wrong order.
- The proof script was corrected in head `a6fb40830c97ebddb81a24b0fc3ef272ef0c9a45`.
- No CI run for the corrected head was visible at the last read. Status: `CORRECTED_HEAD_COMMITTED / LEAN_COMPILE_PENDING`.
- The PR is OPEN / DRAFT / UNMERGED and based on the unmerged infrastructure branch, not main.
- Tests, lint, nanoda, and the separate global axiom audit were not run.

Lean checks only the formalized arithmetic. It does not establish the translation from the paper's prose to the chosen estimand, the truth of missing outcomes, the paper's raw-data integrity, or any cognitive or causal claim.

## 7. Scope and ownership

This is an external-study methods audit under Review-MIND, not a new Orson P1 protocol, not a manuscript, not a human-subject result, and not a Nathan Direct theory claim. Orson retains ownership of the November 9 cognition paper, its source corpus, dataset, protocol, experiments, and review gates. No Orson files or PRs were modified.

No physical calculation, measured-system fit, SAT-O / Blockwave equation change, BEDROCK theory promotion, new tool, dependency, fork, subscription, or paid service was introduced.
