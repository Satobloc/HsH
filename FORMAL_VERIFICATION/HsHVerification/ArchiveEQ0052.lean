import Mathlib

/-!
# Archive Equation 0052: parameterization-descent gate

Source-critical reconstruction, not a recovered historical theorem.

A construction on parameterized representatives can encode a geometric object only
if it is constant on the fibres of the projection to geometric identity.  In a
curve/worldsheet setting, the projection must state the allowed reparameterizations
and orientation convention explicitly.
-/

namespace HsHVerification.ArchiveEQ0052

/-- `encode` descends along `q` when it factors through the proposed
geometric-identity projection. -/
def DescendsAlong {Param Shape Target : Type*}
    (q : Param → Shape) (encode : Param → Target) : Prop :=
  ∃ descended : Shape → Target, ∀ p, encode p = descended (q p)

/-- Descent forces equal encodings for representatives of the same shape. -/
theorem eq_of_same_shape
    {Param Shape Target : Type*}
    {q : Param → Shape} {encode : Param → Target}
    (hdesc : DescendsAlong q encode)
    {p p' : Param} (hshape : q p = q p') :
    encode p = encode p' := by
  rcases hdesc with ⟨descended, hfactor⟩
  rw [hfactor p, hfactor p', hshape]

/-- One same-shape/different-encoding witness refutes descent. -/
theorem witness_blocks_descent
    {Param Shape Target : Type*}
    {q : Param → Shape} {encode : Param → Target}
    {p p' : Param}
    (hshape : q p = q p')
    (hencoding : encode p ≠ encode p') :
    ¬ DescendsAlong q encode := by
  intro hdesc
  exact hencoding (eq_of_same_shape hdesc hshape)

/-- Any downstream readout preserves a valid descent factorization. -/
theorem readout_preserves_descent
    {Param Shape Target Observable : Type*}
    {q : Param → Shape} {encode : Param → Target}
    (hdesc : DescendsAlong q encode)
    (readout : Target → Observable) :
    DescendsAlong q (fun p => readout (encode p)) := by
  rcases hdesc with ⟨descended, hfactor⟩
  refine ⟨fun s => readout (descended s), ?_⟩
  intro p
  rw [hfactor p]

/-- A changed downstream observable on same-shape representatives also refutes
descent of the original encoding. -/
theorem changed_readout_blocks_descent
    {Param Shape Target Observable : Type*}
    {q : Param → Shape} {encode : Param → Target}
    (readout : Target → Observable)
    {p p' : Param}
    (hshape : q p = q p')
    (hchanged : readout (encode p) ≠ readout (encode p')) :
    ¬ DescendsAlong q encode := by
  intro hdesc
  have hreadout :
      readout (encode p) = readout (encode p') :=
    eq_of_same_shape (readout_preserves_descent hdesc readout) hshape
  exact hchanged hreadout

/-- If an injective encoding descends, then the proposed geometric projection
must itself be injective.  Thus an injective representation of representatives
cannot also forget a nontrivial gauge redundancy. -/
theorem quotient_injective_of_encoding_injective
    {Param Shape Target : Type*}
    {q : Param → Shape} {encode : Param → Target}
    (hdesc : DescendsAlong q encode)
    (hencode : Function.Injective encode) :
    Function.Injective q := by
  intro p p' hshape
  exact hencode (eq_of_same_shape hdesc hshape)

/-- Contrapositive architecture gate: a genuinely non-injective quotient and
an injective representative-level encoding cannot satisfy descent together. -/
theorem noninjective_quotient_blocks_injective_encoding_descent
    {Param Shape Target : Type*}
    {q : Param → Shape} {encode : Param → Target}
    (hq : ¬ Function.Injective q)
    (hencode : Function.Injective encode) :
    ¬ DescendsAlong q encode := by
  intro hdesc
  exact hq (quotient_injective_of_encoding_injective hdesc hencode)

#print axioms eq_of_same_shape
#print axioms witness_blocks_descent
#print axioms readout_preserves_descent
#print axioms changed_readout_blocks_descent
#print axioms quotient_injective_of_encoding_injective
#print axioms noninjective_quotient_blocks_injective_encoding_descent

end HsHVerification.ArchiveEQ0052
