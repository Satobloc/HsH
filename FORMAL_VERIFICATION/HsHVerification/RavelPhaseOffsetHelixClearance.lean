import Mathlib

/-!
# Ravel: phase-offset helix centerline clearance

Source boundary:
* Historical Ravel conversation "Ravel Syncmathcek", raw export blob
  `17cfe3feb830f70009557d063482b35adba0834b`.
* Direct user messages `a03e61e8-929b-4758-8bba-71af0766b9fa`
  (2026-09-06T08:14:51Z) and
  `af313567-c917-4188-86b0-caea0f3398e2` (2026-09-06T08:21:54Z)
  ask for first-order helix metrics and explicitly raise multiple
  first-order helices superimposed / a non-round barrel.
* Assistant message `ac8e4285-a104-4621-ad26-e4f2fcce0bce`
  (2026-09-06T20:56:20Z) introduces equal-radius, equal-pitch, phase-offset
  co-helices and the same-parameter chord formula
  `d_N = 2 R sin(pi/N)`. That is assistant reconstruction, not Nathan Direct.
* The source does not give the parameterization below. The family is an
  assistant reconstruction chosen to test the source's geometric question.

This is distinct from the existing Ravel single-helix adjacent-turn self-contact
gate. Here two equal-radius, equal-pitch helices differ by a fixed azimuthal
phase gap. The module formalizes an exact pair-distance function and a
conditional strict upper bound on its global squared-distance infimum.

The model is ordinary Euclidean 3D centerline geometry. It is not a 4D
worldtube, a finite-core tube, a physical particle model, or an H(s)H claim.
The theorem below is conditional: it proves strict improvement when the
explicit axial-shift candidate is already below the same-parameter chord.
It does not yet prove the stronger all-pitch derivative claim or uniqueness
and attainment of the minimizing relative parameter.
-/

namespace HsHVerification.RavelPhaseOffsetHelixClearance

noncomputable section

/-- Dimensionless squared distance for two equal-pitch helices with phase gap
    `phaseGap`. Here `pitchRatio = b/R = P/(2*pi*R)`, where `b` is
    axial rise per radian and `P = 2*pi*b` is pitch per full turn;
    `relativeParameter = t-s`. -/
def pairDistanceSq (pitchRatio phaseGap relativeParameter : ℝ) : ℝ :=
  2 * (1 - Real.cos (relativeParameter - phaseGap))
    + pitchRatio ^ 2 * relativeParameter ^ 2

/-- Squared same-parameter chord, normalized by the squared radius. -/
def sameSliceChordSq (phaseGap : ℝ) : ℝ :=
  2 * (1 - Real.cos phaseGap)

/-- Squared distance for the explicit parameter choice
    `relativeParameter = phaseGap`, where radial phases coincide. -/
def axialShiftCandidateSq (pitchRatio phaseGap : ℝ) : ℝ :=
  pitchRatio ^ 2 * phaseGap ^ 2

/-- At equal parameters, the distance is the familiar transverse chord. -/
theorem sameSliceDistance_eq
    (pitchRatio phaseGap : ℝ) :
    pairDistanceSq pitchRatio phaseGap 0 = sameSliceChordSq phaseGap := by
  simp [pairDistanceSq, sameSliceChordSq, Real.cos_neg]

/-- At relative parameter equal to the phase gap, only axial separation remains. -/
theorem axialShiftDistance_eq
    (pitchRatio phaseGap : ℝ) :
    pairDistanceSq pitchRatio phaseGap phaseGap =
      axialShiftCandidateSq pitchRatio phaseGap := by
  simp [pairDistanceSq, axialShiftCandidateSq]

/-- A concrete off-slice pair is closer than the same-slice pair whenever
    its axial-shift candidate satisfies the stated inequality. -/
theorem axialShiftCandidate_below_sameSlice
    (pitchRatio phaseGap : ℝ)
    (h : pitchRatio ^ 2 * phaseGap ^ 2
      < 2 * (1 - Real.cos phaseGap)) :
    pairDistanceSq pitchRatio phaseGap phaseGap
      < pairDistanceSq pitchRatio phaseGap 0 := by
  rw [axialShiftDistance_eq, sameSliceDistance_eq]
  exact h

/-- The set of all squared centerline distances over relative parameters. -/
def distanceSet (pitchRatio phaseGap : ℝ) : Set ℝ :=
  {x | ∃ relativeParameter : ℝ,
    x = pairDistanceSq pitchRatio phaseGap relativeParameter}

lemma distanceSet_bddBelow (pitchRatio phaseGap : ℝ) :
    BddBelow (distanceSet pitchRatio phaseGap) := by
  refine ⟨0, ?_⟩
  intro x hx
  rcases hx with ⟨relativeParameter, rfl⟩
  unfold pairDistanceSq
  have hcos : Real.cos (relativeParameter - phaseGap) ≤ 1 :=
    Real.cos_le_one _
  have hterm : 0 ≤ pitchRatio ^ 2 * relativeParameter ^ 2 :=
    mul_nonneg (sq_nonneg pitchRatio) (sq_nonneg relativeParameter)
  nlinarith

/-- Infimum of squared centerline distances over all relative parameters.
    This is an infimum, not a claim that a minimum is attained. -/
noncomputable def globalClearanceSq
    (pitchRatio phaseGap : ℝ) : ℝ :=
  sInf (distanceSet pitchRatio phaseGap)

/-- The global infimum is no greater than any explicitly evaluated pair. -/
theorem globalClearanceSq_le_candidate
    (pitchRatio phaseGap relativeParameter : ℝ) :
    globalClearanceSq pitchRatio phaseGap
      ≤ pairDistanceSq pitchRatio phaseGap relativeParameter := by
  unfold globalClearanceSq distanceSet
  exact csInf_le (distanceSet_bddBelow pitchRatio phaseGap)
    ⟨relativeParameter, rfl⟩

/-- Under the explicit sufficient condition, the global clearance infimum
    is strictly below the same-parameter chord. -/
theorem globalClearanceSq_lt_sameSlice_of_axialCandidate
    (pitchRatio phaseGap : ℝ)
    (h : pitchRatio ^ 2 * phaseGap ^ 2
      < 2 * (1 - Real.cos phaseGap)) :
    globalClearanceSq pitchRatio phaseGap
      < sameSliceChordSq phaseGap := by
  have hle :
      globalClearanceSq pitchRatio phaseGap
        ≤ pairDistanceSq pitchRatio phaseGap phaseGap :=
    globalClearanceSq_le_candidate pitchRatio phaseGap phaseGap
  have hstrict :
      pairDistanceSq pitchRatio phaseGap phaseGap
        < sameSliceChordSq phaseGap := by
    rw [axialShiftDistance_eq]
    exact h
  exact lt_of_le_of_lt hle hstrict

#print axioms sameSliceDistance_eq
#print axioms axialShiftDistance_eq
#print axioms axialShiftCandidate_below_sameSlice
#print axioms globalClearanceSq_le_candidate
#print axioms globalClearanceSq_lt_sameSlice_of_axialCandidate

end

end HsHVerification.RavelPhaseOffsetHelixClearance
