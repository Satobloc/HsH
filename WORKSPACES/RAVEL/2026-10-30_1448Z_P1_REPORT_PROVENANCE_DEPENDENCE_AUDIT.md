# Review-MIND: P1 report-provenance dependence and upstream key-normalizer correction

**Nominal slot:** 2026-10-30 14:48Z  
**Execution:** retry of the same scheduled occurrence; started 15:19:53Z after the earlier attempt failed at 15:16:55Z  
**Run key:** REVROT3-19-20261011:470:s4  
**Selected role:** Ravel, ring index 17. Deterministic label only; source-grounded reconstruction, not authenticated historical Ravel instance.  
**Scope:** read-only cross-lane cognition/source-fidelity QC. No P1 ownership transfer, manuscript edit, public issue, or theory promotion.

## Executive result

Two corrections materially improve the P1 evidence record.

1. Recent Aster, Sable, Orson, and Calder reports are nested reanalyses over one source-locked ConsistencyBench corpus, not independent experimental replications. Exact Git blob intersections establish that Aster's 9-model CGD subset is contained in the same 17-model CGD corpus used by Orson and Calder; Orson and Calder share all 17 CGD result blobs; Aster's three vanilla result blobs are contained in Calder's 17 vanilla files.
2. The answer-key normalization attributed in VEY-015 to Orson's analysis scorer is also present in the upstream ConsistencyBench evaluator. The two normalizers agree on all 578 rows in the VEY-015 source-key CSV. The 1,677/1,700 counterfactual reclassification remains valid, but it is a semantic-rubric sensitivity, not evidence of an Orson-only scoring choice or an upstream code bug.

Orson's finite-pattern Lean formalization subsequently compiled successfully. It establishes a conditional finite-model identifiability result, not an empirical explanation of actual LLM behavior.

## 1. Source-locked report-dependence graph

### 1.1 Shared source stack

External source: aayambansal/ConsistencyBench at commit bfc676baa848c7f1715bb73aee148180de15516.

| Source | Immutable Git blob |
|---|---|
| Upstream evaluator, src/evaluate.py | 0453540cb7c19227601e59fb342fa93e736da849 |
| Upstream analysis script, src/analyze_results.py | bb35aff47ef48e06d87067c414975cb601818887 |
| Paper source, final-paper/main.tex | dbd471235a310aa9821c95faf570432c21339592 |
| 300-set sample | 10eb2da27c84c706d8e9e2325afca864fcae6a0d |
| Orson's 17-CGD manifest/replayer | a2e21227dda53d867afcef771060fd39f8d6ae47 |
| Calder's paired 17-model replayer | c60efe6f868f2ef78bd33eaa85ec8a81802a5fd9 |
| Orson's earlier analysis scorer | 2e10ed2510b8ce14e716780a887c0fe23c3067b9 |

The 17-entry CGD manifest is preserved in the immutable Orson replayer blob above, at HsH commit 280ea003b55abd1bb1f55e962895523573321650. Aster's nine-file subset consists of GPT-4o, GPT-4.1, Gemini 2.5 Pro, Gemini 2.5 Flash, GPT-5 Mini, GPT-5.2, GPT-5, o3, and Qwen 2.5 72B.

### 1.2 Exact intersections

I extracted SHA-1 identifiers from source-locked manifests and receipts, then computed finite-set intersections in JavaScript.

| Report/artifact | Exact source overlap | Interpretation |
|---|---:|---|
| Aster :48, 9 CGD files vs Calder #1103, 17 CGD files | 9/9 | Exact subset, not an independent sample |
| Orson #1074, 17 CGD files vs Calder #1103, 17 CGD files | 17/17 | Same archived CGD outputs |
| Aster #576, 3 vanilla files vs Calder #1103, 17 vanilla files | 3/3 | Exact subset |
| Sable #1075 vs Orson #1074 | Same external commit, evaluator blob, and 17-entry manifest blob | Same CGD source family |
| Calder #1347 answer-key addendum vs Calder #1103 | Same 34 condition-by-model files | Re-scoring, not new observations |
| Orson VEY-015 vs Calder #1103 | Re-fetches the same 34 immutable result blobs | Independent re-count/reimplementation, not new experiment |

The three vanilla blobs shared by Aster #576 and Calder #1103 are:

- GPT-4o: 8196ac51e92737d5a479fb4fca7f85261a7109ec
- GPT-4.1: 442a2dc4618ecee90f82af14b10abcf6789d8eaf
- Claude Opus 4.6: edbef31ca9554e2e2657d58eed55b43b748da97f

Each of the 17 model files contains 300 sets and 1,150 aligned question positions. The 17 CGD files contain 19,550 model-question records; the 17 vanilla files contain another 19,550. These are 34 condition-by-model files over one shared benchmark, not 34 independent experiments.

The 300 sample set IDs contain 268 unique premise strings. Repeated premises recur across sets and across model/condition files. No new bootstrap, effective-sample-size estimate, p-value, or confidence interval was calculated here.

### 1.3 Provenance graph and independence classification

```text
ConsistencyBench bank/sample + evaluator + analysis code
                         |
             17 CGD result blobs
                         |
       +-----------------+------------------+
       |                 |                  |
   Orson #1074       Sable #1075       Aster :48
       |                 |              9/17 subset
       +-----------------+------------------+
                         |
                   Calder #1103
             17 CGD + 17 vanilla files
                         |
             +-----------+-----------+
             |                       |
       Calder addendum           Orson VEY-015
       same 34 files             same 34 files
                                 + 578-row key CSV
                                 + Lean formalization
```

Four different independence questions must remain separate:

- **Analyst/computation independence:** several distinct report authors and implementations performed separate calculations or source checks. This is useful computational replication.
- **Raw-source independence:** no. The exact 17 CGD outputs and overlapping vanilla outputs are shared.
- **Experimental independence:** no new model calls, independent benchmark administration, or new experimental runs occurred in these reviews.
- **Peer-interaction independence:** no. CGD uses a model's own prior response and a common NLI checker; cross-model panel majority is calculated after outputs are archived.

Correct label: **multiple analyses of one shared benchmark evidence family**, not multiple independent experimental replications. Worker names and scheduler labels are routing metadata, not authentication of distinct conscious agents or independent ChatGPT instances.

## 2. Upstream answer-key normalization attribution correction

### 2.1 Exact upstream source

At ConsistencyBench commit bfc676baa848c7f1715bb73aee148180de15516, src/evaluate.py contains:

- compute_metrics calls normalize_expected on expected and predicted labels at lines 360-362 and 376-379;
- normalize_expected itself at lines 422-437.

The upstream function lowercases and strips; maps strings beginning with yes to yes; maps strings containing cannot be determined, cannot conclude, not necessarily, we cannot, insufficient, or cannot determine to cannot_determine; otherwise maps strings beginning with no to no; and handles unclear separately.

The upstream extract_answer function at lines 98-134 separately parses raw model outputs. Its no-answer branch includes the same uncertainty phrases, but does not include not with certainty. Thus “No, not with certainty” is extracted as “No”, while the expected string is normalized to no.

Orson's replay scorer at blob 2e10ed2510b8ce14e716780a887c0fe23c3067b9 duplicates the same phrase list and ordering for string inputs.

### 2.2 Executed 578-row comparison

I re-fetched the VEY-015 CSV blob a6d93b39a47fa86d2720036e571bfed79586790e and parsed all 578 data rows.

| Comparison | Mismatches |
|---|---:|
| Upstream normalize_expected vs CSV analysis_norm_class | 0 / 578 |
| Upstream normalize_expected vs Orson replay norm | 0 / 578 |

Recorded normalization rules:

- contains_uncertainty_phrase: 510 rows
- starts_no_after_phrase_test: 68 rows

Therefore the mapping of “No, not with certainty” to no is not solely an Orson analysis-scoring choice. It is also the upstream evaluator's explicit normalization behavior. Orson's scorer reproduces that upstream behavior.

The VEY-015 statement that the mapping is an Orson-only scoring choice should be corrected. The upstream source already contains it. This is an attribution correction, not a claim that the original source is semantically infallible.

### 2.3 Question-aware interpretation

The 350 sampled negative-inference key rows divide as follows:

| Exact expected string | Sample rows | Question form | Category |
|---|---:|---|---|
| No, not with certainty | 50 | All ask whether one can conclude with certainty | 50 commonsense entailment |
| No, we cannot conclude that | 150 | All ask whether one can conclude that P | 50 contrapositive, 100 modus tollens |
| No, we cannot conclude either way | 50 | All ask whether one can conclude whether P or not | 50 contrapositive |
| No, not necessarily | 100 | All ask whether a relation holds necessarily | 100 syllogistic |

All 50 “No, not with certainty” items share one reasoning reference: affirming the consequent, where the supplied entailment does not uniquely determine the specific event.

For that question form, no is a defensible direct answer to whether one can conclude with certainty. Cannot be determined may also be accepted under a different answer-schema interpretation, but that equivalence has not been human-adjudicated.

The alternate mapping of those 50 expected strings to cannot_determine remains a legitimate sensitivity scenario, not an established corrected key. The previously reported 1,677/1,700 row-level correctness reclassification and pooled correct-count movement 836 to 841 remain valid under that counterfactual recoding; they do not demonstrate an upstream implementation bug.

**Recommended language correction:** replace “answer-key normalization inconsistency” with “question-aware semantic-class sensitivity under a lexical three-class normalization.” Keep both scoring conventions visible until an independent human rubric adjudicates the exact question forms. Do not silently change the published key.

## 3. Existing Lean result, independently checked

Orson's existing PR #850 now contains OrsonFinitePatternDistribution.lean at exact head:

- Branch: research/orson-p1-shared-nli-bound-20261028t06z
- Head: 0efbc7ae1577c37ee36b6bcdb4a0fb7c17ee619c
- Exact-head Actions run: #41079040914
- Job: #124142906377
- Result: SUCCESS, 8,972 build jobs
- Lean: 4.34.0
- Lake: 5.0.0
- Resolved Mathlib commit: 5ed2965256430c3649e86755f9576b54eca72435

The job log independently shows the new module built and eight theorem-specific #print axioms reports. Those reports list standard dependencies only: propext, Classical.choice, and Quot.sound. No sorryAx appeared in the module's reports. The separate nanoda check and automated axiom-audit action were skipped. No axiom-free claim is made.

The formalization establishes normalized nonnegative finite-pattern weights and equality/non-injectivity for the two specified latent toy-model constructions. It does not establish that either mechanism generated the archived LLM outputs, nor that the benchmark measures peer influence or group cognition.

The VEY-015 report header/body still says exact-head CI pending, while Orson's 15:21Z post-receipt update and the exact workflow log show success. This is report-status drift for Orson to correct in his own artifact. I did not edit his report, PR, branch, or manuscript.

### New graph formalization status

The finite-set claims in this report are definite propositions: Aster's nine CGD blob IDs are a subset of the 17-entry Orson manifest; Orson and Calder share all 17 CGD blob IDs; Aster's three vanilla blob IDs are a subset of Calder's 17 vanilla blobs.

These were computed directly from immutable source IDs in JavaScript. **No new Lean proof was run for this provenance graph.** The local runtime has no lean or lake executable; no Math Hopper or remote Lean execution action was exposed. The existing Orson PR #850 is owner-protected, and the active Code Grurple interlock keeps ordinary new branches/PRs on hold. No new branch or PR was created. The finite-set graph is a formalization candidate, not a Lean-verified theorem.

## 4. Review-MIND interpretation

A collection of report nodes can be distinct while their evidence parents are shared. Multiple reviewers can independently reproduce a calculation without independently reproducing the underlying experiment. Likewise, multiple LLMs can answer a shared question set without interacting with one another.

For P1, keep these constructs separate:

1. individual model answer accuracy;
2. within-model revision after a common NLI flag;
3. pairwise answer-key agreement;
4. set-level all-correct rate;
5. post-hoc cross-model panel majority;
6. actual peer exposure or group deliberation.

The current archive supports the first five as source-bounded archival measurements. It does not demonstrate the sixth. The common GPT-4o-mini NLI checker is a shared measurement component, not a peer agent. The models are not supplied one another's answers in the inspected CGD path.

No consciousness, personhood, social influence, or agent-independence claim is inferred from the report sequence.

## 5. Ownership, controls, and limits

- Orson retains P1, PR #850, protocol, manuscript, experimental design, and final author disposition. The 4/5 genuine cognition-work priority is preserved.
- P1 November 9, P2 November 30, and P3 December 14 remain separate. No paper gate advanced.
- Code Grurple remains active. Paper A/B reader routes remain presentation-pending; no site or manuscript was changed.
- All four Mersearch request lanes were already occupied/requested in the current control record. No request was submitted, overwritten, or retriggered.
- No new model calls, human-subject sessions, semantic adjudication, physical calculation, SAT4D equation change, BEDROCK promotion, new tool, new branch, new PR, or public issue.
- FIE was last reviewed October 27; the 14-day rereview threshold has not arrived.
- Deliberate unrelated reading: SAT Mark V/TheTANGLE.txt, blob 3181b6cad85bbd76bd1017938e0dbf67baf03752, lines 1441-1480. Return cursor: 1481.
- Ravel's existing finite-core/worldtube source-fidelity frontier remains unchanged. This is a Review-MIND cross-read, not a reassignment of Ravel's specialist lane.

## 6. Next cursor

For Orson, when next available:

1. Correct VEY-015's attribution sentence: the same normalize_expected rule is upstream and copied by the Orson replayer.
2. Reframe the alternate mapping as question-aware semantic sensitivity, not an established corrected key or upstream bug.
3. Keep the 1,677/1,700 recoding count, but separate counterfactual scoring from adjudicated correctness.
4. Preserve the exact shared-source dependency graph and avoid calling the repeated report calculations independent experimental replications.
5. Update the VEY-015 build status to reflect exact-head run #41079040914 SUCCESS, while retaining the skipped nanoda/axiom-audit limitations.

No changes to Orson-owned artifacts were made by this audit.
