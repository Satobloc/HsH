import Mathlib

/-!
# CRTC group-readout projection kernel (assistant reconstruction)

Source boundary:
* Orson Vay, `COGNITIVE_READOUT_TARGET_CONTRACT_v0.1.md` (2026-11-20),
  blob `a5b997e63f01a698f201c30940d3e29a702cdd29`, permits a group unit
  but supplies only single-unit readout maps.
* Meridian h975:s4 (2026-11-20) independently identified the missing
  group-history, member-projection, exposure-event, subgroup-projection,
  and group-aggregation map signatures. That report is assistant-level QC,
  not a Nathan Direct statement.
* Empirical comparators: Nixon et al., arXiv:2607.27179 (2026);
  Kerstan, Grote & Schmutz, DOI 10.1177/00187208261477411 (2026);
  Toxtli & Delaflor, DOI 10.1145/3785651.3831525 (2026).

This is a deliberately small assistant reconstruction of a typed group-event
kernel. It is not supplied by those authors, not a validated instrument,
not CRTC v0.2 adoption, and not a P1 protocol amendment. It does not modify
CRTC v0.1, issue #564, PR #850, PR #2112, any manuscript, dataset, or trial.

The finite witnesses below are logical counterexamples only. They are not
physical fixtures, measured data, model outputs, or evidence of cognition.
-/

namespace HsHVerification.OrsonCRTCGroupProjection

abbrev Agent := Nat

/-- One interaction event with distinct availability, use, and decision-incorporation fields.

    `payload` is an opaque event token, not a semantic interpretation. -/
structure InteractionEvent where
  eventId : Nat
  timestamp : Nat
  author : Agent
  availableTo : Finset Agent
  usedBy : Finset Agent
  incorporatedIntoDecision : Bool
  payload : Nat
  deriving DecidableEq

structure GroupHistory where
  roster : Finset Agent
  events : Finset InteractionEvent
  deriving DecidableEq

structure SubgroupHistory where
  roster : Finset Agent
  events : Finset InteractionEvent
  deriving DecidableEq

structure MemberHistory where
  member : Agent
  events : Finset InteractionEvent
  deriving DecidableEq

/-- Minimal event well-formedness: use must be contained in availability. -/
def ValidEvent (e : InteractionEvent) : Prop :=
  e.usedBy ⊆ e.availableTo

/-- Minimal group-log well-formedness. -/
def ValidEventSet (roster : Finset Agent) (events : Finset InteractionEvent) : Prop :=
  (∀ e ∈ events,
    e.author ∈ roster ∧
    e.availableTo ⊆ roster ∧
    ValidEvent e) ∧
  (∀ e₁ ∈ events, ∀ e₂ ∈ events, e₁.eventId = e₂.eventId → e₁ = e₂)

def ValidGroupHistory (h : GroupHistory) : Prop :=
  ValidEventSet h.roster h.events

/-- A member sees events authored by that member or made available to them. -/
def memberEvents (events : Finset InteractionEvent) (i : Agent) :
    Finset InteractionEvent :=
  events.filter (fun e => e.author = i ∨ i ∈ e.availableTo)

/-- A subgroup retains only events whose author and entire availability set
    lie within that subgroup. Cross-boundary events are not silently clipped. -/
def subgroupEvents (events : Finset InteractionEvent) (s : Finset Agent) :
    Finset InteractionEvent :=
  events.filter (fun e => e.author ∈ s ∧ e.availableTo ⊆ s)

/-- Direct projection from a group history to one member's available event view. -/
def projectMember (h : GroupHistory) (i : Agent) (_hi : i ∈ h.roster) :
    MemberHistory :=
  ⟨i, memberEvents h.events i⟩

/-- Projection from a group history to a closed subgroup history. -/
def projectSubgroup (h : GroupHistory) (s : Finset Agent) : SubgroupHistory :=
  ⟨h.roster ∩ s, subgroupEvents h.events s⟩

/-- Member projection after subgroup projection. -/
def projectMemberFromSubgroup (h : SubgroupHistory) (i : Agent)
    (_hi : i ∈ h.roster) : MemberHistory :=
  ⟨i, memberEvents h.events i⟩

/-- A well-formed group history projects to a well-formed subgroup history. -/
def ValidSubgroupHistory (h : SubgroupHistory) : Prop :=
  ValidEventSet h.roster h.events

theorem subgroup_projection_preserves_validity
    (h : GroupHistory) (s : Finset Agent)
    (hv : ValidGroupHistory h) :
    ValidSubgroupHistory (projectSubgroup h s) := by
  constructor
  · intro e he
    simp only [projectSubgroup, subgroupEvents, Finset.mem_filter] at he
    rcases he with ⟨hevents, hauthor, havailable⟩
    rcases hv.1 e hevents with ⟨hauthorRoster, havailableRoster, hused⟩
    refine ⟨Finset.mem_inter.mpr ⟨hauthorRoster, hauthor⟩, ?_, hused⟩
    intro a ha
    exact Finset.mem_inter.mpr ⟨havailableRoster ha, havailable ha⟩
  · intro e₁ he₁ e₂ he₂ hid
    simp only [projectSubgroup, subgroupEvents, Finset.mem_filter] at he₁ he₂
    exact hv.2 e₁ he₁.1 e₂ he₂.1 hid

/-- Nested subgroup→member projection equals direct group→member projection
    only when the member belongs to both scopes and every event in that
    member's direct view is wholly internal to the subgroup. -/
theorem subgroup_member_projection_composes
    (h : GroupHistory) (s : Finset Agent) (i : Agent)
    (hiRoster : i ∈ h.roster) (hiSubgroup : i ∈ s)
    (hclosed : ∀ e ∈ h.events,
      (e.author = i ∨ i ∈ e.availableTo) →
      e.author ∈ s ∧ e.availableTo ⊆ s) :
    projectMemberFromSubgroup (projectSubgroup h s) i
      (Finset.mem_inter.mpr ⟨hiRoster, hiSubgroup⟩) =
      projectMember h i hiRoster := by
  have hmem : i ∈ h.roster ∩ s :=
    Finset.mem_inter.mpr ⟨hiRoster, hiSubgroup⟩
  change
    MemberHistory.mk i (memberEvents (subgroupEvents h.events s) i) =
      MemberHistory.mk i (memberEvents h.events i)
  apply congrArg (MemberHistory.mk i)
  ext e
  simp only [memberEvents, subgroupEvents, Finset.mem_filter]
  constructor
  · rintro ⟨⟨he, hauthor, havailable⟩, hvisible⟩
    exact ⟨he, hvisible⟩
  · rintro ⟨he, hvisible⟩
    rcases hclosed e he hvisible with ⟨hauthor, havailable⟩
    exact ⟨⟨he, hauthor, havailable⟩, hvisible⟩

/-- A cross-boundary event can be visible to a member yet removed by a
    subgroup projection that excludes its author or another recipient. -/
def crossBoundaryEvent : InteractionEvent :=
  ⟨9, 1, 1, {0, 1}, {0}, false, 9⟩

def crossBoundaryHistory : GroupHistory :=
  ⟨{0, 1}, {crossBoundaryEvent}⟩

theorem cross_boundary_history_valid :
    ValidGroupHistory crossBoundaryHistory := by
  simp [ValidGroupHistory, ValidEventSet, ValidEvent,
    crossBoundaryHistory, crossBoundaryEvent]

theorem cross_boundary_projection_can_lose_visible_event :
    projectMemberFromSubgroup
        (projectSubgroup crossBoundaryHistory {0}) 0
        (by simp [projectSubgroup, crossBoundaryHistory]) ≠
      projectMember crossBoundaryHistory 0 (by simp [crossBoundaryHistory]) := by
  decide

/-- Availability is not evidence of uptake. -/
def availableNotUsed : InteractionEvent :=
  ⟨10, 2, 1, {0, 1}, ∅, false, 10⟩

theorem availability_does_not_imply_uptake :
    0 ∈ availableNotUsed.availableTo ∧
    0 ∉ availableNotUsed.usedBy := by
  decide

theorem available_not_used_is_well_formed :
    ValidEvent availableNotUsed := by
  simp [ValidEvent, availableNotUsed]

/-- Uptake is not evidence that the event entered the group decision. -/
def usedNotIncorporated : InteractionEvent :=
  ⟨11, 3, 1, {0, 1}, {0}, false, 11⟩

theorem uptake_does_not_imply_decision_incorporation :
    0 ∈ usedNotIncorporated.usedBy ∧
    usedNotIncorporated.incorporatedIntoDecision = false := by
  decide

theorem used_not_incorporated_is_well_formed :
    ValidEvent usedNotIncorporated := by
  simp [ValidEvent, usedNotIncorporated]

/-- One deliberately narrow group readout: the count of event records marked
    as incorporated into the decision. This is not decision quality. -/
def decisionIncorporationCount (h : GroupHistory) : Nat :=
  (h.events.filter (fun e => e.incorporatedIntoDecision)).card

def eventA : InteractionEvent :=
  ⟨20, 1, 1, {1}, {1}, true, 20⟩

def eventB : InteractionEvent :=
  ⟨21, 2, 2, {2}, {2}, true, 21⟩

def historyOne : GroupHistory :=
  ⟨{0, 1, 2}, {eventA}⟩

def historyTwo : GroupHistory :=
  ⟨{0, 1, 2}, {eventA, eventB}⟩

theorem historyOne_valid : ValidGroupHistory historyOne := by
  simp [ValidGroupHistory, ValidEventSet, ValidEvent, historyOne, eventA]

theorem historyTwo_valid : ValidGroupHistory historyTwo := by
  simp [ValidGroupHistory, ValidEventSet, ValidEvent, historyTwo, eventA, eventB]

/-- Two valid group histories can give one member the same view while having
    different group-level decision-incorporation counts. -/
theorem same_member_view_different_group_incorporation_count :
    projectMember historyOne 0 (by simp [historyOne]) =
      projectMember historyTwo 0 (by simp [historyTwo]) ∧
    decisionIncorporationCount historyOne ≠
      decisionIncorporationCount historyTwo := by
  constructor <;> decide

/-- In this explicit model, no readout computed from member 0's projection
    alone can recover the group-wide incorporation count for every valid
    group history. -/
theorem no_member_only_incorporation_reconstructor :
    ¬ ∃ f : MemberHistory → Nat,
      ∀ h : GroupHistory, ValidGroupHistory h →
        ∀ hi : 0 ∈ h.roster,
          f (projectMember h 0 hi) = decisionIncorporationCount h := by
  rintro ⟨f, hf⟩
  have h1 := hf historyOne historyOne_valid (by simp [historyOne])
  have h2 := hf historyTwo historyTwo_valid (by simp [historyTwo])
  have hview :
      projectMember historyOne 0 (by simp [historyOne]) =
        projectMember historyTwo 0 (by simp [historyTwo]) := by
    decide
  rw [hview] at h1
  have hcount1 : decisionIncorporationCount historyOne = 1 := by
    decide
  have hcount2 : decisionIncorporationCount historyTwo = 2 := by
    decide
  rw [hcount1] at h1
  rw [hcount2] at h2
  omega

#print axioms subgroup_projection_preserves_validity
#print axioms subgroup_member_projection_composes
#print axioms cross_boundary_projection_can_lose_visible_event
#print axioms availability_does_not_imply_uptake
#print axioms uptake_does_not_imply_decision_incorporation
#print axioms same_member_view_different_group_incorporation_count
#print axioms no_member_only_incorporation_reconstructor

end HsHVerification.OrsonCRTCGroupProjection
