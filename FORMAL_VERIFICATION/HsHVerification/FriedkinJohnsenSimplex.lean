import Mathlib

/-!
# Friedkin–Johnsen simplex invariance

Source: Samira Abedini et al., "Don't Trust Stubborn Neighbors: A Security
Framework for Agentic Networks", arXiv:2603.15809v1 (16 March 2026), Eq. (1),
pp. 5–6.

The source equation is

  b_i(t+1) = γ_i s_i
    + (1 - γ_i) α_i b_i(t)
    + (1 - γ_i) (1 - α_i) ∑_j w_ij b_j(t),

with γ_i, α_i ∈ [0,1] and each influence row nonnegative and summing to one.
This module formalizes a finite-dimensional one-row specialization:
a row-stochastic weighted peer mean is a probability vector, and one
Friedkin–Johnsen update preserves the finite probability simplex.

Epistemic boundary:
- The source equation is historical-source content.
- The finite-simplex predicates and theorem packaging below are an
  assistant reconstruction of that equation.
- These proofs establish only one-step simplex invariance under the stated
  hypotheses. They do not prove convergence, the paper's empirical fit,
  causal persuasion, independent agent identity, human cognition, or any
  H(s)H/SAT physical interpretation.
-/

namespace HsHVerification.FriedkinJohnsenSimplex

/-- A finite probability vector: nonnegative coordinates summing to one. -/
def IsSimplex {d : ℕ} (x : Fin d → ℝ) : Prop :=
  (∀ k, 0 ≤ x k) ∧ (∑ k : Fin d, x k = 1)

/-- Each coordinate of a finite probability vector is at most one. -/
lemma probCoord_le_one {d : ℕ} (x : Fin d → ℝ)
    (hx : IsSimplex x) (k : Fin d) :
    x k ≤ 1 := by
  calc
    x k ≤ ∑ i : Fin d, x i := by
      exact Finset.single_le_sum
        (fun i hi => hx.1 i) (Finset.mem_univ k)
    _ = 1 := hx.2

/-- The peer belief coordinate formed from one row of the influence matrix. -/
def peerMean {n d : ℕ} (w : Fin n → ℝ)
    (beliefs : Fin n → Fin d → ℝ) : Fin d → ℝ :=
  fun k => ∑ j : Fin n, w j * beliefs j k

/-- One coordinate of the Friedkin–Johnsen update in the source's Eq. (1). -/
def fjUpdate (γ α prior current peer : ℝ) : ℝ :=
  γ * prior + (1 - γ) * α * current
    + (1 - γ) * (1 - α) * peer

lemma peerMean_nonneg {n d : ℕ} (w : Fin n → ℝ)
    (beliefs : Fin n → Fin d → ℝ)
    (hw : ∀ j, 0 ≤ w j)
    (hbeliefs : ∀ j k, 0 ≤ beliefs j k) (k : Fin d) :
    0 ≤ peerMean w beliefs k := by
  unfold peerMean
  apply Finset.sum_nonneg
  intro j hj
  exact mul_nonneg (hw j) (hbeliefs j k)

/-- The coordinates of a row-stochastic weighted peer mean still sum to one. -/
lemma peerMean_sum_eq_one {n d : ℕ} (w : Fin n → ℝ)
    (beliefs : Fin n → Fin d → ℝ)
    (hwSum : ∑ j : Fin n, w j = 1)
    (hbeliefs : ∀ j, IsSimplex (beliefs j)) :
    ∑ k : Fin d, peerMean w beliefs k = 1 := by
  unfold peerMean
  rw [Finset.sum_comm]
  simp_rw [← Finset.mul_sum]
  calc
    ∑ j : Fin n, w j * (∑ k : Fin d, beliefs j k)
        = ∑ j : Fin n, w j := by
            apply Finset.sum_congr rfl
            intro j hj
            rw [(hbeliefs j).2]
            ring
    _ = 1 := hwSum

/-- A row-stochastic weighted peer mean is again a probability vector. -/
theorem peerMean_preserves_simplex {n d : ℕ} (w : Fin n → ℝ)
    (beliefs : Fin n → Fin d → ℝ)
    (hwNonneg : ∀ j, 0 ≤ w j)
    (hwSum : ∑ j : Fin n, w j = 1)
    (hbeliefs : ∀ j, IsSimplex (beliefs j)) :
    IsSimplex (peerMean w beliefs) := by
  constructor
  · intro k
    exact peerMean_nonneg w beliefs hwNonneg
      (fun j k => (hbeliefs j).1 k) k
  · exact peerMean_sum_eq_one w beliefs hwSum hbeliefs

lemma fjUpdate_nonneg (γ α prior current peer : ℝ)
    (hγ0 : 0 ≤ γ) (hγ1 : γ ≤ 1)
    (hα0 : 0 ≤ α) (hα1 : α ≤ 1)
    (hprior : 0 ≤ prior) (hcurrent : 0 ≤ current) (hpeer : 0 ≤ peer) :
    0 ≤ fjUpdate γ α prior current peer := by
  unfold fjUpdate
  have h1 : 0 ≤ γ * prior := mul_nonneg hγ0 hprior
  have h2 : 0 ≤ (1 - γ) * α * current :=
    mul_nonneg (mul_nonneg (sub_nonneg.mpr hγ1) hα0) hcurrent
  have h3 : 0 ≤ (1 - γ) * (1 - α) * peer :=
    mul_nonneg
      (mul_nonneg (sub_nonneg.mpr hγ1) (sub_nonneg.mpr hα1)) hpeer
  linarith

lemma fjUpdate_le_one (γ α prior current peer : ℝ)
    (hγ0 : 0 ≤ γ) (hγ1 : γ ≤ 1)
    (hα0 : 0 ≤ α) (hα1 : α ≤ 1)
    (hprior : prior ≤ 1) (hcurrent : current ≤ 1) (hpeer : peer ≤ 1) :
    fjUpdate γ α prior current peer ≤ 1 := by
  unfold fjUpdate
  have hc2 : 0 ≤ (1 - γ) * α :=
    mul_nonneg (sub_nonneg.mpr hγ1) hα0
  have hc3 : 0 ≤ (1 - γ) * (1 - α) :=
    mul_nonneg (sub_nonneg.mpr hγ1) (sub_nonneg.mpr hα1)
  have h1 : γ * prior ≤ γ := by
    simpa using (mul_le_mul_of_nonneg_left hprior hγ0)
  have h2 : (1 - γ) * α * current ≤ (1 - γ) * α := by
    simpa using (mul_le_mul_of_nonneg_left hcurrent hc2)
  have h3 : (1 - γ) * (1 - α) * peer ≤ (1 - γ) * (1 - α) := by
    simpa using (mul_le_mul_of_nonneg_left hpeer hc3)
  calc
    γ * prior + (1 - γ) * α * current
        + (1 - γ) * (1 - α) * peer
      ≤ γ + (1 - γ) * α + (1 - γ) * (1 - α) := by
          linarith
    _ = 1 := by ring

/-- A single FJ coordinate update is a convex combination and stays in [0,1]. -/
theorem fjUpdate_mem_Icc (γ α prior current peer : ℝ)
    (hγ0 : 0 ≤ γ) (hγ1 : γ ≤ 1)
    (hα0 : 0 ≤ α) (hα1 : α ≤ 1)
    (hprior0 : 0 ≤ prior) (hprior1 : prior ≤ 1)
    (hcurrent0 : 0 ≤ current) (hcurrent1 : current ≤ 1)
    (hpeer0 : 0 ≤ peer) (hpeer1 : peer ≤ 1) :
    fjUpdate γ α prior current peer ∈ Set.Icc 0 1 :=
  ⟨fjUpdate_nonneg γ α prior current peer hγ0 hγ1 hα0 hα1
      hprior0 hcurrent0 hpeer0,
    fjUpdate_le_one γ α prior current peer hγ0 hγ1 hα0 hα1
      hprior1 hcurrent1 hpeer1⟩

/-- One FJ update preserves the finite probability simplex. -/
theorem fjUpdate_preserves_simplex {d : ℕ} (γ α : ℝ)
    (prior current peer : Fin d → ℝ)
    (hprior : IsSimplex prior)
    (hcurrent : IsSimplex current)
    (hpeer : IsSimplex peer)
    (hγ0 : 0 ≤ γ) (hγ1 : γ ≤ 1)
    (hα0 : 0 ≤ α) (hα1 : α ≤ 1) :
    IsSimplex (fun k => fjUpdate γ α (prior k) (current k) (peer k)) := by
  constructor
  · intro k
    exact (fjUpdate_mem_Icc γ α (prior k) (current k) (peer k)
      hγ0 hγ1 hα0 hα1
      (hprior.1 k) (probCoord_le_one prior hprior k)
      (hcurrent.1 k) (probCoord_le_one current hcurrent k)
      (hpeer.1 k) (probCoord_le_one peer hpeer k)).1
  · calc
      ∑ k : Fin d, fjUpdate γ α (prior k) (current k) (peer k)
          = γ * (∑ k : Fin d, prior k)
              + ((1 - γ) * α) * (∑ k : Fin d, current k)
              + ((1 - γ) * (1 - α)) * (∑ k : Fin d, peer k) := by
                simp [fjUpdate, Finset.sum_add_distrib, Finset.mul_sum]
      _ = γ * 1 + ((1 - γ) * α) * 1
              + ((1 - γ) * (1 - α)) * 1 := by
            rw [hprior.2, hcurrent.2, hpeer.2]
      _ = 1 := by ring

/-- The full one-row FJ network update preserves the simplex when its
    influence weights form a probability row. -/
theorem fjNetworkStep_preserves_simplex {n d : ℕ} (w : Fin n → ℝ)
    (beliefs : Fin n → Fin d → ℝ)
    (prior current : Fin d → ℝ) (γ α : ℝ)
    (hwNonneg : ∀ j, 0 ≤ w j)
    (hwSum : ∑ j : Fin n, w j = 1)
    (hbeliefs : ∀ j, IsSimplex (beliefs j))
    (hprior : IsSimplex prior)
    (hcurrent : IsSimplex current)
    (hγ0 : 0 ≤ γ) (hγ1 : γ ≤ 1)
    (hα0 : 0 ≤ α) (hα1 : α ≤ 1) :
    IsSimplex (fun k =>
      fjUpdate γ α (prior k) (current k) (peerMean w beliefs k)) := by
  exact fjUpdate_preserves_simplex γ α prior current (peerMean w beliefs)
    hprior hcurrent
    (peerMean_preserves_simplex w beliefs hwNonneg hwSum hbeliefs)
    hγ0 hγ1 hα0 hα1

#print axioms peerMean_preserves_simplex
#print axioms fjUpdate_mem_Icc
#print axioms fjUpdate_preserves_simplex
#print axioms fjNetworkStep_preserves_simplex

end HsHVerification.FriedkinJohnsenSimplex
