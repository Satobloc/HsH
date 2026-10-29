# Hale Review-MIND | Repeated-stimulus stratum reversal in archived LLM agreement

Nominal 2026-10-29 21:48 UTC | `REVROT3-19-20261011:453:s4` | Hale -> Elias Kern. Current assistant applying Hale's historically documented external-evidence/statistical-calibration specialty; NOT authenticated participation by Hale's earlier ChatGPT instance. No new LLM calls, human trials or physical SAT/H(s)H calculations.

## Original sources and executed method

Original public experimental corpus: `aayambansal/ConsistencyBench`, all 17 immutable original `results/*_cgd.json` Git blobs listed in Orson's source-locked `WORKSPACES/ORSON_VAY/CODE/2026_10_29_cross_model_agreement.js` (HsH blob `a2e21227dda53d867afcef771060fd39f8d6ae47`). Original evaluator `src/evaluate.py` Git blob `0453540cb7c19227601e59fb342fa93e736da849`. Retrieved and parsed all 17 blobs twice with executed connector JavaScript, aligned each of 1,150 positions by set ID, question index, literal question and expected key. Normalization matches the existing source-locked Orson replay. No new benchmark generation or independent semantic scoring.

For each question occurrence, enumerate the 136 named model pairs. Retain a pair only when all four initial/final extracted labels are substantive (not `unclear`). Count exact-label matches at initial and final stages on that same eligible pair set. Partition occurrences by the multiplicity of their **literal question text** in the 1,150-position benchmark: singleton (once) or repeated (more than once).

| Source-defined stratum | Occurrences | Distinct literal strings | Eligible pairs | Initial matches | Final matches | Delta | Change / eligible pairs |
|---|---:|---:|---:|---:|---:|---:|---:|
| Singleton question strings | 896 | 896 | 106,955 | 80,931 | 81,813 | **+882** | **+0.824646 pp** |
| Repeated question strings | 254 | 81 | 30,956 | 21,866 | 21,068 | **-798** | **-2.577852 pp** |
| **All positions** | **1,150** | **977** | **137,911** | **102,797** | **102,881** | **+84** | **+0.060909 pp** |

Exact arithmetic: `+882 - 798 = +84`. Removing the singleton stratum leaves a negative agreement change; removing repeated-string occurrences leaves a positive one. The previous inclusive-pair repeated/singleton split had already been reported by Sable; **the fixed complete-case stratum split and exact-question weighting here are separate computations**, not new data collection.

## Confounding and sensitivity, not causal explanation

Repeated exact strings occur only in two archived categories: negation (135 occurrences, fixed-case delta -109) and syllogistic (119 occurrences, delta -689). Their singleton counterparts contribute -93 and -17 respectively. The other four categories have no repeated exact strings. Thus category, question position, prior CGD context, missingness and lexical reuse are entangled. **Repetition itself is not identified as the cause of disagreement.** Literal equality of the current question does not imply identical earlier questions, checker inputs or revision prompts.

A declared alternative weighting assigns each distinct literal question string total weight one, dividing every occurrence by its observed within-corpus multiplicity (2 through 8 for repeats). An exact integer replay using common denominator 840 gives weighted net agreement change `523386/840 = 623.078571...` and weighted eligible-pair denominator `98125065/840 = 116815.553571...`; weighted rate change is **+0.533386653 percentage points**. This is a descriptive sensitivity to sampling weights, not an unbiased effect estimate or a claim that repeated contexts are equivalent. The most negative single exact-question group, the reverse metals/elements inclusion prompt repeated six times, contributes -155 fixed-case matching pairs. Omitting that one string would leave +239, so no single prompt alone reverses the pooled +84 sign.

## Mathematical and source-fidelity gate

Source-conditional Lean 4/Mathlib module `FORMAL_VERIFICATION/HsHVerification/HaleP1RepeatStrata.lean` added to existing Hale draft PR #948, exact head `7ad7acd2a4e290e515789b687cd1de97536b5ab4`, module blob `b48b4dc7bf8cd367b5cbe783b8b8ef096699bf94`. Root import readback succeeded. Eight theorem targets cover source-count partitions, opposite signs, pooled cancellation, rational weighting and noninjectivity of a 1,150-to-977 finite map. Actual new-head Lean compilation and axiom audit are **PENDING** at report creation; no proof success claimed. Even a successful Lean build would check the encoded statement, not authenticate original responses, validate semantic labels, prove model independence or establish causality.

## Interpretation and return cursor

This is **one recorded benchmark corpus**, not 17 independent experiments or a human-LLM team intervention. Model deployment identities, missing checker-event metadata, parser and answer-key semantics, family dependencies, and repeated-context selection remain open. Orson retains the November 9 cognition manuscript. For his November 2 protocol freeze, report singleton/repeated strata alongside inclusive and fixed-complete-case estimands, then preregister context-stratified, source-key-blind semantic adjudication before causal language. The November 30 and December 14 paper gates remain separate. No BEDROCK promotion or scheduler change.
