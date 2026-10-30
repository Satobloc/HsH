import Mathlib

/-!
# ArchiveEQ0046 — calibration/holdout identifiability gate

Mersearch-first locator:
`indexes/mersearch_requests/2026-10-07-ravel-material-director-frame-001/SEARCH_RESULTS.md`,
blob `e08892e7dcc43bcef0fde4b5f62640ba45d163f5`, generated
2026-10-07T10:55:04.607455+00:00. It is a lexical locator, not authority.

Historical source read completely:
`Satobloc/SAT_THEORY_ARCHIVE_2023-25@7568462eb5d1059be9a10fe66d2cd3b296c1831f`,
`SATOBLOC MISC/SAT O1 4D.txt`, blob
`7577aa1ee5a6c3850ce3b226c75377de6367aedc`.

The source gives the parametrized centerline
`gamma^mu(lambda) = (lambda,
 A_x sin(k_x lambda + phi_x),
 A_y sin(k_y lambda + phi_y),
 A_z sin(k_z lambda + phi_z))`,
its tangent `v^mu = d gamma^mu / d lambda`, an action, and a phase-lock
condition. It does not provide a typed calibration-channel family, holdout
readout, likelihood, or theorem that these observations identify a unique
finite-core worldtube state.

This module is an assistant reconstruction of the missing verification gate.
It proves only implications among the definitions below. Lean does not prove
that the source translation is complete, that any physical state realizes
the types, or that any empirical calibration/holdout data satisfy them.
-/

namespace HsHVerification.ArchiveEQ0046

/-- Two candidate states agree on every channel in a declared channel set. -/
def AgreeOn {State Channel Observable : Type*}
    (predict : State → Channel → Observable)
    (channels : Set Channel) (state₁ state₂ : State) : Prop :=
  ∀ channel ∈ channels, predict state₁ channel = predict state₂ channel

/-- Calibration identifies state when calibration agreement forces equality. -/
def CalibrationIdentifiesState {State Channel Observable : Type*}
    (predict : State → Channel → Observable)
    (calibration : Set Channel) : Prop :=
  ∀ state₁ state₂, AgreeOn predict calibration state₁ state₂ → state₁ = state₂

/-- Calibration agreement transports to every declared holdout channel. -/
def CalibrationDeterminesHoldout {State Channel Observable : Type*}
    (predict : State → Channel → Observable)
    (calibration holdout : Set Channel) : Prop :=
  ∀ state₁ state₂,
    AgreeOn predict calibration state₁ state₂ →
      AgreeOn predict holdout state₁ state₂

/-- Distinct calibration twins refute state identification. -/
theorem distinct_calibration_twins_refute_identification
    {State Channel Observable : Type*}
    (predict : State → Channel → Observable)
    (calibration : Set Channel) (state₁ state₂ : State)
    (hcalibration : AgreeOn predict calibration state₁ state₂)
    (hdistinct : state₁ ≠ state₂) :
    ¬ CalibrationIdentifiesState predict calibration := by
  intro hidentifies
  exact hdistinct (hidentifies state₁ state₂ hcalibration)

/-- One differing holdout channel refutes calibration-to-holdout transport. -/
theorem holdout_witness_refutes_transport
    {State Channel Observable : Type*}
    (predict : State → Channel → Observable)
    (calibration holdout : Set Channel)
    (state₁ state₂ : State) (channel : Channel)
    (hcalibration : AgreeOn predict calibration state₁ state₂)
    (hchannel : channel ∈ holdout)
    (hdifferent :
      predict state₁ channel ≠ predict state₂ channel) :
    ¬ CalibrationDeterminesHoldout predict calibration holdout := by
  intro hdetermines
  exact hdifferent
    (hdetermines state₁ state₂ hcalibration channel hchannel)

/--
If calibration truly identifies the complete state, then calibration
agreement determines every holdout readout. This is a sufficient logical
condition, not evidence that a real calibration has it.
-/
theorem identification_implies_holdout_transport
    {State Channel Observable : Type*}
    (predict : State → Channel → Observable)
    (calibration holdout : Set Channel)
    (hidentifies : CalibrationIdentifiesState predict calibration) :
    CalibrationDeterminesHoldout predict calibration holdout := by
  intro state₁ state₂ hcalibration
  have hstate : state₁ = state₂ :=
    hidentifies state₁ state₂ hcalibration
  subst state₂
  intro channel hchannel
  rfl

/-- Agreement on a larger channel set restricts to every subset. -/
theorem agreement_restricts_to_subset
    {State Channel Observable : Type*}
    (predict : State → Channel → Observable)
    (larger smaller : Set Channel)
    (hsubset : smaller ⊆ larger)
    (state₁ state₂ : State)
    (hagree : AgreeOn predict larger state₁ state₂) :
    AgreeOn predict smaller state₁ state₂ := by
  intro channel hchannel
  exact hagree channel (hsubset hchannel)

#print axioms distinct_calibration_twins_refute_identification
#print axioms holdout_witness_refutes_transport
#print axioms identification_implies_holdout_transport
#print axioms agreement_restricts_to_subset

end HsHVerification.ArchiveEQ0046
