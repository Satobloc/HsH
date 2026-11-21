import Mathlib
import HsHVerification.RavelFiberTransportNonuniqueness

/-!
# Ravel: coherent conversion across representation choices

## Source anchor

The original raw conversation "SAT theory clarification" was fetched by the
same Git blob SHA from both Satobloc/SAT_THEORY_ARCHIVE_2023-25 and
Satobloc/HsH. The two repository copies are byte-identical mirrors, not
independent witnesses:

- Conversation: `69378c7f-6320-8325-9e10-83e42fe1433c`
- Git blob: `507a7000082415373ee98dbc95f18a991dff3c5a`
- Nathan Direct user message: `07e8d0d0-5790-4f61-98b5-6af71acc7d8c`
- Timestamp: 2025-12-09T04:35:56.748Z

The direct message asks whether dynamical change may be allocated between
time-field distortion and particle wave-equation evolution, with local
representations convertible across that range while global behavior remains
unchanged. It is a source-verified proposal/question, not a demonstrated
equivalence theorem.

The immediate assistant descendant
`63d479f5-e0ef-4dff-8cd5-2c021bba1d65` calls the descriptions
"mathematically equivalent" and says global behavior is independent of the
choice. That is assistant-authored elaboration, not Nathan Direct proof.

## Formal question

What additional conditions are needed beyond pairwise invertible conversion?

The existing `FiberTransport` structure supplies:
1. an equivalence between every pair of representation fibers;
2. identity conversion;
3. path-independent composition.

That alone does not force the dynamics or observable readout to be
representation-independent. This module adds explicit naturality conditions:

- evolution must intertwine with conversion;
- the observable must be invariant under conversion.

Under those assumptions, the evolved observable is independent of the
chosen representation. Finite Bool counterexamples show that the
`FiberTransport` laws alone do not imply either extra condition.

## Limits

The representation index is an arbitrary type. No continuous topology,
smooth dependence, interpolation parameter, physical state space, wave
equation, time-field variable, metric, action, instrument, units, or measured
system is instantiated. The Bool examples are abstract mathematical
counterexamples, not physical fixtures.

Lean checks only these conditional statements. It does not establish that
the direct source's proposed conversions exist, that the physical dynamics
intertwine, that observables are invariant, or that SAT/H(s)H is empirically
correct.
-/

namespace HsHVerification.RavelRepresentationConversionCoherence

open HsHVerification.RavelFiberTransportNonuniqueness

universe u v w z

variable {Λ : Type u}
variable {State : Λ → Type v}
variable {Time : Type w}
variable {ReadoutValue : Type z}

variable (T : FiberTransport Λ State)

/-- Conversion from a representation to another and back is identity. -/
theorem conversion_round_trip_source (a b : Λ) (x : State a) :
    T.transport b a (T.transport a b x) = x := by
  calc
    T.transport b a (T.transport a b x) =
        T.transport a a x := T.composition a b a x
    _ = x := T.identity a x

/-- The reverse round trip is also identity. -/
theorem conversion_round_trip_target (a b : Λ) (y : State b) :
    T.transport a b (T.transport b a y) = y := by
  calc
    T.transport a b (T.transport b a y) =
        T.transport b b y := T.composition b a b y
    _ = y := T.identity b y

/-- Any two-step conversion agrees with the direct conversion. -/
theorem conversion_path_independent (a b c : Λ) (x : State a) :
    T.transport b c (T.transport a b x) =
      T.transport a c x :=
  T.composition a b c x

/-- Evolution on each representation, with an explicit conversion-commutation law. -/
structure Evolution (T : FiberTransport Λ State) (Time : Type w) where
  evolve : ∀ rep, Time → State rep → State rep
  conversion_commutes :
    ∀ a b t x,
      T.transport a b (evolve a t x) =
        evolve b t (T.transport a b x)

/-- A readout family is invariant under the declared representation conversions. -/
structure Observable (T : FiberTransport Λ State) (ReadoutValue : Type z) where
  observe : ∀ rep, State rep → ReadoutValue
  conversion_invariant :
    ∀ a b x,
      observe b (T.transport a b x) = observe a x

/-- If evolution intertwines with conversion and the readout is invariant,
    the evolved observable is independent of the representation choice. -/
theorem observable_after_evolution_independent
    (T : FiberTransport Λ State)
    {Time : Type w} {ReadoutValue : Type z}
    (E : Evolution T Time) (O : Observable T ReadoutValue)
    (a b : Λ) (t : Time) (x : State a) :
    O.observe b (E.evolve b t (T.transport a b x)) =
      O.observe a (E.evolve a t x) := by
  calc
    O.observe b (E.evolve b t (T.transport a b x)) =
        O.observe b (T.transport a b (E.evolve a t x)) := by
          rw [← E.conversion_commutes a b t x]
    _ = O.observe a (E.evolve a t x) :=
      O.conversion_invariant a b (E.evolve a t x)

/-! ## Abstract counterexamples: conversion laws alone are insufficient. -/

def boolIdentityTransport : FiberTransport Bool (fun _ => Bool) :=
  identityTransport Bool Bool

/-- A representation-indexed evolution can differ even when conversion is
    a perfectly coherent identity transport. -/
def boolIndexedEvolution (label _time state : Bool) : Bool :=
  if label then !state else state

theorem identity_conversion_does_not_force_dynamics_compatibility :
    boolIdentityTransport.transport false true
        (boolIndexedEvolution false true true) ≠
      boolIndexedEvolution true true
        (boolIdentityTransport.transport false true true) := by
  decide

/-- A representation-indexed readout can also differ under identity
    conversion; observable invariance is a separate assumption. -/
def boolIndexedReadout (label state : Bool) : Bool :=
  if label then !state else state

theorem identity_conversion_does_not_force_readout_invariance :
    boolIndexedReadout true
        (boolIdentityTransport.transport false true true) ≠
      boolIndexedReadout false true := by
  decide

#print axioms HsHVerification.RavelRepresentationConversionCoherence.conversion_round_trip_source
#print axioms HsHVerification.RavelRepresentationConversionCoherence.conversion_round_trip_target
#print axioms HsHVerification.RavelRepresentationConversionCoherence.conversion_path_independent
#print axioms HsHVerification.RavelRepresentationConversionCoherence.observable_after_evolution_independent
#print axioms HsHVerification.RavelRepresentationConversionCoherence.identity_conversion_does_not_force_dynamics_compatibility
#print axioms HsHVerification.RavelRepresentationConversionCoherence.identity_conversion_does_not_force_readout_invariance

end HsHVerification.RavelRepresentationConversionCoherence
