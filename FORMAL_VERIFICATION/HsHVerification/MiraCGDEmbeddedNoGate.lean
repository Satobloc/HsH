import Mathlib

/-!
# Mira source-conditional answer-extraction projection gate

Primary source: aayambansal/ConsistencyBench, src/evaluate.py,
Git blob 0453540cb7c19227601e59fb342fa93e736da849.

Executed original archived-data replay on 2026-10-29:
17 CGD model files, 19,550 question records and 39,100 stage records.
Among fallback "No" decisions where the first 200 characters contain
the substring "no" but no whole-word "no": 402 initial stages and
294 final stages, representing 438 distinct records. The intersection
is 258 records. These counts are source-derived inputs, not Lean-verified
observations. Theorems below are conditional statements about the
formalized projection and count arithmetic. They neither determine
the semantic answer nor prove the correctness of the source extractor.
-/

namespace HsHVerification.MiraCGDEmbeddedNoGate

/-- An abstract binary/unknown fallback label. -/
inductive Answer where
  | yes
  | no
  | unclear
  deriving DecidableEq, Repr

/-- A conservative abstraction of the source fallback branch after all
    prefix, FINAL ANSWER and uncertainty-phrase checks have failed. -/
def fallback (containsYes containsNo : Bool) : Answer :=
  if containsYes && !containsNo then .yes
  else if containsNo && !containsYes then .no
  else .unclear

/-- A substring "no" without a word-boundary "no" is sufficient for
    the source fallback to return No when "yes" is absent. -/
theorem embedded_no_forces_no : fallback false true = .no := by
  decide

/-- Replacing that substring indicator with the absent whole-word
    indicator changes the fallback result, not necessarily its truth. -/
theorem word_boundary_changes_output :
    fallback false true ≠ fallback false false := by
  decide

/-- The source conditional counts describe 696 affected stage records. -/
theorem stage_exposure_total : 402 + 294 = 696 := by
  norm_num

/-- The union of affected initial/final records has 438 members if
    the 258-record intersection is the one obtained in source replay. -/
theorem observed_overlap_accounting : 402 + 294 = 438 + 258 := by
  norm_num

/-- Source-reported final-stage split against the published key. -/
theorem final_published_key_partition : 62 + 232 = 294 := by
  norm_num

/-- A label-only map cannot equal both different fallback outputs
    for the same abstract evidence value. -/
theorem no_single_output_for_both
    (f : Unit → Answer)
    (h1 : f () = fallback false true)
    (h2 : f () = fallback false false) : False := by
  exact word_boundary_changes_output (h1.symm.trans h2)

#print axioms embedded_no_forces_no
#print axioms word_boundary_changes_output
#print axioms stage_exposure_total
#print axioms observed_overlap_accounting
#print axioms final_published_key_partition
#print axioms no_single_output_for_both

end HsHVerification.MiraCGDEmbeddedNoGate
