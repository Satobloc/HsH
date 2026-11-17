import Mathlib

/-!
# Orson P1: three-roster provenance crosswalk for ConsistencyBench CGD

Primary source commit:
`aayambansal/ConsistencyBench` at
`bfc676baa848c7f1715bb73aee148180de15516e`.

Exact source files:
- `src/run_all.py`, blob `ade697f1ab0baf6aaea8e6ff2431c76aefb6c40c`;
- `src/evaluate.py`, blob `0453540cb7c19227601e59fb342fa93e736da849`;
- `data/consistency_bench_sample.json`, blob
  `10eb2da27c84c706d8e9e2325afca864fcae6a0d`;
- the 17 result blobs listed below.

Three distinct rosters must not be conflated:
1. the six labels declared by the pinned `run_all.py` orchestrator;
2. the 22 label-to-endpoint pairs supported by `evaluate.py`;
3. the 17 archived CGD payload labels and their recorded `model_id` strings.

A connected-runtime replay fetched all 17 result blobs by exact Git blob ID.
All 17 payloads had 300 sets and 1,150 question records. Their ordered
projection `(set_id, category, premise, [(question, expected)])` was identical
across all 17 files and exactly equal to the pinned sample file. The panel is
therefore 300 shared benchmark sets / 1,150 shared question positions with
17 model-output layers, not 5,100 unique sets or 19,550 independent prompts.
This is a source-audit observation, not a Lean theorem about the JSON bytes.

The source code's `check_done` tests file existence only. The archived payload
schema stores `model`, `model_id`, `strategy`, `num_sets`, `metrics`,
and `results`; the 17 payloads contain no run ID, creation timestamp,
provider request/response ID, sample hash, or resolved backend revision.
The source `call_model` returns only message content. Consequently the
recorded `model_id` is a requested endpoint string, not authenticated
provider-resolved model-version provenance.

This module proves finite table membership, uniqueness, and count identities
for the transcribed source metadata. It does NOT prove the Python/JSON-to-Lean
translation, the independent runtime replay, the truth of the raw source,
actual API execution, backend revision, model independence, NLI validity,
semantic correctness, causal efficacy, or consciousness.
It does not amend the frozen P1 protocol or add a new experiment.
-/

namespace HsHVerification
namespace OrsonCGDRosterProvenance

structure ArchivedEndpoint where
  fileName : String
  modelLabel : String
  modelId : String
  blobSha1 : String
  strategy : String
  setCount : Nat
  questionCount : Nat
deriving DecidableEq, Repr

def archivedEndpoints : List ArchivedEndpoint := [
  { fileName := "claude-3.5-sonnet_cgd.json", modelLabel := "claude-3.5-sonnet", modelId := "openrouter/anthropic/claude-3.5-sonnet", blobSha1 := "5e486f26e16bcd3d9994670ef3c85ad79a8d82bf", strategy := "cgd", setCount := 300, questionCount := 1150 },
  { fileName := "claude-opus-4.6_cgd.json", modelLabel := "claude-opus-4.6", modelId := "openrouter/anthropic/claude-opus-4.6", blobSha1 := "c9f6e92cc21a30497b2264e17e0b59a3a843b710", strategy := "cgd", setCount := 300, questionCount := 1150 },
  { fileName := "claude-sonnet-4.5_cgd.json", modelLabel := "claude-sonnet-4.5", modelId := "openrouter/anthropic/claude-sonnet-4.5", blobSha1 := "d259dfa14fcb901323191fd99dc06be0feebc0ac", strategy := "cgd", setCount := 300, questionCount := 1150 },
  { fileName := "claude-sonnet-4.6_cgd.json", modelLabel := "claude-sonnet-4.6", modelId := "openrouter/anthropic/claude-sonnet-4.6", blobSha1 := "a5b440f9d5e9e8b8294d68938d3fb667a83e6a75", strategy := "cgd", setCount := 300, questionCount := 1150 },
  { fileName := "deepseek-v3.2_cgd.json", modelLabel := "deepseek-v3.2", modelId := "openrouter/deepseek/deepseek-v3.2", blobSha1 := "5dd5ec233d563acdc385f56270b2868c2a439d09", strategy := "cgd", setCount := 300, questionCount := 1150 },
  { fileName := "gemini-2.0-flash_cgd.json", modelLabel := "gemini-2.0-flash", modelId := "openrouter/google/gemini-2.0-flash-001", blobSha1 := "3b2d2a680fa71c3400c3399e9ffcbbdbbfc86729", strategy := "cgd", setCount := 300, questionCount := 1150 },
  { fileName := "gemini-2.5-flash_cgd.json", modelLabel := "gemini-2.5-flash", modelId := "openrouter/google/gemini-2.5-flash", blobSha1 := "abf7a0b99c54ff8155700e80e283d1d7081f09f6", strategy := "cgd", setCount := 300, questionCount := 1150 },
  { fileName := "gemini-2.5-pro_cgd.json", modelLabel := "gemini-2.5-pro", modelId := "openrouter/google/gemini-2.5-pro", blobSha1 := "1d7ee27ecefddc6e0d67833aeef2370430a7c9c4", strategy := "cgd", setCount := 300, questionCount := 1150 },
  { fileName := "gpt-4.1_cgd.json", modelLabel := "gpt-4.1", modelId := "openrouter/openai/gpt-4.1", blobSha1 := "9ab86f214197d1c60279807850a07d9da75344b8", strategy := "cgd", setCount := 300, questionCount := 1150 },
  { fileName := "gpt-4o_cgd.json", modelLabel := "gpt-4o", modelId := "openrouter/openai/gpt-4o-2024-11-20", blobSha1 := "3f94994e131e25bf9bf52f43867fbe6b229756b1", strategy := "cgd", setCount := 300, questionCount := 1150 },
  { fileName := "gpt-5-mini_cgd.json", modelLabel := "gpt-5-mini", modelId := "openrouter/openai/gpt-5-mini", blobSha1 := "aa0fb3f64cc9789ccf3e5871f9aaec16f4d8099b", strategy := "cgd", setCount := 300, questionCount := 1150 },
  { fileName := "gpt-5.2_cgd.json", modelLabel := "gpt-5.2", modelId := "openrouter/openai/gpt-5.2", blobSha1 := "acf59928c7d754c78a93f648c76c6497fc7e5b11", strategy := "cgd", setCount := 300, questionCount := 1150 },
  { fileName := "gpt-5_cgd.json", modelLabel := "gpt-5", modelId := "openrouter/openai/gpt-5", blobSha1 := "25bb4f61e2454467626592396f20384c9858cb6b", strategy := "cgd", setCount := 300, questionCount := 1150 },
  { fileName := "llama-3.1-70b_cgd.json", modelLabel := "llama-3.1-70b", modelId := "openrouter/meta-llama/llama-3.1-70b-instruct", blobSha1 := "b7b9db7ff20a502f25064df9b786507b4d58a6a3", strategy := "cgd", setCount := 300, questionCount := 1150 },
  { fileName := "llama-3.3-70b_cgd.json", modelLabel := "llama-3.3-70b", modelId := "openrouter/meta-llama/llama-3.3-70b-instruct", blobSha1 := "c3845de12a952cfe050f1fbab9e91f8ab10a6a36", strategy := "cgd", setCount := 300, questionCount := 1150 },
  { fileName := "o3_cgd.json", modelLabel := "o3", modelId := "openrouter/openai/o3", blobSha1 := "4f408b9d207d50b2bbbd31b1283f50798173e602", strategy := "cgd", setCount := 300, questionCount := 1150 },
  { fileName := "qwen-2.5-72b_cgd.json", modelLabel := "qwen-2.5-72b", modelId := "openrouter/qwen/qwen-2.5-72b-instruct", blobSha1 := "38393e09d44de963d109b00f66a1378f5b431720", strategy := "cgd", setCount := 300, questionCount := 1150 },
]

def declaredRunAllRoster : List String := [
  "gpt-4o",
  "claude-3.5-sonnet",
  "deepseek-r1",
  "llama-3.1-70b",
  "qwen-2.5-72b",
  "gemini-2.0-flash"
]

def evaluatorRegistry : List (String × String) := [
  ("gpt-5.2", "openrouter/openai/gpt-5.2"),
  ("gpt-5", "openrouter/openai/gpt-5"),
  ("gpt-5-mini", "openrouter/openai/gpt-5-mini"),
  ("gpt-4.1", "openrouter/openai/gpt-4.1"),
  ("gpt-4o", "openrouter/openai/gpt-4o-2024-11-20"),
  ("gpt-4o-mini", "openrouter/openai/gpt-4o-mini"),
  ("o3", "openrouter/openai/o3"),
  ("claude-opus-4.6", "openrouter/anthropic/claude-opus-4.6"),
  ("claude-sonnet-4.6", "openrouter/anthropic/claude-sonnet-4.6"),
  ("claude-opus-4.5", "openrouter/anthropic/claude-opus-4.5"),
  ("claude-sonnet-4.5", "openrouter/anthropic/claude-sonnet-4.5"),
  ("claude-3.5-sonnet", "openrouter/anthropic/claude-3.5-sonnet"),
  ("claude-3.5-haiku", "openrouter/anthropic/claude-3.5-haiku"),
  ("gemini-2.5-pro", "openrouter/google/gemini-2.5-pro"),
  ("gemini-2.5-flash", "openrouter/google/gemini-2.5-flash"),
  ("gemini-2.0-flash", "openrouter/google/gemini-2.0-flash-001"),
  ("deepseek-v3.2", "openrouter/deepseek/deepseek-v3.2"),
  ("deepseek-r1", "openrouter/deepseek/deepseek-r1"),
  ("deepseek-v3", "openrouter/deepseek/deepseek-chat"),
  ("llama-3.1-70b", "openrouter/meta-llama/llama-3.1-70b-instruct"),
  ("llama-3.3-70b", "openrouter/meta-llama/llama-3.3-70b-instruct"),
  ("qwen-2.5-72b", "openrouter/qwen/qwen-2.5-72b-instruct"),
]

def archivedLabels : List String :=
  archivedEndpoints.map ArchivedEndpoint.modelLabel

def archivedModelIds : List String :=
  archivedEndpoints.map ArchivedEndpoint.modelId

def archivedFileNames : List String :=
  archivedEndpoints.map ArchivedEndpoint.fileName

def archivedBlobShas : List String :=
  archivedEndpoints.map ArchivedEndpoint.blobSha1

def supportedRegistryLabels : List String :=
  evaluatorRegistry.map Prod.fst

def runRosterIntersection : List String :=
  declaredRunAllRoster.filter (fun label => label ∈ archivedLabels)

def declaredRosterMissing : List String :=
  declaredRunAllRoster.filter (fun label => label ∉ archivedLabels)

def archiveOnlyLabels : List String :=
  archivedLabels.filter (fun label => label ∉ declaredRunAllRoster)

def payloadTopLevelFields : List String :=
  ["model", "model_id", "strategy", "num_sets", "metrics", "results"]

def absentRunLineageFields : List String :=
  ["run_id", "created_at", "provider_request_id", "response_id",
   "sample_sha256", "resolved_model_revision"]

def aggregateModelSetRows : Nat :=
  (archivedEndpoints.map ArchivedEndpoint.setCount).sum

def aggregateModelQuestionRows : Nat :=
  (archivedEndpoints.map ArchivedEndpoint.questionCount).sum

theorem archived_endpoint_count : archivedEndpoints.length = 17 := by decide
theorem declared_run_roster_count : declaredRunAllRoster.length = 6 := by decide
theorem evaluator_registry_count : evaluatorRegistry.length = 22 := by decide

theorem archived_labels_unique : archivedLabels.Nodup := by decide
theorem archived_model_ids_unique : archivedModelIds.Nodup := by decide
theorem archived_file_names_unique : archivedFileNames.Nodup := by decide
theorem archived_blob_shas_unique : archivedBlobShas.Nodup := by decide
theorem evaluator_registry_labels_unique : supportedRegistryLabels.Nodup := by decide

theorem every_archive_pair_is_in_evaluator_registry :
    ∀ row ∈ archivedEndpoints,
      (row.modelLabel, row.modelId) ∈ evaluatorRegistry := by decide

theorem every_archive_label_is_supported :
    ∀ label ∈ archivedLabels, label ∈ supportedRegistryLabels := by decide

theorem every_archived_payload_is_cgd :
    ∀ row ∈ archivedEndpoints, row.strategy = "cgd" := by decide

theorem every_archived_payload_has_300_sets_and_1150_questions :
    ∀ row ∈ archivedEndpoints,
      row.setCount = 300 ∧ row.questionCount = 1150 := by decide

theorem exact_declared_archive_intersection_count :
    runRosterIntersection.length = 5 := by decide

theorem only_declared_roster_label_missing :
    declaredRosterMissing = ["deepseek-r1"] := by decide

theorem archive_only_label_count :
    archiveOnlyLabels.length = 12 := by decide

theorem deepseek_v32_is_archive_only :
    "deepseek-v3.2" ∈ archiveOnlyLabels := by decide

theorem archived_roster_is_not_the_declared_run_roster :
    ¬ (∀ label ∈ archivedLabels, label ∈ declaredRunAllRoster) := by decide

theorem aggregate_model_set_rows_eq_5100 :
    aggregateModelSetRows = 5100 := by decide

theorem aggregate_model_question_rows_eq_19550 :
    aggregateModelQuestionRows = 19550 := by decide

theorem aggregate_rows_factor_through_shared_panel :
    aggregateModelSetRows = archivedEndpoints.length * 300 ∧
    aggregateModelQuestionRows = archivedEndpoints.length * 1150 := by decide

theorem run_lineage_fields_absent_from_payload_schema :
    ∀ field ∈ absentRunLineageFields, field ∉ payloadTopLevelFields := by decide

#print axioms archived_endpoint_count
#print axioms declared_run_roster_count
#print axioms evaluator_registry_count
#print axioms archived_labels_unique
#print axioms archived_model_ids_unique
#print axioms archived_file_names_unique
#print axioms archived_blob_shas_unique
#print axioms evaluator_registry_labels_unique
#print axioms every_archive_pair_is_in_evaluator_registry
#print axioms every_archive_label_is_supported
#print axioms every_archived_payload_is_cgd
#print axioms every_archived_payload_has_300_sets_and_1150_questions
#print axioms exact_declared_archive_intersection_count
#print axioms only_declared_roster_label_missing
#print axioms archive_only_label_count
#print axioms deepseek_v32_is_archive_only
#print axioms archived_roster_is_not_the_declared_run_roster
#print axioms aggregate_model_set_rows_eq_5100
#print axioms aggregate_model_question_rows_eq_19550
#print axioms aggregate_rows_factor_through_shared_panel
#print axioms run_lineage_fields_absent_from_payload_schema

end OrsonCGDRosterProvenance
end HsHVerification
