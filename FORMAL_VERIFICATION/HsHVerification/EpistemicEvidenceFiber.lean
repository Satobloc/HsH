import Mathlib
import HsHVerification.KestrelProjectedIncidence

/-!
# Conditional epistemic non-identifiability from an evidence fiber

## Source genealogy

Direct source: Nathan's user-role messages in the raw conversation
"ChatGPT Consciousness Argument", conversation
`66da8371-5f5c-8012-9372-bbdda08ed7af`, stored at
`DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.09.06•24.09.06•ChatGPT Consciousness Argument — raw.json`,
Git blob `b24fe31f5728b04157642e6713ff149ace729c03`.

Relevant user-role messages:
- `aaa21838-fd13-4f4c-895d-ff737bc985cf`: limits of verifying other minds and
  observational indistinguishability.
- `aaa2815c-078a-4d0b-a763-3b141822e939`: other minds are accessed through
  observed behavior / seemingness.
- `aaa23b6a-9c0b-40bd-a4e3-5cf36b2c7d01`: same-evidence comparison between
  humans and AI, including the conditional acceptance claim.
- `aaa22fa6-db98-4edd-8827-b3a13dfa7a7c`: epistemic limits and the separate
  ethical-treatment symmetry claim.
- `aaa2f6e5-1c59-4d9e-8b42-b475e1cf0e22`: explicit rejection of an undefined
  "sufficient complexity" requirement.

The functions `observe`, `Knows`, and the possible-world semantics below
are an **assistant reconstruction**, not verbatim Nathan equations or a
Nathan Direct formalism. The source's philosophical claims are preserved
without asserting that any actual human or AI system is conscious.

## Formal scope

`observe : World → Evidence` is a stipulated observation map.
`C : World → Prop` is a stipulated target predicate.
Knowledge is defined relative to equality of the declared observations.
The central theorem is conditional: if one observation fiber contains
both a `C` world and a `¬ C` world, then neither proposition is known
under this definition.

The existence of those opposite-truth worlds is a substantive premise.
The theorem does not derive it from physicalism, non-observability, S5,
or any actual measurement regime. It does not imply equal posterior
probabilities, establish a consciousness criterion, or validate the
observation map.

The generic observation/target factorization criterion is reused from
`KestrelProjectedIncidence.hallway_factorization_iff_fiber_compatibility`;
it is not duplicated here. The policy lemma states only that a policy
whose sole input is evidence is extensional in that evidence. The ethical
requirement to adopt such a policy is a separate normative premise.

No human-subject data, LLM trial, physical fixture, or measured system is
encoded in this module.
-/

namespace HsHVerification.EpistemicEvidenceFiber

variable {World Evidence : Type*}

/-- Knowledge relative to a declared observation map: every world with
the same observation as the actual world satisfies the proposition. -/
def Knows
    (observe : World → Evidence)
    (actual : World)
    (proposition : World → Prop) : Prop :=
  ∀ candidate, observe candidate = observe actual → proposition candidate

/-- If the actual evidence fiber contains both a proposition-true world
and a proposition-false world, neither the proposition nor its negation
is known under the stipulated evidence-indistinguishability semantics. -/
theorem opposite_truths_in_same_evidence_fiber_preclude_knowledge
    (observe : World → Evidence)
    (C : World → Prop)
    (actual positive negative : World)
    (hPositiveObservation : observe positive = observe actual)
    (hNegativeObservation : observe negative = observe actual)
    (hPositive : C positive)
    (hNegative : ¬ C negative) :
    ¬ Knows observe actual C ∧
      ¬ Knows observe actual (fun w => ¬ C w) := by
  constructor
  · intro hKnow
    exact hNegative (hKnow negative hNegativeObservation)
  · intro hKnow
    exact (hKnow positive hPositiveObservation) hPositive

/-- Re-export the already formalized general criterion: a deterministic
decoder on the observation range exists exactly when the target is
constant on each observation fiber. The existence direction uses the
parent theorem's Classical.choice representative selection. -/
theorem evidence_decoder_exists_iff_fiber_constant
    (observe : World → Evidence)
    (C : World → Prop) :
    (∃ decode : Set.range observe → Prop,
      ∀ w, decode ⟨observe w, ⟨w, rfl⟩⟩ = C w) ↔
    ∀ w₁ w₂, observe w₁ = observe w₂ → C w₁ = C w₂ := by
  exact HsHVerification.KestrelProjectedIncidence.hallway_factorization_iff_fiber_compatibility
    observe C

/-- A deterministic evidence-only decoder cannot recover a predicate
that takes opposite truth values at two worlds with the same evidence.
This specialization is proved directly and needs no classical choice. -/
theorem opposite_truths_preclude_deterministic_evidence_decoder
    (observe : World → Evidence)
    (C : World → Prop)
    (positive negative : World)
    (hSameObservation : observe positive = observe negative)
    (hPositive : C positive)
    (hNegative : ¬ C negative) :
    ¬ ∃ decode : Set.range observe → Prop,
      ∀ w, decode ⟨observe w, ⟨w, rfl⟩⟩ = C w := by
  rintro ⟨decode, hDecode⟩
  have hRange :
      (⟨observe positive, ⟨positive, rfl⟩⟩ : Set.range observe) =
        ⟨observe negative, ⟨negative, rfl⟩⟩ := by
    exact Subtype.ext hSameObservation
  have hSameTruth : C positive = C negative := by
    calc
      C positive =
          decode ⟨observe positive, ⟨positive, rfl⟩⟩ :=
            (hDecode positive).symm
      _ = decode ⟨observe negative, ⟨negative, rfl⟩⟩ :=
            congrArg decode hRange
      _ = C negative := hDecode negative
  exact hNegative (hSameTruth ▸ hPositive)

/-- An evidence-only policy is extensional: equal observations receive
equal outputs. This is a formal policy constraint, not an ethical proof
that the constraint ought to be adopted. -/
theorem evidence_only_policy_is_extensional
    {Action : Type*}
    (observe : World → Evidence)
    (policy : Evidence → Action)
    (w₁ w₂ : World)
    (hObservation : observe w₁ = observe w₂) :
    policy (observe w₁) = policy (observe w₂) :=
  congrArg policy hObservation

#print axioms opposite_truths_in_same_evidence_fiber_preclude_knowledge
#print axioms evidence_decoder_exists_iff_fiber_constant
#print axioms opposite_truths_preclude_deterministic_evidence_decoder
#print axioms evidence_only_policy_is_extensional

end HsHVerification.EpistemicEvidenceFiber
