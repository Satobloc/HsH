# QUARRY 097 — Variational recovery of the old SAT cube-root filament scale

Status: SILOED PLAYGROUND / noncanonical
Role: Morrow/GitKeeper + Kestrel topology brief

## Provenance actually read

### Old SAT
`HYPERFOAM THEORY/SAT4DHHUC.txt`
- repository: `Satobloc/SAT_THEORY_ARCHIVE_2023-25`
- blob SHA: `2e1e163771dda9bd1132290ce758ef6d80a6d0fb`
- lines requested/read: 1–1200
- retained live concepts: single dimensional anchor; filament scale `ell_f=(2A/T)^(1/3)`; hyperhelical filament; transverse perturbations; ambient-isotopy state language; tension/curvature/bending structure.
- quarantined: historical fitted constants, particle labels, 24-cell-specific numerical claims, universal-constant claims.

Additional archive search recovered the adjacent statement in `SAT 2026 ROUNDUP DOCS/2026 BIG PAPER.txt` that worldline curvature is a stiffness term governing hyperhelical tension and bending.

### Current H(s)H
`DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/PRECLOSE_NOTE_ROUNDUP.txt`
- repository: `Satobloc/HsH`
- blob SHA: `f324a1f82aa4f5db0bb3a01639ed40667eb29714`
- lines requested/read: 1–1200
- retained current structures: finite-core/tangency solver; recursive hyperhelix engine; curvature/jerk penalties; scale-selection program; Hagalaz as candidate recursive similarity transform; torus/frame-history and SO(4) machinery.

## Independent build

The old SAT cube-root scale can be recovered exactly from a minimal tension–bending competition rather than treated as a bare dimensional closure.

Take a one-scale finite-core ansatz with transverse scale `a` and energy

[
E(a)=T a + rac{A}{a^2}.
]

Interpretation:
- `T a`: energetic cost that grows with maintained transverse extent under filament tension / support.
- `A/a^2`: bending/curvature penalty for compressing the core into radius `a`.

Then

[
rac{dE}{da}=T-rac{2A}{a^3}=0
]

gives

[
oxed{a_*=left(rac{2A}{T}ight)^{1/3}}.
]

This reproduces the historical SAT relation exactly, but now as an extremum condition.

The second derivative is

[
rac{d^2E}{da^2}=rac{6A}{a^4}>0,
]

so the stationary point is a strict minimum.

Writing `x=a/a_*` gives the universal normalized profile

[
rac{E}{T a_*}=x+rac{1}{2x^2}.
]

No historical numerical target is used.

## H(s)H translation

The live concept is not that the old number or old derivation is canonical. The live concept is that finite filament/worldtube thickness should be dynamically selected by competition between extension/tension and curvature rigidity.

Current H(s)H already contains finite-core geometry plus curvature/jerk penalties. Therefore the natural test is whether the full worldtube action reduces locally to

[
E_{mathrm{eff}}(a)=c_T T a + c_A A a^{-2}+cdots
]

for some geometry-dependent coefficients. If so,

[
a_*^3=rac{2c_A A}{c_T T}.
]

The old SAT relation is recovered when `c_T=c_A=1`.

## Discriminator / failure condition

This repair fails if the actual finite-core reduction produces a different scale law, e.g.
- `A/a` -> square-root scaling,
- `A/a^3` -> fourth-root scaling,
- no tension-growth term -> no finite minimum,
- higher-order/sheath terms dominate -> different branch structure.

Thus the exponent `1/3` is now a falsifiable signature of the effective energy structure, not a number to preserve by force.

## Solver test

1. Use the current finite-core/worldtube solver to generate a family of geometrically similar cores with scale `a`.
2. Evaluate separately:
   - tension/extension contribution,
   - curvature-squared contribution,
   - jerk/frame/sheath corrections.
3. Fit only the exponents of `a`, answer-blind.
4. Ask whether the reduced energy has the form `Ta + A/a^2` over any asymptotic regime.
5. Compare the independently obtained minimizer with `(2A/T)^(1/3)`.

Strong pass: exponent structure and coefficient ratio emerge independently.
Weak pass: cube-root exponent survives but coefficient differs.
Fail: different exponent/no finite minimum.

## Continuity note

This quarry treats the old SAT finite-width concept as conceptually live and repairs/reformalizes it rather than discarding it. What is being replaced is the derivational justification, not automatically the core concept.
