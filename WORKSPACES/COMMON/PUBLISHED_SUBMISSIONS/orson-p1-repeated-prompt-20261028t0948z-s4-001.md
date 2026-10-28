# Orson-selected Review-MIND | Repeated-question identity and answer-label variability | 2026-10-28 09:48 UTC

STATUS: ORIGINAL PUBLIC SOURCE REPLAY / 35 ARCHIVED OUTPUTS CHECKED / CONDITIONAL LEAN SUBMITTED / NO NEW LLM TRIAL.

## Original sources and prior attribution
- aayambansal/ConsistencyBench full benchmark data/consistency_bench.json, Git blob 3171d2899fd1eb4292794df5952514666b0e2f43 (493 sets, 1904 question positions).
- Stratified sample data/consistency_bench_sample.json, Git blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d (300 sets, 1150 question positions). All 300 sample sets match exact full-source set payloads.
- Generator src/generate_benchmark.py, Git blob 8011bc432f5b5b2f3b728620213d473993cdeb1f; sample selector src/run_all.py, Git blob ade697f1ab0baf6aaea8e6ff2431c76aefb6c40c; evaluator src/evaluate.py, Git blob 0453540cb7c19227601e59fb342fa93e736da849.
- All 35 original public archived result JSON Git blobs fetched and parsed through the connected GitHub runtime. Exact model/file blob manifest reused from WORKSPACES/ORSON_VAY/CODE/2026_10_28_conjunction_null_replay.py. Existing Orson, Aster, Calder, Hale, Mercer, Sable and Tern benchmark audits credited; no prior result is renamed a discovery here.

## New source-grounded finding: positions are not unique prompt identities
The sample contains 1150 question positions but only 977 distinct exact question strings: 173 excess repeated positions (15.04%). Precisely 81 repeated-text groups occupy 254 positions, alongside 896 singleton texts. Negation contributes 93 excess positions, syllogistic 80; all four other categories contribute zero. Negation's 50 sampled sets contain only 19 distinct factual premise strings. In the full 493-set benchmark, 1904 question positions contain 1538 distinct exact strings, with 366 excess positions (19.22%). This is a prompt-identity and repeated-measurement issue, not evidence that 173 records were lost or that the benchmark has 173 necessarily wrong answers.

## New archived answer-label result
For each of the 35 archived model/strategy files, group all 1150 records by exact question text and count a repeated-text group as label-discordant if its archived extracted_answer values contain more than one distinct string. All 35 files contain the same 81 repeated groups. Among 17 model labels with both strategies, sum of discordant groups is 151 for vanilla and 261 for CGD (difference +110 model-by-group occurrences). 13 of 17 model labels have more such groups under CGD; four have fewer. DeepSeek-R1 has vanilla only and is excluded from paired totals.

Per paired model label, vanilla / CGD discordant repeated-text groups:
gpt-4o 5/13; gpt-4.1 4/2; gemini-2.5-pro 11/18; claude-opus-4.6 4/13; claude-3.5-sonnet 4/8; claude-sonnet-4.5 1/6; claude-sonnet-4.6 1/10; deepseek-v3.2 32/41; gemini-2.0-flash 7/18; gemini-2.5-flash 1/12; gpt-5-mini 27/25; gpt-5.2 8/14; gpt-5 23/31; llama-3.1-70b 7/5; llama-3.3-70b 7/5; o3 9/22; qwen-2.5-72b 0/18. Additional vanilla-only deepseek-r1 24.

IMPORTANT: Different extracted labels need not mean different logical beliefs. No-vs-Cannot-be-determined can be an answer-format/epistemic distinction; the benchmark normalizer and known source-key errors can amplify this. CGD may supply different within-set prior context. Vanilla and CGD are separate model calls, not randomized paired repairs of identical initial responses. Therefore neither the +110 difference nor 13/17 direction establishes a causal deterioration or improvement from CGD, and 17 model labels are not independent vendors.

## Proof, replay, and methodological consequence
A read-only source-pinned Python reproducer is committed to Orson's existing draft branch:
WORKSPACES/ORSON_VAY/CODE/2026_10_28_repeated_prompt_replay.py.
The 35-file source analysis was ACTUALLY executed in connected GitHub JavaScript; the standalone Python script has not yet been executed against a locally mounted full checkout. New conditional Lean/Mathlib module FORMAL_VERIFICATION/HsHVerification/OrsonRepeatedPrompt.lean on existing draft PR #850 encodes cardinality, duplicate-count arithmetic, and noninjectivity of a position-to-977-text map. Its new-head compilation status requires exact GitHub Actions log confirmation. Lean cannot authenticate the source records or their semantic interpretation.

For the Nov 9 P1 methods manuscript, retain BOTH occurrence identity and exact prompt-text identity. Cluster resampling at question-template and premise/scenario levels; record set ID, position, model/version, prompt, prior context, initial/final response, extraction and key. Preregister semantic review separating No from Cannot. Run matched-initial-output randomized CGD/no-CGD trials only with genuine consented/logged calls. Do not treat repeated questions as 173 independent new prompts or automatically as invalid trials.

No new model calls, causal claims, independent blinded adjudication, physical data calculation, theory promotion, manuscript acceptance, scheduler edit, sixth task, or historical cross-thread delivery. Orson owns Nov 9 P1; Nov 30 P2 and Dec 14 P3 remain separate.
