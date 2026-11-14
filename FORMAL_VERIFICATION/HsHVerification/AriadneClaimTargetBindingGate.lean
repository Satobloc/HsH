import Mathlib
import HsHVerification.AriadneArtifactTypeGate
import HsHVerification.AriadneSimulationProvenanceGate

/-!
Claim-target-scope binding gate, 2026-11-06.

This module is a proposed composition layer for the existing
AriadneArtifactTypeGate and AriadneSimulationProvenanceGate.

The current simulation gate checks that a human-observation record has
identity, protocol, acquisition, independent-acquisition, and disjoint-origin
flags. Its SimulationClaim is a claim *kind*, however, not a particular claim
instance. SimulationEvidence has no claim ID, target ID, or scope key. The
predicate therefore cannot itself distinguish an observation about the
intended target from an otherwise well-formed observation about another
target.

The current artifact and simulation gates are also separate modules. This
module supplies explicit projections into one common claim/target/scope key
and a partial composition relation requiring the projections to agree and
the primary-origin sets to be disjoint.

All projection keys and origin sets below are external audit inputs. Lean
checks the conditional composition rules; it does not authenticate the
bindings, infer them from a filename, parse source artifacts, establish
human behavior, or establish a model's actual execution. The natural-number
keys are opaque identifiers, not measurements or physical quantities.

This is a provenance/schema result, not a consciousness claim, physical
calculation, or human-subject experiment.
-/

namespace HsHVerification.AriadneClaimTargetBinding

abbrev OriginSet := Finset Nat

/-- Common typed address for one claim about one target within one declared
    scope. ScopeId is an opaque key, not a line number or time coordinate. -/
structure ClaimProjection where
  claimId : Nat
  targetId : Nat
  scopeId : Nat
  deriving DecidableEq, Repr

structure PrimaryArtifactBinding where
  artifact : HsHVerification.AriadneArtifactTypeGate.ArtifactEvidence
  claimKind : HsHVerification.AriadneArtifactTypeGate.ClaimKind
  projection : ClaimProjection
  primaryOrigins : OriginSet

structure IndependentObservationBinding where
  evidence : HsHVerification.AriadneSimulationProvenanceGate.SimulationEvidence
  projection : ClaimProjection
  primaryOrigins : OriginSet

/-- Project a source artifact into the common claim address only when its
    existing artifact-type gate accepts the selected claim kind. The address
    itself is supplied as an external audit input. -/
def projectPrimaryArtifact (p : PrimaryArtifactBinding) : Option ClaimProjection :=
  if HsHVerification.AriadneArtifactTypeGate.supportsBool p.artifact p.claimKind
  then some p.projection else none

/-- Project an independently acquired observation into the same address space
    only when the existing simulation-provenance gate accepts it. The address
    itself is supplied as an external audit input. -/
def projectIndependentObservation (o : IndependentObservationBinding) :
    Option ClaimProjection :=
  if HsHVerification.AriadneSimulationProvenanceGate.supportsBool
      o.evidence
      HsHVerification.AriadneSimulationProvenanceGate.SimulationClaim.independentValidation
  then some o.projection else none

theorem projectPrimaryArtifact_sound
    (p : PrimaryArtifactBinding) (claim : ClaimProjection)
    (h : projectPrimaryArtifact p = some claim) :
    HsHVerification.AriadneArtifactTypeGate.supports p.artifact p.claimKind := by
  unfold projectPrimaryArtifact at h
  cases hb : HsHVerification.AriadneArtifactTypeGate.supportsBool p.artifact p.claimKind with
  | false => simp [hb] at h
  | true =>
      exact (HsHVerification.AriadneArtifactTypeGate.supportsBool_correct
        p.artifact p.claimKind).mpr hb

theorem projectPrimaryArtifact_value
    (p : PrimaryArtifactBinding) (claim : ClaimProjection)
    (h : projectPrimaryArtifact p = some claim) :
    claim = p.projection := by
  unfold projectPrimaryArtifact at h
  cases hb : HsHVerification.AriadneArtifactTypeGate.supportsBool p.artifact p.claimKind with
  | false => simp [hb] at h
  | true =>
      have h' : some p.projection = some claim := by simpa [hb] using h
      exact (Option.some.inj h').symm

theorem projectIndependentObservation_sound
    (o : IndependentObservationBinding) (claim : ClaimProjection)
    (h : projectIndependentObservation o = some claim) :
    HsHVerification.AriadneSimulationProvenanceGate.supports
      o.evidence
      HsHVerification.AriadneSimulationProvenanceGate.SimulationClaim.independentValidation := by
  unfold projectIndependentObservation at h
  cases hb : HsHVerification.AriadneSimulationProvenanceGate.supportsBool
      o.evidence
      HsHVerification.AriadneSimulationProvenanceGate.SimulationClaim.independentValidation with
  | false => simp [hb] at h
  | true =>
      exact (HsHVerification.AriadneSimulationProvenanceGate.supportsBool_correct
        o.evidence
        HsHVerification.AriadneSimulationProvenanceGate.SimulationClaim.independentValidation).mpr hb

theorem projectIndependentObservation_value
    (o : IndependentObservationBinding) (claim : ClaimProjection)
    (h : projectIndependentObservation o = some claim) :
    claim = o.projection := by
  unfold projectIndependentObservation at h
  cases hb : HsHVerification.AriadneSimulationProvenanceGate.supportsBool
      o.evidence
      HsHVerification.AriadneSimulationProvenanceGate.SimulationClaim.independentValidation with
  | false => simp [hb] at h
  | true =>
      have h' : some o.projection = some claim := by simpa [hb] using h
      exact (Option.some.inj h').symm

/-- Composition succeeds only if both projections land on the same
    claim/target/scope address and the primary-origin sets are disjoint. -/
def composeIndependentValidation
    (p : PrimaryArtifactBinding) (o : IndependentObservationBinding) : Prop :=
  ∃ claim : ClaimProjection,
    projectPrimaryArtifact p = some claim ∧
    projectIndependentObservation o = some claim ∧
    Disjoint p.primaryOrigins o.primaryOrigins

theorem composition_requires_disjoint_origins
    (p : PrimaryArtifactBinding) (o : IndependentObservationBinding)
    (h : composeIndependentValidation p o) :
    Disjoint p.primaryOrigins o.primaryOrigins := by
  rcases h with ⟨_, _, _, hDisjoint⟩
  exact hDisjoint

theorem composition_component_equalities
    (p : PrimaryArtifactBinding) (o : IndependentObservationBinding)
    (h : composeIndependentValidation p o) :
    p.projection.claimId = o.projection.claimId ∧
    p.projection.targetId = o.projection.targetId ∧
    p.projection.scopeId = o.projection.scopeId ∧
    Disjoint p.primaryOrigins o.primaryOrigins := by
  rcases h with ⟨claim, hp, ho, hDisjoint⟩
  have hpValue := projectPrimaryArtifact_value p claim hp
  have hoValue := projectIndependentObservation_value o claim ho
  have hProjection : p.projection = o.projection := hpValue.symm.trans hoValue
  have hClaimId := congrArg (fun q : ClaimProjection => q.claimId) hProjection
  have hTargetId := congrArg (fun q : ClaimProjection => q.targetId) hProjection
  have hScopeId := congrArg (fun q : ClaimProjection => q.scopeId) hProjection
  exact ⟨hClaimId, hTargetId, hScopeId, hDisjoint⟩

theorem mismatched_projection_cannot_compose
    (p : PrimaryArtifactBinding) (o : IndependentObservationBinding)
    (primaryClaim observationClaim : ClaimProjection)
    (hp : projectPrimaryArtifact p = some primaryClaim)
    (ho : projectIndependentObservation o = some observationClaim)
    (hMismatch : primaryClaim ≠ observationClaim) :
    ¬ composeIndependentValidation p o := by
  intro hComposed
  rcases hComposed with ⟨claim, hpComposed, hoComposed, _⟩
  have hpValue := projectPrimaryArtifact_value p claim hpComposed
  have hoValue := projectIndependentObservation_value o claim hoComposed
  have hPrimary : primaryClaim = claim :=
    Option.some.inj (hp.symm.trans hpComposed)
  have hObservation : observationClaim = claim :=
    Option.some.inj (ho.symm.trans hoComposed)
  exact hMismatch (hPrimary.trans hObservation.symm)

/-- Diagnostic wrapper: the existing target-behavior predicate accepts no
    claim/target/scope argument. Attaching an external projection without a
    binding condition cannot change its result. -/
def existingTargetBehaviorEligibilityAt
    (e : HsHVerification.AriadneSimulationProvenanceGate.SimulationEvidence)
    (_claim : ClaimProjection) : Prop :=
  HsHVerification.AriadneSimulationProvenanceGate.supports
    e HsHVerification.AriadneSimulationProvenanceGate.SimulationClaim.targetBehavior

theorem existing_target_behavior_gate_is_projection_invariant
    (e : HsHVerification.AriadneSimulationProvenanceGate.SimulationEvidence)
    (left right : ClaimProjection) :
    existingTargetBehaviorEligibilityAt e left ↔
    existingTargetBehaviorEligibilityAt e right := Iff.rfl

#print axioms projectPrimaryArtifact_sound
#print axioms projectIndependentObservation_sound
#print axioms composition_requires_disjoint_origins
#print axioms composition_component_equalities
#print axioms mismatched_projection_cannot_compose
#print axioms existing_target_behavior_gate_is_projection_invariant

end HsHVerification.AriadneClaimTargetBinding
