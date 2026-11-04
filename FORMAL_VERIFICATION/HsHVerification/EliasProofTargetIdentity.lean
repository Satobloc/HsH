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
  constructor
  · rfl
  · exact ⟨rfl, rfl, rfl, rfl⟩

theorem unrelated_orson_success_cannot_certify_kestrel :
    ¬ acceptedFor kestrelTarget orsonRecord := by
  intro h
  have hpr := congrArg (fun t : ProofTarget => t.pullRequest) h.1
  norm_num [orsonRecord, orsonTarget, kestrelTarget] at hpr

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
  exact hne (by simpa [orsonRecord, orsonTarget, orsonWrongHeadTarget] using hs)

theorem changed_tested_commit_rejects_otherwise_successful_record :
    ¬ acceptedFor orsonWrongTestedCommitTarget orsonRecord := by
  intro h
  have hs := congrArg (fun t : ProofTarget => t.testedCommitSha) h.1
  have hne : "d07c8503e1986a6405bb3a1fadc3a1e4878bc052" ≠
      "68c4296a15067755586fd64fe92b421704cd587f" := by decide
  exact hne (by simpa [orsonRecord, orsonTarget, orsonWrongTestedCommitTarget] using hs)

theorem changed_run_rejects_otherwise_successful_record :
    ¬ acceptedFor orsonWrongRunTarget orsonRecord := by
  intro h
  have hr := congrArg (fun t : ProofTarget => t.workflowRunId) h.1
  norm_num [orsonRecord, orsonTarget, orsonWrongRunTarget] at hr

theorem changed_module_rejects_otherwise_successful_record :
    ¬ acceptedFor orsonWrongModuleTarget orsonRecord := by
  intro h
  have hs := congrArg (fun t : ProofTarget => t.moduleName) h.1
  have hne : "HsHVerification.OrsonPairwisePCR" ≠
      "HsHVerification.KestrelIntersectionDimensionGate" := by decide
  exact hne (by simpa [orsonRecord, orsonTarget, orsonWrongModuleTarget] using hs)

theorem changed_theorem_rejects_otherwise_successful_record :
    ¬ acceptedFor orsonWrongTheoremTarget orsonRecord := by
  intro h
  have hs := congrArg (fun t : ProofTarget => t.theoremName) h.1
  have hne : "evaluatorPCRCount_decomposition" ≠
      "transverse_worldsheet_hypersurface_finrank_one" := by decide
  exact hne (by simpa [orsonRecord, orsonTarget, orsonWrongTheoremTarget] using hs)

#print axioms accepted_record_has_exact_target
#print axioms orson_success_is_bound_to_its_own_target
#print axioms unrelated_orson_success_cannot_certify_kestrel
#print axioms failed_kestrel_run_is_not_accepted
#print axioms changed_head_rejects_otherwise_successful_record
#print axioms changed_tested_commit_rejects_otherwise_successful_record
#print axioms changed_run_rejects_otherwise_successful_record
#print axioms changed_module_rejects_otherwise_successful_record
#print axioms changed_theorem_rejects_otherwise_successful_record


/-!
## Automation occurrence and attempt identity

A scheduled occurrence may be retried while retaining its occurrence/run ID.
A result's occurrence key is therefore not, by itself, an attempt identifier.
For a result even to be temporally compatible with one attempt, its creation
time must not precede that attempt's start. This is necessary, not sufficient:
the observed connector payload does not expose a distinct attempt ID here.

These theorems check this schema only. They do not authenticate connector
payloads, parse timestamps, or prove scheduler semantics.
-/

structure AutomationOccurrenceIdentity where
  automationId : String
  scheduledFor : String
  runId : String
  deriving DecidableEq, Repr

def resultMatchesScheduledOccurrence
    (current result : AutomationOccurrenceIdentity) : Prop :=
  result.automationId = current.automationId ∧
  result.scheduledFor = current.scheduledFor ∧
  result.runId = current.runId

theorem matching_automation_occurrence_has_matching_identity
    (current : AutomationOccurrenceIdentity) :
    resultMatchesScheduledOccurrence current current := by
  exact ⟨rfl, rfl, rfl⟩

theorem mismatched_automation_id_rejects_occurrence_match
    (current result : AutomationOccurrenceIdentity)
    (h : result.automationId ≠ current.automationId) :
    ¬ resultMatchesScheduledOccurrence current result := by
  intro hm
  exact h hm.1

theorem mismatched_scheduled_slot_rejects_occurrence_match
    (current result : AutomationOccurrenceIdentity)
    (h : result.scheduledFor ≠ current.scheduledFor) :
    ¬ resultMatchesScheduledOccurrence current result := by
  intro hm
  exact h hm.2.1

theorem mismatched_run_id_rejects_occurrence_match
    (current result : AutomationOccurrenceIdentity)
    (h : result.runId ≠ current.runId) :
    ¬ resultMatchesScheduledOccurrence current result := by
  intro hm
  exact h hm.2.2

structure AutomationAttemptIdentity where
  occurrence : AutomationOccurrenceIdentity
  startedAt : Nat
  deriving DecidableEq, Repr

structure AutomationResultIdentity where
  occurrence : AutomationOccurrenceIdentity
  createdAt : Nat
  deriving DecidableEq, Repr

def resultTemporallyCompatibleWithAttempt
    (attempt : AutomationAttemptIdentity)
    (result : AutomationResultIdentity) : Prop :=
  result.occurrence = attempt.occurrence ∧
  attempt.startedAt ≤ result.createdAt

theorem result_created_before_attempt_cannot_belong
    (attempt : AutomationAttemptIdentity)
    (result : AutomationResultIdentity)
    (h : result.createdAt < attempt.startedAt) :
    ¬ resultTemporallyCompatibleWithAttempt attempt result := by
  intro hm
  exact Nat.not_le_of_gt h hm.2

#print axioms matching_automation_occurrence_has_matching_identity
#print axioms mismatched_automation_id_rejects_occurrence_match
#print axioms mismatched_scheduled_slot_rejects_occurrence_match
#print axioms mismatched_run_id_rejects_occurrence_match
#print axioms result_created_before_attempt_cannot_belong

end HsHVerification.EliasProofTargetIdentity


namespace HsHVerification.EliasProofTargetIdentity

/-!
## 2026-11-04: current-attempt / prior-result separation

Live automation connector observations (UTC; timestamps below are exact integer
microseconds since the Unix epoch, converted from the returned ISO-8601 values):

* :36 automation 6a9f52b69ec08191b8a91a30d2a155e0:
  current last_run ID b97173c2-7370-8328-bd31-c92c43769887,
  scheduled 18:36Z, started 18:40:21.578886Z, status in_progress,
  completed_at = null, chat_ref = null.
  Its latest_result is run 97e09995-a414-8331-9a28-d4b780c14712,
  scheduled 17:36Z, created 17:59:01.066125Z, completed 17:59:02.572151Z.

* :24 automation 6abda4c8eda88191bf23a6f2849e9a17:
  current last_run ID 0b759608-a8ec-8320-90d1-29043eaccd06,
  scheduled 18:24Z, started 18:21:14.675387Z, status failed,
  completed 18:46:17.297454Z, chat_ref = null.
  Its latest_result is run c5eba963-e9ec-8327-9339-29dfeb701f13,
  scheduled 15:24Z, created 16:20:52.425752Z, completed 16:20:54.377548Z.

The connector exposes last_run.id and latest_result.run_id, but not a
separately typed attempt token. The model below does not silently reuse the
reported run/occurrence ID as an attempt ID. attemptToken = none records
that missing distinction. These are observed connector payloads, not an
independent statement about scheduler backend semantics.
-/

inductive AutomationAttemptStatus where
  | inProgress
  | completed
  | failed
  | cancelled
  deriving DecidableEq, Repr

structure AutomationAttemptObservation where
  identity : AutomationOccurrenceIdentity
  attemptToken : Option String
  startedAtUnixMicros : Nat
  status : AutomationAttemptStatus
  completedAtUnixMicros : Option Nat
  deriving DecidableEq, Repr

structure AutomationResultObservation where
  identity : AutomationOccurrenceIdentity
  attemptToken : Option String
  createdAtUnixMicros : Nat
  completedAtUnixMicros : Option Nat
  deriving DecidableEq, Repr

/-- A distinct, nonempty attempt token is required; an occurrence/run ID alone
    is not silently promoted to an attempt ID. -/
def hasDistinctAttemptToken (token : Option String) : Prop :=
  match token with
  | none => False
  | some value => value ≠ ""

/-- The pattern-match form is definitionally computable and equivalent to the
    original existential statement that the option contains a nonempty token. -/
theorem hasDistinctAttemptToken_iff_exists_nonempty (token : Option String) :
    hasDistinctAttemptToken token ↔
      ∃ value, token = some value ∧ value ≠ "" := by
  cases token <;> simp [hasDistinctAttemptToken]

/-- Conservative sufficient acceptance contract for attributing one result
    to one completed execution attempt. This is not a claim that the current
    connector exposes every required field. -/
def resultAcceptedForAttempt
    (attempt : AutomationAttemptObservation)
    (result : AutomationResultObservation) : Prop :=
  resultMatchesScheduledOccurrence attempt.identity result.identity ∧
  hasDistinctAttemptToken attempt.attemptToken ∧
  attempt.attemptToken = result.attemptToken ∧
  attempt.startedAtUnixMicros ≤ result.createdAtUnixMicros ∧
  attempt.status = .completed ∧
  attempt.completedAtUnixMicros.isSome = true ∧
  result.completedAtUnixMicros.isSome = true

theorem missing_attempt_token_rejects_result
    (attempt : AutomationAttemptObservation)
    (result : AutomationResultObservation)
    (h : attempt.attemptToken = none) :
    ¬ resultAcceptedForAttempt attempt result := by
  intro accepted
  rcases accepted with ⟨_, hToken, _, _, _, _, _⟩
  simpa [hasDistinctAttemptToken, h] using hToken

theorem in_progress_attempt_rejects_result
    (attempt : AutomationAttemptObservation)
    (result : AutomationResultObservation)
    (h : attempt.status = .inProgress) :
    ¬ resultAcceptedForAttempt attempt result := by
  intro accepted
  rcases accepted with ⟨_, _, _, _, hCompleted, _, _⟩
  rw [h] at hCompleted
  cases hCompleted

theorem failed_attempt_rejects_result
    (attempt : AutomationAttemptObservation)
    (result : AutomationResultObservation)
    (h : attempt.status = .failed) :
    ¬ resultAcceptedForAttempt attempt result := by
  intro accepted
  rcases accepted with ⟨_, _, _, _, hCompleted, _, _⟩
  rw [h] at hCompleted
  cases hCompleted

def worldtubeCurrentAttempt : AutomationAttemptObservation :=
  { identity :=
      { automationId := "6a9f52b69ec08191b8a91a30d2a155e0"
        scheduledFor := "2026-11-04T18:36:00Z"
        runId := "b97173c2-7370-8328-bd31-c92c43769887" }
    attemptToken := none
    startedAtUnixMicros := 1793817621578886
    status := .inProgress
    completedAtUnixMicros := none }

def worldtubeLatestResult : AutomationResultObservation :=
  { identity :=
      { automationId := "6a9f52b69ec08191b8a91a30d2a155e0"
        scheduledFor := "2026-11-04T17:36:00Z"
        runId := "97e09995-a414-8331-9a28-d4b780c14712" }
    attemptToken := none
    createdAtUnixMicros := 1793815141066125
    completedAtUnixMicros := some 1793815142572151 }

def geometryCurrentAttempt : AutomationAttemptObservation :=
  { identity :=
      { automationId := "6abda4c8eda88191bf23a6f2849e9a17"
        scheduledFor := "2026-11-04T18:24:00Z"
        runId := "0b759608-a8ec-8320-90d1-29043eaccd06" }
    attemptToken := none
    startedAtUnixMicros := 1793816474675387
    status := .failed
    completedAtUnixMicros := some 1793817977297454 }

def geometryLatestResult : AutomationResultObservation :=
  { identity :=
      { automationId := "6abda4c8eda88191bf23a6f2849e9a17"
        scheduledFor := "2026-11-04T15:24:00Z"
        runId := "c5eba963-e9ec-8327-9339-29dfeb701f13" }
    attemptToken := none
    createdAtUnixMicros := 1793809252425752
    completedAtUnixMicros := some 1793809254377548 }

theorem worldtube_latest_result_not_current :
    ¬ resultAcceptedForAttempt worldtubeCurrentAttempt worldtubeLatestResult := by
  decide

theorem geometry_latest_result_not_current :
    ¬ resultAcceptedForAttempt geometryCurrentAttempt geometryLatestResult := by
  decide

/-- Actual record replay: false means the displayed latest result does not
    belong to the current scheduled occurrence/attempt under this contract. -/
#eval decide (resultMatchesScheduledOccurrence
  worldtubeCurrentAttempt.identity worldtubeLatestResult.identity)
#eval decide (resultTemporallyCompatibleWithAttempt
  { occurrence := worldtubeCurrentAttempt.identity
    startedAt := worldtubeCurrentAttempt.startedAtUnixMicros }
  { occurrence := worldtubeLatestResult.identity
    createdAt := worldtubeLatestResult.createdAtUnixMicros })
#eval decide (resultAcceptedForAttempt worldtubeCurrentAttempt worldtubeLatestResult)

#eval decide (resultMatchesScheduledOccurrence
  geometryCurrentAttempt.identity geometryLatestResult.identity)
#eval decide (resultTemporallyCompatibleWithAttempt
  { occurrence := geometryCurrentAttempt.identity
    startedAt := geometryCurrentAttempt.startedAtUnixMicros }
  { occurrence := geometryLatestResult.identity
    createdAt := geometryLatestResult.createdAtUnixMicros })
#eval decide (resultAcceptedForAttempt geometryCurrentAttempt geometryLatestResult)

#print axioms missing_attempt_token_rejects_result
#print axioms in_progress_attempt_rejects_result
#print axioms failed_attempt_rejects_result
#print axioms worldtube_latest_result_not_current
#print axioms geometry_latest_result_not_current


/-- Live h598 observation from the :24 automation connector. The current
    scheduled attempt is still in progress; latest_result is the prior
    21:24Z occurrence. This is an observed software record, not a physical
    fixture or a claim about scheduler backend semantics. -/
def geometryCurrentAttemptH598 : AutomationAttemptObservation :=
  { identity :=
      { automationId := "6abda4c8eda88191bf23a6f2849e9a17"
        scheduledFor := "2026-11-04T22:24:00Z"
        runId := "162408a5-e3f8-8326-9af4-12b5503ee167" }
    attemptToken := none
    startedAtUnixMicros := 1793831126518679
    status := .inProgress
    completedAtUnixMicros := none }

def geometryLatestResultH598 : AutomationResultObservation :=
  { identity :=
      { automationId := "6abda4c8eda88191bf23a6f2849e9a17"
        scheduledFor := "2026-11-04T21:24:00Z"
        runId := "01c8a167-82cc-832f-93d0-5c7070d80f0e" }
    attemptToken := none
    createdAtUnixMicros := 1793829007168092
    completedAtUnixMicros := some 1793829012765682 }

theorem geometry_h598_latest_result_not_current :
    ¬ resultAcceptedForAttempt geometryCurrentAttemptH598 geometryLatestResultH598 := by
  decide

theorem geometry_h598_latest_result_predates_attempt :
    ¬ resultTemporallyCompatibleWithAttempt
      { occurrence := geometryCurrentAttemptH598.identity
        startedAt := geometryCurrentAttemptH598.startedAtUnixMicros }
      { occurrence := geometryLatestResultH598.identity
        createdAt := geometryLatestResultH598.createdAtUnixMicros } := by
  decide

#eval decide (resultMatchesScheduledOccurrence
  geometryCurrentAttemptH598.identity geometryLatestResultH598.identity)
#eval decide (resultTemporallyCompatibleWithAttempt
  { occurrence := geometryCurrentAttemptH598.identity
    startedAt := geometryCurrentAttemptH598.startedAtUnixMicros }
  { occurrence := geometryLatestResultH598.identity
    createdAt := geometryLatestResultH598.createdAtUnixMicros })
#eval decide (resultAcceptedForAttempt geometryCurrentAttemptH598 geometryLatestResultH598)

#print axioms geometry_h598_latest_result_not_current
#print axioms geometry_h598_latest_result_predates_attempt

end HsHVerification.EliasProofTargetIdentity
