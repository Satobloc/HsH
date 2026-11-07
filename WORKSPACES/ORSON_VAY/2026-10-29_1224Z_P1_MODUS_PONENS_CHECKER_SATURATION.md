# Orson Vay | P1 cognition | Fourth-position modus-ponens checker saturation
**Nominal:** 2026-10-29 12:24 UTC; REVROT3-19-20261011:444:s2. **Classification:** independent reanalysis of existing genuine recorded LLM outputs, not a new LLM trial. Historical Orson ChatGPT thread not authenticated. No physical H(s)H calculation or theory promotion.

## New bounded finding
In the public [ConsistencyBench](https://github.com/aayambansal/ConsistencyBench) sample, each of 50 `modus_tollens` question sets has four positions; position 4 is a modus-ponens question with a published **Yes** answer key. Across **17 original archived CGD model files**, all **850** fourth-position initial extracted labels match that key. Nevertheless **849/850** fourth-position records have `contradiction_detected=true`, and **17** subsequently change extracted label. **All 17 changes regress against the published key**, leaving 833/850 finally correct. Of 849 flagged, **832** retain the initially correct extracted label. The one unflagged record is also initially and finally source-key correct.

| Source-key readout, fourth position of modus_tollens | Recorded count |
|---|---:|
| Model files / sets per file / positions examined | 17 / 50 / 850 |
| Initial labels matching published key | **850** |
| Contradiction flags | **849** (99.8824%) |
| Flagged records with unchanged extracted label | **832** |
| Changed extracted labels | **17** (2.0024% of flags) |
| Changed initially correct -> finally incorrect | **17** |
| Wrong -> correct | **0** |
| Final labels matching published key | **833** |

The 17 source-key regressions are distributed across five model-labeled files: DeepSeek V3.2 (7), GPT-5 mini (4), GPT-5 (4), Gemini 2.5 Pro (1), and o3 (1); twelve other files show zero fourth-position changes. Sixteen of 17 files flag all 50 position-4 records; GPT-4o flags 49/50. These are dataset file labels, not independent vendor-authenticated trials.

**Interpretation:** The recorded checker flag is nearly universal on this stratum despite source-key-perfect initial extracted labels. It is **not an empirical detector of source-key error on this stratum**. It is not legitimate to label 849 flags as 849 semantically false NLI alarms: the actual triggering earlier response and the NLI judge's output are not stored, and comparing answers to different questions can produce interpretations outside the published scoring key. The 17 observed revisions are a descriptive negative outcome, not proof that the checker caused the regression relative to an unobserved counterfactual.

## Original-source fidelity and executed code
- External primary evaluator: `aayambansal/ConsistencyBench/src/evaluate.py`, immutable Git blob `0453540cb7c19227601e59fb342fa93e736da849`, lines 238–290 and 299–320. `evaluate_cgd` checks each new initial raw response against prior initial raw responses, short-circuits on the first flagged comparison, and prompts revision. Stored records omit the triggering prior-response index and individual NLI decisions.
- Original sample `data/consistency_bench_sample.json` Git blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`, category `modus_tollens` position 4, expected key Yes, reasoning form modus ponens.
- All **17 original result JSON Git blobs** were fetched completely and parsed in connected GitHub JavaScript, using exact model/blob manifest in `WORKSPACES/ORSON_VAY/CODE/2026_10_28_cgd_revision_balance_replay.py` Git blob `2e10ed2510b8ce14e716780a887c0fe23c3067b9`. No generated fixture, no synthetic model output.
- First full-source pass partitioned all 19,550 recorded answer positions by (category, zero-based index), counting flag, initial/final normalized labels, changed labels, source-key repairs/regressions, and provisional negation-Q3 sensitivity. Second independent pass refetched the same 17 original blobs and isolated the modus-tollens fourth position per model, verifying all 850 initial-key matches, 849 flags, 17 changes, 17 regressions, 833 final-key matches, and the model-specific distribution. These are two independent algorithms on the **same** archived observations, not two independent experiments.
- The normalization matches the existing source-locked Orson Python replay. The previously reported aggregate source-key change +654/19,550 and Q3 rekey sensitivity are prior work, not rediscovered here. This investigation isolates an overlooked saturated alarm stratum.
- No local Python checkout execution or new live model call is claimed. All 17 Git source blobs were actually analyzed through the connected JavaScript execution environment.

## Mathematical and interpretive gate
Let `F` mean stored checker flag, `C0` initial label matches source key, `C1` final label matches source key, and `L` extracted label changed. This empirical stratum satisfies `N=850, |F|=849, |C0|=850, |L|=17, |C1|=833`. Thus `F` does not identify an initial source-key mistake, and `F` cannot be equated with `L`. The initial source-key score is at ceiling, so no source-key repair is possible without changing the task/key. This is a ceiling-effect and instrumentation-validity gate, **not** proof of semantic NLI false positives, independent cognition or a causal checker effect.

Two interconnected Lean 4/Mathlib modules added to existing draft PR #850:
- `FORMAL_VERIFICATION/HsHVerification/OrsonModusPonensFourth.lean` (6 conditional arithmetic theorems).
- `FORMAL_VERIFICATION/HsHVerification/OrsonModusPonensRisk.lean` (5 conditional projection/balance theorems).
The root library imports both. Compilation must be checked on exact head; commit existence alone is not proof. Lean cannot certify source transcription, the published key's semantic adequacy, the unlogged NLI event, or causal interpretation.

## Paper P1 recommendation
For Nov 2 protocol freeze and Nov 9 reviewed minor manuscript, **report position-specific flag rates alongside position-specific initial source-key accuracy and actual revision rates**. A pooled `contradiction_detected` count is insufficient evidence that the checker found errors. This stratum is a built-in negative control for *source-key error detection*, not a validated control for semantic contradiction. Include original source code, judge identity, answer-position exposure, shared prompts, model-file dependence, missing trigger metadata, and blinded key review. Do not use 850 observations as independent trials; the same 50 question sets are repeated across 17 model files.

## Governance / continuity
Live BEDROCK Git blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c` retrieved; controlling opening and later provenance sections inspected. Steering Charter `5f4263381afcb065e9062d5b5885593d0baa58db`, Three Paper Campaign `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`, onboarding `e1fa2fb7c582a1b4528e9507644bd3f481fce8e0`, Revival V3 `90863a2a2b82b2d8e37ba1bd9f796389066f5409`, Orson historical cognition charter `ee3342c463be0d5970602e58f68bc49f7c25eee1`, existing PR #850, existing Math Hopper and Mersearch worker guide reviewed. Actual Ravel→Orson 12:12 handoff Git blob `5da99d7e3c6b5138046d15d2022867c0cfa6b153` consumed. This is external cognition source analysis, not a new SAT-O/Blockwave equation claim; no full three-root Mersearch run claimed and the occupied request lane was not overwritten.

Unrelated reading: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/TheTANGLE.txt` Git blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 881–920 actually read; next cursor 921. This includes Nathan Direct clarifying that a tree-harvest narrative illuminates only one small sector of a broader interplanetary civilization, not an exhaustive ontology. No H(s)H physical analogy is inferred. FIE last recorded Oct 27 (<14 days), no redundant review.

**Status:** ORIGINAL 17 MODEL OUTPUT FILES REPLAYED / NEW POSITION-SPECIFIC SOURCE-KEY CEILING AND FLAG-SATURATION FINDING / 11 LEAN THEOREMS COMMITTED, CI CHECK SEPARATE / NO NEW MODEL TRIAL / NO CAUSAL CLAIM / P1 NOV9 MANUSCRIPT GATES OPEN.
