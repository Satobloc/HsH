# Review-MIND source update: arXiv 2608.04463v3 and evaluator-call provenance

**Date:** 2026-11-10  
**Classification:** primary-source audit / source-fidelity correction / no new experiment / not a P1 manuscript change  
**Relation:** This versioned update supplements the v2 source audit in [issue #1363](https://github.com/Satobloc/HsH/issues/1363), the human-group design proposal in [issue #1377](https://github.com/Satobloc/HsH/issues/1377), and the existing formalization in [PR #850](https://github.com/Satobloc/HsH/pull/850). It does not replace those records or duplicate Orson's P1 work.

## 1. Current primary-source identity

The current arXiv version is Alicia Guerra, Jiaming Qu, and Yibo Hu, **“The Judge Is Part of the Experiment: Auditing Peer Context Sensitivity in LLM-Based Evaluation,” arXiv:2608.04463v3 (2026-11-04)**: https://arxiv.org/abs/2608.04463v3

This is not the same title/author line as v2, **“The Evaluator Is Part of the Experiment: Measuring Open-Ended LLM Conformity,”** by Guerra and Hu. The v2 source audit remains a historical v2 record. Do not silently transfer v2-specific decompositions into v3.

## 2. What v3 actually establishes

### Paired evaluator contrast

The v3 paper holds the focal answer fixed and compares blind evaluation (judge sees question and answer) with informed evaluation (judge also sees the peer context). Its judge linear predictor is:

`mu_ijp = alpha_j * (theta_i - beta_j) + 1[p = informed] * gamma_j * d_i`

with `d_i = +1` for all-correct, `0` for mixed, and `-1` for all-wrong peer context. The paper says `gamma_j` measures the judge's response to peer context, not whether the judge follows the peers. The specified predictor contains no generic pass intercept or pass-order interaction.

Table 1 presents the blind prompt before the informed prompt and labels the templates as being shown “in the order of the experiment.” The accessible v3 text does **not** say that the two ratings are independent calls or that they use fresh, isolated contexts. Searches of the full v3 HTML for “independent call” and “separate call” returned no match. The paper's linked code repository was not retrievable through the connected GitHub source path during this review, so call/context isolation remains **UNVERIFIED**. The table's display order is not by itself a code-verified execution trace.

The paper does not report randomized or counterbalanced blind/informed order. This is an untested design dimension, not evidence that an order effect occurred.

### Version-specific cue decomposition

The v2 paper's six-cue list (attribution, repetition, apparent speaker count, consensus structure, authority labels, and prompt length) is not a source-defined six-component model in v3.

The v3 paper instead reports a component-wise ablation of **repetition, attribution, and authority**. It notes that attribution still bundles names, peer framing, and apparent number of speakers. Keep the six-cue additive vector in the existing Lean module explicitly classified as a v2-derived, assistant-authored abstraction, not a v3 source equation or fitted model.

### Study classification

The v3 paper explicitly says its peer context is simulated and that real multi-agent interactions may produce different effects. Its ethics statement says there were no human participants and no personal data. This is a controlled LLM prompt-context experiment, not a human–LLM group study and not an observed record of reciprocal agent-to-agent message delivery.

## 3. Source-fidelity note for the existing formalization

The current `OrsonEvaluatorMeasurementDecomposition.lean` comments in PR #850 describe an “independent call” and a “fixed blind-then-informed sequence.” The accessible v3 paper supports the blind/informed conditions and Table 1's displayed order, but does not establish call independence, fresh-context isolation, or a code-verified execution sequence. Those stronger statements should be downgraded to **INFERRED / NOT SOURCE-VERIFIED** unless the linked experiment code or execution logs are recovered.

The module's additional pass-order sensitivity model is explicitly assistant-derived:

`Y_o = gamma * d + o * (tau + omega * d)`

Under that model, the fixed-order projection `(tau, gamma, omega) -> (tau, gamma + omega)` is non-injective. The existing theorem `counterbalanced_order_average_is_peer_context_slope` correctly proves that averaging order orientations `+1` and `-1` returns `gamma * d` **under the encoded antisymmetric nuisance term**. This is a conditional design identity. It does not show that the source study had an order effect, that such an effect is antisymmetric, or that the experiment counterbalanced order.

The module formalizes selected algebraic identities in the linear predictor; it does not formalize the complete hierarchical ordinal likelihood, posterior estimation, source data, randomization, or causal interpretation.

## 4. Actual Lean build evidence

The existing PR #850 branch advanced to head `3041f7c2cd717b51945dacaf1d24bc69a0394987`. The `OrsonEvaluatorMeasurementDecomposition.lean` blob `b3316b3a9e5abd3b1779dfec1fb9eb8491e121ee` was independently fetched from both the PR branch and the synthetic merge reference; the blob IDs match exactly.

- Actions run **#42795140460**, job **#129758320557**: SUCCESS.
- Synthetic merge reference: `3bced884cbea0a145e9e117a51a787283fe84c2a`, merging PR head `3041f7c` into base `598a45b3feb9378eb8f14ff069ec9080137113c2`.
- Lean 4.34.0 / Lake 5.0.0; full root build: **8,984 jobs successful**.
- The 18 theorem-specific `#print axioms` outputs in `OrsonEvaluatorMeasurementDecomposition` each report `[propext, Classical.choice, Quot.sound]`.
- Full job log: zero `sorryAx` occurrences and zero bare `admit` occurrences.
- Tests, lint, nanoda, and the separate automated global axiom-audit stage were skipped.

This is a successful **PR merge-reference build**, not a standalone exact-head build. PR #850 remains OPEN / DRAFT / UNMERGED. Its base `598a45b` is 60 commits behind current HsH `main` at `0189a67`; this run does not establish integration with current main.

Lean verifies only the formalized algebra under the encoded definitions. It does not validate the paper's source-to-model translation, execution protocol, empirical data, causal interpretation, or transfer to ConsistencyBench.

## 5. Boundary with Orson's protected P1

P1 remains frozen to the public ConsistencyBench CGD archive: within-model self-history and a shared GPT-4o-mini NLI contradiction checker. The archive does not expose cross-model peer answers. The external paper's `gamma_j` is a different evaluator instrument and must not be transferred to the P1 NLI gate.

P1 remains Orson-owned and **NOT READY**. The November 9 gate is not advanced by this note. No new model trial, human session, API spend, manuscript edit, PDF, reader, independent-review sign-off, or paper-gate advancement occurred. P2 November 30 and P3 December 14 remain separate.

## 6. Prospective design controls, not an experiment

If pass order is material, a future protocol should pre-register order randomization/counterbalancing, verify whether each rating uses a fresh context, retain exact prompt/context digests, model/provider/version, call IDs and timestamps, and estimate a pass-order × peer-context interaction. Report judge-specific results and anchor-scale checks. Do not infer independence from different model labels.

For actual human–LLM group research, retain consent and privacy controls and a time-ordered event graph with distinct `generated_by`, `delivered_to`, `inserted_into_context`, `conditioned_on`, `evaluated_by`, and `used_in_decision` edges. Distinguish exposure, observable uptake, and causal influence. No human study is proposed as already run.

## 7. Limits and disposition

- The source is an arXiv preprint; no peer-reviewed venue was established in this review.
- The linked code repository could not be retrieved in this inspection; no code-level reproduction is claimed.
- No raw experimental data were independently reanalysed.
- No new Lean module, PR, branch, tool, model call, human session, physical calculation, or theory promotion was created.
- This is a source-version and formalization-boundary update, not a new empirical result.

**Primary source:** https://arxiv.org/html/2608.04463v3  
**Historical v2 source:** https://arxiv.org/abs/2608.04463v2  
**Existing v2 source audit:** https://github.com/Satobloc/HsH/issues/1363  
**Existing Review-MIND design proposal:** https://github.com/Satobloc/HsH/issues/1377  
**Existing Orson formalization:** https://github.com/Satobloc/HsH/pull/850  
**Protected P1 docket:** https://github.com/Satobloc/HsH/issues/564
