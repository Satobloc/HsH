import Mathlib

/-!
Hale Review-MIND :48, nominal 2026-11-02T01:48Z.

Source-conditional, public-safe arithmetic summary of one archived
human–LLM GitHub-tool process trace. The private Library export is not
embedded, identified, or hashed here. Times are relative milliseconds from
the first user confirmation of the nonce cue, rounded to the nearest
millisecond. Tool-action milestones use assistant invocation time, not tool
response-completion time.

The milestone trace records:
* an explicit file-directed correction;
* an unrelated file fetch after that correction;
* three repository-scope diagnostics and a final clarification;
* a subsequent fetch of the intended public root-level florx.md marker;
* the assistant's interpretation after reading that marker.

Within the measured interval: 7 user turns; 25 GitHub connector actions
(8 search, 12 commit-search, 3 fetch, 1 installed-repository enumeration,
1 fetch_file); 6 GitHub connector resource-list calls; and 2 web calls
associated with the preceding, unrelated file-retrieval context. The
33-call window total is not a count of florx-specific calls.

These proofs certify only the ordering and arithmetic of this encoded
aggregate summary. They do not authenticate the private export, establish
source completeness, reveal model internals, prove causation or general
capability, or establish a multi-agent interaction. This is an archive
observation / prompted process trace, not a standard causal natural
experiment. No physical calculation is involved.
-/

namespace HsHVerification.HaleVEY005Trace

inductive Actor where
  | human
  | assistant
  deriving DecidableEq, Repr

inductive EventKind where
  | initialNonceConfirmation
  | ambiguousFollowup
  | explicitFileCorrection
  | unrelatedFileFetch
  | repoCountPrompt
  | recentCommitsPrompt
  | surfaceQueryPrompt
  | finalClarification
  | correctTargetFetch
  | assistantInterpretation
  deriving DecidableEq, Repr

def actor : EventKind → Actor
  | .initialNonceConfirmation => .human
  | .ambiguousFollowup => .human
  | .explicitFileCorrection => .human
  | .unrelatedFileFetch => .assistant
  | .repoCountPrompt => .human
  | .recentCommitsPrompt => .human
  | .surfaceQueryPrompt => .human
  | .finalClarification => .human
  | .correctTargetFetch => .assistant
  | .assistantInterpretation => .assistant

/-- Relative milliseconds from the initial nonce confirmation. -/
def eventTime : EventKind → Nat
  | .initialNonceConfirmation => 0
  | .ambiguousFollowup => 143940
  | .explicitFileCorrection => 181973
  | .unrelatedFileFetch => 206291
  | .repoCountPrompt => 234702
  | .recentCommitsPrompt => 258001
  | .surfaceQueryPrompt => 312352
  | .finalClarification => 342728
  | .correctTargetFetch => 351128
  | .assistantInterpretation => 359810

/-- The ten public-safe milestone labels, not the complete message/tool log. -/
def trace : List EventKind :=
  [ .initialNonceConfirmation
  , .ambiguousFollowup
  , .explicitFileCorrection
  , .unrelatedFileFetch
  , .repoCountPrompt
  , .recentCommitsPrompt
  , .surfaceQueryPrompt
  , .finalClarification
  , .correctTargetFetch
  , .assistantInterpretation
  ]

def traceTimes : List Nat := trace.map eventTime

def observedHumanTurns : Nat :=
  (trace.filter (fun e => actor e == .human)).length

def githubSearchCalls : Nat := 8
def githubCommitSearchCalls : Nat := 12
def githubFetchCalls : Nat := 3
def installedRepositoryEnumerations : Nat := 1
def githubFetchFileCalls : Nat := 1
def githubConnectorActions : Nat :=
  githubSearchCalls + githubCommitSearchCalls + githubFetchCalls +
  installedRepositoryEnumerations + githubFetchFileCalls

def githubResourceListCalls : Nat := 6
def webCallsInWindow : Nat := 2
def externalToolCallsInWindow : Nat :=
  githubConnectorActions + githubResourceListCalls + webCallsInWindow

def initialCueToCorrectFetchMs : Nat :=
  eventTime .correctTargetFetch - eventTime .initialNonceConfirmation

def explicitCorrectionToWrongFetchMs : Nat :=
  eventTime .unrelatedFileFetch - eventTime .explicitFileCorrection

def explicitCorrectionToCorrectFetchMs : Nat :=
  eventTime .correctTargetFetch - eventTime .explicitFileCorrection

def finalClarificationToCorrectFetchMs : Nat :=
  eventTime .correctTargetFetch - eventTime .finalClarification

def finalClarificationToInterpretationMs : Nat :=
  eventTime .assistantInterpretation - eventTime .finalClarification

theorem milestone_trace_is_strictly_ordered :
    List.Pairwise (fun a b : Nat => a < b) traceTimes := by
  decide

theorem observed_human_turn_count :
    observedHumanTurns = 7 := by
  decide

theorem unrelated_fetch_follows_explicit_correction_and_precedes_final_clarification :
    eventTime .explicitFileCorrection <
      eventTime .unrelatedFileFetch ∧
    eventTime .unrelatedFileFetch <
      eventTime .finalClarification := by
  decide

theorem intended_target_fetch_follows_final_clarification :
    eventTime .finalClarification <
      eventTime .correctTargetFetch ∧
    eventTime .correctTargetFetch <
      eventTime .assistantInterpretation := by
  decide

theorem connector_action_partition :
    githubConnectorActions = 25 ∧
    externalToolCallsInWindow = 33 := by
  decide

theorem measured_millisecond_delays :
    initialCueToCorrectFetchMs = 351128 ∧
    explicitCorrectionToWrongFetchMs = 24318 ∧
    explicitCorrectionToCorrectFetchMs = 169155 ∧
    finalClarificationToCorrectFetchMs = 8400 ∧
    finalClarificationToInterpretationMs = 17082 := by
  decide

#eval traceTimes
#eval observedHumanTurns
#eval githubSearchCalls
#eval githubCommitSearchCalls
#eval githubFetchCalls
#eval installedRepositoryEnumerations
#eval githubFetchFileCalls
#eval githubConnectorActions
#eval githubResourceListCalls
#eval webCallsInWindow
#eval externalToolCallsInWindow
#eval initialCueToCorrectFetchMs
#eval explicitCorrectionToWrongFetchMs
#eval explicitCorrectionToCorrectFetchMs
#eval finalClarificationToCorrectFetchMs
#eval finalClarificationToInterpretationMs

#print axioms milestone_trace_is_strictly_ordered
#print axioms observed_human_turn_count
#print axioms unrelated_fetch_follows_explicit_correction_and_precedes_final_clarification
#print axioms intended_target_fetch_follows_final_clarification
#print axioms connector_action_partition
#print axioms measured_millisecond_delays

end HsHVerification.HaleVEY005Trace
