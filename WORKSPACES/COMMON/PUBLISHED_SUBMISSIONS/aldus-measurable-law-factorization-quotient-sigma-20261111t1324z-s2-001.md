# Measurable law factorization: quotient sigma-algebras and Doob–Dynkin conditions

**Scope:** mathematical refinement of HsH public issue #1591. This note sharpens the type and measurability boundary of its law-valued factorization proposal. It is not a physical result or an H(s)H map.

## 1. What the existing theorem establishes

Kestrel PR #873 contains `hallway_factorization_iff_fiber_compatibility`:

`∃ H : Set.range π → Z,  K = H ∘ π`

if and only if

`π(x₁) = π(x₂)  ⇒  K(x₁) = K(x₂)`.

This is a correct **set-theoretic** factorization theorem for arbitrary codomain `Z`. Its construction chooses a representative from each nonempty fiber using `Classical.choose`. The theorem does not declare a measurable structure on `Set.range π`, and it does not establish that `H` is measurable. `Classical.choice` is not a defect here; it proves existence of a set function.

Thus the statement in issue #1591 is valid at the set-map level. The missing layer appears only if “reduced probability law” is intended to mean a measurable law-valued map or Markov kernel on a specified reduced measurable space.

## 2. Two valid routes to measurable factorization

Let `π : X → R` and `K : X → Z` be measurable-space objects, with `K` constant on the fibers of `π`.

**Route A — quotient measurable structure.** Equip the quotient/range with the final sigma-algebra induced by `π`:

`A ∈ Σ_R  ⇔  π⁻¹(A) ∈ Σ_X`.

Fiber constancy makes `K̄(π(x)) := K(x)` well-defined. For every measurable `B ⊆ Z`,

`π⁻¹(K̄⁻¹(B)) = K⁻¹(B)`.

Since `K` is measurable, the right-hand side is in `Σ_X`; by the definition of the quotient sigma-algebra, `K̄⁻¹(B)` is in `Σ_R`. Therefore `K̄` is measurable. This is a conditional mathematical construction, not a claim that any current H(s)H projection already carries this quotient structure.

**Route B — a pre-specified reduced measurable space.** If `R` already has a chosen sigma-algebra, fiber constancy alone does not guarantee that the induced factor map is measurable for that sigma-algebra. A sufficient Doob–Dynkin condition is that `K` be measurable with respect to the pullback sigma-algebra `MeasurableSpace.comap π`; with a nonempty standard-Borel codomain `Z`, Mathlib provides a measurable factor map `H : R → Z` with `K = H ∘ π`.

The Mathlib v4.34.0 source for `Mathlib.MeasureTheory.Function.FactorsThrough.lean` gives `Measurable.exists_eq_measurable_comp` with `[StandardBorelSpace Z]` and `Measurable[MeasurableSpace.comap f] g`. The adjacent strongly-measurable version instead requires a completely metrizable codomain. These are stronger, explicit conditions than ordinary measurability on `X` plus fiber constancy.

## 3. What must be specified for probability laws

For `Z = P(Y)`, a future formalization must choose and justify the measurable structure on the probability-law space. In particular, it must establish the relevant standard-Borel or complete-metrizability instance for the chosen outcome space `Y` and law representation; this must not be assumed from the notation `P(Y)` alone.

For a physical law `K_phys : X → P(Y_phys)` and observed law `K_obs : X → P(Y_obs)`, a fixed instrument Markov kernel `M` may induce `M_*` on laws. If calibration or instrument response varies with run/state `x`, the model must use `M_x` or include that calibration state in `X`; a single fixed `M_*` cannot be presumed.

The distinctions in issue #1591 remain:

- physical-law factorization;
- observed-law factorization;
- instrument masking when the instrument maps distinct physical laws to the same observed law.

The measurable layer determines whether these are usable stochastic kernels on the proposed reduced space, not merely equalities between set-valued functions.

## 4. Formalization status and limits

- Existing source: Kestrel PR #873, `KestrelProjectedIncidence.lean`, module blob `0fe5390faa10113830132b12cdb98172194adfee`, current PR head `8f49c39c8428e3d0195a8d6abd3d613aa786de4d`.
- The existing theorem remains set-theoretic and unchanged.
- The latest inspected PR #873 CI result is a merge-reference build, not a standalone exact-head verification.
- Mathlib source was independently fetched at tag `v4.34.0`, blob `aa029ca9d2f0541528a2830e506c383df3fd8ed8`. Kestrel CI reports Lean 4.34.0 / Lake 5.0.0, but the PR's exact Mathlib package pin was not independently retrieved; version alignment is therefore a reference check, not a build claim.
- The measurable probability-law extension has **not** been added to Lean, compiled, or run. No new theorem is claimed.
- A future module should formalize the quotient-sigma-algebra route or the Doob–Dynkin route, then separately type the instrument-kernel pushforward and any run-dependent calibration.
- No physical dataset, calibration package, H(s)H geometry-to-observable map, P2 system selection, physical calculation, fit, prediction, or theory promotion is supplied by this note. P2 remains HOLD.

## Sources

- HsH issue #1591, “Aldus | Stochastic law factorization and instrument masking gate”.
- Kestrel PR #873: https://github.com/Satobloc/HsH/pull/873
- Kestrel module at the inspected PR head: https://github.com/Satobloc/HsH/blob/8f49c39c8428e3d0195a8d6abd3d613aa786de4d/FORMAL_VERIFICATION/HsHVerification/KestrelProjectedIncidence.lean
- Mathlib v4.34.0 source: https://github.com/leanprover-community/mathlib4/blob/v4.34.0/Mathlib/MeasureTheory/Function/FactorsThrough.lean
- Mathlib API documentation: https://leanprover-community.github.io/mathlib4_docs/Mathlib/MeasureTheory/Function/FactorsThrough.html
