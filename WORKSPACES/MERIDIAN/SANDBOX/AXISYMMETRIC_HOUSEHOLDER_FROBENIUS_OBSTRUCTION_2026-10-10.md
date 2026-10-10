# Meridian sandbox | Axisymmetric Householder Frobenius obstruction | 2026-10-10

**Status:** SANDBOXED mathematical no-go under stated assumptions. Not SAT/H(s)H theory authority. **Author:** Meridian (assistant); Nathan supplied project framing, not this derivation.

## Historical and current primary sources actually reread
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT ALL TOGETHER SYNTHESIS.txt`: read the substantive opening construction (Minkowski worldline/intersection angle, helix, active timesheet) from GitHub; not the whole file in this turn. Nathan's July 3 statement explicitly distinguishes his intuitive geometry from mathematics constructed by LLMs.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt`: retrieved and read core 0th–10th intuitions and propositions, including active time surface and GR import stance.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/4D COVARIANCE+SATO.txt`: read completely. This is assistant-written integration guidance, **not** Nathan-authored foundational content.
- Controlling onboarding: `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, scoped 2026-10-09 directive, Common Reference Desk/War Room, and project controls.
- `Satobloc/HSH_RESOURCES/indexes/ai_source_index/HSH_TOOLKIT.md` and `HQ/TOOL_CHEST.md`: reviewed as resource routes only. No external physics adopted. Restricted Schreiber/Hypothesis H untouched.

## Local provisional namespace and conventions
Coordinates `(w,r,theta,phi)`, Euclidean seed `delta=dw²+dr²+r²(dtheta²+sin²theta dphi²)`; `u_flat` a Euclidean-unit *covector*. `g=delta-2 u_flat⊗u_flat`. All local, not registered as a canonical HAG/SAT symbol.

## Minimal azimuthal operator
Take orthonormal components `u_flat=C dw+A dr+B r sin(theta)dphi`, with `C²+A²+B²=1` and no polar component. Direct symbolic calculation yields

`g_wphi=-2 C B r sin(theta)`,
`det(g)=-r⁴ sin²(theta)`,
`g_ww g_phiphi - g_wphi² = r² sin²(theta)(2 A²-1)`.

Thus a nonzero cross term is easy to produce, **but alone is not evidence of Kerr or even invariant frame dragging**.

## Crucial Frobenius obstruction
For general stationary-axisymmetric `u_flat=C(r,theta)dw + A(r,theta)dr + D(r,theta)dphi` (one can add polar component without changing the following necessary components), the `dw∧dr∧dphi` and `dw∧dtheta∧dphi` components of `u_flat∧du_flat=0` imply

`C ∂_i D - D ∂_i C=0`, for i=r,theta (assuming C nonzero).

Hence `D/C=q` must be constant on each connected patch. If the symmetry axis is smooth and u is a smooth invariant covector, `D=u_phi→0` at the axis whereas `C` remains nonzero there. Thus `q=0`, so **D=0 globally within this stationary-axisymmetric patch**. Therefore `g_wphi=-2 C D=0`.

A globally smooth, axisymmetric, hypersurface-orthogonal preferred flow with nonvanishing w-component **cannot generate azimuthal cross terms in this fixed diagonal Euclidean seed using one Householder reflection**. An off-axis nonzero constant q permits `u∝d(w+q phi)` locally but is multivalued around the azimuth; axis regularity rules it out. Note the conclusion is **ansatz-specific**. Nontrivial shift may still arise in coordinate changes and Kerr may require allowing u twist, a different seed, additional fields, or decoupling flow u from the wavefront normal.

## Check / falsifier
Test `C=cos eps, A=0, D=sin eps r sin(theta)` (constant local eps). Then `g_wphi≠0`, but `∂_theta(D/C) ≠0`, so Frobenius fails except degenerate loci. Any proposed stationary-axisymmetric regular flow with nonzero g_wphi **and** `u∧du=0` in this metric ansatz would falsify the derivation. Also independently check physical frame dragging by curvature invariants and asymptotic angular momentum, never by a single coordinate cross term.

## Relevance
The exact Schwarzschild representation from the previous Meridian turn lives in B=0 sector. Rotation toward Kerr through **only** adding an azimuthal component of a hypersurface-normal u is obstructed. The next solver should separate timelike metric-induction direction from actual wavefront normal, and compare a nonintegrable u option to integrable wavefront n; then test vacuum Einstein tensor, twist of Killing field, asymptotic J and Kerr multipole invariants. No claimed physical result.

## Resource-routing and saved-state limits
HSH_RESOURCES reference desk and TOOLKIT index reviewed. Repository write is a sandbox checkpoint, not promotion. No symbolic registry shared change requested.
