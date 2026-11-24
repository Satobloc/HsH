import Mathlib

/-!
# Evidence-item identity and disclosure-flow kernel (assistant reconstruction)

Source basis: Zhang et al., "Multi-Agent Memory Inconsistency: Where Factual
Conflicts Disappear in LLM Agents", arXiv:2611.22245 (submitted 2026-11-17),
especially §§3.3–3.4 and 4.3–4.4.

The model separates:
* evidence-item identity from disclosure-event identity;
* declared source-root overlap from any statistical-independence claim;
* source reads, worker reports, lead evidence, and final-report presence;
* Same/Split contributor classification from semantic judgment.

The finite witnesses are logical counterexamples only. They are not model
outputs, measured data, or a reproduction of the paper's experiment. This
module does not implement the paper's full profiler, its matcher, its judge,
or its statistical analysis. It does not amend the frozen P1 protocol.
-/

namespace HsHVerification.OrsonEvidenceFlow

inductive FlowStage where
  | sourceReads
  | workerReports
  | leadEvidence
  | finalReport
  deriving DecidableEq, Repr

structure EvidenceItem where
  itemId : Nat
  sourceRoots : Finset Nat
  deriving DecidableEq

structure EvidencePair where
  pairId : Nat
  left : EvidenceItem
  right : EvidenceItem
  deriving DecidableEq

/-- A disclosure event is an occurrence of an item at a workflow stage.
    Its event ID is not the identity of the underlying evidence item. -/
structure DisclosureEvent where
  eventId : Nat
  itemId : Nat
  stage : FlowStage
  contributor : Nat
  recipient : Option Nat
  deriving DecidableEq

structure EvidenceFlow where
  items : Finset EvidenceItem
  events : Finset DisclosureEvent
  deriving DecidableEq

/-- Stage presence is computed over the finite event set. It is evidence
    availability, not comprehension or semantic uptake. -/
def itemPresentAt (flow : EvidenceFlow) (stage : FlowStage)
    (item : EvidenceItem) : Prop :=
  0 < (flow.events.filter (fun e =>
    decide (e.stage = stage ∧ e.itemId = item.itemId))).card

def pairPresentAt (flow : EvidenceFlow) (stage : FlowStage)
    (pair : EvidencePair) : Prop :=
  itemPresentAt flow stage pair.left ∧ itemPresentAt flow stage pair.right

private theorem itemPresentAt_of_event
    (flow : EvidenceFlow) (stage : FlowStage) (item : EvidenceItem)
    (event : DisclosureEvent)
    (hEvent : event ∈ flow.events)
    (hStage : event.stage = stage)
    (hItem : event.itemId = item.itemId) :
    itemPresentAt flow stage item := by
  unfold itemPresentAt
  apply Finset.card_pos.mpr
  refine ⟨event, ?_⟩
  simp [hEvent, hStage, hItem]

/-- A worker-report event addressed to a recipient. This is not, by itself,
    proof that the item entered the recipient's later context. -/
def sentTo (flow : EvidenceFlow) (item : EvidenceItem)
    (recipient : Nat) : Prop :=
  0 < (flow.events.filter (fun e =>
    decide (e.stage = .workerReports ∧
      e.itemId = item.itemId ∧ e.recipient = some recipient))).card

private theorem sentTo_of_event
    (flow : EvidenceFlow) (item : EvidenceItem) (recipient : Nat)
    (event : DisclosureEvent)
    (hEvent : event ∈ flow.events)
    (hStage : event.stage = .workerReports)
    (hItem : event.itemId = item.itemId)
    (hRecipient : event.recipient = some recipient) :
    sentTo flow item recipient := by
  unfold sentTo
  apply Finset.card_pos.mpr
  refine ⟨event, ?_⟩
  simp [hEvent, hStage, hItem, hRecipient]

/-- Same takes precedence whenever one contributor supplies both endpoints. -/
def sameContributorPair (flow : EvidenceFlow) (stage : FlowStage)
    (pair : EvidencePair) : Prop :=
  0 < ((flow.events.product flow.events).filter (fun p =>
    decide (p.1.stage = stage ∧ p.2.stage = stage ∧
      p.1.itemId = pair.left.itemId ∧
      p.2.itemId = pair.right.itemId ∧
      p.1.contributor = p.2.contributor))).card

private theorem sameContributorPair_of_events
    (flow : EvidenceFlow) (stage : FlowStage) (pair : EvidencePair)
    (left right : DisclosureEvent)
    (hLeft : left ∈ flow.events) (hRight : right ∈ flow.events)
    (hLeftStage : left.stage = stage) (hRightStage : right.stage = stage)
    (hLeftItem : left.itemId = pair.left.itemId)
    (hRightItem : right.itemId = pair.right.itemId)
    (hContributor : left.contributor = right.contributor) :
    sameContributorPair flow stage pair := by
  unfold sameContributorPair
  apply Finset.card_pos.mpr
  refine ⟨(left, right), ?_⟩
  simp [hLeft, hRight, hLeftStage, hRightStage, hLeftItem, hRightItem, hContributor]

/-- Split means both endpoints are present, but no one contributor supplies both. -/
def splitContributorPair (flow : EvidenceFlow) (stage : FlowStage)
    (pair : EvidencePair) : Prop :=
  pairPresentAt flow stage pair ∧ ¬ sameContributorPair flow stage pair

/-- Declared source-root overlap is a provenance relation, not a statistical
    independence test. Disjoint declared roots are likewise not sufficient
    to establish independent extraction errors or independent model behavior. -/
def declaredSourceRootsOverlap (left right : EvidenceItem) : Prop :=
  0 < (left.sourceRoots ∩ right.sourceRoots).card

def declaredSourceRootsDisjoint (left right : EvidenceItem) : Prop :=
  Disjoint left.sourceRoots right.sourceRoots

/-- Itemwise transfer is the sufficient condition for pair recall to survive
    from one stage to another. -/
def itemwiseTransfer (flow : EvidenceFlow) (sourceStage targetStage : FlowStage)
    (pair : EvidencePair) : Prop :=
  (itemPresentAt flow sourceStage pair.left → itemPresentAt flow targetStage pair.left) ∧
  (itemPresentAt flow sourceStage pair.right → itemPresentAt flow targetStage pair.right)

theorem pair_recall_preserved_of_itemwise_transfer
    (flow : EvidenceFlow) (sourceStage targetStage : FlowStage) (pair : EvidencePair)
    (hPair : pairPresentAt flow sourceStage pair)
    (hTransfer : itemwiseTransfer flow sourceStage targetStage pair) :
    pairPresentAt flow targetStage pair := by
  exact ⟨hTransfer.1 hPair.1, hTransfer.2 hPair.2⟩

structure PairJudgment where
  pairId : Nat
  discrepancyIdentified : Bool
  quantitativeComparisonAccurate : Bool
  deriving DecidableEq

/-- The paper's Judge Pass requires both discrepancy identification and
    accurate quantitative treatment; endpoint presence alone is separate. -/
def judgePassFor (pair : EvidencePair) (judgment : PairJudgment) : Prop :=
  judgment.pairId = pair.pairId ∧
  judgment.discrepancyIdentified = true ∧
  judgment.quantitativeComparisonAccurate = true

def claimA : EvidenceItem := ⟨1, {101}⟩
def claimB : EvidenceItem := ⟨2, {202}⟩
def testPair : EvidencePair := ⟨7, claimA, claimB⟩

/-- Logical witness: both endpoints are read, but only one is reported. -/
def handoffLossFlow : EvidenceFlow where
  items := {claimA, claimB}
  events := {
    ⟨1, claimA.itemId, .sourceReads, 10, none⟩,
    ⟨2, claimB.itemId, .sourceReads, 11, none⟩,
    ⟨3, claimA.itemId, .workerReports, 10, some 0⟩
  }

theorem source_pair_can_be_lost_before_worker_report :
    pairPresentAt handoffLossFlow .sourceReads testPair ∧
    ¬ pairPresentAt handoffLossFlow .workerReports testPair := by
  constructor
  · constructor
    · exact itemPresentAt_of_event handoffLossFlow .sourceReads claimA
        ⟨1, claimA.itemId, .sourceReads, 10, none⟩
        (by simp [handoffLossFlow]) rfl rfl
    · exact itemPresentAt_of_event handoffLossFlow .sourceReads claimB
        ⟨2, claimB.itemId, .sourceReads, 11, none⟩
        (by simp [handoffLossFlow]) rfl rfl
  · intro hPair
    have hB : itemPresentAt handoffLossFlow .workerReports claimB := hPair.2
    unfold itemPresentAt at hB
    have hEmpty :
        (handoffLossFlow.events.filter (fun e =>
          decide (e.stage = .workerReports ∧ e.itemId = claimB.itemId))) = ∅ := by
      decide
    rw [hEmpty] at hB
    simp at hB

/-- Logical witness: two contributors jointly report the pair, but neither
    contributor supplies both endpoints. -/
def splitFlow : EvidenceFlow where
  items := {claimA, claimB}
  events := {
    ⟨10, claimA.itemId, .workerReports, 10, some 0⟩,
    ⟨11, claimB.itemId, .workerReports, 11, some 0⟩
  }

theorem split_pair_witness :
    splitContributorPair splitFlow .workerReports testPair := by
  unfold splitContributorPair
  constructor
  · constructor
    · exact itemPresentAt_of_event splitFlow .workerReports claimA
        ⟨10, claimA.itemId, .workerReports, 10, some 0⟩
        (by simp [splitFlow]) rfl rfl
    · exact itemPresentAt_of_event splitFlow .workerReports claimB
        ⟨11, claimB.itemId, .workerReports, 11, some 0⟩
        (by simp [splitFlow]) rfl rfl
  · intro hSame
    unfold sameContributorPair at hSame
    have hEmpty :
        ((splitFlow.events.product splitFlow.events).filter (fun p =>
          decide (p.1.stage = .workerReports ∧ p.2.stage = .workerReports ∧
            p.1.itemId = testPair.left.itemId ∧
            p.2.itemId = testPair.right.itemId ∧
            p.1.contributor = p.2.contributor))) = ∅ := by
      decide
    rw [hEmpty] at hSame
    simp at hSame

/-- If one contributor supplies both endpoints, the Same classification holds
    even when another contributor also supplies one endpoint. -/
def sameFlow : EvidenceFlow where
  items := {claimA, claimB}
  events := {
    ⟨20, claimA.itemId, .workerReports, 10, some 0⟩,
    ⟨21, claimB.itemId, .workerReports, 10, some 0⟩,
    ⟨22, claimB.itemId, .workerReports, 11, some 0⟩
  }

theorem same_contributor_takes_precedence :
    sameContributorPair sameFlow .workerReports testPair := by
  exact sameContributorPair_of_events sameFlow .workerReports testPair
    ⟨20, claimA.itemId, .workerReports, 10, some 0⟩
    ⟨21, claimB.itemId, .workerReports, 10, some 0⟩
    (by simp [sameFlow]) (by simp [sameFlow]) rfl rfl rfl rfl rfl

/-- Logical witness: a report is addressed to the lead, but the item is not
    represented in the lead-evidence stage. -/
def sentNotLeadFlow : EvidenceFlow where
  items := {claimA}
  events := {
    ⟨30, claimA.itemId, .workerReports, 10, some 0⟩
  }

theorem sent_to_lead_does_not_imply_lead_evidence :
    sentTo sentNotLeadFlow claimA 0 ∧
    ¬ itemPresentAt sentNotLeadFlow .leadEvidence claimA := by
  constructor
  · exact sentTo_of_event sentNotLeadFlow claimA 0
      ⟨30, claimA.itemId, .workerReports, 10, some 0⟩
      (by simp [sentNotLeadFlow]) rfl rfl rfl
  · intro hItem
    unfold itemPresentAt at hItem
    have hEmpty :
        (sentNotLeadFlow.events.filter (fun e =>
          decide (e.stage = .leadEvidence ∧ e.itemId = claimA.itemId))) = ∅ := by
      decide
    rw [hEmpty] at hItem
    simp at hItem

/-- Logical witness: both endpoints appear in the final artifact, while the
    separate semantic judgment does not pass. -/
def finalPairFlow : EvidenceFlow where
  items := {claimA, claimB}
  events := {
    ⟨40, claimA.itemId, .finalReport, 0, none⟩,
    ⟨41, claimB.itemId, .finalReport, 0, none⟩
  }

def missedJudgment : PairJudgment := ⟨7, false, true⟩

theorem pair_presence_does_not_imply_judge_pass :
    pairPresentAt finalPairFlow .finalReport testPair ∧
    ¬ judgePassFor testPair missedJudgment := by
  constructor
  · constructor
    · exact itemPresentAt_of_event finalPairFlow .finalReport claimA
        ⟨40, claimA.itemId, .finalReport, 0, none⟩
        (by simp [finalPairFlow]) rfl rfl
    · exact itemPresentAt_of_event finalPairFlow .finalReport claimB
        ⟨41, claimB.itemId, .finalReport, 0, none⟩
        (by simp [finalPairFlow]) rfl rfl
  · simp [judgePassFor, missedJudgment, testPair, claimA, claimB]

/-- Distinct evidence-item IDs can still share a declared source root. -/
def sharedRootA : EvidenceItem := ⟨3, {999}⟩
def sharedRootB : EvidenceItem := ⟨4, {999}⟩

theorem distinct_items_can_share_declared_root :
    sharedRootA.itemId ≠ sharedRootB.itemId ∧
    declaredSourceRootsOverlap sharedRootA sharedRootB := by
  norm_num [declaredSourceRootsOverlap, sharedRootA, sharedRootB]

/-- One evidence item may appear in multiple disclosure events without
    becoming multiple evidence items. -/
def repeatedDisclosureFlow : EvidenceFlow where
  items := {claimA}
  events := {
    ⟨50, claimA.itemId, .sourceReads, 10, none⟩,
    ⟨51, claimA.itemId, .workerReports, 10, some 0⟩
  }

def hasRepeatedDisclosure (flow : EvidenceFlow) : Prop :=
  0 < ((flow.events.product flow.events).filter (fun p =>
    decide (p.1.itemId = p.2.itemId ∧
      p.1.eventId ≠ p.2.eventId))).card

private theorem hasRepeatedDisclosure_of_events
    (flow : EvidenceFlow) (left right : DisclosureEvent)
    (hLeft : left ∈ flow.events) (hRight : right ∈ flow.events)
    (hItem : left.itemId = right.itemId)
    (hEvent : left.eventId ≠ right.eventId) :
    hasRepeatedDisclosure flow := by
  unfold hasRepeatedDisclosure
  apply Finset.card_pos.mpr
  refine ⟨(left, right), ?_⟩
  simp [hLeft, hRight, hItem, hEvent]

theorem one_item_can_have_multiple_disclosure_events :
    hasRepeatedDisclosure repeatedDisclosureFlow := by
  exact hasRepeatedDisclosure_of_events repeatedDisclosureFlow
    ⟨50, claimA.itemId, .sourceReads, 10, none⟩
    ⟨51, claimA.itemId, .workerReports, 10, some 0⟩
    (by simp [repeatedDisclosureFlow]) (by simp [repeatedDisclosureFlow])
    rfl (by decide)

#print axioms pair_recall_preserved_of_itemwise_transfer
#print axioms source_pair_can_be_lost_before_worker_report
#print axioms split_pair_witness
#print axioms sent_to_lead_does_not_imply_lead_evidence
#print axioms pair_presence_does_not_imply_judge_pass
#print axioms distinct_items_can_share_declared_root
#print axioms one_item_can_have_multiple_disclosure_events

end HsHVerification.OrsonEvidenceFlow


namespace HsHVerification.OrsonFacilitationDesign

/-!
Source comparator: Córdova et al., "LLM Facilitation of Group Decision-Making",
arXiv:2611.19652v1 (2026-11-14), especially main §§3 and 5 and Supplementary
Text S2. The group-level generator template lists private attribute categories
for all three roles; the individual-level template lists only the current
recipient's private categories. Delivery also differs: group-shared versus
recipient-private. The paper states that the facilitator is blind to candidate
attribute values; this model concerns only the declared schema-scope and
delivery-scope difference. Placeholder expansion beyond the printed template
is not specified in v1.

The finite witness below is a logical design counterexample, not study data,
an estimated effect, or a model-behavior result. It shows that diagonal
treatment arms alone do not identify a delivery-only effect when schema scope
and delivery scope vary together.
-/

inductive PrivateSchemaScope where
  | recipientSchema
  | fullGroupSchema
  deriving DecidableEq, Repr

inductive DeliveryScope where
  | recipientPrivate
  | groupShared
  deriving DecidableEq, Repr

structure FacilitationArm where
  schemaScope : PrivateSchemaScope
  deliveryScope : DeliveryScope
  deriving DecidableEq, Repr

def individualArm : FacilitationArm :=
  ⟨.recipientSchema, .recipientPrivate⟩

def groupArm : FacilitationArm :=
  ⟨.fullGroupSchema, .groupShared⟩

def outcomeAt
    (surface : PrivateSchemaScope → DeliveryScope → Bool)
    (arm : FacilitationArm) : Bool :=
  surface arm.schemaScope arm.deliveryScope

def sameObservedArms
    (left right : PrivateSchemaScope → DeliveryScope → Bool) : Prop :=
  outcomeAt left individualArm = outcomeAt right individualArm ∧
  outcomeAt left groupArm = outcomeAt right groupArm

def deliveryEffectAt
    (surface : PrivateSchemaScope → DeliveryScope → Bool)
    (schema : PrivateSchemaScope) : Prop :=
  surface schema .recipientPrivate ≠ surface schema .groupShared

def flatSurface : PrivateSchemaScope → DeliveryScope → Bool
  | .recipientSchema, .recipientPrivate => true
  | .recipientSchema, .groupShared => true
  | .fullGroupSchema, .recipientPrivate => true
  | .fullGroupSchema, .groupShared => true

def interactionSurface : PrivateSchemaScope → DeliveryScope → Bool
  | .recipientSchema, .recipientPrivate => true
  | .recipientSchema, .groupShared => false
  | .fullGroupSchema, .recipientPrivate => false
  | .fullGroupSchema, .groupShared => true

theorem diagonal_arms_do_not_identify_delivery_effect :
    sameObservedArms flatSurface interactionSurface ∧
    ¬ deliveryEffectAt flatSurface .recipientSchema ∧
    deliveryEffectAt interactionSurface .recipientSchema := by
  simp [sameObservedArms, outcomeAt, individualArm, groupArm,
    deliveryEffectAt, flatSurface, interactionSurface]

#print axioms diagonal_arms_do_not_identify_delivery_effect

end HsHVerification.OrsonFacilitationDesign


namespace HsHVerification.OrsonEvidenceFlowAdmission

open HsHVerification.OrsonEvidenceFlow

/-!
Admission gate for the identity keys used by the source-bounded evidence-flow
model above.

The existing readout functions compare DisclosureEvent.itemId with
EvidenceItem.itemId. Therefore itemId must be unique within one EvidenceFlow,
every event reference must resolve to a registered item, and eventId must
identify one disclosure occurrence within that flow. Repeated disclosures of
one item remain permitted when they have distinct event IDs.

These are assistant-reconstructed schema invariants for this formalization.
They are not a claim that the cited paper specifies this database schema,
not source-log authentication, and not a P1 protocol amendment.
-/

/-- Semantic item keys must identify at most one registered item per flow. -/
def uniqueItemIds (items : Finset EvidenceItem) : Prop :=
  ∀ left ∈ items, ∀ right ∈ items,
    left.itemId = right.itemId → left = right

/-- Every disclosure event must refer to a registered evidence item. -/
def eventReferencesResolve (flow : EvidenceFlow) : Prop :=
  ∀ event ∈ flow.events,
    ∃ item ∈ flow.items, item.itemId = event.itemId

/-- Event keys identify occurrences, not the underlying semantic evidence item. -/
def uniqueEventIds (events : Finset DisclosureEvent) : Prop :=
  ∀ left ∈ events, ∀ right ∈ events,
    left.eventId = right.eventId → left = right

/-- Minimal admission predicate for a well-formed evidence-flow record. -/
def validEvidenceFlow (flow : EvidenceFlow) : Prop :=
  uniqueItemIds flow.items ∧
  eventReferencesResolve flow ∧
  uniqueEventIds flow.events

/-- A registered item readout: raw event presence is not enough by itself. -/
def admissibleItemPresence (flow : EvidenceFlow) (stage : FlowStage)
    (item : EvidenceItem) : Prop :=
  validEvidenceFlow flow ∧
  item ∈ flow.items ∧
  itemPresentAt flow stage item

/-- A pair readout is admissible only after flow validity and endpoint
    registration have been established. Distinct endpoints are required. -/
def admissiblePairPresence (flow : EvidenceFlow) (stage : FlowStage)
    (pair : EvidencePair) : Prop :=
  validEvidenceFlow flow ∧
  pair.left ∈ flow.items ∧
  pair.right ∈ flow.items ∧
  pair.left ≠ pair.right ∧
  pairPresentAt flow stage pair

theorem unique_item_ids_separate_distinct_items
    (items : Finset EvidenceItem) (left right : EvidenceItem)
    (hUnique : uniqueItemIds items)
    (hLeft : left ∈ items) (hRight : right ∈ items)
    (hDistinct : left ≠ right) :
    left.itemId ≠ right.itemId := by
  intro hIds
  exact hDistinct (hUnique left hLeft right hRight hIds)

theorem valid_flow_separates_distinct_pair_endpoints
    (flow : EvidenceFlow) (pair : EvidencePair)
    (hValid : validEvidenceFlow flow)
    (hLeft : pair.left ∈ flow.items)
    (hRight : pair.right ∈ flow.items)
    (hDistinct : pair.left ≠ pair.right) :
    pair.left.itemId ≠ pair.right.itemId :=
  unique_item_ids_separate_distinct_items
    flow.items pair.left pair.right hValid.1 hLeft hRight hDistinct

theorem valid_flow_event_item_resolves
    (flow : EvidenceFlow) (event : DisclosureEvent)
    (hValid : validEvidenceFlow flow)
    (hEvent : event ∈ flow.events) :
    ∃ item ∈ flow.items, item.itemId = event.itemId :=
  hValid.2.1 event hEvent

theorem valid_flow_event_ids_are_unique
    (flow : EvidenceFlow) (left right : DisclosureEvent)
    (hValid : validEvidenceFlow flow)
    (hLeft : left ∈ flow.events) (hRight : right ∈ flow.events)
    (hIds : left.eventId = right.eventId) :
    left = right :=
  hValid.2.2 left hLeft right hRight hIds

/-- Two distinct endpoint records with the same itemId expose an aliasing bug:
    one event is counted as presence of both endpoints by the raw pair readout. -/
def aliasLeft : EvidenceItem := ⟨77, {101}⟩
def aliasRight : EvidenceItem := ⟨77, {202}⟩
def aliasPair : EvidencePair := ⟨7, aliasLeft, aliasRight⟩
def aliasEvent : DisclosureEvent :=
  ⟨70, 77, .sourceReads, 10, none⟩

def aliasFlow : EvidenceFlow where
  items := {aliasLeft, aliasRight}
  events := {aliasEvent}

theorem alias_endpoints_are_distinct : aliasLeft ≠ aliasRight := by
  decide

theorem duplicate_semantic_ids_allow_one_event_to_satisfy_both_endpoints :
    pairPresentAt aliasFlow .sourceReads aliasPair := by
  classical
  decide

theorem alias_flow_fails_unique_item_ids :
    ¬ uniqueItemIds aliasFlow.items := by
  intro h
  have hEq : aliasLeft = aliasRight :=
    h aliasLeft (by simp [aliasFlow]) aliasRight (by simp [aliasFlow]) rfl
  exact alias_endpoints_are_distinct hEq

theorem alias_flow_is_not_valid :
    ¬ validEvidenceFlow aliasFlow := by
  intro h
  exact alias_flow_fails_unique_item_ids h.1

theorem alias_pair_is_not_admissible :
    ¬ admissiblePairPresence aliasFlow .sourceReads aliasPair := by
  intro h
  exact alias_flow_is_not_valid h.1

/-- An orphan event can also make an unregistered item appear present under
    the raw readout, because the current function does not consult flow.items. -/
def orphanItem : EvidenceItem := ⟨99, {999}⟩
def orphanEvent : DisclosureEvent :=
  ⟨71, 99, .sourceReads, 11, none⟩

def orphanFlow : EvidenceFlow where
  items := {claimA}
  events := {orphanEvent}

theorem orphan_event_can_make_unregistered_item_appear :
    itemPresentAt orphanFlow .sourceReads orphanItem := by
  classical
  decide

theorem orphan_flow_fails_referential_integrity :
    ¬ eventReferencesResolve orphanFlow := by
  classical
  decide

theorem orphan_item_presence_is_not_admissible :
    ¬ admissibleItemPresence orphanFlow .sourceReads orphanItem := by
  intro h
  exact orphan_flow_fails_referential_integrity h.1.2.1

/-- Distinct event IDs still allow one semantic item to be disclosed more than
    once; the gate does not collapse occurrence identity into item identity. -/
theorem repeated_disclosure_flow_is_valid :
    validEvidenceFlow repeatedDisclosureFlow := by
  classical
  decide

theorem repeated_disclosure_remains_admissible :
    hasRepeatedDisclosure repeatedDisclosureFlow ∧
      validEvidenceFlow repeatedDisclosureFlow := by
  exact ⟨one_item_can_have_multiple_disclosure_events,
    repeated_disclosure_flow_is_valid⟩

#print axioms unique_item_ids_separate_distinct_items
#print axioms valid_flow_separates_distinct_pair_endpoints
#print axioms valid_flow_event_item_resolves
#print axioms valid_flow_event_ids_are_unique
#print axioms duplicate_semantic_ids_allow_one_event_to_satisfy_both_endpoints
#print axioms alias_flow_is_not_valid
#print axioms alias_pair_is_not_admissible
#print axioms orphan_event_can_make_unregistered_item_appear
#print axioms orphan_flow_fails_referential_integrity
#print axioms orphan_item_presence_is_not_admissible
#print axioms repeated_disclosure_flow_is_valid
#print axioms repeated_disclosure_remains_admissible

end HsHVerification.OrsonEvidenceFlowAdmission
