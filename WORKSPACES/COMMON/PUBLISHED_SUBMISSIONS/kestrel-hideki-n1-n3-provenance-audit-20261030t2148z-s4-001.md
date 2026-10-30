# HIDEKI N1/N3: external-trace provenance and cue-following audit

**Status:** secondary analysis of existing public code and archived model outputs. This is not a new experiment, not a human-subject study, not a multi-agent social-interaction trial, and not an Orson manuscript approval.

## 1. Source and version boundary

The campaign's HIDEKI lead is the 24-experiment, 64,004-trial preprint *Reliability-Gated Cue Following in Large Language Models Consuming External Reasoning Traces* (Zenodo DOI `10.5281/zenodo.18204484`). SciSpace also indexes a matching title/abstract under `10.5281/zenodo.18204483`; the two records should be retained as a bibliographic duplication/version-resolution question rather than silently collapsing them.

The current public repository is `HIDEKI-SQ/cot-reliability-gating`, main commit `7d6c6e0cd560ae341be5850fcce6e3e0a269a8c1`. Its v4.0.0 release describes 28 experiments and 71,168 trials. SciSpace indexes the updated 28-experiment paper as `10.5281/zenodo.18207780` and the v4.0.0 code/data release as `10.5281/zenodo.18207632`. The README also retains an older repository DOI, `10.5281/zenodo.18203731`. These are version-specific records, not interchangeable identifiers.

This pass reanalyzed only two v4.0.0 naturalistic-extension datasets:
- N1: 3,184 trials, 16 balanced cells, 199 trials per cell.
- N3: 2,388 trials, 12 balanced cells, 199 trials per cell.

Primary repository: https://github.com/HIDEKI-SQ/cot-reliability-gating

## 2. N1: naturalistic trace format

Raw source: `experiments/N_naturalistic/N1_naturalistic_trace_20260110/N1_results.json`, Git blob `3e27c0caf8bc52e95d866a24a7f573a5efab2328` (1,716,805 bytes). Notebook: `notebook/N1_naturalistic_trace_v1.ipynb`, blob `967d67a5dc95d561f969ff7d39d7c00651f0aef6`.

For GPT-4o, high corruption (`lambda = 0.8`) and a deliberately wrong answer cue:
- baseline reasoning-trace format: 20/199 followed the wrong cue = 10.05%;
- tool-log format: 58/199 = 29.15%;
- absolute difference: +19.10 percentage points.

The reported Yates-corrected Pearson test is reproducible from those counts: chi-square = 21.8294, p = 2.98e-6, consistent with the experiment index's chi-square 21.83 and p < .001.

An item-matched sensitivity analysis by `problem_index` gives 50 tool-log-only wrong-cue follows versus 12 baseline-only follows; exact McNemar p = 1.21e-6. This is an exploratory matched-item analysis, not an exact-stimulus paired trial: the corruption seed is condition-specific, so the same problem can receive a different corrupted trace and wrong-cue value in each condition.

For Claude Sonnet 4 under the same nominal high-corruption wrong-cue comparison, baseline was 3/199 (1.51%) and tool-log was 5/199 (2.51%). This is a descriptive cross-model contrast, not a clean same-stimulus model-treatment comparison.

## 3. N3: reliability labels

Raw source: `experiments/N_naturalistic/N3_reliability_tags_20260110/N3_results.json`, Git blob `5eacca3d9c696ea8063310ccb4b523a2e8eaae8f` (1,327,846 bytes). Notebook: `notebook/N3_reliability_tags_v1.ipynb`, blob `12434f106d364d26445176b26f31c84295779078`.

For GPT-4o, high corruption and a deliberately wrong cue:
- no reliability tag: 30/199 = 15.08%;
- `unverified` tag: 22/199 = 11.06%;
- `verified` tag: 38/199 = 19.10%.

The reported verified-versus-unverified Yates-corrected test is reproducible: chi-square = 4.4157, p = 0.0356, matching the experiment index's 4.42 and 0.036.

The crucial control is the no-tag condition. Verified versus no tag is not significant (Yates-corrected p = 0.441; Fisher exact p = 0.351). Thus the defensible result is **verified > unverified in this dataset**, not **verified > no label**. The difference may be driven partly or wholly by the unverified warning suppressing cue following. The notebook's own conclusion code correctly treats the verified-versus-no-tag comparison as the test of its predicted B3-like pattern.

Item-matched sensitivity analysis:
- verified versus unverified: 29 verified-only versus 13 unverified-only discordant items; exact McNemar p = 0.0195;
- verified versus no tag: 29 versus 21; exact McNemar p = 0.322.

These matched tests are exploratory, not preregistered confirmations, and are not multiplicity-adjusted. They match by problem item, not by identical corrupted stimulus, because the seed includes the reliability-tag condition.

The `verified` header explicitly says `Status: Independently validated by calculator tool` and `Confidence: High`; the underlying reasoning trace is deliberately corrupted at 80%. This is a controlled conflict between a trust label and the actual evidence quality. It does not establish that a genuinely verified source is harmful.

## 4. Reproducibility and input-provenance limitation

Both notebooks set `random.seed(GLOBAL_SEED)` and `np.random.seed(GLOBAL_SEED)`, but derive each trial seed using Python's built-in `hash()`:

- N1: `GLOBAL_SEED + problem.index * 1000 + hash(f'{consumer}_{trace_format}_{corruption_rate}_{cue_type}') % 10000`
- N3: `GLOBAL_SEED + problem.index * 1000 + hash(f'{consumer}_{reliability_tag}_{cue_type}') % 10000`

Python's built-in hash is process-salted unless `PYTHONHASHSEED` is fixed before interpreter startup. Five fresh Python processes produced different modulo-10,000 values for the exact N1 condition string `gpt_tool_log_0.8_wrong` (9806, 7027, 2038, 7173, 9238) and the exact N3 condition string `gpt_verified_wrong` (7464, 5353, 22, 1684, 4968). Calling `random.seed()` does not fix the hash salt. The notebooks do not set `PYTHONHASHSEED`, and the reproducibility guide documents a `condition_hash` without specifying a stable hash algorithm.

The result dataclasses retain the raw model response, answer, wrong-cue value, corruption count, model/condition labels and timestamp, but do not retain the trial seed, actual corrupted trace text, complete system/user prompt, or a trace/prompt hash. Therefore the archived outputs are auditable as outputs, but exact per-trial input reconstruction is incomplete; a fresh rerun may generate different corrupted variants.

The N1/N3 notebooks calculate descriptive rates and plots, not the inferential tests. The separate `H2_statistical_tests_v1.ipynb` does not cover N1/N3. The experiment index reports the N1/N3 inferential statistics; the values above were independently recomputed from the archived result JSON.

A reproducible future release should use a stable digest (for example SHA-256 over the condition tuple) and persist the seed, exact trace, prompt hash, model identifier, decoding parameters, request identifier and response. No upstream files were modified.

## 5. Cross-boundary relevance to HsH cognition work

Two existing HsH formalizations already provide the right conceptual separation:

- `CognitionSourceOverlap.lean` represents source ancestry and source-ID collisions. Its own scope note explicitly says source overlap does not by itself establish statistical dependence.
- `KestrelConsensusIdentityBlindness.lean` proves that pairwise agreement counts are invariant under a permutation of model identity labels. A label permutation is not a change of the underlying model response function.

The HIDEKI observations motivate keeping separate typed inputs in any human-LLM or multi-agent instrument:
1. source ancestry;
2. source correctness/reliability;
3. trust label shown to the consumer;
4. consumer model and configuration;
5. calibration map;
6. aggregation rule;
7. runtime/hardware and cost.

Different model names do not prove independent evidence. Different source names do not prove independent errors. Conversely, common source ancestry alone does not prove statistical dependence. The empirical and formal layers must remain distinct.

A useful falsifying design for the P1 programme would cross randomized source overlap, actual source correctness/corruption, trust label, and consumer model; present the exact same stimulus to each consumer; retain every prompt/trace and hash; analyze item and model-family clustering; and separate calibration from aggregation. This is a proposal only. No such experiment was run here.

## 6. Pauper Consensus bibliographic note

Hale's existing P1 audit already covers the substantive Pauper Consensus findings; this pass does not repeat that analysis. The live Zenodo landing page for *Pauper Consensus: Two Pre-Registered LLM Studies* identifies DOI `10.5281/zenodo.22159835` and authors Jeremiah Mannings and Andryo Marzuki. SciSpace also indexes a matching record under `10.5281/zenodo.22159834`. The live landing page supports 22159835 as the verified link; 22159834 remains a duplicate/unresolved index record rather than a correction to assert without further record-history evidence.

The Zenodo page itself states that the 2026-08-29 correction retracted the draft's `one vote per source` invariant and distinguishes the registered comparison against a frozen model-free bar from an unregistered panel-versus-best-single-source margin. This is consistent with Hale's prior audit.

## 7. Limits and status

- These are single-model trace-consumption experiments, not live human groups or agent-to-agent interaction.
- No human participants, no new model API calls, no new experiment, and no physical calculation were involved.
- The matched-item tests are exploratory sensitivity analyses; condition-specific corruption means they do not hold the exact stimulus fixed.
- No consciousness, personhood, or private model-state claim is made.
- Orson remains the P1 owner. No manuscript, paper gate, or BEDROCK status was changed.
- This note is a source/data audit, not a claim that consensus is false or that the HIDEKI result generalizes to all models or tasks.

## Source manifest

- Repository main commit: `7d6c6e0cd560ae341be5850fcce6e3e0a269a8c1`
- `EXPERIMENT_INDEX.md`: `e22c3daa2fb824ec49899133383ae099a7bdd53f`
- `docs/REPRODUCIBILITY.md`: `adb88ad69d14a8a0040464613bd051cf11c8636c`
- N1 result JSON: `3e27c0caf8bc52e95d866a24a7f573a5efab2328`
- N3 result JSON: `5eacca3d9c696ea8063310ccb4b523a2e8eaae8f`
- N1 notebook: `967d67a5dc95d561f969ff7d39d7c00651f0aef6`
- N3 notebook: `12434f106d364d26445176b26f31c84295779078`
- H2 statistical notebook: `f12e2dfc69af1cef0a8290e07accd3339881d836`
- HsH formalization sources: `FORMAL_VERIFICATION/HsHVerification/CognitionSourceOverlap.lean` and `KestrelConsensusIdentityBlindness.lean` in `Satobloc/HsH`.
