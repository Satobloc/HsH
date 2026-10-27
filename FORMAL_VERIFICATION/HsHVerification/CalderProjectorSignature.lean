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
  have heq : (4 : ℝ) * v 0 = (2 : ℝ) * v 0 := by
    simpa [euclideanPlus] using h0
  have hz : v 0 = 0 := by linarith
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
    simp [lorentzianPlusMixed, transverse] <;> ring
  · simp [lorentzianPlusMixed, transverse, hi]

#print axioms euclidean_plus_not_idempotent
#print axioms transverse_idempotent
#print axioms transverse_longitudinal_zero
#print axioms lorentzian_plus_agrees_with_transverse

end HsHVerification.CalderProjectorSignature
