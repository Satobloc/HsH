# Aldus | CGD archived-response provenance and execution-date gate | 2026-10-29 13:48 UTC

**Status:** SOURCE-CRITICAL ORIGINAL-DATA AUDIT / CONDITIONAL FORMALIZATION; **not** new model trials, proof of model independence, or evidence of any SAT/H(s)H physical mechanism.

**Scope and original sources.** Source is the public `aayambansal/ConsistencyBench` repository, pinned to its initial recorded Git commit `4ca27d407325bc18c7f0b0d6f89b57ed1119f760` (committer time 2026-02-18 19:03:42 UTC). Original `src/evaluate.py` blob `0453540cb7c19227601e59fb342fa93e736da849`, `results/*_cgd.json` 17 original blobs retrieved by Git blob SHA, `eval_logs/eval_*_cgd.log` 16 original blobs, and `eval_logs/eval_log.txt` blob `f92d850f972e7283e6f8c2d396bf67fca71a46f2`. These are independent *archive witnesses*, not 17 independent researchers. Current repository visibility does not prove its visibility at the historical commit time.

## Executed original-data inventory

The 17 CGD JSON files were fetched and JSON-parsed from immutable Git blobs in a live GitHub-connected JavaScript run. Each contains 300 question sets and 1,150 answer records, giving **19,550 answer records**. Across these records **6,702** have non-null `revision_response`. Every file has exactly six top-level keys: `model`, `model_id`, `strategy`, `num_sets`, `metrics`, `results`. The union of per-question answer-object keys is exactly eight: `question`, `expected`, `initial_response`, `initial_answer`, `contradiction_detected`, `revision_response`, `extracted_answer`, `reasoning_ref`.

**No recorded per-answer request ID, response ID, UTC timestamp, API deployment revision, provider route, seed, sampling parameters or checker-event trace appears in these eight fields.** The top-level `model_id` identifies the requested OpenRouter model route, not an independently observed deployment/backend identity. The source evaluator's `call_model` returns `response.choices[0].message.content` alone, dropping any other response-envelope metadata before result serialization. It sets a default `temperature=0.0`, but the archive does not verify downstream provider compliance or record per-call settings.

## Execution logs and chronological exposure

Exactly **16** dedicated `eval_<model>_cgd.log` files exist for the 17 CGD result files. The dedicated `eval_gpt-4o_cgd.log` is absent, but **`eval_log.txt` does contain a gpt-4o/cgd run section and a saved-results line**. Therefore the defensible finding is a **split log provenance route**, not a missing gpt-4o evaluation. All 16 dedicated logs and the combined log were read and checked for ISO-like absolute calendar dates, request/response IDs, provider-route/seed/fingerprint tokens. None was found. The logs do record progress/elapsed times; elapsed duration is not an absolute UTC generation timestamp.

The four spot-checked original Git histories (`results/gpt-4.1_cgd.json`, `results/gpt-4o_cgd.json`, `eval_logs/eval_gpt-4.1_cgd.log`, `eval_logs/eval_log.txt`) first show the same 2026-02-18T19:03:42Z import commit. This is a **first-located extant Git witness** and an upper bound on generation only if the committed artifacts are genuine. It is not the models' execution date, original experimental preregistration date, or verified first public visibility. Other files' per-path Git histories were not exhaustively checked.

## Methodological consequence for Orson P1

The corpus supports reproducible comparisons of **recorded text and labels**, but not precise claims about contemporaneous generation, persistent model deployment identity, backend-provider independence, or independent human review. Provider-family grouping is a label-derived stratification. A shared checker and unrecorded routing can create dependencies not resolvable from the saved fields. This is a **provenance limit**, not a finding that model outputs are fabricated or that provider independence is false.

For Nov 2 P1 protocol freeze, retain a separate `source_commit/blob`, `record_locator`, `requested_model_id`, `actual_provider_deployment [UNKNOWN]`, `invocation_UTC [UNKNOWN]`, `request_id [UNKNOWN]`, `checker_event_id [UNKNOWN]`, `raw_text`, `extracted_label`, `semantic_adjudication [PENDING]` ledger. Do not silently fill unknowns. For new administered experiments, capture these fields at generation time with consent, privacy protection and provider terms.

## Proof, boundaries, and return cursor

Existing Aldus draft PR #982 was reused, not a new tool. `FORMAL_VERIFICATION/HsHVerification/AldusCGDProvenanceFields.lean` contains ten source-conditional finite-schema/count theorems, imported into the existing verification root. Actual exact-head Lean compilation and theorem-specific axiom reports must be checked separately; source readback alone is **not** proof. Lean cannot authenticate source transcription, date, provider, or inference causality.

Nathan Direct in this run requested formal relational/informational shape and independent-source scrutiny. No new SAT geometry or physical calculation was attempted; the real recorded LLM corpus supplies all finite counts. Mersearch guide and existing Math Hopper/Lean/Whirligig assets were checked; no new software was built. Full three-repo pinned Mersearch was unavailable in this connector context; bounded HsH/old SAT code-search fallback is **not** a Mersearch run. Historical Aldus remit is public exposure/first-extant and first-public source criticism, not generic physics. Orson retains Nov 9 P1 authorship; Nov 30 P2 and Dec 14 P3 are separate.

Lateral read: HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/TheTANGLE.txt` Git blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 1041–1080, calendrical/bureaucratic worldbuilding; next cursor line **1081**. FIE team reread last documented Oct 27 (<14 days), no new FIE reread claimed.

**Next:** verify exact-head Lean CI and `#print axioms`; ask independent reviewer to inspect the code-level metadata loss and archival first-public inference before P1 prose; preserve the missing API invocation metadata as **unrecoverable from these JSON/log witnesses**, not globally nonexistent.
