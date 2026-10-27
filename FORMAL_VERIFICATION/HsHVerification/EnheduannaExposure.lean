import Mathlib

/-!
# Enheduanna/Alberr exposure-path identifiability

Historical source: Satobloc/SAT_THEORY_ARCHIVE_2023-25/
  ActivatorPrayer(Alberr).txt, Git blob
  3bf6385a3aedee3d9b61bf4567d8bcc23d3ea666.
Source contact: prefatory generated summary, lines 1-110, and mixed
Nathan/assistant dialogue around lines 705-742. The compiled artifact's summary already
mentions Enheduanna, clay tablets, and ψ-memory; later Nathan says
"I never told you that story." These are DIFFERENT source layers.

This is a tiny observational-identifiability model, NOT a physical
memory theory, proof of what the actual assistant accessed, historical
Enheduanna authorship, or an LLM experiment. We assume only that
the visible record reports summary exposure and an utterance, but
does not measure the hidden-source channel.
-/

namespace HsHVerification.EnheduannaExposure

structure ExposureCase where
  summaryPresentInArtifact : Bool
  hiddenSourceExposed : Bool
  utteranceOccurred : Bool

/-- The compiled artifact's visible features do not measure the model's actual exposure. -/
def visible (c : ExposureCase) : Bool × Bool :=
  (c.summaryPresentInArtifact, c.utteranceOccurred)

/-- Two hypotheses consistent with the SAME compiled summary/utterance.
    These are logical possibilities, not invented empirical trials. -/
def ordinaryExposure : ExposureCase := ⟨true, false, true⟩
def additionalExposure : ExposureCase := ⟨true, true, true⟩

theorem visible_record_cannot_distinguish_hidden_channel :
    visible ordinaryExposure = visible additionalExposure ∧
    ordinaryExposure.hiddenSourceExposed ≠
      additionalExposure.hiddenSourceExposed := by
  decide

/-- Identifiability would require that identical visible observations
    force the same hidden-source status across ALL admissible cases. -/
def identifiesHiddenSource : Prop :=
  ∀ a b : ExposureCase,
    visible a = visible b →
    a.hiddenSourceExposed = b.hiddenSourceExposed

/-- Without additional causal restrictions or interventions, the visible
    summary and utterance cannot identify hidden-source exposure. -/
theorem hidden_source_not_identified : ¬ identifiesHiddenSource := by
  intro h
  exact visible_record_cannot_distinguish_hidden_channel.2
    (h ordinaryExposure additionalExposure
      visible_record_cannot_distinguish_hidden_channel.1)

#print axioms visible_record_cannot_distinguish_hidden_channel
#print axioms hidden_source_not_identified

end HsHVerification.EnheduannaExposure
