import Mathlib
import HsHVerification.RavelCarrierSheetDimensionGate

/-!
# Ravel: composition of slice-compatible retractions

This module proves a conditional closure law for the existing
`SliceCompatibleRetraction` interface.

To compose
  Ambient <- Tube -> Mid
and
  Ambient <- Mid -> Carrier,
the intermediate ambient embeddings must agree, and the two stages must
use the same sheet parameter type with equal ambient sheet embeddings.
Both stages must already satisfy their own slice-preservation law.

If the sheet parameterizations differ, an explicit equivalence and a
commuting compatibility law are required; this module does not silently
identify them.

The results are abstract map algebra. They do not supply or validate a
physical worldtube, timesheet, Kerr section, medium response, or measured
readout. Lean checks only these formal statements.
-/

namespace HsHVerification.RavelNestedRetractionComposition

open HsHVerification.RavelCarrierSheetDimensionGate

universe u

variable {Ambient Tube Mid Carrier Sheet : Type*}

/-- Compose two slice-compatible retractions when the intermediate
ambient embeddings and sheet embeddings agree exactly.

The composite projection is R₂.projectCarrier ∘ R₁.projectCarrier;
the composite zero section is R₁.zeroSection ∘ R₂.zeroSection; and the
composite sheet reparameterization is R₂.sheetReparameterization ∘
R₁.sheetReparameterization. -/
def composeSliceCompatibleRetractions
    (R₁ : SliceCompatibleRetraction Ambient Tube Mid Sheet)
    (R₂ : SliceCompatibleRetraction Ambient Mid Carrier Sheet)
    (hTube : R₂.tubeEmbed = R₁.carrierEmbed)
    (hSheet : R₂.sheetEmbed = R₁.sheetEmbed) :
    SliceCompatibleRetraction Ambient Tube Carrier Sheet :=
  { tubeEmbed := R₁.tubeEmbed
    carrierEmbed := R₂.carrierEmbed
    sheetEmbed := R₁.sheetEmbed
    zeroSection := fun c => R₁.zeroSection (R₂.zeroSection c)
    projectCarrier := fun t => R₂.projectCarrier (R₁.projectCarrier t)
    sheetReparameterization := fun s =>
      R₂.sheetReparameterization (R₁.sheetReparameterization s)
    project_zero := by
      intro c
      rw [R₁.project_zero, R₂.project_zero]
    embed_zero := by
      intro c
      calc
        R₁.tubeEmbed (R₁.zeroSection (R₂.zeroSection c))
            = R₁.carrierEmbed (R₂.zeroSection c) := R₁.embed_zero _
        _ = R₂.tubeEmbed (R₂.zeroSection c) := by rw [hTube]
        _ = R₂.carrierEmbed c := R₂.embed_zero _
    preservesSlice := by
      intro t s h
      apply R₂.preservesSlice
      calc
        R₂.tubeEmbed (R₁.projectCarrier t)
            = R₁.carrierEmbed (R₁.projectCarrier t) := by rw [hTube]
        _ = R₁.sheetEmbed (R₁.sheetReparameterization s) :=
          R₁.preservesSlice t s h
        _ = R₂.sheetEmbed (R₁.sheetReparameterization s) := by rw [hSheet]
  }

/-- The composite carrier projection is exactly the ordered composition
of the two stage projections. -/
theorem composed_projectCarrier
    (R₁ : SliceCompatibleRetraction Ambient Tube Mid Sheet)
    (R₂ : SliceCompatibleRetraction Ambient Mid Carrier Sheet)
    (hTube : R₂.tubeEmbed = R₁.carrierEmbed)
    (hSheet : R₂.sheetEmbed = R₁.sheetEmbed) :
    (composeSliceCompatibleRetractions R₁ R₂ hTube hSheet).projectCarrier =
      R₂.projectCarrier ∘ R₁.projectCarrier := rfl

/-- The composite zero section reverses the order of the two projections. -/
theorem composed_zeroSection
    (R₁ : SliceCompatibleRetraction Ambient Tube Mid Sheet)
    (R₂ : SliceCompatibleRetraction Ambient Mid Carrier Sheet)
    (hTube : R₂.tubeEmbed = R₁.carrierEmbed)
    (hSheet : R₂.sheetEmbed = R₁.sheetEmbed) :
    (composeSliceCompatibleRetractions R₁ R₂ hTube hSheet).zeroSection =
      R₁.zeroSection ∘ R₂.zeroSection := rfl

/-- The sheet reparameterizations compose in the same order as the
carrier projections. -/
theorem composed_sheetReparameterization
    (R₁ : SliceCompatibleRetraction Ambient Tube Mid Sheet)
    (R₂ : SliceCompatibleRetraction Ambient Mid Carrier Sheet)
    (hTube : R₂.tubeEmbed = R₁.carrierEmbed)
    (hSheet : R₂.sheetEmbed = R₁.sheetEmbed) :
    (composeSliceCompatibleRetractions R₁ R₂ hTube hSheet).sheetReparameterization =
      R₂.sheetReparameterization ∘ R₁.sheetReparameterization := rfl

/-- Coordinates of the induced pullback map are the explicit composite
carrier projection and sheet reparameterization. -/
theorem composed_inducedMap_coordinates
    (R₁ : SliceCompatibleRetraction Ambient Tube Mid Sheet)
    (R₂ : SliceCompatibleRetraction Ambient Mid Carrier Sheet)
    (hTube : R₂.tubeEmbed = R₁.carrierEmbed)
    (hSheet : R₂.sheetEmbed = R₁.sheetEmbed)
    (p : tubeSheetPullback
      (composeSliceCompatibleRetractions R₁ R₂ hTube hSheet)) :
    (inducedCarrierSliceMap
      (composeSliceCompatibleRetractions R₁ R₂ hTube hSheet) p).1 =
        (R₂.projectCarrier (R₁.projectCarrier p.1.1),
         R₂.sheetReparameterization (R₁.sheetReparameterization p.1.2)) := rfl

/-- The composite induced map retains the ambient commuting witness.
This is a formal consequence of the two supplied slice-preservation
conditions and the two explicit compatibility equalities. -/
theorem composed_inducedMap_commutingWitness
    (R₁ : SliceCompatibleRetraction Ambient Tube Mid Sheet)
    (R₂ : SliceCompatibleRetraction Ambient Mid Carrier Sheet)
    (hTube : R₂.tubeEmbed = R₁.carrierEmbed)
    (hSheet : R₂.sheetEmbed = R₁.sheetEmbed)
    (p : tubeSheetPullback
      (composeSliceCompatibleRetractions R₁ R₂ hTube hSheet)) :
    R₂.carrierEmbed (R₂.projectCarrier (R₁.projectCarrier p.1.1)) =
      R₁.sheetEmbed
        (R₂.sheetReparameterization (R₁.sheetReparameterization p.1.2)) := by
  exact inducedMap_commutingWitness
    (composeSliceCompatibleRetractions R₁ R₂ hTube hSheet) p

/-- For a three-stage chain, the two parenthesizations have the same
carrier projection. The equalities state the exact intermediate-map
compatibility needed at each stage. -/
theorem nested_projectCarrier_associative
    {Mid₁ Mid₂ : Type*}
    (R₁ : SliceCompatibleRetraction Ambient Tube Mid₁ Sheet)
    (R₂ : SliceCompatibleRetraction Ambient Mid₁ Mid₂ Sheet)
    (R₃ : SliceCompatibleRetraction Ambient Mid₂ Carrier Sheet)
    (h₁₂ : R₂.tubeEmbed = R₁.carrierEmbed)
    (h₂₃ : R₃.tubeEmbed = R₂.carrierEmbed)
    (s₁₂ : R₂.sheetEmbed = R₁.sheetEmbed)
    (s₂₃ : R₃.sheetEmbed = R₂.sheetEmbed) :
    (composeSliceCompatibleRetractions
      (composeSliceCompatibleRetractions R₁ R₂ h₁₂ s₁₂)
      R₃ h₂₃ (s₂₃.trans s₁₂)).projectCarrier =
    (composeSliceCompatibleRetractions
      R₁
      (composeSliceCompatibleRetractions R₂ R₃ h₂₃ s₂₃)
      h₁₂ s₁₂).projectCarrier := by
  rfl

/-- The zero sections of a three-stage chain are associative. -/
theorem nested_zeroSection_associative
    {Mid₁ Mid₂ : Type*}
    (R₁ : SliceCompatibleRetraction Ambient Tube Mid₁ Sheet)
    (R₂ : SliceCompatibleRetraction Ambient Mid₁ Mid₂ Sheet)
    (R₃ : SliceCompatibleRetraction Ambient Mid₂ Carrier Sheet)
    (h₁₂ : R₂.tubeEmbed = R₁.carrierEmbed)
    (h₂₃ : R₃.tubeEmbed = R₂.carrierEmbed)
    (s₁₂ : R₂.sheetEmbed = R₁.sheetEmbed)
    (s₂₃ : R₃.sheetEmbed = R₂.sheetEmbed) :
    (composeSliceCompatibleRetractions
      (composeSliceCompatibleRetractions R₁ R₂ h₁₂ s₁₂)
      R₃ h₂₃ (s₂₃.trans s₁₂)).zeroSection =
    (composeSliceCompatibleRetractions
      R₁
      (composeSliceCompatibleRetractions R₂ R₃ h₂₃ s₂₃)
      h₁₂ s₁₂).zeroSection := by
  rfl

/-- The sheet reparameterization of a three-stage chain is associative. -/
theorem nested_sheetReparameterization_associative
    {Mid₁ Mid₂ : Type*}
    (R₁ : SliceCompatibleRetraction Ambient Tube Mid₁ Sheet)
    (R₂ : SliceCompatibleRetraction Ambient Mid₁ Mid₂ Sheet)
    (R₃ : SliceCompatibleRetraction Ambient Mid₂ Carrier Sheet)
    (h₁₂ : R₂.tubeEmbed = R₁.carrierEmbed)
    (h₂₃ : R₃.tubeEmbed = R₂.carrierEmbed)
    (s₁₂ : R₂.sheetEmbed = R₁.sheetEmbed)
    (s₂₃ : R₃.sheetEmbed = R₂.sheetEmbed) :
    (composeSliceCompatibleRetractions
      (composeSliceCompatibleRetractions R₁ R₂ h₁₂ s₁₂)
      R₃ h₂₃ (s₂₃.trans s₁₂)).sheetReparameterization =
    (composeSliceCompatibleRetractions
      R₁
      (composeSliceCompatibleRetractions R₂ R₃ h₂₃ s₂₃)
      h₁₂ s₁₂).sheetReparameterization := by
  rfl

/-- The full induced carrier/sheet pullback maps agree under the two
parenthesizations of a compatible three-stage chain. -/
theorem nested_inducedMap_associative
    {Mid₁ Mid₂ : Type*}
    (R₁ : SliceCompatibleRetraction Ambient Tube Mid₁ Sheet)
    (R₂ : SliceCompatibleRetraction Ambient Mid₁ Mid₂ Sheet)
    (R₃ : SliceCompatibleRetraction Ambient Mid₂ Carrier Sheet)
    (h₁₂ : R₂.tubeEmbed = R₁.carrierEmbed)
    (h₂₃ : R₃.tubeEmbed = R₂.carrierEmbed)
    (s₁₂ : R₂.sheetEmbed = R₁.sheetEmbed)
    (s₂₃ : R₃.sheetEmbed = R₂.sheetEmbed)
    (p : tubeSheetPullback
      (composeSliceCompatibleRetractions
        (composeSliceCompatibleRetractions R₁ R₂ h₁₂ s₁₂)
        R₃ h₂₃ (s₂₃.trans s₁₂))) :
    inducedCarrierSliceMap
      (composeSliceCompatibleRetractions
        (composeSliceCompatibleRetractions R₁ R₂ h₁₂ s₁₂)
        R₃ h₂₃ (s₂₃.trans s₁₂)) p =
    inducedCarrierSliceMap
      (composeSliceCompatibleRetractions
        R₁
        (composeSliceCompatibleRetractions R₂ R₃ h₂₃ s₂₃)
        h₁₂ s₁₂) p := by
  apply Subtype.ext
  rfl

#print axioms composed_projectCarrier
#print axioms composed_zeroSection
#print axioms composed_sheetReparameterization
#print axioms composed_inducedMap_coordinates
#print axioms composed_inducedMap_commutingWitness
#print axioms nested_projectCarrier_associative
#print axioms nested_zeroSection_associative
#print axioms nested_sheetReparameterization_associative
#print axioms nested_inducedMap_associative

end HsHVerification.RavelNestedRetractionComposition
