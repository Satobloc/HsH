import Mathlib

/-!
# Klein orientation-kernel algebra (conditional source-linked formalization)

Source cluster:
- Raw user message 9671629d-7033-4188-92fb-7809df2933d8 (2026-07-12): asks about a Klein bottle and one/two radii.
- Raw user message 3d392cc0-e113-47de-94f2-4615260b48fd (2026-07-12): clarifies inner/outer circumferences.
- Raw user message 54ba3cda-a0e1-4861-90f9-482f5850a245 (2026-07-12): proposes inner circumference ↔ Kerr ring, outer circumference ↔ cosmological circumference, particle worldtube ↔ neck, mouth ↔ localization, with rotational expansion.
- Raw export blob: b7868607d89f66bbc0e638398182fb2d6b2da2ce.

The fundamental-group presentation and the claim that the torus is the
orientation double cover were supplied by historical assistant text, not
by those raw user messages. This file formalizes only the corresponding
algebraic semidirect-product model. It does NOT formalize an embedding,
a radial function, inner/outer circumference exchange, a Klein-Fabric
identification, a worldtube, a timesheet, or any physical mechanism.

In particular, the orientation-preserving subgroup being abelian does not
prove that two chosen metric radial extrema are exchanged by a particular
embedded traversal. That requires a separately specified embedding and
normal/radial transport map.
-/

namespace HsHVerification.KleinOrientationKernel

/-- Sign acquired by the circular fiber after an integer base traversal. -/
def fiberSign (m : ℤ) : ℤ :=
  if m % 2 = 0 then 1 else -1

theorem fiberSign_add (m n : ℤ) :
    fiberSign (m + n) = fiberSign m * fiberSign n := by
  by_cases hm : m % 2 = 0
  · by_cases hn : n % 2 = 0
    · have hmn : (m + n) % 2 = 0 := by omega
      simp [fiberSign, hm, hn, hmn]
    · have hmn : (m + n) % 2 ≠ 0 := by omega
      simp [fiberSign, hm, hn, hmn]
  · by_cases hn : n % 2 = 0
    · have hmn : (m + n) % 2 ≠ 0 := by omega
      simp [fiberSign, hm, hn, hmn]
    · have hmn : (m + n) % 2 = 0 := by omega
      simp [fiberSign, hm, hn, hmn]

theorem fiberSign_neg (m : ℤ) :
    fiberSign (-m) = fiberSign m := by
  by_cases hm : m % 2 = 0
  · have hneg : (-m) % 2 = 0 := by omega
    simp [fiberSign, hm, hneg]
  · have hneg : (-m) % 2 ≠ 0 := by omega
    simp [fiberSign, hm, hneg]

/-- Coordinates for the Klein-bottle group in the convention
    (m,n)(p,q) = (m+p, n + (-1)^m q). -/
structure KleinPair where
  base : ℤ
  fiber : ℤ
deriving DecidableEq, Repr

def mulK (x y : KleinPair) : KleinPair :=
  ⟨x.base + y.base, x.fiber + fiberSign x.base * y.fiber⟩

def oneK : KleinPair := ⟨0, 0⟩

def invK (x : KleinPair) : KleinPair :=
  ⟨-x.base, -fiberSign x.base * x.fiber⟩

instance : Group KleinPair where
  mul := mulK
  one := oneK
  inv := invK
  mul_assoc := by
    intro a b c
    cases a with
    | mk am an =>
      cases b with
      | mk bm bn =>
        cases c with
        | mk cm cn =>
          apply KleinPair.ext
          · simp [mulK, add_assoc]
          · simp [mulK, fiberSign_add]
            ring
  one_mul := by
    intro a
    cases a with
    | mk am an =>
      apply KleinPair.ext
      · simp [mulK, oneK]
      · simp [mulK, oneK, fiberSign]
  mul_one := by
    intro a
    cases a with
    | mk am an =>
      apply KleinPair.ext
      · simp [mulK, oneK]
      · simp [mulK, oneK]
  inv_mul_cancel := by
    intro a
    cases a with
    | mk am an =>
      apply KleinPair.ext
      · simp [mulK, invK]
      · simp [mulK, invK, fiberSign_neg]
        ring

/-- The usual generators satisfy a b a⁻¹ = b⁻¹. -/
def baseGenerator : KleinPair := ⟨1, 0⟩
def fiberGenerator : KleinPair := ⟨0, 1⟩

theorem klein_presentation_relation :
    baseGenerator * fiberGenerator * baseGenerator⁻¹
      = fiberGenerator⁻¹ := by
  ext <;> norm_num [baseGenerator, fiberGenerator, mulK, invK, fiberSign]

/-- The sign character is multiplicative under the Klein-pair group law. -/
theorem fiber_orientation_character (x y : KleinPair) :
    fiberSign (x * y).base = fiberSign x.base * fiberSign y.base := by
  change fiberSign (x.base + y.base) = _
  exact fiberSign_add x.base y.base

/-- Algebraic orientation-preserving subgroup: even base-loop parity. -/
def orientationKernel : Subgroup KleinPair where
  carrier := fun x => fiberSign x.base = 1
  one_mem' := by simp [oneK, fiberSign]
  mul_mem' := by
    intro x y hx hy
    change fiberSign (x.base + y.base) = 1
    rw [fiberSign_add, hx, hy]
    norm_num
  inv_mem' := by
    intro x hx
    change fiberSign (-x.base) = 1
    rw [fiberSign_neg, hx]

theorem orientationKernel_iff_even (x : KleinPair) :
    x ∈ orientationKernel ↔ x.base % 2 = 0 := by
  by_cases h : x.base % 2 = 0
  · simp [orientationKernel, fiberSign, h]
  · simp [orientationKernel, fiberSign, h]

/-- On the orientation-preserving subgroup, the twisted product reduces
    to coordinatewise addition. -/
theorem orientationKernel_mul_componentwise (x y : orientationKernel) :
    (x * y : KleinPair) =
      ⟨x.1.base + y.1.base, x.1.fiber + y.1.fiber⟩ := by
  apply KleinPair.ext
  · rfl
  · change x.1.fiber + fiberSign x.1.base * y.1.fiber
      = x.1.fiber + y.1.fiber
    rw [x.property]
    ring

/-- Therefore the orientation-preserving subgroup is abelian. -/
theorem orientationKernel_comm (x y : orientationKernel) :
    x * y = y * x := by
  apply Subtype.ext
  rw [orientationKernel_mul_componentwise, orientationKernel_mul_componentwise]
  apply KleinPair.ext <;> simp [add_comm]

#print axioms fiberSign_add
#print axioms klein_presentation_relation
#print axioms fiber_orientation_character
#print axioms orientationKernel_mul_componentwise
#print axioms orientationKernel_comm

end HsHVerification.KleinOrientationKernel
