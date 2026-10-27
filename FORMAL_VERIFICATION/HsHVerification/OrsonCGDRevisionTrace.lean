import Mathlib

/-!
# CGD revision-trace information gate

Source-anchored to aayambansal/ConsistencyBench, src/evaluate.py
Git blob 0453540cb7c19227601e59fb342fa93e736da849,
especially evaluate_cgd lines 238-292 and NLIContradictionChecker lines 299-327.

The code passes prior initial raw response text to the NLI checker,
even after a revised final answer has been retained. This module proves
only the abstract non-injectivity of an initial-raw projection and the
arithmetic consistency of an independently executed 17-model archive audit.
It does NOT prove any checker error occurred, semantic correctness,
LLM cognition, or causal effectiveness of CGD.
-/

namespace HsHVerification

structure CGDRevisionState where
  initialRaw : String
  finalIsYes : Bool

def cgdCheckerProjection (s : CGDRevisionState) : String := s.initialRaw

theorem cgdCheckerProjection_not_injective (raw : String) :
    ¬ Function.Injective cgdCheckerProjection := by
  intro hinj
  have h : (CGDRevisionState.mk raw true) =
      (CGDRevisionState.mk raw false) := hinj rfl
  have hfinal : true = false := congrArg CGDRevisionState.finalIsYes h
  cases hfinal

theorem cgd_no_universal_final_decoder (raw : String) :
    ¬ ∃ decode : String → Bool,
        ∀ s : CGDRevisionState,
          decode (cgdCheckerProjection s) = s.finalIsYes := by
  rintro ⟨decode, h⟩
  have hyes := h (CGDRevisionState.mk raw true)
  have hno := h (CGDRevisionState.mk raw false)
  have hfalse : true = false := hyes.symm.trans hno
  cases hfalse

/-!
Observed 2026-10-27 archive replay: 17 CGD files, 300 families and 1150
questions each. 6702 contradiction flags, 4692 unchanged extracted
labels, 2010 changed extracted labels. Of those changed, 1158 move
wrong->correct under the *published* key, 504 correct->wrong, and
348 wrong->wrong. The published keys are disputed and these are
scorer-defined outcomes, not independent semantic adjudication.
-/
theorem cgd_observed_trace_count_partition :
    (6702 : ℕ) = 4692 + 2010 ∧
    (2010 : ℕ) = 1158 + 504 + 348 := by
  norm_num

#print axioms HsHVerification.cgdCheckerProjection_not_injective
#print axioms HsHVerification.cgd_no_universal_final_decoder
#print axioms HsHVerification.cgd_observed_trace_count_partition

end HsHVerification
