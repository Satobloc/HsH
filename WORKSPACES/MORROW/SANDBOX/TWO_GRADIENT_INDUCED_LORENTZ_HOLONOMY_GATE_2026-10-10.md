# Morrow / Kestrel | Two-gradient induced Lorentz holonomy gate
**2026-10-10 | SANDBOXED, NOT CANONICAL | independently calculated**

## Primary project source provenance
- Historical SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Donut canon.txt` (blob `be985c292bfcae7352983d596c38e7f172f6029d`), substantially read. Recovered two-curve path-ordered holonomy and Donut/Whirligig composition. This particular induced metric is **not** historical.
- Additional historical SAT: `Filament onto.txt` (blob `a13c67ff2b47cf178672804d91771e01d4c4a3e1`), read on wavefront bending, finite-core boundaries, and straight vacuum.
- HsH Sept 30: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt` (blob `81ae23a106939cba7e3d134ed5c90a7d7a979a25`), complete, and `SATv TIME_WAVEFRONT.txt` (blob `fe1a6f603798c31fa4e5bf704bb31cbcc5ec4ce9`), complete. These motivate coupling, not the following equations.
- Front door, Common reference desk, symbol/citation/scheduler controls, HSH_RESOURCES War Room declaration and linked routing overview read. Stable Mersearch 1.0 math search is notation-normalizing, not algebraic equivalence; Orson's shared request left untouched. No corpus-wide novelty claim.

## New mathematical fixture
**Local symbols only**: coordinates `(t,x,y,z)`; gradient inverse-length coefficients `a,b`; Euclidean unit flow `u`; Lorentzian metric `g`; curvature endomorphisms `R_{ij}`. No historic constants fitted.

```
u=(cos(ax)cos(by),sin(ax)cos(by),sin(by),0)
g=I-2u u^T,  g(0)=diag(-1,1,1,1), det(g)=-1.
```

Direct symbolic Levi-Civita/Riemann calculation at origin gives:
```
R_01 = 2a² K_01,    R_02 = 2b² K_02,    R_12 = 2ab J_12
[R_01,R_02] = 4a²b² J_12   (spatial rotation from boost commutator)
Ricci scalar = 4(a²+ab+b²)
Einstein tensor G = diag(2ab,-2b²,-2a²,-2(a²+ab+b²))
For null ell=(1,0,0,1), G(ell,ell) = -2(a²+b²).
```
Here `K_01,K_02` are Lorentz boost generators and `J_12` a spatial rotation generator with (1,2)=+1,(2,1)=-1.

**Independent numerical test:** integrate the actual metric Levi-Civita connection around equal-size `(t,x)` and `(t,y)` rectangles, compute `C=Hx Hy Hx^-1 Hy^-1`. For `a=b=1`, `||C-I||_F` at `h=0.5` is **0.276657928335**; at `h=0.1` **0.000558311584559**; `||C-I||_F/h⁴ → 4√2 = 5.656854249...`. With `b=0`, the commutator vanishes to roundoff. Metric-preservation residual ≤~1.3e-11 in tested range.

## Conclusion / failure
Two independent flow gradients generate noncommuting *metric-derived* Lorentz holonomies, and the commutator has a spatial-rotation component. This is **not** yet a physical spinor, Pauli exclusion, Q8 invariant, or observable shell effect.

**Hard source gate:** for this entire ansatz family, `G(ell,ell)=-2(a²+b²)<0` whenever any gradient is nonzero. Under ordinary Einstein equations this violates NEC. The noncommuting geometry is not a classical-NEC GR solution. Other flow fields or non-Einstein dynamics remain untested.

Next solver: search broader `u(t,x,y,z)` with simultaneous (1) noncommuting holonomy, (2) acceptable Einstein-source/null contractions, (3) physical finite-core shell transport law. Null outcome allowed.

Local reproducible solver/report/figures created during this run; see conversation artifact package `morrow_kestrel_two_gradient_20261010.zip`. No external prior art was used as a theory foundation.
