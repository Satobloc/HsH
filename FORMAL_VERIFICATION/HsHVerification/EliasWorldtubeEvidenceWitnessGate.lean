import Mathlib
import HsHVerification.EliasWorldtubeClaimEvidenceGate

/-!
Elias Kern Track A | evidence-witness binding for the worldtube claim gate.

This is a source-to-formal workflow refinement, not a physical model and not
production integration. The preceding WorldtubeClaimEvidence record separates
many gate states, but its EvidenceStatus values are not themselves bound to
artifact locators, content digests, verification records, methods, or times.

This module adds a witness layer for the formalization gate only:
source content, source classification, source-to-formal trace, build run,
target module blob, and independent translation review. Geometry, response,
testability, and empirical witnesses remain a later extension.

The observed Ravel bundle records actual source/module/report/build references.
No independent translation-review witness is supplied. The author-name
metadata on the raw conversation capture is null; user-role message provenance
is not upgraded into authenticated author identity.

The statusOnlyPassExample is a deliberately abstract schema counterexample:
it shows that a status-only record can satisfy the old formalization predicate
without any witness bundle. It is not an observed Ravel state, physical
fixture, measurement, or empirical claim.

Lean checks these encoded contracts only. It does not authenticate GitHub,
recompute external hashes, validate the source-to-formal translation, or
establish any physical premise.
-/

namespace HsHVerification.EliasWorldtubeEvidenceWitnessGate

open HsHVerification.EliasWorldtubeClaimEvidenceGate

inductive DigestScheme where
  | sha256
  | gitBlobSha1
  | gitCommitSha1
  deriving DecidableEq, Repr

/-- A reference to an artifact plus the record and method by which it was checked.
    A digest is optional for non-content event records such as an Actions run. -/
structure ArtifactWitness where
  locator : String
  digest : Option String
  digestScheme : Option DigestScheme
  verificationRecord : String
  verificationMethod : String
  verifiedAt : String
  deriving DecidableEq, Repr

def artifactWitnessWellFormed (w : ArtifactWitness) : Prop :=
  w.locator ≠ "" ∧
  w.verificationRecord ≠ "" ∧
  w.verificationMethod ≠ "" ∧
  w.verifiedAt ≠ "" ∧
  (match w.digest, w.digestScheme with
   | none, none => True
   | some d, some _ => d ≠ ""
   | _, _ => False)

/-- A translation trace binds both endpoints and the mapping artifact.
    A single status bit or a reference to only the formal module is insufficient. -/
structure SourceFormalTraceWitness where
  sourceArtifact : ArtifactWitness
  formalArtifact : ArtifactWitness
  mappingArtifact : ArtifactWitness
  deriving DecidableEq, Repr

def sourceFormalTraceWitnessWellFormed
    (w : SourceFormalTraceWitness) : Prop :=
  artifactWitnessWellFormed w.sourceArtifact ∧
  artifactWitnessWellFormed w.formalArtifact ∧
  artifactWitnessWellFormed w.mappingArtifact

/-- Independent review must identify both reviewer and translation author.
    Different nonempty references are a necessary bookkeeping condition,
    not proof of intellectual independence or review quality. -/
structure IndependentReviewWitness where
  reviewArtifact : ArtifactWitness
  reviewerRef : String
  translationAuthorRef : String
  deriving DecidableEq, Repr

def independentReviewWitnessWellFormed
    (w : IndependentReviewWitness) : Prop :=
  artifactWitnessWellFormed w.reviewArtifact ∧
  w.reviewerRef ≠ "" ∧
  w.translationAuthorRef ≠ "" ∧
  w.reviewerRef ≠ w.translationAuthorRef

structure FormalizationWitnessBundle where
  sourceContent : Option ArtifactWitness
  sourceClassification : Option ArtifactWitness
  sourceToFormalTrace : Option SourceFormalTraceWitness
  buildRun : Option ArtifactWitness
  targetModuleBlob : Option ArtifactWitness
  independentTranslationReview : Option IndependentReviewWitness
  deriving DecidableEq, Repr

def presentArtifactWitnessWellFormed
    (w : Option ArtifactWitness) : Prop :=
  match w with
  | none => False
  | some artifact => artifactWitnessWellFormed artifact

def presentTraceWitnessWellFormed
    (w : Option SourceFormalTraceWitness) : Prop :=
  match w with
  | none => False
  | some trace => sourceFormalTraceWitnessWellFormed trace

def presentIndependentReviewWitnessWellFormed
    (w : Option IndependentReviewWitness) : Prop :=
  match w with
  | none => False
  | some review => independentReviewWitnessWellFormed review

/-- Stronger than the status-only gate: every formalization axis has a
    concrete witness, and independent translation review identifies a
    reviewer distinct from the translation author. -/
def formalizationWitnessGate
    (e : WorldtubeClaimEvidence)
    (w : FormalizationWitnessBundle) : Prop :=
  formalizationAuditGate e ∧
  presentArtifactWitnessWellFormed w.sourceContent ∧
  presentArtifactWitnessWellFormed w.sourceClassification ∧
  presentTraceWitnessWellFormed w.sourceToFormalTrace ∧
  presentArtifactWitnessWellFormed w.buildRun ∧
  presentArtifactWitnessWellFormed w.targetModuleBlob ∧
  presentIndependentReviewWitnessWellFormed w.independentTranslationReview

def rawRavelSourceArtifact : ArtifactWitness :=
  { locator :=
      "Library raw capture: Ravel [H(s)H] Syncmathcek — raw (2).json; user message UUIDs 3d0ad680-51db-4c79-ad4a-9bbacada24ef, b9805319-9d77-4b43-874a-5af50c0b6ef7, 496a15ea-0263-459d-b815-908f52155b90"
    digest := some "b3be177e6ac888dd27a902e25641f626285cd719faef4af624a81877c76830ba"
    digestScheme := some .sha256
    verificationRecord := "Elias report 2026-11-01T1436Z; raw Library capture inspected"
    verificationMethod := "raw-capture SHA-256 plus outer user-role and message-UUID inspection"
    verifiedAt := "2026-11-01T14:36:00Z" }

def ravelFormalModuleArtifact : ArtifactWitness :=
  { locator :=
      "FORMAL_VERIFICATION/HsHVerification/EliasWorldtubeClaimEvidenceGate.lean at PR #951 head faa51b91e1cb32801eccd90aac337062883b81c6"
    digest := some "a34720b07942f973000271a961bf6363d1cd55dd"
    digestScheme := some .gitBlobSha1
    verificationRecord := "PR #951; merge-ref run #41318147025; verification comment #6559610331"
    verificationMethod := "branch fetch/readback and exact target-module blob comparison against merge-ref build"
    verifiedAt := "2026-11-01T14:57:03Z" }

def ravelMappingReportArtifact : ArtifactWitness :=
  { locator :=
      "WORKSPACES/ELIAS_KERN/2026-11-01T1436Z_WORLD_TUBE_CLAIM_EVIDENCE_GATE.md"
    digest := some "db27183c5888bd97f9115ff03c40a9e5a3360900"
    digestScheme := some .gitBlobSha1
    verificationRecord := "existing publisher issue #1205 comment #6559592323"
    verificationMethod := "report file readback and issue-comment link verification"
    verifiedAt := "2026-11-01T14:57:03Z" }

def ravelBuildRunArtifact : ArtifactWitness :=
  { locator :=
      "GitHub Actions run #41318147025; job #124882766513; merge ref 3f69b2c0aa60728fd61b6837b05363f2b07c6cf8"
    digest := none
    digestScheme := none
    verificationRecord := "PR #951 comment #6559610331 and issue #1205 comment #6559609846"
    verificationMethod :=
      "Lean 4.34.0 / Lake 5.0.0; 8953 jobs; target module blob matched; theorem-specific axioms inspected; tests, lint, nanoda and separate automated axiom audit skipped"
    verifiedAt := "2026-11-01T14:57:03Z" }

def ravelSourceFormalTraceArtifact : SourceFormalTraceWitness :=
  { sourceArtifact := rawRavelSourceArtifact
    formalArtifact := ravelFormalModuleArtifact
    mappingArtifact := ravelMappingReportArtifact }

def observedRavelWitnessBundle : FormalizationWitnessBundle :=
  { sourceContent := some rawRavelSourceArtifact
    sourceClassification := some ravelFormalModuleArtifact
    sourceToFormalTrace := some ravelSourceFormalTraceArtifact
    buildRun := some ravelBuildRunArtifact
    targetModuleBlob := some ravelFormalModuleArtifact
    independentTranslationReview := none }

def emptyFormalizationWitnessBundle : FormalizationWitnessBundle :=
  { sourceContent := none
    sourceClassification := none
    sourceToFormalTrace := none
    buildRun := none
    targetModuleBlob := none
    independentTranslationReview := none }

/-- Abstract schema counterexample only: status assertions can be set to
    verified without any artifact-witness bundle. This is not the observed
    Ravel record and is not a physical example. -/
def statusOnlyPassExample : WorldtubeClaimEvidence :=
  { observedRavelWorldtube with
    sourceContent := .verified
    formalProof := .verified
    sourceClassTableRecorded := .verified
    sourceToFormalTraceRecorded := .verified
    independentTranslationReview := .verified
    buildScope := .mergeRefTargetModuleBlobMatch
    targetModuleBlobMatch := .verified }

theorem statusOnlyPassExample_formalization_gate :
    formalizationAuditGate statusOnlyPassExample := by
  simp [formalizationAuditGate, buildEvidenceAccepted,
    statusOnlyPassExample, observedRavelWorldtube]

theorem status_only_gate_can_pass_without_witnesses :
    formalizationAuditGate statusOnlyPassExample ∧
      ¬ formalizationWitnessGate statusOnlyPassExample
        emptyFormalizationWitnessBundle := by
  constructor
  · exact statusOnlyPassExample_formalization_gate
  · simp [formalizationWitnessGate, emptyFormalizationWitnessBundle,
      presentArtifactWitnessWellFormed, presentTraceWitnessWellFormed,
      presentIndependentReviewWitnessWellFormed]

theorem witness_gate_implies_status_gate
    (e : WorldtubeClaimEvidence) (w : FormalizationWitnessBundle) :
    formalizationWitnessGate e w → formalizationAuditGate e := by
  intro h
  exact h.1

theorem independent_review_witness_requires_distinct_refs
    (w : IndependentReviewWitness)
    (h : independentReviewWitnessWellFormed w) :
    w.reviewerRef ≠ w.translationAuthorRef := by
  rcases h with ⟨_, _, _, hDistinct⟩
  exact hDistinct

theorem observedRavel_source_and_build_witnesses_well_formed :
    presentArtifactWitnessWellFormed observedRavelWitnessBundle.sourceContent ∧
    presentArtifactWitnessWellFormed observedRavelWitnessBundle.sourceClassification ∧
    presentTraceWitnessWellFormed observedRavelWitnessBundle.sourceToFormalTrace ∧
    presentArtifactWitnessWellFormed observedRavelWitnessBundle.buildRun ∧
    presentArtifactWitnessWellFormed observedRavelWitnessBundle.targetModuleBlob := by
  simp [presentArtifactWitnessWellFormed, presentTraceWitnessWellFormed,
    observedRavelWitnessBundle, rawRavelSourceArtifact,
    ravelFormalModuleArtifact, ravelMappingReportArtifact,
    ravelBuildRunArtifact, ravelSourceFormalTraceArtifact,
    artifactWitnessWellFormed, sourceFormalTraceWitnessWellFormed]

theorem observedRavel_independent_translation_review_witness_missing :
    observedRavelWitnessBundle.independentTranslationReview = none := rfl

theorem observedRavel_witness_gate_not_passed :
    ¬ formalizationWitnessGate observedRavelWorldtube observedRavelWitnessBundle := by
  intro h
  exact observedRavel_formalization_audit_not_passed h.1

#eval observedRavelWitnessBundle.sourceContent.isSome
#eval observedRavelWitnessBundle.sourceToFormalTrace.isSome
#eval observedRavelWitnessBundle.independentTranslationReview.isSome

#print axioms statusOnlyPassExample_formalization_gate
#print axioms status_only_gate_can_pass_without_witnesses
#print axioms witness_gate_implies_status_gate
#print axioms independent_review_witness_requires_distinct_refs
#print axioms observedRavel_source_and_build_witnesses_well_formed
#print axioms observedRavel_independent_translation_review_witness_missing
#print axioms observedRavel_witness_gate_not_passed

end HsHVerification.EliasWorldtubeEvidenceWitnessGate
