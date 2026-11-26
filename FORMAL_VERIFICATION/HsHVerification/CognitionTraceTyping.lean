import Mathlib

/-!
Cognition-trace / braid-typing boundary (assistant reconstruction).

Source context:
* Qian, "What Does Multi-Agent Debate Actually Change?", arXiv:2609.08016v3
  (2026-10-07), describes router-directed reply paths with shared prefixes
  in its three-member routing-tree condition.
* An and Maciazek, "Geometric Presentations of Braid Groups for Particles
  on a Graph", Communications in Mathematical Physics 384 (2021),
  DOI: 10.1007/s00220-021-04095-x, defines graph braid groups through
  particle configurations/motions on a graph and geometric exchange moves.

This file formalizes only a necessary-condition gate for one proposed
encoding: a single non-branching strand segment has at most one continuation.
It does NOT formalize B_n, a graph braid group, a cabling map, a physical
H(s)H braid, or the source paper's actual raw event log. A general tangle,
cobordism, hypergraph, or explicit multi-strand construction is outside
this model. The theorem is conditional on the one-to-one, single-strand
encoding defined below.
-/

namespace HsHVerification.CognitionTraceTyping

/-- A node in a directed interaction/history graph, represented only by
    its finite set of distinct downstream event nodes. -/
structure HistoryNode (Event : Type*) [DecidableEq Event] where
  children : Finset Event

/-- The continuation set of one non-branching strand segment. -/
def singleStrandContinuation {Event : Type*} [DecidableEq Event]
    (next : Option Event) : Finset Event :=
  match next with
  | none => ∅
  | some child => {child}

/-- A single strand segment has at most one downstream continuation. -/
theorem single_strand_outdegree_le_one
    {Event : Type*} [DecidableEq Event] (next : Option Event) :
    (singleStrandContinuation next).card ≤ 1 := by
  cases next <;> simp [singleStrandContinuation]

/-- The proposed encoding preserves the exact set of downstream histories.
    This is intentionally stronger than merely preserving endpoint order. -/
def FaithfulSingleStrandEncoding
    {Event : Type*} [DecidableEq Event]
    (node : HistoryNode Event) (next : Option Event) : Prop :=
  node.children = singleStrandContinuation next

/-- Any history node faithfully encoded by one strand must have out-degree
    at most one. -/
theorem faithful_single_strand_implies_outdegree_le_one
    {Event : Type*} [DecidableEq Event]
    (node : HistoryNode Event) (next : Option Event)
    (h : FaithfulSingleStrandEncoding node next) :
    node.children.card ≤ 1 := by
  unfold FaithfulSingleStrandEncoding at h
  rw [h]
  exact single_strand_outdegree_le_one next

/-- A node with two or more distinct downstream histories cannot be
    faithfully represented by one non-branching strand segment under the
    exact-successor-set encoding above. This is not a no-go theorem for
    general tangles, branching cobordisms, or multi-strand encodings. -/
theorem branching_history_not_single_strand
    {Event : Type*} [DecidableEq Event]
    (node : HistoryNode Event) (next : Option Event)
    (hbranch : 1 < node.children.card) :
    ¬ FaithfulSingleStrandEncoding node next := by
  intro hfaithful
  have hcard : node.children.card =
      (singleStrandContinuation next).card :=
    congrArg Finset.card hfaithful
  have hle := single_strand_outdegree_le_one next
  rw [← hcard] at hle
  omega

/- Executable type-level smoke checks only; these are not physical data
   or empirical simulations. -/
#eval (singleStrandContinuation (some (7 : Nat))).card
#eval (singleStrandContinuation (none : Option Nat)).card

#print axioms branching_history_not_single_strand

end HsHVerification.CognitionTraceTyping
