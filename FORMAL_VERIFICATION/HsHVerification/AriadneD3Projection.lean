import Mathlib

/-!
# Ariadne: historical SAT-O D3 projection-fidelity gate

Original historical D3 (2025-10-27 Git commit) defines Q as winding +
pairwise linking + writhe, while separately discussing triple-link structure.
This is a conditional information-loss formalization, NOT a physical model.
The additional `triple` field is a provenance/readout discriminator; it is
not asserted to be a measured particle invariant. Writhe is modeled as real.
No physical measurements or invented numerical fixtures are used.
-/

namespace HsHVerification.AriadneD3

structure Descriptor where
  wind : ℤ
  link : ℤ
  writhe : ℝ
  triple : ℤ

def projectedQ (x : Descriptor) : ℝ :=
  (x.wind + x.link : ℤ) + x.writhe

theorem projectedQ_eq_of_components (a b : Descriptor)
    (hw : a.wind = b.wind)
    (hl : a.link = b.link)
    (hr : a.writhe = b.writhe) :
    projectedQ a = projectedQ b := by
  simp [projectedQ, hw, hl, hr]

theorem projectedQ_unchanged_by_triple (a : Descriptor) (t : ℤ) :
    projectedQ {a with triple := t} = projectedQ a := by
  rfl

theorem projectedQ_not_injective_of_triple_collision
    (a b : Descriptor)
    (hw : a.wind = b.wind)
    (hl : a.link = b.link)
    (hr : a.writhe = b.writhe)
    (ht : a.triple ≠ b.triple) :
    ¬ Function.Injective projectedQ := by
  intro hinj
  have hab : a = b := hinj (projectedQ_eq_of_components a b hw hl hr)
  exact ht (congrArg Descriptor.triple hab)

end HsHVerification.AriadneD3
