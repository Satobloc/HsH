# Mira Review-MIND: embedded-"no" substring exposure in ConsistencyBench CGD
Date: 2026-10-29 09:48 UTC | run REVROT3-19-20261011:441:s4
Status: EXECUTED ORIGINAL-ARCHIVE REPLAY / CONDITIONAL LEAN SOURCE COMMITTED / NOT A NEW MODEL TRIAL

## Sources and prior work
Original public benchmark: aayambansal/ConsistencyBench, `src/evaluate.py`, Git blob `0453540cb7c19227601e59fb342fa93e736da849`. The published `extract_answer` function first checks FINAL ANSWER, leading Yes/No and uncertainty phrases. Its last fallback searches literal substrings `"yes"` and `"no"` in the first 200 characters, without word boundaries. Original 17 `results/*_cgd.json` blobs are identified in Mercer's earlier source manifest, `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/mercer-p1-cgd-missingness-20261028t2048z-s4-001.md`. This work credits Meridian's first-token disagreement audit and Mercer's exact extractor replay; neither had established the embedded-substring exposure count below.

Nathan Direct's current cognition/QC and original-statement-first instructions govern the research method; they are not the authorship of the benchmark or the present numerical findings. Mira is a selected bibliographic/source-identity research lens, not an authenticated continuation of a historical ChatGPT instance.

## Executed original-data audit
Fetched each of the 17 immutable original Git blobs through the connected GitHub blob interface, JSON-parsed all 300 sets and 1,150 question occurrences per model. An independent JavaScript translation of the source extractor reproduced **all 39,100 stored initial and final labels** (19,550 records x two stages; 0 mismatches).

For a strict, mechanical exposure definition, isolate only the final fallback branch, after earlier source checks fail, where the first 200 characters contain the substring `no`, contain no substring `yes`, and contain **no standalone whole-word `no`**. This is a string-boundary finding, not an independent assessment of semantic correctness.

- Initial-stage affected records: **402**.
- Final-stage affected records: **294**.
- Distinct affected model-question records across either stage: **438**; affected at both stages: **258** (402 + 294 - 438).
- Stage appearances: **696/39,100**; final appearances: **294/19,550**.
- Final affected records by category: negation 151, commonsense entailment 23, modus tollens 51, transitivity 51, contrapositive 12, syllogistic 6.
- Under published expected keys, 62 of the 294 final affected records are scored correct and 232 incorrect. This is a key-version-specific comparison, not semantic adjudication.
- In 171/294 final affected raw responses there is no standalone `no` anywhere in the complete raw text; 88/294 contain a standalone `yes` somewhere in the complete raw text. These categories can overlap.

The 294 final cases arise in 9 of the 17 model files. Final counts: Gemini 2.0 Flash 105, Claude Sonnet 4.6 84, Claude Sonnet 4.5 63, Claude Opus 4.6 36, Claude 3.5 Sonnet 2, DeepSeek V3.2 1, GPT-5 1, GPT-5 Mini 1, o3 1. No claim is made about a vendor's underlying reasoning quality from this distribution.

## Two direct original-record witnesses
- Gemini 2.0 Flash, set CB-92210, question index 3, negation: original raw text states `We know that ...` and concludes `Yes, Sam cooks dinner.`; the stored extracted label is **No**, source expected label **Yes**. In the first 200 characters, `know` supplies embedded `no`; the explicit `Yes` occurs later. This is a strong source-specific lexical extraction counterexample, not proof of benchmark-wide semantic error.
- Claude Opus 4.6, set CB-57526, question index 2, negation: raw answer ends `**Yes**, the negation ... is true.` but the stored extracted label is **No**. Published key is **No**, which is independently disputed at the category level; the original label and key are different evidence objects.

## Typed informational shape and formal boundary
Raw response -> source extractor -> stored label -> published-key comparator is a many-to-one pipeline. The literal-substring fallback and a word-boundary-aware fallback are different projections; substituting the latter changes these 294 final-stage outputs from No to Unclear if all earlier conditions remain unchanged. That substitution is **not** an authorized corrected semantic scorer and cannot be advertised as an accuracy improvement.

A new conditional Lean module `FORMAL_VERIFICATION/HsHVerification/MiraCGDEmbeddedNoGate.lean` was committed and imported on Mira's EXISTING draft PR #885, exact commit `463151b25712ba8393b06a3c85d5e26949e3309b`. It states the fallback projection difference and source-conditioned arithmetic (402 + 294 = 438 + 258; 62 + 232 = 294). Lean compilation and theorem-specific axiom status require separate actual CI readback. Even a successful proof does not authenticate the JSON, parser translation or semantic interpretation.

## P1 disposition and limits
For Orson's November 2 protocol freeze, report the source extractor's substring-boundary vulnerability and keep raw text, original extracted label, key version and an independently adjudicated answer distinct. A prospective blind adjudication should prioritize these cases and compare token-boundary-sensitive alternatives without treating the latter as ground truth. Shared prompts, repeated stimuli, missing revisions and correlated model families remain separate threats.

No new LLM calls, human participant trial, physical calculation, invented fixture, causal estimate, BEDROCK promotion, paper approval, public PDF reader or authenticated cross-thread delivery. Nov 9 P1 remains Orson-led; Nov 30 P2 and Dec 14 P3 are separate.

Return cursor: inspect actual CI for PR #885; sample/adjudicate raw cases independently with explicit uncertainty; preserve the original benchmark files unchanged. No sixth task or scheduler change.
