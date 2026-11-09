import Mathlib

/-!
# Elias Track A: explicit VACATE prerequisite for threaded rejoin

Primary implementation:
Satobloc/HSH_RESOURCES/tools/workflow_threading_demo.py
blob ce313e46b1b85ae35028b46a4196d2a945b535d8, especially ThreadState defaults,
vacate, should_rejoin, mark_rejoin_if_ready, and the six-case self_test.

Companion protocol:
Satobloc/HSH_RESOURCES/info/WORKFLOW_THREADING_PROTOTYPE.md
blob f87ff21918b6fa4804d090cdb9153aa0dd53d288.

The source prototype's ordinary sample path calls vacate() before propagation.
However, ThreadState is publicly constructible with author_state="active",
status="seeded", and vacate_started_at=None, while should_rejoin returns
state_ready OR time_ready and mark_rejoin_if_ready does not require a prior
VACATE state, propagation status, or timestamp. The source self_test exercises
the vacated path but not this active-author or inconsistent-phase edge.

The source-transcribed Python witness and this abstraction are software-state
tests, not physical calculations, observed worker behavior, or a production
patch. This module formalizes a proposed guard only; it does not prove Python
equivalence, worker identity, or actual recurrence behavior.
-/

namespace HsHVerification.EliasThreadingVacateGate

inductive AuthorState where
  | active
  | vacated
  | rejoinReady
  | rejoined
  | blocked
  deriving DecidableEq, Repr

inductive ThreadStatus where
  | seeded
  | propagating
  | rejoinReady
  | complete
  | blocked
  deriving DecidableEq, Repr

structure ThreadingState where
  authorState : AuthorState
  status : ThreadStatus
  vacateStartedAt : Option Nat
  stateThresholdMet : Bool
  timeCapMet : Bool
  deriving DecidableEq, Repr

/-- Abstraction of the source predicate: state threshold OR elapsed-time cap. -/
def sourceReady (s : ThreadingState) : Bool :=
  s.stateThresholdMet || s.timeCapMet

/-- Abstraction of the source transition, which does not inspect VACATE evidence. -/
def sourceMarkRejoin (s : ThreadingState) : ThreadingState :=
  if sourceReady s = true then
    { s with authorState := .rejoinReady, status := .rejoinReady }
  else
    s

def isVacated : AuthorState → Bool
  | .vacated => true
  | _ => false

def isPropagating : ThreadStatus → Bool
  | .propagating => true
  | _ => false

def hasVacateTimestamp (s : ThreadingState) : Bool :=
  match s.vacateStartedAt with
  | some _ => true
  | none => false

/-- Proposed fail-closed contract: require VACATE state, propagation phase,
    recorded start time, and either return condition. -/
def guardedReady (s : ThreadingState) : Bool :=
  isVacated s.authorState &&
  isPropagating s.status &&
  hasVacateTimestamp s &&
  sourceReady s

def guardedMarkRejoin (s : ThreadingState) : ThreadingState :=
  if guardedReady s = true then
    { s with authorState := .rejoinReady, status := .rejoinReady }
  else
    s

/-- Reachable from the source constructor defaults plus a satisfied state threshold. -/
def activeThresholdWitness : ThreadingState :=
  { authorState := .active
    status := .seeded
    vacateStartedAt := none
    stateThresholdMet := true
    timeCapMet := false }

def vacatedThresholdWitness : ThreadingState :=
  { authorState := .vacated
    status := .propagating
    vacateStartedAt := some 0
    stateThresholdMet := true
    timeCapMet := false }

def vacatedTimeCapWitness : ThreadingState :=
  { authorState := .vacated
    status := .propagating
    vacateStartedAt := some 0
    stateThresholdMet := false
    timeCapMet := true }

def vacatedWithoutTimestampWitness : ThreadingState :=
  { authorState := .vacated
    status := .propagating
    vacateStartedAt := none
    stateThresholdMet := true
    timeCapMet := false }

def vacatedInSeededPhaseWitness : ThreadingState :=
  { authorState := .vacated
    status := .seeded
    vacateStartedAt := some 0
    stateThresholdMet := true
    timeCapMet := false }

theorem source_gate_allows_active_author :
    sourceReady activeThresholdWitness = true := by
  decide

theorem source_transition_marks_active_author_rejoin_ready :
    (sourceMarkRejoin activeThresholdWitness).authorState = .rejoinReady ∧
    (sourceMarkRejoin activeThresholdWitness).status = .rejoinReady := by
  decide

theorem guarded_gate_blocks_active_author :
    guardedReady activeThresholdWitness = false := by
  decide

theorem guarded_transition_preserves_active_seeded_author :
    (guardedMarkRejoin activeThresholdWitness).authorState = .active ∧
    (guardedMarkRejoin activeThresholdWitness).status = .seeded := by
  decide

theorem guarded_gate_blocks_vacated_state_without_timestamp :
    guardedReady vacatedWithoutTimestampWitness = false := by
  decide

theorem guarded_gate_blocks_vacated_author_in_seeded_phase :
    guardedReady vacatedInSeededPhaseWitness = false := by
  decide

theorem guarded_gate_allows_vacated_state_threshold :
    guardedReady vacatedThresholdWitness = true := by
  decide

theorem guarded_gate_allows_vacated_time_cap :
    guardedReady vacatedTimeCapWitness = true := by
  decide

theorem guarded_ready_requires_vacate_evidence
    (s : ThreadingState) (h : guardedReady s = true) :
    isVacated s.authorState = true ∧
    isPropagating s.status = true ∧
    hasVacateTimestamp s = true := by
  unfold guardedReady at h
  rcases Bool.and_eq_true.mp h with ⟨hBefore, _⟩
  rcases Bool.and_eq_true.mp hBefore with ⟨hPair, hTime⟩
  rcases Bool.and_eq_true.mp hPair with ⟨hVacated, hPropagating⟩
  exact ⟨hVacated, hPropagating, hTime⟩

#eval sourceReady activeThresholdWitness
#eval guardedReady activeThresholdWitness
#eval guardedReady vacatedThresholdWitness
#eval guardedReady vacatedTimeCapWitness
#eval guardedReady vacatedInSeededPhaseWitness

#print axioms source_gate_allows_active_author
#print axioms source_transition_marks_active_author_rejoin_ready
#print axioms guarded_gate_blocks_active_author
#print axioms guarded_transition_preserves_active_seeded_author
#print axioms guarded_gate_blocks_vacated_state_without_timestamp
#print axioms guarded_gate_blocks_vacated_author_in_seeded_phase
#print axioms guarded_gate_allows_vacated_state_threshold
#print axioms guarded_gate_allows_vacated_time_cap
#print axioms guarded_ready_requires_vacate_evidence

end HsHVerification.EliasThreadingVacateGate
