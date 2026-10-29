import Mathlib

/-!
# Orson P1: archived CGD non-negation missing-response sensitivity
This is a SOURCE-CONDITIONAL theorem about a genuine public benchmark census,
not an administered trial, semantic adjudication, or causal inference.

Source: aayambansal/ConsistencyBench results/*_cgd.json, 17 pinned Git blobs
listed in WORKSPACES/ORSON_VAY/CODE/2026_10_28_cgd_revision_balance_replay.py.
The non-negation subset has 16,150 recorded positions:
15,696 complete, 287 missing at both stages, 8 initial-only missing,
159 final-only missing. Complete-stage score gain = 721; among the
initial-only missing positions 2 final scores are correct; among the
final-only missing positions 59 initial scores are correct.
Unknown missing correctness is bounded in {0,1}, not imputed.
-/

namespace HsHVerification

def p1NonnegGain (finalOnlyCorrect initialOnlyCorrect bothFinalCorrect bothInitialCorrect : ℤ) : ℤ :=
  721 + 2 - 59 + finalOnlyCorrect - initialOnlyCorrect +
    bothFinalCorrect - bothInitialCorrect

theorem p1_nonneg_observed_decomposition : (721 : ℤ) + 2 - 59 = 664 := by
  norm_num

theorem p1_nonneg_category_exclusion : (654 : ℤ) - (-10) = 664 := by
  norm_num

theorem p1_nonneg_missingness_interval
    (f i bf bi : ℤ)
    (hf0 : 0 ≤ f) (hf : f ≤ 159)
    (hi0 : 0 ≤ i) (hi : i ≤ 8)
    (hbf0 : 0 ≤ bf) (hbf : bf ≤ 287)
    (hbi0 : 0 ≤ bi) (hbi : bi ≤ 287) :
    369 ≤ p1NonnegGain f i bf bi ∧ p1NonnegGain f i bf bi ≤ 1110 := by
  dsimp [p1NonnegGain]
  omega

theorem p1_nonneg_gain_positive_under_missingness
    (f i bf bi : ℤ)
    (hf0 : 0 ≤ f) (hf : f ≤ 159)
    (hi0 : 0 ≤ i) (hi : i ≤ 8)
    (hbf0 : 0 ≤ bf) (hbf : bf ≤ 287)
    (hbi0 : 0 ≤ bi) (hbi : bi ≤ 287) :
    0 < p1NonnegGain f i bf bi := by
  have h := p1_nonneg_missingness_interval f i bf bi
    hf0 hf hi0 hi hbf0 hbf hbi0 hbi
  omega

#print axioms p1_nonneg_observed_decomposition
#print axioms p1_nonneg_category_exclusion
#print axioms p1_nonneg_missingness_interval
#print axioms p1_nonneg_gain_positive_under_missingness

/- Observational equivalence is relative to a specified readout map.
   This formalizes the equivalence-relation part of Nathan-attributed RMS,
   not any claim that distinct models are ontologically identical. -/
def p1ObsEq {Model Observation : Type*}
    (readout : Model → Observation) (a b : Model) : Prop :=
  readout a = readout b

theorem p1_obsEq_refl {M O : Type*} (readout : M → O) (a : M) :
    p1ObsEq readout a a := rfl

theorem p1_obsEq_symm {M O : Type*} (readout : M → O) (a b : M)
    (h : p1ObsEq readout a b) : p1ObsEq readout b a := h.symm

theorem p1_obsEq_trans {M O : Type*} (readout : M → O) (a b c : M)
    (hab : p1ObsEq readout a b) (hbc : p1ObsEq readout b c) :
    p1ObsEq readout a c := hab.trans hbc

#print axioms p1_obsEq_refl
#print axioms p1_obsEq_symm
#print axioms p1_obsEq_trans

end HsHVerification
