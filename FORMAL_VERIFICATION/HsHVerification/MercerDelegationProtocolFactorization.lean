import Mathlib

/-!
# Mercer: source-grounded delegation protocol factorization

Historical source:
Yoonsu Kim, Sean Kim, Kihoon Son, Saelyne Yang, and Juho Kim,
"What Did the AI Take On? Characterizing Cognitive Delegation in LLM Reasoning,"
arXiv:2610.06328v1 (2026-10-05), especially the delegation-enactment and
desired-protocol analyses in Sections 4.3–5.3.

The paper distinguishes three retrospective properties of a work step:
initiative (user- or AI-initiated), impact (wanted or unwanted), and
criticality (critical or minor). It separately records the participant's
desired interaction protocol (full delegation, disclosure, calibration, or
consultation).

The paper reports both full-delegation and consultative preferences among
AI-initiated, wanted, critical work ("Beneficial Autonomy"). It reports that
28% of those critical AI-initiated wanted steps called for some user
involvement. The two observations below encode only the existence of two
source-reported category combinations. They are NOT raw participant records,
reconstructed counts, or a frequency model.

This module proves that the three-axis enactment label alone cannot determine
the desired protocol for every source-compatible observation. Adding work
type, task context, user expertise, or other information could refine a
predictive model; this theorem does not rule that out.

The proof checks only this finite formalization of the paper's taxonomy. It
does not validate the paper's annotations, establish a universal human
preference, measure model cognition, or establish any physical/geometric
equivalence.
-/

namespace HsHVerification.MercerDelegationProtocolFactorization

inductive Initiative where
  | user
  | ai
  deriving DecidableEq, Repr

inductive Impact where
  | wanted
  | unwanted
  deriving DecidableEq, Repr

inductive Criticality where
  | critical
  | minor
  deriving DecidableEq, Repr

inductive DesiredProtocol where
  | fullDelegation
  | disclosedDelegation
  | calibratedDelegation
  | consultativeDelegation
  deriving DecidableEq, Repr

/-- One annotated work-step, keeping enactment and desired interaction separate. -/
structure DelegationObservation where
  initiative : Initiative
  impact : Impact
  criticality : Criticality
  desiredProtocol : DesiredProtocol
  deriving DecidableEq, Repr

/-- The paper's coarse enactment projection; it deliberately omits desired protocol. -/
def enactment (o : DelegationObservation) :
    Initiative × Impact × Criticality :=
  (o.initiative, o.impact, o.criticality)

/-- Source-reported pattern: AI-initiated, wanted, critical work with full delegation. -/
def beneficialFull : DelegationObservation :=
  { initiative := .ai
    impact := .wanted
    criticality := .critical
    desiredProtocol := .fullDelegation }

/-- Source-reported pattern: the same coarse enactment with consultation desired. -/
def beneficialConsultative : DelegationObservation :=
  { initiative := .ai
    impact := .wanted
    criticality := .critical
    desiredProtocol := .consultativeDelegation }

theorem source_patterns_share_enactment :
    enactment beneficialFull = enactment beneficialConsultative := by
  rfl

theorem source_patterns_differ_in_desired_protocol :
    beneficialFull.desiredProtocol ≠ beneficialConsultative.desiredProtocol := by
  decide

/--
No deterministic function of initiative × impact × criticality alone can
recover desired protocol for every observation represented by the source's
reported category combinations.
-/
theorem desired_protocol_does_not_factor_through_enactment :
    ¬ ∃ f : Initiative × Impact × Criticality → DesiredProtocol,
        ∀ o : DelegationObservation, f (enactment o) = o.desiredProtocol := by
  rintro ⟨f, hf⟩
  have h₁ := hf beneficialFull
  have h₂ := hf beneficialConsultative
  have hSame : enactment beneficialFull = enactment beneficialConsultative := rfl
  have hDiff :
      beneficialFull.desiredProtocol ≠ beneficialConsultative.desiredProtocol := by
    decide
  apply hDiff
  calc
    beneficialFull.desiredProtocol = f (enactment beneficialFull) := h₁.symm
    _ = f (enactment beneficialConsultative) := congrArg f hSame
    _ = beneficialConsultative.desiredProtocol := h₂

theorem wanted_ai_initiated_can_still_request_consultation :
    beneficialConsultative.initiative = .ai ∧
    beneficialConsultative.impact = .wanted ∧
    beneficialConsultative.criticality = .critical ∧
    beneficialConsultative.desiredProtocol = .consultativeDelegation := by
  simp [beneficialConsultative]

#eval (enactment beneficialFull, beneficialFull.desiredProtocol)
#eval (enactment beneficialConsultative, beneficialConsultative.desiredProtocol)
#eval decide (enactment beneficialFull = enactment beneficialConsultative)
#eval decide
  (beneficialFull.desiredProtocol ≠ beneficialConsultative.desiredProtocol)

#print axioms source_patterns_share_enactment
#print axioms source_patterns_differ_in_desired_protocol
#print axioms desired_protocol_does_not_factor_through_enactment
#print axioms wanted_ai_initiated_can_still_request_consultation

end HsHVerification.MercerDelegationProtocolFactorization
