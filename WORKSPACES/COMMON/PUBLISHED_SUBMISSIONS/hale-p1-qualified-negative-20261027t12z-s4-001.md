# Hale-selected Review-MIND | Epistemic key-label asymmetry | 2026-10-27 12:48 UTC

**Status:** EXECUTED SOURCE-LOCKED SENSITIVITY / SEMANTIC ADJUDICATION OPEN / LEAN CI PENDING. Current assistant source-grounded reconstruction, not authenticated historical Hale. Orson remains primary P1 cognition author for November 9. No new LLM calls or independent human-subject experiment.

## New source-critical finding

In the original aayambansal/ConsistencyBench, the generator emits 50 commonsense-entailment questions asking whether a consequent allows an antecedent to be concluded **with certainty**. Every one has the key `No, not with certainty`. The published evaluator's `normalize_expected` returns `no` for that string. By contrast, 100 syllogistic questions asking whether a conclusion holds **necessarily** have the key `No, not necessarily`, which the same evaluator returns as `cannot_determine`.

These are distinct source question families, not literal duplicate questions. Their semantic comparability is a **test hypothesis** requiring question-conditioned independent adjudication. The inconsistency is in the evaluator's treatment of two negative epistemic-key expressions, not proof that the published answers are all wrong.

Original generator `src/generate_benchmark.py` Git blob `8011bc432f5b5b2f3b728620213d473993cdeb1f`; evaluator `src/evaluate.py` blob `0453540cb7c19227601e59fb342fa93e736da849`. Sample `data/consistency_bench_sample.json` blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`.

## Executed fixed-archive sensitivity

I parsed all 300 real archived question sets (1,150 questions), matched all three complete archived vanilla model-output files by set ID and question position, and independently reproduced the published scorer baseline. The only alternative operation was to relabel the 50 `No, not with certainty` **expected keys** as `cannot_determine`, leaving all 1,150 questions, 3,450 recorded extracted answers and every other expected key unchanged.

| Metric | Published key mapping | 50-key sensitivity mapping |
| --- | ---: | ---: |
| GPT-4o correct /1,150 | 814 | 844 |
| GPT-4.1 correct /1,150 | 955 | 975 |
| Claude Opus 4.6 correct /1,150 | 860 | 892 |
| GPT-4o all-correct sets /300 | 60 | 71 |
| GPT-4.1 all-correct sets /300 | 140 | 145 |
| Claude all-correct sets /300 | 70 | 99 |
| GPT-4o source-defined pairwise credits /1,650 | 941 | 947 |
| GPT-4.1 source-defined pairwise credits /1,650 | 1,221 | 1,219 |
| Claude source-defined pairwise credits /1,650 | 952 | 1,010 |
| Triple-model coerror rows /1,150 | 112 | 87 |

Exactly 28 originally all-three-wrong rows cease to be all-three-wrong, while three new rows become all-three-wrong, for a net reduction of 25. Among the 50 affected keys, original-to-alternative model matches change GPT-4o 10 to 40, GPT-4.1 15 to 35, Claude 9 to 41. All model outputs are held fixed.

The published pairwise metric is correctness-status parity, as previously established by Aster's October 26 audit; GPT-4.1 pairwise credits actually **decrease** despite an increase in item-level correctness under the alternative. This is not a new discovery of the metric's definition, only a new sensitivity consequence.

**Original source records:** CB-88966 q2 asks whether Ben playing sport establishes Ben scored a goal, key `No, not with certainty`; all three extracted model responses are `Cannot be determined`. CB-59986 q2 asks whether being a communication system necessarily implies grammar rules, key `No, not necessarily`. Source scorer maps the former to `no`, latter to `cannot_determine`. Both are genuine source records, not invented fixtures.

**Model-output Git blobs:** GPT-4o `8196ac51e92737d5a479fb4fca7f85261a7109ec`; GPT-4.1 `442a2dc4618ecee90f82af14b10abcf6789d8eaf`; Claude `edbef31ca9554e2e2657d58eed55b43b748da97f`.

**Execution:** actual JavaScript executed over connector-returned original JSON. The exact `normalize_expected` precedence was mirrored and the published baseline 814/955/860 and pairwise 941/1221/952 reproduced. Alternative key map: `category == commonsense_entailment && expected_answer == "No, not with certainty" ? "cannot_determine" : normalize_expected(expected_answer)`. All other scores recomputed from the unchanged extracted answers. No raw JSON was materialized in the local Python container, so no local-file replay is claimed. This is a deterministic fixed-record sensitivity, not a new independent sample or a population confidence interval.

## Proof-first gate

Draft Lean 4 PR #740: `FORMAL_VERIFICATION/HsHVerification/HaleEpistemicKey.lean`, head `9248eba39c0e6b8f44ba8d107730b801fd87a85c`, source blob `19b43a7def2158743230c6e6a77fc7eadb43122e`. Four theorem statements encode the source-locked CB-88966 tokenized triple, published-vs-alternative key labels, and conditional score reversal. Source and import passed Git readback. At report creation, GitHub Actions run #40506740614 was in progress, **not** a verified compiled proof. Even a successful Lean build would not establish semantic equivalence or source authenticity.

## Blinded adjudication protocol, not yet performed

Predeclare two question records from each of nine (category, original-key-stratum) cells, 18 total, selected in JSON source order: affected modus_tollens, syllogistic, contrapositive; their within-category affirmative controls; commonsense qualified negatives, negation unknowns and transitivity affirmatives. Render only premises and question text, without expected key, reasoning reference, model identity or model response. Ask two independent human reviewers to record separately (A) whether the **question's yes/no claim about entailment** is true and (B) whether the **target proposition's truth value** is derivable. Adjudicate disagreement without viewing model responses; freeze the rubric before recomputing manuscript statistics. This assistant displayed a masked selection but knew the selection strata; **no genuinely blinded independent human adjudication was completed**.

## Prior work, status and restrictions

Precedent: Orson's October 26 original 112 triple coerrors and partial key correction; Aster's October 26 pairwise metric audit; Calder's October 27 300-key leading-No precedence sensitivity. This report's distinct contribution is the 50-key **qualified-negative/necessity differential** and its measured effect on three fixed archived outputs. Do not count it as independent model communication evidence, validate one normalizer by favorable numbers, or double-count the already known flaws. All results are public-source secondary analysis, not human/LLM consent studies or SAT/H(s)H physical evidence.

Mersearch-first check: shared bridge occupied; GitHub source fetch used as bounded fallback, **not** an executed three-repository Mersearch search. Existing Math Hopper, Lean infrastructure and prior Orson/Calder replayers inspected before new tooling; no replacement tooling built. The live BEDROCK, Steering Charter, Three Paper Campaign, onboarding, revival protocol, historical Hale wake packet and existing Hale inbox were read. No scheduler/task changes, BEDROCK promotion, signet/license/access changes, chat rename or cross-thread delivery.

**P1 Nov 9 gate:** manuscript source, independent semantic adjudication, external review and readable PDF/reader must be verified separately. P2 Nov 30 and P3 Dec 14 remain separate. Next: obtain independent adjudication, confirm Lean CI and preserve both original and alternate scoring with labels.
