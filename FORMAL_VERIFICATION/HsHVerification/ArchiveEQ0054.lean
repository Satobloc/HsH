import Mathlib

/-!
# Archive Equation 0054: finite-core regularization descent gate

Historical Blockwave Node C writes a filament-worldsheet current `J^{mu nu}`
together with quadratic `J^2` and derivative-quadratic `(nabla J)^2` action
blocks. ArchiveEQ0053 formalizes only the alternating surface density that can
generate a thin worldsheet current.

A finite-core completion requires a map from regularized currents to the thin
current. This file proves the exact scheme-independence condition: any action
that is genuinely determined by the thin current must be constant under every
regularization change lying in the kernel of that map. In particular, the
squared norm on the regularized current cannot descend when the projection has
a nonzero kernel.

This is an abstract linear/functional-analytic gate. It does not construct a
physical regularization, multiply distributions, validate the source
translation, or establish SAT/H(s)H physics.
-/

namespace HsHVerification.ArchiveEQ0054

variable {R Smooth Thin Value : Type*}
variable [Semiring R]
variable [AddCommMonoid Smooth] [Module R Smooth]
variable [AddCommMonoid Thin] [Module R Thin]

/-- An action on regularized currents descends to the thin current exactly when
it can be evaluated after the projection, with no hidden regulator choice. -/
def DescendsAlong
    (project : Smooth →ₗ[R] Thin) (action : Smooth → Value) : Prop :=
  ∃ thinAction : Thin → Value, ∀ current, action current = thinAction (project current)

theorem descended_action_invariant_under_kernel_shift
    (project : Smooth →ₗ[R] Thin) (action : Smooth → Value)
    (hDescends : DescendsAlong project action)
    (current shift : Smooth) (hKernel : project shift = 0) :
    action (current + shift) = action current := by
  rcases hDescends with ⟨thinAction, hAction⟩
  calc
    action (current + shift) = thinAction (project (current + shift)) := hAction _
    _ = thinAction (project current) := by simp [hKernel]
    _ = action current := (hAction _).symm

theorem kernel_sensitive_witness_blocks_descent
    (project : Smooth →ₗ[R] Thin) (action : Smooth → Value)
    (current shift : Smooth) (hKernel : project shift = 0)
    (hChanges : action (current + shift) ≠ action current) :
    ¬ DescendsAlong project action := by
  intro hDescends
  exact hChanges
    (descended_action_invariant_under_kernel_shift
      project action hDescends current shift hKernel)

section NormSquare

variable [NormedAddCommGroup Smooth] [NormedAddCommGroup Thin]
variable [NormedSpace ℝ Smooth] [NormedSpace ℝ Thin]

/-- Model of a derivative-quadratic or current-quadratic contribution after a
regularized current has been placed in a normed function space. -/
def normSquareAction (current : Smooth) : ℝ :=
  ‖current‖ ^ 2

theorem nonzero_kernel_blocks_norm_square_descent
    (project : Smooth →L[ℝ] Thin)
    (shift : Smooth) (hKernel : project shift = 0) (hNonzero : shift ≠ 0) :
    ¬ DescendsAlong project.toLinearMap normSquareAction := by
  intro hDescends
  have hInvariant :=
    descended_action_invariant_under_kernel_shift
      project.toLinearMap normSquareAction hDescends (0 : Smooth) shift hKernel
  have hNormSq : ‖shift‖ ^ 2 = 0 := by
    simpa [normSquareAction] using hInvariant
  have hNorm : ‖shift‖ = 0 := by
    nlinarith [sq_nonneg ‖shift‖]
  exact hNonzero (norm_eq_zero.mp hNorm)

end NormSquare

#print axioms descended_action_invariant_under_kernel_shift
#print axioms kernel_sensitive_witness_blocks_descent
#print axioms nonzero_kernel_blocks_norm_square_descent

end HsHVerification.ArchiveEQ0054
