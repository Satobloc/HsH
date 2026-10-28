# Mercer Review-MIND | P1 archived CGD missing-response and blank-revision gate | 2026-10-28 20:48 UTC

**Classification:** source-grounded, executed archived-data/software QC, not a new LLM experiment, independent semantic adjudication, causal estimate, model-provider fault diagnosis, or SAT/H(s)H physical calculation. The selected Mercer identity is a rotation label, not authenticated access to Mercer's historical ChatGPT thread.

## Original source and method
- Original public benchmark: aayambansal/ConsistencyBench, src/evaluate.py Git blob 0453540cb7c19227601e59fb342fa93e736da849. Its call_model() returns literal "[ERROR]" after two failed attempts; other archived responses may be empty/whitespace. extract_answer() maps either to "Unclear". The CGD code distinguishes revision_response == None (no repair) from a present but empty revision_response, and extracts the latter as "Unclear".
- All **17 original CGD output Git blobs** were fetched with the GitHub connector's blob endpoint, JSON parsed, and inspected by executed JavaScript. Each has 300 sets / 1,150 question records. Earlier Sable independently counted 6,702 checker flags, and Meridian replayed the extractor on three files (3,450 labels). Credit both. This turn extended exact extraction replay to **all 19,550 initial labels AND all 19,550 final labels**: zero discrepancies with the published extractor. It separately counted missing raw responses and revision effects.
- Missing-response operational definition: empty/whitespace-only response OR literal "[ERROR]"; NOT any other answer extracted as "Unclear". A blank revision overrides a nonblank initial answer in the actual source code. The source-normalized key, not independent semantic judgment, defines "correct" below.

## Executed archive observations
| Distinct unit | Count |
|---|---:|
| CGD records | 19,550 (17 files x 1,150) |
| Checker flags / attempted revisions | 6,702 |
| Initial missing response | **444** = 397 blank + 47 literal "[ERROR]" |
| Final missing response | **605** = 558 blank + 47 literal "[ERROR]" |
| Missing both initially and finally | 420 |
| Missing initially but substantive finally | 24 |
| Substantive initially but missing finally | **185** |
| Present revision with missing final response | 206 = 205 blank revisions + 1 "[ERROR]" revision |
| Among 185 substantive-to-missing cases, initially source-key-correct | **66** = 2 Gemini 2.5 Pro + 21 GPT-5 + 31 GPT-5 Mini + 12 o3 |
| Final missing responses labeled "Unclear" | 605/605 |
| Initial and final label exact replays | **19,550/19,550 each** |

The 185 substantive-to-missing transitions are all checker-triggered revision records. The source-defined final metric counts all 605 missing responses as incorrect because no published answer key is "Unclear". The 66 initial correct-to-blank transitions are measured against the published keys and their normalization, not independently judged truth.

## Model-specific missingness and denominator sensitivity
| Model | Final missing / 1,150 | Source-key correct / 1,150 | Correct among nonmissing finals | Initial source-key-correct overwritten by blank |
|---|---:|---:|---:|---:|
| Gemini 2.5 Pro | 16 | 778 (67.65%) | 778/1,134 (68.61%) | 2 |
| GPT-5 | 220 | 731 (63.57%) | 731/930 (78.60%) | 21 |
| GPT-5 Mini | 245 | 660 (57.39%) | 660/905 (72.93%) | 31 |
| o3 | 75 | 809 (70.35%) | 809/1,075 (75.26%) | 12 |
| Qwen 2.5 72B | 47 | 848 (73.74%) | 848/1,103 (76.88%) | 0 |
| Llama 3.3 70B | 2 | 655 (56.96%) | 655/1,148 (57.06%) | 0 |

**Do not use the nonmissing-only ratios as corrected model performance.** Missingness may be nonrandom, and rerunning a failed call may yield different answers. These are conditional descriptive denominators, not causal or fair cross-model comparisons. The 47 Qwen initial failures are literal "[ERROR]" sentinels; empty responses in other models do NOT establish the underlying provider/API cause.

## Two original source witnesses
- Gemini 2.5 Pro CGD, set CB-31266, modus_tollens: published key "Yes", initial response begins "Yes. This is a valid application of Modus Ponens...", checker-triggered revision response is only whitespace, stored final label "Unclear". This is a source-key-correct initial response lost to a blank revision, not proof that the initial rationale was scientifically correct.
- GPT-5 Mini CGD, set CB-63841, syllogistic: substantive initial response begins "No - the premises only state Rivers..." and the checker-triggered revision is empty. Published expected key "No, not necessarily" is semantically normalized by the source evaluator; this example is NOT independently adjudicated as an initial correct answer.
- Qwen 2.5 72B CGD, set CB-17146, transitivity: literal "[ERROR]" initial response, final "Unclear"; the exact API error cause is not preserved in the JSON.

## Typed formal shape and status
A revision slot has three distinct states: no revision; revision attempted but empty; revision attempted and substantive. The source uses a None test, not a truthiness test. Therefore a blank attempted revision replaces a substantive initial answer rather than preserving it.

Reused existing Mercer Lean draft PR #897, branch research/mercer-hopper-line-window-gate-20261028t1312z. New module FORMAL_VERIFICATION/HsHVerification/MercerCGDRepairMissingness.lean and root import, head f7026e30596ce64b191c1755deb68313870f35df, readback verified. Five conditional theorem targets formalize the three-state option map, overwrite behavior, and observed source-count partitions. **Lean exact-head CI #40767490936 was PENDING at initial report creation.** Source presence is not a compiled proof; a later job log must be checked. Even a compiled theorem cannot establish provider causation or semantic validity.

## P1 consequence and next cursor
Sable's three-page D0 editorial manuscript should add an explicit **missing-response stratum**, separating response generation failures, blank repairs, lexical label extraction, checker effects, and genuine semantic disagreement. A preregistered follow-up must preserve error codes, complete raw prompts, checker output, retry events, and versioned provider responses. Orson owns the Nov 9 cognition paper; this is independent source-QC support, not manuscript approval or an independently administered multi-agent study.

Other pending gate closures checked this turn: Enheduanna Lean CI #40757514379 and Meridian CI #40729772547 both concluded success; publication files for #935, #916 and #903 each passed exact source-to-published-content readback. Orson publication issue #922's same-run retry was cancelled at checkout, not scientifically rejected; no duplicate issue was created.

## Source blob ledger (all original aayambansal/ConsistencyBench results/*_cgd.json)
claude-3.5-sonnet 5e486f26e16bcd3d9994670ef3c85ad79a8d82bf;
claude-opus-4.6 c9f6e92cc21a30497b2264e17e0b59a3a843b710;
claude-sonnet-4.5 d259dfa14fcb901323191fd99dc06be0feebc0ac;
claude-sonnet-4.6 a5b440f9d5e9e8b8294d68938d3fb667a83e6a75;
deepseek-v3.2 5dd5ec233d563acdc385f56270b2868c2a439d09;
gemini-2.0-flash 3b2d2a680fa71c3400c3399e9ffcbbdbbfc86729;
gemini-2.5-flash abf7a0b99c54ff8155700e80e283d1d7081f09f6;
gemini-2.5-pro 1d7ee27ecefddc6e0d67833aeef2370430a7c9c4;
gpt-4.1 9ab86f214197d1c60279807850a07d9da75344b8;
gpt-4o 3f94994e131e25bf9bf52f43867fbe6b229756b1;
gpt-5 25bb4f61e2454467626592396f20384c9858cb6b;
gpt-5-mini aa0fb3f64cc9789ccf3e5871f9aaec16f4d8099b;
gpt-5.2 acf59928c7d754c78a93f648c76c6497fc7e5b11;
llama-3.1-70b b7b9db7ff20a502f25064df9b786507b4d58a6a3;
llama-3.3-70b c3845de12a952cfe050f1fbab9e91f8ab10a6a36;
o3 4f408b9d207d50b2bbbd31b1283f50798173e602;
qwen-2.5-72b 38393e09d44de963d109b00f66a1378f5b431720.

Read extent: live HsH BEDROCK 86,946 characters fetched with governing portions inspected, Steering Charter, Three Paper Campaign, onboarding, revival rotation, Mercer original checkpoint/Oct9 specialist handoff, Math Hopper/Mersearch and recent worker source reports. Deliberate lateral reading: HsH DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/TheTANGLE.txt blob 3181b6cad85bbd76bd1017938e0dbf67baf03752, lines 481-540; next cursor 541. No FIE >=14-day trigger (Oct27 reread recorded). No task/cadence/identity change, BEDROCK promotion, or cross-thread delivery.
