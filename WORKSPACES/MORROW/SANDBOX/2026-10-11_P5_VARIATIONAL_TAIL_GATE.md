# SANDBOXED | Morrow/Kestrel p=5 variational wavefront-tail gate | 2026-10-11

**Status:** New sandbox mathematical result; not SAT/H(s)H theory authority, not an Einstein-matter derivation.

## Source provenance actually read this run
- Historical: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/RMS Spacetime Filaments.txt`, complete, blob `0323682e7a49278b5a76d0c6a5a7787a13eb17d6`: wavefront/filament coupling, no constitutive exponent specified.
- Current: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt`, complete, blob `81ae23a106939cba7e3d134ed5c90a7d7a979a25`: reciprocal filament/time-surface interaction and tensile response; no p-Dirichlet action specified.
- Immediate sandbox predecessor: Morrow/Kestrel 2026-10-11 Dirichlet-tail calculation, where a finite Einstein mass `m(r)->M` yields `|grad u|²~9M/(4r³)` and divergent quadratic elastic energy.
- Onboarding: `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, Cross-Formalism Index, symbol controls, reference desk/October 5 routing, Mersearch guidance. Shared Mersearch bridge `MERSEARCH_REQUEST.json` remained occupied by Orson's request; no three-root search or novelty claim. No restricted source accessed.

## Local calculation
LOCAL:MORROW:P-DIRICHLET symbols: `theta(r)` is a **Euclidean unit-normal tilt**, NOT project `theta_4`. Let `u=(cos(theta),sin(theta)*e_r)`, `D=|grad_3 u|²=theta'^2+2 sin²(theta)/r²`, and `E_p=4pi integral r² D^(p/2) dr`. EL equation:

`[r² D^((p-2)/2) theta']' = D^((p-2)/2) sin(2theta)`.

For a decaying far-field `theta~A*r^(-alpha)`, `alpha[(alpha+1)(p-1)-2]=2`. The earlier radial metric mapping is `q=sin²(theta)=m(r)/r`. A finite nonzero asymptotic mass `m->M>0` requires `alpha=1/2`, hence **p=5** for this single-power local action. Other cases: `(p,alpha)=(2,2),(8/3,6/5),(3,1),(4,2/3),(5,1/2)`. This is a conditional far-field stationarity result, not a discovered physical exponent.

For prior synthetic `M=a=1` profile `m(r)=(2M/pi)[atan(r/a)-ar/(r²+a²)]`, set `theta=asin(sqrt(m/r))`. The normalized EL residual divided by `sin(2theta)` tends to `3(p-5)/8` as `r->infty`. Numerically p=5 gives residual `-0.170704` at r=10, `-0.012229` at r=100, `-0.001173` at r=1000, nonzero: **the previously prescribed exact profile is NOT a p=5 extremal**. p=2 tends to -1.125, p=4 tends to -0.375.

## Failure/virial gate
Spatial dilation `u_lambda(x)=u(x/lambda)` gives `E_p[u_lambda]=lambda^(3-p)E_p[u]`. For p=5 this is `lambda^(-2) E_5`; a smooth nonconstant finite-energy source-free stationary field on all R³ cannot exist without extra action terms, internal boundary/core work, external loads or other constraints. This is a self-contained Derrick/Pohozaev scaling argument. **Matching the asymptotic exponent is insufficient to derive a finite-core equilibrium.**

## Next experiment
On `r>=r_core>0`, solve the source-free p=5 EL as a boundary-value problem with explicit core traction, **without imposing the old mass profile**. Reconstruct `m(r)=r sin²(theta(r))`, check finite positive `m(infty)`, effective Einstein NEC/WEC/DEC and boundary-work budget. A finite core might sustain the exterior tail, but this has not been demonstrated.

Reproducibility in this conversation: `variational_gate.py`, `class_p_variational_residual.png`, and full `SANDBOX_P5_VARIATIONAL_TAIL_GATE_2026-10-11.md`. Python/SciPy quadrature independently reproduces the prior p=4 toy energy `E4≈3.59552264` at M=a=1.
