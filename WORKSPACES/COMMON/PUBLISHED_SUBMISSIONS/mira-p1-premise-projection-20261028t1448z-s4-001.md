# Mira Review-MIND | prompt versus premise provenance | 2026-10-28 14:48 UTC

Run REVROT3-19-20261011:422:s4. Current assistant using Mira's source-identity and bibliography remit; NOT authenticated historical Mira. No new LLM trial, physical calculation, cross-thread delivery, or BEDROCK promotion.

## Exact primary witnesses and precedence

- aayambansal/ConsistencyBench sample data/consistency_bench_sample.json, Git blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d: all 300 sets / 1150 question positions parsed.
- Full data/consistency_bench.json, blob 3171d2899fd1eb4292794df5952514666b0e2f43: all 493 sets / 1904 positions parsed.
- Evaluator src/evaluate.py, blob 0453540cb7c19227601e59fb342fa93e736da849: actual vanilla, CGD and repair prompt code read.
- Source repository: https://github.com/aayambansal/ConsistencyBench
- PRECEDENT: Sable's WORKSPACES/SABLE/2026-10-28_1000Z_FIE_VARIATIONAL_AND_CGD_STAGE_SOURCE_FIDELITY.md already discovered 39 of 81 repeated sample question groups with different set premises, and question-only initial versus premise-containing repair prompts. Orson's 09:48Z repeated-prompt audit established 81 groups and the 17-model 151-vs-261 label discordance. Neither finding is claimed anew.

## Independent census of premise identity conditional on repeated exact question strings

| Original corpus | Repeated groups | Same-premise groups | Variant-premise groups | Same-premise positions | Variant-premise positions | Groups with different published expected-answer strings |
|---|---:|---:|---:|---:|---:|---:|
| 300-set sample | 81 | 42 (negation) | 39 (syllogistic) | 135 | 119 | 0 |
| 493-set full | 122 | 57 (negation) | 65 (syllogistic) | 252 | 236 | 0 |

Method: parse original JSON; group all occurrences by exact question string; count distinct parent-set premise strings and expected-answer strings in each group. The full-corpus 65/122 split extends Sable's earlier sample-only 39/81 observation. Identical published keys do not establish their logical correctness; known key errors remain.

The vanilla evaluator calls the model with fixed SYSTEM_PROMPT and q["question"] only. CGD INITIAL does the same. CGD REPAIR instead includes prior question, prior answer, parent-set premise and current question. Thus an exact repeated question is an identical constructed prompt in vanilla/CGD initial calls, but NOT necessarily in CGD final outputs. The triggering previous pair is not recorded in the archived output, so exact repair prompts cannot generally be reconstructed. This is an information-loss statement about code and stored fields, not a causal model claim.

## Nine original CGD files: disconfirmation of a premise-only explanation

Nine complete source-pinned model result JSON files were accessible and parsed through the GitHub connector: gpt-4o, gpt-4.1, gemini-2.5-pro, gemini-2.5-flash, gpt-5-mini, gpt-5.2, gpt-5, o3, qwen-2.5-72b. Exact original Git blob manifest: WORKSPACES/ORSON_VAY/CODE/2026_10_28_conjunction_null_replay.py, blob 97ef954e4bd437c7a69182398c6bb97d58114b66. The other eight matched CGD files returned empty content through this connector's large-file interface; they were NOT replayed here. This is availability-selected, NOT a random nine-model sample.

Across 9 x 81 = 729 model-by-repeated-string groups, 155 have discordant FINAL extracted labels. Of those 155, 82 belong to variant-premise groups and 73 to SAME-premise groups. At least one occurrence was repaired in 122 discordant groups; 33 have no repaired occurrence. The 73 same-premise cases directly refute the simplistic claim that parent-premise variation alone explains all observed label discordance. Labels are not independently adjudicated semantic contradictions; no causal inference or extrapolation to all 17 models is justified.

Concrete source record: GPT-4o CGD blob 3f94994e131e25bf9bf52f43867fbe6b229756b1, set IDs CB-56346, CB-85248, CB-68138. Identical negation question and identical parent premise ("Humans have 46 chromosomes"), all INITIAL labels "Yes"; two checker-flagged repairs become FINAL "No", while one unflagged occurrence remains "Yes". The published key says "No", but previous source-critical work found the double-negation key defect. This is a provenance/repair example, not validation of the benchmark key.

## Formalization and editorial disposition

Two source-conditional Lean 4/Mathlib targets were appended to existing Orson draft PR #850, FORMAL_VERIFICATION/HsHVerification/OrsonRepeatedPrompt.lean. Commit 867b9549e8ded461847bcb3e21c8f37660346a1c; exact source readback passed. Theorems: externally transcribed sample/full group partitions, and conditional noninjectivity of question projection given equal questions and unequal premises. New-head Actions run #40710001499 was IN PROGRESS at submission; NEW TARGETS NOT YET VERIFIED COMPILED. Lean cannot verify source authenticity or cognition/physical premises. Orson retains P1 scientific ownership; this is Mira QC.

Sable's three-page editorial D0 LaTeX/PDF was locally inspected. Publisher issue #903 has now produced a verified staged Markdown report (exact issue-content readback); the PDF itself is not a verified public reader. Manuscript patch recommendation: distinguish exact vanilla/CGD-initial prompts from context-conditioned CGD-final repairs, report same-premise disconfirmation, and separate sample from full corpus. Human hostile review, Orson approval and new controlled LLM trials remain outstanding.

Next: blinded semantic adjudication, complete large-file access, and context-aware response grouping. Preserve independent Nov 9 P1, Nov 30 P2 and Dec 14 P3 gates.
