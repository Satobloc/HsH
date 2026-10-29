import Mathlib

/-!
# Archive EQ-0051: source-translation round-trip gate

This module formalizes a source-critical gate motivated by the archive contrast
between SAT-O's one-parameter filament curve and Blockwave's conserved
two-form worldsheet current.

The theorems are deliberately representation-generic. They do **not** assert
that a SAT-O curve and a Blockwave current are equivalent, nor do they construct
either map. They state what would have to be proved before calling two archival
formulations a lossless translation.

Lean checks only these encoded implications. It does not establish historical
intent, fidelity of the source-to-formalization translation, or empirical
physics.
-/

namespace HsHVerification.ArchiveEQ0051

universe u v w

/-- Decoding after encoding recovers every source state. -/
def LeftRoundTrip {Source : Type u} {Target : Type v}
    (encode : Source → Target) (decode : Target → Source) : Prop :=
  ∀ source, decode (encode source) = source

/-- Encoding after decoding recovers every target state. -/
def RightRoundTrip {Source : Type u} {Target : Type v}
    (encode : Source → Target) (decode : Target → Source) : Prop :=
  ∀ target, encode (decode target) = target

/-- A lossless translation has both round-trip laws. -/
def LosslessTranslation {Source : Type u} {Target : Type v}
    (encode : Source → Target) (decode : Target → Source) : Prop :=
  LeftRoundTrip encode decode ∧ RightRoundTrip encode decode

theorem encode_injective_of_left_roundtrip
    {Source : Type u} {Target : Type v}
    (encode : Source → Target) (decode : Target → Source)
    (hround : LeftRoundTrip encode decode) :
    Function.Injective encode := by
  intro source₁ source₂ hcollapse
  calc
    source₁ = decode (encode source₁) := (hround source₁).symm
    _ = decode (encode source₂) := congrArg decode hcollapse
    _ = source₂ := hround source₂

theorem encode_surjective_of_right_roundtrip
    {Source : Type u} {Target : Type v}
    (encode : Source → Target) (decode : Target → Source)
    (hround : RightRoundTrip encode decode) :
    Function.Surjective encode := by
  intro target
  exact ⟨decode target, hround target⟩

theorem encode_bijective_of_lossless_translation
    {Source : Type u} {Target : Type v}
    (encode : Source → Target) (decode : Target → Source)
    (hlossless : LosslessTranslation encode decode) :
    Function.Bijective encode :=
  ⟨encode_injective_of_left_roundtrip encode decode hlossless.1,
   encode_surjective_of_right_roundtrip encode decode hlossless.2⟩

/-- An explicit pair of distinct source states collapsed by the encoding
refutes every proposed left inverse. -/
theorem collapse_witness_refutes_left_roundtrip
    {Source : Type u} {Target : Type v}
    (encode : Source → Target) (decode : Target → Source)
    (source₁ source₂ : Source)
    (hdistinct : source₁ ≠ source₂)
    (hcollapse : encode source₁ = encode source₂) :
    ¬ LeftRoundTrip encode decode := by
  intro hround
  exact hdistinct
    (encode_injective_of_left_roundtrip encode decode hround hcollapse)

/-- Once an encoding collapses two source states, every downstream readout of
that encoding is blind to their distinction. -/
theorem collapsed_states_have_same_downstream_readout
    {Source : Type u} {Target : Type v} {Observation : Type w}
    (encode : Source → Target) (readout : Target → Observation)
    (source₁ source₂ : Source)
    (hcollapse : encode source₁ = encode source₂) :
    readout (encode source₁) = readout (encode source₂) :=
  congrArg readout hcollapse

/-- A changed downstream readout is an exact discriminator against collapse at
the proposed translation map. -/
theorem different_downstream_readout_refutes_collapse
    {Source : Type u} {Target : Type v} {Observation : Type w}
    (encode : Source → Target) (readout : Target → Observation)
    (source₁ source₂ : Source)
    (hdifferent :
      readout (encode source₁) ≠ readout (encode source₂)) :
    encode source₁ ≠ encode source₂ := by
  intro hcollapse
  exact hdifferent (congrArg readout hcollapse)

#print axioms encode_injective_of_left_roundtrip
#print axioms encode_surjective_of_right_roundtrip
#print axioms encode_bijective_of_lossless_translation
#print axioms collapse_witness_refutes_left_roundtrip
#print axioms collapsed_states_have_same_downstream_readout
#print axioms different_downstream_readout_refutes_collapse

end HsHVerification.ArchiveEQ0051
