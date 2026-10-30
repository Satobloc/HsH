import Mathlib

/-!
# Meridian UI origin and coiling type gates | 2026-10-27

Real measured-system anchor: GRAVITY Collaboration, A&A 636 L5 (2020),
S2 orbit around Sgr A*, Appendix E Table E.1 (a=125.058 mas,
R0=8246.7 pc, e=0.884649, M=4.261 million solar masses).
Original Meridian mapper:
WORKSPACES/MERIDIAN/SOLVER_HARNESS/UI_MAPPER/ui_mapper_basic.py
Git blob 373d8632429e010532e6ca2589465bb90a9a3c1d.

Nathan Direct user-role source: Sept 7 2026 Ravel conversation, messages
2a34f106-0dd0-488f-a0e6-97748320c955 and
b282ba5d-023f-4f4d-86c3-7ff17a6c8c58, indexed in verified Ravel
batch 04 blob 7d35aa1ea4c2752b78d4ffcab8eb51022b8c7cd8.
Kestrel typed crosswalk blob a636dea8640d629db270b5f00e699f280f82b912.

These are conditional set, injection and zero-scale algebra theorems.
They do not prove physical coiling, Kerr geometry, observational fit,
a timesheet constitutive law or an H(s)H prediction.
-/

namespace HsHVerification.MeridianUIOrigin

-- A core section K inside a shell S remains included after applying
-- the SAME typed worldtube embedding E to their marked histories.
theorem core_history_inside_shell_history
    {I S M : Type*} (K Shell : Set S) (h : K ⊆ Shell)
    (E : I × S → M) :
    E '' {p : I × S | p.2 ∈ K} ⊆
      E '' {p : I × S | p.2 ∈ Shell} := by
  intro y hy
  rcases hy with ⟨p, hp, rfl⟩
  exact ⟨p, h hp, rfl⟩

-- A spatial trace may be periodic while its full marked history retains
-- an affine time coordinate and is injective.
theorem marked_history_injective
    {S : Type*} (x : ℝ → S) :
    Function.Injective (fun t : ℝ => (x t, t)) := by
  intro a b hab
  exact congrArg Prod.snd hab

theorem nonzero_period_cannot_close_full_history
    {S : Type*} (x : ℝ → S) (T : ℝ) (hT : T ≠ 0) :
    ¬ (∀ t : ℝ, (x (t + T), t + T) = (x t, t)) := by
  intro h
  have ht := congrArg Prod.snd (h 0)
  have hzero : T = 0 := by simpa using ht
  exact hT hzero

-- Changing affine origin to the observed event itself yields zero
-- four-vector; the original UI mapper's direction X / ||X|| is undefined.
theorem recenter_event_is_zero (x : Fin 4 → ℝ) :
    (fun i : Fin 4 => x i - x i) =
      (fun _ : Fin 4 => (0 : ℝ)) := by
  funext i
  ring

-- Zero-scale reconstruction is exact for every direction, so a
-- reconstruction-error check cannot certify direction recovery at r=0.
theorem zero_scale_forgets_direction :
    ¬ Function.Injective
      (fun u : Fin 4 → ℝ => fun i : Fin 4 => (0 : ℝ) * u i) := by
  intro hinj
  have heq : (fun _ : Fin 4 => (0 : ℝ)) =
      (fun _ : Fin 4 => (1 : ℝ)) := by
    apply hinj
    funext i
    simp
  have hcoord := congrArg (fun f : Fin 4 → ℝ => f 0) heq
  norm_num at hcoord

/-!
Candidate map from the Kestrel → Meridian 2026-10-30 handoff:
  j^mu_Sigma = J_ws^{mu nu} n_nu.
This is NOT a Nathan Direct equation and NOT yet an electromagnetic
current. The component lemmas below establish only algebraic tangency
and the antisymmetric-derivative residual. They do not define a
distributional support, a foliation, a covariant derivative, a charge
normalization, or an EM coupling.
-/

/-- Contracting an antisymmetric rank-two tensor with a slice normal
    gives a vector orthogonal to that normal: n_mu J^{mu nu} n_nu = 0. -/
theorem antisymmetric_contraction_is_tangent
    {n : ℕ} (J : Fin n → Fin n → ℝ) (normal : Fin n → ℝ)
    (hJ : ∀ i j, J i j = -J j i) :
    ∑ i : Fin n, normal i * (∑ j : Fin n, J i j * normal j) = 0 := by
  classical
  let F : Fin n → Fin n → ℝ := fun i j => normal i * J i j * normal j
  have hF : ∀ i j, F i j = -F j i := by
    intro i j
    dsimp [F]
    rw [hJ j i]
    ring
  have hsum :
      (∑ i : Fin n, ∑ j : Fin n, F i j) =
        -(∑ i : Fin n, ∑ j : Fin n, F i j) := by
    calc
      _ = ∑ j : Fin n, ∑ i : Fin n, F i j := by
        rw [Finset.sum_comm]
      _ = ∑ j : Fin n, ∑ i : Fin n, -F j i := by
        apply Finset.sum_congr rfl
        intro j hj
        apply Finset.sum_congr rfl
        intro i hi
        exact hF i j
      _ = -∑ j : Fin n, ∑ i : Fin n, F j i := by simp
      _ = -∑ i : Fin n, ∑ j : Fin n, F i j := by
        rw [Finset.sum_comm]
  calc
    _ = ∑ i : Fin n, ∑ j : Fin n, F i j := by
      simp [F, Finset.mul_sum, mul_assoc]
    _ = 0 := by
      linarith [hsum]

/-- Algebraic divergence gate: when a conserved antisymmetric current
    J is contracted with a varying normal n, the extra term
    J^{mu nu} D_mu n_nu depends only on the antisymmetric part
    D_mu n_nu - D_nu n_mu. In a torsion-free covariant setting this is
    the component identity underlying
    div(J·n) = (div J)·n + (1/2) J·dn.
    This theorem does not itself define the covariant derivative. -/
theorem antisymmetric_pairing_uses_only_antisymmetric_derivative
    {n : ℕ} (J D : Fin n → Fin n → ℝ)
    (hJ : ∀ i j, J i j = -J j i) :
    (∑ i : Fin n, ∑ j : Fin n, J i j * D i j) =
      (1 / 2 : ℝ) *
        (∑ i : Fin n, ∑ j : Fin n, J i j * (D i j - D j i)) := by
  classical
  let A : ℝ := ∑ i : Fin n, ∑ j : Fin n, J i j * D i j
  let B : ℝ := ∑ i : Fin n, ∑ j : Fin n, J i j * D j i
  have hB : B = -A := by
    calc
      B = ∑ j : Fin n, ∑ i : Fin n, J j i * D i j := by
        dsimp [B]
        rw [Finset.sum_comm]
      _ = ∑ j : Fin n, ∑ i : Fin n, -(J i j * D i j) := by
        apply Finset.sum_congr rfl
        intro j hj
        apply Finset.sum_congr rfl
        intro i hi
        rw [hJ j i]
        ring
      _ = -∑ j : Fin n, ∑ i : Fin n, J i j * D i j := by simp
      _ = -A := by
        dsimp [A]
        rw [Finset.sum_comm]
  have hC :
      (∑ i : Fin n, ∑ j : Fin n, J i j * (D i j - D j i)) = A - B := by
    dsimp [A, B]
    simp [Finset.sum_sub_distrib, mul_sub]
  rw [hC, hB]
  dsimp [A]
  ring

#print axioms core_history_inside_shell_history
#print axioms marked_history_injective
#print axioms nonzero_period_cannot_close_full_history
#print axioms recenter_event_is_zero
#print axioms zero_scale_forgets_direction
#print axioms antisymmetric_contraction_is_tangent
#print axioms antisymmetric_pairing_uses_only_antisymmetric_derivative

end HsHVerification.MeridianUIOrigin
