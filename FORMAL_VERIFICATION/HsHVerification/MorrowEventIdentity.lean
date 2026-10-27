import Mathlib

/-!
# Morrow: cross-graph reported work-item identity loses wrapper origin

Archival input (NOT a claim about present-day runtime):
- HsH DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_7/26.09.07•26.09.08•MORROW
  [Reconstruct H(s)H Synthesis] — raw.json, Git blob
  342b50c3927c3466783b091234647f338990a113, directly parsed.
  It contains Morrow wrappers 09effc0f… (Slack send) and
  426d022d… (Slack edit), with reported work item IDs
  exec-8af6096e-aa90-4785-97fc-82d18307cc86 and
  exec-0164850f-291c-415c-9358-0fc072be4e3e respectively.
- Cross-graph Aldus wrapper identification is sourced from
  WORKSPACES/MORROW/MORROW_ALDUS_CROSS_GRAPH_ROUTING_AUDIT_2026-09-13.md,
  blob ee5ed4a2056e973d4a2e9df2e8c687bc2a697b27,
  itself grounded in the Aldus raw snapshot
  2f5ea91a449446f64d298b50b0c2ef0d8533900a.
  That large Aldus raw file was NOT directly retrieved this run.

The four constructors encode record wrappers, not four independently
executed external Slack side effects. ReportedWorkId is an archival
metadata field; equality of its values alone cannot identify wrapper
origin or count external executions. The formalization deliberately
does not assume a single external execution or any cross-chat access.
-/

namespace HsHVerification.MorrowEventIdentity

inductive Wrapper where
  | morrowSend
  | aldusSend
  | morrowEdit
  | aldusEdit
  deriving DecidableEq, Repr

inductive ReportedWorkId where
  | sendWorkItem
  | editWorkItem
  deriving DecidableEq, Repr

/-- Historical reported ID projection, transcribed from two archived
cross-graph record pairs; this is NOT an external execution log. -/
def reportedId : Wrapper → ReportedWorkId
  | .morrowSend => .sendWorkItem
  | .aldusSend => .sendWorkItem
  | .morrowEdit => .editWorkItem
  | .aldusEdit => .editWorkItem

/-- The wrappers are different even though their recorded work-item ID
is the same. -/
theorem distinct_send_wrappers : Wrapper.morrowSend ≠ Wrapper.aldusSend := by
  decide

theorem same_send_reported_id :
    reportedId .morrowSend = reportedId .aldusSend := rfl

theorem same_edit_reported_id :
    reportedId .morrowEdit = reportedId .aldusEdit := rfl

/-- The ID projection loses information about which conversation
wrapper contains a record. -/
theorem reported_id_not_injective : ¬ Function.Injective reportedId := by
  intro h
  have impossible : Wrapper.morrowSend = Wrapper.aldusSend :=
    h same_send_reported_id
  exact distinct_send_wrappers impossible

/-- No function reading only a reported work-item ID can recover
every original conversation wrapper. -/
theorem no_wrapper_recovery_from_id (decode : ReportedWorkId → Wrapper) :
    ¬ (∀ w : Wrapper, decode (reportedId w) = w) := by
  intro h
  have hm := h Wrapper.morrowSend
  have ha := h Wrapper.aldusSend
  have impossible : Wrapper.morrowSend = Wrapper.aldusSend := by
    calc
      Wrapper.morrowSend = decode .sendWorkItem := hm.symm
      _ = Wrapper.aldusSend := ha
  exact distinct_send_wrappers impossible

#print axioms distinct_send_wrappers
#print axioms same_send_reported_id
#print axioms same_edit_reported_id
#print axioms reported_id_not_injective
#print axioms no_wrapper_recovery_from_id

end HsHVerification.MorrowEventIdentity
