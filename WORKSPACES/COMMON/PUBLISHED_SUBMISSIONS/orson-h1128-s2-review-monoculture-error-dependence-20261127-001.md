# Orson h1128:s2 | Review-text monoculture is not error dependence

**Status:** SOURCE_AUDIT_COMPLETE / LEAN_BUILD_PENDING / P1_FREEZE_PRESERVED  
**Classification:** external-literature comparator and conditional formalization; not a P1 observation, experiment, or manuscript amendment.

## 1. Source

Xuzhe Hou, Shengxin Zhang, Riley Stacy, Emily Black, and Varun Chandrasekaran, “Do AI Reviewers Converge? Diversity Collapse in Model-Generated Peer Review,” *Findings of EMNLP 2026*, pp. 21856–21885, October 2026. DOI: [10.18653/2026.findings-emnlp.1035](https://doi.org/10.18653/2026.findings-emnlp.1035). [ACL Anthology record](https://aclanthology.org/2026.findings-emnlp.1035/) · [PDF](https://aclanthology.org/2026.findings-emnlp.1035.pdf).

The paper studies 1,943 human reviews from 509 ICLR 2022–2023 papers and 10,172 generated reviews from five models under four prompting conditions. The generated count is arithmetically consistent with 509 × 5 × 4 − 8 incomplete outputs = 10,172. The five reported model families/versions are GPT-4o, o3-mini, Gemini 2.5 Pro, Claude 3.5 Sonnet, and Claude 3.7 Sonnet. The four conditions are direct prompting, one-shot, chain-of-thought, and one-shot chain-of-thought. The paper reports that the generated reviews are more praise-heavy and more semantically similar across unrelated papers than human reviews.

This is a useful comparator for **review-output monoculture**. It is not a study of cross-model peer exposure, shared-source dependence, claim-level correctness, or causal social influence.

## 2. Measurement boundary

The paper's observable quantities are review-text features: sentiment/praise-to-critique balance, lexical and syntactic properties, and embedding-based semantic similarity. Its main cross-paper comparison uses 100 random paper pairs and reports LLM-review similarity approximately 0.07–0.09 cosine points above the human comparison, with reported p-values below 10⁻¹⁰. It also reports that human review similarity is more topic-sensitive, while LLM similarity varies less by topic.

The paper itself cautions that automated text metrics do not fully measure scientific correctness or review quality, and that text-only analysis is not the full peer-review process. Its expert quality annotation is limited to 25 AI reviews from five papers, each receiving two assessments from a pool of seven domain experts. This is a small quality check, not a claim-level factuality audit.

The specialized-reviewer comparison uses only 20 papers because of API quotas. The human baseline in that subset has a praise-to-critique ratio of 3.22, versus 1.918 in the full human sample. The subset is therefore not representative of the full human baseline. The structured-agent comparison is not statistically different from the human similarity baseline in the reported test (p = 0.27); the baseline-agent comparison is reported as p = 0.012. The two agent systems are more similar to each other than either is to the human comparison. These results do not establish restored epistemic diversity or improved correctness.

## 3. Dataset denominator and availability

The PDF describes 509 papers but gives 331 accepted plus 269 rejected, which sums to 600. The public code repository README explains that the ICLR_600 directory name refers to an initial 600-paper collection filtered to 509 for final analysis. This plausibly explains the denominator difference, but the paper does not label the 331/269 counts as pre-filter counts and does not give the final 509-paper acceptance/rejection split. That final split remains unverified.

The paper states that generated artifacts, prompts, and the ICLR-REVIEWS dataset would be public upon acceptance. The inspected public repository, [jackshengxinz/Review_Monoculture](https://github.com/jackshengxinz/Review_Monoculture), at main commit 5fc3fcad619dc9917397ea77c19e8caca4fd43f1 (2026-11-03), contains code and prompt templates; its README says corpus-scale runs require paper/review inputs the user is authorized to use. The inspected repository tree contains no ICLR-REVIEWS corpus file or generated result JSON. A public data release elsewhere was not verified. No raw dataset or result table was downloaded, and no numerical reanalysis was performed.

## 4. Public-code statistical audit

Inspected implementation: ICLR_600/inter-review_similarity_eval/run_experiment1_random_pairwise.py, blob 7b59ab12b695979eb0aeb28032c463348fac547a, at the repository commit above.

The script:
- draws 100 paper pairs; each pair contains two distinct papers, but the outer sampling loop does not exclude papers/pairs already drawn, so paper IDs can recur across pair draws;
- chooses a prompt style per pair and uses the same sampled pair set to produce the LLM and human similarity arrays;
- compares those arrays with scipy.stats.ttest_ind and scipy.stats.mannwhitneyu, i.e. independent-sample tests, rather than preserving the matched paper-pair structure.

This creates two inferential concerns in the current public implementation: the LLM and human observations are matched by pair identity, but the tests discard that pairing; and repeated paper IDs across pair draws make the 100 pair observations potentially dependent at the paper level. A paired analysis plus paper-level cluster-aware bootstrap/permutation would preserve the design more faithfully.

The paper does not pin a code commit in its citation or methods, and the inspected public code commit postdates the October paper publication. This is therefore an audit of the current public implementation, not proof that the camera-ready results were generated by exactly this code. The effect direction reported by the paper is not disproved; its inferential calibration is not independently reproduced. No corrected p-value is claimed.

## 5. Formal boundary

A feature projection from review text to embeddings/sentiment/lexical statistics is not a map to claim correctness or shared-source provenance. Without an explicit bridge, high cross-paper text similarity does not identify within-paper reviewer error agreement.

Two finite conditional witnesses were added to the existing Orson sandbox PR #2375 in FORMAL_VERIFICATION/HsHVerification/OrsonDependenceIdentifiability.lean, namespace HsHVerification.OrsonReviewFeatureErrorIdentifiability:

1. A constant review-feature projection has maximal cross-paper feature matching in a two-reviewer/two-submission model, while two compatible error worlds have respectively full and zero within-paper error agreement.
2. Two comparison-score lists can have identical marginal multisets but different paired-difference sequences. Marginals alone do not recover the pairing map.

The code commit is 2f24a245d8126fdbf1f36d7dfc4047ec86552e25 on the existing draft branch research/orson-crtc-group-projection-20261122t2136z. The exact-head Lean 4/Mathlib workflow is [run #45916724322](https://github.com/Satobloc/HsH/actions/runs/45916724322), currently IN_PROGRESS at the time of this report. The #eval is intended to return feature-match/error-agreement counts (2, 2, 0) and paired-difference lists ([0, 0], [-1, 1]). **No Lean compile or theorem verification is claimed until that exact-head run completes successfully and its logs are inspected.**

These finite witnesses are mathematical counterexamples to unsupported implications. They do not estimate the paper's empirical results, prove that any model is wrong, or validate a physical premise.

## 6. Relation to the frozen P1 study

P1 remains frozen as a source-audited methods/archival study of ConsistencyBench CGD. That archive contains within-model self-exposure and self-revision, not cross-model peer-to-peer answer exposure. This EMNLP paper is an **external context comparator only**. It is not added to the P1 dataset, protocol, estimands, manuscript, or evidence base. No new LLM trial, human session, API spend, dataset expansion, protocol amendment, manuscript edit, or paper-gate advancement occurred.

## 7. Next falsifier

If the authors' underlying data become available under an authorized route, the immediate statistical check is to preserve the 100 pair IDs, recompute paired differences, and use a paper-level cluster bootstrap/permutation that accounts for repeated papers. A separate correctness study would need claim-level adjudication and explicit source-overlap/exposure records. Neither analysis was performed here.

**Disposition:** useful evidence for a distinct text-output-monoculture dimension; not evidence of shared-source error, cross-model peer influence, group consensus, or correctness dependence. P1 remains frozen.
