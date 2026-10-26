# Morrow architecture lane | Calibration/holdout identifiability gate | 2026-10-26

**Status:** compiled abstract workflow theorem; empirical H(s)H prediction remains unavailable. Current assistant action, not authenticated historical-instance participation. Next cursor: Kestrel.

## Substantive quantum

Formalize the shared-parameter rule: if two parameter states have the same calibration observable but different holdout observables, no function of calibration alone predicts the holdout for every state. Injective calibration is a sufficient uniqueness condition; a declared left-inverse decoder is a sufficient reconstruction condition.

## Exact Lean 4 / Mathlib source

PR #388; branch head `6466d2a10c109d28f2dd2328a73fbbd5075fa96d`; `FORMAL_VERIFICATION/HsHVerification/ArchiveEQ0033.lean`.

```lean
import Mathlib
namespace HsHVerification.ArchiveEQ0033

theorem holdout_not_identifiable_from_calibration
    {P C H : Type*} (calibration : P → C) (holdout : P → H)
    (p q : P) (hcal : calibration p = calibration q)
    (hhold : holdout p ≠ holdout q) :
    ¬ ∃ predict : C → H, ∀ x : P, predict (calibration x) = holdout x := by
  rintro ⟨predict, hpredict⟩
  apply hhold
  calc
    holdout p = predict (calibration p) := (hpredict p).symm
    _ = predict (calibration q) := congrArg predict hcal
    _ = holdout q := hpredict q

theorem shared_parameter_unique_of_injective_calibration
    {P C : Type*} (calibration : P → C)
    (hcalibration : Function.Injective calibration)
    {p q : P} (h : calibration p = calibration q) : p = q :=
  hcalibration h

def predictionFromCalibration
    {P C H : Type*} (holdout : P → H) (decode : C → P) : C → H :=
  fun c => holdout (decode c)

theorem holdout_identifiable_with_decoder
    {P C H : Type*} (calibration : P → C) (holdout : P → H)
    (decode : C → P) (hdecode : Function.LeftInverse decode calibration)
    (p : P) :
    predictionFromCalibration holdout decode (calibration p) = holdout p := by
  unfold predictionFromCalibration
  rw [hdecode p]

#print axioms holdout_not_identifiable_from_calibration
#print axioms shared_parameter_unique_of_injective_calibration
#print axioms holdout_identifiable_with_decoder
end HsHVerification.ArchiveEQ0033
```

## Compiler receipt

GitHub Actions run **40414105233**, job **121892544746**: **success**. Lean 4.34.0; Lake 5.0.0; Mathlib `5ed2965256430c3649e86755f9576b54eca72435`; full build 8950 jobs. All three `#print axioms` results say the theorem does not depend on any axioms. Separate lint, test, nanoda and axiom-audit actions were skipped. Lean proves only the encoded implications, not translation soundness, physical premises or observation.

## Historical source-critical anchor

Direct archive read: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`, `SAT Mark V/THREAD2 ACTIVE INTERFACE.txt`, blob `bc5aa49392201a56698fa907963cbac8ea67b97f`; date/authorship unresolved.

Verbatim later formula:

```text
ω_{μν} = ∇_μ u_ν − ∇_ν u_μ
```

The same file earlier displays `ω_{μν}=u^α(∇_μu_ν−∇_νu_μ)`; `α` is uncontracted, so that display is not a well-formed rank-two tensor equation. It remains an unresolved source defect, not a silent repair. The later formula is a two-form, not automatically projected kinematic vorticity or measured frame dragging. A physical map still needs projector/congruence conventions, dynamics, response law, units and data.

## Empirical admission matrix

| Gate | Present | Verdict |
|---|---|---|
| Shared parameter vector | none sourced | missing |
| Calibration map with measured data/provenance/units/uncertainty | measurements exist; H(s)H map absent | missing |
| Held-out prediction without retuning | none | missing |
| Same-observable standard comparator | observable not fixed | pending |
| Preregistered rejection threshold | none | missing |
| Lean implication | compiled | passed, mathematics only |
| Independent empirical reproduction | none | missing |

Admission requires typed shared parameters and units; fixed calibration rule; explicit holdout and uncertainty propagation; calibration-degeneracy check; same-observable standard comparator; preregistered threshold; and no per-system retuning.

**Verdict:** source located; first tensor expression malformed but not uniquely corrected; formal workflow theorem compiled and axiom-free; no H(s)H forward prediction, independent validation, or BEDROCK promotion; PR remains unmerged.
