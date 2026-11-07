import Mathlib

namespace HsHVerification.EliasThreadingReceiptTransfer

/-!
Source: Satobloc/HSH_RESOURCES, info/WORKFLOW_THREADING_PROTOTYPE.md
(blob f87ff21918b6fa4804d090cdb9153aa0dd53d288) and
tools/workflow_threading_demo.py (blob ce313e46b1b85ae35028b46a4196d2a945b535d8).

The implementation's state_threshold_met checks receipt count, distinct worker
strings, and (when requested) the presence of both "success" and "failure".
The sample_thread configuration uses min_outputs = 4, min_workers = 3,
max_hours = 3.0, require_success_and_failure = true.

Observed transfer case: issue #1095 (publisher rejection comment #6518362158)
and issue #1096 (PUBLISHED/readback comment #6518404928) carry identical
13,214-character report content. The first supplied digest
5411533308abb865ed1fdd7a3e43997daae52878d6d7a055ad013b3703c00368 was rejected;
the unchanged content was resubmitted under #1096 with verified digest
777e694327d4d710e14b33ca562e857cb08c44edd214bad0a3308ff073b2976d. Exact
content equality between #1096 and the committed report file was independently
checked in the relay.

The producer key below denotes one submission-retry chain, not an authenticated
worker identity. The two attempts are not two independent workers. No actual
VACATE timestamp was found, so this module proves only the sample state-threshold
result; it does not evaluate the time-cap branch or assert that any worker
actually vacated a recurrence.

The chain-key grouping is provenance-only and is not the Python OutputReceipt.worker
field. The source-faithful diversity bound is therefore stated separately for two
arbitrary worker strings: one or two distinct workers are possible, but never the
sample threshold of three. The full sample threshold is false for any assignment
of those two worker identities because the output-count gate already fails.

These theorems check this formalized finite case, not the Python runtime,
publisher SHA-256 implementation, semantic independence, or a production policy.
-/

def publishedContentDigest : String :=
  "777e694327d4d710e14b33ca562e857cb08c44edd214bad0a3308ff073b2976d"

def issue1095DeclaredDigest : String :=
  "5411533308abb865ed1fdd7a3e43997daae52878d6d7a055ad013b3703c00368"

def issue1096DeclaredDigest : String := publishedContentDigest

def declaredDigestMatches : List Bool :=
  [issue1095DeclaredDigest == publishedContentDigest,
   issue1096DeclaredDigest == publishedContentDigest]

def receiptSeedVersions : List String :=
  [publishedContentDigest, publishedContentDigest]

def seedVersionGateAcceptsBoth : Bool :=
  receiptSeedVersions.all (fun version => version == publishedContentDigest)

def attemptIds : List Nat := [1095, 1096]

def submissionRetryChain : String := "same_s2_submission_retry_chain"

def receiptProducerKeys : List String :=
  [submissionRetryChain, submissionRetryChain]

def distinctProducerKeys : List String :=
  receiptProducerKeys.eraseDups

def receiptOutcomes : List String := ["failure", "success"]

def sampleMinOutputs : Nat := 4

def sampleMinWorkers : Nat := 3

def sampleBothOutcomesPresent : Bool :=
  receiptOutcomes.contains "success" && receiptOutcomes.contains "failure"

def sampleStateThresholdMet : Bool :=
  (receiptProducerKeys.length >= sampleMinOutputs) &&
  (distinctProducerKeys.length >= sampleMinWorkers) &&
  sampleBothOutcomesPresent

/-- For exactly two OutputReceipt records, the Python distinct_workers set
has either one or two members. The actual worker strings remain arbitrary. -/
def twoReceiptDistinctWorkerCount (workerA workerB : String) : Nat :=
  if workerA = workerB then 1 else 2

def sampleStateThresholdForTwoReceipts (workerA workerB : String) : Bool :=
  (2 >= sampleMinOutputs) &&
  (twoReceiptDistinctWorkerCount workerA workerB >= sampleMinWorkers) &&
  sampleBothOutcomesPresent

theorem two_receipt_worker_count_at_most_two (workerA workerB : String) :
    twoReceiptDistinctWorkerCount workerA workerB <= 2 := by
  unfold twoReceiptDistinctWorkerCount
  split <;> omega

theorem two_receipt_worker_diversity_gate_fails_for_any_ids (workerA workerB : String) :
    twoReceiptDistinctWorkerCount workerA workerB < sampleMinWorkers := by
  unfold twoReceiptDistinctWorkerCount sampleMinWorkers
  split <;> decide

theorem sample_state_threshold_fails_for_any_two_worker_ids (workerA workerB : String) :
    sampleStateThresholdForTwoReceipts workerA workerB = false := by
  simp [sampleStateThresholdForTwoReceipts, sampleMinOutputs]

theorem publisher_digest_sequence_is_mismatch_then_match :
    declaredDigestMatches = [false, true] := by decide

theorem same_seed_version_accepts_both_attempts :
    seedVersionGateAcceptsBoth = true := by decide

theorem issue_attempt_ids_are_distinct :
    attemptIds.Nodup := by decide

theorem two_attempts_recorded :
    receiptProducerKeys.length = 2 := by rfl

theorem one_retry_chain_key :
    distinctProducerKeys = [submissionRetryChain] := by decide

theorem both_outcomes_are_present :
    sampleBothOutcomesPresent = true := by decide

theorem sample_output_count_gate_fails :
    receiptProducerKeys.length < sampleMinOutputs := by decide

theorem sample_producer_diversity_gate_fails :
    distinctProducerKeys.length < sampleMinWorkers := by decide

theorem sample_state_threshold_not_met :
    sampleStateThresholdMet = false := by decide

#print axioms publisher_digest_sequence_is_mismatch_then_match
#print axioms same_seed_version_accepts_both_attempts
#print axioms issue_attempt_ids_are_distinct
#print axioms two_attempts_recorded
#print axioms one_retry_chain_key
#print axioms both_outcomes_are_present
#print axioms sample_output_count_gate_fails
#print axioms sample_producer_diversity_gate_fails
#print axioms sample_state_threshold_not_met
#print axioms two_receipt_worker_count_at_most_two
#print axioms two_receipt_worker_diversity_gate_fails_for_any_ids
#print axioms sample_state_threshold_fails_for_any_two_worker_ids

end HsHVerification.EliasThreadingReceiptTransfer


/-!
# Source-fidelity extension: the return gate does not require artifact diversity

The companion Python prototype's `state_threshold_met` counts receipt rows,
distinct worker strings, and (for the sample configuration) presence of both
success and failure. It does not inspect `OutputReceipt.artifact` or require
distinct artifact paths/content digests. The witness below uses only the four
consumer labels and the seed version already present in `sample_thread`;
the repeated artifact path is a synthetic software counterexample, not an
observed worker run or empirical result.

This proves a property of the encoded gate predicate only. It does not prove
semantic independence, actual output-content equality, authenticated worker
identity, or Python runtime equivalence.
-/
namespace HsHVerification.EliasThreadingArtifactDiversity

structure ReturnReceipt where
  worker : String
  artifact : String
  seedVersion : String
  outcome : String
  deriving DecidableEq, Repr

def distinctWorkers (rs : List ReturnReceipt) : List String :=
  (rs.map fun r => r.worker).eraseDups

def distinctArtifacts (rs : List ReturnReceipt) : List String :=
  (rs.map fun r => r.artifact).eraseDups

def distinctOutcomes (rs : List ReturnReceipt) : List String :=
  (rs.map fun r => r.outcome).eraseDups

/-- The sample configuration: four receipt rows, three workers, both outcomes. -/
def sampleReturnGate (rs : List ReturnReceipt) : Bool :=
  (rs.length >= 4) &&
  ((distinctWorkers rs).length >= 3) &&
  (distinctOutcomes rs).contains "success" &&
  (distinctOutcomes rs).contains "failure"

/-- Four sample consumers can satisfy the gate while naming one artifact path. -/
def sameArtifactWitness : List ReturnReceipt :=
  [ ⟨"Mercer", "case-shared.json", "demo-v1", "success"⟩
  , ⟨"Orson", "case-shared.json", "demo-v1", "failure"⟩
  , ⟨"Comptroller", "case-shared.json", "demo-v1", "success"⟩
  , ⟨"Aster", "case-shared.json", "demo-v1", "success"⟩
  ]

theorem same_artifact_witness_passes_gate :
    sampleReturnGate sameArtifactWitness = true := by
  decide

theorem same_artifact_witness_has_one_artifact :
    (distinctArtifacts sameArtifactWitness).length = 1 := by
  decide

theorem same_artifact_witness_preserves_seed_version :
    (sameArtifactWitness.map ReturnReceipt.seedVersion).eraseDups = ["demo-v1"] := by
  decide

/-- Existence counterexample: the return predicate does not entail artifact-path diversity. -/
theorem return_gate_can_pass_without_artifact_diversity :
    ∃ rs, sampleReturnGate rs = true ∧
      (distinctArtifacts rs).length = 1 := by
  exact ⟨sameArtifactWitness, by decide, by decide⟩

#print axioms same_artifact_witness_passes_gate
#print axioms same_artifact_witness_has_one_artifact
#print axioms same_artifact_witness_preserves_seed_version
#print axioms return_gate_can_pass_without_artifact_diversity

end HsHVerification.EliasThreadingArtifactDiversity


/-!
# Source-faithful temporal receipt gate counterexample

Source: Satobloc/HSH_RESOURCES/tools/workflow_threading_demo.py,
blob ce313e46b1b85ae35028b46a4196d2a945b535d8.

In the source, add_receipt checks only seed_version before appending.
state_threshold_met counts receipt rows, distinct worker strings, and the
required outcome labels. It does not compare OutputReceipt.timestamp with
vacate_started_at. The time-cap calculation uses vacate_started_at, but the
state-threshold path is independent of receipt chronology.

The finite witness below abstracts ISO timestamps as ordered minute values.
All four receipts are earlier than the vacate start, yet the source-shaped
seed-version gate accepts them and the source-shaped state threshold passes.
This is a software-predicate counterexample, not an observed worker run.
It does not establish source-to-model translation soundness or production
behavior.
-/

namespace HsHVerification.EliasThreadingTemporalGate

structure TemporalReceipt where
  worker : String
  artifact : String
  seedVersion : String
  outcome : String
  timestampMinute : Nat
  deriving DecidableEq, Repr

def sampleSeedVersion : String := "demo-v1"

def vacateStartMinute : Nat := 100

/-- Source-shaped add_receipt acceptance: seed-version equality only. -/
def sourceAddReceiptAccepts (r : TemporalReceipt) : Bool :=
  r.seedVersion == sampleSeedVersion

def allReceiptsAccepted (rs : List TemporalReceipt) : Bool :=
  rs.all sourceAddReceiptAccepts

/-- Explicit temporal relation omitted by the source return predicate. -/
def allReceiptsPredateVacate (rs : List TemporalReceipt) : Bool :=
  rs.all (fun r => r.timestampMinute < vacateStartMinute)

def distinctWorkers (rs : List TemporalReceipt) : List String :=
  (rs.map fun r => r.worker).eraseDups

def distinctOutcomes (rs : List TemporalReceipt) : List String :=
  (rs.map fun r => r.outcome).eraseDups

/-- Source-shaped sample state threshold: count, worker strings, outcomes. -/
def sourceSampleStateThreshold (rs : List TemporalReceipt) : Bool :=
  (rs.length >= 4) &&
  ((distinctWorkers rs).length >= 3) &&
  (distinctOutcomes rs).contains "success" &&
  (distinctOutcomes rs).contains "failure"

def preVacateWitness : List TemporalReceipt :=
  [ ⟨"Mercer", "case-001.json", "demo-v1", "success", 60⟩
  , ⟨"Orson", "case-002.json", "demo-v1", "failure", 70⟩
  , ⟨"Comptroller", "case-003.json", "demo-v1", "success", 80⟩
  , ⟨"Aster", "case-004.json", "demo-v1", "success", 90⟩
  ]

theorem pre_vacate_witness_all_seed_versions_accepted :
    allReceiptsAccepted preVacateWitness = true := by
  decide

theorem pre_vacate_witness_all_receipts_predate_vacate :
    allReceiptsPredateVacate preVacateWitness = true := by
  decide

theorem pre_vacate_witness_state_threshold_passes :
    sourceSampleStateThreshold preVacateWitness = true := by
  decide

/-- The encoded state threshold can trigger rejoin with only pre-vacate receipts. -/
theorem return_gate_can_pass_using_only_pre_vacate_receipts :
    allReceiptsAccepted preVacateWitness = true ∧
    allReceiptsPredateVacate preVacateWitness = true ∧
    sourceSampleStateThreshold preVacateWitness = true := by
  decide

#eval allReceiptsAccepted preVacateWitness
#eval allReceiptsPredateVacate preVacateWitness
#eval sourceSampleStateThreshold preVacateWitness

#print axioms pre_vacate_witness_all_seed_versions_accepted
#print axioms pre_vacate_witness_all_receipts_predate_vacate
#print axioms pre_vacate_witness_state_threshold_passes
#print axioms return_gate_can_pass_using_only_pre_vacate_receipts

end HsHVerification.EliasThreadingTemporalGate


/-!
# Threading lifecycle closure boundary

Source reviewed: HSH_RESOURCES `tools/workflow_threading_demo.py`
(blob `ce313e46b1b85ae35028b46a4196d2a945b535d8`) and
`info/WORKFLOW_THREADING_PROTOTYPE.md` (blob
`f87ff21918b6fa4804d090cdb9153aa0dd53d288`).

The Python prototype declares `rejoined` and `complete` as possible
state labels, but its available mutators are `vacate`, `add_receipt`,
and `mark_rejoin_if_ready`. The last mutator stops at
`rejoin-ready`; no `rejoin` or `synthesize` transition is implemented
in this file. The following finite model encodes only those available
state-changing operations. It is a source-derived assistant model, not
an executable equivalence proof for the Python program and not a claim
that an external controller cannot complete rejoining.
-/

namespace HsHVerification.EliasThreadingLifecycle

inductive AuthorState
  | active
  | vacated
  | rejoinReady
  | rejoined
  | blocked
  deriving DecidableEq, Repr

inductive ThreadStatus
  | seeded
  | propagating
  | rejoinReady
  | complete
  | blocked
  deriving DecidableEq, Repr

structure LifecycleState where
  author : AuthorState
  status : ThreadStatus
  deriving DecidableEq, Repr

inductive AvailableOperation
  | vacate
  | addReceipt
  | markRejoinIfReady
  deriving DecidableEq, Repr

def initialState : LifecycleState := ⟨.active, .seeded⟩

def step (s : LifecycleState) (op : AvailableOperation) (ready : Bool) : LifecycleState :=
  match op with
  | .vacate => ⟨.vacated, .propagating⟩
  | .addReceipt => s
  | .markRejoinIfReady =>
      if ready then ⟨.rejoinReady, .rejoinReady⟩ else s

inductive Reachable : LifecycleState → Prop
  | initial : Reachable initialState
  | vacate {s : LifecycleState} : Reachable s → Reachable (step s .vacate false)
  | addReceipt {s : LifecycleState} : Reachable s → Reachable (step s .addReceipt false)
  | markReady {s : LifecycleState} (ready : Bool) :
      Reachable s → Reachable (step s .markRejoinIfReady ready)

theorem rejoined_state_unreachable_under_available_operations :
    ∀ s, Reachable s → s.author ≠ .rejoined := by
  intro s h
  induction h with
  | initial => decide
  | vacate h ih => simp [step]
  | addReceipt h ih => simpa [step] using ih
  | markReady ready h ih =>
      cases ready <;> simp [step] <;> assumption

theorem complete_status_unreachable_under_available_operations :
    ∀ s, Reachable s → s.status ≠ .complete := by
  intro s h
  induction h with
  | initial => decide
  | vacate h ih => simp [step]
  | addReceipt h ih => simpa [step] using ih
  | markReady ready h ih =>
      cases ready <;> simp [step] <;> assumption

theorem ready_transition_is_not_rejoin_or_completion :
    step initialState .markRejoinIfReady true =
      ⟨.rejoinReady, .rejoinReady⟩ := by rfl

#eval step initialState .vacate false
#eval step initialState .markRejoinIfReady true

#print axioms rejoined_state_unreachable_under_available_operations
#print axioms complete_status_unreachable_under_available_operations
#print axioms ready_transition_is_not_rejoin_or_completion

end HsHVerification.EliasThreadingLifecycle


/-!
# Thread-scope binding: seed version alone does not bind a receipt to a thread

Source anchor: Satobloc/HSH_RESOURCES,
`tools/workflow_threading_demo.py`, blob
`ce313e46b1b85ae35028b46a4196d2a945b535d8`.

In the source, `OutputReceipt` has no thread identifier.
`ThreadState.add_receipt` checks only
`receipt.seed_version == self.seed.version` before appending; its
free-form metadata is not read by that method.

The model below gives a receipt an optional origin-thread field solely to
make the missing scope explicit. `sourceSeedVersionAccepts` abstracts the
observed seed-version-only predicate. `proposedThreadScopedAccepts` is a
design proposal, not the current Python implementation.

These theorems concern the encoded predicates only. They do not prove
Python-source equivalence, authenticate worker labels, or establish
production behavior.
-/
namespace HsHVerification.EliasThreadingReceiptScope

structure ReceiptScope where
  originThread : Option String
  seedVersion : String
  deriving DecidableEq, Repr

/-- Abstraction of the source's seed-version-only add_receipt check. -/
def sourceSeedVersionAccepts (targetSeedVersion : String) (r : ReceiptScope) : Bool :=
  r.seedVersion == targetSeedVersion

/-- Proposed additional scope check; not present in the source implementation. -/
def proposedThreadScopedAccepts (targetThreadId targetSeedVersion : String)
    (r : ReceiptScope) : Bool :=
  r.originThread == some targetThreadId && r.seedVersion == targetSeedVersion

def unscopedReceipt : ReceiptScope := ⟨none, "shared-v1"⟩
def foreignThreadReceipt : ReceiptScope := ⟨some "thread-A", "shared-v1"⟩
def matchingThreadReceipt : ReceiptScope := ⟨some "thread-B", "shared-v1"⟩

theorem source_gate_accepts_unscoped_matching_version :
    sourceSeedVersionAccepts "shared-v1" unscopedReceipt = true := by
  decide

theorem source_gate_accepts_foreign_thread_matching_version :
    sourceSeedVersionAccepts "shared-v1" foreignThreadReceipt = true := by
  decide

theorem source_gate_ignores_origin_thread
    (targetSeedVersion : String) (originA originB : Option String) :
    sourceSeedVersionAccepts targetSeedVersion
      ⟨originA, targetSeedVersion⟩ =
    sourceSeedVersionAccepts targetSeedVersion
      ⟨originB, targetSeedVersion⟩ := by
  rfl

theorem source_gate_collapses_missing_and_foreign_thread_scope :
    sourceSeedVersionAccepts "shared-v1" unscopedReceipt =
      sourceSeedVersionAccepts "shared-v1" foreignThreadReceipt := by
  decide

theorem proposed_gate_rejects_missing_thread_scope :
    proposedThreadScopedAccepts "thread-B" "shared-v1" unscopedReceipt = false := by
  decide

theorem proposed_gate_rejects_foreign_thread_scope :
    proposedThreadScopedAccepts "thread-B" "shared-v1" foreignThreadReceipt = false := by
  decide

theorem proposed_gate_accepts_matching_thread_scope :
    proposedThreadScopedAccepts "thread-B" "shared-v1" matchingThreadReceipt = true := by
  decide

#eval sourceSeedVersionAccepts "shared-v1" unscopedReceipt
#eval sourceSeedVersionAccepts "shared-v1" foreignThreadReceipt
#eval proposedThreadScopedAccepts "thread-B" "shared-v1" unscopedReceipt
#eval proposedThreadScopedAccepts "thread-B" "shared-v1" foreignThreadReceipt
#eval proposedThreadScopedAccepts "thread-B" "shared-v1" matchingThreadReceipt

#print axioms source_gate_accepts_unscoped_matching_version
#print axioms source_gate_accepts_foreign_thread_matching_version
#print axioms source_gate_ignores_origin_thread
#print axioms source_gate_collapses_missing_and_foreign_thread_scope
#print axioms proposed_gate_rejects_missing_thread_scope
#print axioms proposed_gate_rejects_foreign_thread_scope
#print axioms proposed_gate_accepts_matching_thread_scope

end HsHVerification.EliasThreadingReceiptScope
