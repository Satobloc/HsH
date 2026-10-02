# Mercer sandbox — impedance-to-curvature constitutive bridge

**Date:** 2026-10-02
**Status:** SANDBOXED / new construction / not canonical SAT>H(s)H
**Role bias:** constitutive laws, dimensional analysis, coarse-graining, falsifiable scaling

## Sources actually read this run

### Old SAT
`SAT_THEORY_ARCHIVE_2023-25/SAT Mark V/SATv TIME_WAVEFRONT.txt`

Read substantially. Relevant source construction:
- advancing wavefront supplies the arrow/time resolver;
- filament-wavefront intersections generate observable matter;
- tentative dynamics explicitly propose wavefront energy/impulse, selective transfer, angle/twist dependence, and “drag”/resonance hold as mass;
- vacuum is low/zero interaction and post-interaction residual torsion is proposed as inertial resistance.

### Current H(s)H / September-30 intake
`HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_133_CURVATURE_FREE_B2_RADIUS_RECONSTRUCTION.md`

Read in full. Relevant checked sandbox geometry:
- generic rank-two carrier radius
  \[
  \varepsilon\sim \frac{A_\Sigma}{2C_4\ell_\parallel},
  \qquad C_4=\int_0^1\sqrt{1-u^4}\,du;
  \]
- orientation factor
  \[
  \beta\sim\frac{C_4K\ell_\parallel^3}{4A_\Sigma};
  \]
- admissibility
  \[
  K\ell_\parallel^2\le 8\varepsilon;
  \]
- residual S2/B2 degeneracy can be broken by an independent radius datum.

No HSH_RESOURCES/prior-art source was used before this construction.

## Translation

Old SAT’s “wavefront drag / angular mismatch retained as mass” is not yet a constitutive law. H(s)H now has a finite carrier radius that can be reconstructed from local readout. That radius supplies the missing length needed to turn curvature into a dimensionless angular strain:

\[
\eta\equiv \varepsilon\kappa.
\]

This suggests treating the old SAT mismatch angle \(\theta\) as a preferred local strain imposed by the resolving medium, while the finite worldtube responds by bending.

## New sandbox constitutive model

Take the simplest local energy per arclength

\[
\mathcal E=
\frac{B}{2}\kappa^2
+
\frac{\mu}{2}(\varepsilon\kappa-\theta)^2
+
\frac{C}{2}(\tau-\tau_0)^2.
\]

Dimensions:
- \([B]=[C]=E\,L\), bending/torsional moduli;
- \([\mu]=E/L\), medium/worldtube angular-lock stiffness;
- \(\varepsilon\kappa\), \(\theta\) dimensionless.

For a locally untwisted preferred state, minimization gives

\[
\kappa_*=
\frac{\mu\varepsilon}{B+\mu\varepsilon^2}\theta.
\]

Define the dimensionless constitutive number

\[
\boxed{\Lambda=\frac{\mu\varepsilon^2}{B}}.
\]

Then

\[
\boxed{\varepsilon\kappa_*=
\frac{\Lambda}{1+\Lambda}\theta.}
\]

This is a calculable SAT -> H(s)H bridge.

### Two regimes

**Filament-dominated / weak medium:** \(\Lambda\ll1\)

\[
\varepsilon\kappa_*\simeq\Lambda\theta,
\qquad
\kappa_*\simeq\frac{\mu\varepsilon}{B}\theta.
\]

The wavefront mostly slips past the carrier. Old-SAT “drag” is weak.

**Medium-locked / soft carrier:** \(\Lambda\gg1\)

\[
\varepsilon\kappa_*\simeq\theta,
\qquad
\kappa_*\simeq\frac{\theta}{\varepsilon}.
\]

The worldtube geometrically records nearly the full imposed mismatch.

The crossover is exactly at

\[
\boxed{\mu\varepsilon^2=B.}
\]

So H(s)H need not assign “mass” directly to angle. The observable geometry can be the result of competition between medium angular locking and carrier bending rigidity.

## Readout closure

Run 133 reconstructs

\[
\varepsilon\sim\frac{A_\Sigma}{2C_4\ell_\parallel}.
\]

Numerically,

\[
C_4\approx0.8740191848,
\qquad
\boxed{\varepsilon\approx0.572069823\frac{A_\Sigma}{\ell_\parallel}}.
\]

Therefore measured \((A_\Sigma,\ell_\parallel,\kappa_*,\theta)\) gives

\[
y\equiv\frac{\varepsilon\kappa_*}{\theta}
=\frac{\Lambda}{1+\Lambda},
\]

hence

\[
\boxed{\Lambda=\frac{y}{1-y}}.
\]

This makes the constitutive competition identifiable from geometry alone, up to separating \(\mu\) and \(B\).

## Coarse-graining consequence

If \(B\) and \(\mu\) are approximately scale-independent over some band, then

\[
\Lambda\propto\varepsilon^2.
\]

Thus increasing carrier scale drives a weakly coupled carrier toward medium-locking automatically. More generally if

\[
B\propto\varepsilon^p,\qquad \mu\propto\varepsilon^q,
\]

then

\[
\boxed{\Lambda\propto\varepsilon^{q+2-p}.}
\]

This gives a sharp scale discriminator:
- \(q+2-p>0\): larger structures couple more strongly to the resolving medium;
- \(q+2-p=0\): scale-invariant angular response;
- \(q+2-p<0\): larger structures decouple.

That is potentially useful for the recurring SAT question “why should gravity-like response coarse-grain differently from electricity/interbraid response?” Different effective moduli can put the two sectors on opposite sides of this exponent.

## Failure conditions

This branch fails or needs extension if:
1. reconstructed data produce \(y\notin[0,1)\) for positive \(B,\mu\);
2. response is strongly hysteretic/nonlocal so a local quadratic constitutive energy is inadequate;
3. the finite radius reconstructed by Run 133 does not correlate with curvature response;
4. torsion/chirality couples at the same order, requiring cross terms such as \(D\kappa\tau\) or a chiral preferred \(\tau_0\);
5. the inferred \(\Lambda\) has no stable scaling across repeated local sections of one carrier.

## Solver test / prediction candidate

For a family of exact H(s)H carriers:
1. reconstruct \(\varepsilon\) from \((A_\Sigma,\ell_\parallel)\);
2. impose a controlled mismatch \(\theta\);
3. minimize the worldtube/medium energy numerically;
4. measure \(\kappa_*\);
5. plot \(y=\varepsilon\kappa_*/\theta\) against independently varied \(\mu\varepsilon^2/B\).

The quadratic model predicts the parameter-free collapse

\[
\boxed{y=\frac{\Lambda}{1+\Lambda}.}
\]

At \(\Lambda=0.01,0.1,1,10,100\), the predicted response fractions are approximately

\[
0.00990,\;0.09091,\;0.5,\;0.90909,\;0.99010.
\]

Systematic departure from this curve is informative: it directly measures the nonlinear constitutive correction rather than merely saying “the model failed.”

## Next mathematical extension

Add a chiral coupling

\[
\mathcal E_{\rm chiral}
=
D\kappa(\tau-\tau_0)
\]

and test whether eliminating \(\tau\) renormalizes the effective bending stiffness to

\[
B_{\rm eff}=B-D^2/C.
\]

If so, interbraid/chirality could alter apparent wavefront coupling without changing the medium stiffness \(\mu\), providing a clean route by which otherwise similar carriers acquire different inertial/interaction response.

**Boundary:** everything after the source summaries is Mercer sandbox inference/conjecture, not established SAT>H(s)H.
