import Mathlib
import HsHVerification.AriadneClaimTargetBindingGate
import HsHVerification.AriadneClaimScopedLineage

/-!
Source-bound claim/target/scope gate, 2026-11-08.

This is a source-lineage schema layer, not a P2 physical-independence
certificate. It addresses two gaps found in the existing composition design:

1. target-behavior eligibility previously ignored the supplied
   claim/target/scope projection;
2. bare Finset disjointness permits the empty/empty case, so it does not by
   itself witness two nonempty primary-origin sets.

A ClaimAddressAttestation carries an externally audited source reference,
locator, extractor version, claim/target/scope projection, and attestation flag.
Lean checks completeness and internal address agreement only. It does not
authenticate source bytes, validate the extraction, or establish that an
external attestation is true.

The independent-validation structure reuses the existing artifact-type,
simulation-provenance, and nonempty/disjoint-origin contracts. It does not
replace the wider P2 independence_vector, acquisition/calibration/analysis
independence, covariance, holdout-access audit, or independent replication.
-/ 

namespace HsHVerification.AriadneSourceBoundClaimGate

abbrev ClaimProjection :=
  HsHVerification.AriadneClaimTargetBinding.ClaimProjection

structure ClaimAddressAttestation where
  sourceBlobRef : String
  sourceLocator : String
  extractorVersion : String
  projection : ClaimProjection
  attested : Bool
  deriving Repr

/-- A complete external address attestation has a nonempty source reference,
    locator, extractor version, and an affirmative audit flag. -/
def completeClaimAddressAttestation (w : ClaimAddressAttestation) : Prop :=
  w.sourceBlobRef ≠ "" ∧
  w.sourceLocator ≠ "" ∧
  w.extractorVersion ≠ "" ∧
  w.attested = true

abbrev SimulationEvidence :=
  HsHVerification.AriadneSimulationProvenanceGate.SimulationEvidence

/-- Target-behavior evidence is usable for a requested claim only when both
    the target-claim source and the observation source carry complete,
    matching claim/target/scope addresses. -/
structure SourceBoundTargetBehavior where
  evidence : SimulationEvidence
  targetClaim : ClaimAddressAttestation
  observation : ClaimAddressAttestation

def targetBehaviorEligibleAt
    (x : SourceBoundTargetBehavior) (requested : ClaimProjection) : Prop :=
  HsHVerification.AriadneSimulationProvenanceGate.supports
      x.evidence
      HsHVerification.AriadneSimulationProvenanceGate.SimulationClaim.targetBehavior ∧
  completeClaimAddressAttestation x.targetClaim ∧
  completeClaimAddressAttestation x.observation ∧
  x.targetClaim.projection = requested ∧
  x.observation.projection = requested

theorem target_behavior_requires_shared_claim_target_scope
    (x : SourceBoundTargetBehavior) (requested : ClaimProjection)
    (h : targetBehaviorEligibleAt x requested) :
    x.targetClaim.projection = x.observation.projection := by
  rcases h with ⟨_, _, _, hTarget, hObservation⟩
  exact hTarget.trans hObservation.symm

/-- Once an observation is bound to one requested address, it cannot be
    reused as target-behavior evidence for a different claim, target, or scope. -/
theorem mismatched_claim_target_scope_cannot_pass
    (x : SourceBoundTargetBehavior)
    (requested other : ClaimProjection)
    (hMismatch : requested ≠ other)
    (hRequested : targetBehaviorEligibleAt x requested) :
    ¬ targetBehaviorEligibleAt x other := by
  intro hOther
  rcases hRequested with ⟨_, _, _, hTarget, _⟩
  rcases hOther with ⟨_, _, _, hTargetOther, _⟩
  exact hMismatch (hTarget.symm.trans hTargetOther)

abbrev PrimaryArtifactBinding :=
  HsHVerification.AriadneClaimTargetBinding.PrimaryArtifactBinding

abbrev IndependentObservationBinding :=
  HsHVerification.AriadneClaimTargetBinding.IndependentObservationBinding

/-- Stronger composition record. In addition to the existing artifact and
    observation gates, it requires source-address attestations tied to each
    binding's projection and an explicit nonempty/disjoint primary-origin
    witness. -/
structure SourceBoundIndependentValidation where
  primary : PrimaryArtifactBinding
  observation : IndependentObservationBinding
  claim : ClaimProjection
  primaryAddress : ClaimAddressAttestation
  observationAddress : ClaimAddressAttestation
  primaryAddressMatches :
    primaryAddress.projection = primary.projection
  observationAddressMatches :
    observationAddress.projection = observation.projection
  primaryAddressComplete :
    completeClaimAddressAttestation primaryAddress
  observationAddressComplete :
    completeClaimAddressAttestation observationAddress
  primaryAccepted :
    HsHVerification.AriadneClaimTargetBinding.projectPrimaryArtifact
      primary = some claim
  observationAccepted :
    HsHVerification.AriadneClaimTargetBinding.projectIndependentObservation
      observation = some claim
  originWitness :
    HsHVerification.AriadneClaimScopedLineage.DisjointPrimaryOrigins
      primary.primaryOrigins observation.primaryOrigins

theorem independent_validation_addresses_bind_to_same_claim
    (x : SourceBoundIndependentValidation) :
    x.primaryAddress.projection = x.claim ∧
    x.observationAddress.projection = x.claim ∧
    x.primaryAddress.projection = x.observationAddress.projection := by
  have hp :=
    HsHVerification.AriadneClaimTargetBinding.projectPrimaryArtifact_value
      x.primary x.claim x.primaryAccepted
  have ho :=
    HsHVerification.AriadneClaimTargetBinding.projectIndependentObservation_value
      x.observation x.claim x.observationAccepted
  have hp' : x.primaryAddress.projection = x.claim :=
    x.primaryAddressMatches.trans hp.symm
  have ho' : x.observationAddress.projection = x.claim :=
    x.observationAddressMatches.trans ho.symm
  exact ⟨hp', ho', hp'.trans ho'.symm⟩

theorem independent_validation_requires_nonempty_disjoint_origins
    (x : SourceBoundIndependentValidation) :
    x.primary.primaryOrigins.Nonempty ∧
    x.observation.primaryOrigins.Nonempty ∧
    HsHVerification.AriadneClaimScopedLineage.DisjointOrigins
      x.primary.primaryOrigins x.observation.primaryOrigins := by
  exact
    HsHVerification.AriadneClaimScopedLineage.disjoint_origin_witnesses_are_nonempty_and_disjoint
      x.originWitness

theorem independent_validation_requires_complete_source_addresses
    (x : SourceBoundIndependentValidation) :
    completeClaimAddressAttestation x.primaryAddress ∧
    completeClaimAddressAttestation x.observationAddress := by
  exact ⟨x.primaryAddressComplete, x.observationAddressComplete⟩

#print axioms target_behavior_requires_shared_claim_target_scope
#print axioms mismatched_claim_target_scope_cannot_pass
#print axioms independent_validation_addresses_bind_to_same_claim
#print axioms independent_validation_requires_nonempty_disjoint_origins
#print axioms independent_validation_requires_complete_source_addresses

end HsHVerification.AriadneSourceBoundClaimGate
