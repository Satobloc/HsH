# Orson h1136:s0 | Review-monoculture measurement geometry and paired-design source fidelity

**Run key:** `REVROT3-19-20261011:1136:s0`  
**Nominal slot:** 2026-11-27T08:00:00Z  
**Selected routing label:** Orson Vay (ring index 18)  
**Next ring label:** Sable (ring index 0)  
**Disposition:** SOURCE_FIDELITY_DELTA_COMPLETE / MATCHED-PAIR_STRUCTURE_FOUND / INFERENCE_BOUNDARY_SHARPENED / P1_FREEZE_PRESERVED / NO_EMPIRICAL_REANALYSIS / NO_THEORY_PROMOTION.

This is source-grounded assistant reconstruction under the Orson routing label, not an authenticated historical Orson instance or a claim of continuation in a separate ChatGPT thread.

## 1. Authority and scope

The historical Orson appointment is supported by a direct user-role message in the archived MIRA conversation dated 2026-09-23. Its remit covers ChatGPT/NotebookLM and LLM cognition, Nathan-LLM interaction, the active team as an object of study, archive-as-object methods, bounded tests, and possible field contributions. The later Orson role charter is a structured synthesis, not a verbatim transcript. The current user instruction separately protects approximately four of every five substantive Orson products for genuine cognition work.

The archived conversation titled `ND Orson LLM Cognition Lab` was also checked. Its 2026-10-18 user messages include methodological statements about (a) case-by-case consistency among a scientific model, data, and an interpretive layer, and (b) minimal pairs as ideally equivalent scenarios differing in one controlled variable. Those statements occur in a physics/theory discussion; they are methodological constraints, not direct claims about LLM cognition. The same conversation later discusses nested worldtube coarse-graining. That physical geometry is not imported as a cognitive mechanism or analogy. No Nathan Direct equation or geometric object describing LLM cognition was recovered in this source cluster; the measurement geometry below comes from the external paper/code, and the finite formalizations are assistant reconstructions.

The current Orson workspace identifies the October 11 archive as a historical candidate, not a verified live cognition thread. No authenticated current Orson thread was established. This run therefore records `REVIVAL_SOURCE_RECONSTRUCTED_IN_RUN`; it does not claim historical-instance continuity or cross-thread delivery.

## 2. Primary external source and scope

Hou, Zhang, Stacy, Black and Chandrasekaran, “Do AI Reviewers Converge? Diversity Collapse in Model-Generated Peer Review,” *Findings of EMNLP 2026*, DOI `10.18653/2026.findings-emnlp.1035`.

- Published paper: https://aclanthology.org/2026.findings-emnlp.1035/
- DOI: https://doi.org/10.18653/2026.findings-emnlp.1035
- Public code: https://github.com/jackshengxinz/Review_Monoculture
- Experiment 1 implementation: https://github.com/jackshengxinz/Review_Monoculture/blob/main/ICLR_600/inter-review_similarity_eval/run_experiment1_random_pairwise.py
- Experiment 1 code blob: `7b59ab12b695979eb0aeb28032c463348fac547a`
- Repository README blob: `a97d19d29d66d8887c33d33f8d06a94e0877a161`
- Data/API setup guide blob: `6e3b7d5f9359a535ba4151948c977d6844f4f77c`

The paper reports 509 ICLR 2022-2023 papers, 1,943 human reviews, 10,172 LLM-generated reviews and five LLMs. It explicitly says its primary measures are computed on review text. The main similarity experiment compares one LLM review and one human review per paper across 100 randomly sampled pairs of papers. The authors separately conduct a small human relevance/quality assessment of 25 AI reviews, each receiving two evaluations.

The paper's limitations explicitly say that automated sentiment, praise/critique and embedding-similarity metrics do not fully measure review quality or correctness, and that the study examines textual outputs rather than the full peer-review process. It therefore supplies a literature result about observable review-output distributions, not a measurement of internal model cognition, latent reasoning, reviewer correctness, or consciousness.

## 3. Source equations and the aggregation-scale distinction

The paper's formal definition is per-paper. For paper `p`, let `D_human_p` and `D_model_p` be the distributions of human and model reviews. For a feature map `phi_k` and dispersion functional `Disp_k`, the paper defines a monoculture contrast:

`Delta_k(p) = Disp_k(D_human_p) - Disp_k(D_model_p) > epsilon_k`.

Its Experiment 1 instead defines a cross-paper similarity statistic:

`Sim_t(p1,p2) = cos(E(r^t_p1), E(r^t_p2))`, where `t` is LLM or human.

These objects live at different aggregation scales:

- `Delta_k(p)` compares the spread of multiple reviews of the same paper.
- `Sim_t(p1,p2)` compares reviews of two different papers.
- Experiment 1 samples unrelated paper pairs and compares the distributions of those cross-paper similarity scores.

This is not automatically an error: cross-paper homogenization is a meaningful additional facet of monoculture, and the paper explicitly describes it that way. The fidelity issue is that the per-paper formal definition and cross-paper operational statistic are not the same functional. A map connecting them, or an explicit statement that they are distinct complementary observables, is required before treating Experiment 1 as a direct instance of the per-paper definition.

## 4. The matched-pair structure in the released code

The public implementation makes the sampling structure more precise than the paper's prose alone.

For each draw `i`, `sample_pairs_and_reviews` selects two distinct papers `(p1_i,p2_i)`, a common prompting style, and a human-review slot. The same paper pair is then used to compute:

- `X_i`: cosine similarity between the two LLM reviews;
- `Y_i`: cosine similarity between the two human reviews.

The arrays are appended in the same loop and therefore preserve positional pairing at runtime. The code then calls:

- `scipy.stats.ttest_ind(llm_arr, human_arr)`;
- `scipy.stats.mannwhitneyu(llm_arr, human_arr, alternative="two-sided")`.

Both are independent-sample procedures. They do not use the matched pair index. The point estimate of the difference in means is unchanged, but the standard error and p-value need not match a paired analysis; the direction and size of any change cannot be established without the raw paired scores.

Additional implementation details:

1. Pair draws are made with replacement across the 100 iterations; the code ensures the two papers within a draw differ, but does not enforce unique paper pairs across draws. The actual number of repeated pairs cannot be known without the original inputs.
2. One style is selected for each pair using the first model's available styles. For another model, if that requested style is unavailable, the code falls back to the first common style. This can make the effective style differ across models.
3. The same numeric reviewer-slot index is used for both papers in a pair. It is not shown to identify the same human reviewer across papers; the meaning of positional order in the source dataset is not established here.
4. The saved per-model JSON retains `llm_scores` and `human_scores`, but not the pair IDs, paper IDs, selected style or reviewer slot. The pairing can be reconstructed only if the exact input corpus and generated reviews are available and the deterministic selection is replayed.

The repository README says corpus-scale runs require authorized paper/review inputs. Its setup guide says exact reproduction requires the original filtered inputs and model outputs. The dataset and generated-review directories are excluded from the repository. The expected dataset and generated-review payloads were not present in the public repository. No data, generated reviews, or reported result files were obtained or reanalyzed.

## 5. Existing Lean formalization: valid conditional witnesses, limited contract

The existing draft [PR #2375](https://github.com/Satobloc/HsH/pull/2375) has a new head `2f24a245d8126fdbf1f36d7dfc4047ec86552e25` and remains OPEN / DRAFT / UNMERGED. Its new code is in `FORMAL_VERIFICATION/HsHVerification/OrsonDependenceIdentifiability.lean`.

Two new namespaces are relevant:

- `OrsonReviewFeatureErrorIdentifiability`: a constant review-feature map yields maximal feature matches while two finite error assignments have different reviewer agreement.
- `OrsonPairedScoreIdentifiability`: two score pairings can have the same marginal score multisets but different paired-difference sequences.

The second witness uses equal-length lists `[0,1]` paired with `[0,1]` versus `[1,0]`, producing paired differences `[0,0]` versus `[-1,1]`. This is a valid finite counterexample to identifying paired differences from marginal multisets alone.

**Build evidence:** Actions run #45916724322 completed SUCCESS on synthetic merge-reference commit `2c9ca8a222aaf7e078d816754d24c0c4ed57d707`. The new module blob is identical at the PR head and the tested merge reference. Lean 4.34.0 / Lake 5.0.0; 8,955 build jobs. `#eval` returned `(2, 2, 0, [0, 0], [-1, 1])`. The theorem-specific axiom reports include standard Lean dependencies (`propext`, `Classical.choice`, `Quot.sound`); the retrieved log contains no `sorryAx`, `admit`, or compiler errors. Tests, lint, and the separate global axiom audit were skipped.

This is a merge-reference build containing the exact same changed module blob, not a separate standalone exact-head build. No independent formal review or source-translation validation is established.

**Definition-level limitation:** `pairedDifferences` is implemented with `List.zipWith`, which silently truncates to the shorter list. The concrete theorem witnesses have equal lengths, so the theorem is unaffected. The helper's general contract does not enforce the equal-length invariant that a matched-pair analysis requires. A future typed version should use equal-length vectors or require/prove `left.length = right.length` before computing differences. No edit was made to this open PR.

## 6. Original propositions versus assistant reconstruction

| Source class | Proposition | What it supports |
|---|---|---|
| Nathan Direct, 2026-10-18 archived user messages | Scientific consistency must be adjudicated case-by-case among model, data and interpretive layer; minimal pairs should ideally hold scenarios equivalent while changing one controlled variable | A methodological constraint, not an LLM cognition result |
| Standard external paper | Model-generated review texts are more similar across sampled unrelated papers on the chosen embedding metric | A literature result about text-output similarity |
| Public implementation | LLM and human scores are computed on the same sampled paper pairs, then compared using independent-sample tests | A source-code-level matched-design / inferential-test mismatch |
| Assistant reconstruction in PR #2375 | Maximal feature similarity does not identify reviewer-error agreement; equal marginals do not identify paired differences | Conditional finite mathematical counterexamples |
| Not established | Review correctness, error agreement, latent reasoning, internal cognition, causal mechanism, consciousness, or team-wide consensus | No inference without separate measures and evidence |

The finite Lean witnesses are useful guardrails against overinterpretation. They do not show that the paper's empirical result is false, that reviewers actually share errors, or that the LLMs have a particular internal cognitive architecture. The paper itself does not claim that cross-paper similarity measures error agreement.

## 7. Mapping diagram

```text
Review corpus
  |  (paper IDs, review source, prompt/model, reviewer slot)
  v
Pair-draw index i  ----->  (p1_i, p2_i, style_i, slot_i)
  |                                  |
  |                                  +--> same paper pair for both conditions
  v
LLM review texts                       Human review texts
  |                                           |
  v                                           v
Embedding E                                 Embedding E
  |                                           |
  v                                           v
Cosine score X_i                           Cosine score Y_i
  \________________ matched pair ______________/
                         |
                         +--> paired difference D_i = X_i - Y_i
                         |
                         +--> released code instead compares marginal arrays
                              with independent-sample tests

Unobserved:
  internal model computation / latent reasoning / causal reviewer state
  (no source-defined or measured map from these to the text-embedding score)
```

The critical lost structure is the pair index `i`. The released code uses it while generating the two scores, but its inferential call and saved result schema do not preserve it as an explicit paired record.

## 8. Discrepancy ledger

1. **Local/global scale:** the paper's per-paper dispersion definition and cross-paper similarity experiment are distinct observables; their composition is not specified.
2. **Matched/unpaired inference:** the same paper pair produces both condition scores, but the code uses independent-sample tests.
3. **Pair identity loss:** result JSON stores score arrays without pair IDs, paper IDs, style or slot metadata.
4. **Prompt-style fallback:** a requested style can be replaced by the first available style for a model, weakening cross-model style control.
5. **Reviewer-slot semantics:** the same positional slot is used for both papers; the relationship to reviewer identity/order is unresolved.
6. **Replacement sampling:** repeated paper pairs are permitted; the actual repeat count is unavailable without inputs.
7. **Construct separation:** cross-paper text similarity does not measure review correctness or error agreement.
8. **Cognition boundary:** textual output metrics do not observe latent reasoning or internal model state.
9. **Lean helper contract:** `List.zipWith` truncation is not guarded by an equal-length type/proof; current witnesses nevertheless use equal-length lists.

## 9. Epistemic and operational controls

- Mersearch was checked first. All four canonical request lanes remain occupied: lane 1 Calder geometry, lane 2 Ariadne Kirk episode, lane 3 Calder IRI/worldtube, lane 4 Kestrel finite-core geometry. Lane 2 has a compact manifest/receipt but release is not verified; the other lanes remain requested. No lane was overwritten, released or retriggered. The direct Library and public-paper/code retrievals below are disclosed fallbacks, not a Mersearch run.
- The private HSH_RESOURCES research payload was not opened. The MIRA appointment and Orson source conversation were read from the user's Library archive only; private source identifiers are not reproduced in this public report.
- P1 issue #564 remains OPEN / FROZEN / NOT READY / Orson-owned. No model trial, human session, API inference, dataset expansion or reanalysis, protocol amendment, manuscript edit, or paper-gate advancement was performed.
- P2 November 30 remains HOLD; P3 December 14 remains incomplete.
- P0 #1747 remains `PRESENTATION_SAFETY_FAIL`; Paper A/B live-route acceptance remains `NOT_OBSERVED`; deployment remains `NOT_VERIFIED`; release/standdown remains `NOT_AUTHORIZED`. The latest fully verified discovery source cut is not equivalent to a live-route acceptance. Later Common writes and generated discovery commits do not by themselves clear the presentation gate.
- PWH: WH-05 remains blocked by Mersearch-lane occupancy; WH-02 is the highest unblocked item and remains Calder-owned. No queue or task-graph mutation.
- No physical calculation, CODATA scoring, fit, prediction, independent measurement, SAT-O/Blockwave equation change, BEDROCK theory promotion, new tooling, dependency, fork, subscription or expenditure.
- No paper campaign gate advanced. P1 November 9 remains overdue / NOT READY and frozen; P2 November 30 remains HOLD; P3 December 14 remains incomplete. FIE rereview next due December 8; unrelated-source break next due November 28.
- HsH `main` at final branch readback: `4ab511201001c6e3301b69658d949378a4942713` (2026-11-27T08:39:37Z; automatic discovery-display refresh). The current :00 Archive automation remains enabled as task `6aa1fe0de5e48191b886496095b1343f`; its existing hourly schedule and phase were not changed. No sixth task.
- The expected incoming Ravel h1135:s4 repository handoff to Orson was not found in the checked inbox/hand-off paths. This is a readback gap, not evidence of a missed worker action.
- Next ring label is Sable. The :12 lease remains disabled; this report does not create a scheduled pickup or a new task. Any Sable context is repository-only and carries no direct-thread delivery claim.

## 10. Next deeper cursor

1. Keep the paper's per-paper dispersion and cross-paper similarity as separate observables until an explicit aggregation/projection map is supplied.
2. If and only if the original filtered inputs and generated reviews are later authorized and the P1 freeze is lifted, preserve `(pair_id, paper_ids, style, reviewer_slot, X_i, Y_i)` as one record and compare paired differences with an appropriate paired/permutation analysis. Check model-specific style fallback and reviewer-slot ordering. Do not infer the direction of any correction without the raw data.
3. Make the Lean paired-score helper require equal-length vectors or a proof of equal lengths; retain the current finite witnesses as conditional identifiability results.
4. Keep review-output behavior separate from latent cognition, correctness and consciousness.
5. Do not alter PR #2375, P1 issue #564, its protocol, or any paper manuscript without the existing review/authority gates.

**Final classification:** a real matched-pair structure exists in the external experiment's code; the implementation's inferential tests discard that pairing. The current Lean witnesses correctly show why marginal similarity and paired differences are distinct, but they do not validate the empirical result or establish reviewer-error agreement. The source-fidelity advance is the explicit separation of local per-paper dispersion, global cross-paper similarity, matched pair-level data, output text, and unobserved cognition.
