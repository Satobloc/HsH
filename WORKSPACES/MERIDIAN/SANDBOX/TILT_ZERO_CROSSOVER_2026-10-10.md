# Meridian ◈ — zero-tilt toroidal shell-contact crossover (2026-10-10)
**Status:** SANDBOX, not physical derivation or canonical theory. Local notation namespace `LOCAL:MERIDIAN:TILT-CROSSOVER-20261010`. No historical constant fitted. Hypothesis H and directly Schreiber-authored sources excluded.

## Exact source coverage
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/WORLDTUBE THOUGTS.txt`: complete 22,372 characters, mixed authorship; includes explicitly marked Nathan remarks about Kerr ring as 4D singular-support tube, straight vacuum tube, morphology; surrounding assistant interpretations remain assistant-authored.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt`: complete 9,258 characters; time wavefront, filament continuity, aligned vacuum and photon excitation.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/002 Forces Across Temporal Points - to 8-13-24.txt`: complete 3,911 characters; Nathan's 2024-era block-universe interaction question and assistant response.
- Current `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, Oct 9 scope, symbol/citation/branch/scheduler controls, Reference Desk, and HSH_RESOURCES War Room declaration + 39-link overview were checked. HSH_RESOURCES H(s)H Toolkit index, HQ Tool Chest, digestion, source index, BigBook index/CSV, Einstein title headers and relevant directories triaged as navigation, not theory imports. No corpus-wide search or Mersearch query: direct known file paths sufficed.

## Derivation: exact tangency Hessian
Construct two straight-time Minkowski shell histories whose spatial sections are solid tori, major radius R, minor radius r. Ring 1 lies in xy plane. Ring 2 is rotated by -beta about x through (0,R,0), then translated +2r along z. At p=(0,R,r) their shells touch; for beta=0 contact is a whole circle, beta>0 isolated. Ring traces are disjoint at onset.

Exact signed-distance functions:
`f1 = hypot(hypot(x,y)-R,z)-r`.
Let `yp=R+cos(beta)(y-R)-sin(beta)(z-2r)` and `zp=sin(beta)(y-R)+cos(beta)(z-2r)`; then `f2=hypot(hypot(x,yp)-R,zp)-r`.
At p, `f1=f2=0`, opposing gradients; the Hessian of `f1+f2` restricted to (x,y) has eigenvalues
`lambda_soft=sin(beta)/(R+r sin(beta))`, `lambda_hard=2/r`.
Numerical centered finite differences reproduce these values to 2.9e-6 for R=1,r=.12,beta up to .6. Global ring-to-ring minimum is 2r=.24 for beta=.03,.1,.3,.6 within 4e-14 (numerical minimization).

## Matched angular normal form, not exact global torus
Let `eta=R^2 lambda_soft`, `delta_phi=[delta-eta(1-cos(phi))]_+`. This matches the exact contact Hessian locally and the beta=0 circular symmetry. The transverse 2D lens area per arclength is `(4/3)sqrt(r)delta_phi^(3/2)`. Under a *prescribed one-sided linear sweep* with rate v, the local four-dimensional overlap proxy is
`V4_NF=(8R sqrt(r)/(15v)) integral_0^(2pi) [delta-eta(1-cos(phi))]_+^(5/2) dphi`.
No physical force law or exact Lorentz-boosted Kerr geometry is asserted.

As delta/eta -> 0 at fixed beta>0:
`V4_NF ~ pi sqrt(2r)/(6v sqrt(lambda_soft)) * delta^3`.
As eta/delta -> 0 (zero tilt, fixed small delta):
`V4_NF ~ 16pi R sqrt(r)/(15v) * delta^(5/2)`.
**Limits do not commute.** The apparent beta^(-1/2) coefficient divergence is nonuniform asymptotics, not physical divergence.

Universal crossover `F(x)=V4_NF/V4_circular=(1/2pi) integral [1-(1-cos(phi))/x]_+^(5/2)dphi`, `x=delta/eta`.
`F(x)~(5/32)sqrt(2x)` for x<<1; `F(x)->1` for x>>1. At x=2 the eligible angular subarc becomes the full circle.
**New numerical finding:** effective log exponent `d log V4_NF / d log delta` overshoots BOTH limiting values, reaching **3.201319754** at **x=2.620677395**, then tends toward 2.5. A finite fitted slope above 3 need not imply an exotic force or dimension. Adaptive quadrature and 800-point Gauss-Legendre integration agree to ~1e-11 relative or better.

## Scope / failure gate / next cursor
Require `delta << min(R,r)` and `eta << r` to see the whole crossover in a controlled small-tilt torus regime. At beta=.3, large-x angular extrapolation is not controlled. Shell contact is not ring/singularity contact. These are geometry tests, not Fermi exchange, EM, ER/Kerr dynamics, or a mechanism for coiling.
Next: exact boosted-torus four-dimensional overlap computation to validate normal-form predictions; typed ᚼᚼ output distinguishing shell contact, singular trace, local regularity, and active-slab opportunity. Link any force only after a justified constitutive law.
Full executable Python solver, numerical ledger, four precision figures and detailed checkpoint retained in Meridian conversation attachment `meridian_tilt_crossover_2026-10-10.zip`.

⟦PROV:SAT-ARCH-WORLDTUBE-THOUGTS·marked Nathan remarks⟧ ⟦PROV:HSH-30SEP-FUNDAMENTAL-INTUITIONS·wavefront/vacuum⟧ ⟦PROV:HSH-30SEP-FORCES-TEMPORAL·user question⟧ ⟦DER:MERIDIAN-TILT-CROSSOVER-20261010·solver.py⟧
