import Mathlib
import HsHVerification.RavelCarrierSheetDimensionGate

/-!
# Ravel: directed composition of slice-compatible retractions

This module extends the existing conditional `SliceCompatibleRetraction`
interface. It formalizes the minimum adapter needed to compose two directed
slice maps when their intermediate carrier, sheet, and ambient spaces differ.

The adapter requires an explicit carrier lift, sheet map, and ambient
comparison map, together with commuting conditions. It does not infer these
maps from names, dimensions, or geometric analogy. The ambient comparison is
not assumed injective or invertible.

A composite retraction requires more than the two component zero-section
laws: it requires a separately supplied lift of the second zero section into
the first carrier. A direct path, if one exists, requires its own coherence
witness against the staged composite on a declared admissible domain.

All results are conditional set/type-level mathematics. No source-defined
H(s)H physical lift, sheet map, ambient comparison, or composite section is
asserted to exist. No metric, topology, smoothness, transversality, response
law, measured system, or physical prediction is encoded here.
-/

namespace HsHVerification.RavelDirectedSliceChainComposition

open HsHVerification.RavelCarrierSheetDimensionGate

/-- The explicit bridge needed between two directed slice-compatible
retractions. `carrierLift` maps the first carrier into the second tube;
`sheetMap` maps the first sheet type into the second; `ambientCompare`
compares their ambient representations. The two commuting fields are the
conditions that make the intermediate slice map well-typed. -/
structure DirectedSliceChainAdapter
    {Ambient0 Ambient1 Tube0 Carrier1 Sheet0 Tube1 Carrier2 Sheet1 : Type*}
    (R01 : SliceCompatibleRetraction Ambient0 Tube0 Carrier1 Sheet0)
    (R12 : SliceCompatibleRetraction Ambient1 Tube1 Carrier2 Sheet1) where
  ambientCompare : Ambient0 → Ambient1
  carrierLift : Carrier1 → Tube1
  sheetMap : Sheet0 → Sheet1
  carrierAmbientCommutes : ∀ c,
    ambientCompare (R01.carrierEmbed c) =
      R12.tubeEmbed (carrierLift c)
  sheetAmbientCommutes : ∀ s,
    ambientCompare (R01.sheetEmbed s) =
      R12.sheetEmbed (sheetMap s)

namespace DirectedSliceChainAdapter

variable {Ambient0 Ambient1 Tube0 Carrier1 Sheet0 Tube1 Carrier2 Sheet1 : Type*}
variable {R01 : SliceCompatibleRetraction Ambient0 Tube0 Carrier1 Sheet0}
variable {R12 : SliceCompatibleRetraction Ambient1 Tube1 Carrier2 Sheet1}
variable (K : DirectedSliceChainAdapter R01 R12)

/-- Lift a first-stage carrier/sheet pullback into the second-stage
tube/sheet pullback. The proof uses both explicit ambient-commutation
conditions; without them this map is not available. -/
def liftCarrierSlice
    (p : carrierSheetPullback R01) : tubeSheetPullback R12 :=
  ⟨(K.carrierLift p.1.1, K.sheetMap p.1.2), by
    calc
      R12.tubeEmbed (K.carrierLift p.1.1) =
          K.ambientCompare (R01.carrierEmbed p.1.1) :=
        (K.carrierAmbientCommutes p.1.1).symm
      _ = K.ambientCompare (R01.sheetEmbed p.1.2) :=
        congrArg K.ambientCompare p.2
      _ = R12.sheetEmbed (K.sheetMap p.1.2) :=
        K.sheetAmbientCommutes p.1.2
  ⟩

/-- The staged map from the first tube/sheet pullback to the second
carrier/sheet pullback: first retract, then use the explicit intermediate
lift, then retract again. -/
def compositeSliceMap
    (p : tubeSheetPullback R01) : carrierSheetPullback R12 :=
  inducedCarrierSliceMap R12
    (K.liftCarrierSlice (inducedCarrierSliceMap R01 p))

/-- The carrier component of the staged slice map is the declared
composition of the two carrier projections with the intermediate lift. -/
@[simp] theorem compositeSliceMap_carrierProjection
    (p : tubeSheetPullback R01) :
    (K.compositeSliceMap p).1.1 =
      R12.projectCarrier (K.carrierLift (R01.projectCarrier p.1.1)) := by
  rfl

/-- The sheet component of the staged slice map is the declared
composition of the two sheet reparameterizations with the intermediate
sheet map. -/
@[simp] theorem compositeSliceMap_sheetReparameterization
    (p : tubeSheetPullback R01) :
    (K.compositeSliceMap p).1.2 =
      R12.sheetReparameterization
        (K.sheetMap (R01.sheetReparameterization p.1.2)) := by
  rfl

/-- The staged map lands in the second carrier/sheet pullback. This is the
explicit commuting witness for the full two-stage composition. -/
theorem compositeSliceMap_commutingWitness
    (p : tubeSheetPullback R01) :
    R12.carrierEmbed
        (R12.projectCarrier (K.carrierLift (R01.projectCarrier p.1.1))) =
      R12.sheetEmbed
        (R12.sheetReparameterization
          (K.sheetMap (R01.sheetReparameterization p.1.2))) := by
  exact inducedMap_commutingWitness R12
    (K.liftCarrierSlice (inducedCarrierSliceMap R01 p))

/-- The composite carrier projection on the original tube. -/
def compositeCarrierProjection (t : Tube0) : Carrier2 :=
  R12.projectCarrier (K.carrierLift (R01.projectCarrier t))

/-- The composite sheet reparameterization on the original sheet. -/
def compositeSheetReparameterization (s : Sheet0) : Sheet1 :=
  R12.sheetReparameterization (K.sheetMap (R01.sheetReparameterization s))

/-- A composite retraction needs an explicit lift of the second zero section
back into the first carrier. Component zero-section laws alone do not supply
this map. -/
structure CompositeSectionWitness where
  sectionLift : Carrier2 → Carrier1
  lift_secondZeroSection : ∀ c,
    K.carrierLift (sectionLift c) = R12.zeroSection c

/-- The composite zero section obtained from the supplied intermediate
section lift and the first retraction's zero section. -/
def compositeZeroSection
    (W : K.CompositeSectionWitness) (c : Carrier2) : Tube0 :=
  R01.zeroSection (W.sectionLift c)

/-- Under the explicit section-lift condition, the staged carrier projection
really is a retraction of the constructed composite zero section. -/
theorem compositeCarrierProjection_retracts
    (W : K.CompositeSectionWitness) (c : Carrier2) :
    K.compositeCarrierProjection (K.compositeZeroSection W c) = c := by
  change R12.projectCarrier
    (K.carrierLift
      (R01.projectCarrier (R01.zeroSection (W.sectionLift c)))) = c
  rw [R01.project_zero, W.lift_secondZeroSection, R12.project_zero]

/-- A direct route is a separate object. Its agreement with the staged route
must be supplied pointwise on an explicit admissible domain; it is not
inferred from stagewise slice preservation. -/
structure DirectPathCoherence where
  admissibleTube : Set Tube0
  admissibleSheet : Set Sheet0
  directCarrierProjection : Tube0 → Carrier2
  directSheetReparameterization : Sheet0 → Sheet1
  carrierPathAgreement : ∀ t, t ∈ admissibleTube →
    directCarrierProjection t = K.compositeCarrierProjection t
  sheetPathAgreement : ∀ s, s ∈ admissibleSheet →
    directSheetReparameterization s = K.compositeSheetReparameterization s

#print axioms liftCarrierSlice
#print axioms compositeSliceMap_commutingWitness
#print axioms compositeCarrierProjection_retracts

end DirectedSliceChainAdapter

end HsHVerification.RavelDirectedSliceChainComposition
