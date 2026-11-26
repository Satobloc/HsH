import Mathlib

/-!
# Achronal future horismos and observer intersections

This module formalizes a conditional causal-order result relevant to the
2026-10-21 "Minkowski Ring Analysis" source cluster.

The only spacetime-level premise represented here is the push-up property:
if p causally precedes x and x chronologically precedes y, then p
chronologically precedes y. A future-directed timelike observer is
represented by a curve whose later parameter values are chronologically
related to its earlier values.

The module proves that the future horismos E⁺(p) = J⁺(p) minus I⁺(p)
is achronal under that premise, and that such an observer can meet it at most
once.

This is deliberately relation-level. It does NOT formalize a Lorentzian
metric, the null-geodesic equation, the topological identity
E⁺(p) = ∂J⁺(p), a caustic/cut-locus construction, Einstein's equations, or
a map from H(s)H's native (++++) geometry to an induced Lorentzian metric.

Primary source pointers:
- "Minkowski Ring Analysis", conversation
  6ad7e9c0-e8a0-83e9-984e-94d020de3abf, raw Git blob
  56a84cb85d5c386efa4ea11d322d11e95e2c7703.
- Nathan Direct user-role messages
  7d9098d6-afcc-4cd5-b126-683ab0733336 and
  4b197395-2d6b-42c3-a877-66428f1dc7c4 (2026-10-21).
- Assistant-generated repeated-crossing surface is separately classified
  as a non-null sandbox construction.
-/

namespace HsHVerification.AchronalBoundaryObserverIntersection

variable {X T : Type*}

/-- A subset is achronal relative to the chronological relation when no
ordered pair of its points is chronologically related. -/
def Achronal (Chronological : X → X → Prop) (S : X → Prop) : Prop :=
  ∀ ⦃x y : X⦄, S x → S y → ¬ Chronological x y

/-- The future horismos E⁺(p) = J⁺(p) minus I⁺(p), represented using
causal and chronological relations. Identifying this with a topological
boundary requires the appropriate causal regularity assumptions. -/
def FutureHorismos
    (Causal Chronological : X → X → Prop) (p x : X) : Prop :=
  Causal p x ∧ ¬ Chronological p x

/-- A future-timelike observer: later parameter values are chronologically
to the future of earlier parameter values. -/
def FutureTimelikeObserver
    (Before : T → T → Prop)
    (Chronological : X → X → Prop)
    (γ : T → X) : Prop :=
  ∀ ⦃s t : T⦄, Before s t → Chronological (γ s) (γ t)

/-- The push-up property makes the future horismos achronal. -/
theorem futureHorismos_is_achronal
    (Causal Chronological : X → X → Prop) (p : X)
    (hPushUp :
      ∀ ⦃x y : X⦄, Causal p x → Chronological x y → Chronological p y) :
    Achronal Chronological (FutureHorismos Causal Chronological p) := by
  intro x y hx hy hxy
  exact hy.2 (hPushUp hx.1 hxy)

/-- Once an observer has reached the causal future, every later point on
that future-timelike observer curve lies in the chronological future. -/
theorem laterObserverEvent_is_chronologicallyFuture
    (Causal Chronological : X → X → Prop)
    (Before : T → T → Prop) (p : X) (γ : T → X)
    (hPushUp :
      ∀ ⦃x y : X⦄, Causal p x → Chronological x y → Chronological p y)
    (hObserver : FutureTimelikeObserver Before Chronological γ) :
    ∀ ⦃s t : T⦄, Before s t →
      Causal p (γ s) → Chronological p (γ t) := by
  intro s t hst hCausal
  exact hPushUp hCausal (hObserver hst)

/-- A future-directed timelike observer can meet the future horismos of
one event at most once. -/
theorem observer_meets_futureHorismos_at_most_once
    (Causal Chronological : X → X → Prop)
    (Before : T → T → Prop) (p : X) (γ : T → X)
    (hPushUp :
      ∀ ⦃x y : X⦄, Causal p x → Chronological x y → Chronological p y)
    (hObserver : FutureTimelikeObserver Before Chronological γ) :
    ∀ ⦃s t : T⦄, Before s t →
      FutureHorismos Causal Chronological p (γ s) →
      FutureHorismos Causal Chronological p (γ t) →
      False := by
  intro s t hst hs ht
  exact ht.2 (hPushUp hs.1 (hObserver hst))

/-- Generic form: any achronal set can be met at most once by a
future-timelike observer. -/
theorem observer_meets_achronal_set_at_most_once
    (Chronological : X → X → Prop) (S : X → Prop)
    (Before : T → T → Prop) (γ : T → X)
    (hAchronal : Achronal Chronological S)
    (hObserver : FutureTimelikeObserver Before Chronological γ) :
    ∀ ⦃s t : T⦄, Before s t → S (γ s) → S (γ t) → False := by
  intro s t hst hs ht
  exact hAchronal hs ht (hObserver hst)

#print axioms futureHorismos_is_achronal
#print axioms laterObserverEvent_is_chronologicallyFuture
#print axioms observer_meets_futureHorismos_at_most_once
#print axioms observer_meets_achronal_set_at_most_once

end HsHVerification.AchronalBoundaryObserverIntersection
