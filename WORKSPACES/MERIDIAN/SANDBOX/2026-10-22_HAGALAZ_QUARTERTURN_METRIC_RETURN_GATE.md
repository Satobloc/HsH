# SANDBOX | Hagalaz, constrained quarter-turn, metric winding and return maps | 2026-10-22

**Status:** SANDBOX / mathematical control, **not** SAT/H(s)H physics validation, not BEDROCK. Researcher: Meridian lane, interactive continuation. **No fitted SAT constants.**

## Primary/current archived anchors actually read

1. `WORKSPACES/MERIDIAN/SANDBOX/RUN_091_HAGALAZ_SUPERHELIX_INTERLINGUA_V01.md`: candidate six SO(4) rotation channels, 8-slot rung-locked representation, similarity step.
2. `WORKSPACES/MERIDIAN/2026-10-05_FREE_BUILD_NORMAL_BUNDLE_HAGALAZ_LIFT.md`: provisional normal-plane recursion and exact tangent norm in transported frame.
3. `WORKSPACES/MERIDIAN/SANDBOX/2026-10-09_HAGALAZ_DIAGONAL_STRETCH_CLOSURE_GATE.md`: composition of anisotropic stretch and rotation is generically not diagonal-stretch times rotation; coordinate changes cannot be assigned material energy.
4. `WORKSPACES/MERCER/PEER_REVIEWS/2026-10-11_ISSUE12_HAGALAZ_VS_CRICK_INDEPENDENT_REVIEW.md`: vital gauge requirement `D_s phi=phi'+A` and non-uniqueness of interior winding given endpoint state.
5. `WORKSPACES/COMMON/MERSEARCH_WORKER_START_HERE.md` and occupied `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` observed; shared request belongs to `2026-10-21-orson-nlm-big-haul-math-001`, **not overwritten**. Repository code search + exact identified source reads used. **No new Mersearch run claimed, no exhaustive three-root archive coverage.** Archived older SAT sources mentioned in the cited Meridian notes were **not reread directly in this turn**.

## 1. Steel-bar constraint gate

A rigid connecting bar rotated 90° changes the endpoint separation direction, while its length remains fixed. With initial circular steel arc length `L=R0(2*pi+delta)` and bar chord `d=2 R0 sin(delta/2)`, the uniform one-turn helix `X(t)=(R cos t,R sin t,d*t/(2*pi))`, `R=sqrt(L²-d²)/(2*pi)`, is an *admissible curve* preserving endpoint displacement and steel arc length, **not** a unique elastic solution. Indeed the family `X_A(t)=(R_A cos t,R_A sin t,d*t/(2*pi)+A sin t)` also preserves endpoints and can have its own `R_A` chosen to preserve length. With clamped endpoint tangents/material frames, further constraints are needed. No physical bar-work law has been supplied.

## 2. Metric-derived unequal phase distribution (not an imposed musical temperament)

Use a Euclidean embedded 2-torus with `R=3,r=1` (dimensionless control), metric `ds²=r² du²+h(u)² dv²`, `h(u)=R+r cos u`. Compare a curve making one azimuthal and three meridional turns.

Uniform: `v(u)=u/3`, `u in [0,6pi]`; `L_uniform = 3∫_0^{2pi}sqrt(r²+[h(u)/3]²)du = 26.8452747433016`.

Length-stationary curve: the cyclic coordinate `v` gives first integral `c=h² dv/dell` and
`dv/du = r*c/[h*sqrt(h²-c²)]`.
Set exact closure via `3∫_0^{2pi}dv/du du=2pi`. Numerical root `c=1.7126240949042333`; length
`L_geo=3∫_0^{2pi}r*h/sqrt(h²-c²)du=25.29009526425824`.
Length reduction vs uniform = **5.79312185818%**. Closure quadrature residual ~`-1.78e-15`.
Nonuniform local meridional rate `du/dv=h*sqrt(h²-c²)/(r*c)`:
* at outer edge u=0: 8.442761794208;
* at inner edge u=pi: 1.206239681659;
* uniform rate: 3 at both edges.

The stationary curve is a torus geodesic by standard calculus of variations, but *no global minimality assertion* is made. This torus is a mathematical reference surface, **not a physical carrier object or cosmological/Kerr metric**. Neither tangent comparator angle plotted in the accompanying local figure is SAT theta_4.

## 3. Distinct transported-frame return obstruction

A *closed* 3D metric-geodesic curve has identical endpoint position and tangent. Transport a normal vector by the 3D rotation-minimizing (Bishop) connection, with discrete shortest rotations between successive unit tangents. After one traversal its normal-frame angle (with defined sign convention) is approximately:
* 1,000 divisions: `Omega=0.27389475971768 rad`;
* 5,000 divisions: `Omega=0.27380116142733 rad`;
* 10,000 divisions: `Omega=0.27379823629316 rad`;
* leading-step² extrapolation: **`Omega≈0.2737972612 rad`**.

This is **extrinsic 3D normal-frame holonomy**, NOT intrinsic torus Levi-Civita holonomy, NOT material-frame twist, NOT a measured cosmic comma. Gauge choice of initial normal vector changes coordinates but not this oriented normal-plane return angle mod 2pi.

For a proposed second-order normal-plane winding `cos(phi)E1+sin(phi)E2` about this closed curve, full pointwise closure requires
`phi(L)-phi(0)+Omega=2pi*k`. Thus if `phi(L)-phi(0)=2pi*k` is imposed independently, the residual is `Omega`. Distribute phase to compensate: `Delta phi=2pi*k-Omega`. For k=15 an even compensating phase rate gives effective pitch `L/(15-Omega/(2pi))`, a factor about **1.00291354** larger than `L/15`. This is a formal second-order *curve construction*, not extra physical tubes. Physical relevance requires specifying the material/metric framing, 4D transport and slice readout.

Not numerically identical to previously discussed `2*(2pi*(12log2(3/2)-7)) ≈0.2456726543`; no Pythagorean/musical identification is warranted.

## 4. Exact SO(4) quarter-turn channel calculation

In basis (x,y,z,w), define `R_ij(alpha)` as an oriented rotation in plane (i,j) with block [[cos,-sin],[sin,cos]]. Let `Q=R_xw(pi/2)`. Then **exactly**
`Q R_xy(beta) Q^{-1} = R_yw(-beta)`.
This reorients an xy rotation channel to a yw rotation channel. Direct numerical test at `beta=0.37` radians has max entrywise discrepancy `2.21e-17`. **However**, conjugation alone is a frame-relabelling: it cannot create a higher winding order or mechanical deformation. A constrained, spatially varying relative operation is additionally necessary for proposed Hagalaz semantics. For a whole-geometry common rotation, holonomy is conjugated and its eigenvalues/rotation angles are unchanged.

## 5. Gauge and failure checks

Let `X(s)=gamma(s)+a[cos(phi)E1+sin(phi)E2]`. A basis twist `chi(s)` sends `phi→phi-chi`, `A→A+chi'`, hence `D_s phi=phi'+A` is invariant. In a normal-Bishop frame with suitable transported two-plane, `|X'|²=(1-a K_phi)²+a²(D_s phi)²`. In general R4, a two-plane mixing with the third normal introduces more terms; do not silently drop them.

**Research gate:** test the *same starting framed geometry* with (a) endpoint-constrained quarter-turn/rod deformation and (b) an explicit Hagalaz normal lift, comparing full tangent and material/normal frame fields, length, shape, winding, return and collision tests. They are not yet proven equivalent. Avoid claiming spin-frequency, flavor or cosmic constants from dimensionless torus controls.
