import Mathlib

/-!
# MemOps state projection: an assistant formalization

Source: Xixuan Hao et al., "MemOps: Benchmarking Lifecycle Memory Operations in
Long-Horizon Conversations", arXiv:2607.12893 (2026-07-14), §§3.1-3.2.

The paper defines an operation trace with operation type, target, old value,
new value, and evidence spans; it describes Remember, Update, Forget,
Reflect, and composed TrajectoryOps. It does not provide a formal transition
function. The definitions below are therefore an explicit assistant
reconstruction of the target-local Remember/Update/Forget semantics, not a
formalization supplied by the paper's authors.

Reflect is deliberately excluded: its bounded inference rule is not
deterministically specified in the source. Scope, evidence authenticity,
adjudicator reliability, and real agent behavior are also outside this model.

The result is a method-level finite counterexample, not a physical fixture,
not a ChatGPT Memory policy, and not evidence about any model's empirical
performance.
-/

namespace HsHVerification.MemOpsStateProjection

/-- Two independently addressable memory targets. -/
abbrev State := Option Nat × Option Nat

/-- Read one target from the two-slot state. -/
def readState (s : State) (target : Bool) : Option Nat :=
  if target then s.1 else s.2

/-- Replace exactly one target, leaving the other slot untouched. -/
def writeState (s : State) (target : Bool) (value : Option Nat) : State :=
  if target then (value, s.2) else (s.1, value)

/-- The source-defined operation families modeled in this minimal submodel. -/
inductive Operation where
  | remember (target : Bool) (value : Nat)
  | update (target : Bool) (oldValue newValue : Nat)
  | forget (target : Bool) (oldValue : Nat)
  deriving Repr, DecidableEq

/--
Remember is admissible only when the target is empty.
Update and Forget are admissible only when the recorded old value is current.
These guards make stale-value replacement and scoped forgetting explicit.
-/
def applyOperation (s : State) : Operation → Option State
  | .remember target value =>
      if readState s target = none then
        some (writeState s target (some value))
      else none
  | .update target oldValue newValue =>
      if readState s target = some oldValue then
        some (writeState s target (some newValue))
      else none
  | .forget target oldValue =>
      if readState s target = some oldValue then
        some (writeState s target none)
      else none

/-- Execute an ordered operation history, failing on an invalid transition. -/
def runOperations (s : State) : List Operation → Option State
  | [] => some s
  | operation :: rest =>
      match applyOperation s operation with
      | none => none
      | some next => runOperations next rest

def emptyState : State := (none, none)

def rememberThenForget : List Operation :=
  [.remember true 7, .forget true 7]

/-- A write to one target leaves the other target unchanged. -/
theorem writeState_preserves_other
    (s : State) (target : Bool) (value : Option Nat) :
    readState (writeState s target value) (!target) =
      readState s (!target) := by
  cases target <;> simp [readState, writeState]

/-- A write sets exactly the requested target. -/
theorem writeState_sets_target
    (s : State) (target : Bool) (value : Option Nat) :
    readState (writeState s target value) target = value := by
  cases target <;> simp [readState, writeState]

/-- A valid Update changes its target and preserves the other target. -/
theorem update_transition_preserves_other
    (s : State) (target : Bool) (oldValue newValue : Nat)
    (h : readState s target = some oldValue) :
    ∃ next,
      applyOperation s (.update target oldValue newValue) = some next ∧
      readState next (!target) = readState s (!target) := by
  refine ⟨writeState s target (some newValue), ?_, ?_⟩
  · simp [applyOperation, h]
  · exact writeState_preserves_other s target (some newValue)

/-- A valid Forget removes its target and preserves the other target. -/
theorem forget_transition_preserves_other
    (s : State) (target : Bool) (oldValue : Nat)
    (h : readState s target = some oldValue) :
    ∃ next,
      applyOperation s (.forget target oldValue) = some next ∧
      readState next (!target) = readState s (!target) := by
  refine ⟨writeState s target none, ?_, ?_⟩
  · simp [applyOperation, h]
  · exact writeState_preserves_other s target none

/-- The same final snapshot can result from an empty history or a nonempty one. -/
theorem remember_then_forget_returns_same_snapshot :
    runOperations emptyState rememberThenForget =
      runOperations emptyState [] := by
  simp [runOperations, rememberThenForget, applyOperation,
    readState, writeState, emptyState]

theorem histories_are_distinct : rememberThenForget ≠ [] := by
  simp [rememberThenForget]

/--
The projection from operation histories to final snapshots is not injective:
remembering and then forgetting a value produces the same final state as
never having recorded it.
-/
theorem snapshot_projection_noninjective :
    ∃ h₁ h₂ : List Operation,
      h₁ ≠ h₂ ∧
      runOperations emptyState h₁ = runOperations emptyState h₂ := by
  exact ⟨rememberThenForget, [], histories_are_distinct,
    remember_then_forget_returns_same_snapshot⟩

/--
No function of the final snapshot alone can reconstruct every exact history
in this model. An append-only event ledger carries information that the
current-state projection necessarily discards.
-/
theorem no_snapshot_only_reconstructor :
    ¬ ∃ recover : Option State → List Operation,
      ∀ history : List Operation,
        recover (runOperations emptyState history) = history := by
  rintro ⟨recover, hrecover⟩
  have h1 := hrecover rememberThenForget
  have h2 := hrecover []
  rw [remember_then_forget_returns_same_snapshot] at h1
  exact histories_are_distinct (h1.symm.trans h2)


/-!
## Evidence-span projection

MemOps §3.1 states that each operation trace carries evidence spans grounded
in exact user dialogue turns; §3.2 and §3.3 use those spans for provenance
support and evaluation. The active memory snapshot below still stores only
the target/value pair. This companion type makes the omitted source identity
explicit for Remember without changing the preceding minimal transition model.

This is an assistant reconstruction of the representation boundary, not a
claim that the paper supplies this formal transition function.
-/

/-- A Remember event retains the identity of its supporting evidence span. -/
structure ProvenancedRemember (Span : Type) where
  target : Bool
  value : Nat
  evidenceSpan : Span

/-- The active-state projection applies target/value but omits evidence identity. -/
def applyProvenancedRemember {Span : Type}
    (s : State) (operation : ProvenancedRemember Span) : Option State :=
  if readState s operation.target = none then
    some (writeState s operation.target (some operation.value))
  else none

/--
Distinct supporting spans can yield the same active memory snapshot when
target and value agree. Thus snapshot equality does not establish provenance
equality, even when the remembered value remains active.
-/
theorem distinct_evidence_spans_same_snapshot
    {Span : Type} (s : State) (target : Bool) (value : Nat)
    (span₁ span₂ : Span)
    (h_empty : readState s target = none)
    (h_span : span₁ ≠ span₂) :
    ∃ op₁ op₂ : ProvenancedRemember Span,
      op₁ ≠ op₂ ∧
      applyProvenancedRemember s op₁ =
        applyProvenancedRemember s op₂ := by
  let op₁ : ProvenancedRemember Span := ⟨target, value, span₁⟩
  let op₂ : ProvenancedRemember Span := ⟨target, value, span₂⟩
  refine ⟨op₁, op₂, ?_, ?_⟩
  · intro h
    have h' : span₁ = span₂ := by
      simpa [op₁, op₂] using congrArg ProvenancedRemember.evidenceSpan h
    exact h_span h'
  · simp [op₁, op₂, applyProvenancedRemember, h_empty]

/--
No function of the active snapshot alone can recover every supporting span
in this model. The event/provenance record must remain available separately.
-/
theorem no_snapshot_only_evidence_reconstructor
    {Span : Type} (s : State) (target : Bool) (value : Nat)
    (span₁ span₂ : Span)
    (h_empty : readState s target = none)
    (h_span : span₁ ≠ span₂) :
    ¬ ∃ recover : Option State → Span,
      ∀ operation : ProvenancedRemember Span,
        recover (applyProvenancedRemember s operation) =
          operation.evidenceSpan := by
  rintro ⟨recover, hrecover⟩
  let op₁ : ProvenancedRemember Span := ⟨target, value, span₁⟩
  let op₂ : ProvenancedRemember Span := ⟨target, value, span₂⟩
  have hsame :
      applyProvenancedRemember s op₁ =
        applyProvenancedRemember s op₂ := by
    simp [op₁, op₂, applyProvenancedRemember, h_empty]
  have hspan : span₁ = span₂ := by
    calc
      span₁ = recover (applyProvenancedRemember s op₁) :=
        (hrecover op₁).symm
      _ = recover (applyProvenancedRemember s op₂) :=
        congrArg recover hsame
      _ = span₂ := hrecover op₂
  exact h_span hspan



/-!
## Explicit Update/Forget post-state

The source paper names Update and Forget as lifecycle operations, but does not
supply the deterministic transition function formalized above. These theorems
therefore strengthen only this assistant-reconstructed transition model:
they state the resulting target value/emptiness as well as preservation of
the other target.
-/

/-- A valid Update installs the new target value and preserves the other target. -/
theorem update_transition_poststate
    (s : State) (target : Bool) (oldValue newValue : Nat)
    (h : readState s target = some oldValue) :
    ∃ next,
      applyOperation s (.update target oldValue newValue) = some next ∧
      readState next target = some newValue ∧
      readState next (!target) = readState s (!target) := by
  refine ⟨writeState s target (some newValue), ?_, ?_, ?_⟩
  · simp [applyOperation, h]
  · exact writeState_sets_target s target (some newValue)
  · exact writeState_preserves_other s target (some newValue)

/-- A valid Forget empties the target and preserves the other target. -/
theorem forget_transition_poststate
    (s : State) (target : Bool) (oldValue : Nat)
    (h : readState s target = some oldValue) :
    ∃ next,
      applyOperation s (.forget target oldValue) = some next ∧
      readState next target = none ∧
      readState next (!target) = readState s (!target) := by
  refine ⟨writeState s target none, ?_, ?_, ?_⟩
  · simp [applyOperation, h]
  · exact writeState_sets_target s target none
  · exact writeState_preserves_other s target none

#print axioms update_transition_poststate
#print axioms forget_transition_poststate

#print axioms distinct_evidence_spans_same_snapshot
#print axioms no_snapshot_only_evidence_reconstructor

/- Executable check of the concrete non-injective example. -/
#eval runOperations emptyState rememberThenForget
#eval runOperations emptyState []
#eval (runOperations emptyState rememberThenForget ==
  runOperations emptyState [])

#print axioms writeState_preserves_other
#print axioms update_transition_preserves_other
#print axioms forget_transition_preserves_other
#print axioms snapshot_projection_noninjective
#print axioms no_snapshot_only_reconstructor

end HsHVerification.MemOpsStateProjection
