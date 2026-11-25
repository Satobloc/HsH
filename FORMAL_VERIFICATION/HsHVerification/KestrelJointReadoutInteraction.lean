import Mathlib

/-!
# Kestrel: mixed interaction contrast for a joint readout

This is abstract measurement/readout mathematics. The factor types W and T
are index domains only; they do not assert that H(s)H has independently
variable worldtube and timesheet carriers. The output V is a common additive
measurement space (or a product of separately typed channels).

The four-corner contrast cancels any contribution that is additive in W
alone, additive in T alone, or a constant detector offset. On a full
Cartesian domain, vanishing of every contrast is equivalent to additive
separability. A nonzero contrast therefore rejects that restricted class.

A nonzero contrast is not, by itself, evidence of physical coupling or
causation. The four states must be source-defined and physically admissible;
independent variation, common acquisition/calibration, covariance, units,
and a frozen holdout remain empirical obligations. Nonlinear calibration
must not be silently applied after the contrast.
-/

namespace HsHVerification.KestrelJointReadoutInteraction

universe u v w

variable {W : Type u} {T : Type v} {V : Type w}
variable [AddCommGroup V]

/-- Four-corner mixed contrast of a joint readout R : W × T → V. -/
def interactionContrast
    (R : W × T → V)
    (w1 w2 : W) (t1 t2 : T) : V :=
  R (w1, t1) - R (w1, t2) - R (w2, t1) + R (w2, t2)

/-- A readout is additively separable when it is a sum of a W-only
    contribution and a T-only contribution. -/
def AdditivelySeparable (R : W × T → V) : Prop :=
  ∃ f : W → V, ∃ g : T → V,
    ∀ w t, R (w, t) = f w + g t

/-- Additive separability forces every four-corner interaction contrast
    to vanish. -/
theorem interactionContrast_eq_zero_of_additivelySeparable
    (R : W × T → V)
    (hSep : AdditivelySeparable R) :
    ∀ w1 w2 t1 t2, interactionContrast R w1 w2 t1 t2 = 0 := by
  rcases hSep with ⟨f, g, hR⟩
  intro w1 w2 t1 t2
  change R (w1, t1) - R (w1, t2) -
    R (w2, t1) + R (w2, t2) = 0
  rw [hR w1 t1, hR w1 t2, hR w2 t1, hR w2 t2]
  abel

/-- If every four-corner contrast vanishes, then the readout is
    additively separable. The supplied basepoints construct the two
    one-factor terms; no topology or continuity assumption is needed. -/
theorem additivelySeparable_of_interactionContrast_eq_zero
    (R : W × T → V)
    (w0 : W) (t0 : T)
    (hZero : ∀ w1 w2 t1 t2,
      interactionContrast R w1 w2 t1 t2 = 0) :
    AdditivelySeparable R := by
  refine ⟨fun w => R (w, t0),
    fun t => R (w0, t) - R (w0, t0), ?_⟩
  intro w t
  have h := hZero w w0 t t0
  change R (w, t) - R (w, t0) -
    R (w0, t) + R (w0, t0) = 0 at h
  calc
    R (w, t) =
      (R (w, t) - R (w, t0) - R (w0, t) + R (w0, t0)) +
        R (w, t0) + (R (w0, t) - R (w0, t0)) := by
          abel
    _ = 0 + R (w, t0) +
        (R (w0, t) - R (w0, t0)) := by rw [h]
    _ = R (w, t0) + (R (w0, t) - R (w0, t0)) := by simp

/-- On a nonempty Cartesian domain (represented by explicit basepoints),
    zero interaction contrast everywhere is equivalent to additive
    separability. -/
theorem additivelySeparable_iff_interactionContrast_eq_zero
    (R : W × T → V)
    (w0 : W) (t0 : T) :
    AdditivelySeparable R ↔
      ∀ w1 w2 t1 t2,
        interactionContrast R w1 w2 t1 t2 = 0 := by
  constructor
  · exact interactionContrast_eq_zero_of_additivelySeparable R
  · exact additivelySeparable_of_interactionContrast_eq_zero R w0 t0

/-- One nonzero four-corner contrast rules out every additive-separable
    decomposition of the declared readout. -/
theorem not_additivelySeparable_of_nonzero_interactionContrast
    (R : W × T → V)
    {w1 w2 : W} {t1 t2 : T}
    (hNonzero : interactionContrast R w1 w2 t1 t2 ≠ 0) :
    ¬ AdditivelySeparable R := by
  intro hSep
  exact hNonzero
    (interactionContrast_eq_zero_of_additivelySeparable
      R hSep w1 w2 t1 t2)

/-- A constant additive detector offset cancels exactly from the
    four-corner contrast. This does not cover nonlinear calibration. -/
theorem interactionContrast_add_constant
    (R : W × T → V) (c : V)
    (w1 w2 : W) (t1 t2 : T) :
    interactionContrast (fun p => R p + c) w1 w2 t1 t2 =
      interactionContrast R w1 w2 t1 t2 := by
  simp [interactionContrast]
  abel

#print axioms interactionContrast_eq_zero_of_additivelySeparable
#print axioms additivelySeparable_of_interactionContrast_eq_zero
#print axioms additivelySeparable_iff_interactionContrast_eq_zero
#print axioms not_additivelySeparable_of_nonzero_interactionContrast
#print axioms interactionContrast_add_constant

end HsHVerification.KestrelJointReadoutInteraction
