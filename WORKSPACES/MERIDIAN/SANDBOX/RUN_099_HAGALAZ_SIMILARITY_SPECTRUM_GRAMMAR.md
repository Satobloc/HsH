# MERIDIAN RUN 099 — Similarity-spectrum grammar for ᚼ recursion

**Status:** SANDBOXED / noncanonical  
**Date:** 2026-10-05  
**Question:** If SAT is right as a largely standard-physics 4D map, how should H(s)H work?

## Sources actually read

1. **Old SAT archive:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/HYPERFOAM THEORY/UNIVERSAL_INDICATRIX.txt`, lines 1–240. Read the rotating-S3 + scaling proposal, its SO(4) critique, and the oscillator embedding discussion.
2. **Old SAT archive, second anchor:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt`, lines 1–360. Read the explicit superhelix parametrization, UI equation `y=r R x0`, velocity split, and operational fourth-order Lagrangian material. Numerical/metrological claims in this file were treated as historical claims only, not targets.
3. **Current H(s)H:** `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HAGALAZ_DEF+.txt`, lines 1–260. Read the solver-ecology map through the finite-core family and the candidate oriented-similarity representation.
4. **Current H(s)H:** `Satobloc/HsH/WORKSPACES/MERIDIAN/SANDBOX/RUN_091_HAGALAZ_SUPERHELIX_INTERLINGUA_V01.md`, lines 1–340. Read the 8-DOF rung-locked ᚼ state, discrete recursion, continuous path form, helix lift, and UI readout relation.

## Source facts retained

- Old UI kinematics contains the clean map `y(λ)=r(λ)R(λ)x0`, with `R in SO(4)`.
- Current ᚼ candidate uses a framed-sphere state `S_n=(c_n,r_n,F_n)` and rung-locked step `U=(μ,ξ,Q)`, `Q in SO(4)`.
- RUN 091 already derived
  `c_{n+1}=c_n+r_nF_nd`, `r_{n+1}=μr_n`, `F_{n+1}=F_nQ`,
  with `d=ξe_w`.
- Current material explicitly treats the similarity representation as candidate formalization, not canonical ᚼ.

## New sandbox construction: the similarity-spectrum grammar

Define the affine recursion matrix

```
A = μQ
```

in the local frame. Repeating one dimensionless ᚼ step gives

```
c_N = c_0 + r_0 F_0 Σ_{k=0}^{N-1} A^k d.
```

Whenever `I-A` is invertible,

```
c_N = c_0 + r_0 F_0 (I-A^N)(I-A)^{-1}d.       (1)
```

This is an exact closed-form replacement for iterating the recursive center update.

Because every `Q in SO(4)` has eigenvalues

```
e^(±iθ1), e^(±iθ2),
```

the eigenvalues controlling ᚼ recursion are simply

```
λ_j(A)=μ e^(±iθ1), μ e^(±iθ2).                 (2)
```

Thus the repeated-step morphology has a very small invariant control set:

```
(log μ, θ1, θ2, projected rung d).
```

The six local SO(4) generator channels remain useful for constructing the step, but the two principal rotation angles plus scale control the conjugacy-class growth/rotation of the finite recursion.

## Immediate phase diagram

Equation (1) gives a sharp three-way discriminator.

### Contractive recursion: μ < 1

`A^N -> 0`, so

```
c_infinity = c_0 + r_0 F_0 (I-μQ)^(-1)d.
```

Repeated higher-order lifts converge to a finite accumulation geometry.

### Neutral recursion: μ = 1

Pure rotation. The partial sum is bounded on rotating subspaces unless `Q` has eigenvalue +1 with a nonzero component of `d` in that eigenspace. In that exceptional channel, center displacement grows linearly.

So the neutral case naturally separates **closed/quasiperiodic coiling** from **screw drift**.

### Expansive recursion: μ > 1

Generic components grow as `μ^N`. The same recursive rule generates a self-similar expanding superstructure rather than a bounded coil hierarchy.

This is a clean H(s)H mechanical distinction generated without historical target constants.

## UI ↔ ᚼ equivalence map

The old UI zero-translation trajectory

```
y(λ)=r(λ)R(λ)x0
```

is exactly the homogeneous/no-translation sector of the continuous similarity flow

```
y(s)=exp(as) exp(sΩ) x0,
a = d(log r)/ds,
Ω in so(4).
```

Therefore the old UI need not compete with ᚼ. In this sandbox it is the `v=0` / zero-center-translation slice of the same similarity generator.

This yields a compact transformation grammar:

```
SAT map state      -> (r,R,x0)
H(s)H local state  -> (c,r,F)
ᚼ generator        -> (v,a,Ω)
finite ᚼ           -> (d,μ,Q)
recursive class    -> spectrum(μQ)
observable/readout -> projection or UI recentering
```

The proposed conceptual upgrade is that H(s)H mechanics can ask not merely "what is the next superhelix?" but "what spectral class of recursive similarity does this local constitutive step occupy?"

## Calculation performed

A scripted test used a generic skew `Ω in so(4)`, `Q=exp Ω`, local rung `d=e_w`, and 90 repeated steps for `μ={0.97,1.00,1.03}`.

The iterative endpoint agreed with equation (1) to:

- μ=0.97: residual 1.45e-15
- μ=1.00: residual 8.71e-15
- μ=1.03: residual 1.68e-13

The expansive branch reached `|c_90|≈33.31`; the contractive and neutral examples remained O(1).

Visual generated in the task runtime: `meridian_hagalaz_similarity_phase.png`.

## Failure condition

This grammar fails as a *single-step autonomous recursion* if the constitutive mechanics requires `μ_n`, `Q_n`, or `d_n` to depend materially on order/history/strain. Then there is no single matrix `A`; the correct object is an ordered product

```
A_{N:0}=A_{N-1}...A_1A_0
```

and spectral classification must use cocycle/Lyapunov machinery rather than equation (2).

A second failure condition is physical: if no defensible map exists from finite-worldtube state to `(μ,Q,d)`, this remains a kinematic encoding only.

## Next tight solver test

Take one explicit finite-core worldtube deformation and extract adjacent framed cross-sections `S_n`. Fit the best relative similarity `(μ_n,Q_n,d_n)` at each step. Test:

1. whether `μ_n,Q_n,d_n` are approximately stationary over a controlled segment;
2. whether equation (1) predicts later cross-sections from the first fitted step;
3. whether deviations correlate with curvature, strain, or contact/tangency observables.

**Discriminator:** if a one-step ᚼ law predicts held-out geometry substantially better than a generic local polynomial extrapolator with comparable degrees of freedom, recursive similarity is doing real compression rather than decorative reparameterization.

## Sandbox conjecture

A promising division of labor is:

- **SAT:** supplies the 4D map and admissible geometry.
- **H(s)H:** supplies finite-core constitutive mechanics that determines the local generator `(v,a,Ω)`.
- **ᚼ:** integrates that generator into finite recursive transforms.
- **spectrum(μQ):** classifies whether the resulting hierarchy contracts, closes/drifts, or expands.

Nothing here is promoted to physical claim.
