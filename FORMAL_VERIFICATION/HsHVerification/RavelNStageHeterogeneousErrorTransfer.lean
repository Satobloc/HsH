import Mathlib
import HsHVerification.RavelHeterogeneousProjectionErrorTransfer

/-!
# Ravel: finite-chain heterogeneous projection-error transfer

This module generalizes the existing two-stage heterogeneous projection
bound to a finite chain of representation spaces. Each stage may have a
different carrier type and pseudometric. Each stage also supplies its own
admissible input domain, Lipschitz constant, and approximation-error bound.

The admissible predicates are indexed by stage. Both the exact and
approximate trajectories must remain admissible at every stage. The
Lipschitz and local approximation bounds are asserted only on the declared
admissible domain; no global regularity is inferred.

For stage k, the error budget obeys

    E_(k+1) = epsilon_k + L_k * E_k,   E_0 = 0.

The theorem proves the bound for every finite chain length. It therefore
supports repeated projection/coarse-graining/readout composition without
silently adding errors from different metric spaces. Every stage still
requires its own calibrated metric, admissible domain, Lipschitz certificate,
and local approximation bound.

No H(s)H physical map, worldtube thickness, twist, contact surface, metric,
unit conversion, calibration, measured system, or numerical uncertainty is
instantiated. This is a conditional mathematical composition theorem only.
The source-to-map translation and empirical validity of every premise remain
separate questions.
-/

namespace HsHVerification.RavelNStageHeterogeneousErrorTransfer

universe u

variable {X : Nat → Type u}
variable [∀ n, PseudoMetricSpace (X n)]
variable (A : ∀ n, X n → Prop)

/-- One heterogeneous stage in a finite representation chain. The
    admissible predicate is indexed so that each stage can have a different
    domain and codomain while the output of stage n is the input of stage
    n+1. -/
structure StageContract (n : Nat) where
  exactMap : X n → X (n + 1)
  approximateMap : X n → X (n + 1)
  lipschitzConstant : ℝ
  localError : ℝ
  nonnegLipschitz : 0 ≤ lipschitzConstant
  nonnegLocalError : 0 ≤ localError
  exactPreservesAdmissible :
    ∀ x, A n x → A (n + 1) (exactMap x)
  approximatePreservesAdmissible :
    ∀ x, A n x → A (n + 1) (approximateMap x)
  lipschitzOnAdmissible :
    ∀ x y, A n x → A n y →
      dist (exactMap x) (exactMap y) ≤
        lipschitzConstant * dist x y
  approximationOnAdmissible :
    ∀ y, A n y →
      dist (exactMap y) (approximateMap y) ≤ localError

variable (S : ∀ n, StageContract A n)

/-- Exact composition through the first n stages. -/
def exactIter : (n : Nat) → X 0 → X n
  | 0, x => x
  | n + 1, x => (S n).exactMap (exactIter n x)

/-- Approximate composition through the first n stages. -/
def approximateIter : (n : Nat) → X 0 → X n
  | 0, x => x
  | n + 1, x => (S n).approximateMap (approximateIter n x)

/-- The recursively composed worst-case error budget. -/
def errorBudget : Nat → ℝ
  | 0 => 0
  | n + 1 =>
      (S n).localError +
        (S n).lipschitzConstant * errorBudget n

theorem exactIter_preserves_admissibility :
    ∀ n x, A 0 x → A n (exactIter A S n x) := by
  intro n
  induction n with
  | zero =>
      intro x hx
      simpa [exactIter] using hx
  | succ n ih =>
      intro x hx
      exact (S n).exactPreservesAdmissible
        (exactIter A S n x) (ih x hx)

theorem approximateIter_preserves_admissibility :
    ∀ n x, A 0 x → A n (approximateIter A S n x) := by
  intro n
  induction n with
  | zero =>
      intro x hx
      simpa [approximateIter] using hx
  | succ n ih =>
      intro x hx
      exact (S n).approximatePreservesAdmissible
        (approximateIter A S n x) (ih x hx)

theorem errorBudget_nonneg :
    ∀ n, 0 ≤ errorBudget A S n := by
  intro n
  induction n with
  | zero =>
      simp [errorBudget]
  | succ n ih =>
      simpa [errorBudget] using
        add_nonneg (S n).nonnegLocalError
          (mul_nonneg (S n).nonnegLipschitz ih)

/-- Every finite heterogeneous chain has an error bound obtained by
    recursively transporting the previous-stage discrepancy through the
    next stage's admissible Lipschitz bound and adding that stage's local
    approximation error. -/
theorem finiteChainProjectionErrorBound :
    ∀ n x, A 0 x →
      dist (exactIter A S n x) (approximateIter A S n x) ≤
        errorBudget A S n := by
  intro n
  induction n with
  | zero =>
      intro x hx
      simp [exactIter, approximateIter, errorBudget]
  | succ n ih =>
      intro x hx
      have hExact :
          A n (exactIter A S n x) :=
        exactIter_preserves_admissibility A S n x hx
      have hApprox :
          A n (approximateIter A S n x) :=
        approximateIter_preserves_admissibility A S n x hx
      calc
        dist (exactIter A S (n + 1) x)
            (approximateIter A S (n + 1) x)
            =
          dist ((S n).exactMap (exactIter A S n x))
            ((S n).approximateMap (approximateIter A S n x)) := rfl
        _ ≤
          dist ((S n).exactMap (exactIter A S n x))
            ((S n).exactMap (approximateIter A S n x)) +
          dist ((S n).exactMap (approximateIter A S n x))
            ((S n).approximateMap (approximateIter A S n x)) :=
          dist_triangle _ _ _
        _ ≤
          (S n).lipschitzConstant *
              dist (exactIter A S n x) (approximateIter A S n x) +
            (S n).localError :=
          add_le_add
            ((S n).lipschitzOnAdmissible
              (exactIter A S n x) (approximateIter A S n x)
              hExact hApprox)
            ((S n).approximationOnAdmissible
              (approximateIter A S n x) hApprox)
        _ ≤
          (S n).lipschitzConstant * errorBudget A S n +
            (S n).localError :=
          add_le_add
            (mul_le_mul_of_nonneg_left (ih x hx)
              (S n).nonnegLipschitz)
            le_rfl
        _ = errorBudget A S (n + 1) := by
          simp [errorBudget]
          ring

/-- A successful replication assessment needs nonnegative stage budgets;
    this is proved independently of the trajectory bound. -/
theorem everyFiniteStageBudgetNonnegative
    (n : Nat) :
    0 ≤ errorBudget A S n :=
  errorBudget_nonneg A S n


/-- The exact finite-sum form of the recursively propagated error budget.
    Each stage's local error is multiplied by every downstream Lipschitz
    factor. The empty downstream product is one, so the final stage contributes
    its local error without further amplification. This is an algebraic
    attribution of the formal budget, not an empirical estimate of any stage. -/
def stagewiseErrorBudget (n : Nat) : ℝ :=
  ∑ j ∈ Finset.Ico 0 n,
    (S j).localError * ∏ i ∈ Finset.Ico (j + 1) n,
      (S i).lipschitzConstant

/-- The recurrence E_(k+1) = epsilon_k + L_k E_k is exactly the sum of
    stage-local errors transported through all subsequent Lipschitz factors:
      E_n = sum_{j < n} epsilon_j * product_{j < k < n} L_k.
    This exposes which intermediate stage amplifies each local error. -/
theorem errorBudget_eq_stagewiseErrorBudget :
    ∀ n, errorBudget A S n = stagewiseErrorBudget A S n := by
  intro n
  induction n with
  | zero =>
      simp [errorBudget, stagewiseErrorBudget]
  | succ n ih =>
      have hsum :
          (S n).lipschitzConstant * stagewiseErrorBudget A S n +
            (S n).localError =
          stagewiseErrorBudget A S (n + 1) := by
        unfold stagewiseErrorBudget
        rw [Finset.sum_Ico_succ_top (Nat.zero_le n),
          Finset.mul_sum, Finset.Ico_self, Finset.prod_empty, mul_one]
        congrm $(Finset.sum_congr rfl fun j hj ↦ ?_) + (S n).localError
        rw [Finset.prod_Ico_succ_top (by
          have hj' := Finset.mem_Ico.mp hj
          omega)]
        ring
      calc
        errorBudget A S (n + 1) =
            (S n).localError +
              (S n).lipschitzConstant * errorBudget A S n := rfl
        _ = (S n).lipschitzConstant * stagewiseErrorBudget A S n +
              (S n).localError := by rw [ih]; ring
        _ = stagewiseErrorBudget A S (n + 1) := hsum


/-- Increasing any stage's local approximation-error bound or
    Lipschitz amplification bound cannot decrease the recursively
    propagated finite-chain error budget. This supports sensitivity
    triage across a representation chain; it does not supply empirical
    values or identify which physical stage is dominant. -/
theorem errorBudget_monotone_under_stagewise_bound_worsening
    (T : ∀ n, StageContract A n)
    (hLocal :
      ∀ n, (S n).localError ≤ (T n).localError)
    (hLipschitz :
      ∀ n, (S n).lipschitzConstant ≤ (T n).lipschitzConstant) :
    ∀ n, errorBudget A S n ≤ errorBudget A T n := by
  intro n
  induction n with
  | zero =>
      simp [errorBudget]
  | succ n ih =>
      have hLipFactor :
          (S n).lipschitzConstant * errorBudget A S n ≤
            (T n).lipschitzConstant * errorBudget A S n :=
        mul_le_mul_of_nonneg_right
          (hLipschitz n) (errorBudget_nonneg A S n)
      have hBudgetFactor :
          (T n).lipschitzConstant * errorBudget A S n ≤
            (T n).lipschitzConstant * errorBudget A T n :=
        mul_le_mul_of_nonneg_left
          ih (T n).nonnegLipschitz
      have hProduct := le_trans hLipFactor hBudgetFactor
      simpa [errorBudget] using add_le_add (hLocal n) hProduct

#print axioms errorBudget_monotone_under_stagewise_bound_worsening

#print axioms exactIter_preserves_admissibility
#print axioms approximateIter_preserves_admissibility
#print axioms errorBudget_nonneg
#print axioms finiteChainProjectionErrorBound
#print axioms everyFiniteStageBudgetNonnegative
#print axioms errorBudget_eq_stagewiseErrorBudget

end HsHVerification.RavelNStageHeterogeneousErrorTransfer
