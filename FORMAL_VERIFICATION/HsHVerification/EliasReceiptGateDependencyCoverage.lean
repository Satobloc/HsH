import Mathlib

/-!
# Elias Track A: receipt-gate dependency coverage

Primary source: an internal sandbox workflow-switchboard prototype's
`receipt_gate` node and `self_test` behavior, reviewed 2026-11-09.
The exact private source locator is intentionally not reproduced here.

The Python self-test checks only that the verifier and restore job names occur
in the emitted spawn list. This finite model represents that source-shaped
existence predicate and contrasts it with a proposed stricter contract that
also checks uniqueness, gated relation, the explicit dependency edge, and
the durable-receipt OR failure-packet rewrite.

The witnesses are synthetic software-state counterexamples, not observed
lease restorations, worker events, production behavior, or physical evidence.
Lean proves only these encoded propositions; it does not prove Python-to-Lean
translation soundness or that the prototype executes its planned jobs.
-/

namespace HsHVerification.EliasReceiptGateDependencyCoverage

structure SpawnJob where
  job : String
  relation : String
  dependsOn : Option String
  deriving DecidableEq, Repr

structure ReceiptGatePlan where
  spawn : List SpawnJob
  rewrite : String
  deriving DecidableEq, Repr

def verifierJob : String := "verify_durable_output_receipt"
def restoreJob : String := "restore_displaced_lease"
def expectedRewrite : String :=
  "restore only after durable output receipt OR explicit failure packet"

def sourceShapedSelfTest (p : ReceiptGatePlan) : Bool :=
  p.spawn.any (fun j => j.job == verifierJob) &&
  p.spawn.any (fun j => j.job == restoreJob)

def countJob (jobs : List SpawnJob) (name : String) : Nat :=
  (jobs.filter (fun j => j.job == name)).length

/-- Proposed QA contract, not an implemented POC or production rule. -/
def proposedReceiptGateContract (p : ReceiptGatePlan) : Bool :=
  countJob p.spawn verifierJob == 1 &&
  countJob p.spawn restoreJob == 1 &&
  p.spawn.any (fun j => j.job == verifierJob && j.relation == "gated") &&
  p.spawn.any (fun j =>
    j.job == restoreJob &&
    j.relation == "gated" &&
    j.dependsOn == some verifierJob) &&
  p.rewrite == expectedRewrite

def sourcePlan : ReceiptGatePlan :=
  { spawn :=
      [ ⟨verifierJob, "gated", none⟩
      , ⟨restoreJob, "gated", some verifierJob⟩
      ]
    rewrite := expectedRewrite }

def missingDependencyWitness : ReceiptGatePlan :=
  { sourcePlan with
    spawn :=
      [ ⟨verifierJob, "gated", none⟩
      , ⟨restoreJob, "gated", none⟩
      ] }

def wrongDependencyWitness : ReceiptGatePlan :=
  { sourcePlan with
    spawn :=
      [ ⟨verifierJob, "gated", none⟩
      , ⟨restoreJob, "gated", some "unrelated_job"⟩
      ] }

def ungatedRestoreWitness : ReceiptGatePlan :=
  { sourcePlan with
    spawn :=
      [ ⟨verifierJob, "gated", none⟩
      , ⟨restoreJob, "parallel", some verifierJob⟩
      ] }

def missingFailurePacketWitness : ReceiptGatePlan :=
  { sourcePlan with
    rewrite := "restore only after durable output receipt" }

theorem source_plan_passes_source_shaped_test :
    sourceShapedSelfTest sourcePlan = true := by
  decide

theorem source_plan_passes_proposed_contract :
    proposedReceiptGateContract sourcePlan = true := by
  decide

theorem source_test_accepts_missing_dependency :
    sourceShapedSelfTest missingDependencyWitness = true := by
  decide

theorem proposed_contract_rejects_missing_dependency :
    proposedReceiptGateContract missingDependencyWitness = false := by
  decide

theorem source_test_accepts_wrong_dependency :
    sourceShapedSelfTest wrongDependencyWitness = true := by
  decide

theorem proposed_contract_rejects_wrong_dependency :
    proposedReceiptGateContract wrongDependencyWitness = false := by
  decide

theorem source_test_accepts_ungated_restore :
    sourceShapedSelfTest ungatedRestoreWitness = true := by
  decide

theorem proposed_contract_rejects_ungated_restore :
    proposedReceiptGateContract ungatedRestoreWitness = false := by
  decide

theorem source_test_accepts_missing_failure_packet_alternative :
    sourceShapedSelfTest missingFailurePacketWitness = true := by
  decide

theorem proposed_contract_rejects_missing_failure_packet_alternative :
    proposedReceiptGateContract missingFailurePacketWitness = false := by
  decide

theorem source_test_does_not_imply_receipt_gate_contract :
    ∃ p, sourceShapedSelfTest p = true ∧
      proposedReceiptGateContract p = false := by
  exact ⟨missingDependencyWitness, by decide, by decide⟩

#eval sourceShapedSelfTest sourcePlan
#eval proposedReceiptGateContract sourcePlan
#eval sourceShapedSelfTest missingDependencyWitness
#eval proposedReceiptGateContract missingDependencyWitness
#eval sourceShapedSelfTest wrongDependencyWitness
#eval proposedReceiptGateContract wrongDependencyWitness
#eval sourceShapedSelfTest ungatedRestoreWitness
#eval proposedReceiptGateContract ungatedRestoreWitness
#eval sourceShapedSelfTest missingFailurePacketWitness
#eval proposedReceiptGateContract missingFailurePacketWitness

#print axioms source_plan_passes_source_shaped_test
#print axioms source_plan_passes_proposed_contract
#print axioms source_test_accepts_missing_dependency
#print axioms proposed_contract_rejects_missing_dependency
#print axioms source_test_accepts_wrong_dependency
#print axioms proposed_contract_rejects_wrong_dependency
#print axioms source_test_accepts_ungated_restore
#print axioms proposed_contract_rejects_ungated_restore
#print axioms source_test_accepts_missing_failure_packet_alternative
#print axioms proposed_contract_rejects_missing_failure_packet_alternative
#print axioms source_test_does_not_imply_receipt_gate_contract

end HsHVerification.EliasReceiptGateDependencyCoverage
