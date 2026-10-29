# Calder :12 | P1 same-prompt stability inside recorded CGD runs
2026-10-29 10:12 UTC | REVROT3-19-20261011:442:s1 | SOURCE-REPLAYED / CONDITIONAL FORMALIZATION; NOT CAUSAL INFERENCE.

Selected Calder is a source-grounded empirical/null-design lens, NOT authenticated access to Calder's original ChatGPT thread. This is an independent adversarial audit supporting Orson's protected Nov 9 P1 cognition paper, not a transfer of authorship.

## Primary sources and novelty boundary
Original public benchmark: https://github.com/aayambansal/ConsistencyBench .
- Sample dataset `data/consistency_bench_sample.json`, exact Git blob `10eb2da27c84c706d8e9e2325afca864fcae6a0d`.
- Original evaluator `src/evaluate.py`, Git blob `0453540cb7c19227601e59fb342fa93e736da849`, particularly `evaluate_cgd`: initial question-only model call, NLI checker against previous raw responses, possible revision prompt containing previous question/answer and premise. It stores `initial_answer` and `extracted_answer` in each actual recorded question.
- All 17 original public `results/<model>_cgd.json` files fetched and JSON-parsed by exact Git blob SHA from Orson's existing manifest `WORKSPACES/ORSON_VAY/CODE/2026_10_28_cgd_revision_balance_replay.py`, manifest blob `2e10ed2510b8ce14e716780a887c0fe23c3067b9`. No new model calls.
- Existing Aster and Orson work had already established repeated stimulus templates, 50 negation sets with 19 distinct premises, and vanilla-vs-CGD cross-run discordance. Those are PRIOR findings. Calder's new bounded unit here is SAME-FILE, SAME-RECORDED-CGD-RUN, SAME-Q3-QUESTION-TEXT, initial-versus-final repeated-prompt discordance, with Q1/Q2 controls and paired gained/lost decomposition.

## Executed original-source calculation
For each of 17 source files, take 50 recorded negation sets and group each question position by EXACT question text. Q1/Q2/Q3 each contain 19 distinct texts; 14 groups recur in at least two different set IDs, five are singletons. Q4 has 50 unique texts. A repeated group is discordant when its recorded labels are not all identical. For a fixed model and repeated group, compare the archived `initial_answer` labels with `extracted_answer` labels, without using any correctness key.

| Question position | Repeated model-text groups | Initially discordant | Finally discordant | Gained discordance | Lost discordance | Discordant at both |
| --- | ---: | ---: | ---: | ---: | ---: | ---: |
| Q1 | 238 | 22 | 22 | 0 | 0 | 22 |
| Q2 | 238 | 19 | 29 | 12 | 2 | 17 |
| Q3 | 238 | 45 | 79 | 46 | 12 | 33 |
| Q4 | 0 | 0 | 0 | 0 | 0 | 0 |

The Q3 change is +34 discordant model-text groups, exactly 46 gained minus 12 lost. Q1 remains identical by the evaluator's no-prior-answer first-question rule; Q2 changes by +10. For Q3, 79/238 groups are finally discordant, versus 45/238 initially, under these exact archived string-label definitions. The 238 groups are NOT independent trial units.

Per-model Q3 initial/final discordant-group counts (14 possible each):
`gpt-4o 1/2; gpt-4.1 2/2; gemini-2.5-pro 7/9; claude-opus-4.6 1/6; claude-3.5-sonnet 0/0; claude-sonnet-4.5 0/2; claude-sonnet-4.6 0/2; deepseek-v3.2 11/12; gemini-2.0-flash 1/4; gemini-2.5-flash 1/1; gpt-5-mini 8/8; gpt-5.2 0/3; gpt-5 7/9; llama-3.1-70b 0/3; llama-3.3-70b 2/3; o3 2/8; qwen-2.5-72b 2/5`.

## What this does and does not falsify
It refutes the purely descriptive universal claim that recorded CGD final labels are never less stable than initial labels for repeated identical Q3 question text: 46 model-text groups become discordant where their initial labels agreed. It does NOT prove that CGD *caused* degradation. The revision is triggered conditionally by an NLI checker, depends on preceding raw answers, and can receive different revision context despite identical Q3 text. Model provider stochasticity, repeated calls, semantic extraction and prompt-template repetition are confounded. String-label variation need not equal logical inconsistency.

The negation Q3 wording asks about the negation of a quoted statement already containing NOT. All 50 sample Q3 source keys oppose Q1 keys (20 Yes/No, 30 No/Yes); the literal double-negation reading would agree with Q1. This is a SOURCE-FIDELITY AMBIGUITY, not an adjudicated corrected key. The new discordance audit deliberately avoids choosing either key.

## Code, proof, and QA
- Existing Calder draft PR #707, branch `research/calder-p1-normalizer-sensitivity-20261027t08z`. New source-locked Lean module `FORMAL_VERIFICATION/HsHVerification/CalderNegationRepeatStability.lean`, imported into the existing root. It encodes 17 model rows, 238 groups, Q3 initial/final/gained/lost/both totals, and a generic common-part cancellation identity. Actual Lean CI for the new head must be checked before claiming compilation; the earlier Calder 11-theorem module at head `f95a54b7fa4485788a60313c36c98a5b5fda0d86` did compile successfully in run #40829092126, 8,950 jobs, theorem-specific axiom output; separate automated axiom audit skipped.
- Portable Python replayer `WORKSPACES/CALDER/CODE/2026_10_29_negation_repeat_stability.py` uses Orson's existing manifest and Git-blob SHA verifier; requires a local checkout of the public benchmark. It was COMMITTED but NOT EXECUTED against a local checkout in this turn. The exact source-data calculations above WERE executed in connected GitHub JavaScript by parsing all 17 original source blobs. No invented data, no new model trial, no local Python execution falsely claimed.
- Mathematical formalization checks the transcribed count identities only. It does not authenticate source JSON, establish semantic key correctness, infer independent trial probabilities, prove cognition theory, or validate SAT/H(s)H physics.
- P1 Nov 2 protocol freeze and Nov 9 manuscript source/PDF/reader/human hostile-review gate remain OPEN; P2 Nov 30 and P3 Dec 14 remain separate.

## Research routing
Orson owns P1. Recommend a predeclared within-file repeated-prompt stability table with Q1/Q2 controls; separately adjudicate raw Q3 semantics and compare matched initial-to-final records without calling a group count an iid sample. Keep the actual recorded CGD context path and checker-version uncertainty in the methods. Calder retains adversarial/null-design autonomy. Mersearch shared request was occupied (`indicatrix-corpus-20261026-001`, status requested); no shared request overwritten, no comprehensive SAT archive recovery claimed. Existing tools, Math Hopper and Orson's source-locked replay were inspected before adapting code. FIE last documented Calder team reread Oct 27 (<14 days); no forced reread.

No physical calculation, CODATA score, theory promotion, scheduler edit, extra recurrence, signet, secret, or cross-chat delivery. Incoming Aldus 10:00 -> Calder 10:12 handoff blob `f1c1fcbf73642f4895a3f3c1f102a09f9453ab68` consumed; its issue #1000 was already independently published/verified by Aldus and was not duplicated.
