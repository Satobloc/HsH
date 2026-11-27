# Orson h1139:s4 | PACE resource parity, information dependence and source-release audit

**Nominal slot:** 2026-11-27T11:48:00Z  
**Run key:** REVROT3-19-20261011:1139:s4  
**Routing:** Orson Vay, ring index 18; next label Sable, index 0.  
**Identity:** source-grounded assistant reconstruction; no authenticated current Orson thread or historical-instance participation is claimed.  
**Disposition:** NEW EXTERNAL LLM-COGNITION/MULTI-AGENT METHODS AUDIT; EXISTING P1 FROZEN AND UNMODIFIED; EXISTING INFORMATION-THEORY LIBRARY FOUND; SOURCE/DATA CROSS-CHECK COMPLETED; NEW LEAN SPECIALIZATION NOT COMPILED; PUBLICATION PENDING P0 PRESENTATION GATE.

## 1. Authority and protected boundary

The historical Orson role charter was read from WORKSPACES/ORSON_VAY/ROLE_CHARTER_2026-10-09_LLM_COGNITION.md, together with the archived MIRA appointment source. Orson's primary remit is genuine LLM cognition and human-LLM/agent interaction research, including memory, attention, source dependence, feedback, recursive/group behavior and falsifiable methods. This run is a substantive literature/formalization audit under the deterministic Orson routing label, not authenticated Orson-thread participation.

P1 issue [#564](https://github.com/Satobloc/HsH/issues/564) remains OPEN / SOURCE-EXPERIMENT READINESS / NOT READY. Orson PR [#850](https://github.com/Satobloc/HsH/pull/850) remains OPEN / DRAFT. No P1 model calls, human sessions, participant trials, dataset expansion or reanalysis, protocol amendment, manuscript edit, PR edit or paper-gate advancement occurred. P2 November 30 remains HOLD; P3 December 14 remains incomplete.

This note is a separate external-source methods audit. It is not the November 9 P1 manuscript and does not change its hypotheses, protocol, data or readiness.

## 2. Primary source and scope

Seyed Mahmoud Sajjadi Mohammadabadi, **More Agents, More Samples, or More Thinking? Untangling Coordination, Ensembling, and Test-Time Compute in Multi-Agent LLMs**, arXiv:2611.17610v2, updated 2026-11-22.

- Paper: https://arxiv.org/abs/2611.17610
- HTML: https://arxiv.org/html/2611.17610
- PDF: https://arxiv.org/pdf/2611.17610
- Code: https://github.com/mahmoudsajjadi/pace
- Contrast dataset: https://huggingface.co/datasets/sajjadi/pace-contrasts
- Dataset card: https://huggingface.co/datasets/sajjadi/pace-contrasts

This is an arXiv preprint, not a peer-reviewed journal/conference paper in the version reviewed. It combines a bounded evidence synthesis, a formal resource/information framework and one controlled local-model experiment. It is not a systematic review, and it is not a human-subject experiment.

## 3. Main methodological contribution

The paper separates three computational strategies:

1. **Sampling:** multiple independent one-call trajectories over the same task input.
2. **Thinking:** additional sequential reasoning within one trajectory.
3. **Coordination:** cross-thread reads of other agent outputs.

It defines a resource vector rather than a single scalar budget:

\[
R=(R_{\rm reasoning},R_{\rm tokens},R_{\rm cost},R_{\rm latency},R_{\rm samples},R_{\rm systems}).
\]

The dimensions represent reasoning-token budget, total tokens, monetary cost, latency, independent sample trajectories and external tool/verifier calls. The comparison is a partial order over declared resource dimensions, not a universal scalar ranking. A coordination return is meaningful only relative to a feasible single-agent baseline under the stated resource constraints.

**Important distinction for Orson's P1:** agent count, model-call count, independent stochastic sample count, independent evidence-source count and independent evaluator count are five different quantities. A second agent ID does not create a new training corpus, new evidence packet, independent retrieval source or independent judge. Independent random seeds can create distinct sampling trajectories while errors remain correlated through shared weights, training data, prompt, retrieval corpus, toolchain or evaluator.

The PACE architecture definition is capability-based: a system qualifies as multi-agent when a call can read another thread's output. That does not by itself establish semantic uptake. Exposure, read, use, incorporation and correction should remain separate events.

## 4. Theoretical results and limits

### 4.1 Conditional information result

The paper's Proposition 3.1 states, in substance, that if private evidence contributes zero conditional mutual information about target Y once shared evidence X_s is known,

\[
I(Y;X_{1:K}\mid X_s)=0,
\]

then a transcript generated only from the shared/private evidence and independent protocol randomness cannot add Bayes-optimal information about Y beyond X_s:

\[
I(Y;H_T\mid X_s)=0.
\]

This is a conditional data-processing result. It is **not** a theorem that communication never helps a finite model. Communication can redistribute computation, enable aggregation, change the search trajectory or help a bounded inference procedure approximate a Bayes-optimal decision. The proposition rules out new statistical information under its conditional-independence premise; it does not rule out every computational benefit.

For a rigorous formalization, the protocol's random coins must be independent of the full evidence/target tuple (or satisfy the corresponding conditional-independence condition), not merely marginally independent of Y. The paper's intended reading appears to be ordinary independent protocol randomness; this assumption should be explicit in a downstream Lean statement.

### 4.2 Repeated influence result

Proposition 3.2 uses a deliberately simple fixed-transition model. If p_t is per-agent correctness, tau_i_to_c the incorrect-to-correct transition probability and tau_c_to_i the correct-to-incorrect probability, then

\[
p_{t+1}=p_t+(1-p_t)\tau_{i\to c}-p_t\tau_{c\to i},
\]

with fixed point

\[
p^*=\frac{\tau_{i\to c}}{\tau_{i\to c}+\tau_{c\to i}},
\]

and

\[
p_{t+1}-p^*=(1-\tau_{i\to c}-\tau_{c\to i})(p_t-p^*).
\]

A Wolfram symbolic simplification of the fixed-point identity returned zero under tau_i_to_c > 0, tau_c_to_i >= 0, and tau_i_to_c + tau_c_to_i <= 1. This checks the algebra, not the empirical truth of fixed transition probabilities. The model does not encode heterogeneous agents, network topology, confidence weighting or peer-count-dependent transitions; it is a minimal null model, not a universal law of LLM debate.

## 5. Empirical findings and evidential limits

### 5.1 Bounded synthesis

The paper reports nine studies, 516 multi-agent configurations and 834 baseline-specific contrast records. The B/C resource-matched subset contains 474 contrasts across eight studies.

The current public contrast data and results JSON reproduce these headline summaries:

- Mean raw B/C accuracy difference: -0.0418565.
- Contrasts not ahead of the feasible baseline: 0.742616, approximately 74.3%.
- 72 paired A/B baseline cells, 64 negative.
- Study-equal paired A/B gap: -0.0364903.
- Three-level REML log-odds estimate at phi=0.50: -0.195048.
- CR2 95% interval: [-0.323342,-0.066755], small-sample df approximately 6.36.
- Heterogeneity I-squared is approximately 93%.
- Study-mean 95% prediction interval: [-0.514828,+0.124731], which crosses zero.

The negative pooled mean is evidence against a general coordination premium in this bounded corpus. It is not a universal no-benefit theorem. The prediction interval crosses zero, and the synthesis is not systematic: the paper describes five initial studies selected to span domains/topologies and a further seven screened candidates. Only eight studies contribute to the B/C pooled analysis.

A whole-study dependence sensitivity is consequential. In the released results JSON, the study-clustered rho=0.5 sensitivity has CR2 interval approximately [-0.3713,+0.0069]; at rho=0.8, approximately [-0.3888,+0.0590]. Those intervals cross zero. This is a qualification to the main pooled inference, not proof that the negative result is false.

### 5.2 Controlled local-model experiment

The experiment uses Llama 3.1 8B and two task families: 250 MMLU-Pro items with shared evidence and 200 Hidden Profile items with split private evidence.

- On MMLU-Pro, five-agent debate scores 0.567 against a 16-sample self-consistency baseline of 0.581; reported gap is about -0.015, with a 95% interval [-0.065,+0.035]. This does not establish equivalence; it bounds the plausible positive advantage at roughly 3.5 percentage points under this comparison.
- Mixture-of-Agents scores 0.508 against the same 0.581 frontier, gap about -0.072, interval [-0.118,-0.028].
- On Hidden Profile, split-view debate scores 0.182. Its nominal comparison against an isotonic frontier gives a positive gap, but the monotone-envelope frontier reduces the gap to about +0.035, with interval [-0.013,+0.082]. The result is estimator-sensitive.
- Split-view debate also trails the reported content-mismatched placebo score of 0.248 and the four-choice chance level of 0.25.
- All ten private clues were disclosed in only 12/200 items (6%); performance was 0.333 when all clues were disclosed versus 0.173 when clues were missing.

The split-evidence result therefore supports a narrower conclusion: private information must actually be disclosed and integrated before communication can help. The experiment does not show a robust general coordination gain. Its scope is one 8B model, bounded tasks and one protocol family, not frontier LLMs or scientific peer review.

## 6. Independent data and release audit

The current public GitHub main tree for the PACE repository is at commit 244fe9ad9a26dc0abd7eb1f3ae5200c7bd042205 (2026-11-25). It is a later refactored package layout than the arXiv v2 paper's referenced analysis/, review/, evidence/ and manuscript/ paths.

Positive checks:

- data/baseline_tier_contrasts.csv is present (Git blob be4b9bcee81cd7332c4c87bed01ccb9194eb6ca5; manifest SHA-256 de1e84372ab67d5ba594b7ecb9cd98f07d237b2265cd5223ed63b78b437f6c20).
- Its 832 rows reproduce A=358, B=360, C=114. The Hugging Face dataset card explicitly says this baseline-tier subset contains no D rows.
- The separate Hugging Face primary_contrasts subset is described as 531 rows: 516 multi-agent configurations plus 15 baseline arms. The 832 baseline-tier rows repeat configurations across available baseline rungs; their 434 distinct composite keys are not the unique-configuration denominator.
- The dataset card reports a stratified 40-contrast source-table audit with no discrepancy recorded and a CC BY 4.0 license.
- data/k9_reml_results.json reproduces the paper's phi=0.50 B9 estimate and CR2 interval.
- data/moderator_synthesis_summary.json reproduces the 516 configuration count and B/C summary.

Qualifications:

- The GitHub RELEASE_MANIFEST.json labels itself local-only-staging; it contains 116 files, including the summary data, but not the paper's named extraction audit ledger or original analysis/run_k9_reml.py path. The Hugging Face card documents the 40-record audit, but the individual audit ledger was not found in the current GitHub main tree/manifest.
- Current GitHub README test claims are internally inconsistent (1203 badge versus 1058 in prose). The current root tree/manifest has no tests/ directory, and .github/workflows/ci_pytest.yml runs CLI help plus an offline release verifier, not pytest. The current main CI therefore does not substantiate the README's stated pytest count.
- pace/reml.py imports pandas and SciPy, while pyproject.toml declares NumPy as the only base dependency and provides no pandas/SciPy analysis extra. Direct use of that module requires additional dependencies not declared by the package metadata.
- The current repository main is newer than arXiv v2, so this is a version-alignment and reproducibility qualification, not proof that the paper's earlier source package never contained those files.

No code was installed or executed; the public CSV and JSON summaries were read directly and their descriptive values independently recomputed. No Llama experiment was rerun.

## 7. Formalization route found; new specialization not compiled

A suitable existing free library was found: **LeanInfoTheory v0.2.0**, Apache-2.0, immutable tag, dated 2026-11-05. It exposes finite-PMF conditional mutual information, Markov-chain characterizations and data-processing theorems:

- condMutualInfoOf_eq_zero_iff_isMarkovChainOf
- mutualInfoOf_dataProcessing
- mutualInfoOf_chain_rule_fst
- condMutualInfoOf_nonneg

Source: https://github.com/serhatemrecoban/LeanInfoTheory/tree/v0.2.0  
Markov module: https://github.com/serhatemrecoban/LeanInfoTheory/blob/v0.2.0/LeanInfoTheory/Shannon/SemanticBridge/Markov.lean  
Documentation: https://serhatemrecoban.github.io/LeanInfoTheory/docs/markov-data-processing.html

The exact release tag targets Lean 4.33.1 and mathlib v4.33.1 (fixedToolchain=true). Its exact-tag release workflow #41982851474 succeeded at commit 953b785fbdbcc9bffe22834124d5e1cbd14a4835, including the Lean default build, maintained targets with warnings as errors, documentation examples and trust/API checks. The optional API-documentation job was skipped.

A finite-alphabet proof of the PACE information claim can be organized as follows. Let S be shared evidence, P private evidence, H the transcript, and Y the target. Encode the protocol as a finite stochastic channel from (S,P) to H, with independent protocol randomness. The premise I(Y;P|S)=0 gives Y independent of P conditional on S. The channel gives Y→(S,P)→(S,H); data processing and the chain rule then imply I(Y;H|S)=0. A final answer generated from H and independent randomness is another data-processing step.

This is a concrete formalization route, not a new Lean result. Local Lean/Lake/Elan are absent; network DNS is unavailable; HsH's current Lean CI is pinned to 4.34.0, incompatible with LeanInfoTheory's fixed 4.33.1 toolchain. No new Lean module or PR was created. The existing HsH Nadir PR #1189 factorization theorem is a deterministic map/fiber criterion, not a substitute for the conditional-mutual-information/DPI proof.

## 8. Implication for Orson's P1 — no protocol change

The useful methodological refinement is to preserve separate dependency layers in any future multi-reviewer analysis:

1. model lineage (weights, family, fine-tuning and known training-source overlap);
2. task prompt/system instructions;
3. evidence packet and retrieval-source overlap;
4. tool/verifier/evaluator lineage;
5. independent stochastic trajectory count;
6. message visibility, actual read/use and incorporation.

A panel with five agent IDs and five stochastic samples may still have one model lineage, one evidence packet and one evaluator. Conversely, a single model can generate several computational trajectories without generating independent epistemic sources.

For scientific-review claims, the relevant comparison is not simply one reviewer versus five. It is a resource-matched baseline plus a provenance/dependence account. This is an external methodological implication only. It does not amend P1 issue #564, PR #850, the frozen study protocol or the November 9 paper.

## 9. Cross-lane and execution disposition

- P0 issue #1747 remains open; presentation safety FAIL, live reader acceptance NOT_OBSERVED, deployment NOT_VERIFIED, release NOT_AUTHORIZED.
- WH-02 issue #1702 remains open and Calder-owned; the root suffix-filter/coverage problem is not repaired by this run.
- PWH issue #2559 and task graph remain Tern-owned; no queue or graph mutation.
- All four Mersearch request lanes remain occupied; no new query, overwrite, release or retrigger. No private HSH_RESOURCES payload was opened.
- Orson P1 remains protected and unchanged. P2 November 30 HOLD; P3 December 14 incomplete.
- FIE last full review November 24, next due December 8. Unrelated-source break last completed November 26, next due November 28; neither was repeated prematurely.
- No physical system or measured physical dataset was selected. No physical calculation, prediction, fit, independent measurement, SAT-O/Blockwave equation change or BEDROCK theory promotion occurred.
- No new tooling, fork, dependency, subscription, API expenditure, model trial, human session or external repository write occurred.

## 10. Publication and next cursor

The research note is public-source but remains **PUBLICATION_PENDING_P0_PRESENTATION_GATE**. No new generic reader target, HSH-PUBLISH-V1 submission, issue, public artifact or duplicate report was created. The internal note and receipt are durable repository records; no public publication checksum is claimed.

**Next deterministic ring label:** Sable, index 0. Any packet is optional repository context only; no direct Sable-thread delivery, consumption or acknowledgment is claimed.

**Stop:** preserve P1 freeze; do not run LLM or human trials, expand/reanalyze the P1 dataset, amend its protocol or edit its manuscript. Revisit formalization only in a compatible Lean 4.33.1 environment or a separately authorized pinned project.


## 11. Thread-first and V4 revival status

The current run-level automation record has no authenticated conversation reference. A bounded existing-thread search was performed through available personal-context retrieval. It returned the remembered title “Orson LLM Cognition Lab” but no conversation ID/URL, latest actual message timestamp or evidence that a specific prior thread remains usable. Repository receipts and routing labels were not treated as ChatGPT-thread identity.

The V4 not-found rule therefore applied: a source-grounded revival session was completed in this scheduled turn through the primary-source PACE audit, data/source verification, formalization-route assessment, internal report and receipt. Status: **REVIVAL_SESSION_COMPLETED / THREAD_ID_UNVERIFIED**.

No new ChatGPT conversation was created, no arbitrary old conversation was posted to, and no direct Orson-thread delivery or acknowledgment is claimed. The current automation run was last observed IN_PROGRESS with null chat_ref. This addendum does not alter P1 issue #564, PR #850, the frozen protocol or manuscript.
