import Mathlib

/-!
# GW241011: symmetric-parameter restriction versus summary projection

Primary source:
R. Das et al., "Testing the Kerr hypothesis beyond the quadrupole with GW241011",
arXiv:2604.09828v1 (submitted 2026-04-10), especially the definitions of
delta-kappa_s and delta-lambda_s and the explicit assumption that the
corresponding antisymmetric combinations vanish.

The paper defines the symmetric averages and restricts inference by setting
the antisymmetric combinations to zero. This module introduces an
assistant-defined algebraic representation of that restriction:

* summaryMap records the two source-defined averages;
* diagonalEmbedding represents the equal-component subspace;
* symmetricRepresentative = diagonalEmbedding composed with summaryMap is a
  canonical idempotent projection onto that subspace.

The composite projection is a mathematical reconstruction, not a map
defined by the paper, not a detector response, not a physical-space
projection, and not an H(s)H worldtube/timesheet map. The theorems below
verify only the stated algebra conditional on the source's parameter
definitions. They do not validate the source translation, waveform model,
physical premises, or empirical conclusions.
-/

namespace HsHVerification.GW241011SymmetricRestriction

structure FullParameters where
  deltaKappa1 : ℝ
  deltaKappa2 : ℝ
  deltaLambda1 : ℝ
  deltaLambda2 : ℝ

structure SymmetricParameters where
  deltaKappaS : ℝ
  deltaLambdaS : ℝ

@[ext]
theorem FullParameters.ext {a b : FullParameters}
    (hK1 : a.deltaKappa1 = b.deltaKappa1)
    (hK2 : a.deltaKappa2 = b.deltaKappa2)
    (hL1 : a.deltaLambda1 = b.deltaLambda1)
    (hL2 : a.deltaLambda2 = b.deltaLambda2) : a = b := by
  cases a
  cases b
  simp_all

@[ext]
theorem SymmetricParameters.ext {a b : SymmetricParameters}
    (hK : a.deltaKappaS = b.deltaKappaS)
    (hL : a.deltaLambdaS = b.deltaLambdaS) : a = b := by
  cases a
  cases b
  simp_all

/-- Source-defined averages of the two component deviations. -/
noncomputable def summaryMap (p : FullParameters) : SymmetricParameters :=
  { deltaKappaS := (p.deltaKappa1 + p.deltaKappa2) / 2
    deltaLambdaS := (p.deltaLambda1 + p.deltaLambda2) / 2 }

/-- Assistant-defined embedding of symmetric parameters into the
    equal-component subspace of the four-parameter space. -/
def diagonalEmbedding (s : SymmetricParameters) : FullParameters :=
  { deltaKappa1 := s.deltaKappaS
    deltaKappa2 := s.deltaKappaS
    deltaLambda1 := s.deltaLambdaS
    deltaLambda2 := s.deltaLambdaS }

/-- Canonical representative obtained by averaging, then imposing
    equal component values. This is an algebraic projection, not a
    physical projection or a source-defined detector map. -/
noncomputable def symmetricRepresentative (p : FullParameters) : FullParameters :=
  diagonalEmbedding (summaryMap p)

/-- The source-summary map is a left inverse of the diagonal embedding. -/
theorem summaryMap_diagonalEmbedding (s : SymmetricParameters) :
    summaryMap (diagonalEmbedding s) = s := by
  cases s with
  | mk k l =>
    ext <;> simp [summaryMap, diagonalEmbedding] <;> ring

/-- The equal-component embedding is injective. -/
theorem diagonalEmbedding_injective :
    Function.Injective diagonalEmbedding := by
  intro a b h
  have h' := congrArg summaryMap h
  simpa [summaryMap_diagonalEmbedding] using h'

/-- The assistant-defined canonical projection is idempotent. -/
theorem symmetricRepresentative_idempotent (p : FullParameters) :
    symmetricRepresentative (symmetricRepresentative p) =
      symmetricRepresentative p := by
  simp [symmetricRepresentative, summaryMap_diagonalEmbedding]

/-- The canonical projection preserves the two symmetric averages. -/
theorem symmetricRepresentative_preserves_summary (p : FullParameters) :
    summaryMap (symmetricRepresentative p) = summaryMap p := by
  simp [symmetricRepresentative, summaryMap_diagonalEmbedding]

/-- Its fixed points are exactly the equal-component parameter states.
    This formalizes the source's antisymmetric-zero restriction as a
    diagonal-subspace condition, not as an empirical finding. -/
theorem symmetricRepresentative_fixed_iff (p : FullParameters) :
    symmetricRepresentative p = p ↔
      p.deltaKappa1 = p.deltaKappa2 ∧
      p.deltaLambda1 = p.deltaLambda2 := by
  constructor
  · intro h
    constructor
    · have hK : (p.deltaKappa1 + p.deltaKappa2) / 2 = p.deltaKappa1 := by
        have h' := congrArg FullParameters.deltaKappa1 h
        simpa [symmetricRepresentative, diagonalEmbedding, summaryMap] using h'
      linarith
    · have hL : (p.deltaLambda1 + p.deltaLambda2) / 2 = p.deltaLambda1 := by
        have h' := congrArg FullParameters.deltaLambda1 h
        simpa [symmetricRepresentative, diagonalEmbedding, summaryMap] using h'
      linarith
  · rintro ⟨hK, hL⟩
    apply FullParameters.ext
    · dsimp [symmetricRepresentative, diagonalEmbedding, summaryMap]
      linarith
    · dsimp [symmetricRepresentative, diagonalEmbedding, summaryMap]
      linarith
    · dsimp [symmetricRepresentative, diagonalEmbedding, summaryMap]
      linarith
    · dsimp [symmetricRepresentative, diagonalEmbedding, summaryMap]
      linarith

/-- Two full parameter states have the same canonical representative
    exactly when they have the same two source-defined averages. -/
theorem representative_equal_iff_same_summary
    (p q : FullParameters) :
    symmetricRepresentative p = symmetricRepresentative q ↔
      summaryMap p = summaryMap q := by
  constructor
  · intro h
    have h' := congrArg summaryMap h
    simpa [symmetricRepresentative, summaryMap_diagonalEmbedding] using h'
  · intro h
    simp [symmetricRepresentative, h]

#print axioms summaryMap_diagonalEmbedding
#print axioms diagonalEmbedding_injective
#print axioms symmetricRepresentative_idempotent
#print axioms symmetricRepresentative_preserves_summary
#print axioms symmetricRepresentative_fixed_iff
#print axioms representative_equal_iff_same_summary

end HsHVerification.GW241011SymmetricRestriction
