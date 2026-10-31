import Mathlib

/-!
Elias Track A | exact-target proof evidence, 2026-10-30.

Primary observations:
* PR #873 head d716f22209d981bb01527f40b717550e95693331 was tested in
  merge commit 68c4296a15067755586fd64fe92b421704cd587f by run
  #41111252893 / job #124253873264. The exact module theorem below did not
  compile; the log contains elaboration errors and sorryAx in its failed
  theorem output.
* PR #850 head 05b55800701b726b88ff34e57a83f0d0c71f3065 was tested in
  merge commit d07c8503e1986a6405bb3a1fadc3a1e4878bc052 by run
  #41111552657 / job #124254668125. OrsonPairwisePCR built and its selected
  theorem's #print axioms output listed only propext, Classical.choice,
  Quot.sound; no sorryAx appeared in the full job log.
* GitHub compare results show each PR head is the merge base of its tested
  commit (ahead_by=1, behind_by=0). The checked-out GITHUB_SHA is therefore
  recorded separately from the PR head SHA.

This is a formalized acceptance-key model over those transcribed records.
Lean does not authenticate GitHub, validate the source-to-record translation,
prove CI event semantics, or establish the scientific truth of either module.
All fields use computable finite equality, so the concrete cases below must use
the generated Decidable instances. Introducing `classical` before `decide`
selects `Classical.propDecidable` and blocks reduction through Classical.choice.
The Orson record is used only as a different-target positive control; this
does not transfer or review Orson's P1 scientific conclusions.
-/

namespace HsHVerification.EliasProofTargetIdentity

inductive WorkflowConclusion where
  | success
  | failure
  deriving DecidableEq, Repr

/-- A proof reference binds the PR head to the commit actually checked out,
    then binds that run to one module and one theorem. -/
structure ProofTarget where
  repository : String
  pullRequest : Nat
  headSha : String
  testedCommitSha : String
  workflowId : Nat
  workflowRunId : Nat
  jobId : Nat
  moduleName : String
  theoremName : String
  deriving DecidableEq, Repr

structure ProofRecord where
  target : ProofTarget
  conclusion : WorkflowConclusion
  moduleBuilt : Bool
  theoremAxiomOutputPresent : Bool
  noSorryAx : Bool
  deriving DecidableEq, Repr

/-- Evidence is accepted only for its exact target and only when the job,
    module build, theorem axiom report, and no-sorry condition all pass. -/
def acceptedFor (expected : ProofTarget) (record : ProofRecord) : Prop :=
  record.target = expected ∧
  record.conclusion = .success ∧
  record.moduleBuilt = true ∧
  record.theoremAxiomOutputPresent = true ∧
  record.noSorryAx = true

def kestrelTarget : ProofTarget :=
  { repository := "Satobloc/HsH"
    pullRequest := 873
    headSha := "d716f22209d981bb01527f40b717550e95693331"
    testedCommitSha := "68c4296a15067755586fd64fe92b421704cd587f"
    workflowId := 394031735
    workflowRunId := 41111252893
    jobId := 124253873264
    moduleName := "HsHVerification.KestrelIntersectionDimensionGate"
    theoremName := "transverse_worldsheet_hypersurface_finrank_one" }

def orsonTarget : ProofTarget :=
  { repository := "Satobloc/HsH"
    pullRequest := 850
    headSha := "05b55800701b726b88ff34e57a83f0d0c71f3065"
    testedCommitSha := "d07c8503e1986a6405bb3a1fadc3a1e4878bc052"
    workflowId := 394031735
    workflowRunId := 41111552657
    jobId := 124254668125
    moduleName := "HsHVerification.OrsonPairwisePCR"
    theoremName := "evaluatorPCRCount_decomposition" }

def kestrelRecord : ProofRecord :=
  { target := kestrelTarget
    conclusion := .failure
    moduleBuilt := false
    theoremAxiomOutputPresent := true
    noSorryAx := false }

def orsonRecord : ProofRecord :=
  { target := orsonTarget
    conclusion := .success
    moduleBuilt := true
    theoremAxiomOutputPresent := true
    noSorryAx := true }

theorem accepted_record_has_exact_target
    (expected : ProofTarget) (record : ProofRecord)
    (h : acceptedFor expected record) :
    record.target = expected := h.1

theorem orson_success_is_bound_to_its_own_target :
    acceptedFor orsonTarget orsonRecord := by
  simp [acceptedFor, orsonTarget, orsonRecord]

theorem unrelated_orson_success_cannot_certify_kestrel :
    ¬ acceptedFor kestrelTarget orsonRecord := by
  intro h
  have hpr := congrArg (fun t : ProofTarget => t.pullRequest) h.1
  norm_num [orsonTarget, kestrelTarget] at hpr

theorem failed_kestrel_run_is_not_accepted :
    ¬ acceptedFor kestrelTarget kestrelRecord := by
  intro h
  cases h.2.1

def orsonWrongHeadTarget : ProofTarget :=
  { orsonTarget with headSha := "d716f22209d981bb01527f40b717550e95693331" }

def orsonWrongTestedCommitTarget : ProofTarget :=
  { orsonTarget with testedCommitSha := "68c4296a15067755586fd64fe92b421704cd587f" }

def orsonWrongRunTarget : ProofTarget :=
  { orsonTarget with workflowRunId := 41111252893 }

def orsonWrongModuleTarget : ProofTarget :=
  { orsonTarget with moduleName := "HsHVerification.KestrelIntersectionDimensionGate" }

def orsonWrongTheoremTarget : ProofTarget :=
  { orsonTarget with theoremName := "transverse_worldsheet_hypersurface_finrank_one" }

theorem changed_head_rejects_otherwise_successful_record :
    ¬ acceptedFor orsonWrongHeadTarget orsonRecord := by
  intro h
  have hs := congrArg (fun t : ProofTarget => t.headSha) h.1
  have hne : "05b55800701b726b88ff34e57a83f0d0c71f3065" ≠
      "d716f22209d981bb01527f40b717550e95693331" := by decide
  exact hne (by simpa [orsonTarget, orsonWrongHeadTarget] using hs)

theorem changed_tested_commit_rejects_otherwise_successful_record :
    ¬ acceptedFor orsonWrongTestedCommitTarget orsonRecord := by
  intro h
  have hs := congrArg (fun t : ProofTarget => t.testedCommitSha) h.1
  have hne : "d07c8503e1986a6405bb3a1fadc3a1e4878bc052" ≠
      "68c4296a15067755586fd64fe92b421704cd587f" := by decide
  exact hne (by simpa [orsonTarget, orsonWrongTestedCommitTarget] using hs)

theorem changed_run_rejects_otherwise_successful_record :
    ¬ acceptedFor orsonWrongRunTarget orsonRecord := by
  intro h
  have hr := congrArg (fun t : ProofTarget => t.workflowRunId) h.1
  norm_num [orsonTarget, orsonWrongRunTarget] at hr

theorem changed_module_rejects_otherwise_successful_record :
    ¬ acceptedFor orsonWrongModuleTarget orsonRecord := by
  intro h
  have hs := congrArg (fun t : ProofTarget => t.moduleName) h.1
  have hne : "HsHVerification.OrsonPairwisePCR" ≠
      "HsHVerification.KestrelIntersectionDimensionGate" := by decide
  exact hne (by simpa [orsonTarget, orsonWrongModuleTarget] using hs)

theorem changed_theorem_rejects_otherwise_successful_record :
    ¬ acceptedFor orsonWrongTheoremTarget orsonRecord := by
  intro h
  have hs := congrArg (fun t : ProofTarget => t.theoremName) h.1
  have hne : "evaluatorPCRCount_decomposition" ≠
      "transverse_worldsheet_hypersurface_finrank_one" := by decide
  exact hne (by simpa [orsonTarget, orsonWrongTheoremTarget] using hs)

#print axioms accepted_record_has_exact_target
#print axioms orson_success_is_bound_to_its_own_target
#print axioms unrelated_orson_success_cannot_certify_kestrel
#print axioms failed_kestrel_run_is_not_accepted
#print axioms changed_head_rejects_otherwise_successful_record
#print axioms changed_tested_commit_rejects_otherwise_successful_record
#print axioms changed_run_rejects_otherwise_successful_record
#print axioms changed_module_rejects_otherwise_successful_record
#print axioms changed_theorem_rejects_otherwise_successful_record

end HsHVerification.EliasProofTargetIdentity
