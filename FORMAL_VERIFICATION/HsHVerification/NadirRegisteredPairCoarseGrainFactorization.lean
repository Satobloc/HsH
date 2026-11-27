import Mathlib
import HsHVerification.NadirProjectionCoarseGrainFactorization

/-!
# Registered-pair coarse-graining and joint-readout descent

This module composes two already separate contracts:

1. a cross-modal sample pair is admitted only when both samples map to the
   same externally registered event identity;
2. each channel is coarse-grained, and the resulting pair must still map to
   one common coarse event identity.

The registered-pair type is a pullback (fiber product), not an arbitrary
Cartesian product or positional zip. The coarse-registration compatibility
hypothesis supplies the two commutative channel-to-event squares.

After that map exists, the existing projection/coarse-graining theorem is
reused: a deterministic joint readout descends to the coarse registered-pair
image if and only if it is constant on every fiber of the coarse-pair map.

This is a typed map contract. It does not create clock transforms, calibrate
spatial frames, validate registration evidence, or establish that any
published experiment actually supplies these maps. Its inputs are already
admitted samples and externally validated event-registration functions.
It does not model missing or unregistered samples; those must be excluded
before this total-map layer or represented by an explicitly partial domain.
-/

namespace HsHVerification.NadirRegisteredPairCoarseGrainFactorization

universe u v w u' v' w' z

variable {A : Type u} {B : Type v} {E : Type w}
variable {Abar : Type u'} {Bbar : Type v'} {Ebar : Type w'}
variable {O : Type z}

/-- A pair of samples registered to the same event identity. -/
def RegisteredPair (rA : A → E) (rB : B → E) :=
  {p : A × B // rA p.1 = rB p.2}

/-- The common event identity carried by an admitted registered pair. -/
def commonEvent
    (rA : A → E) (rB : B → E)
    (p : RegisteredPair rA rB) : E :=
  rA p.1.1

theorem commonEvent_eq_second
    (rA : A → E) (rB : B → E)
    (p : RegisteredPair rA rB) :
    commonEvent rA rB p = rB p.1.2 :=
  p.2

/--
Each channel's coarse sample-to-event map agrees with one shared
coarse-graining of the fine event identity. These are the two commutative
squares required for registration to survive a change of scale.
-/
def CoarseRegistrationCompatible
    (rA : A → E) (rB : B → E)
    (cA : A → Abar) (cB : B → Bbar)
    (eA : Abar → Ebar) (eB : Bbar → Ebar)
    (e : E → Ebar) : Prop :=
  (∀ a, eA (cA a) = e (rA a)) ∧
  (∀ b, eB (cB b) = e (rB b))

/--
Coarsen a registered pair. Compatibility ensures that the two coarse
samples still carry the same coarse event identity.
-/
def coarseRegisteredPairMap
    (rA : A → E) (rB : B → E)
    (cA : A → Abar) (cB : B → Bbar)
    (eA : Abar → Ebar) (eB : Bbar → Ebar)
    (e : E → Ebar)
    (hCompat : CoarseRegistrationCompatible rA rB cA cB eA eB e) :
    RegisteredPair rA rB → RegisteredPair eA eB :=
  fun p =>
    ⟨(cA p.1.1, cB p.1.2), by
      calc
        eA (cA p.1.1) = e (rA p.1.1) := hCompat.1 p.1.1
        _ = e (rB p.1.2) := congrArg e p.2
        _ = eB (cB p.1.2) := (hCompat.2 p.1.2).symm
    ⟩

theorem coarseRegisteredPairMap_preserves_registration
    (rA : A → E) (rB : B → E)
    (cA : A → Abar) (cB : B → Bbar)
    (eA : Abar → Ebar) (eB : Bbar → Ebar)
    (e : E → Ebar)
    (hCompat : CoarseRegistrationCompatible rA rB cA cB eA eB e)
    (p : RegisteredPair rA rB) :
    eA (cA p.1.1) = eB (cB p.1.2) :=
  (coarseRegisteredPairMap rA rB cA cB eA eB e hCompat p).2

/--
A joint readout on fine registered pairs is representable at the coarse
registered-pair resolution exactly when it is constant on fibers of the
coarse-pair map. The codomain is the actual image, not an assumed ambient
coarse-observation space.
-/
theorem coarseJointReadout_factors_iff_fiberwise
    (rA : A → E) (rB : B → E)
    (cA : A → Abar) (cB : B → Bbar)
    (eA : Abar → Ebar) (eB : Bbar → Ebar)
    (e : E → Ebar)
    (hCompat : CoarseRegistrationCompatible rA rB cA cB eA eB e)
    (readout : RegisteredPair rA rB → O) :
    (∃ coarseReadout :
        Set.range (coarseRegisteredPairMap rA rB cA cB eA eB e hCompat) → O,
      ∀ p, coarseReadout
        (HsHVerification.NadirProjectionCoarseGrainFactorization.imageProjection
          (coarseRegisteredPairMap rA rB cA cB eA eB e hCompat) p) =
        readout p) ↔
    (∀ p q,
      coarseRegisteredPairMap rA rB cA cB eA eB e hCompat p =
        coarseRegisteredPairMap rA rB cA cB eA eB e hCompat q →
      readout p = readout q) := by
  exact
    HsHVerification.NadirProjectionCoarseGrainFactorization.factorization_iff_fiberwise
      (coarseRegisteredPairMap rA rB cA cB eA eB e hCompat)
      (fun p => p)
      readout

/--
If two fine registered pairs collapse to the same coarse registered pair
but their joint readout differs, no deterministic readout on the coarse
image can preserve both values.
-/
theorem no_coarse_joint_readout_of_fiber_mismatch
    (rA : A → E) (rB : B → E)
    (cA : A → Abar) (cB : B → Bbar)
    (eA : Abar → Ebar) (eB : Bbar → Ebar)
    (e : E → Ebar)
    (hCompat : CoarseRegistrationCompatible rA rB cA cB eA eB e)
    (readout : RegisteredPair rA rB → O)
    (p q : RegisteredPair rA rB)
    (hSameCoarsePair :
      coarseRegisteredPairMap rA rB cA cB eA eB e hCompat p =
        coarseRegisteredPairMap rA rB cA cB eA eB e hCompat q)
    (hDifferentReadout : readout p ≠ readout q) :
    ¬ ∃ coarseReadout :
        Set.range (coarseRegisteredPairMap rA rB cA cB eA eB e hCompat) → O,
      ∀ x, coarseReadout
        (HsHVerification.NadirProjectionCoarseGrainFactorization.imageProjection
          (coarseRegisteredPairMap rA rB cA cB eA eB e hCompat) x) =
        readout x := by
  intro hFactors
  have hFiber :=
    (coarseJointReadout_factors_iff_fiberwise
      rA rB cA cB eA eB e hCompat readout).mp hFactors
  exact hDifferentReadout (hFiber p q hSameCoarsePair)

#print axioms commonEvent_eq_second
#print axioms coarseRegisteredPairMap_preserves_registration
#print axioms coarseJointReadout_factors_iff_fiberwise
#print axioms no_coarse_joint_readout_of_fiber_mismatch

end HsHVerification.NadirRegisteredPairCoarseGrainFactorization
