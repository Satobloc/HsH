import Mathlib

/-!
Proposed formalization of the payload-clearance decision-reference contract
recorded in the public operational issues HsH #2589 and #2714.

This module is a conditional metadata contract, not an adopted policy,
security boundary, permission check, or record of an actual transfer.
The authorized-authority set is an explicit input. In the current issue
record that set is UNDEFINED, so the formal contract rejects every
payload transfer until a governing policy supplies it.

The model compares declared identifiers. It does not hash bytes, authenticate
sender/recipient identities, establish the truth of a payload classification,
verify GitHub permissions, or prove that a delivery occurred.
-/

namespace HsHVerification.PayloadClearanceDecisionClosure

inductive PayloadClass where
  | none
  | operationalOnly
  | research
  | mixed
  | unknown
deriving DecidableEq, Repr

inductive ClearanceStatus where
  | approved
  | rejected
  | unreviewed
deriving DecidableEq, Repr

inductive DeliveryState where
  | notSent
  | sent
  | consumed
  | acknowledged
deriving DecidableEq, Repr

structure PayloadEnvelope where
  decisionRef : Option String
  payloadHash : Option String
  classification : PayloadClass
  sender : String
  recipient : String
  destination : Option String
  policyBlobShas : List String
deriving Repr

structure ClearanceDecision where
  id : String
  payloadHash : Option String
  classification : PayloadClass
  sender : String
  recipient : String
  destination : Option String
  policyBlobShas : List String
  status : ClearanceStatus
  authority : String
deriving Repr

structure RoutedPayload where
  envelope : PayloadEnvelope
  decision : ClearanceDecision
  delivery : DeliveryState
deriving Repr

/-- The proposed NONE case has no payload bytes, decision reference,
    destination, or policy-routing claim. -/
def noPayloadStateValid (e : PayloadEnvelope) : Prop :=
  e.classification = .none ∧
  e.payloadHash = none ∧
  e.decisionRef = none ∧
  e.destination = none ∧
  e.policyBlobShas = []

/-- A nonempty operational payload must carry every required locator and
    a nonempty set of exact policy-source blob identifiers. -/
def payloadFieldsComplete (e : PayloadEnvelope) : Prop :=
  (∃ h, e.payloadHash = some h) ∧
  (∃ r, e.decisionRef = some r) ∧
  (∃ d, e.destination = some d) ∧
  e.policyBlobShas ≠ []

/-- Exact envelope-to-decision referential closure. Equality of declared
    fields is checked; semantic truth and authentication are external. -/
def decisionMatches (e : PayloadEnvelope) (d : ClearanceDecision) : Prop :=
  e.decisionRef = some d.id ∧
  e.payloadHash = d.payloadHash ∧
  e.classification = d.classification ∧
  e.sender = d.sender ∧
  e.recipient = d.recipient ∧
  e.destination = d.destination ∧
  e.policyBlobShas = d.policyBlobShas

/-- None means the policy-authorized set has not been defined.
    A defined empty set authorizes nobody. -/
def authorityAllowed (authorities : Option (Finset String))
    (authority : String) : Prop :=
  match authorities with
  | none => False
  | some members => authority ∈ members

/-- Conditional admission across the quarantined boundary.
    Only OPERATIONAL_ONLY payloads can be transferred; all envelope fields
    must match an approved immutable decision, and its authority must belong
    to the policy-supplied allowlist. -/
def quarantinedPayloadTransferAdmissible
    (authorities : Option (Finset String))
    (e : PayloadEnvelope) (d : ClearanceDecision) : Prop :=
  e.classification = .operationalOnly ∧
  payloadFieldsComplete e ∧
  decisionMatches e d ∧
  d.status = .approved ∧
  authorityAllowed authorities d.authority

theorem admitted_fields_are_bound
    (authorities : Option (Finset String))
    (e : PayloadEnvelope) (d : ClearanceDecision)
    (h : quarantinedPayloadTransferAdmissible authorities e d) :
    e.decisionRef = some d.id ∧
    e.payloadHash = d.payloadHash ∧
    e.classification = d.classification ∧
    e.sender = d.sender ∧
    e.recipient = d.recipient ∧
    e.destination = d.destination ∧
    e.policyBlobShas = d.policyBlobShas ∧
    d.status = .approved := by
  rcases h with ⟨_, _, hMatches, hApproved, _⟩
  rcases hMatches with ⟨hRef, hHash, hClass, hSender, hRecipient, hDestination, hPolicies⟩
  exact ⟨hRef, hHash, hClass, hSender, hRecipient, hDestination, hPolicies, hApproved⟩

/-- The unresolved authority set is fail-closed: no transfer is admissible. -/
theorem undefined_authority_set_rejects
    (e : PayloadEnvelope) (d : ClearanceDecision) :
    ¬ quarantinedPayloadTransferAdmissible none e d := by
  intro h
  rcases h with ⟨_, _, _, _, hAuthority⟩
  exact hAuthority

/-- A defined but empty authority set also authorizes no transfer. -/
theorem empty_authority_set_rejects
    (e : PayloadEnvelope) (d : ClearanceDecision) :
    ¬ quarantinedPayloadTransferAdmissible
      (some (∅ : Finset String)) e d := by
  intro h
  rcases h with ⟨_, _, _, _, hAuthority⟩
  simp [authorityAllowed] at hAuthority

theorem nonapproved_decision_rejects
    (authorities : Option (Finset String))
    (e : PayloadEnvelope) (d : ClearanceDecision)
    (hStatus : d.status ≠ .approved) :
    ¬ quarantinedPayloadTransferAdmissible authorities e d := by
  intro h
  rcases h with ⟨_, _, _, hApproved, _⟩
  exact hStatus hApproved

theorem payload_hash_mismatch_rejects
    (authorities : Option (Finset String))
    (e : PayloadEnvelope) (d : ClearanceDecision)
    (hMismatch : e.payloadHash ≠ d.payloadHash) :
    ¬ quarantinedPayloadTransferAdmissible authorities e d := by
  intro h
  rcases h with ⟨_, _, hMatches, _, _⟩
  rcases hMatches with ⟨_, hHash, _, _, _, _, _⟩
  exact hMismatch hHash

theorem policy_set_mismatch_rejects
    (authorities : Option (Finset String))
    (e : PayloadEnvelope) (d : ClearanceDecision)
    (hMismatch : e.policyBlobShas ≠ d.policyBlobShas) :
    ¬ quarantinedPayloadTransferAdmissible authorities e d := by
  intro h
  rcases h with ⟨_, _, hMatches, _, _⟩
  rcases hMatches with ⟨_, _, _, _, _, _, hPolicies⟩
  exact hMismatch hPolicies

theorem no_payload_has_no_digest_reference_destination_or_policy
    (e : PayloadEnvelope) (h : noPayloadStateValid e) :
    e.payloadHash = none ∧
    e.decisionRef = none ∧
    e.destination = none ∧
    e.policyBlobShas = [] := by
  rcases h with ⟨_, hHash, hReference, hDestination, hPolicies⟩
  exact ⟨hHash, hReference, hDestination, hPolicies⟩

/-- Delivery is a separate state variable; changing it cannot change
    whether the envelope and decision satisfy the clearance contract. -/
def routedPayloadAdmissible
    (authorities : Option (Finset String)) (r : RoutedPayload) : Prop :=
  quarantinedPayloadTransferAdmissible authorities r.envelope r.decision

theorem delivery_state_does_not_change_clearance
    (authorities : Option (Finset String))
    (r : RoutedPayload) (state : DeliveryState) :
    routedPayloadAdmissible authorities { r with delivery := state } =
    routedPayloadAdmissible authorities r := by
  rfl

theorem admitted_transfer_can_remain_unsent
    (authorities : Option (Finset String))
    (r : RoutedPayload)
    (h : routedPayloadAdmissible authorities r) :
    routedPayloadAdmissible authorities { r with delivery := .notSent } ∧
    ({ r with delivery := .notSent }.delivery = .notSent) := by
  exact ⟨h, rfl⟩

#print axioms admitted_fields_are_bound
#print axioms undefined_authority_set_rejects
#print axioms empty_authority_set_rejects
#print axioms payload_hash_mismatch_rejects
#print axioms delivery_state_does_not_change_clearance

end HsHVerification.PayloadClearanceDecisionClosure
