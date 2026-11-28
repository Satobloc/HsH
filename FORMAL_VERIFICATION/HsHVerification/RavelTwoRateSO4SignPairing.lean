import Mathlib
import HsHVerification.RavelSkewRotationKinematics

/-!
# Ravel: two-rate SO(4) generator and sign-pairing audit

This module extends the existing same-sign, equal-rate SO(4) example to
two independently specified orthogonal rotation planes.

The matrix family is an assistant reconstruction for checking the algebraic
ambiguity identified in the h999 source-fidelity report. It is not a
recovered Nathan Direct equation. The direct source does not yet supply a
map from the described 3D rotation to this SO(4) representation, nor does
it select a sign branch.

The invariant pair S = -1/2 tr(Ω²), P = Pf(Ω) mirrors the existing Meridian
CF-001 two-rate SO(4) map. This module formalizes only its block-diagonal
sign-pairing specialization; it does not duplicate the general six-generator
Frenet construction.

The theorems establish only conditional Euclidean linear algebra:
skewness, zero trace, the exact squared generator, and the equality of
the squared generators in the co-rotating and counter-rotating branches.
The Pfaffian distinguishes those branches even though the squared generator
does not. The two generators themselves are distinct for nonzero rate.

relativeRate is only the difference of the two generator coefficients.
It is not a measured phase, an observable, or a physical prediction; a
time parameter and a representation map would be needed for that reading.

No metric connection, ambient Riemann curvature, physical worldtube,
timesheet, force law, or measured system is instantiated here. Lean checks
only the formalized statements, not the fidelity of the source translation
or the truth of any physical premise.
-/

namespace HsHVerification.RavelTwoRateSO4SignPairing

abbrev Index := Fin 4
abbrev Matrix4 := Matrix Index Index ℝ

/-- Two independent planar rotation generators on orthogonal coordinate
    planes of Euclidean four-space. -/
def twoRateRotationMatrix (omega1 omega2 : ℝ) : Matrix4 :=
  fun i j =>
    if i = 0 then
      if j = 1 then -omega1 else 0
    else if i = 1 then
      if j = 0 then omega1 else 0
    else if i = 2 then
      if j = 3 then -omega2 else 0
    else if i = 3 then
      if j = 2 then omega2 else 0
    else 0

/-- The exact block-diagonal square of the two-rate generator. -/
def twoRateSquareDiagonal (omega1 omega2 : ℝ) : Matrix4 :=
  fun i j =>
    if i = j then
      if i.val < 2 then -(omega1 ^ 2) else -(omega2 ^ 2)
    else 0

/-- Every two-rate generator is skew-symmetric. -/
theorem twoRateRotationMatrix_skew (omega1 omega2 : ℝ) :
    Matrix.transpose (twoRateRotationMatrix omega1 omega2) =
      -twoRateRotationMatrix omega1 omega2 := by
  ext i j
  fin_cases i <;> fin_cases j <;> simp [twoRateRotationMatrix]

/-- The algebraic divergence / trace of every two-rate linear generator is zero. -/
theorem twoRateRotationMatrix_trace_zero (omega1 omega2 : ℝ) :
    Matrix.trace (twoRateRotationMatrix omega1 omega2) = 0 := by
  simp [Matrix.trace, twoRateRotationMatrix, Fin.sum_univ_succ]

/-- Squaring retains the two independent squared rates on their respective
    orthogonal coordinate planes. -/
theorem twoRateRotationMatrix_sq (omega1 omega2 : ℝ) :
    twoRateRotationMatrix omega1 omega2 *
      twoRateRotationMatrix omega1 omega2 =
    twoRateSquareDiagonal omega1 omega2 := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    norm_num [twoRateRotationMatrix, twoRateSquareDiagonal,
      Matrix.mul_apply, Fin.sum_univ_succ] <;> ring_nf

/-- A scalar diagonal matrix, used to state the isoclinic special cases. -/
def scalarDiagonal (a : ℝ) : Matrix4 :=
  fun i j => if i = j then a else 0

/-- The scalar diagonal matrix is scalar multiplication of the identity. -/
theorem scalarDiagonal_eq_smul_identity (a : ℝ) :
    scalarDiagonal a = a • (1 : Matrix4) := by
  ext i j
  simp [scalarDiagonal, Matrix.one_apply]

/-- The existing Ravel matrix is exactly the same-sign branch of the
    two-rate family. -/
theorem sameSign_eq_existing (omega : ℝ) :
    twoRateRotationMatrix omega omega =
      HsHVerification.RavelSkewRotationKinematics.rotationMatrix omega := by
  ext i j
  fin_cases i <;> fin_cases j <;>
    simp [twoRateRotationMatrix,
      HsHVerification.RavelSkewRotationKinematics.rotationMatrix]

/-- The co-rotating equal-rate branch has scalar square. -/
theorem sameSign_isoclinic (omega : ℝ) :
    twoRateRotationMatrix omega omega *
      twoRateRotationMatrix omega omega =
    -(omega ^ 2) • (1 : Matrix4) := by
  rw [twoRateRotationMatrix_sq]
  have h : twoRateSquareDiagonal omega omega =
      scalarDiagonal (-(omega ^ 2)) := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [twoRateSquareDiagonal, scalarDiagonal]
  rw [h, scalarDiagonal_eq_smul_identity]

/-- The counter-rotating equal-magnitude branch has the same scalar square. -/
theorem oppositeSign_isoclinic (omega : ℝ) :
    twoRateRotationMatrix omega (-omega) *
      twoRateRotationMatrix omega (-omega) =
    -(omega ^ 2) • (1 : Matrix4) := by
  rw [twoRateRotationMatrix_sq]
  have h : twoRateSquareDiagonal omega (-omega) =
      scalarDiagonal (-(omega ^ 2)) := by
    ext i j
    fin_cases i <;> fin_cases j <;>
      simp [twoRateSquareDiagonal, scalarDiagonal] <;> ring
  rw [h, scalarDiagonal_eq_smul_identity]

/-- The current squared-generator invariant cannot distinguish the
    co-rotating and counter-rotating equal-magnitude branches. -/
theorem sameAndOppositeSquaresEqual (omega : ℝ) :
    twoRateRotationMatrix omega omega *
      twoRateRotationMatrix omega omega =
    twoRateRotationMatrix omega (-omega) *
      twoRateRotationMatrix omega (-omega) := by
  rw [sameSign_isoclinic, oppositeSign_isoclinic]

/-- The two signed branches are nevertheless different generators whenever
    their common rate is nonzero. -/
theorem sameAndOppositeBranchesDistinct (omega : ℝ) (homega : omega ≠ 0) :
    twoRateRotationMatrix omega omega ≠
      twoRateRotationMatrix omega (-omega) := by
  intro hEq
  have h23 := congrArg (fun M : Matrix4 => M 2 3) hEq
  have hvalue : -omega = omega := by
    simpa [twoRateRotationMatrix] using h23
  have hzero : omega = 0 := by
    linarith
  exact homega hzero

/-- The standard four-dimensional skew-matrix Pfaffian polynomial. -/
def pfaffian4 (M : Matrix4) : ℝ :=
  M 0 1 * M 2 3 - M 0 2 * M 1 3 + M 0 3 * M 1 2

/-- The Pfaffian of the block-diagonal two-rate generator is the signed
    product of its two planar rates. -/
theorem twoRateRotationMatrix_pfaffian (omega1 omega2 : ℝ) :
    pfaffian4 (twoRateRotationMatrix omega1 omega2) =
      omega1 * omega2 := by
  simp [pfaffian4, twoRateRotationMatrix]

/-- The co-rotating branch has positive Pfaffian omega squared. -/
theorem sameSign_pfaffian (omega : ℝ) :
    pfaffian4 (twoRateRotationMatrix omega omega) = omega ^ 2 := by
  rw [twoRateRotationMatrix_pfaffian]
  ring

/-- The counter-rotating branch has negative Pfaffian omega squared. -/
theorem oppositeSign_pfaffian (omega : ℝ) :
    pfaffian4 (twoRateRotationMatrix omega (-omega)) = -(omega ^ 2) := by
  rw [twoRateRotationMatrix_pfaffian]
  ring

/-- The quadratic SO(4) rate invariant used by the Meridian two-rate map. -/
noncomputable def spectralS (M : Matrix4) : ℝ :=
  -(1 / 2 : ℝ) * Matrix.trace (M * M)

/-- For the block-diagonal two-rate generator, S is the sum of the squared
    planar rates. -/
theorem twoRateRotationMatrix_spectralS (omega1 omega2 : ℝ) :
    spectralS (twoRateRotationMatrix omega1 omega2) =
      omega1 ^ 2 + omega2 ^ 2 := by
  unfold spectralS
  rw [twoRateRotationMatrix_sq]
  simp [twoRateSquareDiagonal, Matrix.trace, Fin.sum_univ_succ]
  ring

/-- The SO(4) discriminant is the squared difference of the two squared rates. -/
noncomputable def spectralDiscriminant (M : Matrix4) : ℝ :=
  (spectralS M) ^ 2 - 4 * (pfaffian4 M) ^ 2

theorem twoRateRotationMatrix_discriminant (omega1 omega2 : ℝ) :
    spectralDiscriminant (twoRateRotationMatrix omega1 omega2) =
      (omega1 ^ 2 - omega2 ^ 2) ^ 2 := by
  unfold spectralDiscriminant
  rw [twoRateRotationMatrix_spectralS, twoRateRotationMatrix_pfaffian]
  ring

/-- Equal-magnitude rates are exactly the co-rotating or counter-rotating
    sign branches. -/
theorem equalMagnitudeRates_iff_signBranches (omega1 omega2 : ℝ) :
    omega1 ^ 2 = omega2 ^ 2 ↔ omega2 = omega1 ∨ omega2 = -omega1 := by
  constructor
  · intro h
    have hfactor : (omega1 - omega2) * (omega1 + omega2) = 0 := by
      nlinarith
    rcases mul_eq_zero.mp hfactor with hleft | hright
    · left
      linarith
    · right
      linarith
  · rintro (h | h) <;> subst omega2 <;> ring

/-- Both sign branches have zero SO(4) spectral discriminant, while their
    Pfaffian signs distinguish their orientation pairing. -/
theorem sameSign_discriminant_zero (omega : ℝ) :
    spectralDiscriminant (twoRateRotationMatrix omega omega) = 0 := by
  rw [twoRateRotationMatrix_discriminant]
  ring

theorem oppositeSign_discriminant_zero (omega : ℝ) :
    spectralDiscriminant (twoRateRotationMatrix omega (-omega)) = 0 := by
  rw [twoRateRotationMatrix_discriminant]
  ring

/-- Difference of the two plane-generator coefficients. This is an algebraic
    rate difference, not a phase observable without additional structure. -/
def relativeRate (omega1 omega2 : ℝ) : ℝ := omega1 - omega2

/-- Equal-sign equal-rate generators have zero relative rate. -/
theorem sameSign_relativeRate_zero (omega : ℝ) :
    relativeRate omega omega = 0 := by
  simp [relativeRate]

/-- Opposite-sign equal-magnitude generators have a doubled relative rate. -/
theorem oppositeSign_relativeRate_twice (omega : ℝ) :
    relativeRate omega (-omega) = 2 * omega := by
  unfold relativeRate
  ring

#print axioms twoRateRotationMatrix_skew
#print axioms twoRateRotationMatrix_trace_zero
#print axioms twoRateRotationMatrix_sq
#print axioms sameSign_eq_existing
#print axioms sameSign_isoclinic
#print axioms oppositeSign_isoclinic
#print axioms sameAndOppositeSquaresEqual
#print axioms sameAndOppositeBranchesDistinct
#print axioms twoRateRotationMatrix_pfaffian
#print axioms twoRateRotationMatrix_spectralS
#print axioms twoRateRotationMatrix_discriminant
#print axioms equalMagnitudeRates_iff_signBranches
#print axioms sameSign_discriminant_zero
#print axioms oppositeSign_discriminant_zero
#print axioms sameSign_relativeRate_zero
#print axioms oppositeSign_relativeRate_twice

end HsHVerification.RavelTwoRateSO4SignPairing
