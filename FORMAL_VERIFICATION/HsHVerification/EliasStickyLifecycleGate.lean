import Mathlib

/-!
# Elias Track A: candidate/promoted lifecycle for sticky experience

Primary implementation inspected:
Satobloc/HSH_RESOURCES/tools/workflow_switchboard_demo.py
Git blob 49988a769389b2baf264a27d596ba7c3ff822b36.

The source method `sticky(actor, kind, text)` validates a kind, hashes and
deduplicates the text, then appends directly to `state["experience"][actor]`.
It accepts no transfer receipt or lifecycle status. A whole-file reference
audit found no code path that reads the stored experience records into
`wake()`; the word `experience` in source routing selects a source category,
not a stored lesson.

Track B's independent Sable disposition (HsH blob
dcc916fe384c5c414883b5cb4b1291681436ca03) is:
KEEP candidate capture; MODIFY candidate/promoted states with provenance;
TEST independent second-context transfer; REJECT implicit promotion;
DEFER production integration.

This module formalizes a proposed contract only. It is not a patch to the
Python prototype, not a proof of Python/source equivalence, not an actual
second-context transfer experiment, and not authenticated producer,
reviewer, or exposure identity. String fields below are recorded references;
their presence does not authenticate their referents.
-/

namespace HsHVerification.EliasStickyLifecycleGate

inductive ExperienceKind where
  | skill
  | failureMode
  | tip
  | goal
  | intent
  | education
  deriving DecidableEq, Repr

structure Candidate where
  id : String
  actor : String
  kind : ExperienceKind
  text : String
  sourcePath : String
  sourceBlob : String
  sourceVersion : String
  originContext : String
  captureExposureManifest : String
  deriving DecidableEq, Repr

structure TransferReceipt where
  candidateId : String
  sourcePath : String
  sourceBlob : String
  sourceVersion : String
  originContext : String
  testContext : String
  expectedBehavior : String
  observedBehavior : String
  passed : Bool
  reviewerRef : String
  testExposureManifest : String
  deriving DecidableEq, Repr

def candidateWellFormed (c : Candidate) : Bool :=
  c.id != "" &&
  c.actor != "" &&
  c.text != "" &&
  c.sourcePath != "" &&
  c.sourceBlob != "" &&
  c.sourceVersion != "" &&
  c.originContext != "" &&
  c.captureExposureManifest != ""

/-- A receipt must bind to the captured candidate and source version,
    identify a genuinely distinct test context, and record the expected and
    observed behavior, outcome, reviewer reference, and test exposure. -/
def validTransferReceipt (c : Candidate) (r : TransferReceipt) : Bool :=
  candidateWellFormed c &&
  (r.candidateId == c.id) &&
  (r.sourcePath == c.sourcePath) &&
  (r.sourceBlob == c.sourceBlob) &&
  (r.sourceVersion == c.sourceVersion) &&
  (r.originContext == c.originContext) &&
  (r.testContext != c.originContext) &&
  (r.expectedBehavior != "") &&
  (r.observedBehavior != "") &&
  r.passed &&
  (r.reviewerRef != "") &&
  (r.testExposureManifest != "")

inductive ExperienceStage where
  | candidate
  | promoted
  deriving DecidableEq, Repr

structure ExperienceRecord where
  candidate : Candidate
  stage : ExperienceStage
  receipt : Option TransferReceipt
  deriving DecidableEq, Repr

/-- Capture is durable candidate intake, not promotion. -/
def capture (c : Candidate) : ExperienceRecord :=
  { candidate := c, stage := .candidate, receipt := none }

/-- Promotion is a separate transition. Already-promoted records cannot be
    re-promoted, and a candidate advances only with a valid bound receipt. -/
def promote (record : ExperienceRecord) (r : TransferReceipt) :
    Option ExperienceRecord :=
  match record.stage with
  | .candidate =>
      if validTransferReceipt record.candidate r then
        some { candidate := record.candidate
               stage := .promoted
               receipt := some r }
      else none
  | .promoted => none

/-- Wake-time application is restricted to promoted records carrying a
    receipt that still validates against the candidate's source/context. -/
def wakeApplies (record : ExperienceRecord) : Bool :=
  match record.stage, record.receipt with
  | .promoted, some r => validTransferReceipt record.candidate r
  | _, _ => false

theorem capture_is_candidate (c : Candidate) :
    (capture c).stage = .candidate := rfl

theorem capture_not_applied_at_wake (c : Candidate) :
    wakeApplies (capture c) = false := rfl

theorem invalid_receipt_cannot_promote
    (c : Candidate) (r : TransferReceipt)
    (h : validTransferReceipt c r = false) :
    promote (capture c) r = none := by
  simp [promote, capture, h]

theorem valid_receipt_promotes
    (c : Candidate) (r : TransferReceipt)
    (h : validTransferReceipt c r = true) :
    (promote (capture c) r).map (fun x => x.stage) =
      some .promoted := by
  simp [promote, capture, h]

theorem valid_receipt_wakes_only_after_promotion
    (c : Candidate) (r : TransferReceipt)
    (h : validTransferReceipt c r = true) :
    (promote (capture c) r).map wakeApplies = some true := by
  simp [promote, capture, wakeApplies, h]

theorem promotion_retains_receipt
    (c : Candidate) (r : TransferReceipt)
    (h : validTransferReceipt c r = true) :
    (promote (capture c) r).map (fun x => x.receipt) =
      some (some r) := by
  simp [promote, capture, h]

theorem same_context_receipt_rejected
    (c : Candidate) (r : TransferReceipt)
    (h : r.testContext = c.originContext) :
    validTransferReceipt c r = false := by
  simp [validTransferReceipt, h]

theorem failed_transfer_rejected
    (c : Candidate) (r : TransferReceipt)
    (h : r.passed = false) :
    validTransferReceipt c r = false := by
  simp [validTransferReceipt, h]

theorem mismatched_candidate_rejected
    (c : Candidate) (r : TransferReceipt)
    (h : (r.candidateId == c.id) = false) :
    validTransferReceipt c r = false := by
  simp [validTransferReceipt, h]

theorem mismatched_source_blob_rejected
    (c : Candidate) (r : TransferReceipt)
    (h : (r.sourceBlob == c.sourceBlob) = false) :
    validTransferReceipt c r = false := by
  simp [validTransferReceipt, h]

theorem missing_expected_behavior_rejected
    (c : Candidate) (r : TransferReceipt)
    (h : r.expectedBehavior = "") :
    validTransferReceipt c r = false := by
  simp [validTransferReceipt, h]

theorem missing_reviewer_reference_rejected
    (c : Candidate) (r : TransferReceipt)
    (h : r.reviewerRef = "") :
    validTransferReceipt c r = false := by
  simp [validTransferReceipt, h]

theorem missing_exposure_manifest_rejected
    (c : Candidate) (r : TransferReceipt)
    (h : r.testExposureManifest = "") :
    validTransferReceipt c r = false := by
  simp [validTransferReceipt, h]

theorem already_promoted_cannot_be_promoted_again
    (record : ExperienceRecord) (r : TransferReceipt)
    (h : record.stage = .promoted) :
    promote record r = none := by
  simp [promote, h]

theorem promoted_without_receipt_is_not_applied
    (c : Candidate) :
    wakeApplies
      { candidate := c, stage := .promoted, receipt := none } = false := rfl

/-!
## Adversarial witness: the receipt predicate accepts contradictory behavior

This is a synthetic software-state witness, not an observed transfer or worker
event. It tests the predicate above exactly as written. The current predicate
requires nonempty expected/observed strings and an externally supplied
passed flag, but does not relate the two strings. It also requires nonempty
reviewer/exposure references without checking reviewer independence or
exposure separation.
-/

def mismatchedBehaviorCandidate : Candidate :=
  { id := "candidate-01"
    actor := "Elias Kern"
    kind := .skill
    text := "Apply the captured skill at wake"
    sourcePath := "source/path"
    sourceBlob := "blob-01"
    sourceVersion := "version-01"
    originContext := "context-A"
    captureExposureManifest := "manifest-01" }

def mismatchedBehaviorReceipt : TransferReceipt :=
  { candidateId := mismatchedBehaviorCandidate.id
    sourcePath := mismatchedBehaviorCandidate.sourcePath
    sourceBlob := mismatchedBehaviorCandidate.sourceBlob
    sourceVersion := mismatchedBehaviorCandidate.sourceVersion
    originContext := mismatchedBehaviorCandidate.originContext
    testContext := "context-B"
    expectedBehavior := "candidate applied at wake"
    observedBehavior := "candidate not applied at wake"
    passed := true
    reviewerRef := mismatchedBehaviorCandidate.actor
    testExposureManifest := mismatchedBehaviorCandidate.captureExposureManifest }

theorem valid_receipt_can_record_opposite_behavior :
    validTransferReceipt mismatchedBehaviorCandidate mismatchedBehaviorReceipt = true ∧
    mismatchedBehaviorReceipt.expectedBehavior ≠
      mismatchedBehaviorReceipt.observedBehavior := by
  decide

theorem valid_receipt_can_reuse_actor_and_capture_exposure :
    validTransferReceipt mismatchedBehaviorCandidate mismatchedBehaviorReceipt = true ∧
    mismatchedBehaviorReceipt.reviewerRef = mismatchedBehaviorCandidate.actor ∧
    mismatchedBehaviorReceipt.testExposureManifest =
      mismatchedBehaviorCandidate.captureExposureManifest := by
  decide

theorem valid_receipt_only_requires_distinct_context_labels :
    validTransferReceipt mismatchedBehaviorCandidate mismatchedBehaviorReceipt = true ∧
    mismatchedBehaviorReceipt.testContext ≠
      mismatchedBehaviorCandidate.originContext := by
  decide

#eval validTransferReceipt mismatchedBehaviorCandidate mismatchedBehaviorReceipt
#eval mismatchedBehaviorReceipt.expectedBehavior ==
  mismatchedBehaviorReceipt.observedBehavior

#print axioms valid_receipt_can_record_opposite_behavior
#print axioms valid_receipt_can_reuse_actor_and_capture_exposure
#print axioms valid_receipt_only_requires_distinct_context_labels

#print axioms capture_not_applied_at_wake
#print axioms invalid_receipt_cannot_promote
#print axioms valid_receipt_promotes
#print axioms valid_receipt_wakes_only_after_promotion
#print axioms promotion_retains_receipt
#print axioms same_context_receipt_rejected
#print axioms failed_transfer_rejected
#print axioms mismatched_candidate_rejected
#print axioms mismatched_source_blob_rejected
#print axioms already_promoted_cannot_be_promoted_again

end HsHVerification.EliasStickyLifecycleGate
