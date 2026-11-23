import Mathlib

/-!
Elias Track A / Threading evidence-diversity refinement.

Source reviewed:
- the sandboxed workflow-threading prototype's OutputReceipt and
  ThreadState.state_threshold_met implementation;
- the companion Threading protocol.
Exact internal source identities are retained in the run receipt and are not
reproduced in this public formalization.

The source return gate reads receipt count, distinct worker strings, and
success/failure outcome labels. OutputReceipt also has free-form metadata,
but the return gate does not inspect it. The companion protocol names false
diversity, shared inputs/helpers, and exposure recording as failure concerns.

The annotations below are an explicit abstraction of possible input-class and
exposure-group metadata. They are NOT typed fields in the source Python
OutputReceipt, and the witness is a synthetic software-state counterexample,
not an observed worker run or empirical cognition result.

The result is narrow: the source-shaped return gate can pass while the
unconsumed input/exposure annotations each have cardinality one. Therefore
worker-label diversity and artifact diversity do not establish input or
exposure diversity. This does not say the generic rejoin threshold is wrong;
it says it must not be interpreted as an independent-evidence gate.

Lean checks only the formalized finite projection and witness. It does not
prove Python equivalence, validate metadata provenance, authenticate workers,
establish semantic independence, or establish any physical premise.
-/

namespace HsHVerification.EliasThreadingInputExposureDiversity

structure GateVisibleReceipt where
  worker : String
  outcome : String
  deriving DecidableEq, Repr

/-- Extra annotations model possible free-form metadata not consumed by the gate. -/
structure AnnotatedReceipt where
  visible : GateVisibleReceipt
  inputClass : String
  exposureGroup : String
  deriving DecidableEq, Repr

def gateInputProjection (rs : List AnnotatedReceipt) :
    List GateVisibleReceipt :=
  rs.map AnnotatedReceipt.visible

def distinctWorkerLabels (rs : List GateVisibleReceipt) : List String :=
  (rs.map GateVisibleReceipt.worker).eraseDups

/-- Source-shaped return predicate: four rows, three worker labels,
    and both outcome labels. -/
def sourceReturnGate (rs : List GateVisibleReceipt) : Bool :=
  (rs.length >= 4) &&
  ((distinctWorkerLabels rs).length >= 3) &&
  ((rs.map GateVisibleReceipt.outcome).contains "success") &&
  ((rs.map GateVisibleReceipt.outcome).contains "failure")

def distinctInputClasses (rs : List AnnotatedReceipt) : List String :=
  (rs.map AnnotatedReceipt.inputClass).eraseDups

def distinctExposureGroups (rs : List AnnotatedReceipt) : List String :=
  (rs.map AnnotatedReceipt.exposureGroup).eraseDups

def diversityProfile (rs : List AnnotatedReceipt) : Nat × Nat :=
  ((distinctInputClasses rs).length, (distinctExposureGroups rs).length)

/-- Four source-shaped rows from three worker labels, with one repeated label. -/
def sharedWorld : List AnnotatedReceipt :=
  [ ⟨⟨"Mercer", "success"⟩, "same-problem", "shared-summary"⟩
  , ⟨⟨"Orson", "failure"⟩, "same-problem", "shared-summary"⟩
  , ⟨⟨"Comptroller", "success"⟩, "same-problem", "shared-summary"⟩
  , ⟨⟨"Mercer", "success"⟩, "same-problem", "shared-summary"⟩
  ]

/-- Same gate-visible rows, but hypothetical distinct input/exposure annotations. -/
def separatedWorld : List AnnotatedReceipt :=
  [ ⟨⟨"Mercer", "success"⟩, "input-1", "exposure-1"⟩
  , ⟨⟨"Orson", "failure"⟩, "input-2", "exposure-2"⟩
  , ⟨⟨"Comptroller", "success"⟩, "input-3", "exposure-3"⟩
  , ⟨⟨"Mercer", "success"⟩, "input-4", "exposure-4"⟩
  ]

theorem same_gate_input_projection :
    gateInputProjection sharedWorld =
      gateInputProjection separatedWorld := by
  decide

theorem source_gate_passes_for_shared_input_and_exposure :
    sourceReturnGate (gateInputProjection sharedWorld) = true := by
  decide

theorem shared_world_has_one_input_class :
    (distinctInputClasses sharedWorld).length = 1 := by
  decide

theorem shared_world_has_one_exposure_group :
    (distinctExposureGroups sharedWorld).length = 1 := by
  decide

theorem separated_world_has_four_input_classes :
    (distinctInputClasses separatedWorld).length = 4 := by
  decide

theorem separated_world_has_four_exposure_groups :
    (distinctExposureGroups separatedWorld).length = 4 := by
  decide

theorem source_gate_passes_without_input_or_exposure_diversity :
    sourceReturnGate (gateInputProjection sharedWorld) = true ∧
      diversityProfile sharedWorld = (1, 1) := by
  exact ⟨source_gate_passes_for_shared_input_and_exposure, by decide⟩

theorem same_gate_result_can_coexist_with_different_diversity_profiles :
    sourceReturnGate (gateInputProjection sharedWorld) =
      sourceReturnGate (gateInputProjection separatedWorld) ∧
    diversityProfile sharedWorld = (1, 1) ∧
    diversityProfile separatedWorld = (4, 4) := by
  decide

/-- No function of the gate-consumed projection can recover both
    input-class and exposure-group counts for every annotation. -/
theorem no_gate_projection_function_recovers_diversity_profile :
    ¬ ∃ f : List GateVisibleReceipt → Nat × Nat,
        ∀ rs : List AnnotatedReceipt,
          f (gateInputProjection rs) = diversityProfile rs := by
  rintro ⟨f, hf⟩
  have hShared := hf sharedWorld
  have hSeparated := hf separatedWorld
  have hSame := congrArg f same_gate_input_projection
  rw [shared_world_has_one_input_class, shared_world_has_one_exposure_group] at hShared
  rw [separated_world_has_four_input_classes,
      separated_world_has_four_exposure_groups] at hSeparated
  have hPair : (1, 1) = (4, 4) := hShared.symm.trans (hSame.trans hSeparated)
  have hFirst := congrArg Prod.fst hPair
  omega

#eval sourceReturnGate (gateInputProjection sharedWorld)
#eval diversityProfile sharedWorld
#eval diversityProfile separatedWorld

#print axioms same_gate_input_projection
#print axioms source_gate_passes_for_shared_input_and_exposure
#print axioms shared_world_has_one_input_class
#print axioms shared_world_has_one_exposure_group
#print axioms separated_world_has_four_input_classes
#print axioms separated_world_has_four_exposure_groups
#print axioms source_gate_passes_without_input_or_exposure_diversity
#print axioms same_gate_result_can_coexist_with_different_diversity_profiles
#print axioms no_gate_projection_function_recovers_diversity_profile

end HsHVerification.EliasThreadingInputExposureDiversity
