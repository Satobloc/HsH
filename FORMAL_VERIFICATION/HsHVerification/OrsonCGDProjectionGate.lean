import Mathlib

/-!
# Orson P1: CGD checker/repair projections

Source pin: aayambansal/ConsistencyBench commit
bfc676baa848c7f1715bb73aee148180de15516e,
src/evaluate.py blob 0453540cb7c19227601e59fb342fa93e736da849.

Source map:
- evaluate_cgd: the checker receives prev_raw and current raw_response.
- NLIContradictionChecker: both response strings are truncated to 500 characters;
  the prompt contains neither question nor premise.
- The repair prompt receives the previous question, previous final extracted
  answer, the premise relationship, and current question; it does not receive
  the current first-pass raw response.
- History stores (question, final_answer, raw_response), so after a revision
  the repair-facing answer changes while the future checker-facing raw answer
  remains the original response.
- The result record retains a Boolean flag and revision/result fields, but not
  the triggering pair or raw judge prompt/output.

The theorems formalize this source-derived abstraction only. They do not prove
that the Python translation is sound, that archived runs followed this exact
source revision, that the checker is semantically valid, or that the
information loss changes measured outcomes.
-/

namespace HsHVerification.OrsonCGDProjectionGate

def prefix500 (s : String) : String := String.ofList (s.toList.take 500)

structure PairContext where
  previousQuestion : String
  premise : String
  currentQuestion : String
  previousFinalAnswer : String
  previousRaw : String
  currentRaw : String
deriving DecidableEq, Repr

def checkerView (c : PairContext) : String × String :=
  (prefix500 c.previousRaw, prefix500 c.currentRaw)

structure RepairView where
  previousQuestion : String
  previousFinalAnswer : String
  premise : String
  currentQuestion : String
deriving DecidableEq, Repr

def repairView (c : PairContext) : RepairView :=
  { previousQuestion := c.previousQuestion
    previousFinalAnswer := c.previousFinalAnswer
    premise := c.premise
    currentQuestion := c.currentQuestion }

def revisePrevious (c : PairContext) (newFinal : String) : PairContext :=
  { c with previousFinalAnswer := newFinal }

theorem checker_view_ignores_question_premise_and_final_answer
    (c : PairContext) (q p cq fa : String) :
    checkerView
      { c with previousQuestion := q, premise := p,
               currentQuestion := cq, previousFinalAnswer := fa } =
    checkerView c := by
  rfl

theorem checker_view_keeps_original_raw_after_revision
    (c : PairContext) (newFinal : String) :
    checkerView (revisePrevious c newFinal) = checkerView c := by
  rfl

theorem repair_view_tracks_revised_final_answer
    (c : PairContext) (newFinal : String) :
    (repairView (revisePrevious c newFinal)).previousFinalAnswer = newFinal := by
  rfl

theorem repair_view_ignores_current_raw
    (c : PairContext) (newRaw : String) :
    repairView { c with currentRaw := newRaw } = repairView c := by
  rfl

theorem prefix500_depends_only_on_first_500
    (s t : String)
    (h : s.toList.take 500 = t.toList.take 500) :
    prefix500 s = prefix500 t := by
  unfold prefix500
  rw [h]

theorem same_checker_view_can_have_different_repair_context :
    ∃ c₁ c₂ : PairContext,
      checkerView c₁ = checkerView c₂ ∧ repairView c₁ ≠ repairView c₂ := by
  refine ⟨
    { previousQuestion := "Q1", premise := "P1", currentQuestion := "Q2",
      previousFinalAnswer := "Yes", previousRaw := "raw", currentRaw := "current" },
    { previousQuestion := "Q1b", premise := "P2", currentQuestion := "Q2b",
      previousFinalAnswer := "No", previousRaw := "raw", currentRaw := "current" },
    ?_, ?_⟩
  · rfl
  · decide

structure LoggedResult where
  question : String
  expected : String
  initialResponse : String
  initialAnswer : String
  contradictionDetected : Bool
  revisionResponse : Option String
  extractedAnswer : String
  reasoningRef : String
deriving DecidableEq, Repr

structure FullTrace where
  logged : LoggedResult
  triggerPair : String × String
  judgePrompt : String
  judgeOutput : String
deriving DecidableEq, Repr

def archiveProjection (t : FullTrace) : LoggedResult := t.logged

theorem archived_projection_does_not_identify_trigger_pair :
    ∃ t₁ t₂ : FullTrace,
      archiveProjection t₁ = archiveProjection t₂ ∧
      t₁.triggerPair ≠ t₂.triggerPair := by
  let common : LoggedResult :=
    { question := "Q", expected := "Yes", initialResponse := "raw current",
      initialAnswer := "No", contradictionDetected := true,
      revisionResponse := some "revised", extractedAnswer := "Yes",
      reasoningRef := "R" }
  refine ⟨
    { logged := common, triggerPair := ("prior A", "current"),
      judgePrompt := "prompt A", judgeOutput := "CONTRADICTORY" },
    { logged := common, triggerPair := ("prior B", "current"),
      judgePrompt := "prompt B", judgeOutput := "CONTRADICTORY" },
    ?_, ?_⟩
  · rfl
  · decide

/-!
## Error-sentinel observability gate

Source: the pinned Python evaluator's `call_model` returns the literal
`"[ERROR]"` after both attempts fail; the NLI parser then evaluates
`"CONTRADICTORY" in response.upper() if response else False`.

The two concrete strings below are already uppercase ASCII, so this
source-conditional check isolates the parser's substring/truthiness branch.
It does not establish that any archived call actually failed.
-/

def startsWithChars : List Char → List Char → Bool
  | [], _ => true
  | _ :: _, [] => false
  | c :: cs, d :: ds => (c == d) && startsWithChars cs ds

def containsChars (needle : List Char) : List Char → Bool
  | [] => needle == []
  | hay :: tail =>
      startsWithChars needle (hay :: tail) || containsChars needle tail

def sourceNliParserUpper (response : String) : Bool :=
  if response.toList.isEmpty then false
  else containsChars "CONTRADICTORY".toList response.toList

theorem error_sentinel_maps_to_false :
    sourceNliParserUpper "[ERROR]" = false := by
  decide

theorem error_sentinel_indistinguishable_from_consistent :
    sourceNliParserUpper "[ERROR]" =
      sourceNliParserUpper "CONSISTENT" := by
  decide

#print axioms checker_view_ignores_question_premise_and_final_answer
#print axioms checker_view_keeps_original_raw_after_revision
#print axioms repair_view_tracks_revised_final_answer
#print axioms repair_view_ignores_current_raw
#print axioms prefix500_depends_only_on_first_500
#print axioms same_checker_view_can_have_different_repair_context
#print axioms archived_projection_does_not_identify_trigger_pair

end HsHVerification.OrsonCGDProjectionGate
