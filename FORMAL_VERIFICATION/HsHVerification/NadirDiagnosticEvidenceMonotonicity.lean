import Mathlib

/-!
# Evidence-deletion monotonicity for diagnostic contracts

Source transcription: Han, "Where Do Multi-Agent Systems Fail? Evidence-Grounded
Diagnosis of Collective Mechanisms", arXiv:2609.38761v2 (2026-10-16), Section 3.3,
Equations (4)-(5), Proposition 3.1.

This module formalizes only the set-level consequence after candidate execution
sets have already been constructed. It assumes that a legal evidence deletion
enlarges the candidate set and that both candidate sets are nonempty.

It does not encode the evidence-bundle integrity check, source/operation binding,
record completeness, or the derivation of candidate-set inclusion from runtime
logs. Those remain separate source-to-model obligations.
-/

namespace HsHVerification.NadirDiagnosticEvidenceMonotonicity

universe u

variable {Ω : Type u}

inductive Verdict where
  | supported
  | ruledOut
  | unknown
  deriving DecidableEq, Repr

def Supports (W : Set Ω) (p : Ω → Prop) : Prop :=
  ∀ w, w ∈ W → p w

def RulesOut (W : Set Ω) (p : Ω → Prop) : Prop :=
  ∀ w, w ∈ W → ¬ p w

/-- The source's three-valued diagnosis, restricted to integrity-checked,
nonempty candidate sets. -/
noncomputable def diagnose (W : Set Ω) (_hW : W.Nonempty)
    (p : Ω → Prop) : Verdict := by
  classical
  exact if h : Supports W p then .supported
    else if h : RulesOut W p then .ruledOut
    else .unknown

/-- Nonempty candidate sets cannot license both resolved verdicts. -/
theorem integrity_excludes_dual_resolved
    (W : Set Ω) (p : Ω → Prop) (hW : W.Nonempty) :
    ¬ (Supports W p ∧ RulesOut W p) := by
  rintro ⟨hs, hr⟩
  rcases hW with ⟨w, hw⟩
  exact hr w hw (hs w hw)

/-- If the weaker, deleted-evidence bundle supports a violation, the stronger
bundle supports it too. -/
theorem supported_survives_evidence_deletion
    (W W' : Set Ω) (p : Ω → Prop)
    (hW : W.Nonempty) (hW' : W'.Nonempty)
    (hsubset : W ⊆ W') :
    diagnose W' hW' p = .supported →
      diagnose W hW p = .supported := by
  classical
  intro h
  have hs' : Supports W' p := by
    by_contra hnot
    by_cases hr' : RulesOut W' p
    · have hfalse : False := by
        simpa [diagnose, hnot, hr'] using h
      exact hfalse.elim
    · have hfalse : False := by
        simpa [diagnose, hnot, hr'] using h
      exact hfalse.elim
  have hs : Supports W p := by
    intro w hw
    exact hs' w (hsubset hw)
  simp [diagnose, hs]

/-- If the weaker, deleted-evidence bundle rules out a violation, the stronger
bundle rules it out too. Nonemptiness prevents vacuous support from taking
precedence over the ruled-out branch. -/
theorem ruledOut_survives_evidence_deletion
    (W W' : Set Ω) (p : Ω → Prop)
    (hW : W.Nonempty) (hW' : W'.Nonempty)
    (hsubset : W ⊆ W') :
    diagnose W' hW' p = .ruledOut →
      diagnose W hW p = .ruledOut := by
  classical
  intro h
  have hnotSup' : ¬ Supports W' p := by
    intro hs'
    have hfalse : False := by
      simpa [diagnose, hs'] using h
    exact hfalse.elim
  have hr' : RulesOut W' p := by
    by_contra hnot
    have hfalse : False := by
      simpa [diagnose, hnotSup', hnot] using h
    exact hfalse.elim
  have hr : RulesOut W p := by
    intro w hw
    exact hr' w (hsubset hw)
  have hnotSup : ¬ Supports W p := by
    intro hs
    rcases hW with ⟨w, hw⟩
    exact hr w hw (hs w hw)
  simp [diagnose, hnotSup, hr]

/-- Equivalent form of Proposition 3.1: after legal evidence deletion, the
verdict is either unchanged or becomes unknown. -/
theorem deletion_result_is_same_or_unknown
    (W W' : Set Ω) (p : Ω → Prop)
    (hW : W.Nonempty) (hW' : W'.Nonempty)
    (hsubset : W ⊆ W') :
    diagnose W' hW' p = diagnose W hW p ∨
      diagnose W' hW' p = .unknown := by
  classical
  cases hdel : diagnose W' hW' p with
  | supported =>
      left
      exact (supported_survives_evidence_deletion
        W W' p hW hW' hsubset hdel).symm
  | ruledOut =>
      left
      exact (ruledOut_survives_evidence_deletion
        W W' p hW hW' hsubset hdel).symm
  | unknown =>
      right
      rfl

#print axioms integrity_excludes_dual_resolved
#print axioms supported_survives_evidence_deletion
#print axioms ruledOut_survives_evidence_deletion
#print axioms deletion_result_is_same_or_unknown

end HsHVerification.NadirDiagnosticEvidenceMonotonicity
