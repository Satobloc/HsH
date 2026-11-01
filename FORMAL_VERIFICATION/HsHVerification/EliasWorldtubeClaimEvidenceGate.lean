import Mathlib
import HsHVerification.EliasReceiptEvidenceAxes

/-!
Elias Kern Track A, 2026-11-01.

PROPOSAL: extend the existing four-axis receipt model with a claim-level
formalization/empirical-evidence separation. This is a workflow contract,
not a new physical model or production rule.

Observed case: Ravel PR #1133, current head
30778c7fe7b1a45384d3bbceedd83d68a2be17c8. Actions run #41312751585
successfully built merge ref f8a2297acbd05721a6b64293f4eed57a6590c400.
The RavelCarrierSheetDimensionGate module blob
69c15e6dd9c7e4cb067e0706997f0b3a770b9ec4 matches between branch and
merge ref. The root aggregator blobs differ because the merge ref includes
base-branch changes; the full root target nevertheless built successfully.
The run had 8,949 successful Lake jobs, zero sorryAx/admit occurrences,
and theorem-specific axiom output. Tests, lint, nanoda, and the separate
automated axiom-audit action were skipped. This is a merge-ref build with
target-module-blob match, not a standalone exact-head build.

The source-to-formal trace is recorded in Ravel's geometry-fidelity report
and PR #1133 source manifest. Independent translation review is not recorded:
PR #1133 is draft/open and has no pull-request review records. The current
Ravel report says no physical calculation, fit, prediction, or measurement;
the helion holdout remains not scoreable pending the missing response map,
covariance, and normalization. The existing issue #1202 publisher artifact
was read back exactly against its issue payload; the additive CI/source
comment #6556057573 was also read back. No authenticated historical Ravel
ChatGPT thread or cross-thread delivery is claimed.

Statuses are observations about these repository artifacts, not assertions
that the source-to-formal translation is sound or that any physical premise
is true. No measured-system data, uncertainty budget, or holdout is invented.
-/

namespace HsHVerification.EliasWorldtubeClaimEvidenceGate

open HsHVerification.EliasReceiptEvidenceAxes

inductive BuildScope where
  | exactHead
  | mergeRefTargetModuleBlobMatch
  | unknown
  deriving DecidableEq, Repr

/-- The existing receipt axes are retained; claim-specific evidence is added
    without conflating source trace, translation review, compilation, and
    physical validation. -/
structure WorldtubeClaimEvidence extends ReceiptEvidenceAxes where
  sourceToFormalTraceRecorded : EvidenceStatus
  independentTranslationReview : EvidenceStatus
  buildScope : BuildScope
  targetModuleBlobMatch : EvidenceStatus
  measuredSystemAndDataset : EvidenceStatus
  measurementProvenance : EvidenceStatus
  unitsAndCalibration : EvidenceStatus
  uncertaintyBudget : EvidenceStatus
  predictionFitSeparation : EvidenceStatus
  heldOutPrediction : EvidenceStatus
  independentEmpiricalReview : EvidenceStatus
  deriving DecidableEq, Repr

/-- A strict merge-ref build is admissible only when the target module blob
    is shown to match the branch. The scope remains visible in the record. -/
def buildEvidenceAccepted (e : WorldtubeClaimEvidence) : Prop :=
  e.buildScope = .exactHead ∨
    (e.buildScope = .mergeRefTargetModuleBlobMatch ∧
      e.targetModuleBlobMatch = .verified)

/-- Source recovery, an explicit source-to-formal trace, independent review
    of that translation, and an observed Lean build are separate requirements. -/
def formalizationAuditGate (e : WorldtubeClaimEvidence) : Prop :=
  e.sourceContent = .verified ∧
  e.sourceToFormalTraceRecorded = .verified ∧
  e.independentTranslationReview = .verified ∧
  e.formalProof = .verified ∧
  buildEvidenceAccepted e

/-- Physical validation requires an actual identified system and dataset,
    provenance, units/calibration, uncertainty, prediction-versus-fit
    separation, a genuine holdout, and independent empirical review. -/
def empiricalValidationGate (e : WorldtubeClaimEvidence) : Prop :=
  e.measuredSystemAndDataset = .verified ∧
  e.measurementProvenance = .verified ∧
  e.unitsAndCalibration = .verified ∧
  e.uncertaintyBudget = .verified ∧
  e.predictionFitSeparation = .verified ∧
  e.heldOutPrediction = .verified ∧
  e.independentEmpiricalReview = .verified

/-- A full research claim needs both formal-translation audit and empirical
    validation. Neither gate substitutes for the other. -/
def fullClaimGate (e : WorldtubeClaimEvidence) : Prop :=
  formalizationAuditGate e ∧ empiricalValidationGate e

def publicationArtifactGate (e : WorldtubeClaimEvidence) : Prop :=
  e.publisherReadback = .verified

def endToEndDeliveryGate (e : WorldtubeClaimEvidence) : Prop :=
  publicationArtifactGate e ∧ e.historicalChatDelivery = .verified

/-- Source-grounded status vector for the current Ravel worldtube branch.
    "notChecked" is not "failed"; it records evidence that is still absent. -/
def observedRavelWorldtube : WorldtubeClaimEvidence :=
  { sourceContent := .verified
    formalProof := .verified
    publisherReadback := .verified
    historicalChatDelivery := .unavailable
    sourceToFormalTraceRecorded := .verified
    independentTranslationReview := .notChecked
    buildScope := .mergeRefTargetModuleBlobMatch
    targetModuleBlobMatch := .verified
    measuredSystemAndDataset := .notChecked
    measurementProvenance := .notChecked
    unitsAndCalibration := .notChecked
    uncertaintyBudget := .notChecked
    predictionFitSeparation := .notChecked
    heldOutPrediction := .notChecked
    independentEmpiricalReview := .notChecked }

theorem observedRavel_formal_build_verified :
    observedRavelWorldtube.formalProof = .verified := rfl

theorem observedRavel_translation_trace_recorded :
    observedRavelWorldtube.sourceToFormalTraceRecorded = .verified := rfl

theorem observedRavel_translation_review_not_checked :
    observedRavelWorldtube.independentTranslationReview = .notChecked := rfl

theorem observedRavel_merge_ref_target_blob_matched :
    observedRavelWorldtube.buildScope = .mergeRefTargetModuleBlobMatch ∧
      observedRavelWorldtube.targetModuleBlobMatch = .verified := by
  constructor <;> rfl

theorem observedRavel_formal_build_does_not_certify_translation :
    observedRavelWorldtube.formalProof = .verified ∧
      observedRavelWorldtube.independentTranslationReview = .notChecked :=
  ⟨rfl, rfl⟩

theorem observedRavel_formalization_gate_not_passed :
    ¬ formalizationAuditGate observedRavelWorldtube := by
  simp [formalizationAuditGate, buildEvidenceAccepted, observedRavelWorldtube]

theorem observedRavel_empirical_gate_not_passed :
    ¬ empiricalValidationGate observedRavelWorldtube := by
  simp [empiricalValidationGate, observedRavelWorldtube]

theorem observedRavel_full_claim_gate_not_passed :
    ¬ fullClaimGate observedRavelWorldtube := by
  simp [fullClaimGate, formalizationAuditGate, empiricalValidationGate,
    buildEvidenceAccepted, observedRavelWorldtube]

theorem observedRavel_publication_readback_verified :
    publicationArtifactGate observedRavelWorldtube := by
  rfl

theorem observedRavel_publication_does_not_imply_empirical_validation :
    publicationArtifactGate observedRavelWorldtube ∧
      ¬ empiricalValidationGate observedRavelWorldtube :=
  ⟨observedRavel_publication_readback_verified,
    observedRavel_empirical_gate_not_passed⟩

theorem observedRavel_chat_delivery_unavailable :
    observedRavelWorldtube.historicalChatDelivery = .unavailable := rfl

theorem observedRavel_end_to_end_delivery_not_verified :
    ¬ endToEndDeliveryGate observedRavelWorldtube := by
  simp [endToEndDeliveryGate, publicationArtifactGate, observedRavelWorldtube]

#print axioms observedRavel_formal_build_verified
#print axioms observedRavel_translation_trace_recorded
#print axioms observedRavel_translation_review_not_checked
#print axioms observedRavel_merge_ref_target_blob_matched
#print axioms observedRavel_formal_build_does_not_certify_translation
#print axioms observedRavel_formalization_gate_not_passed
#print axioms observedRavel_empirical_gate_not_passed
#print axioms observedRavel_full_claim_gate_not_passed
#print axioms observedRavel_publication_readback_verified
#print axioms observedRavel_publication_does_not_imply_empirical_validation
#print axioms observedRavel_chat_delivery_unavailable
#print axioms observedRavel_end_to_end_delivery_not_verified

end HsHVerification.EliasWorldtubeClaimEvidenceGate
