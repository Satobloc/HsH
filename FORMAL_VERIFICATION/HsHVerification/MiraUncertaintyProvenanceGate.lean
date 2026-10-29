import Mathlib

/-!
# Mira uncertainty-provenance gate

Source anchor (historical/empirical source, not an H(s)H premise):
A. Danner et al., "Spin-rotation coupling observed in neutron interferometry",
npj Quantum Information 6, 23 (2020), DOI 10.1038/s41534-020-0254-8.
The paper's data-availability statement points to DOI 10.5291/ILL-DATA.CRG-2484.

This file proves only a generic identifiability fact: a nominal record does not
determine uncertainty-sensitive output when distinct uncertainty completions
share that nominal record. It does not validate the source-to-formalization
translation, recover the dataset, propagate experimental uncertainty, or test
SAT/H(s)H against neutron data.
-/

namespace HsHVerification

/-- A measurement record split into its nominal fields and uncertainty metadata.
The types remain abstract so no physical fixture or invented dataset is encoded. -/
structure MeasurementCompletion (Nominal Uncertainty : Type*) where
  nominal : Nominal
  uncertainty : Uncertainty

/-- Projection that forgets uncertainty metadata. -/
def forgetUncertainty {Nominal Uncertainty : Type*} :
    MeasurementCompletion Nominal Uncertainty → Nominal :=
  MeasurementCompletion.nominal

/-- Two distinct uncertainty completions over one nominal record make the
forgetful projection non-injective. -/
theorem forgetUncertainty_not_injective
    {Nominal Uncertainty : Type*}
    (n : Nominal) {u₁ u₂ : Uncertainty} (hneq : u₁ ≠ u₂) :
    ¬ Function.Injective
      (@forgetUncertainty Nominal Uncertainty) := by
  intro hinj
  have hcompletion :
      (MeasurementCompletion.mk n u₁ :
        MeasurementCompletion Nominal Uncertainty) =
      MeasurementCompletion.mk n u₂ := by
    apply hinj
    rfl
  exact hneq (congrArg MeasurementCompletion.uncertainty hcompletion)

/-- An estimate factors through nominal fields when some nominal-only function
reproduces it on every completed measurement record. -/
def FactorsThroughNominal
    {Nominal Uncertainty Output : Type*}
    (estimate : MeasurementCompletion Nominal Uncertainty → Output) : Prop :=
  ∃ f : Nominal → Output, ∀ c, estimate c = f c.nominal

/-- If an estimate changes between records with identical nominal fields, it
cannot be recovered from nominal fields alone. -/
theorem changed_estimate_blocks_nominal_factorization
    {Nominal Uncertainty Output : Type*}
    (estimate : MeasurementCompletion Nominal Uncertainty → Output)
    (c₁ c₂ : MeasurementCompletion Nominal Uncertainty)
    (sameNominal : c₁.nominal = c₂.nominal)
    (changedEstimate : estimate c₁ ≠ estimate c₂) :
    ¬ FactorsThroughNominal estimate := by
  rintro ⟨f, hf⟩
  apply changedEstimate
  calc
    estimate c₁ = f c₁.nominal := hf c₁
    _ = f c₂.nominal := congrArg f sameNominal
    _ = estimate c₂ := (hf c₂).symm

/-- Pointwise version: an uncertainty-sensitive estimate cannot be identified
from the shared nominal projection of the two records. -/
theorem uncertainty_sensitive_output_not_nominally_identified
    {Nominal Uncertainty Output : Type*}
    (estimate : MeasurementCompletion Nominal Uncertainty → Output)
    (n : Nominal) (u₁ u₂ : Uncertainty)
    (changedEstimate :
      estimate ⟨n, u₁⟩ ≠ estimate ⟨n, u₂⟩) :
    ¬ FactorsThroughNominal estimate := by
  exact changed_estimate_blocks_nominal_factorization
    estimate ⟨n, u₁⟩ ⟨n, u₂⟩ rfl changedEstimate

end HsHVerification
