import Mathlib

/-!
# Mechanism separation and temporal-order identifiability

Historical project source:
- `SATOBLOC MISC/SAT SUPERHELICALISM[BATTERY EXP].txt`, SAT archive blob
  `1a50bc22075cdef4b7d3e4ef58da6a0b87650011`. The document is author-labelled
  Nathan McKnight; its document date was not recovered.
- `SRENA SAT2.txt`, SAT archive blob
  `fe01fc85b1874c1573843724f035ee292fd48961`, lines 923-930. The transcript
  explicitly labels the relevant passage `Nathan`; it rejects braid-only
  Coulomb interaction and invokes Kelvin as a candidate response.
- Current Primary Operational Guideline, 2026-11-08, blob
  `a8e333b1d5b5aa1d9772366945dd88769d24153c`, §2.1: worldtube and timesheet
  are the two minimal primitives; a responsive medium is provisionally used,
  not established as an independent ontological commitment.
- BEDROCK, blob `2629ab29a5838d933c31727455553d206577a258`,
  ND-2026-10-22-02: Kelvin-vortex or a justified equivalent response is an
  active constraint/hypothesis, not a compiled or empirically established law.

This module formalizes only conditional algebraic statements:
1. Two matched observations under reversed sequence order uniquely recover
   their order-even and order-odd components.
2. A single scalar modeled as the sum of three channels is non-injective.

The source does not establish an additive physical response law, a measured
charge-to-constituent-chirality map, or a calibrated worldtube-to-observable
map. These theorems do not assert that any such maps exist. All names below
are LOCAL to this verification module; no shared SAT/HSH symbols are added.
-/

namespace HsHVerification.CalderMechanismSeparation

/-- The component invariant under exchanging the two sequence orders. -/
def orderEvenPart (ab ba : ℝ) : ℝ := (ab + ba) / 2

/-- The component that changes sign when the two sequence orders are exchanged. -/
def orderOddPart (ab ba : ℝ) : ℝ := (ab - ba) / 2

theorem order_pair_reconstruct_ab (ab ba : ℝ) :
    orderEvenPart ab ba + orderOddPart ab ba = ab := by
  unfold orderEvenPart orderOddPart
  ring

theorem order_pair_reconstruct_ba (ab ba : ℝ) :
    orderEvenPart ab ba - orderOddPart ab ba = ba := by
  unfold orderEvenPart orderOddPart
  ring

/-- If both orderings admit an even/odd decomposition, its components are unique. -/
theorem order_pair_components_unique
    (ab ba even odd : ℝ)
    (hab : even + odd = ab)
    (hba : even - odd = ba) :
    even = orderEvenPart ab ba ∧ odd = orderOddPart ab ba := by
  constructor
  · unfold orderEvenPart
    linarith
  · unfold orderOddPart
    linarith

/-- The order-odd component vanishes exactly when the paired readouts agree. -/
theorem order_odd_zero_iff_order_invariant (ab ba : ℝ) :
    orderOddPart ab ba = 0 ↔ ab = ba := by
  unfold orderOddPart
  constructor <;> intro h <;> linarith

/-- One observation in one order cannot identify its even and odd components. -/
theorem single_order_decomposition_nonunique
    (y delta : ℝ) (hdelta : delta ≠ 0) :
    ∃ even₁ odd₁ even₂ odd₂ : ℝ,
      even₁ + odd₁ = y ∧ even₂ + odd₂ = y ∧ even₁ ≠ even₂ := by
  refine ⟨y, 0, y + delta, -delta, ?_, ?_, ?_⟩
  · ring
  · ring
  · intro h
    apply hdelta
    linarith

/-- Abstract components of a proposed additive three-channel scalar readout.
    The structure is a conditional observation model, not a source equation. -/
structure ThreeChannelReadout where
  first : ℝ
  second : ℝ
  third : ℝ

/-- Aggregate scalar under the explicitly assumed additive readout model. -/
def aggregateReadout (x : ThreeChannelReadout) : ℝ :=
  x.first + x.second + x.third

/-- A scalar additive aggregate cannot identify all three channel values:
    any nonzero transfer between the first two channels leaves the aggregate
    unchanged. This is a model-identifiability result, not a physical additivity claim. -/
theorem aggregate_readout_collision
    (a b c delta : ℝ) (hdelta : delta ≠ 0) :
    aggregateReadout ⟨a, b, c⟩ =
      aggregateReadout ⟨a + delta, b - delta, c⟩ ∧
    (⟨a, b, c⟩ : ThreeChannelReadout) ≠ ⟨a + delta, b - delta, c⟩ := by
  constructor
  · simp [aggregateReadout]
    ring
  · intro h
    have hfirst := congrArg ThreeChannelReadout.first h
    dsimp at hfirst
    apply hdelta
    linarith

end HsHVerification.CalderMechanismSeparation

#print axioms HsHVerification.CalderMechanismSeparation.order_pair_reconstruct_ab
#print axioms HsHVerification.CalderMechanismSeparation.order_pair_reconstruct_ba
#print axioms HsHVerification.CalderMechanismSeparation.order_pair_components_unique
#print axioms HsHVerification.CalderMechanismSeparation.order_odd_zero_iff_order_invariant
#print axioms HsHVerification.CalderMechanismSeparation.single_order_decomposition_nonunique
#print axioms HsHVerification.CalderMechanismSeparation.aggregate_readout_collision
