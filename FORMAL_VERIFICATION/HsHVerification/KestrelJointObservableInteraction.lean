import Mathlib

/-!
# Kestrel: mixed interaction contrast and an explicit observable map

This module contains two separate mathematical objects:

* a source-grounded, invertible two-contour-to-observable-pair map from
  Barckicke, Falcon, and Gissinger, *Kelvin wave propagation along vortex
  cores*, Nature Physics (2026), Methods, measurement techniques; and
* a source-neutral four-corner interaction contrast for a joint observable.

The contour-map example is a standard experimental measurement map, not an
H(s)H projection and not evidence for an H(s)H physical carrier. The factor
types W and T in the interaction result are abstract index domains only;
they do not assert that H(s)H has independently variable worldtube and
timesheet carriers. The output V is a common additive observable space (or
a product of separately typed channels).

The four-corner contrast cancels contributions additive in W alone,
additive in T alone, or a constant detector offset. On a full Cartesian
domain, vanishing of every contrast is equivalent to additive separability.
A nonzero contrast therefore rejects that restricted class.

A nonzero contrast is not, by itself, evidence of physical coupling or
causation. The four states must be source-defined and physically admissible;
independent variation, common acquisition/calibration, covariance, units,
and a frozen holdout remain empirical obligations. Nonlinear calibration
must not be silently applied after the contrast.

Terminology note: the historical Kestrel source explicitly preferred
"intersection", "instantiating", or "observable slice" over "readout".
This module uses "observable"; the existing CPPG term is retained only as
an interoperability pointer.
-/

namespace HsHVerification.KestrelJointObservableInteraction

/-- For one (z,t) sample, map the two opposite contour radii
    (r0,rπ) to horizontal displacement η and core radius a:
    η=(r0-rπ)/2, a=(r0+rπ)/2.

    Source: Barckicke, Falcon & Gissinger, Nature Physics (2026),
    DOI 10.1038/s41567-026-03175-w, Methods, lines 234-237 of the
    accessible author-hosted article PDF. -/
noncomputable def contourPairToObservablePair (p : ℝ × ℝ) : ℝ × ℝ :=
  ((p.1 - p.2) / 2, (p.1 + p.2) / 2)

/-- Inverse of contourPairToObservablePair:
    (η,a) ↦ (r0,rπ)=(η+a,a-η). -/
def observablePairToContourPair (p : ℝ × ℝ) : ℝ × ℝ :=
  (p.1 + p.2, p.2 - p.1)

/-- The contour-to-observable map has the stated inverse. -/
theorem observablePairToContourPair_left_inv (p : ℝ × ℝ) :
    observablePairToContourPair (contourPairToObservablePair p) = p := by
  ext <;> simp [contourPairToObservablePair, observablePairToContourPair] <;> ring

/-- The observable-to-contour map is also a left inverse. -/
theorem contourPairToObservablePair_right_inv (p : ℝ × ℝ) :
    contourPairToObservablePair (observablePairToContourPair p) = p := by
  ext <;> simp [contourPairToObservablePair, observablePairToContourPair] <;> ring

/-- Exact per-sample equivalence between the measured contour pair and
    the derived (displacement, radius) pair. This says nothing about later
    Fourier-power or summary operations, which require separate information
    and identifiability analysis. -/
noncomputable def contourPairObservableEquiv : (ℝ × ℝ) ≃ (ℝ × ℝ) where
  toFun := contourPairToObservablePair
  invFun := observablePairToContourPair
  left_inv := observablePairToContourPair_left_inv
  right_inv := contourPairToObservablePair_right_inv

universe u v w

variable {W : Type u} {T : Type v} {V : Type w}
variable [AddCommGroup V]

/-- Four-corner mixed contrast of a joint observable O : W × T → V. -/
def interactionContrast
    (O : W × T → V)
    (w1 w2 : W) (t1 t2 : T) : V :=
  O (w1, t1) - O (w1, t2) - O (w2, t1) + O (w2, t2)

/-- An observable is additively separable when it is a sum of a W-only
    contribution and a T-only contribution. -/
def AdditivelySeparable (O : W × T → V) : Prop :=
  ∃ f : W → V, ∃ g : T → V,
    ∀ w t, O (w, t) = f w + g t

/-- Additive separability forces every four-corner interaction contrast
    to vanish. -/
theorem interactionContrast_eq_zero_of_additivelySeparable
    (O : W × T → V)
    (hSep : AdditivelySeparable O) :
    ∀ w1 w2 t1 t2, interactionContrast O w1 w2 t1 t2 = 0 := by
  rcases hSep with ⟨f, g, hO⟩
  intro w1 w2 t1 t2
  change O (w1, t1) - O (w1, t2) -
    O (w2, t1) + O (w2, t2) = 0
  rw [hO w1 t1, hO w1 t2, hO w2 t1, hO w2 t2]
  abel

/-- If every four-corner contrast vanishes, then the observable is
    additively separable. The supplied basepoints construct the two
    one-factor terms; no topology or continuity assumption is needed. -/
theorem additivelySeparable_of_interactionContrast_eq_zero
    (O : W × T → V)
    (w0 : W) (t0 : T)
    (hZero : ∀ w1 w2 t1 t2,
      interactionContrast O w1 w2 t1 t2 = 0) :
    AdditivelySeparable O := by
  refine ⟨fun w => O (w, t0),
    fun t => O (w0, t) - O (w0, t0), ?_⟩
  intro w t
  have h := hZero w w0 t t0
  change O (w, t) - O (w, t0) -
    O (w0, t) + O (w0, t0) = 0 at h
  calc
    O (w, t) =
      (O (w, t) - O (w, t0) - O (w0, t) + O (w0, t0)) +
        O (w, t0) + (O (w0, t) - O (w0, t0)) := by
          abel
    _ = 0 + O (w, t0) +
        (O (w0, t) - O (w0, t0)) := by rw [h]
    _ = O (w, t0) + (O (w0, t) - O (w0, t0)) := by simp

/-- On a nonempty Cartesian domain (represented by explicit basepoints),
    zero interaction contrast everywhere is equivalent to additive
    separability. -/
theorem additivelySeparable_iff_interactionContrast_eq_zero
    (O : W × T → V)
    (w0 : W) (t0 : T) :
    AdditivelySeparable O ↔
      ∀ w1 w2 t1 t2,
        interactionContrast O w1 w2 t1 t2 = 0 := by
  constructor
  · exact interactionContrast_eq_zero_of_additivelySeparable O
  · exact additivelySeparable_of_interactionContrast_eq_zero O w0 t0

/-- One nonzero four-corner contrast rules out every additive-separable
    decomposition of the declared observable. -/
theorem not_additivelySeparable_of_nonzero_interactionContrast
    (O : W × T → V)
    {w1 w2 : W} {t1 t2 : T}
    (hNonzero : interactionContrast O w1 w2 t1 t2 ≠ 0) :
    ¬ AdditivelySeparable O := by
  intro hSep
  exact hNonzero
    (interactionContrast_eq_zero_of_additivelySeparable
      O hSep w1 w2 t1 t2)

/-- A constant additive detector offset cancels exactly from the
    four-corner contrast. This does not cover nonlinear calibration. -/
theorem interactionContrast_add_constant
    (O : W × T → V) (c : V)
    (w1 w2 : W) (t1 t2 : T) :
    interactionContrast (fun p => O p + c) w1 w2 t1 t2 =
      interactionContrast O w1 w2 t1 t2 := by
  simp [interactionContrast]
  abel

#print axioms observablePairToContourPair_left_inv
#print axioms contourPairToObservablePair_right_inv
#print axioms interactionContrast_eq_zero_of_additivelySeparable
#print axioms additivelySeparable_of_interactionContrast_eq_zero
#print axioms additivelySeparable_iff_interactionContrast_eq_zero
#print axioms not_additivelySeparable_of_nonzero_interactionContrast
#print axioms interactionContrast_add_constant

end HsHVerification.KestrelJointObservableInteraction
