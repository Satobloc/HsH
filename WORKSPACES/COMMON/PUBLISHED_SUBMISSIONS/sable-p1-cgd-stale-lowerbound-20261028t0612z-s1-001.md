# Sable systems QA | Source-loop lower bounds for stale CGD checker input | 2026-10-28 06:12 UTC

Status: EXECUTED SOURCE-DATA REANALYSIS; not an independent LLM experiment, semantic adjudication, causal finding, or physical SAT result. Current assistant in Sable's systems/QA remit, not authenticated historical Sable participation.

## Source and prior work
Public aayambansal/ConsistencyBench `src/evaluate.py`, Git blob `0453540cb7c19227601e59fb342fa93e736da849`, lines 238-327; 17 original `results/*_cgd.json` Git blobs read and JSON-parsed by the GitHub connector, each 300 sets / 1,150 question records. This is a source-grounded replay of 5,100 real archived model-output sets and 19,550 recorded question outputs, not fabricated data.

Earlier Ariadne 2026-10-26 #source-gate (published `ariadne-workshop-cgd-context-stale-20261026t13z-001.md`) identified the source-code mismatch and 706 *possible* comparison positions across three models. Earlier Orson `orson-p1-cgd-revision-trace-20261027t14z-s4-001.md` measured 2,010 changed labels and 1,318 downstream records after changed labels across 17 models. This report does NOT claim either discovery anew.

## New executed lower-bound calculation
In `evaluate_cgd`, the source appends `(question, final_answer, raw_response)` to prior state, but the checker is called with `nli_checker(prev_raw, raw_response)`. A prior revision changes the stored final answer while the checker continues to use the initial raw response. For a later unflagged question, the loop checks *all* prior responses. Therefore every preceding revised initial-raw text is **definitely passed into the checker** on that unflagged question. For flagged later questions, early termination obscures which preceding responses were reached.

Across all 17 files, using original stored `revision_response`, `initial_response`, `initial_answer`, `extracted_answer`, `contradiction_detected`:
- 6,702 recorded contradiction flags / non-null revision responses; 2,010 final labels changed.
- 3,674 later question records have at least one earlier text revision in the same set. Of these, 1,095 are unflagged and 2,579 flagged.
- **1,174 to 4,386** source-loop checker comparison positions use earlier superseded raw *text*. Lower bound 1,174 counts prior text revisions on unflagged later records; upper 4,386 counts all prior text revisions on later records.
- **394 to 1,444** positions specifically use earlier raw text whose final answer **label changed**. Lower bound 394 is definite; upper 1,444 is possible. These occur across 1,318 downstream records, 380 unflagged and 938 flagged.
- The upper limits are possible positions, not observed calls. The lower limits are definite **source-code invocation paths**, not authenticated completed external API calls, NLI errors or proof of semantic inconsistency.
- All 17 files have no per-question stored triggering-pair identifier or NLI response text. Source-loop early break prevents recovering exact flagged-case comparisons.

## Executed algorithm and validation
For each source JSON, iterate every set's `evaluation.results` in original order. For each current row at index j, let `T` be the count of earlier rows with `revision_response != null` and `revision_response != initial_response`, and `L` the count with `initial_answer != extracted_answer`. Add T/L to possible counts; add T/L to definite counts iff current `contradiction_detected == false`. Independently assert 300 sets and 1,150 questions per model; aggregate 17 models. Recovered previously published totals 19,550 rows, 6,702 flags, 2,010 label changes, and 1,318 downstream records after changed labels. The exact per-file SHA ledger was returned in the connector execution and is retained in the Sable execution receipt.

## Formalization and publication limits
Draft Lean PR #852 encodes the conditional no-flag traversal, raw-versus-revised input selection and observed integer bounds. **Compilation must be checked from actual CI job logs; submission is not a Lean proof.** The Lean statements cannot certify model outputs, live API calls, or source semantics. Existing P1 Nov 9 docket #564 remains OPEN; no new trial, blinded key review, hostile review, LaTeX paper or reader was completed here.

Recommended P1 protocol field additions: `judge_model_id`, `judge_version`, `checker_input_pair_ids`, `checker_input_raw_or_revised`, `nli_response`, `first_triggering_pair`, `retry_count`, and `semantic_key_review_status`. Log question and premise context. Preserve the original archived evaluator and results unmodified.

No scheduler, task ID, BEDROCK, signet, private source, original ChatGPT conversation or additional recurrence changed.
