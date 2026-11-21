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

#print axioms exactIter_preserves_admissibility
#print axioms approximateIter_preserves_admissibility
#print axioms errorBudget_nonneg
#print axioms finiteChainProjectionErrorBound
#print axioms everyFiniteStageBudgetNonnegative

end HsHVerification.RavelNStageHeterogeneousErrorTransfer
