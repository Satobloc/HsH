# Ravel sandbox — finite-slab readout of a rotated finite-core loop

**Date:** 2026-10-06 (America/New_York)  
**Status:** `GEN/CANDIDATE`; isolated sandbox, not canonical SAT/H(s)H  
**Local symbol namespace:** `LOCAL:RAVEL:FINITE_SLAB_LOOP`  
**Question:** if the old SAT 4D rotation map is taken seriously, what is the smallest finite-core intersection law that can replace an arbitrary P9 contact smoother?

## Controlling boundaries

- The modeled object is a finite-core worldtube/filament history. H(s)H is a representation/readout description, not that object.
- `R_Sigma` remains the general readout. The slab below is one explicit intersection scaffold.
- Projection, intersection, boundary measure, and swept measure are different observables and are not interchangeable.
- All lattice, particle-identity, mass-angle, force-label, and historical-constant claims in the archive source are excluded.
- HSH_RESOURCES was consulted only as a routing/tool/reference surface; no external theory was imported.

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT CORE — UI CONFIG.txt`, complete file, lines 1–50 (6,526 characters; blob `6817caf68943593f31d72d51798e0ba4589624a4`). The retained old SAT construction is only the rotation-generated trajectory and its decomposition into scale plus 4D rotation. The source's lattice, mass, particle, spectrum, and universality assertions remain historical/quarantined. `⟦PROV:SAT-UI-CONFIG·L1–10⟧`
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_090_TANGENCY_DIMENSIONAL_DISCRIMINATOR.md`, complete file, lines 1–37 (2,702 characters; blob `ade943b7cc4f43d72aa09de1dc1a42acf20dbc00`). Retained: type the observable first as slice, projection, boundary measure, swept measure, or normalized observable; then check its dimensions. `⟦PROV:HSH-RUN090·L5–37⟧`
3. Refreshed before construction: `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, `WORKSPACES/COMMON/REFERENCE_DESK/README.md`, `🔑/🔑.md`, symbol/citation/toolbox controls, and the requested HSH_RESOURCES routers including the War Room declaration. The key-layer statement that H(s)H describes what is seen on dynamic block surfaces controls the readout interpretation here.

## 1. Source fact, inference, conjecture

### Source fact (`SRC/HISTORICAL`)

The archive writes a 4D trajectory schematically as

\[
y^\mu(\lambda)=r(\lambda)R^\mu{}_{\nu}(\lambda)x_0^\nu,
\]

with a rotation history in `SO(4)`. That is a usable kinematic generator, not evidence for the source's later physical identifications. `⟦PROV:SAT-UI-CONFIG·L1–10⟧`

Run 090 shows that exponent matching is insufficient: one must first identify the measure and its dimension. `⟦PROV:HSH-RUN090·L10–37⟧`

### Current inference (`GEN/DERIVED`, conditional on the declared geometry)

A circle rotated relative to a resolving sheet projects to an ellipse, but pure intersection does not generally return that ellipse. With nonzero tilt and zero thickness it returns two points. With finite slab/core thickness it returns two arcs.

### Sandbox conjecture (`GEN/CANDIDATE`)

The P9 contact width should not be a free softplus scale. If it represents finite-core/slab intersection, its kernel should be derived from core cross-section and resolving thickness. The minimal round-core model predicts compact support and a polynomial edge.

## 2. Minimal geometry

Let a circular centerline of radius `R` lie in the plane spanned by a sheet tangent `e_x` and

\[
e_{y,\theta}=\cos\theta_{\rm clip}\,e_y+\sin\theta_{\rm clip}\,n,
\]

where `n` is the resolving-sheet normal. Parameterizing by phase `phi`, its coordinates are

\[
x=R\cos\phi,\qquad
y=R\cos\theta_{\rm clip}\sin\phi,\qquad
q=R\sin\theta_{\rm clip}\sin\phi.
\]

Here `(x,y)` is the orthogonal projection into the sheet and `q` is normal displacement. The projection is the full ellipse with semiaxes

\[
(R,\ R|\cos\theta_{\rm clip}|).
\]

Take a centered resolving slab `|q| <= d_Sigma/2` and a round normal core of radius `r_c`. A centerline phase has nonempty finite-core incidence iff

\[
|R\sin\theta_{\rm clip}\sin\phi|
\le a_{\rm eff},
\qquad
a_{\rm eff}=\frac{d_\Sigma}{2}+r_c.
\]

Define

\[
\kappa=\frac{a_{\rm eff}}{R|\sin\theta_{\rm clip}|}.
\]

The exact fraction of centerline phase with nonempty incidence is

\[
f_{\rm inc}(\theta_{\rm clip})=
\begin{cases}
1,&\kappa\ge1,\\[2mm]
\dfrac{2}{\pi}\arcsin\kappa,&0<\kappa<1.
\end{cases}
\]

Thus the topology changes at

\[
\boxed{\theta_c=\arcsin(a_{\rm eff}/R)}.
\]

Below `theta_c`, the whole loop intersects. Above it, the intersection support is two disconnected arcs. In the joint zero-width limit `d_Sigma,r_c -> 0`, those arcs shrink to the two phases `phi=0,pi`.

## 3. A geometry-derived contact kernel

For a one-dimensional carrier in four ambient dimensions, use a 3-ball normal cross-section. At normal center displacement `u`, the fraction of that cross-section inside the slab is

\[
W(u)=\frac{3}{4r_c^3}
\left[F(z_+)-F(z_-)\right]_+,
\qquad
F(z)=r_c^2z-\frac{z^3}{3},
\]

with

\[
z_- = \max(-r_c,-d_\Sigma/2-u),\qquad
z_+ = \min(r_c,d_\Sigma/2-u).
\]

This is a dimensionless normalized cross-section measure. It has exact compact support at

\[
|u|<d_\Sigma/2+r_c.
\]

The normalized loop signal is

\[
S(\theta_{\rm clip})
=\frac{1}{2\pi}\int_0^{2\pi}
W\!\left(R\sin\theta_{\rm clip}\sin\phi\right)d\phi.
\]

This replaces the previous arbitrary softplus with a declared geometric kernel. The softplus has exponential tails; the round-core slab kernel has none. They are experimentally distinguishable.

## 4. Unexpected inverse result

When `R|sin(theta_clip)|` is large compared with `d_Sigma` and `r_c`, each of the two crossings is locally linear. Since

\[
\int_{-\infty}^{\infty}W(u)\,du=d_\Sigma,
\]

the weighted signal obeys

\[
\boxed{
S(\theta_{\rm clip})
\sim \frac{d_\Sigma}{\pi R|\sin\theta_{\rm clip}|}
}
\]

to leading order. The core radius cancels. Meanwhile

\[
f_{\rm inc}
\sim \frac{2(d_\Sigma/2+r_c)}{\pi R|\sin\theta_{\rm clip}|}.
\]

Therefore a high-tilt morphology measurement can separate the two widths:

- integrated cross-section signal estimates `d_Sigma`;
- support extent estimates `d_Sigma/2+r_c`;
- their difference recovers `r_c`.

This is a genuine geometry-derived identifiability mechanism; it does not use historical constants or particle labels as targets.

## 5. Numerical fixture and validation

The visualization uses the dimensionless local fixture

\[
R=1,\qquad d_\Sigma=0.08,\qquad r_c=0.06,
\]

so `a_eff=0.10` and `theta_c=5.73917 degrees`.

| tilt | projected semiminor | incidence fraction | weighted signal | intersection support |
|---:|---:|---:|---:|---|
| 0 deg | 1.0000 | 1.000000 | 0.851852 | full loop |
| 10 deg | 0.9848 | 0.390679 | 0.149965 | two arcs |
| 30 deg | 0.8660 | 0.128188 | 0.051058 | two arcs |
| 60 deg | 0.5000 | 0.073675 | 0.029429 | two arcs |
| 90 deg | 0 | 0.063769 | 0.025481 | two endpoint neighborhoods |

At 90 degrees the asymptotic weighted prediction is `0.08/pi = 0.0254648`, within `1.6e-5` of the numerical integral. The analytic incidence fraction agrees with a 200,000-phase numerical mask to `9.97e-6` maximum absolute error across 501 tilts.

## 6. Mechanism discriminator

| Readout architecture | predicted morphology at nonzero tilt |
|---|---|
| Full orthogonal projection | complete ellipse for every tilt below 90 degrees; line segment at 90 degrees |
| Pure zero-width intersection | two points for every nonzero tilt |
| Finite slab + finite core intersection | full loop below `theta_c`, then two disconnected arcs with compact-support edges |

An observed continuous ellipse therefore cannot be called “pure intersection” without an additional integration/projection mechanism. Conversely, two localized arc neighborhoods falsify a projection-only readout.

## 7. Tight test

Generate synthetic or solver-native tilted-loop readouts with hidden `(d_Sigma,r_c)`. Fit simultaneously to:

1. integrated signal `S(theta_clip)`;
2. nonzero-support fraction `f_inc(theta_clip)`;
3. the critical tilt `theta_c`;
4. edge-tail behavior beyond contact.

Withhold dense high-tilt samples. The model passes only if the independently inferred widths predict all four observables and transfer to the withheld tilts. Compare against the earlier softplus kernel; any persistent signal outside the compact contact band favors a non-geometric acquisition tail or a different core profile.

## 8. Failure conditions

Reject or revise this construction if any of the following holds:

- the readout integrates along the normal rather than intersects a slab;
- the carrier's normal cross-section is not approximately a 3-ball;
- sheet curvature or carrier curvature varies materially across `d_Sigma+2r_c`;
- deformation makes the circular centerline assumption invalid over one readout;
- recovered `d_Sigma` and `r_c` fail to transfer across tilt and resolver density;
- nonzero tails persist outside `|u|=d_Sigma/2+r_c` after known instrument response is removed.

The earliest unsupported edge is the round 3-ball core. Everything after that remains conditional but fully testable.

## Artifacts

- `WORKSPACES/RAVEL/CODE/finite_slab_rotated_loop.py`
- `WORKSPACES/RAVEL/DATA/finite_slab_rotated_loop.json`
- `WORKSPACES/RAVEL/FIGURES/finite_slab_rotated_loop.svg`

## Next cursor

Replace P9's softplus with `W(u)` and jointly infer `(d_Sigma,r_c)` from a training tilt sweep. Then withhold a dense contact sweep and test the compact-support prediction. If the two inferred widths do not transfer, the smoothing is acquisition calibration rather than finite-core morphology.
