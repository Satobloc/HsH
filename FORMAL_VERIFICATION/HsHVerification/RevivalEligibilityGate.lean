import Mathlib

/-!
Finite-state formalization of the fail-closed eligibility contract in
Satobloc/HsH PR #1533, branch
research/revrot3-quarantine-eligibility-20261109t1536z,
tools/audit_revival_rotation_v3.py, commit
1b0a94b24303f6d36d677061270a5fd2e368f3f5, Git blob
4382e2cf051b170853bf01a91f5305cc8e84fc22.

This models only:
* missing-status rejection when other eligibility fields are declared;
* rejection of an unknown status token;
* schema-v2 strict Boolean parsing versus legacy token parsing; and
* the declared access invariants for CLEAR, OPERATIONAL_ONLY_CLEARANCE,
  QUARANTINE_HOLD, NO_ACCESS and MANUAL_REENTRY_REQUIRED.

Translation limits:
* Python strings are manually abstracted into the finite token types below.
* "NONE" and "NO_PAYLOAD" are represented by PayloadClass.noPayload.
* This is not a proof that the Python implementation refines this model,
  not a repository-permission enforcement proof, and not evidence that a
  selected worker actually received or obeyed an access restriction.
-/

namespace HsHVerification.RevivalEligibilityGate

inductive StatusToken where
  | clear
  | operationalOnlyClearance
  | quarantineHold
  | noAccess
  | manualReentryRequired
  | unknown
deriving DecidableEq, Repr

/-- A missing status is tolerated only for a record with no eligibility fields.
    Unknown explicit statuses are rejected. -/
def declarationAccepted (status : Option StatusToken)
    (hasOtherEligibilityFields : Bool) : Bool :=
  match status with
  | none => !hasOtherEligibilityFields
  | some .unknown => false
  | some _ => true

theorem legacy_empty_declaration_is_preserved :
    declarationAccepted (none : Option StatusToken) false = true := by
  rfl

theorem partial_declaration_is_rejected :
    declarationAccepted (none : Option StatusToken) true = false := by
  rfl

theorem unknown_status_is_rejected :
    declarationAccepted (some StatusToken.unknown) false = false := by
  rfl

inductive BoolToken where
  | trueToken
  | falseToken
  | yes
  | no
  | one
  | zero
  | other
deriving DecidableEq, Repr

/-- Schema v2 accepts only true/false. Legacy schema also accepts yes/no/1/0.
    Malformed tokens return none and are never coerced to false. -/
def parseBoolean (strictV2 : Bool) : BoolToken → Option Bool
  | .trueToken => some true
  | .falseToken => some false
  | .yes => if strictV2 then none else some true
  | .no => if strictV2 then none else some false
  | .one => if strictV2 then none else some true
  | .zero => if strictV2 then none else some false
  | .other => none

theorem malformed_boolean_is_not_false (strictV2 : Bool) :
    parseBoolean strictV2 .other ≠ some false := by
  cases strictV2 <;> simp [parseBoolean]

theorem schema_v2_rejects_legacy_yes :
    parseBoolean true .yes = none := by
  rfl

theorem legacy_schema_accepts_yes :
    parseBoolean false .yes = some true := by
  rfl

inductive PayloadClass where
  | noPayload
  | operationalOnly
  | research
deriving DecidableEq, Repr

structure AccessRecord where
  status : StatusToken
  payload : PayloadClass
  privateMaterialAccessed : Bool
  inboxWrite : Bool
  countsAsMiss : Bool
deriving Repr

/-- Abstract access policy enforced by the current validator.
    CLEAR is intentionally permissive at this policy layer; token validity
    is handled separately by parseBoolean. -/
def accessInvariant (r : AccessRecord) : Prop :=
  match r.status with
  | .clear => True
  | .operationalOnlyClearance =>
      (r.payload = .noPayload ∨ r.payload = .operationalOnly) ∧
      r.privateMaterialAccessed = false ∧
      (r.inboxWrite = true → r.payload = .operationalOnly) ∧
      r.countsAsMiss = false
  | .quarantineHold | .noAccess | .manualReentryRequired =>
      r.payload = .noPayload ∧
      r.privateMaterialAccessed = false ∧
      r.inboxWrite = false ∧
      r.countsAsMiss = false
  | .unknown => False

theorem quarantine_hold_blocks_payload_private_access_inbox_and_miss
    (r : AccessRecord)
    (hStatus : r.status = .quarantineHold)
    (hInvariant : accessInvariant r) :
    r.payload = .noPayload ∧
    r.privateMaterialAccessed = false ∧
    r.inboxWrite = false ∧
    r.countsAsMiss = false := by
  cases h : r.status with
  | clear => simp [h] at hStatus
  | operationalOnlyClearance => simp [h] at hStatus
  | quarantineHold => simpa [accessInvariant, h] using hInvariant
  | noAccess => simp [h] at hStatus
  | manualReentryRequired => simp [h] at hStatus
  | unknown => simp [h] at hStatus

theorem operational_only_clearance_restricts_private_access_and_miss
    (r : AccessRecord)
    (hStatus : r.status = .operationalOnlyClearance)
    (hInvariant : accessInvariant r) :
    r.privateMaterialAccessed = false ∧
    r.countsAsMiss = false ∧
    (r.inboxWrite = true → r.payload = .operationalOnly) := by
  cases h : r.status with
  | clear => simp [h] at hStatus
  | operationalOnlyClearance =>
      have hPolicy :
          (r.payload = .noPayload ∨ r.payload = .operationalOnly) ∧
          r.privateMaterialAccessed = false ∧
          (r.inboxWrite = true → r.payload = .operationalOnly) ∧
          r.countsAsMiss = false := by
        simpa [accessInvariant, h] using hInvariant
      rcases hPolicy with ⟨_, hPrivate, hInbox, hMiss⟩
      exact ⟨hPrivate, hMiss, hInbox⟩
  | quarantineHold => simp [h] at hStatus
  | noAccess => simp [h] at hStatus
  | manualReentryRequired => simp [h] at hStatus
  | unknown => simp [h] at hStatus

theorem unknown_status_is_never_admissible (r : AccessRecord)
    (hStatus : r.status = .unknown) : ¬ accessInvariant r := by
  simp [accessInvariant, hStatus]

#eval declarationAccepted (none : Option StatusToken) true
#eval declarationAccepted (none : Option StatusToken) false
#eval declarationAccepted (some StatusToken.unknown) false
#eval parseBoolean true .other
#eval parseBoolean true .falseToken

#print axioms partial_declaration_is_rejected
#print axioms malformed_boolean_is_not_false
#print axioms quarantine_hold_blocks_payload_private_access_inbox_and_miss
#print axioms operational_only_clearance_restricts_private_access_and_miss

end HsHVerification.RevivalEligibilityGate
