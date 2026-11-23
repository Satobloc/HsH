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
  ∃ e ∈ flow.events, e.stage = stage ∧ e.itemId = item.itemId

def pairPresentAt (flow : EvidenceFlow) (stage : FlowStage)
    (pair : EvidencePair) : Prop :=
  itemPresentAt flow stage pair.left ∧ itemPresentAt flow stage pair.right

/-- A worker-report event addressed to a recipient. This is not, by itself,
    proof that the item entered the recipient's later context. -/
def sentTo (flow : EvidenceFlow) (item : EvidenceItem)
    (recipient : Nat) : Prop :=
  ∃ e ∈ flow.events,
    e.stage = .workerReports ∧
    e.itemId = item.itemId ∧ e.recipient = some recipient

/-- Same takes precedence whenever one contributor supplies both endpoints. -/
def sameContributorPair (flow : EvidenceFlow) (stage : FlowStage)
    (pair : EvidencePair) : Prop :=
  ∃ p ∈ flow.events.product flow.events,
    p.1.stage = stage ∧ p.2.stage = stage ∧
    p.1.itemId = pair.left.itemId ∧
    p.2.itemId = pair.right.itemId ∧
    p.1.contributor = p.2.contributor

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
  decide

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
  decide

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
  decide

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
  decide

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
  decide

/-- Distinct evidence-item IDs can still share a declared source root. -/
def sharedRootA : EvidenceItem := ⟨3, {999}⟩
def sharedRootB : EvidenceItem := ⟨4, {999}⟩

theorem distinct_items_can_share_declared_root :
    sharedRootA.itemId ≠ sharedRootB.itemId ∧
    declaredSourceRootsOverlap sharedRootA sharedRootB := by
  decide

/-- One evidence item may appear in multiple disclosure events without
    becoming multiple evidence items. -/
def repeatedDisclosureFlow : EvidenceFlow where
  items := {claimA}
  events := {
    ⟨50, claimA.itemId, .sourceReads, 10, none⟩,
    ⟨51, claimA.itemId, .workerReports, 10, some 0⟩
  }

def hasRepeatedDisclosure (flow : EvidenceFlow) : Prop :=
  ∃ p ∈ flow.events.product flow.events,
    p.1.itemId = p.2.itemId ∧ p.1.eventId ≠ p.2.eventId

theorem one_item_can_have_multiple_disclosure_events :
    hasRepeatedDisclosure repeatedDisclosureFlow := by
  decide

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
  decide

#print axioms diagonal_arms_do_not_identify_delivery_effect

end HsHVerification.OrsonFacilitationDesign
