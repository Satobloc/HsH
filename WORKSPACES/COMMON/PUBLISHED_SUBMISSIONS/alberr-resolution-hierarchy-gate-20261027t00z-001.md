# Alberr source-grounded architecture lane | Resolution hierarchy gate | 2026-10-26

**Status:** assistant-authored source-grounded reconstruction under the Alberr charter; not an authenticated historical Alberr instance. One architecture/prediction quantum on existing draft PR #388. No physical calculation, empirical validation, BEDROCK promotion, or scheduler mutation.

## Result

The finite-sheet formulas require an explicit hierarchy

`fine history -> resolved intersection -> observable`.

If the resolution map identifies two fine states, every observable which factors through that map identifies them too. No global reconstruction of the fine state can exist from the resolved state alone. Therefore thickness, twist, contact surface, or hidden internal history is **not forced by a downstream observation** unless the proposed readout retains a discriminator for it. This is a logical architecture gate, not a claim that any physical states are actually collapsed.

## Historical/source provenance

Mersearch-first source: completed request `2026-10-21-orson-nlm-big-haul-math-001`, compact receipt blob `191acaf733c8e59920ca16c53ccb74d6be90f3c6`; 13,897 files and 23,825,506 records scanned across archive, HsH and Resources, with 34,983 bounded lexical hits. Receipt is navigation, not validation.

Followed receipt into the original archive export:

- repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- path: `SAT_H(s)H Skill Development — raw - .TXT`
- Git blob: `27823a532a2f33d7c30c88efa6a5e1e819bfb3b9`
- message/tool record: `0ac90489-132a-4975-aa2c-8296362d81cb`
- tool-output timestamp: `1783749529.768997`
- direct read date: 2026-10-26

Verbatim archived assistant/tool output:

```text
[C5] Finite resolving sheet
Σ_t^(h) = {x ∈ 𝔈_exp : |τ(x) - t| ≤ h_Σ/2}

[C6] Finite-thickness particle-instantiation
P_t^(h) = Σ_t^(h) ∩ N_ε(F)

[C7] Resolved particle manifold
M_{P,t} = Σ_t^(h) ∩ N_ε(F)
```

Attribution boundary: these lines occur inside a generated `CURRENT-CORE-ONLY EQUATION SHEET v0.1` tool result. They are historical assistant reconstruction, not authenticated Nathan-authored derivation and not independent physics.

Immediate source-critical result: C6 and C7 have identical right-hand sides, so they define extensionally equal sets unless an omitted type/structure distinguishes “particle-instantiation” from “resolved particle manifold.” The names alone do not supply such a distinction.

## Exact Lean 4 / Mathlib source

Path: `FORMAL_VERIFICATION/HsHVerification/ArchiveEQ0035.lean`

```lean
import Mathlib

namespace HsHVerification.ArchiveEQ0035

open Set

def resolveSet {α : Type*} (sheet core : Set α) : Set α :=
  sheet ∩ core

theorem duplicated_intersection_definitions_are_equal
    {α : Type*} (sheet core : Set α) :
    resolveSet sheet core = sheet ∩ core := by
  rfl

theorem resolution_monotone
    {α : Type*} {sheet₁ sheet₂ core₁ core₂ : Set α}
    (hsheet : sheet₁ ⊆ sheet₂) (hcore : core₁ ⊆ core₂) :
    resolveSet sheet₁ core₁ ⊆ resolveSet sheet₂ core₂ := by
  intro x hx
  exact ⟨hsheet hx.1, hcore hx.2⟩

theorem downstream_readout_cannot_separate_collapsed_states
    {Fine Resolved Observable : Type*}
    (resolve : Fine → Resolved) (observe : Resolved → Observable)
    {x y : Fine} (hcollapse : resolve x = resolve y) :
    observe (resolve x) = observe (resolve y) := by
  exact congrArg observe hcollapse

theorem observable_difference_requires_resolved_difference
    {Fine Resolved Observable : Type*}
    (resolve : Fine → Resolved) (observe : Resolved → Observable)
    {x y : Fine} (hobs : observe (resolve x) ≠ observe (resolve y)) :
    resolve x ≠ resolve y := by
  intro hcollapse
  exact hobs (congrArg observe hcollapse)

theorem collapse_forbids_global_left_inverse
    {Fine Resolved : Type*} (resolve : Fine → Resolved)
    {x y : Fine} (hxy : x ≠ y) (hcollapse : resolve x = resolve y) :
    ¬ ∃ reconstruct : Resolved → Fine,
        Function.LeftInverse reconstruct resolve := by
  rintro ⟨reconstruct, hleft⟩
  apply hxy
  calc
    x = reconstruct (resolve x) := (hleft x).symm
    _ = reconstruct (resolve y) := congrArg reconstruct hcollapse
    _ = y := hleft y

#print axioms duplicated_intersection_definitions_are_equal
#print axioms resolution_monotone
#print axioms downstream_readout_cannot_separate_collapsed_states
#print axioms observable_difference_requires_resolved_difference
#print axioms collapse_forbids_global_left_inverse

end HsHVerification.ArchiveEQ0035
```

Commits:

- module: `0b33ffd588d426bf2efe71fa71ddd544ed10336d`
- imported branch head: `f578590ad914d8be385d84e2b4a4b6c6fe546170`
- root import blob: `1c89992bc3fa6619f8b0c749c2413513ead1a982`

Actual compiler receipt: GitHub Actions run `40427535705`, job `121937441379`, **success**. The PR merge source was `5395ebf7c831aecb93e12c599acfdd8ef6fd70b6`, merging branch head `f578590ad914d8be385d84e2b4a4b6c6fe546170`. Lean `4.34.0`; Mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`; `ArchiveEQ0035` built at job 8950/8952 and the full build completed successfully with 8952 jobs. All five explicit `#print axioms` commands reported “does not depend on any axioms.”

## Observable architecture / real-data matrix

No H(s)H response law currently maps a shared parameter vector into these observables. The matrix therefore specifies admission/failure gates and does not calculate an H(s)H prediction.

| Measured system | Versioned observation | Units / uncertainty | Standard comparator | What an H(s)H addition must do | Failure threshold |
|---|---|---|---|---|---|
| Gravity Probe B, Earth-orbiting gyroscopes; 2004-2005 data, final 2011 analysis | Geodetic drift `-6601.8 ± 18.3`; frame-dragging drift `-37.2 ± 7.2` | mas/yr, quoted 1-sigma-style final uncertainties | GR `-6606.1`, `-39.2` mas/yr | A single fixed readout must map any added thickness/twist/contact variables to both drift components without per-component retuning | Excluded if a preregistered prediction lies outside the experimental covariance/declared interval; unidentifiable if variables change while both predictions remain invariant |
| S2 orbit around Sgr A*, data through end 2019 | `f_SP = 1.10 ± 0.19`; Schwarzschild precession about `12 arcmin/orbit` | dimensionless and arcmin/orbit | GR `f_SP=1`; Newton `f_SP=0` | After GP-B calibration, predict S2 precession with the same shared parameters and no S2 retuning | Fail if frozen holdout prediction misses the published interval; no positive evidence if fit uses S2 |
| EHT Sgr A*, April 2017 1.3-mm data | ring diameter `51.8 ± 2.3 μas` (68% credible interval) | μas | Kerr/GRMHD-calibrated imaging/model pipeline | Predict an image-domain or visibility-domain observable, including the projection and calibration map; do not equate worldtube radius with ring diameter by analogy | Fail if end-to-end prediction misses the frozen data likelihood/interval; remain untested if no synthetic-observation map exists |

Source boundaries:

- GP-B: Everitt et al., PRL 106, 221101 (2011); NASA final-results page.
- S2: GRAVITY Collaboration, arXiv:2004.07187 / A&A 636 L5 (2020).
- EHT Sgr A*: EHT Collaboration result, 2017 observations, published 2022 and current arXiv record 2311.08680/08697.

The EHT diameter is partly pipeline/model dependent; the quoted uncertainty is a credible interval, not a simple raw-instrument standard deviation. Treat the projection/calibration pipeline as part of the comparator rather than “the object itself.”

## Forced versus optional

- **Forced by the archived definitions:** C6 and C7 coincide as sets; monotonicity follows only when sheet/core inclusions are supplied.
- **Not forced by the definitions:** nonempty thickness, a unique inverse history, twist, contact mechanics, constitutive response, or physical identity.
- **Potentially forced by data:** only a structure that produces a held-out observable unavailable to the thinner/untwisted/no-contact comparator under shared frozen parameters.
- **Exact discriminator:** two fine models that remain equal after resolution are observationally equivalent for every readout factoring through that resolution. To distinguish them, change the measurement map or identify a retained invariant; do not merely rename the hidden structure.

## Epistemic verdict and handoff

Formal status: five abstract propositions compiled successfully on actual Lean CI and reported no axiom dependencies. Physical status: no H(s)H forward model or empirical prediction was executed. The result improves the architecture by making projection and composition maps mandatory before nesting/Matryoshka claims can count as testable.

Selected identity remains source-grounded Alberr reconstruction only. Next cursor is Mira: independently audit whether the three proposed measured systems expose the same typed parameter/readout interface, especially whether EHT ring diameter is too pipeline-dependent to serve as the first strong-field holdout.
