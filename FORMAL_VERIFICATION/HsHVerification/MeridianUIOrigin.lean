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

#print axioms core_history_inside_shell_history
#print axioms marked_history_injective
#print axioms nonzero_period_cannot_close_full_history
#print axioms recenter_event_is_zero
#print axioms zero_scale_forgets_direction

end HsHVerification.MeridianUIOrigin
