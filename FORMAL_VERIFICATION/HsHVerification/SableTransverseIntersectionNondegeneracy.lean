import Mathlib

/-!
# Sable independent supplement: transverse slice nondegeneracy

This module strengthens the algebraic slice-tangent gate in
`KestrelLevelSetSliceTangentV2`.

For independent tangent directions u,v in a two-plane and a level-set
covector n, the vector
  w = n(v) u - n(u) v
is nonzero exactly when n does not annihilate the entire tangent plane.

This is a finite-dimensional coordinate-space theorem. It does NOT prove
a manifold regular-value theorem, existence/global uniqueness of an
intersection, distributional-current support, finite-thickness readout,
current conservation, or physical H(s)H dynamics.
-/

namespace HsHVerification.SableTransverseIntersectionNondegeneracy

abbrev Vec4 := Fin 4 → ℝ

def pairing (n v : Vec4) : ℝ :=
  ∑ i : Fin 4, n i * v i

def intersectionTangent (n u v : Vec4) : Vec4 :=
  fun i => pairing n v * u i - pairing n u * v i

/-- Explicit two-vector linear-independence condition, stated as absence
of any nontrivial scalar relation. -/
def NoNontrivialPairRelation (u v : Vec4) : Prop :=
  ∀ a b : ℝ, a • u + b • v = 0 → a = 0 ∧ b = 0

theorem intersection_tangent_nonzero_iff_transverse
    (n u v : Vec4)
    (hIndependent : NoNontrivialPairRelation u v) :
    intersectionTangent n u v ≠ 0 ↔
      pairing n u ≠ 0 ∨ pairing n v ≠ 0 := by
  constructor
  · intro hNonzero
    by_contra hNotTransverse
    have hu : pairing n u = 0 := by
      by_contra hnu
      exact hNotTransverse (Or.inl hnu)
    have hv : pairing n v = 0 := by
      by_contra hnv
      exact hNotTransverse (Or.inr hnv)
    apply hNonzero
    funext i
    simp [intersectionTangent, hu, hv]
  · intro hTransverse
    intro hZero
    have hRelation : pairing n v • u + (-pairing n u) • v = 0 := by
      ext i
      change pairing n v * u i + (-pairing n u) * v i = 0
      have hi := congrFun hZero i
      change pairing n v * u i - pairing n u * v i = 0 at hi
      linarith
    obtain ⟨hvZero, huNegZero⟩ :=
      hIndependent (pairing n v) (-pairing n u) hRelation
    rcases hTransverse with huNonzero | hvNonzero
    · exact huNonzero (by simpa using huNegZero)
    · exact hvNonzero hvZero

#print axioms intersection_tangent_nonzero_iff_transverse

end HsHVerification.SableTransverseIntersectionNondegeneracy
