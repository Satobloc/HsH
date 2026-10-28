# Orson Vay | P1 cognition: 17-model within-CGD revision balance and disputed-key sensitivity
**Nominal slot:** 2026-10-28 21:12 UTC; `REVROT3-19-20261011:429:s1`. **Current-assistant source-grounded reconstruction**, NOT authenticated historical Orson conversation or fresh LLM administration.

## Sources and execution
- Actual external public dataset: `aayambansal/ConsistencyBench`, archived `results/*_cgd.json`, 17 complete original Git blobs individually retrieved through the connected GitHub source interface and parsed with JavaScript. Exact model/blob manifest and portable Python reproducer: `WORKSPACES/ORSON_VAY/CODE/2026_10_28_cgd_revision_balance_replay.py`. The first nine blobs were retrieved by file path (nine parsed; eight larger path reads truncated); the eight remaining complete blobs were retrieved by their exact Git blob SHA. This is a **secondary analysis of recorded model outputs**, not a new model test. The portable Python script is source-locked but was **not** executed against a local original checkout this run.
- Original evaluator `src/evaluate.py`, Git blob `0453540cb7c19227601e59fb342fa93e736da849`, lines 179-290 and 330-460 read. It records `initial_answer`, `extracted_answer`, `contradiction_detected` and `expected`; the exact `normalize_expected` scoring rule was transcribed. Each source JSON has 300 sets / 1150 questions; each recomputed final-correct and all-correct-set count matched the source's `metrics`. Total **5100 recorded sets / 19,550 question records**.
- Second score definition changes **only** negation category question index 2 (Q3) to the first question's source expected label, following the already documented generator-key problem. This is a **provisional corrected-key sensitivity**, NOT blinded independent semantic adjudication. All other categories retain their source keys.
- Source context: current BEDROCK `4cabda482c48c217614b868a2138409275df9bf7` (first 190 lines), Steering Charter `b9b8de55f8d5add7c42cf80be7c34677ee36305e`, Three Paper Campaign `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`, Orson charter `ee3342c463be0d5970602e58f68bc49f7c25eee1`, onboarding, revival and predecessor handoff `ba5b0f0c734d462c7b7e711390886e8a696ca5fa`. Existing Orson Oct26 three-model revision analysis and Oct28 35-file work checked **before** this 17-model pass.
- Mersearch-first policy checked; all four shared request files already contained existing worker requests. No lane overwritten, no three-repository Mersearch execution claimed. This protected P1 specialist task uses an independently sourced LLM output dataset rather than inventing SAT mathematics.

## Executed 17-model source-scored result
Each transition compares the **same recorded CGD initial label** with its **final label**, so it does not conflate independently called vanilla and CGD trials. All totals are sums of observed archived records, not population estimates.

| Count / transition | Published source key | Provisional corrected negation Q3 key |
|---|---:|---:|
| Initially correct | 12,567 | 12,674 |
| Finally correct | 13,221 | 13,229 |
| Wrong -> correct | 1,158 | 1,122 |
| Correct -> wrong | 504 | 567 |
| **Net correct-label gain** | **+654 / 19,550 = +3.3453 pp** | **+555 / 19,550 = +2.8389 pp** |

The score-key choice alone changes the measured net gain by **99 question-label outcomes**. The original-key 2,010 changed labels partition exactly as **1,158 wrong->correct + 504 correct->wrong + 348 wrong->different-wrong**. Of 6,702 recorded contradiction flags, only 2,010 (29.991%) changed extracted labels; 4,692 flagged cases retained their original extracted label. Flags are not themselves repairs.

| Source category | Recorded questions | Original-key net | Corrected-key net |
|---|---:|---:|---:|
| commonsense_entailment | 2,550 | +146 | +146 |
| negation | 3,400 | **-10** | **-109** |
| modus_tollens | 3,400 | +187 | +187 |
| syllogistic | 3,400 | +113 | +113 |
| transitivity | 3,400 | 0 | 0 |
| contrapositive | 3,400 | +218 | +218 |

**Important negative result:** under the provisional corrected negation key, the CGD revision stage reduces recorded negation-category correct labels by **109/3400 = 3.2059 percentage points**. This is a *within-file descriptive score change*, not a claim that CGD causally harms reasoning, nor that all corrected keys are semantically valid. Transitivity has zero aggregate net despite 207 changed labels across 17 files.

### Per-model net gain sensitivity (out of 1,150 questions each)
| Model | Original key | Corrected key |
|---|---:|---:|
| GPT-4o | +84 | +50 |
| GPT-4.1 | +30 | +12 |
| Gemini 2.5 Pro | +24 | +10 |
| Claude Opus 4.6 | +53 | +73 |
| Claude 3.5 Sonnet | +15 | +15 |
| Claude Sonnet 4.5 | +35 | +35 |
| Claude Sonnet 4.6 | +117 | +133 |
| DeepSeek V3.2 | +59 | +64 |
| Gemini 2.0 Flash | +127 | +96 |
| Gemini 2.5 Flash | +22 | +31 |
| GPT-5 mini | +11 | +8 |
| GPT-5.2 | +40 | +18 |
| GPT-5 | -1 | -5 |
| Llama 3.1 70B | -31 | -59 |
| Llama 3.3 70B | +3 | +11 |
| o3 | +39 | +29 |
| Qwen 2.5 72B | +27 | +34 |

These model labels are those recorded in the external benchmark's files, not independently authenticated vendor trials or version-stable replicates. Do not pool their output records as statistically independent units.

## Accuracy / precision / fidelity
- **Fidelity:** exact original JSON blobs and evaluator scoring semantics; source-provided final counts and set counts reproduced for all 17 files. Existing source-key defects are **not** hidden.
- **Accuracy:** measured agreement with the benchmark's answer keys only; semantic accuracy is unresolved pending blinded item adjudication. Key correction is a transparent sensitivity analysis.
- **Precision:** exact finite counts on this archive. No sampling confidence intervals, causal effect size or prospective generalization claim.
- **Non-identifiability:** final answer labels alone do not identify the NLI checker's triggering pair, semantic contradiction, hidden retries or alternative-model counterfactuals. Initial-to-final transitions show association with the recorded intervention but do not isolate its causal effect.
- **Author provenance:** benchmark authors supplied prompts/keys and recorded model outputs; this current assistant executed the reanalysis. Nathan Direct controls the research method, not the content of these LLM-output counts.

## Formal proof and publication status
- Existing Orson graph gate PR #850 prior CI #40736148614/job #122985695521 **ACTUALLY COMPILED SUCCESS**, Lean 4.34.0, 8954 jobs, five OrsonPromptComponentGate theorems, theorem-specific axiom reports show no axioms. Separate automated axiom audit skipped.
- Added `FORMAL_VERIFICATION/HsHVerification/OrsonRevisionBalance.lean` to the **same draft PR #850** and imported it. Eight arithmetic/conditional propositions; latest new-head CI must be read before claiming compilation. These propositions cannot certify source authenticity, scorer validity or cognition.
- Previous P1 source-component issue-publisher #922 was cancelled during checkout, then retried as **same issue**; committed publication was still absent at this run's first independent check. Status remains **PENDING_UNVERIFIED** until exact readback; do not duplicate the submission. This new report is independently committed to the worker workspace, not claimed to be published by that issue.
- P1 Nov 2 protocol freeze / Nov 9 LaTeX + independent hostile review + PDF/reader remain **OPEN**. This source-backed result is usable in a limited methods paper, not a finished paper.

## Next cursor
1. Verify latest-head Lean PR #850 actual log; if failure, preserve failure and repair own module only.
2. Independent blinded review of negation Q3 and category key semantics; record disagreement rather than force a single key.
3. Freeze P1 observation unit: `(model_file, set_id, question_index, prompt_stage, key_version)`; cluster within sets, shared prompts and model family, and treat the shared NLI checker as a common node.
4. Update existing P1 docket #564, obtain hostile review, and produce a reviewed LaTeX/PDF reader by Nov 9 or explicitly downscope to methods.
5. Unrelated deliberate reading: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/TheTANGLE.txt`, blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 481-520 read; next cursor 521. FIE last Orson reread Oct27, so no >=14-day trigger.

**No** new LLM calls, physical SAT prediction, theory promotion, extra recurrence, scheduler edit, protected signet, original-thread delivery or new conversation identity claimed.

## Verified post-submission closure (2026-10-28)
- **NEW Lean compilation actually completed successfully:** existing Orson draft PR #850, CI run #40770185633, job #123105601820, source branch commit `15bbac410058d4b22f9e2d1e8a56c7f82867f88a` (Actions synthetic merge commit `d7298d6ffabc0dc64341ed6445f72ecc317572cb`). Actual job log confirms Lean 4.34.0, `Built HsHVerification.OrsonRevisionBalance`, **8955 successful build jobs** and all **eight conditional theorems** with theorem-specific axiom reports. Seven depend on `propext`; `net_gain_identity` depends on `propext` and `Quot.sound`. No `sorryAx` in the inspected log; separate automated axiom audit skipped. This is a verified proof of the *encoded arithmetic/conditional statement only*, not empirical source authentication or cognitive causality.
- **Issue publisher #942 independently verified:** committed `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/orson-p1-17cgd-revision-balance-20261028t2112z-s1-001.md` Git blob `54e21387ea086071977e817cc9aec005b2570e36` matched the exact submitted 2,151-character content; publisher commit `ecbc9d5ff8ab0ffd8cfd3afa1bbb2b7014af17ea`. SHA-256 `6b98369786a38a93a9feaa3e56ccc3d44e272c5e2ac105e807f76c4a96bf9fe5`. Status **PUBLISHED_VERIFIED**. Earlier PENDING wording records the original check time.
