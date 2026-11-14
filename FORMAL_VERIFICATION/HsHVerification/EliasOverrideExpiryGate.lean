import Mathlib

/-!
# Elias Track A: executable expiry and scope contract for bounded overrides

Primary implementation inspected:
Satobloc/HSH_RESOURCES/tools/workflow_switchboard_demo.py
Git blob 49988a769389b2baf264a27d596ba7c3ff822b36, lines 242-248.

The source's override_rules method checks that purpose, expires_after, and
note keys exist, then emits those values as strings. It does not validate
the expiry value, bind it to an actor/locale/operation, or compare it with
a clock/turn. The POC's locker_override scenario is not among the seven
built-in self-test predicates.

This module specifies a proposed typed contract. It does NOT prove the
Python source is equivalent to this model, does not change the POC, and
does not confer production authority. The time coordinate is an abstract
monotone turn/quantum index, not wall-clock measurement.

The previous sample proofs attempted to decide String nonemptiness/equality
as a whole proposition. The executable sample is now separated into a Bool
projection, while the general scope contract remains Prop-based. This avoids
claiming a computable Decidable instance for the entire String-bearing Prop.
-/

namespace HsHVerification.EliasOverrideExpiryGate

structure OverrideLease where
  actor : String
  locale : String
  operation : String
  purpose : String
  note : String
  issuedAt : Nat
  expiresAt : Nat
  deriving DecidableEq, Repr

/-- Required fields and a nonempty, forward expiry interval. -/
def wellFormed (o : OverrideLease) : Prop :=
  0 < o.actor.length ∧
  0 < o.locale.length ∧
  0 < o.operation.length ∧
  0 < o.purpose.length ∧
  0 < o.note.length ∧
  o.issuedAt < o.expiresAt

/-- An override applies only to its exact actor, locale and operation,
    and only during the half-open interval [issuedAt, expiresAt). -/
def activeFor (o : OverrideLease)
    (actor locale operation : String) (now : Nat) : Prop :=
  wellFormed o ∧
  o.actor = actor ∧
  o.locale = locale ∧
  o.operation = operation ∧
  o.issuedAt ≤ now ∧
  now < o.expiresAt

theorem expired_override_cannot_apply
    (o : OverrideLease) (actor locale operation : String) (now : Nat)
    (h : o.expiresAt ≤ now) :
    ¬ activeFor o actor locale operation now := by
  intro ha
  exact (not_lt_of_ge h) ha.2.2.2.2.2

theorem future_override_cannot_apply
    (o : OverrideLease) (actor locale operation : String) (now : Nat)
    (h : now < o.issuedAt) :
    ¬ activeFor o actor locale operation now := by
  intro ha
  exact (not_le_of_gt h) ha.2.2.2.2.1

theorem wrong_actor_cannot_apply
    (o : OverrideLease) (actor locale operation : String) (now : Nat)
    (h : o.actor ≠ actor) :
    ¬ activeFor o actor locale operation now := by
  intro ha
  exact h ha.2.1

theorem wrong_locale_cannot_apply
    (o : OverrideLease) (actor locale operation : String) (now : Nat)
    (h : o.locale ≠ locale) :
    ¬ activeFor o actor locale operation now := by
  intro ha
  exact h ha.2.2.1

theorem wrong_operation_cannot_apply
    (o : OverrideLease) (actor locale operation : String) (now : Nat)
    (h : o.operation ≠ operation) :
    ¬ activeFor o actor locale operation now := by
  intro ha
  exact h ha.2.2.2.1

theorem zero_or_reversed_window_cannot_apply
    (o : OverrideLease) (actor locale operation : String) (now : Nat)
    (h : o.expiresAt ≤ o.issuedAt) :
    ¬ activeFor o actor locale operation now := by
  intro ha
  exact (not_lt_of_ge h) ha.1.2.2.2.2.2

theorem active_override_preserves_scope_and_time_bounds
    (o : OverrideLease) (actor locale operation : String) (now : Nat)
    (h : activeFor o actor locale operation now) :
    o.actor = actor ∧
    o.locale = locale ∧
    o.operation = operation ∧
    o.issuedAt ≤ now ∧
    now < o.expiresAt := by
  exact ⟨h.2.1, h.2.2.1, h.2.2.2.1, h.2.2.2.2.1, h.2.2.2.2.2⟩

/-- A one-quantum example: active at turn 10, expired at turn 11. -/
def sampleOneQuantum : OverrideLease :=
  { actor := "Elias Kern"
    locale := "epistemic_locker"
    operation := "alternate-interpretation-check"
    purpose := "compare an alternate interpretation"
    note := "return to ordinary interpretation after one quantum"
    issuedAt := 10
    expiresAt := 11 }

/-- Executable Boolean shadow for the concrete sample; the general Prop contract
    above remains the theorem-facing interface. -/
def nonemptyStringB (s : String) : Bool :=
  s.length != 0

def activeForB (o : OverrideLease)
    (actor locale operation : String) (now : Nat) : Bool :=
  nonemptyStringB o.actor &&
  nonemptyStringB o.locale &&
  nonemptyStringB o.operation &&
  nonemptyStringB o.purpose &&
  nonemptyStringB o.note &&
  decide (o.issuedAt < o.expiresAt) &&
  (o.actor == actor) &&
  (o.locale == locale) &&
  (o.operation == operation) &&
  decide (o.issuedAt ≤ now) &&
  decide (now < o.expiresAt)

theorem sample_active_at_issue :
    activeFor sampleOneQuantum "Elias Kern" "epistemic_locker"
      "alternate-interpretation-check" 10 := by
  unfold activeFor
  constructor
  · unfold wellFormed
    constructor <;> decide
  · constructor
    · rfl
    · constructor
      · rfl
      · constructor
        · rfl
        · constructor <;> decide

theorem sample_inactive_at_expiry :
    ¬ activeFor sampleOneQuantum "Elias Kern" "epistemic_locker"
      "alternate-interpretation-check" 11 := by
  simp [activeFor, wellFormed, sampleOneQuantum]

theorem sample_active_bool_at_issue :
    activeForB sampleOneQuantum "Elias Kern" "epistemic_locker"
      "alternate-interpretation-check" 10 = true := by
  decide

theorem sample_inactive_bool_at_expiry :
    activeForB sampleOneQuantum "Elias Kern" "epistemic_locker"
      "alternate-interpretation-check" 11 = false := by
  decide

#eval activeForB sampleOneQuantum "Elias Kern" "epistemic_locker"
  "alternate-interpretation-check" 10
#eval activeForB sampleOneQuantum "Elias Kern" "epistemic_locker"
  "alternate-interpretation-check" 11

#print axioms expired_override_cannot_apply
#print axioms future_override_cannot_apply
#print axioms wrong_actor_cannot_apply
#print axioms wrong_locale_cannot_apply
#print axioms wrong_operation_cannot_apply
#print axioms zero_or_reversed_window_cannot_apply
#print axioms active_override_preserves_scope_and_time_bounds
#print axioms sample_active_at_issue
#print axioms sample_inactive_at_expiry
#print axioms sample_active_bool_at_issue
#print axioms sample_inactive_bool_at_expiry

end HsHVerification.EliasOverrideExpiryGate
