import Mathlib

/-!
# Source-derived algebra for Potential Conversation Synergy (PCS)

Primary source:
Tom Sheffer, Alon Miron, Asael Sklar, Yaniv Dover, and Ariel Goldstein,
"Knowledge-Certainty Diversity Predicts Human-Human and Human-AI Open-Ended
Discussion Synergy and Reveals Pure-AI Discussion Shortfalls",
arXiv:2507.22889v3, revised 2026-10-21, Methods section "Potential Conversation
Synergy (PCS)", especially the definitions of n_c, a_R(c), a_P(c), N and
the positive-part gain.

The source formula is
  PCS = 100 * sum_c (n_c / N) * max(0, a_P(c) - a_R(c)).

Each Bin represents one occupied confidence stratum. Its weight is n_c/N;
its two accuracy fields are the empirical within-stratum means. For trio
analyses, ineligible unanimous/all-different items remain in N but contribute
zero, so the sum of eligible bin weights can be less than 1.

The theorems below establish algebraic properties of the transcribed formula
only. They do not validate empirical inputs, confidence calibration,
source-role assignment, causal interpretation, or predictive performance.
The paper itself describes PCS as an in-sample oracle for a specific
confidence-based source-selection rule, not an upper bound on the benefit of
conversation.
-/

namespace HsHVerification.KnowledgeCertaintyPCS

structure Bin where
  weight : ℝ
  referenceAccuracy : ℝ
  partnerAccuracy : ℝ
  weight_nonneg : 0 ≤ weight
  referenceAccuracy_nonneg : 0 ≤ referenceAccuracy
  referenceAccuracy_le_one : referenceAccuracy ≤ 1
  partnerAccuracy_nonneg : 0 ≤ partnerAccuracy
  partnerAccuracy_le_one : partnerAccuracy ≤ 1

def weightedSum {n : ℕ} (bins : Fin n → Bin) (f : Bin → ℝ) : ℝ :=
  Finset.univ.sum fun i => (bins i).weight * f (bins i)

def pcs {n : ℕ} (bins : Fin n → Bin) : ℝ :=
  100 * weightedSum bins
    (fun b => max 0 (b.partnerAccuracy - b.referenceAccuracy))

/-- Algebraic reverse-direction diagnostic, using the same fixed bins and
    weights. This is not the paper's separately defined trio statistic. -/
def reversePCS {n : ℕ} (bins : Fin n → Bin) : ℝ :=
  100 * weightedSum bins
    (fun b => max 0 (b.referenceAccuracy - b.partnerAccuracy))

/-- Weighted reference accuracy contribution over the included strata. -/
def referenceProfile {n : ℕ} (bins : Fin n → Bin) : ℝ :=
  weightedSum bins (fun b => b.referenceAccuracy)

/-- Weighted partner accuracy contribution over the included strata. -/
def partnerProfile {n : ℕ} (bins : Fin n → Bin) : ℝ :=
  weightedSum bins (fun b => b.partnerAccuracy)

/-- Total included confidence-stratum mass. It can be below one when
    ineligible trio items remain in N but contribute zero to PCS. -/
def includedWeight {n : ℕ} (bins : Fin n → Bin) : ℝ :=
  weightedSum bins (fun _ => 1)

lemma weightedSum_congr {n : ℕ} (bins : Fin n → Bin)
    {f g : Bin → ℝ} (h : ∀ b, f b = g b) :
    weightedSum bins f = weightedSum bins g := by
  unfold weightedSum
  apply Finset.sum_congr rfl
  intro i hi
  rw [h]

lemma weightedSum_sub {n : ℕ} (bins : Fin n → Bin)
    (f g : Bin → ℝ) :
    weightedSum bins f - weightedSum bins g =
      weightedSum bins (fun b => f b - g b) := by
  unfold weightedSum
  rw [← Finset.sum_sub_distrib]
  apply Finset.sum_congr rfl
  intro i hi
  ring

lemma weightedSum_add {n : ℕ} (bins : Fin n → Bin)
    (f g : Bin → ℝ) :
    weightedSum bins f + weightedSum bins g =
      weightedSum bins (fun b => f b + g b) := by
  unfold weightedSum
  rw [← Finset.sum_add_distrib]
  apply Finset.sum_congr rfl
  intro i hi
  ring

lemma weightedSum_mono {n : ℕ} (bins : Fin n → Bin)
    (f g : Bin → ℝ) (h : ∀ b, f b ≤ g b) :
    weightedSum bins f ≤ weightedSum bins g := by
  unfold weightedSum
  apply Finset.sum_le_sum
  intro i hi
  exact mul_le_mul_of_nonneg_left (h (bins i)) (bins i).weight_nonneg

lemma weightedSum_nonneg {n : ℕ} (bins : Fin n → Bin)
    (f : Bin → ℝ) (h : ∀ b, 0 ≤ f b) :
    0 ≤ weightedSum bins f := by
  unfold weightedSum
  apply Finset.sum_nonneg
  intro i hi
  exact mul_nonneg (bins i).weight_nonneg (h (bins i))

lemma positivePart_sub (a b : ℝ) :
    max 0 (b - a) - max 0 (a - b) = b - a := by
  by_cases h : a ≤ b
  · have h₁ : 0 ≤ b - a := sub_nonneg.mpr h
    have h₂ : a - b ≤ 0 := sub_nonpos.mpr h
    simp [max_eq_right h₁, max_eq_left h₂]
  · have h' : b ≤ a := by
      by_contra hba
      exact h (le_of_lt (lt_of_not_ge hba))
    have h₁ : b - a ≤ 0 := sub_nonpos.mpr h'
    have h₂ : 0 ≤ a - b := sub_nonneg.mpr h'
    simp [max_eq_left h₁, max_eq_right h₂]

lemma positivePart_add_abs (a b : ℝ) :
    max 0 (b - a) + max 0 (a - b) = |b - a| := by
  by_cases h : a ≤ b
  · have h₁ : 0 ≤ b - a := sub_nonneg.mpr h
    have h₂ : a - b ≤ 0 := sub_nonpos.mpr h
    simp [max_eq_right h₁, max_eq_left h₂, abs_of_nonneg h₁]
  · have h' : b ≤ a := by
      by_contra hba
      exact h (le_of_lt (lt_of_not_ge hba))
    have h₁ : b - a ≤ 0 := sub_nonpos.mpr h'
    have h₂ : 0 ≤ a - b := sub_nonneg.mpr h'
    simp [max_eq_left h₁, max_eq_right h₂, abs_of_nonpos h₁]

theorem pcs_nonneg {n : ℕ} (bins : Fin n → Bin) :
    0 ≤ pcs bins := by
  unfold pcs
  apply mul_nonneg
  · norm_num
  · apply weightedSum_nonneg
    intro b
    exact le_max_left 0 (b.partnerAccuracy - b.referenceAccuracy)

/-- The difference between the two fixed-bin directional PCS values is
    exactly the weighted net accuracy gap. -/
theorem pcs_directional_difference {n : ℕ} (bins : Fin n → Bin) :
    pcs bins - reversePCS bins =
      100 * (partnerProfile bins - referenceProfile bins) := by
  unfold pcs reversePCS partnerProfile referenceProfile
  calc
    100 * weightedSum bins
        (fun b => max 0 (b.partnerAccuracy - b.referenceAccuracy)) -
      100 * weightedSum bins
        (fun b => max 0 (b.referenceAccuracy - b.partnerAccuracy))
        =
      100 * (weightedSum bins
        (fun b => max 0 (b.partnerAccuracy - b.referenceAccuracy)) -
      weightedSum bins
        (fun b => max 0 (b.referenceAccuracy - b.partnerAccuracy))) := by ring
    _ =
      100 * weightedSum bins
        (fun b => max 0 (b.partnerAccuracy - b.referenceAccuracy) -
          max 0 (b.referenceAccuracy - b.partnerAccuracy)) := by
        rw [weightedSum_sub]
    _ =
      100 * weightedSum bins
        (fun b => b.partnerAccuracy - b.referenceAccuracy) := by
        congr 1
        apply weightedSum_congr
        intro b
        exact positivePart_sub b.referenceAccuracy b.partnerAccuracy
    _ =
      100 * (weightedSum bins (fun b => b.partnerAccuracy) -
        weightedSum bins (fun b => b.referenceAccuracy)) := by
        rw [← weightedSum_sub]

/-- The sum of the two fixed-bin directional PCS values is the weighted
    L1 distance between the confidence-conditioned accuracy profiles. -/
theorem pcs_directional_total_abs {n : ℕ} (bins : Fin n → Bin) :
    pcs bins + reversePCS bins =
      100 * weightedSum bins
        (fun b => |b.partnerAccuracy - b.referenceAccuracy|) := by
  unfold pcs reversePCS
  calc
    100 * weightedSum bins
        (fun b => max 0 (b.partnerAccuracy - b.referenceAccuracy)) +
      100 * weightedSum bins
        (fun b => max 0 (b.referenceAccuracy - b.partnerAccuracy))
        =
      100 * (weightedSum bins
        (fun b => max 0 (b.partnerAccuracy - b.referenceAccuracy)) +
      weightedSum bins
        (fun b => max 0 (b.referenceAccuracy - b.partnerAccuracy))) := by ring
    _ =
      100 * weightedSum bins
        (fun b => max 0 (b.partnerAccuracy - b.referenceAccuracy) +
          max 0 (b.referenceAccuracy - b.partnerAccuracy)) := by
        rw [weightedSum_add]
    _ =
      100 * weightedSum bins
        (fun b => |b.partnerAccuracy - b.referenceAccuracy|) := by
        congr 1
        apply weightedSum_congr
        intro b
        exact positivePart_add_abs b.referenceAccuracy b.partnerAccuracy

/-- The source formula is bounded by the remaining reference-accuracy headroom
    within the included confidence strata. The weights need not sum to one;
    for trio analyses, omitted ineligible items remain in the denominator N. -/
theorem pcs_le_weighted_reference_headroom {n : ℕ}
    (bins : Fin n → Bin) :
    pcs bins ≤ 100 * (includedWeight bins - referenceProfile bins) := by
  have hpoint : ∀ b : Bin,
      max 0 (b.partnerAccuracy - b.referenceAccuracy) ≤
        1 - b.referenceAccuracy := by
    intro b
    apply max_le
    · linarith [b.referenceAccuracy_le_one]
    · linarith [b.partnerAccuracy_le_one]
  have hsum :
      weightedSum bins
        (fun b => max 0 (b.partnerAccuracy - b.referenceAccuracy)) ≤
      weightedSum bins (fun b => 1 - b.referenceAccuracy) :=
    weightedSum_mono bins _ _ hpoint
  have hrewrite :
      weightedSum bins (fun b => 1 - b.referenceAccuracy) =
        includedWeight bins - referenceProfile bins := by
    unfold includedWeight referenceProfile
    rw [← weightedSum_sub]
  calc
    pcs bins =
      100 * weightedSum bins
        (fun b => max 0 (b.partnerAccuracy - b.referenceAccuracy)) := rfl
    _ ≤ 100 * weightedSum bins
        (fun b => 1 - b.referenceAccuracy) := by
          exact mul_le_mul_of_nonneg_left hsum (by norm_num)
    _ = 100 * (includedWeight bins - referenceProfile bins) := by
          rw [hrewrite]

/-- If the weighted partner profile is no better than the reference profile
    over these same bins, the reverse-direction diagnostic is at least as
    large as the source-direction PCS. This premise must be checked; it is
    not inferred merely from a different role assignment. -/
theorem pcs_le_reverse_of_reference_profile_ge {n : ℕ}
    (bins : Fin n → Bin)
    (h : partnerProfile bins ≤ referenceProfile bins) :
    pcs bins ≤ reversePCS bins := by
  have hscaled :
      100 * (partnerProfile bins - referenceProfile bins) ≤ 0 := by
    nlinarith
  rw [← pcs_directional_difference bins] at hscaled
  linarith

#print axioms pcs_nonneg
#print axioms pcs_directional_difference
#print axioms pcs_directional_total_abs
#print axioms pcs_le_weighted_reference_headroom
#print axioms pcs_le_reverse_of_reference_profile_ge

end HsHVerification.KnowledgeCertaintyPCS
