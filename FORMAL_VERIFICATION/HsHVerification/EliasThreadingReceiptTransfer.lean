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
