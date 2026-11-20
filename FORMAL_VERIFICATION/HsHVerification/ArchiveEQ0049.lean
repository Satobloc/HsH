import Mathlib

/-!
Archive recovery EQ-0049: projection-composition coherence gate.

Historical source:
  Satobloc/SAT_THEORY_ARCHIVE_2023-25/SATOBLOC MISC/SAT O1 4D.txt
  blob 7577aa1ee5a6c3850ce3b226c75377de6367aedc

The source gives a parametrized filament and describes a swept "worldtube", but
does not supply direct and staged projection maps between centerline, volume,
finite radius, frame, or contact layers.  The maps below are therefore a
general assistant reconstruction of the condition any such recovered hierarchy
must satisfy.  These theorems prove only the encoded functional logic; they do
not establish a source translation, geometric existence, or physical model.
-/

namespace HsHVerification.ArchiveEQ0049

/-- A direct fine-to-coarse map is coherent with a staged projection exactly
when the two paths agree on every fine object. -/
def ProjectionCoherent {Fine Middle Coarse : Type*}
    (direct : Fine → Coarse)
    (fineToMiddle : Fine → Middle)
    (middleToCoarse : Middle → Coarse) : Prop :=
  ∀ x, direct x = middleToCoarse (fineToMiddle x)

theorem coherent_paths_equal
    {Fine Middle Coarse : Type*}
    (direct : Fine → Coarse)
    (fineToMiddle : Fine → Middle)
    (middleToCoarse : Middle → Coarse)
    (h : ProjectionCoherent direct fineToMiddle middleToCoarse)
    (x : Fine) :
    direct x = middleToCoarse (fineToMiddle x) :=
  h x

theorem coherent_iff_function_equality
    {Fine Middle Coarse : Type*}
    (direct : Fine → Coarse)
    (fineToMiddle : Fine → Middle)
    (middleToCoarse : Middle → Coarse) :
    ProjectionCoherent direct fineToMiddle middleToCoarse ↔
      direct = middleToCoarse ∘ fineToMiddle := by
  constructor
  · intro h
    funext x
    exact h x
  · intro h x
    exact congrFun h x

theorem coarse_readout_agrees_of_coherent
    {Fine Middle Coarse Observable : Type*}
    (direct : Fine → Coarse)
    (fineToMiddle : Fine → Middle)
    (middleToCoarse : Middle → Coarse)
    (readout : Coarse → Observable)
    (h : ProjectionCoherent direct fineToMiddle middleToCoarse)
    (x : Fine) :
    readout (direct x) =
      readout (middleToCoarse (fineToMiddle x)) :=
  congrArg readout (h x)

theorem mismatch_witness_refutes_coherence
    {Fine Middle Coarse : Type*}
    (direct : Fine → Coarse)
    (fineToMiddle : Fine → Middle)
    (middleToCoarse : Middle → Coarse)
    (x : Fine)
    (hMismatch : direct x ≠ middleToCoarse (fineToMiddle x)) :
    ¬ ProjectionCoherent direct fineToMiddle middleToCoarse := by
  intro h
  exact hMismatch (h x)

theorem changed_readout_refutes_coherence
    {Fine Middle Coarse Observable : Type*}
    (direct : Fine → Coarse)
    (fineToMiddle : Fine → Middle)
    (middleToCoarse : Middle → Coarse)
    (readout : Coarse → Observable)
    (x : Fine)
    (hChanged :
      readout (direct x) ≠
        readout (middleToCoarse (fineToMiddle x))) :
    ¬ ProjectionCoherent direct fineToMiddle middleToCoarse := by
  intro h
  exact hChanged (congrArg readout (h x))

theorem identity_readout_is_exact_discriminator
    {Fine Middle Coarse : Type*}
    (direct : Fine → Coarse)
    (fineToMiddle : Fine → Middle)
    (middleToCoarse : Middle → Coarse)
    (x : Fine) :
    (fun y : Coarse => y) (direct x) ≠
        (fun y : Coarse => y) (middleToCoarse (fineToMiddle x)) ↔
      direct x ≠ middleToCoarse (fineToMiddle x) := by
  rfl

#print axioms coherent_paths_equal
#print axioms coherent_iff_function_equality
#print axioms coarse_readout_agrees_of_coherent
#print axioms mismatch_witness_refutes_coherence
#print axioms changed_readout_refutes_coherence
#print axioms identity_readout_is_exact_discriminator

end HsHVerification.ArchiveEQ0049
