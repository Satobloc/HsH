import Mathlib

namespace HsHVerification.ModelSelectionPreference

/-!
# Non-compensatory intelligibility preference

This is an assistant-proposed workflow contract derived from the 2026-11-08
methodological preference for human-graspable geometric models. It is not a
Nathan Direct theorem and it is not a physical model.

The hard-gate propositions are external evidence obligations. They must be
established from source-authorized maps, an identifiable measured system,
versioned data and uncertainty, a matched standard comparator, frozen shared
parameters, and an independent holdout. Lean does not establish any of those
premises.

The empirical-equivalence and human-preference relations are also inputs.
This module proves only that an intelligibility preference is admitted as a
tie-break after the hard gates, and cannot rescue a candidate that fails them.
-/

/-- A componentwise complexity ledger. It is deliberately a vector, not a
    weighted scalar: no arbitrary exchange rate is assigned between new
    primitives, free functions, parameters, boundary conditions, retuning,
    discrepancy freedom, and external priors. -/
structure ComplexityFootprint where
  addedPrimitives : Nat
  unconstrainedFunctions : Nat
  freeParameters : Nat
  unconstrainedBoundaryConditions : Nat
  channelSpecificRetunings : Nat
  discrepancyDegrees : Nat
  externalPriors : Nat
deriving DecidableEq, Repr

/-- Componentwise no-greater complexity. -/
def noMoreComplex (a b : ComplexityFootprint) : Prop :=
  a.addedPrimitives ≤ b.addedPrimitives ∧
  a.unconstrainedFunctions ≤ b.unconstrainedFunctions ∧
  a.freeParameters ≤ b.freeParameters ∧
  a.unconstrainedBoundaryConditions ≤ b.unconstrainedBoundaryConditions ∧
  a.channelSpecificRetunings ≤ b.channelSpecificRetunings ∧
  a.discrepancyDegrees ≤ b.discrepancyDegrees ∧
  a.externalPriors ≤ b.externalPriors

/-- A candidate model plus the external evidence obligations required before
    an intelligibility preference can affect model selection. -/
structure Candidate where
  sourceAdmissible : Prop
  mapsDefinedAndComposable : Prop
  measuredDataAndUncertaintyReady : Prop
  matchedStandardComparator : Prop
  identifiableAfterNuisance : Prop
  sharedParametersFrozen : Prop
  independentHoldoutPasses : Prop
  complexity : ComplexityFootprint

/-- The non-compensatory evidence gate. Each field is a proposition to be
    established outside Lean from the relevant source and measured system. -/
def hardGate (c : Candidate) : Prop :=
  c.sourceAdmissible ∧
  c.mapsDefinedAndComposable ∧
  c.measuredDataAndUncertaintyReady ∧
  c.matchedStandardComparator ∧
  c.identifiableAfterNuisance ∧
  c.sharedParametersFrozen ∧
  c.independentHoldoutPasses

/-- Intelligibility is allowed to select between empirically equivalent,
    hard-gate-passing candidates only when the preferred candidate is no more
    complex componentwise. The two relations are supplied by human/source
    review and real-data evaluation; they are not computed by this theorem. -/
def intelligibilityTieBreak
    (empiricallyEquivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : Candidate) : Prop :=
  hardGate a ∧
  hardGate b ∧
  empiricallyEquivalent a b ∧
  humanPrefers a b ∧
  noMoreComplex a.complexity b.complexity

theorem tieBreak_requires_both_hard_gates
    (equivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : Candidate)
    (h : intelligibilityTieBreak equivalent humanPrefers a b) :
    hardGate a ∧ hardGate b := ⟨h.1, h.2.1⟩

theorem tieBreak_requires_empirical_equivalence
    (equivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : Candidate)
    (h : intelligibilityTieBreak equivalent humanPrefers a b) :
    equivalent a b := h.2.2.1

theorem tieBreak_requires_no_greater_complexity
    (equivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : Candidate)
    (h : intelligibilityTieBreak equivalent humanPrefers a b) :
    noMoreComplex a.complexity b.complexity := h.2.2.2.2

theorem intelligibility_cannot_rescue_failed_candidate
    (equivalent : Candidate → Candidate → Prop)
    (humanPrefers : Candidate → Candidate → Prop)
    (a b : Candidate)
    (hfail : ¬ hardGate a) :
    ¬ intelligibilityTieBreak equivalent humanPrefers a b := by
  intro h
  exact hfail h.1

#print axioms tieBreak_requires_both_hard_gates
#print axioms tieBreak_requires_empirical_equivalence
#print axioms tieBreak_requires_no_greater_complexity
#print axioms intelligibility_cannot_rescue_failed_candidate

end HsHVerification.ModelSelectionPreference
