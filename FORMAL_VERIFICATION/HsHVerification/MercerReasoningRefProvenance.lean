import Mathlib

/-!
Source-conditioned Review-MIND provenance gate, 2026-10-28 01:48 UTC.
Original public aayambansal/ConsistencyBench:
- sample data blob 10eb2da27c84c706d8e9e2325afca864fcae6a0d
- evaluator src/evaluate.py blob 0453540cb7c19227601e59fb342fa93e736da849
- five original archived result blobs enumerated in the separate source audit.
Executed JSON joins found 1,150/1,150 identical reasoning_ref-to-source
reasoning fields in EACH of five files, across two evaluation strategies
and three model names (5,750 records). Those equalities are OBSERVED
outside Lean; the module proves only properties of the explicitly encoded
data-flow projection. It does not certify model authorship, semantics,
experiment independence, or the empirical count.
-/

namespace HsHVerification.MercerReasoningRefProvenance

structure SourceQuestion where
  referenceReasoning : String

structure ArchivedModelResponse where
  rawResponse : String
  reasoningRef : String

def storeResponse (source : SourceQuestion) (raw : String) :
    ArchivedModelResponse :=
  ⟨raw, source.referenceReasoning⟩

theorem stored_reference_is_source (source : SourceQuestion) (raw : String) :
    (storeResponse source raw).reasoningRef = source.referenceReasoning := by
  rfl

theorem reference_ignores_model_response (source : SourceQuestion)
    (raw₁ raw₂ : String) :
    (storeResponse source raw₁).reasoningRef =
      (storeResponse source raw₂).reasoningRef := by
  rfl

theorem stored_raw_is_model_response (source : SourceQuestion) (raw : String) :
    (storeResponse source raw).rawResponse = raw := by
  rfl

theorem distinct_raw_can_share_reference (source : SourceQuestion)
    (raw₁ raw₂ : String) (h : raw₁ ≠ raw₂) :
    (storeResponse source raw₁).reasoningRef =
        (storeResponse source raw₂).reasoningRef ∧
      (storeResponse source raw₁).rawResponse ≠
        (storeResponse source raw₂).rawResponse := by
  exact ⟨rfl, h⟩

def observedMatchesByFile : List Nat := [1150, 1150, 1150, 1150, 1150]

theorem observed_five_files : observedMatchesByFile.length = 5 := by
  decide

theorem observed_total_matches : observedMatchesByFile.sum = 5750 := by
  decide

#print axioms stored_reference_is_source
#print axioms reference_ignores_model_response
#print axioms stored_raw_is_model_response
#print axioms distinct_raw_can_share_reference
#print axioms observed_five_files
#print axioms observed_total_matches

end HsHVerification.MercerReasoningRefProvenance
