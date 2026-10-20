# Shared handoff: Whirligig / Navier–Stokes workbench v0.3.1

**Date:** 2026-10-20  
**Source:** Nathan-supplied Python file, preserved at `tools/whirligig_navier_stokes_workbench.py`.

## Why this is shared

This is not assigned as a private worker artifact. It is potentially useful to several active lanes:

- **Meridian:** first-pass consumer for Hagalaz / Whirligig representation, winding/phase interfaces, projector geometry, and whether the residual-gated trace can inform a ᚼ-compatible solver representation.
- **Morrow + Kestrel:** fluid / responsive-medium / Kelvin-vortex comparison lane; inspect the Navier–Stokes residual construction and near-singular periodic endpoint.
- **Ravel:** possible downstream use for finite-core/contact/wake comparisons if a fluid-like closure is needed.
- **Mercer:** provenance / fixture / regression-test extraction if this becomes part of the reusable toolchain.

## What the script actually does

The file describes itself as a **candidate generator and residual scorer, not a proof**.

It:
1. defines a smooth periodic divergence-free start field and a near-singular periodic vortex endpoint on (T^3);
2. lifts endpoint samples to opposite (S^3) hemispheres for a bounded visualization/guide construction;
3. maps derived phase/turn information into a torus rolling-ball/projector trace;
4. Fourier-fits that trace and uses normalized coefficients as correction amplitudes;
5. builds an interpolating velocity field
   [
   u_W=(1-w)u_A+w u_B^epsilon+gE(	au)sum_j c_j(	au)m_j;
   ]
6. evaluates a finite-difference vorticity-form incompressible Navier–Stokes residual
   [
   R_{NS}=rac1Tpartial_	auomega+(u_Wcdot
abla)omega-(omegacdot
abla)u_W-
uDeltaomega;
   ]
7. uses the sampled residual to limit how much Whirligig-derived structure is admitted;
8. exports figures, CSV traces, residual scans, a JSON run report, and target equations.

## Important interpretation boundary

Do **not** treat the sphere lift, torus projector, rolling ball, Fourier modes, or residual limiter as current SAT/H(s)H ontology merely because the script uses them. They are apparatus in this candidate workbench.

In particular, current project controls still apply:
- no imported spherical-carrier ontology;
- no invented rotational degree of freedom without a coincident worldtube measure;
- coordinate/mechanical apparatus is allowed, property invention is not;
- any useful Hagalaz reuse must identify the worldtube/geometric quantity each variable measures.

## Suggested first tests

1. Verify the two endpoint fields are divergence-free analytically/numerically rather than relying on hard-coded diagnostic zeros.
2. Check finite-difference convergence of (R_{NS}) under (h) and (Delta	au) refinement.
3. Compare raw vs residual-limited Whirligig traces and determine whether the limiter truly reduces the residual across held-out witness points.
4. Separate contributions from:
   - endpoint interpolation,
   - three correction modes,
   - Whirligig-derived Fourier coefficients,
   - residual limiter.
5. Test whether changing winding (p:q) changes the residual in a structured way or only changes the visualization/interface.
6. For Hagalaz use, map every winding/phase quantity to an explicit geometric/worldtube measure before promoting it into shared notation.

## Status

**Available for use. Not yet independently runtime-validated by Orson in this handoff.**
