import Mathlib

/-!
Loom's source-chronology gate, 2026-11-13.

The source record retains subject, event kind, source-object identity,
representation identity, clock domain, and a time interval. The formal
relation is deliberately conservative: only events in the same declared
clock domain can be ordered, and one interval is definitely before another
only when its upper bound is strictly earlier than the other's lower bound.

A first-event claim is scoped to one subject and one event kind. It also
requires all compared events to share the candidate's clock domain. A
complete-coverage certificate is relative to a declared corpus; it is not
a proof that the declared corpus is the entire universe of possible sources.
-/

namespace HsHTemporalEvidence.LoomTemporalProvenanceOrder

inductive EventKind where
  | sourceMessageCreated
  | sourceFileCreated
  | repositoryIngested
  | publiclyReleased
  | collectionIndexed
  | retrievedByAudit
  | predictionFrozen
  | predictionRegistered
  | measurementAcquired
  | holdoutOpened
  | analysisStarted
  | resultPublished
  | schedulerSnapshotObserved
  deriving DecidableEq, Repr

structure TimeInterval where
  lower : Nat
  upper : Nat
  deriving DecidableEq, Repr

structure TimedEvent where
  eventId : Nat
  subjectId : Nat
  sourceObjectId : Nat
  representationId : Nat
  kind : EventKind
  clockDomain : Nat
  time : TimeInterval
  deriving DecidableEq, Repr

/-- Strict temporal precedence, only within one declared clock domain. -/
def definitelyBefore (a b : TimedEvent) : Prop :=
  a.clockDomain = b.clockDomain ∧
  a.time.lower ≤ a.time.upper ∧
  b.time.lower ≤ b.time.upper ∧
  a.time.upper < b.time.lower

theorem definitelyBefore_irrefl (a : TimedEvent) :
    ¬ definitelyBefore a a := by
  intro h
  change a.clockDomain = a.clockDomain ∧
    a.time.lower ≤ a.time.upper ∧
    a.time.lower ≤ a.time.upper ∧
    a.time.upper < a.time.lower at h
  omega

theorem definitelyBefore_trans {a b c : TimedEvent}
    (hab : definitelyBefore a b)
    (hbc : definitelyBefore b c) :
    definitelyBefore a c := by
  rcases hab with ⟨hclockAB, hAvalid, hBvalid, hAB⟩
  rcases hbc with ⟨hclockBC, hBvalid', hCvalid, hBC⟩
  refine ⟨hclockAB.trans hclockBC, hAvalid, hCvalid, ?_⟩
  omega

theorem definitelyBefore_asymm {a b : TimedEvent}
    (hab : definitelyBefore a b) :
    ¬ definitelyBefore b a := by
  intro hba
  rcases hab with ⟨_, hAvalid, hBvalid, hAB⟩
  rcases hba with ⟨_, hBvalid', hAvalid', hBA⟩
  omega

theorem different_clock_domains_incomparable {a b : TimedEvent}
    (h : a.clockDomain ≠ b.clockDomain) :
    ¬ definitelyBefore a b ∧ ¬ definitelyBefore b a := by
  constructor
  · intro hab
    exact h hab.1
  · intro hba
    exact h hba.1.symm

theorem overlapping_intervals_unordered {a b : TimedEvent}
    (hAvalid : a.time.lower ≤ a.time.upper)
    (hBvalid : b.time.lower ≤ b.time.upper)
    (hAtoB : a.time.lower ≤ b.time.upper)
    (hBtoA : b.time.lower ≤ a.time.upper) :
    ¬ definitelyBefore a b ∧ ¬ definitelyBefore b a := by
  constructor
  · intro hab
    have hAB : a.time.upper < b.time.lower := hab.2.2.2
    omega
  · intro hba
    have hBA : b.time.upper < a.time.lower := hba.2.2.2
    omega

theorem separated_intervals_order_if_clock_shared {a b : TimedEvent}
    (hClock : a.clockDomain = b.clockDomain)
    (hAvalid : a.time.lower ≤ a.time.upper)
    (hBvalid : b.time.lower ≤ b.time.upper)
    (hSeparated : a.time.upper < b.time.lower) :
    definitelyBefore a b :=
  ⟨hClock, hAvalid, hBvalid, hSeparated⟩

def sameClaimScope (a b : TimedEvent) : Prop :=
  a.subjectId = b.subjectId ∧ a.kind = b.kind

/-- A first claim requires one subject, one event kind, and comparable clocks. -/
def FirstIn (events : Finset TimedEvent) (candidate : TimedEvent) : Prop :=
  candidate ∈ events ∧
  (∀ other, other ∈ events →
    sameClaimScope other candidate ∧
    other.clockDomain = candidate.clockDomain) ∧
  (∀ other, other ∈ events → ¬ definitelyBefore other candidate)

structure ScopedCorpus where
  observed : Finset TimedEvent
  declaredScope : Finset TimedEvent
  observed_subset : observed ⊆ declaredScope
  coverageComplete : Prop
  complete_certificate : coverageComplete → observed = declaredScope

/-- Completeness is necessary to transfer "first observed" to "first in the
    declared corpus." The theorem says nothing about sources outside that
    declared corpus. -/
theorem observed_first_transfers_to_declared_scope
    (corpus : ScopedCorpus)
    (hcomplete : corpus.coverageComplete)
    (candidate : TimedEvent)
    (hfirst : FirstIn corpus.observed candidate) :
    FirstIn corpus.declaredScope candidate := by
  have hEq : corpus.observed = corpus.declaredScope :=
    corpus.complete_certificate hcomplete
  rw [← hEq]
  exact hfirst

def candidateEvent : TimedEvent :=
  ⟨1, 7, 11, 101, .publiclyReleased, 0, ⟨5, 5⟩⟩

def hiddenEarlierEvent : TimedEvent :=
  ⟨2, 7, 12, 102, .publiclyReleased, 0, ⟨3, 3⟩⟩

def observedEvents : Finset TimedEvent := {candidateEvent}

def declaredEvents : Finset TimedEvent := {candidateEvent, hiddenEarlierEvent}

/-- Pure logical counterexample, not a physical fixture or empirical dataset:
    the first event in an incomplete observed subset need not be first in
    the larger declared corpus. -/
theorem incomplete_coverage_counterexample :
    observedEvents ⊆ declaredEvents ∧
    observedEvents ≠ declaredEvents ∧
    FirstIn observedEvents candidateEvent ∧
    ¬ FirstIn declaredEvents candidateEvent := by
  constructor
  · intro e he
    have heq : e = candidateEvent := by
      simpa [observedEvents] using he
    subst e
    simp [declaredEvents]
  constructor
  · intro hEq
    have hmem : hiddenEarlierEvent ∈ declaredEvents := by simp [declaredEvents]
    rw [← hEq] at hmem
    simpa [observedEvents, hiddenEarlierEvent, candidateEvent] using hmem
  constructor
  · constructor
    · simp [observedEvents]
    · constructor
      · intro other hmem
        have heq : other = candidateEvent := by
          simpa [observedEvents] using hmem
        subst other
        simp [sameClaimScope, candidateEvent]
      · intro other hmem
        have heq : other = candidateEvent := by
          simpa [observedEvents] using hmem
        subst other
        exact definitelyBefore_irrefl candidateEvent
  · intro hfirst
    have hmem : hiddenEarlierEvent ∈ declaredEvents := by simp [declaredEvents]
    have hbefore : definitelyBefore hiddenEarlierEvent candidateEvent := by
      simp [definitelyBefore, hiddenEarlierEvent, candidateEvent]
    exact hfirst.2.2 hiddenEarlierEvent hmem hbefore

#print axioms definitelyBefore_irrefl
#print axioms definitelyBefore_trans
#print axioms definitelyBefore_asymm
#print axioms different_clock_domains_incomparable
#print axioms overlapping_intervals_unordered
#print axioms separated_intervals_order_if_clock_shared
#print axioms observed_first_transfers_to_declared_scope
#print axioms incomplete_coverage_counterexample

end HsHTemporalEvidence.LoomTemporalProvenanceOrder
