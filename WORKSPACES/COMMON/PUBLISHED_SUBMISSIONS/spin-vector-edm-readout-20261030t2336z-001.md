# Framed-worldtube spin readout gate: 2026 muon EDM update

Date: 2026-10-30T23:36Z

**Status:** NEW REAL-DATA READOUT ADDED; MODEL-TO-OBSERVABLE INTERFACE PROPOSED; H(s)H SPIN DYNAMICS UNRESOLVED; NO THEORY PROMOTION.

## 1. Source hierarchy and attribution

### Nathan Direct: recovered September 1, 2026 source

Raw export: `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_10/26.08.31•26.09.01•NEWTO-SAT ChatGPT Voice Glitch — raw.json`, repository commit `2889de5baa279a5d8b8974de1b0b76aacb4a4677`, Git blob `001084962c2cdfd08d88154f14069e7fc8bf45e0`.

- Conversation ID: `6a958d9c-c4fc-83e9-a106-66d2025220c4`
- User-message ID: `bda16543-cf97-487f-9038-b14c55074da2`
- Timestamp: `2026-09-01T21:42:34.707Z`
- Role: `user`

The message explores several tentative constructions: a persistent helical filament; spin as shelf-cocking/precession of a Kerr-ring orientation relative to the worldtube tangent; and a wobble of the primary helical plane relative to the timesheet. It also entertains nested spin/flavor helices. The message explicitly treats these as alternatives under discussion, not a finalized equation or unique physical construction.

The immediately preceding assistant message introduced a hard-drive/lazy-Susan analogy. That analogy is assistant-authored and is not attributed to Nathan.

Current BEDROCK records ND-2026-10-22-02 as an active constraint: literal rotational spin and precession/shelf-cocking are not optional decorative interpretations. The raw October 22 source-message locator was not recovered in this pass; the September 1 raw message above is the independently recovered primary witness used here.

## 2. Existing H(s)H constraints and repetition check

This is an additive new observable gate, not a re-run of the existing magnetic-moment calculations.

- Existing Morrow finite-core spin/magnetic-moment bound: issue #337. Under its stated one-sign, co-moving charge/current assumptions, the classical finite-support model cannot reach the measured electron magnetic moment at the chosen support scale. Its theorem is conditional; it does not exclude other carriers or field angular momentum.
- Existing Morrow E989 orbital/spin winding: issue #515. It is a measured-a_mu-driven reconstruction, not an independent H(s)H spin prediction.
- Existing Orson electron/muon Kerr-Newman and g-2 controls: issues #500 and #518. Kerr-Newman g=2 is a standard comparator, not an H(s)H derivation; the classical co-moving ring gives g=1; the finite-core physical spin/current law remains unresolved.
- Existing Alberr Spin(4) stabilizer result: the same centerline can admit different frame lifts with opposite endpoint signs. It is a conditional geometric result, not identification of a physical spinor.
- Existing Meridian STAR_002 result: a rigidly rotating congruence has a nonintegrable metric-dual one-form, so the bulk rotation field cannot itself be the normal congruence to a family of timesheets. The sheet normal and rotating frame must not be silently identified.
- Existing HAGALAZ_DEF+ two-rate/frame-history machinery is a possible geometric representation, but it does not yet supply a physical magnetic- or electric-dipole readout law.
- The historical SATv-to-standard map is qualitative on chirality and supplies no quantitative g-2 or EDM formula. It is not treated as Nathan Direct.

No existing open issue found in the bounded issue search specifically covers the 2026 Fermilab muon EDM result. No existing published artifact is overwritten.

## 3. Measured systems and provenance

### Muon magnetic anomaly

The Fermilab final-result world average is

`a_mu(exp) = 1165920715(145) × 10^-12 = 116592071.5(14.5) × 10^-11`.

The 2025 Standard Model update reports

`a_mu(SM) = 116592033(62) × 10^-11`,

using a consolidated lattice-QCD leading-order hadronic-vacuum-polarization average. The review reports a difference of `38(63) × 10^-11` and no current tension. It also documents unresolved disagreement among data-driven dispersive evaluations of that hadronic contribution. The comparator is therefore versioned by its HVP treatment; the older 5-sigma anomaly framing is not the current baseline.

### Muon electric dipole moment

The Muon g-2 Collaboration preprint `arXiv:2608.11124`, submitted 2026-08-11, reports

`d_mu = (-0.35 ± 0.19_stat ± 0.34_sys) × 10^-19 e·cm`

and the direct limit

`|d_mu| < 1.10 × 10^-19 e·cm` at 95% confidence.

The analysis uses 2019–2020 Fermilab data and only 25% of the experiment's data. The tracking detectors measure the average vertical positron decay angle. The Fermilab description explicitly distinguishes the horizontal wobble used for the magnetic-moment analysis from the vertical wobble used for the EDM analysis, and states that the EDM search uses the same data stream. These are two readouts of one experiment, not independent experimental replications. The collaboration uses positive muons; its conventional negative-muon sign convention reverses the reported sign. The magnitude limit is used here, so no sign interpretation is required.

### Electron electric dipole moment

Roussy et al., Science (2023), using electrons in HfF+ molecular ions, report

`d_e = (-1.3 ± 2.0_stat ± 0.6_sys) × 10^-30 e·cm`

and

`|d_e| < 4.1 × 10^-30 e·cm` at 90% confidence.

This is a separate experimental platform and supplies an independent cross-lepton constraint. The electron and muon limits have different confidence levels and different experimental systems; they must not be combined by simply comparing or pooling their quoted upper limits.

## 4. Executed real-data arithmetic

All arithmetic below uses the published measured values and uncertainties above. No invented physical system, fixture, initial condition, or measurement is used.

Python calculation:

```python
import math

# All a_mu quantities in units of 1e-11.
a_exp, s_exp = 1165920715 / 10, 145 / 10
a_sm, s_sm = 116592033, 62
delta = a_exp - a_sm
s_delta = math.hypot(s_exp, s_sm)
z_delta = delta / s_delta
p_two_sided = math.erfc(abs(z_delta) / math.sqrt(2))
ci95 = (delta - 1.96*s_delta, delta + 1.96*s_delta)

# EDM errors: stat and systematic quadrature, in their published units.
s_dmu = math.hypot(0.19, 0.34)
z_dmu = -0.35 / s_dmu
s_de = math.hypot(2.0, 0.6)
z_de = -1.3 / s_de
```

Results:

- `a_mu(exp)-a_mu(SM) = 38.5 × 10^-11`.
- `sigma_combined = 63.67 × 10^-11`.
- `z = 0.605`; two-sided Gaussian `p ≈ 0.545`.
- Approximate 95% Gaussian interval for a fixed H(s)H shift relative to this SM baseline: `[-86.3, +163.3] × 10^-11`.
- The independent arithmetic agrees with the review's rounded `38(63) × 10^-11` result. It does not reveal a g-2 anomaly for H(s)H to explain.
- Muon EDM quadrature uncertainty: `0.3895 × 10^-19 e·cm`; central value is `-0.899 sigma` from zero. The published 95% upper limit is retained rather than reconstructed from rounded component errors.
- Electron EDM quadrature uncertainty: `2.088 × 10^-30 e·cm`; central value is `-0.623 sigma` from zero. The published 90% upper limit is retained rather than reconstructed from rounded component errors.

These are standard-data consistency calculations, not H(s)H predictions, parameter fits, or independent measurements.

## 5. Architecture improvement: one framed spin state, multiple readouts

The source genealogy and existing geometry results imply that a centerline-only particle state is insufficient for a spin readout:

1. Nathan's recovered source describes a Kerr-ring orientation relative to a worldtube tangent and a precessing plane relative to the timesheet.
2. The existing Spin(4) stabilizer result shows that the same centerline can carry different frame lifts. Centerline winding alone therefore does not fix the spin lift.
3. The STAR_002 Frobenius result separates a rotating bulk congruence from the normal to the timesheet. The transported spin frame and the timesheet normal are distinct typed objects.

A minimal **interface proposal**, not a derived physical equation, is therefore:

`R_spin(Γ, F, n_sheet; E, B, β, Θ_shared) -> (ω_horizontal, ω_vertical, a_l, d_l)`

where:

- `Γ`: the source-defined worldtube/filament geometry;
- `F`: transported frame history or an equivalent spin lift;
- `n_sheet`: timesheet normal, kept distinct from the rotating frame;
- `E, B, β`: measured external fields and trajectory inputs;
- `Θ_shared`: one frozen set of shared geometric parameters;
- outputs: horizontal magnetic-precession and vertical EDM-sensitive channels, plus the corresponding magnetic and electric dipole observables.

The standard comparator is the established BMT spin-precession law with its EDM extension. H(s)H must recover that limit before claiming a distinct residual.

### Discrete-symmetry gate

An EDM is not implied merely by helicity, torsion, or a chiral centerline. The electron-EDM literature identifies a permanent EDM as a time-reversal-odd observable, equivalent to CP violation. A nonzero H(s)H EDM prediction therefore requires an explicitly defined geometric quantity with the appropriate P/T/CP transformation properties. If the source-defined geometry supplies no such quantity, the model must predict an EDM consistent with zero; it cannot insert an independent free EDM coefficient to fit the bound.

The new Fermilab result adds a second measured component of the same muon spin-precession system. It does not force a new worldtube thickness, contact surface, or independent force. What is forced by the source and existing geometry checks is an explicit transported frame and a distinct timesheet normal. A specific material twist constitutive law, elastic energy, contact potential, or CP-odd coupling remains unestablished unless derived from the source-defined geometry.

## 6. Test matrix and failure rules

| Hypothesis/readout | Calibration and holdout | Standard comparator | Current measured constraint | Falsification rule |
|---|---|---|---|---|
| Shared framed geometry predicts muon magnetic anomaly | Freeze geometry outside g-2; current E989 world average is the measured test | Current SM update with lattice-QCD HVP | Residual `38.5 ± 63.7 × 10^-11` | A fixed predicted shift outside the approximate 95% interval `[-86.3,+163.3] × 10^-11` fails, subject to adding any declared model uncertainty |
| Same geometry predicts muon EDM component | No fit to the published 25% result; remaining 75% could be a future holdout only if released | Standard EDM-extended spin dynamics; SM EDM below current sensitivity | `|d_mu| < 1.10 × 10^-19 e·cm` (95% CL) | A predicted magnitude above the published limit fails at the stated confidence level |
| Same geometry predicts electron EDM scaling | Freeze the same geometric law; separate HfF+ experiment is a cross-lepton holdout | Standard Model electron EDM far below present sensitivity | `|d_e| < 4.1 × 10^-30 e·cm` (90% CL) | A predicted magnitude above the published limit fails at the stated confidence level |
| Geometric chirality implies a CP/T-odd readout | Must be derived from the same frame and sheet variables; no separate coefficient | P/T/CP operator transformation rules | Electron and muon EDMs consistent with zero | A nonzero prediction without a derived P/T/CP-odd geometric quantity is structurally incomplete; a prediction outside either limit is empirically excluded |

The E989 magnetic and EDM channels share an apparatus and data stream. Their covariance must be used in any joint likelihood; they cannot be multiplied as independent evidence. The electron EDM is a different platform, but any H(s)H cross-lepton scaling must be derived from shared geometry rather than assigned a fitted exponent. No raw event-level data or unreleased Fermilab data were accessed.

## 7. Proof-first triage and limits

Explicit mathematical structures are present: frame lifts, axial/polar vector behavior, P/T/CP transformations, and a joint readout map.

Candidate formalization targets:
- the distinction between a centerline and a framed lift;
- the separate types of transported frame and timesheet normal;
- the transformation class of any proposed geometric EDM term;
- identifiability of two readouts under one shared parameter vector.

No new Lean 4/Mathlib proof was run. The H(s)H-specific map is not yet source-defined, and a data-free formalization of the abstract geometry/symmetry propositions requires Nathan's specific prior permission. Status: `BLOCKED_PENDING_NATHAN_PERMISSION`. Existing Python/NumPy and analytical checks cited above are not Lean proofs and do not establish physical premises.

## 8. Final gate

- Real measured systems and provenance: PASS.
- Source-faithful spin genealogy: PARTIAL; September 1 raw Nathan message recovered; October 22 raw locator not recovered.
- Standard magnetic/EDM comparator and uncertainty separation: PASS at published-summary level.
- H(s)H framed-spin-to-dipole map: UNDEFINED.
- H(s)H independent prediction: NONE.
- H(s)H physical spin/current law: UNRESOLVED.
- New thickness/twist/contact surfaces forced by these data: NONE established.
- New physical candidate or BEDROCK promotion: NOT ADMITTED.
- This note is a test-architecture proposal, not a claim that H(s)H explains g-2, EDM, CP violation, or particle spin.
