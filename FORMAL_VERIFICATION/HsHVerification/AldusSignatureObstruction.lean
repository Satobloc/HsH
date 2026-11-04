import Mathlib

/-!
# Native Euclidean / historical Lorentzian signature obstruction

The current BEDROCK convention records a positive Euclidean ambient signature
(++++) while the historical assistant-generated Blockwave action uses a
Lorentzian unit-timelike condition u·u = -1.

This module proves one deliberately narrow algebraic statement: no function
can preserve the displayed Lorentzian quadratic form as the displayed
positive-definite Euclidean quadratic form on every vector.

It does NOT rule out a non-isometric map, a separately induced Lorentzian
metric, a Wick/analytic continuation, or a model with different typed
domains. It does not validate either physical model or establish a map
between them.
-/

namespace HsHVerification.AldusSignatureObstruction

/-- Four real coordinates, with no physical units or interpretation attached. -/
abbrev FourVector := Fin 4 → ℝ

/-- Positive-definite (++++) quadratic form. -/
def euclideanQuadraticForm (x : FourVector) : ℝ :=
  ∑ i : Fin 4, (x i) ^ 2

/-- Lorentzian (-+++) quadratic form in the same coordinate ordering. -/
def lorentzianQuadraticForm (x : FourVector) : ℝ :=
  -(x 0) ^ 2 + (x 1) ^ 2 + (x 2) ^ 2 + (x 3) ^ 2

/-- The first coordinate basis vector, timelike for the displayed Lorentz form. -/
def lorentzianTimeBasis : FourVector :=
  Fin.cases 1 (fun _ => 0)

theorem euclideanQuadraticForm_nonneg (x : FourVector) :
    0 ≤ euclideanQuadraticForm x := by
  unfold euclideanQuadraticForm
  exact Finset.sum_nonneg (fun i hi => sq_nonneg (x i))

theorem lorentzianTimeBasis_negative :
    lorentzianQuadraticForm lorentzianTimeBasis = -1 := by
  simp [lorentzianQuadraticForm, lorentzianTimeBasis]

/--
A quadratic-form-preserving map from this Lorentzian form to this
positive-definite Euclidean form cannot exist if the source has any
negative-norm vector. This is the conditional real-isometry obstruction.
-/
theorem no_form_preserving_map_from_lorentzian_to_euclidean
    (f : FourVector → FourVector)
    (v : FourVector)
    (hpres : ∀ x, euclideanQuadraticForm (f x) = lorentzianQuadraticForm x)
    (hv : lorentzianQuadraticForm v < 0) : False := by
  have hpos : 0 ≤ euclideanQuadraticForm (f v) :=
    euclideanQuadraticForm_nonneg (f v)
  rw [hpres v] at hpos
  exact (not_le_of_gt hv) hpos

/-- The displayed (-+++) form has a negative-norm vector, so the obstruction applies. -/
theorem no_global_quadratic_form_preserving_map
    (f : FourVector → FourVector)
    (hpres : ∀ x, euclideanQuadraticForm (f x) = lorentzianQuadraticForm x) :
    False := by
  apply no_form_preserving_map_from_lorentzian_to_euclidean f lorentzianTimeBasis hpres
  rw [lorentzianTimeBasis_negative]
  norm_num

#eval euclideanQuadraticForm lorentzianTimeBasis
#eval lorentzianQuadraticForm lorentzianTimeBasis

#print axioms euclideanQuadraticForm_nonneg
#print axioms lorentzianTimeBasis_negative
#print axioms no_form_preserving_map_from_lorentzian_to_euclidean
#print axioms no_global_quadratic_form_preserving_map

end HsHVerification.AldusSignatureObstruction
