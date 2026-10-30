import Mathlib

/-!
# Calder: signature-aware Blockwave transverse-projector audit

Historical source: Satobloc/SAT_THEORY_ARCHIVE_2023-25,
SATOBLOC/SATO-BLOCK Hamiltonian and Hilbert Space.txt,
Git blob 13b6da983ea8dcad5509b1c6941b8855a2653677.
Original formula P_{μν}=g_{μν}+u_μ u_ν, u^μ u_μ=-1.
This is a Lorentzian timelike-unit formula. It cannot be copied
unchanged into a positive-definite Euclidean metric.

We use a four-coordinate frame adapted to the unit direction u=e0.
This is pure algebra about formalized linear maps, NOT a physical
simulation, data fixture, dynamical stability result, or proof that
only two propagating polarizations exist.
-/

namespace HsHVerification.CalderProjectorSignature

abbrev Four := Fin 4 → ℝ

/-- In an orthonormal Euclidean frame with u=e0, the source's
    naive plus-sign formula I + u⊗u doubles the longitudinal component. -/
def euclideanPlus (v : Four) : Four :=
  fun i => if i = 0 then (2 : ℝ) * v i else v i

/-- The orthogonal projector I - u⊗u in the same Euclidean frame. -/
def transverse (v : Four) : Four :=
  fun i => if i = 0 then 0 else v i

/-- In a Lorentzian orthonormal frame with g(u,u)=-1, the mixed
    operator δ^μ_ν + u^μ u_ν has longitudinal entry 1-1=0. -/
def lorentzianPlusMixed (v : Four) : Four :=
  fun i => if i = 0 then v i + v 0 * (-1) else v i

/-- For every input with nonzero longitudinal component,
    the Euclidean plus-sign operator is not idempotent. -/
theorem euclidean_plus_not_idempotent (v : Four) (hv : v 0 ≠ 0) :
    euclideanPlus (euclideanPlus v) ≠ euclideanPlus v := by
  intro h
  have h0 := congrArg (fun w : Four => w 0) h
  have hz : v 0 = 0 := by
    simp only [euclideanPlus, ↓reduceIte] at h0
    linarith
  exact hv hz

/-- The correctly signed Euclidean transverse operator is idempotent. -/
theorem transverse_idempotent (v : Four) :
    transverse (transverse v) = transverse v := by
  funext i
  by_cases hi : i = 0
  · subst i
    simp [transverse]
  · simp [transverse, hi]

/-- The longitudinal component is removed, not doubled. -/
theorem transverse_longitudinal_zero (v : Four) :
    transverse v 0 = 0 := by
  simp [transverse]

/-- With the Lorentzian lowering of u, the historical plus-sign
    mixed-index formula agrees with the transverse operator. -/
theorem lorentzian_plus_agrees_with_transverse (v : Four) :
    lorentzianPlusMixed v = transverse v := by
  funext i
  by_cases hi : i = 0
  · subst i
    simp [lorentzianPlusMixed, transverse]
  · simp [lorentzianPlusMixed, transverse, hi]

#print axioms euclidean_plus_not_idempotent
#print axioms transverse_idempotent
#print axioms transverse_longitudinal_zero
#print axioms lorentzian_plus_agrees_with_transverse

end HsHVerification.CalderProjectorSignature


/-!
## Separate Euclidean-to-Lorentzian readout candidate

Historical provenance boundary:
* Nathan-attributed source geometry describes a positive/spacelike 4D
  arrangement with a preferred motion direction; see the role/turn-context
  limitations recorded in the accompanying source-fidelity report.
* The explicit tensor candidate g = delta - 2 u^flat tensor u^flat is
  an assistant-derived HAGALAZ/Meridian reconstruction, not a recovered
  Nathan Direct equation and not a promoted physical law.

For a Euclidean unit direction u, this bilinear form is negative on u
and agrees with the Euclidean inner product on u-perp. Thus it supplies
a mathematically coherent *separate full-space Lorentzian readout*.
The Euclidean transverse projector and this bilinear form are distinct
maps. The timesheet u-perp remains positive definite; no derivation of
the physical director field, its dynamics, or its relation to w = c*t
is supplied here.
-/

namespace HsHVerification.CalderPreferredDirectionMetric

abbrev Four := Fin 4 → ℝ

/-- Standard positive-definite Euclidean inner product on Fin 4 -> R. -/
def euclideanDot4 (x y : Four) : ℝ :=
  ∑ i : Fin 4, x i * y i

/-- Candidate effective bilinear form delta - 2 u^flat tensor u^flat.
    The covector u^flat is lowered using the Euclidean inner product. -/
def preferredDirectionMetric (u x y : Four) : ℝ :=
  euclideanDot4 x y - 2 * euclideanDot4 u x * euclideanDot4 u y

/-- A nonzero vector has strictly positive Euclidean squared norm. -/
theorem euclideanDot4_self_pos (x : Four) (hx : x ≠ 0) :
    0 < euclideanDot4 x x := by
  unfold euclideanDot4
  have hne : ∃ i : Fin 4, x i ≠ 0 := by
    by_contra h
    push_neg at h
    apply hx
    funext i
    exact h i
  have hnonneg : ∀ i ∈ Finset.univ, 0 ≤ x i * x i := by
    intro i hi
    nlinarith [sq_nonneg (x i)]
  have hpos : ∃ i ∈ Finset.univ, 0 < x i * x i := by
    obtain ⟨i, hi⟩ := hne
    exact ⟨i, Finset.mem_univ i, mul_self_pos.mpr hi⟩
  exact Finset.sum_pos hnonneg hpos

/-- A Euclidean-unit preferred direction is timelike in the candidate readout. -/
theorem preferred_direction_negative (u : Four)
    (hu : euclideanDot4 u u = 1) :
    preferredDirectionMetric u u u = -1 := by
  unfold preferredDirectionMetric
  rw [hu]
  norm_num

/-- The preferred direction is orthogonal, in the readout, to its Euclidean
    orthogonal complement. -/
theorem preferred_direction_cross_zero (u v : Four)
    (hu : euclideanDot4 u u = 1)
    (huv : euclideanDot4 u v = 0) :
    preferredDirectionMetric u u v = 0 := by
  unfold preferredDirectionMetric
  rw [hu, huv]
  ring

/-- On the Euclidean orthogonal complement u-perp, the candidate readout
    restricts exactly to the original Euclidean inner product. -/
theorem readout_restricts_to_euclidean (u v w : Four)
    (huv : euclideanDot4 u v = 0)
    (huw : euclideanDot4 u w = 0) :
    preferredDirectionMetric u v w = euclideanDot4 v w := by
  unfold preferredDirectionMetric
  rw [huv, huw]
  ring

/-- Every nonzero vector tangent to the timesheet u-perp remains spacelike
    under the candidate readout. -/
theorem timesheet_positive_definite (u v : Four)
    (huv : euclideanDot4 u v = 0)
    (hv : v ≠ 0) :
    0 < preferredDirectionMetric u v v := by
  rw [readout_restricts_to_euclidean u v v huv huv]
  exact euclideanDot4_self_pos v hv

#print axioms euclideanDot4_self_pos
#print axioms preferred_direction_negative
#print axioms preferred_direction_cross_zero
#print axioms readout_restricts_to_euclidean
#print axioms timesheet_positive_definite

end HsHVerification.CalderPreferredDirectionMetric
