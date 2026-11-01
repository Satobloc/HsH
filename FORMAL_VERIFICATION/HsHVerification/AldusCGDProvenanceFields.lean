import Mathlib

/-!
# Aldus: source-conditional CGD provenance-field audit

Observed primary source: aayambansal/ConsistencyBench at initial public
repository commit 4ca27d407325bc18c7f0b0d6f89b57ed1119f760
(2026-02-18T19:03:42Z, Git committer timestamp).
Source: results/*_cgd.json, 17 Git blobs checked individually against
the repository contents inventory; src/evaluate.py blob
0453540cb7c19227601e59fb342fa93e736da849.
Observed: 17 models x 1150 question positions = 19550 answer records;
6702 non-null revision_response fields; 16 named per-model CGD logs
plus the combined eval_log.txt containing the gpt-4o/cgd run.
All 17 JSON files were actually parsed. The eight keys below are the
union of recorded answer-object keys in those files.

Theorem status is CONDITIONAL ON SOURCE TRANSCRIPTION.
The list does NOT represent all possible external API metadata.
Lean cannot establish original model identity, provider routing, run dates,
authenticity of external observations, causal independence, or semantics.
-/

namespace HsHVerification.AldusCGDProvenanceFields

def answerKeys : List String :=
  ["question", "expected", "initial_response", "initial_answer",
   "contradiction_detected", "revision_response", "extracted_answer",
   "reasoning_ref"]

def topLevelKeys : List String :=
  ["model", "model_id", "strategy", "num_sets", "metrics", "results"]

theorem answer_schema_eight_fields : answerKeys.length = 8 := by decide
theorem top_level_schema_six_fields : topLevelKeys.length = 6 := by decide

theorem no_request_id_in_answer_schema : "request_id" ∉ answerKeys := by decide
theorem no_timestamp_in_answer_schema : "timestamp" ∉ answerKeys := by decide
theorem no_provider_route_in_answer_schema : "provider_route" ∉ answerKeys := by decide
theorem no_model_revision_in_answer_schema : "model_revision" ∉ answerKeys := by decide
theorem no_seed_in_answer_schema : "seed" ∉ answerKeys := by decide

theorem observed_cgd_record_count : 17 * 1150 = 19550 := by decide
theorem logged_run_cover : 16 + 1 = 17 := by decide
theorem observed_revisions_bounded : 6702 ≤ 19550 := by decide

#print axioms answer_schema_eight_fields
#print axioms top_level_schema_six_fields
#print axioms no_request_id_in_answer_schema
#print axioms no_timestamp_in_answer_schema
#print axioms no_provider_route_in_answer_schema
#print axioms no_model_revision_in_answer_schema
#print axioms no_seed_in_answer_schema
#print axioms observed_cgd_record_count
#print axioms logged_run_cover
#print axioms observed_revisions_bounded

end HsHVerification.AldusCGDProvenanceFields
