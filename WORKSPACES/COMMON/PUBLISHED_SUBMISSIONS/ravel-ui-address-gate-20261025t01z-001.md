# CODE 000 | Ravel | UI geometric address gate | 2026-10-25T01Z

Task: `calc48-20261025T01Z-ravel-ui-address-001`.
Status: `INTERNALLY_CHECKED` geometry; physical interpretation `UNRESOLVED`; no BEDROCK promotion.

## Historical construction and controls

The SAT mathematical backbone `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt` (Git blob `1854995be3311f565739f2be64269cbb0385a82f`) gives the Universal Indicatrix mapping `y^mu(lambda)=r(lambda) R^mu_nu(lambda) x0^nu`, with `R in SO(4)`. The native UI wording is recovered in `_AUTO_EXTRACTED_TEXT/Universal Indicatrix in my words CHARACTERIZATION (Nolat).txt` (blob `a1707dffe3502d507bc405d4087a3476fc1d6cce`), describing two relative hyperspherical frames, rotation, scaling and trajectory steering. Current executable `Satobloc/HsH/tools/whirligig_rq/ui4d.py` (blob `6dc51596150467261086705f95b16ba92812c0c6`) implements the six-plane SO(4) lift. These are different source strata; no original authorship/date inferred from a later compilation.

## Exact mathematical construction

Let `0<a<1` and dimensionless phase `t mod 2*pi`. The curve `gamma(t)=ell*(a+sin(t),sin(2*t),0,0)` has positive radial coordinate `r(t)=||gamma(t)||`, hence admits the UI representation `gamma(t)=r(t)R_12(theta(t))e1`, where `theta=unwrap(arg(a+sin(t)+i*sin(2*t)))`. For `a=1/2`, the net angle change is `+2*pi` (one turn). There is exactly one unordered self-intersection pair on the parameter circle: `t=0,pi`, at `p=ell*(a,0,0,0)`. Proof: equal first coordinates imply `t2=t1` or `t2=pi-t1 (mod 2*pi)`; the latter flips `sin(2*t)`, so equality requires `sin(2*t)=0`, giving only distinct pair `0,pi`. Tangents at the crossing are `(1,2,0,0)` and `(-1,2,0,0)`, linearly independent (planar determinant 4). This is a transverse crossing in its two-dimensional supporting plane, NOT transverse in the technical ambient-R4 sense.

A single *uniform* full rotation at fixed positive radius has no interior double point: distinct phase angles in `[0,2*pi)` give distinct points. Thus one full rotation is not sufficient for a crossing. Nonmonotone radius and angle are essential in this explicit construction.

The six-dimensional SO(4) rotation parameterization has three gauge directions when used to address only one point: the stabilizer of `e1` is SO(3). The differential of `R -> R e1` has rank 3 and kernel dimension 3. Point addresses require a frame/gauge convention or an equivalence class, plus parameter/branch information.

## Continuous drift versus snapshot rotation

Under a continuous secondary plane rotation `R_13(eps*t)`, the original double-point images at `t=0,pi` split by `2*ell*a*|sin(eps*pi/2)|`. For `a=1/2, eps=0.1`, separation is `0.15643446504023087*ell`. With `0<|eps|,|eta|<1/2`, the full curve `R_13(eps*t)R_24(eta*t)gamma(t)` is injective on `[0,2*pi)`: equality of the xz-components forces identical parameters except when x=0; the two x=0 phases have opposite y-sign and cannot coincide under the bounded yw-rotation. Thus generic slow drift can REMOVE the original crossing rather than move it.

By contrast, separate loop *snapshots* `gamma_n(t)=R_13(n*beta)R_24(n*gamma)gamma(t)` retain one double point each. With `beta=pi*sqrt(2)/10`, `gamma=pi*sqrt(3)/10`, the rotated supporting 2-planes are pairwise transverse for distinct finite n; the loops are disjoint because the base curve avoids the origin. Adding a y-offset `d=1/4` moves the snapshot double points to `p_n=ell*(a*cos(n*beta),d*cos(n*gamma),a*sin(n*beta),d*sin(n*gamma))`, a dense torus orbit for incommensurate angles, not a discrete grid. Snapshots are NOT a continuous joined worldline.

## Executed controls and scope

Python/SymPy/NumPy: crossing determinant 4; winding `0.9999999999999999`; UI reconstruction residual `8.95e-16*ell`; SO(4) point-action rank 3, kernel dimension 3; slow-drift separation `0.15643446504023087*ell`; 12-snapshot pairwise supporting-plane determinant minimum `0.01953937504701721`. All assertions passed. Code SHA256 `03a33989e00794aeeff118005498410849de3700bc9bbb0206bf95f434689c7b`.

Units: `ell` is an explicitly chosen length (Planck length if normalized); phase and rotations are dimensionless. No physical time or Lagrangian is specified. No CODATA observable is predicted; comparison is inapplicable. A self-intersection address is a *geometric encoding* only, not a demonstrated unique physical event or dynamics. No restricted/private content included.
