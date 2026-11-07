import Mathlib

/-!
Elias Kern Track A, 2026-11-01.

PROPOSAL: a typed four-axis receipt-evidence vector. This is not yet an
implementation change to either Python prototype or production workflow.

Source inspection:
- HSH_RESOURCES/tools/workflow_switchboard_demo.py, blob
  49988a769389b2baf264a27d596ba7c3ff822b36: receipt_gate is triggered by
  the temporary_lease event tag and emits verify/restore jobs; it carries
  no typed evidence axes.
- HSH_RESOURCES/tools/workflow_threading_demo.py, blob
  ce313e46b1b85ae35028b46a4196d2a945b535d8: OutputReceipt has worker,
  artifact, seed_version, outcome, timestamp and free-form metadata.
  state_threshold_met reads receipt count, distinct worker strings and
  outcome labels, but not metadata.

Observed source-backed case, 2026-11-01 07:00Z:
- source content read: Nathan's War Room Declaration, blob
  1506a3c8030f446b08990dac88dc45227dfa3463;
- formal proof compiled: PR #951 exact head
  e679d0d179a4d14e746ce628b321d36e67eebf1c, Actions run #41284050443;
- publisher readback: issue #1198 content exactly equals its committed
  PUBLISHED_SUBMISSIONS artifact;
- historical ChatGPT-thread delivery: UNAVAILABLE; no authenticated
  historical Elias thread or cross-thread delivery is claimed.

This module formalizes the typed status separation and that observed vector.
It does not prove the Python implementation, GitHub records, source identity,
worker identity, or production behavior.
-/

namespace HsHVerification.EliasReceiptEvidenceAxes

inductive EvidenceStatus where
  | notChecked
  | verified
  | failed
  | unavailable
  deriving DecidableEq, Repr

structure ReceiptEvidenceAxes where
  sourceContent : EvidenceStatus
  formalProof : EvidenceStatus
  publisherReadback : EvidenceStatus
  historicalChatDelivery : EvidenceStatus
  deriving DecidableEq, Repr

def observed0700 : ReceiptEvidenceAxes :=
  { sourceContent := .verified
    formalProof := .verified
    publisherReadback := .verified
    historicalChatDelivery := .unavailable }

def repositoryEvidenceVerified (r : ReceiptEvidenceAxes) : Prop :=
  r.sourceContent = .verified ∧
  r.formalProof = .verified ∧
  r.publisherReadback = .verified

def endToEndDeliveryVerified (r : ReceiptEvidenceAxes) : Prop :=
  repositoryEvidenceVerified r ∧
  r.historicalChatDelivery = .verified

theorem observed0700_repository_evidence_verified :
    repositoryEvidenceVerified observed0700 := by
  simp [repositoryEvidenceVerified, observed0700]

theorem observed0700_historical_chat_delivery_unavailable :
    observed0700.historicalChatDelivery = .unavailable := rfl

theorem observed0700_repository_verified_but_delivery_unavailable :
    repositoryEvidenceVerified observed0700 ∧
      observed0700.historicalChatDelivery = .unavailable :=
  ⟨observed0700_repository_evidence_verified, rfl⟩

theorem observed0700_not_end_to_end_delivery_verified :
    ¬ endToEndDeliveryVerified observed0700 := by
  simp [endToEndDeliveryVerified, repositoryEvidenceVerified, observed0700]

theorem changing_source_preserves_other_axes
    (r : ReceiptEvidenceAxes) (s : EvidenceStatus) :
    let r' := { r with sourceContent := s }
    r'.formalProof = r.formalProof ∧
      r'.publisherReadback = r.publisherReadback ∧
      r'.historicalChatDelivery = r.historicalChatDelivery := by
  simp

theorem changing_proof_preserves_other_axes
    (r : ReceiptEvidenceAxes) (s : EvidenceStatus) :
    let r' := { r with formalProof := s }
    r'.sourceContent = r.sourceContent ∧
      r'.publisherReadback = r.publisherReadback ∧
      r'.historicalChatDelivery = r.historicalChatDelivery := by
  simp

theorem changing_publisher_readback_preserves_other_axes
    (r : ReceiptEvidenceAxes) (s : EvidenceStatus) :
    let r' := { r with publisherReadback := s }
    r'.sourceContent = r.sourceContent ∧
      r'.formalProof = r.formalProof ∧
      r'.historicalChatDelivery = r.historicalChatDelivery := by
  simp

theorem changing_chat_delivery_preserves_repository_axes
    (r : ReceiptEvidenceAxes) (s : EvidenceStatus) :
    let r' := { r with historicalChatDelivery := s }
    repositoryEvidenceVerified r ↔ repositoryEvidenceVerified r' := by
  simp [repositoryEvidenceVerified]

#print axioms observed0700_repository_evidence_verified
#print axioms observed0700_historical_chat_delivery_unavailable
#print axioms observed0700_repository_verified_but_delivery_unavailable
#print axioms observed0700_not_end_to_end_delivery_verified
#print axioms changing_source_preserves_other_axes
#print axioms changing_proof_preserves_other_axes
#print axioms changing_publisher_readback_preserves_other_axes
#print axioms changing_chat_delivery_preserves_repository_axes

end HsHVerification.EliasReceiptEvidenceAxes
