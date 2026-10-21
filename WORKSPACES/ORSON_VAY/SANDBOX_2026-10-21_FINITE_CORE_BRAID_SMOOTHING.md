# SANDBOX — Finite-Core Braid Smoothing from Active Readout Surface
## Orson Vay | 2026-10-21

Status: SANDBOX / derived geometry / not BEDROCK / not established physics.

## Source constraints recovered this run

1. Historical SAT archive repeatedly defines braid smoothing as a reduction in the effective or active interaction surface presented to the resolving time surface / timewave.
2. `WORKSPACES/COMMON/extraction_outputs/meridian_ontology_math_check_opening_20260916.md` preserves an older activation logic:
   - smoothing is a second-order braid effect;
   - coiling order n >= 2 is necessary;
   - deuterium is expected to show little suppression;
   - triadic closure is separately required for the stronger effect;
   - tritium and He-3 are expected to show moderate smoothing.
3. Historical `S(Q,n) ~= 0.2621` was never derived in the recovered passages and later became a fitted scalar correction.
4. `WORKSPACES/COMMON/SOL_PLAYGROUND/EXP002_TRIAL_HSH_ACTION.md` provides a provisional finite-thickness readout field with interface thickness xi and an overlap functional. Its phase-field machinery is imported/provisional, but it supplies a useful typed place for a physical readout thickness.
5. BR-008 requires a coordinate/readout-artifact audit. Therefore xi must not be treated as physical unless it belongs to the coupling mechanism rather than merely numerical measurement resolution.

## 1. Replace scalar S by a geometric functional

Let a bundle B have finite-core members K_i and a physical readout/interacting support thickness xi.
Write the effective support as

`K_i^xi = K_i (+) Ball(xi)`

where (+) is Minkowski dilation in the local readout geometry.

Define the bundle support

`U_xi = union_i K_i^xi`.

A natural active-surface smoothing functional is

`S_xi[B] = A_ext(U_xi) / sum_i A(boundary K_i^xi)`

where `A_ext` counts only the surface exposed to the relevant unbounded/readout-accessible region.

This is not assumed to equal mass. It is the geometric quantity the old phrase 'reduced active surface area' was trying to name.

Equivalent overlap formulation, closer to the Sol trial action:

`O_bundle = integral f_xi(phi) * 1_(U_xi) dV`

`S_O = O_bundle / sum_i O_i`.

In the thin-interface / approximately uniform-coupling limit, the overlap ratio reduces toward an active-intersection-area ratio.

## 2. Minimal pair: two versus three equal finite cores

Use an intentionally simple local control:
- isolated physical core radius r;
- physical center separation d = 2r (tangent hard-core control);
- effective readout-support radius R = r + xi;
- dimensionless thickness epsilon = xi/r.

The supports overlap for any xi > 0 even though the physical cores do not interpenetrate.

### 2.1 Two-core control

For two equal spheres of support radius R and center separation d, the hidden spherical-cap height is

`h = R - d/2`.

At d = 2r, `h = xi`.

Each pair hides one cap on each sphere. Cap area is

`A_cap = 2*pi*R*h`.

Total isolated support area is

`A_iso,2 = 8*pi*R^2`.

Therefore external active area is

`A_ext,2 = 8*pi*R^2 - 4*pi*R*xi`

and

`S_2(epsilon) = 1 - xi/(2R)`

`               = 1/2 + 1/[2(1+epsilon)]`.

Small-thickness expansion:

`S_2 = 1 - epsilon/2 + O(epsilon^2)`.

So the two-body effect is naturally small when the physical readout thickness is small.

### 2.2 Three-core equilateral control

Place three equal cores with centers at an equilateral triangle of side d = 2r.

Before the three effective supports share a common intersection, the pairwise hidden caps are disjoint on each sphere.

There are three pairs, hence six hidden caps.

Total isolated area:

`A_iso,3 = 12*pi*R^2`.

Total hidden cap area:

`A_hidden,3 = 12*pi*R*xi`.

Therefore

`S_3(epsilon) = 1 - xi/R`

`               = 1/(1+epsilon)`.

Small-thickness expansion:

`S_3 = 1 - epsilon + O(epsilon^2)`.

Thus, in the same geometry and with the same xi, the initial smoothing slope for the triad is twice the two-body slope.

## 3. True three-body overlap threshold

Pair overlap begins when

`R >= d/2`.

A common intersection of all three equal supports begins when the support radius reaches the circumradius of the equilateral center triangle:

`R >= d/sqrt(3)`.

For d = 2r this gives

`1 + epsilon >= 2/sqrt(3)`

so

`epsilon_* = 2/sqrt(3) - 1 = 0.154700538...`.

This is a geometry-only threshold in the local control.

Below epsilon_*:
- pairwise readout overlap exists;
- no common three-body support exists.

At and above epsilon_*:
- a genuinely non-pairwise overlap measure can become nonzero:

`C_3 = measure(K_1^xi intersect K_2^xi intersect K_3^xi)`.

This gives a precise candidate meaning for the old phrase 'triadic closure' without invoking a Z3 gate.

Important: C_3 is a readout-support intersection measure, not yet a topological charge or force law.

## 4. Numerical controls

For epsilon = xi/r:

| epsilon | S_2 | S_3 | two-body suppression | triad suppression |
|---:|---:|---:|---:|---:|
| 0 | 1.000000 | 1.000000 | 0.0000% | 0.0000% |
| 0.01 | 0.995050 | 0.990099 | 0.4950% | 0.9901% |
| 0.05 | 0.976190 | 0.952381 | 2.3810% | 4.7619% |
| 0.10 | 0.954545 | 0.909091 | 4.5455% | 9.0909% |
| 0.154700538 | 0.933013 | 0.866025 | 6.6987% | 13.3975% |

The final row is exactly the onset of common three-body readout support in this symmetric control.

## 5. Why this is better than S = 0.2621

The recovered historical scalar `S ~= 0.2621` is far smaller than the suppression produced by a single minimal triadic contact in this control.

Therefore, if 0.2621 ever turns out to have geometric meaning, it cannot simply be 'the surface reduction of one three-body braid contact.' It would need to represent one or more of:
- repeated/higher-order coarse-graining;
- multiple nested braid levels;
- a much thicker physical interaction zone;
- strong anisotropy / orientation weighting;
- additional contact geometry;
- or it was simply fitted and has no independent geometric status.

For illustration only, repeated multiplicative factors show the scale:
- (5/6)^7 ~= 0.2791;
- (5/6)^3 * (2/3)^2 ~= 0.2572;
- (2/3)^3 ~= 0.2963.

These numerical proximities are NOT derivations of 0.2621. They only show that the old scalar lives in a regime of repeated/higher-order shielding rather than one minimal contact.

## 6. Action-level repair

The old timewave term was schematically

`L_timewave = alpha_i (X'_i . T_hat)^2`.

Instead of inserting a fitted mass-suppression scalar, define a local effective coupling through the actual finite-core bundle geometry:

`alpha_eff[B,xi] = alpha_0 * S_xi[B]`

or, more fundamentally, do not factor it at all:

`L_readout = integral_(active finite-core intersection) Phi(theta4, curvature, orientation, ...) dA`.

If Phi is approximately constant over the active surface, the multiplicative `S_xi` form is recovered as a coarse limit.

This is preferable because geometry performs the suppression instead of a lookup table.

## 7. BR-008 / measurement-artifact gate

This construction has a critical fork:

A. If xi is merely observer resolution, numerical smoothing, plotting resolution, or arbitrary coarse-graining, then S_xi is a measurement artifact and cannot be promoted to physical mass.

B. If xi is a physically derived thickness of the resolving interaction / medium coupling / finite response kernel, then S_xi can enter dynamics, but xi itself must be derived or independently measured.

This distinction is mandatory under BR-008.

## 8. Dimensional caution

The local sphere calculation is a readout control, not the full 4D worldtube.
In the actual H(s)H geometry:
- the worldtube is finite-core in 4D;
- the resolving interaction is 3D;
- braid axes and readout normals are relational;
- anisotropic Kerr-like shell geometry may replace isotropic spheres;
- contact patches and crevices evolve along the braid.

So the correct next object is an integral along the bundle history:

`S_xi[B] = [integral ds w(s) A_ext(s,xi)] / [integral ds w(s) sum_i A_i(s,xi)]`

with w(s) derived from the actual interaction/readout kernel.

## 9. Immediate discriminators

1. Deuterium control: reconstruct a two-nucleon finite-core geometry and test whether the derived S_xi stays near 1 for any independently justified xi/r.
2. Tritium / He-3: use the same xi/r and geometry rules, no retuning, and test whether triadic geometry produces a larger suppression.
3. He-2 / unstable controls: determine whether lack of stable closure changes the active-surface functional before consulting lifetime/mass targets.
4. Repeated coiling: compute S_xi under one additional nesting level and test whether suppression composes multiplicatively, additively, or not at all.
5. Replace isotropic spheres by the current finite-core/Kerr-shell cross-section and repeat.

## Current result

The archive's qualitative sequence

`deuterium: little smoothing -> triadic systems: moderate smoothing -> dense bundles: stronger smoothing`

can be produced by a finite-core active-surface calculation without using Q as the controlling variable and without inserting S=0.2621.

This is the first current derivation in this lane where the old 'braid smoothing' phrase has been replaced by an explicit geometric functional and a minimal-pair calculation.

## 10. Contact-graph law in the dilute-overlap regime

The two- and three-body results generalize before hidden caps overlap one another.

Let:
- N = number of equal finite cores;
- E = number of active pair contacts in the local contact graph;
- R = r + xi;
- d = 2r for the tangent physical-core control;
- each readout-support contact hides two spherical caps of height xi.

One pair contact removes

`A_hidden,pair = 4*pi*R*xi`

from the external active area.

Total isolated area is

`A_iso = 4*pi*R^2*N`.

Therefore, as long as pairwise hidden caps remain disjoint and no higher-overlap correction is needed,

`S_xi(G) = 1 - (E/N) * xi/R`.

Using mean contact degree `z_bar = 2E/N`,

`S_xi(G) = 1 - (z_bar/2) * xi/R`.

This reproduces the controls:
- pair: N=2, E=1, z_bar=1 -> `S_2 = 1 - xi/(2R)`;
- equilateral triad: N=3, E=3, z_bar=2 -> `S_3 = 1 - xi/R`.

### Interpretation

This is a morphology law, not a strand-count law.

Two bundles with the same N or historical Q can have different smoothing because they can have different:
- contact graphs;
- coordination numbers;
- contact-patch areas;
- anisotropies;
- braid histories;
- readout orientations.

This directly supports replacing old Q/inverse-Q smoothing rules by finite-core morphology.

### Breakdown condition

The contact-graph formula is only the first regime.
When cap regions overlap on a core or a true common three-body support appears, higher-order geometry must be added.

A schematic expansion is

`S = 1 - pair shielding + triple correction - quadruple correction + ...`

but the surface-area terms must be derived from the actual union boundary rather than imported from scalar inclusion-exclusion by analogy.

The clean three-body onset in the symmetric control remains

`epsilon_* = 2/sqrt(3) - 1 ~= 0.154700538`.

Above this point a nonpairwise descriptor such as

`C_3 = measure(K_1^xi intersect K_2^xi intersect K_3^xi)`

can become nonzero and the pair-contact law alone is incomplete.

## 11. Coarse-graining / interaction commutator interpretation

Define the fine isolated active area

`A_fine = sum_i A(boundary K_i^xi)`

and the bundle readout

`A_bundle = A_ext(union_i K_i^xi)`.

Then the finite-core nonadditivity defect is

`Delta_xi = A_bundle - A_fine <= 0`

in the present shielding regime.

The smoothing functional is simply

`S_xi = 1 + Delta_xi/A_fine`.

For the tangent equal-core contact-graph regime,

`Delta_xi = -4*pi*R*xi*E`.

This connects directly to the earlier coarse-graining-commutator program: braid smoothing can be read as a measurable failure of 'sum isolated interactions' and 'coarse-grain the interacting bundle' to commute.

Crucially, this defect is derived from finite-core geometry rather than inserted as a correction coefficient.

## 12. Genealogy update: historical S = B^(1-delta)

New mining found an older explicit formula repeated in:
- `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt`;
- `DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Scalar-Angular.txt`;
- archived Core Pack / Math Revamp material;
- public-record/podcast transcripts.

The historical expression is

`S(Q,n) = B^(1-delta) ~= 0.262065`.

This is more informative than treating S as a naked scalar, but the recovered sources do not define delta independently in the same construction.

Solving the equation backward with

`B = 3/(4*pi) = 0.238732414637843...`

and

`S = 0.262065`

gives

`delta_required = 1 - ln(S)/ln(B)`

`               = 0.0650994592534...`.

Targeted repository searches found no independent `delta ~= 0.0651` derivation.

Using later B values changes the required delta:
- B=0.24177 -> delta_required ~= 0.05677384;
- B=0.2412328757 -> delta_required ~= 0.05824912.

So the formula is not invariant under the historical B variants unless delta changes with them.

Current classification:

`S = B^(1-delta)` is a historical parameterization, not yet a derivation.

To promote it, delta must be recovered from a pre-target geometric quantity and then predict S without isotope-mass input.

### Comparison with the new finite-core control

If one tries to force the minimal triad formula

`S_3 = 1/(1+epsilon)`

to equal the old 0.262065, it requires

`epsilon = xi/r ~= 2.81585`.

That is far outside the dilute-overlap regime and beyond the three-body-overlap threshold `epsilon_* ~= 0.15470` where the simple formula ceases to apply.

Therefore old S=0.262065 cannot be identified with one minimal triadic finite-readout contact.
It must represent higher-order/nested geometry, a different observable, or a fitted correction.

## 13. Archive-scale discriminator: epsilon versus ell_f

Historical archive claims distinguish:
- intrinsic filament/core thickness `epsilon ~= 2e-21 m`;
- first-order helical/coil radius `ell_f ~= 0.7937 fm`.

Current BEDROCK explicitly cautions that ell_f is historical coil radius, not intrinsic core thickness.

If, solely as a diagnostic control, we identify:

`r = ell_f = 0.7937e-15 m`

and take the active coupling/readout thickness to be no larger than the old intrinsic thickness:

`xi = epsilon = 2e-21 m`,

then

`xi/r = 2.51984377e-6`.

Plugging this into the finite-core minimal-contact laws gives:

`S_2 = 0.99999874008129`

`S_3 = 0.99999748016258`.

So the corresponding first-contact suppressions are:

- pair: `1.25991871e-6` = about 1.26 ppm;
- triad: `2.51983742e-6` = about 2.52 ppm.

### Consequence

If the old epsilon and ell_f scales are even approximately the relevant physical scales, a single local finite-core shielding contact is orders of magnitude too weak to explain historical `S ~= 0.2621`.

Therefore at least one of the following must hold if substantial braid smoothing is real:
1. the physical interaction/readout zone xi is much thicker than the intrinsic filament core;
2. the relevant local bundle radius r is much smaller than the historical coil radius ell_f;
3. suppression accumulates over many contacts or nested coiling/history integration;
4. orientation/anisotropy weighting produces much stronger shielding than the isotropic control;
5. the historical S ~= 0.2621 was fitted and has no independent local-geometric meaning.

This is a discriminator, not a choice among those branches.

### Provenance caution on epsilon

The historical `epsilon ~= 2e-21 m` is itself not secure.
`Dim.txt` says its derivation begins by assuming a lattice spacing `ell_0 ~= 1e-21 m`, then defining a curvature cap. Thus epsilon cannot currently serve as a parameter-free physical input.

Separately, `MACHINE1.py` exposes `epsilon_ratio` as a free dimensionless model input with default `0.01`, confirming that at least one historical executable treated the ratio epsilon/ell_f as a modeling parameter rather than a derived invariant.

Accordingly, neither the 2e-21 m value nor the code default is promoted. They are useful sensitivity controls only.
