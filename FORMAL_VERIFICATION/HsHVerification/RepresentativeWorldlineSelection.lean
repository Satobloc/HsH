import Mathlib

/-!
# Representative-worldline selection and observable invariance

This module formalizes a representation-level contract for an extended support
whose reduced description uses one or more admissible representative curves.

It does not define a physical worldtube, choose a spin supplementary condition,
or establish any H(s)H/GR correspondence. Those remain source- and model-level
inputs. The results state what follows once an admissibility relation and a
readout map have been supplied.
-/

namespace HsHVerification.RepresentativeWorldlineSelection

universe u v w

variable {Support : Type u} {Curve : Type v} {Observable : Type w}

/-- At least one curve is admitted as a representative of a support. -/
def HasRepresentative
    (selects : Support → Curve → Prop) (support : Support) : Prop :=
  ∃ curve, selects support curve

/-- Exactly one curve is admitted as a representative of a support. -/
def UniqueRepresentative
    (selects : Support → Curve → Prop) (support : Support) : Prop :=
  ∃! curve, selects support curve

/-- A readout is invariant when every admissible representative gives
    the same observable value for the fixed support. -/
def ReadoutInvariant
    (selects : Support → Curve → Prop)
    (readout : Curve → Observable)
    (support : Support) : Prop :=
  ∀ curve₁ curve₂,
    selects support curve₁ →
    selects support curve₂ →
    readout curve₁ = readout curve₂

/-- Two distinct admissible representatives refute uniqueness. -/
theorem distinct_admissible_representatives_refute_uniqueness
    (selects : Support → Curve → Prop)
    (support : Support)
    (curve₁ curve₂ : Curve)
    (h₁ : selects support curve₁)
    (h₂ : selects support curve₂)
    (hDistinct : curve₁ ≠ curve₂) :
    ¬ UniqueRepresentative selects support := by
  rintro ⟨chosen, hChosen, hUnique⟩
  apply hDistinct
  exact (hUnique curve₁ h₁).trans (hUnique curve₂ h₂).symm

/-- A unique representative makes every readout invariant on that
    singleton admissible set. -/
theorem unique_selection_implies_readout_invariant
    (selects : Support → Curve → Prop)
    (readout : Curve → Observable)
    (support : Support)
    (hUnique : UniqueRepresentative selects support) :
    ReadoutInvariant selects readout support := by
  rcases hUnique with ⟨representative, hRepresentative, hUnique⟩
  intro curve₁ curve₂ h₁ h₂
  calc
    readout curve₁ = readout representative :=
      congrArg readout (hUnique curve₁ h₁)
    _ = readout curve₂ :=
      congrArg readout (hUnique curve₂ h₂).symm

/-- For a nonempty admissible set, readout invariance is equivalent to
    existence of one common observable value for all admissible choices. -/
theorem readout_invariant_iff_common_value
    (selects : Support → Curve → Prop)
    (readout : Curve → Observable)
    (support : Support)
    (hNonempty : HasRepresentative selects support) :
    ReadoutInvariant selects readout support ↔
      ∃ value, ∀ curve, selects support curve → readout curve = value := by
  constructor
  · intro hInvariant
    rcases hNonempty with ⟨representative, hRepresentative⟩
    refine ⟨readout representative, ?_⟩
    intro curve hCurve
    exact hInvariant curve representative hCurve hRepresentative
  · rintro ⟨value, hValue⟩ curve₁ curve₂ h₁ h₂
    exact (hValue curve₁ h₁).trans (hValue curve₂ h₂).symm

/-!
The following finite logical control is deliberately synthetic. It shows that
nonunique representation and readout invariance can coexist. It is not a
physical fixture, a worldtube model, or observational evidence.
-/

def allBoolRepresentatives (_ : Unit) (_ : Bool) : Prop := True

def constantObservable (_ : Bool) : Unit := ()

theorem nonunique_selection_can_be_readout_invariant :
    ¬ UniqueRepresentative allBoolRepresentatives () ∧
    ReadoutInvariant allBoolRepresentatives constantObservable () := by
  constructor
  · intro hUnique
    rcases hUnique with ⟨chosen, hChosen, hUnique⟩
    have hFalse : false = chosen := hUnique false trivial
    have hTrue : true = chosen := hUnique true trivial
    have hContradiction : false = true := hFalse.trans hTrue.symm
    cases hContradiction
  · intro curve₁ curve₂ h₁ h₂
    rfl

#print axioms distinct_admissible_representatives_refute_uniqueness
#print axioms unique_selection_implies_readout_invariant
#print axioms readout_invariant_iff_common_value
#print axioms nonunique_selection_can_be_readout_invariant

end HsHVerification.RepresentativeWorldlineSelection
