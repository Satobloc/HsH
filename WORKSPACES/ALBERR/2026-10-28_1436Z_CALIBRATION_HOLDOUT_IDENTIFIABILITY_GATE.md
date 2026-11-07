# Alberr — Calibration/Holdout Identifiability Gate

**Run quantum:** architecture/prediction lane, source-critical proof-first pass  
**Selected charter:** Alberr (rotation selection only; not an authenticated historical ChatGPT instance)  
**Next cursor:** Mira  
**Status:** Lean compilation verified; empirical validation not attempted; no BEDROCK promotion

## Outcome

This pass adds a precise failure gate for a common inference in the SAT/H(s)H architecture:

> Agreement on calibration channels does not identify a unique finite-core state unless state identifiability is established; if two calibration-equivalent states disagree on a holdout channel, calibration-to-holdout transport fails.

The converse sufficient condition is also formalized: if calibration observations uniquely identify the state, then they determine every holdout readout. This is a logical implication in the encoded model, not evidence that the premise holds for SAT/H(s)H or nature.

## Governing and provenance reads

The live governing set was read before work:

- `BEDROCK.md` at commit `4cabda482c48c217614b868a2138409275df9bf7`
- `WORKSPACES/COMMON/STEERING_CHARTER_2026-10-26.md`, blob `b9b8de55f8d5add7c42cf80be7c34677ee36305e`
- `WORKSPACES/COMMON/THREE_PAPER_CAMPAIGN_2026-10-26.md`, blob `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`
- `NEW_INSTANCE_START_HERE.md`, blob `7d78afd95654bd9d41bbbcc6ba56db1fd10b3110`
- `REVIVAL_ROTATION_V3_2026-10-11.md`, blob `90863a2a2b82b2d8e37ba1bd9f796389066f5409`
- Alberr charter `WORKSPACES/ALBERR/README.md`, blob `1dc76b4939ffdcb38d02d535df338720ba2be6f9`
- incoming handoff `2026-10-28T1424Z_from_s2_to_s3_alberr.md`, blob `008c3f3a630b8c35e1479ea634127ccfbad790f5`
- prior Alberr receipt `2026-10-28T1048Z_s4_alberr.md`, blob `bbe7ecc9d79513a077a5632ae2ecb2c043d58b11`

The incoming Ariadne recoil-ratio calculation was treated as optional context and was not repeated. This pass changed lens to calibration/holdout identifiability.

## Mersearch-first historical retrieval

Mersearch locator:

- `indexes/mersearch_requests/2026-10-07-ravel-material-director-frame-001/SEARCH_RESULTS.md`
- blob `e08892e7dcc43bcef0fde4b5f62640ba45d163f5`
- generated `2026-10-07T10:55:04.607455+00:00`
- coverage recorded by the result: 3,987 files, 6,597,201 records, 224 hits

This is a lexical locator, not source authority.

Original source read in full:

- repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- snapshot: `7568462eb5d1059be9a10fe66d2cd3b296c1831f`
- path: `SATOBLOC MISC/SAT O1 4D.txt`
- blob: `7577aa1ee5a6c3850ce3b226c75377de6367aedc`
- actual read extent: entire 3,521-character file

Verbatim source mathematics:

```text
γ^μ(λ) = (λ, A_x sin(k_x λ + φ_x), A_y sin(k_y λ + φ_y), A_z sin(k_z λ + φ_z))
v^μ(λ)=dγ^μ/dλ
S[γ]=∫dλ L(γ^μ,v^μ)
L=1/2 m v^μ v_μ - V_tension(γ)
φ_i-φ_j=2πk/n
```

Source-critical finding: this source supplies a parametrized centerline, tangent, action sketch, and phase relation. It does **not** supply a typed calibration-channel family, a holdout readout, a likelihood, an uncertainty model, or a uniqueness theorem identifying a finite-core worldtube state from those observations. No correction to the historical equations was asserted; the new material below is an assistant reconstruction of a missing verification gate.

## Formal proposition

For arbitrary types `State`, `Channel`, and `Observable`, and a prediction map

`predict : State → Channel → Observable`:

1. `AgreeOn predict calibration state₁ state₂` means both states predict equal observables on every calibration channel.
2. `CalibrationIdentifiesState` means calibration agreement forces equality of states.
3. `CalibrationDeterminesHoldout` means calibration agreement forces agreement on every holdout channel.

Theorems:

- distinct calibration twins refute state identification;
- one holdout disagreement witnesses failure of calibration-to-holdout transport;
- state identification is sufficient for holdout transport;
- agreement restricts from a larger channel set to any subset.

## Exact Lean 4 code

File: `FORMAL_VERIFICATION/HsHVerification/ArchiveEQ0046.lean`

```lean
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

def AgreeOn {State Channel Observable : Type*}
    (predict : State → Channel → Observable)
    (channels : Set Channel) (state₁ state₂ : State) : Prop :=
  ∀ channel ∈ channels, predict state₁ channel = predict state₂ channel

def CalibrationIdentifiesState {State Channel Observable : Type*}
    (predict : State → Channel → Observable)
    (calibration : Set Channel) : Prop :=
  ∀ state₁ state₂, AgreeOn predict calibration state₁ state₂ → state₁ = state₂

def CalibrationDeterminesHoldout {State Channel Observable : Type*}
    (predict : State → Channel → Observable)
    (calibration holdout : Set Channel) : Prop :=
  ∀ state₁ state₂,
    AgreeOn predict calibration state₁ state₂ →
      AgreeOn predict holdout state₁ state₂

theorem distinct_calibration_twins_refute_identification
    {State Channel Observable : Type*}
    (predict : State → Channel → Observable)
    (calibration : Set Channel) (state₁ state₂ : State)
    (hcalibration : AgreeOn predict calibration state₁ state₂)
    (hdistinct : state₁ ≠ state₂) :
    ¬ CalibrationIdentifiesState predict calibration := by
  intro hidentifies
  exact hdistinct (hidentifies state₁ state₂ hcalibration)

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
```

## Compilation receipt

- repository: `Satobloc/HsH`
- branch: `codex/eq0015-elias-20261024`
- code head: `4ce5baf0a6d2d03eb51baece3114b456f8896af8`
- workflow: `Lean 4 verification`
- run: `40708768056`, run number 294
- job: `122888773092`
- environment: Lean `4.34.0`, Lake `5.0.0-src+293d5d0`, mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`
- outcome: **success**, 8,964 jobs
- CI emitted for each new theorem: `does not depend on any axioms`

This proves only the encoded propositions. It does not establish translation fidelity, physical existence, empirical adequacy, or independence of validation.

## Architecture/test matrix

| Hypothesis under test | Shared/calibrated information | Holdout observable | Standard comparator | Exact failure discriminator |
|---|---|---|---|---|
| Centerline observations uniquely identify the relevant finite-core state | SAT-O centerline/trajectory channels and any fitted `A_i,k_i,φ_i` | A radius-, framing-, twist-, or contact-sensitive readout not used in calibration | Any comparator making the same calibration fit with explicit parameter count and uncertainty | Two distinct admissible states agree on every calibration channel but disagree on one declared holdout channel |
| Worldtube thickness is forced by SAT-O 1.4D | Historical centerline and action sketch | Independently measured thickness-sensitive channel | Centerline-only model | No constitutive map, projection, boundary condition, or source theorem determines thickness; thickness remains optional/unidentified |
| Calibration fit transports to independent prediction | Fixed shared parameters estimated once on calibration data | Predeclared held-out dataset/readout with provenance and uncertainty | Standard model fitted on the same calibration split | Holdout residual exceeds a preregistered uncertainty-aware threshold, or SAT/H(s)H needs holdout retuning |
| Shape hierarchy is observationally coherent | Explicit maps between centerline, finite core, framing/twist/contact state | A downstream readout | Direct readout from the richer state | Projection compositions fail to commute under stated conditions, or a projection erases a difference the holdout channel detects |

No measured system or dataset was selected in this quantum, so no physical calculation was performed. A future empirical check must name the actual system, data provenance, units, uncertainties, calibration split, holdout split, prediction rule, comparator, and falsification threshold before calculation.

## Deliberate unrelated reading

Read `SAT Mark V/TheTANGLE.txt`, blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 981–1040. Honest takeaway: the passage treats historical knowledge as fragmentary and biased, which is useful as a historiographic caution but does not force a physical equivalence. Return cursor: line 1041.

## Epistemic ledger

- **Historical source:** SAT-O equations and prose at the archive snapshot above.
- **Nathan Direct:** proof-first requirement, calibration/holdout separation, explicit projections, no empirical promotion from Lean.
- **Assistant reconstruction:** the typed channel/state gate and the test matrix.
- **Standard logical result:** injective calibration readout is sufficient for transporting equality to all holdouts.
- **Independent measurement:** none in this quantum.
- **Publication status:** report and proof are suitable for public-safe review; theory status unchanged.

## Mira handoff cursor

Audit whether any current H(s)H document supplies an explicit observation map, likelihood, uncertainty model, or uniqueness claim strong enough to justify `CalibrationIdentifiesState`. Preserve exact bibliographic/source identity and distinguish a source assertion from an assistant reconstruction. If none exists, record that absence and propose the minimal source/data artifact needed to make the claim testable.
