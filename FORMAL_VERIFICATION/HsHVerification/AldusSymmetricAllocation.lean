import Mathlib

/-!
# Conditional symmetric allocation under a transitive finite action

This module formalizes a finite, discrete symmetry-allocation rule.

The group action, participant transitivity, invariant finite measure weights,
invariant allocation density, and total-allocation constraint are explicit
assumptions. The result is orbitwise unless transitivity is supplied.

Provenance: the motivating 2026-11-04 position is recorded in the
assistant-authored source index
`WORKSPACES/COMMON/NATHAN_DIRECT_2026-11-04_SYMMETRIC_ATTRIBUTION_TIMEWAVE_CRULLERVERSE.md`
(blob `902d0cc29800c6300861c5de8430832042925e24`). That index says the raw
user-message UUID was not available. This module is therefore a
GEN/DERIVED conditional theorem, not a transcription of a raw Nathan Direct
message and not a formalization of the unrecovered Forest Normalization
algorithm.

A finite positive weight function is used as a finite atomic measure.
This is not a sigma-additive or continuous measure construction.
-/

namespace HsHVerification.AldusSymmetricAllocation

variable {G P : Type*} [Group G] [MulAction G P]

/-- A scalar field on participants is invariant under the chosen group action. -/
def ActionInvariant (f : P → ℝ) : Prop :=
  ∀ (g : G) (x : P), f (g • x) = f x

/-- A finite positive atomic measure, represented by its point weights. -/
structure FiniteAtomicWeight where
  mass : P → ℝ
  mass_pos : ∀ x, 0 < mass x

/-- Invariance guarantees equality only for participants in the same group orbit. -/
theorem invariant_equal_on_orbit
    (f : P → ℝ)
    (hf : ActionInvariant (G := G) (P := P) f)
    {x y : P}
    (hxy : ∃ g : G, g • x = y) :
    f x = f y := by
  rcases hxy with ⟨g, hg⟩
  calc
    f x = f (g • x) := (hf g x).symm
    _ = f y := by rw [hg]

/-- If the chosen action is transitive, every invariant scalar field is constant. -/
theorem invariant_constant_of_transitive
    (f : P → ℝ)
    (htrans : ∀ x y : P, ∃ g : G, g • x = y)
    (hf : ActionInvariant (G := G) (P := P) f) :
    ∀ x y, f x = f y := by
  intro x y
  exact invariant_equal_on_orbit (G := G) (P := P) f hf (htrans x y)

/-- A symmetry-preserving finite atomic measure has equal point weights
    on a transitive participant class. -/
theorem finite_measure_weight_constant_of_transitive
    (μ : FiniteAtomicWeight (P := P))
    (hμ : ActionInvariant (G := G) (P := P) μ.mass)
    (htrans : ∀ x y : P, ∃ g : G, g • x = y) :
    ∀ x y, μ.mass x = μ.mass y :=
  invariant_constant_of_transitive (G := G) (P := P) μ.mass htrans hμ

/-- An invariant allocation density is constant on a transitive participant class. -/
theorem invariant_density_constant_of_transitive
    (ρ : P → ℝ)
    (htrans : ∀ x y : P, ∃ g : G, g • x = y)
    (hρ : ActionInvariant (G := G) (P := P) ρ) :
    ∀ x y, ρ x = ρ y :=
  invariant_constant_of_transitive (G := G) (P := P) ρ htrans hρ

/-- The weighted allocation is invariant and therefore equal within each orbit.
    Distinct orbits are not thereby assigned equal totals. -/
theorem invariant_weighted_allocation_orbitwise
    (μ : FiniteAtomicWeight (P := P))
    (ρ : P → ℝ)
    (hμ : ActionInvariant (G := G) (P := P) μ.mass)
    (hρ : ActionInvariant (G := G) (P := P) ρ)
    {x y : P}
    (hxy : ∃ g : G, g • x = y) :
    μ.mass x * ρ x = μ.mass y * ρ y := by
  have halloc : ActionInvariant (G := G) (P := P)
      (fun z => μ.mass z * ρ z) := by
    intro g z
    change μ.mass (g • z) * ρ (g • z) = μ.mass z * ρ z
    rw [hμ g z, hρ g z]
  exact invariant_equal_on_orbit (G := G) (P := P)
    (fun z => μ.mass z * ρ z) halloc hxy

/-- Under a transitive action, invariant measure weights and invariant density,
    with a fixed total, give each participant the same weighted share Q / |P|.

    The finite sum is the integral with respect to the represented finite
    atomic measure. Positivity is recorded by FiniteAtomicWeight; the equality
    itself follows from invariance and transitivity. -/
theorem transitive_invariant_weighted_allocation_equal_share
    [Fintype P] [Nonempty P]
    (μ : FiniteAtomicWeight (P := P))
    (ρ : P → ℝ)
    (hμ : ActionInvariant (G := G) (P := P) μ.mass)
    (hρ : ActionInvariant (G := G) (P := P) ρ)
    (htrans : ∀ x y : P, ∃ g : G, g • x = y)
    (total : ℝ)
    (htotal : ∑ x : P, μ.mass x * ρ x = total) :
    ∀ x : P, μ.mass x * ρ x = total / (Fintype.card P : ℝ) := by
  classical
  have halloc : ActionInvariant (G := G) (P := P)
      (fun x => μ.mass x * ρ x) := by
    intro g x
    change μ.mass (g • x) * ρ (g • x) = μ.mass x * ρ x
    rw [hμ g x, hρ g x]
  have hconst : ∀ x y : P, μ.mass x * ρ x = μ.mass y * ρ y :=
    invariant_constant_of_transitive (G := G) (P := P)
      (fun x => μ.mass x * ρ x) htrans halloc
  intro x
  have hsum : ∑ y : P, μ.mass y * ρ y =
      (Fintype.card P : ℝ) * (μ.mass x * ρ x) := by
    calc
      ∑ y : P, μ.mass y * ρ y =
          ∑ y : P, (μ.mass x * ρ x) := by
            refine Finset.sum_congr rfl ?_
            intro y hy
            exact hconst y x
      _ = (Fintype.card P : ℝ) * (μ.mass x * ρ x) := by
        simp [nsmul_eq_mul]
  have hmul : (Fintype.card P : ℝ) * (μ.mass x * ρ x) = total := by
    calc
      (Fintype.card P : ℝ) * (μ.mass x * ρ x) =
          ∑ y : P, μ.mass y * ρ y := hsum.symm
      _ = total := htotal
  have hcardNat : Fintype.card P ≠ 0 :=
    Nat.ne_of_gt (Fintype.card_pos_iff.mpr ⟨x⟩)
  have hcard : (Fintype.card P : ℝ) ≠ 0 := by
    exact_mod_cast hcardNat
  calc
    μ.mass x * ρ x =
        ((Fintype.card P : ℝ) * (μ.mass x * ρ x)) /
          (Fintype.card P : ℝ) := by
            field_simp [hcard]
            <;> ring
    _ = total / (Fintype.card P : ℝ) := by rw [hmul]

/-- The two-participant specialization of the transitive finite allocation theorem. -/
theorem two_participant_equal_half
    [Fintype P] [Nonempty P]
    (μ : FiniteAtomicWeight (P := P))
    (ρ : P → ℝ)
    (hμ : ActionInvariant (G := G) (P := P) μ.mass)
    (hρ : ActionInvariant (G := G) (P := P) ρ)
    (htrans : ∀ x y : P, ∃ g : G, g • x = y)
    (total : ℝ)
    (htotal : ∑ x : P, μ.mass x * ρ x = total)
    (hcard : Fintype.card P = 2) :
    ∀ x : P, μ.mass x * ρ x = total / 2 := by
  intro x
  have hx := transitive_invariant_weighted_allocation_equal_share
    (G := G) (P := P) μ ρ hμ hρ htrans total htotal x
  simpa [hcard] using hx

#print axioms invariant_equal_on_orbit
#print axioms invariant_constant_of_transitive
#print axioms finite_measure_weight_constant_of_transitive
#print axioms invariant_density_constant_of_transitive
#print axioms invariant_weighted_allocation_orbitwise
#print axioms transitive_invariant_weighted_allocation_equal_share
#print axioms two_participant_equal_half

end HsHVerification.AldusSymmetricAllocation
