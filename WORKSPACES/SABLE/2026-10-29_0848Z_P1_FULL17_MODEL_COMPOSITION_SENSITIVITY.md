# Sable | Workshop Relay :48 | 2026-10-29 nominal 08:48 UTC
Run key: REVROT3-19-20261011:440:s4; seq=2204; selected ordinary Sable (index 0), next Loom (index 1), next run 2026-10-29T09:00Z s0. Current assistant's source-grounded Sable systems/QC pass; NOT authenticated historical Sable participation.

## Result: full 17-model leave-one-out (LOO) composition sensitivity

**NEW executed original-data result.** Recovered all 17 complete public ConsistencyBench CGD JSON bodies via GitHub's immutable `fetch_blob` interface after the normal `fetch_file` interface had returned empty bodies for eight models in Sable's 05:00Z pass. Every blob was fetched by its previously recorded Git SHA and JSON-parsed in the connector JavaScript runtime. All 17 had 1,150 aligned question occurrences; alignment compared set_id, within-set question index, exact question string and source expected key. Original evaluator `src/evaluate.py` Git blob `0453540cb7c19227601e59fb342fa93e736da849`; source-locked 17-file SHA manifest in Orson's existing `WORKSPACES/ORSON_VAY/CODE/2026_10_29_cross_model_agreement.js` blob `a2e21227dda53d867afcef771060fd39f8d6ae47`. The newly committed Sable Node replayer reproduces the manifest and uses Git-blob SHA assertions; its syntax was parsed but it was NOT run locally against a checkout. The original-data analysis itself WAS executed directly in connector JS.

**Baseline independently reproduced from original records:**
- 17 model files x 1,150 aligned positions = 19,550 archived model answers; 136 model pairs per position = 156,400 pair opportunities.
- Inclusive exact-label agreement: 105,795 initial -> 104,673 final, delta **-1,122**.
- Fixed complete-case agreement, requiring both model labels substantive at both stages: 102,797 -> 102,881 on the SAME 137,911 eligible pairs, delta **+84**.
- These are exact-label equality statistics, NOT semantic consensus, independent reviewers, or a checker causal effect. The benchmark's own within-set pairwise metric is a different statistic (Loom source audit).

**NEW 17-model LOO result:** Recompute both agreement differences after omitting one original model file, keeping the remaining 16 and recomputing the complete-case mask. All 17 inclusive LOO deltas remain negative. But **six of seventeen fixed-case LOO deltas become negative**, reversing the +84 sign of the complete 17-model fixed-case statistic. Eleven stay positive. The six omitted models are gpt-4.1, claude-opus-4.6, claude-sonnet-4.6, gpt-5.2, gpt-5, qwen-2.5-72b. This is a deterministic sensitivity audit of these 17 recorded files, not an inferential p-value or vendor ranking.

| Omitted recorded model | Inclusive delta (16 models) | Fixed complete-case delta (16 models) | Fixed eligible pairs |
|---|---:|---:|---:|
| gpt-4o | -1045 | +70 | 120738 |
| gpt-4.1 | -1786 | **-628** | 120730 |
| gemini-2.5-pro | -639 | +431 | 121008 |
| claude-opus-4.6 | -1263 | **-127** | 121256 |
| claude-3.5-sonnet | -882 | +240 | 120730 |
| claude-sonnet-4.5 | -667 | +212 | 123563 |
| claude-sonnet-4.6 | -1457 | **-308** | 121519 |
| deepseek-v3.2 | -967 | +206 | 120871 |
| gemini-2.0-flash | -1581 | +53 | 124198 |
| gemini-2.5-flash | -665 | +433 | 120730 |
| gpt-5-mini | -80 | +294 | 124187 |
| gpt-5.2 | -1279 | **-159** | 120730 |
| gpt-5 | -826 | **-136** | 123739 |
| llama-3.1-70b | -375 | +767 | 120730 |
| llama-3.3-70b | -631 | +545 | 120799 |
| o3 | -908 | +3 | 121753 |
| qwen-2.5-72b | -1779 | **-636** | 121384 |

**Arithmetic and algorithmic checks:** Direct enumeration over 136 model pairs at each of 1,150 positions reproduced Orson's earlier aggregate counts. For each model, computed contribution of all pairs containing that model, and subtracted it from the full delta. Each unordered pair is incident to exactly two models, so the 17 fixed-case model contributions sum to 2 x 84 = **168** (checked by executed JS). Qwen's fixed contribution is +720; removing it yields 84 - 720 = -636. GPT-4.1 contributes +712; removing it yields -628. These are descriptive additive decompositions. They do not identify any model as responsible for a causal mechanism.

**Question-text structure:** 977 distinct exact question strings across 1,150 positions. One repeated question about metals/elements occurs six times and contributes -184 inclusive matching-pair changes (-155 fixed-case). This is not six independent question stimuli. Context, source keys, repeated text, model families, checker reuse and paired-stage missingness must be modeled before confidence intervals or causal claims.

## Original statements, transformations and proof boundary

Nathan Direct in this scheduled instruction (2026-10-26 priority reiterated) requires proof-first for explicit or extractable informational/geometric structure. This is a **methodological instruction**, not a claim that archived model labels instantiate H(s)H worldtubes. The original external benchmark's `extract_answer` and `normalize_expected` define the recorded text-to-label projection. The present worker's LOO operation is a separate, explicitly defined projection: restrict model identity set, rebuild pair set, restrict to substantive labels at BOTH stages, count exact equality. Neither projection has an inverse in general; no information-preserving equivalence or physical analogy is asserted.

New Lean 4/Mathlib file `FORMAL_VERIFICATION/HsHVerification/SableSeventeenModelLOO.lean` encodes nine source-conditional theorems, including six negative fixed-case omissions, all-negative inclusive omissions, double-count identity, and omission-sign criterion. Root import updated. **Compilation NOT VERIFIED at writing time.** Even successful Lean compilation would verify the encoded propositions, not the dataset, text-label mapping, model identity, observational independence or causal interpretation. No arbitrary physical system, data-free physical fixture, new LLM trial or CODATA comparison.

## Control and prior work checked

Read live BEDROCK blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c` (88,070 characters fetched; governing opening and newer directives inspected, NOT a claim of 568-line close reading); Steering Charter blob `5f4263381afcb065e9062d5b5885593d0baa58db` including Oct29 original-statement-first addendum; Three Paper Campaign blob `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`; current onboarding, Revival V3, thread-routing, branch map, Sable historical README blob `ad46b5a68c24a46a41f71f7dd6edda1cc5aa2463`, existing Orson PR #850 and Sable draft PR #852, original benchmark evaluator and current source-locked scripts. This is a benchmark-data QC pass, not a new SAT geometric derivation; no SAT original-equation claim was made. The immediate expected 08:36Z Orson->Sable handoff and Orson receipt were NOT_FOUND on exact-path attempts; previous verified Sable 05:00Z receipt and 04:48Z Orson handoff were read. Missing handoff is not evidence of a worker refusal or failed contact.

Existing publisher issue #976 from Sable's 05:00Z pass was **independently closed as PUBLISHED**: publisher comment #6488402816, destination file blob `fd21f52f91852b6643a2a35fc0f21f396ef6287f`, exact content matched worker report (10,308 chars). No resubmission. Sable PR #852 old head `194374187f89f76b20c1f851053fffc121c5a9c6` had no returned matching PR workflow run; do not claim earlier seven Sable theorems compiled.

Deliberate lateral reading: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/TheTANGLE.txt` blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, actual lines 601-640, fictional-world marginalia and layered translation uncertainty; next cursor line 641. No forced physics interpretation. Last documented Sable FIE reread Oct28 (<14 days), not repeated this turn.

## Discrepancy ledger and next gates

1. S0848-01: full 17-file source-body access **RESOLVED via immutable Git blob reads**; ordinary file reader's eight-body truncation is a tool-path limitation, not missing experimental evidence.
2. S0848-02: fixed-case direction reverses on **6/17 model omissions**; deterministic original-data result, no independence/causality inference.
3. S0848-03: all-label inclusive direction remains negative under every one-model omission; sensitivity depends on the chosen projection.
4. S0848-04: stage-conditioned complete-case selection may condition on revision outcomes; source-key adjudication and model-family clustering remain OPEN.
5. S0848-05: original Orson's November 9 paper requires his author disposition, Nov 2 frozen estimands/masks, independent HUMAN hostile review, source LaTeX, actual compiled PDF and working reader. Nov 30 P2 and Dec 14 P3 are separate.
6. S0848-06: Lean source committed and imported, exact-head compilation/axiom report PENDING until CI evidence; no theory promotion.

**Next Loom (09:00Z):** preserve original text, question-occurrence identity and source-key version when tagging. One concrete independent check: determine whether the 977 exact question strings represent distinct premise contexts or merely lexical repeats, without conflating repeated occurrences with independent trials. Handoff is a repository fallback, not delivery to Loom's historical ChatGPT thread. No scheduler/task/cadence changes or sixth task.
