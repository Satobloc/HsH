# Meridian XC — exact finite-slab fold uniqueness theorem

**Status:** SANDBOX. Exact only inside the frozen leading quadratic-contact finite-slab model. No particle labels or historical constants used as targets.

## Sources read
- Old archive: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/WORLDTUBE THOUGTS.txt`, read substantially. Extracted the finite framed-curve/worldtube mechanics distinction between arclength geometry and time evolution, the need for tension plus bending terms, straight worldtube as vacuum baseline, and insistence on typed geometry rather than interpretive labels.
- HsH Sep-30 dump: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_104_EXACT_FINITE_SLAB_FOLD_DISCRIMINATOR.md`, read in full. Consumed its exact finite-slab function J(r), fixed-span readout H(r), and numerical stationary point r*=0.3686624695. Run 104 explicitly left uniqueness as the next theorem-shaped check.

## New result
For 0<r<1 define
[
t=\sqrt{\frac{1-r}{1+r}},\qquad r=\frac{1-t^2}{1+t^2}.
]
Substitution into Run 104's exact fixed-span function gives
[
H(t)=-\frac4{105}(t-1)(3t^6+3t^5+10t^4+10t^3+10t^2+3t+3).
]
Differentiation collapses to
[
\frac{dH}{dt}=-\frac4{15}t(3t^5+5t^3-2).
]
The polynomial
[
f(t)=3t^5+5t^3-2
]
has
[
f'(t)=15t^4+15t^2>0
]
for t>0, with f(0)=-2 and f(1)=6. Therefore it has exactly one root in (0,1), hence H(r) has exactly one stationary point for 0<r<1.

For r>=1 define
[
s=\sqrt{\frac{r-1}{r+1}}.
]
Then
[
H(s)=-\frac4{105}(s-1)^3(3s^4+9s^3+11s^2+9s+3)
]
and
[
\frac{dH}{ds}
=-\frac4{15}s(s-1)^2(3s^3+6s^2+4s+2)<0
]
for 0<s<1. Thus there are no further positive stationary points.

Hence the finite-slab fixed-span inverse map has one and only one positive fold.

Numerically:
[
t_*=0.679176456133,
\quad r_*=0.368662473068,
\quad h/R=0.269359670717.
]

## H(s)H interpretation
The two-valued inverse geometry is not an arbitrary solver ambiguity. It is a genuine fold catastrophe in the readout map from finite-core geometry to the pair (span, M4). A branch/type bit can therefore be justified only as inverse-map sheet information, not as an extra force or fitted continuous parameter.

## Failure condition
The theorem fails as physics if higher contact order, anisotropic fibers, ambient curvature, or nonquadratic local separation destroys the one-fold structure. It remains exact for the frozen quadratic-contact model.

## Next solver
Perturb q(s)=Ks^2/2 by the leading allowed cubic/quartic terms and numerically continue the fold. Measure whether the single fold is structurally stable, splits into multiple folds, or disappears. This is the correct gate before promoting a binary branch type into the broader ᚼ grammar.
