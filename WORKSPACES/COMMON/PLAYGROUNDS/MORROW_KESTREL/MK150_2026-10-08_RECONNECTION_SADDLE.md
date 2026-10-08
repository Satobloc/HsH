# MK150 — Morrow/Kestrel: smooth 4D defect reconnection, causal signature test
**SANDBOXED / local fixture / 2026-10-08.** No canonical theory promotion, particle assignment, fitted constant, or PRIOR_ART exposure.

## Exact source ledger and reading depth
- **Old SAT primary corpus:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt`, blob `1854995be3311f565739f2be64269cbb0385a82f`; read lines **1–160 and 165–300**. F4 lines 168–205 proposes a compact scalar phase `theta` with contour winding and filament current `J^{mu nu}`. The same document mixes historically superseded lattice, unverified integer-writhe and numerical closure assertions; these are **not** assumed. In particular F4's `Q=L_wind+L_link+W_writhe` is not generally integer, and the `n*pi` circulation statement needs a specified phase identification. ⟦PROV:SAT-BACKBONE-F4·168–205⟧
- **Current HsH:** `Satobloc/HsH/STATE_OF_THE_THEORY.md`, blob `7a61f31932b61e32755a06a059007de74a73b563`; read complete. It distinguishes historical SAT, finite-core H(s)H, live solver work and unclosed equation bridge. ⟦PROV:HSH-STATE·§§1–6⟧
- **Current HsH:** `WORKSPACES/COMMON/PLAYGROUNDS/MORROW_KESTREL/MK148_2026-10-07_BRAID_ESCAPE_FRAMED_RIBBON.md`, blob `a638a27c397780c13b369d6f5a75ec8195373c93`; read complete. Free 3D particle braids unwind, framed *closed* ribbons can retain integer linking. ⟦PROV:MK148⟧
- **Current HsH:** `WORKSPACES/COMMON/PLAYGROUNDS/MORROW_KESTREL/MK149_codim2_vortex_fixture.py`, blob `cffe5be61935f662513b7e107f4a07a8964a48bc`; read complete and its short `MK149_2026-10-08_CODIM2_CHECKPOINT.md` (blob `be8b0c52e16811c372636cf54a2fdf84df54ea07`) read complete. Previous result: codim-2 vortex meridian winding is integer when contour avoids defect. ⟦PROV:MK149⟧
- **Control:** read `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, relevant onboarding, `BEDROCK.md` opening, current orientation/task graph, symbol/citation/scheduler policies, and Common Reference Desk. Reviewed 5 Oct HSH_RESOURCES routing packet and full War Room Declaration links; source-index/toolbox/historical/Einstein-Minkowski resources were **triaged**, not imported as theory. No general GitHub corpus search was used: exact known files were read directly; Mersearch remains required for corpus-wide discovery.

## Local notation (MK150 namespace only)
Coordinates `(T,x,y,z)` with `T=ct` measured in length. `L>0` is a local geometric length. `a` is a declared core-width parameter, with *different meanings* under the two candidate core prescriptions. `psi` is a new sandbox complex field, **not** a recovered SAT field equation; `j_def` below is a defect-current diagnostic, **not** the historical F4 tensor.

## New construction: reconnection by a smooth 4D worldsheet
Take `psi=(xz/L-T)+i y`. Its zero set is `W={y=0,T=xz/L}`, parametrized `X(x,z)=(xz/L,x,0,z)`. The embedding has rank two everywhere, including the origin. The instantaneous intersections `xz=LT` exchange hyperbola-branch connectivity through the saddle at `T=0`. **No 4D worldsheet singularity is needed.**

The field is also an exact solution of the **free massless scalar wave equation** `box psi=0`: `box(xz/L-T)=box(y)=0`. This is a mathematical local test, **not** a finite-energy global vortex solution; `psi` grows unbounded, has no vacuum-modulus condition, and does not solve an interacting finite-core field theory. ⟦DER:MK150·wave-operator⟧

## Causal discriminator
For the flat Minkowski comparator `eta=diag(-1,1,1,1)`, induced metric on W in parameters (x,z):
```
h = [[1-z²/L², -xz/L²],
     [-xz/L², 1-x²/L²]]
eigenvalues(h) = {1, 1-(x²+z²)/L²}
det(h)=1-(x²+z²)/L².
```
Thus W is spacelike inside `r<L`, null at `r=L`, timelike outside. At the reconnection saddle the time function restricted to W has a critical point, forcing its tangent plane to lie in the spatial hypersurface. Therefore **a smooth everywhere-timelike material worldsheet cannot realize this local reconnection with regular spacelike instantiations**. The defect can instead be a pattern whose instantaneous geometry changes, with causal propagation governed separately by the PDE. A non-timelike pattern does not itself carry superluminal information. ⟦DER:MK150·induced-metric⟧

## Conserved orientation across reconnection
Let `f=xz/L-T`, `g=y`. Spatial Jacobian vector `v=grad(f)×grad(g)=(-x/L,0,z/L)`. The Gaussian-regularized defect current `j_def=delta_a(f)delta_a(g)v` satisfies `div(j_def)=0` **identically for any a>0**, because v is divergence-free and orthogonal to grad f, grad g. Across a fixed plane `z=z0!=0`, total flux is `sign(z0)`, independent of T. Symbolic proof and six numerical flux integrals returned ±1 to ~2.2e-16. Thus individual strand connectivity may change while oriented defect flux remains conserved. This is **not** a proof of an electromagnetic or strong-force law. ⟦DER:MK150·defect-current⟧

## Finite-core prescription discriminator
For `T!=0`, two disconnected hyperbola branches have closest spatial separation `d_min=2 sqrt(2 L |T|)` (numerically checked at four T values). Two **constant Euclidean radius-a tubes** first touch when `|T|<=a²/(2L)`. By contrast a **phase-amplitude core** `|psi|<=a` joins through the origin when `|T|<=a`. These are distinct definitions of a and must **not** be equated without a constitutive calibration. At `L=1,a=0.1`, thresholds are `0.005` vs `0.1` length units. This scaling difference is a sharp numerical discriminator for proposed finite-core H(s)H prescriptions. ⟦DER:MK150·core-window⟧

## Failure conditions and next solver
1. If H(s)H requires the vortex worldsheet to remain a timelike *material* surface everywhere, this smooth-saddle mechanism is excluded; allow a singular transition or change the physical object.
2. If a compact phase/complex field with codimension-two zeros is not generated by the inherited SAT/H(s)H dynamics, this remains a mathematical comparison, not an emergent H(s)H mechanism.
3. The free polynomial solution has unbounded field/energy; require a localized finite-energy solution to a specified hyperbolic field equation with appropriate vacuum/boundary conditions. Flux conservation alone does not imply dynamical stability or charge identification.

**Next executable test:** evolve two vortices with a relativistic complex scalar PDE and a finite-core potential, locate `psi=0` at each instant, calculate the induced-worldsheet signature and oriented flux, and measure reconnection-window scaling under independent core prescriptions. If the candidate remains causal and finite-energy while maintaining flux, map its defect current into the F4 tensor *with declared namespace and units*. No historical B, particle masses or empirical target constants were used.

**Local reproducibility:** `MK150_reconnection_signature.py` (SymPy/SciPy), figures `MK150_reconnection_hyperbolae.png`, `MK150_induced_signature.png`, `MK150_core_discriminator.png`. Local tests passed; repo script upload is separate.

**Morrow / Kestrel**
