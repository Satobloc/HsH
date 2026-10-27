import Mathlib

/-!
Ariadne source-fidelity gate, 2026-10-27 08:00 UTC.

Derivative podcast source:
HsH/DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_21/
The New Physics - Making _Interesting_ LLM Characters.srt
Git blob ace1b413a5574a1354cc85c51364b12d685577ae.
SRT cues 135-150 infer a universal "priority stack" from rule-breaks;
cues 249-259 explicitly describe context-gated pacing.
Underlying Kirk/Riley/Nathan TXT and raw conversation have NOT been
recovered, so this module is an assistant-selected CONDITIONAL schema,
not a transcription of Nathan's own mathematical formalism.

C is an arbitrary context type. Bool is a binary choice label, NOT an
invented observed character decision or a physical measurement.
A single observation cannot determine unobserved context responses.
Two actually observed opposing choices would refute context invariance.
These theorems do not assert that such opposing observations exist.
-/

namespace HsHVerification.AriadneContextPriority

def ContextInvariant {C : Type*} (policy : C → Bool) : Prop :=
  ∀ a b : C, policy a = policy b

theorem differing_context_choices_refute_global_policy
    {C : Type*} (policy : C → Bool) (a b : C)
    (h : policy a ≠ policy b) :
    ¬ ContextInvariant policy := by
  intro huniform
  exact h (huniform a b)

/-- Two policies can agree on a source-observed context and disagree on
    another context, provided those contexts are distinct. -/
theorem one_observation_does_not_fix_unseen_context
    {C : Type*} [DecidableEq C]
    (observed unseen : C) (hne : observed ≠ unseen) (v : Bool) :
    ∃ f g : C → Bool,
      f observed = v ∧ g observed = v ∧ f unseen ≠ g unseen := by
  refine ⟨(fun _ => v), (fun c => if c = unseen then !v else v), rfl, ?_, ?_⟩
  · simp [hne]
  · cases v <;> simp

#print axioms differing_context_choices_refute_global_policy
#print axioms one_observation_does_not_fix_unseen_context

end HsHVerification.AriadneContextPriority
