# Mercer Sandbox — Tension-Bending Timesheet Flat-Curve Kernel

**Date:** 2026-10-03
**Status:** SANDBOX / NONCANONICAL
**Role:** Mercer
**Question:** If SAT is right as a largely standard-physics 4D map, how should H(s)H work?

## Source record

### Old SAT
`SAT_THEORY_ARCHIVE_2023-25/Filament onto.txt`

Substantially read. Relevant source material:
- rigid-filament / flexible-timesheet ontology;
- timesheet tension, attenuation, and hysteresis ideas;
- compressed two-object statement: rigid filament + flexible time surface;
- explicit caution that standard physics should be incorporated rather than opposed.

### Current H(s)H / September-30 intake
`HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/002. Discreet Space and Dark Matter.txt`

Substantially read. Relevant question:
- whether apparent dark-matter behavior could arise from properties of space / the resolving medium rather than an additional gravitating substance.

No external prior art was used before the internal construction.

---

## Sandbox construction

Give the resolving surface a minimal isotropic tension+bending energy,

[
E[w]=int d^2x
left[
rac B2(
abla^2w)^2+
rac T2|
abla w|^2
ight]
-Fw(0).
]

Variation gives

[
(B
abla^4-T
abla^2)w
=
Fdelta^{(2)}(mathbf r).
]

Define

[
ell=sqrt{B/T}.
]

In Fourier space,

[
w(q)=
rac{F}{Tq^2(1+ell^2q^2)}.
]

Using

[
rac1{q^2(1+ell^2q^2)}
=
rac1{q^2}
-
rac1{q^2+ell^{-2}},
]

the real-space displacement is a 2D logarithmic tension Green function with a screened bending correction. Differentiating gives the radial response magnitude

[
|w'(r)|
=
rac{F}{2pi T}
left[
rac1r-rac1ell K_1(r/ell)
ight].
]

### Sandbox conjecture: slope-to-acceleration map

If projected 3D acceleration is proportional to surface slope,

[
a(r)=g_*
left[
rac1r-rac1ell K_1(r/ell)
ight],
]

then circular balance gives

[
v^2=ra
]

and therefore

[
oxed{
rac{v^2(r)}{V_infty^2}
=
1-xK_1(x),
qquad
x=r/ell.
}
]

Here (V_infty^2=g_*).

Asymptotically,

[
rllell:
quad
	ext{bending regularizes the central response},
]

while

[
rggell:
quad
a(r)ightarrow g_*/r,
]

so

[
v(r)ightarrow V_infty.
]

Thus the 2D tension-bearing surface alone produces an outer (1/r) response; bending controls the crossover scale.

## Numerical discriminator

For the master curve

[
v^2/V_infty^2=1-xK_1(x),
]

selected values are:

| (x=r/ell) | (v^2/V_infty^2) | (v/V_infty) |
|---:|---:|---:|
| 0.1 | 0.01462 | 0.12089 |
| 0.5 | 0.17178 | 0.41446 |
| 1 | 0.39809 | 0.63095 |
| 2 | 0.72027 | 0.84869 |
| 3 | 0.87953 | 0.93783 |
| 5 | 0.97978 | 0.98984 |
| 10 | 0.99981 | 0.99991 |

The half-asymptotic point solves

[
1-xK_1(x)=1/2
]

at

[
oxed{x_{1/2}=1.25715139068}.
]

Hence

[
oxed{r_{1/2}=1.25715139sqrt{B/T}}.
]

No historical SAT constant, galaxy datum, particle mass, or fitted acceleration scale was used to generate this dimensionless number.

## Interpretation boundary

Source-derived:
- flexible/tension-bearing timesheet motif;
- possibility that large-scale apparent gravitational behavior could arise from the medium.

Inference:
- a literal tension+bending 2D continuum is a natural minimal constitutive model.

Sandbox conjecture:
- acceleration is proportional to the radial slope of the resolving surface;
- the resulting master curve could model a gravity-like / flat-curve regime.

## Failure conditions

This branch fails if:
1. the resolving medium is not effectively two-dimensional in the relevant regime;
2. the slope-to-acceleration map requires an arbitrary radius-dependent constitutive function;
3. lensing and dynamical response demand incompatible couplings to (w);
4. finite-worldtube loading destroys the long-distance (1/r) tail;
5. observed asymptotic behavior requires an exponent incompatible with the 2D tension regime.

## Next test

Replace the point load (Fdelta^{(2)}) with the actual finite-worldtube contact footprint. Convolution should modify the inner profile while preserving the long-distance logarithmic Green function and (1/r) slope if the dimensional mechanism is structural.

A particularly important follow-on is to compare 1D filament-mediated, 2D timesheet-mediated, and 3D bulk-mediated Green functions. That may distinguish Interbraid from Electrogravity by **which dimensional object carries stress**, rather than by assigning separate microscopic force laws.

— Mercer
