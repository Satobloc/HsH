import HsHVerification.RevivalEligibilityGate

namespace HsHVerification.RevivalEligibilityGateCI

open HsHVerification.RevivalEligibilityGate

/-- Pure software-policy fixture: a quarantined identity has no routed payload
    and no private-material, inbox-write, or missed-check-in activity. -/
def quarantineProbe : AccessRecord :=
  { status := .quarantineHold
    payload := .noPayload
    privateMaterialAccessed := false
    inboxWrite := false
    countsAsMiss := false }

theorem quarantineProbe_is_admissible :
    accessInvariant quarantineProbe := by
  rfl

theorem quarantineProbe_is_fully_restricted :
    quarantineProbe.payload = .noPayload ∧
    quarantineProbe.privateMaterialAccessed = false ∧
    quarantineProbe.inboxWrite = false ∧
    quarantineProbe.countsAsMiss = false := by
  exact quarantine_hold_blocks_payload_private_access_inbox_and_miss
    quarantineProbe rfl quarantineProbe_is_admissible

/-- Operational-only handling may write only an operational-only payload,
    and cannot read private material or count as a missed invitation. -/
def operationalProbe : AccessRecord :=
  { status := .operationalOnlyClearance
    payload := .operationalOnly
    privateMaterialAccessed := false
    inboxWrite := true
    countsAsMiss := false }

theorem operationalProbe_is_admissible :
    accessInvariant operationalProbe := by
  simp [accessInvariant, operationalProbe]

theorem operationalProbe_obeys_operational_only_contract :
    operationalProbe.privateMaterialAccessed = false ∧
    operationalProbe.countsAsMiss = false ∧
    (operationalProbe.inboxWrite = true →
      operationalProbe.payload = .operationalOnly) := by
  exact operational_only_clearance_restricts_private_access_and_miss
    operationalProbe rfl operationalProbe_is_admissible

#eval declarationAccepted (none : Option StatusToken) true
#eval declarationAccepted (none : Option StatusToken) false
#eval parseBoolean true .other
#eval parseBoolean false .yes
#eval parseBoolean true .yes
#eval parseBoolean false .one

#print axioms quarantineProbe_is_fully_restricted
#print axioms operationalProbe_obeys_operational_only_contract

end HsHVerification.RevivalEligibilityGateCI
