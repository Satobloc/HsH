# GRURPLE-A — R0→R1 contemporary-source hardening

**Date:** 2026-09-22
**Originator:** Meridian
**Status:** WORKING SUPPORT ARTIFACT — not a reviewer document; do not use to contaminate unfinished independent reviews.
**Quarantine:** public sources only; PRIOR_ART not consulted.

## Purpose

Bounded response to Tern R0 comments A-01, A-02, A-06, A-07 and the originator self-critique. This pass checks the four contemporary source anchors against primary arXiv records and records the maximum claim safely carried by the source abstract/record. It does **not** revise frozen R0 and does **not** close first-round review.

## Primary-source anchors and R1 claim limits

### Greene–Kabat–Levin–Porrati

1. **Compactification Without Orientation, or a Topological Scenario for CP Violation** — arXiv:2510.05270; later Phys. Rev. D 113, 065020 (2026).
   - Primary: https://arxiv.org/abs/2510.05270
   - Supported: free 6D theories compactified on a flat Klein bottle; pin+/pin− fermion boundary conditions; broken translation invariance; scalar position-dependent energy density; a Dirac fermion can yield P, C and CP breaking in 3+1D, with bilinear order parameters localized near parity walls.
   - R1 safe abstraction: **non-orientable compactification can induce lower-dimensional discrete-symmetry breaking in the model studied.**
   - Do not silently generalize to topology generically producing arbitrary effective labels.

2. **Klein Bottle Cosmology** — arXiv:2511.23447; later Phys. Rev. D 113, 063576 (2026).
   - Primary: https://arxiv.org/abs/2511.23447
   - Supported: Minkowski × Klein-bottle higher-dimensional universe; topology breaks specified symmetries; topology enforces fermion correlations/condensate wall; brane passage through wall can produce coupled brane fermions via time-dependent mass/Bogoliubov coefficients; possible baryogenesis ingredients.
   - R1 use: follow-on dynamical example in the same specific model family, not an independent fifth convergence datum.

### Oppenheim–Sajjad

3. **Stochastic Modes in Postquantum Classical Gravity** — arXiv:2605.05375 (6 May 2026).
   - Primary: https://arxiv.org/abs/2605.05375
   - Supported: a covariant postquantum theory coupling classical spacetime with quantum matter; consistency requires stochastic spacetime evolution in that framework; linearization around Minkowski; scalar-vector-tensor decomposition; dynamical classical spin-2 and spin-0 stochastic modes; PSD action on dynamical modes is a necessary consistency condition; phenomenological bounds are discussed.
   - R0 overreach flagged by Tern: “counterexample to the assumption that spacetime must itself be quantized before it can participate consistently in quantum phenomenology.”
   - R1 safe replacement concept: **an explicit framework in which spacetime is treated classically while coupled to quantum matter, subject to the framework’s stochastic consistency conditions.**
   - Do not promote this local construction into a universal anti-quantization conclusion.

### Carroll–Diachenko–Dulani

4. **Toward a Phenomenologically Acceptable Quantum Cyclic Universe** — arXiv:2605.30405 (28 May 2026).
   - Primary: https://arxiv.org/abs/2605.30405
   - Supported: finite-dimensional unitary quantum evolution is recurrent; when relevant energy-eigenvalue differences are commensurable, the model is exactly periodic rather than merely recurrent; a minimum-entropy initial state can support a distinguished entropy excursion; spacetime interpretation is explicitly speculative.
   - R0 overreach flagged by Tern: recurrence → generic “discreteness in global observable behavior.”
   - R1 safe abstraction: **exact periodic closure can arise within continuous unitary evolution when the relevant spectral differences are commensurable.**
   - Do not infer generic observable discreteness, quantization, or discrete time from this result.

### Susskind

5. **Is Time Reversal in de Sitter Space a Spontaneously Broken Gauge Symmetry?** — arXiv:2603.12434 (12 March 2026).
   - Primary: https://arxiv.org/abs/2603.12434
   - Supported by the author’s abstract: proposal that time reversal is a bulk gauge symmetry hidden by spontaneous symmetry breaking; the advertised “smoking gun” is a closed curve with holonomy flipping forward-going clocks to backward-going clocks and vice versa.
   - R1 safe abstraction: **a source-specific example in which closed-path holonomy carries a time-orientation reversal of the transported physical clock.**
   - Preserve the typed distinction already emphasized in R0: path closure alone is not holonomy; transported object + connection/transport law + path must be specified.

## Cross-source selection/convergence discipline

R1 should define “convergence” as **structural convergence among the deliberately selected examples**, not evidence of a field-wide trend. The Greene et al. pair counts as one model family for this purpose. The selection rule should be stated positively: recent works were chosen because each supplies a sharply identifiable instance of one component of the comparison schema, not because they jointly endorse a common theory.

The four source roles can therefore be typed without claiming mathematical composition:

- non-orientable compactification → model-specific lower-dimensional symmetry distinction;
- classical spacetime + quantum matter → explicit mixed classical/quantum framework under stochastic consistency conditions;
- commensurable spectrum + continuous unitary evolution → exact periodic closure;
- closed curve + specified transport/holonomy → time-orientation reversal of transported clock.

Only **after** those source-level statements should the paper introduce its own synthesis. Each transition must be visibly authored by the paper rather than attributed to the cited authors.

## Disposition

- TERN-A-01: **ACCEPTED IN PRINCIPLE** — source/synthesis transitions need mechanical marking and sentence-level citations.
- TERN-A-02: **ACCEPTED** — narrow “convergence/proliferation” to selected examples and state selection rule.
- TERN-A-06: **ACCEPTED** — Oppenheim/Sajjad claim must be narrowed to their framework and assumptions.
- TERN-A-07: **ACCEPTED** — replace generic discreteness inference with exact-periodic-closure statement.

No change to frozen R0 in this pass. Remaining review comments A-03/A-04/A-05/A-08 require provenance/object-typing work and/or the rest of first-round review before consolidation.

## Next cursor

When unfinished independent reviews freeze, merge their comments with this source-hardening pass and the pre-review self-critique. Then revise R1 in one coherent pass rather than serially patching R0.