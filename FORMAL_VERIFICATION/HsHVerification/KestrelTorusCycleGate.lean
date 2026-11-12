import Mathlib

namespace HsHVerification.KestrelTorusCycleGate

/-!
# Product-torus cycle intersection gate

This is a deliberately small product-space baseline for the spoken description
of an inner toroidal parallel intersecting the family of tube circumferences.

For a product torus S¹ × S¹:
* tubeCircle u fixes the first coordinate and varies the second;
* parallelCircle v fixes the second coordinate and varies the first.

The results prove only the set-theoretic intersection pattern. They do not
choose which parallel is physically inner, embed the product torus in
Euclidean 3-space, identify the parallel with a Kerr CSC, construct a Hopf
link or figure-eight surgery, or establish any Lorentzian/CTC structure.
-/

abbrev ProductTorus (S : Type*) := S × S

/-- A tube circumference (meridian) at fixed first coordinate. -/
def tubeCircle {S : Type*} (u : S) : Set (ProductTorus S) :=
  {p | p.1 = u}

/-- A toroidal parallel at fixed second coordinate. -/
def parallelCircle {S : Type*} (v : S) : Set (ProductTorus S) :=
  {p | p.2 = v}

/-- A fixed meridian and a fixed parallel meet at exactly one product point. -/
theorem tubeCircle_inter_parallelCircle_singleton
    {S : Type*} (u v : S) :
    tubeCircle u ∩ parallelCircle v = {(u, v)} := by
  ext p
  change (p.1 = u ∧ p.2 = v) ↔ p = (u, v)
  constructor
  · rintro ⟨h₁, h₂⟩
    exact Prod.ext h₁ h₂
  · intro h
    cases h
    exact ⟨rfl, rfl⟩

/-- The chosen parallel is the union of its one-point intersections
with every member of the meridian family. -/
theorem parallelCircle_eq_iUnion_tubeIntersections
    {S : Type*} (v : S) :
    parallelCircle v =
      ⋃ u : S, (tubeCircle u ∩ parallelCircle v) := by
  ext p
  simp [tubeCircle, parallelCircle]

#print axioms HsHVerification.KestrelTorusCycleGate.tubeCircle_inter_parallelCircle_singleton
#print axioms HsHVerification.KestrelTorusCycleGate.parallelCircle_eq_iUnion_tubeIntersections

end HsHVerification.KestrelTorusCycleGate
