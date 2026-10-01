# Playground 002 — Sim(4) recursion, exact carrier singularity, and readout separation

**Author lane:** Nadir Voss  
**Date:** 2026-10-01  
**Status:** PLAYGROUND / SANDBOX — new assistant-generated mathematics built from Nathan's supplied reconstruction plus standard geometry. Not theory authority.

## 0. Executive result

Nathan's proposed reorganization is substantially cleaner than the old overloaded helix/phase machinery. Three parts can be sharpened immediately into exact mathematics:

1. `ᚼ = (T,Q,D)` is naturally an element of the orientation-preserving similarity group `Sim^+(4)`, so `ᚼᚼ` has a canonical noncommutative composition law rather than an invented recursive rule.
2. The equal-3-sphere carrier collapse in four ambient dimensions gives an exact Jacobian singular-value law. Near the `d = sqrt(3) R` collapse, the smallest singular value scales exactly as `sqrt(chi)`.
3. The covariance/second-moment diagnostic can be separated into a scale-free shape sector `(I2,I3)` plus an eigenframe-degeneracy discriminant. This gives a second transition diagnostic that should not be conflated with the constraint-Jacobian detector.

A fourth point is also clean: `g = delta - 2 u^flat \otimes u^flat` is a pointwise involutive Lorentzian readout metric, but it is a restricted ansatz. That is a feature if the aim is to derive effective readout from one distinguished flow field rather than to assume arbitrary GR geometry.

---

## 1. Promote `ᚼ = (T,Q,D)` to an actual group element

Take a state-space point `x in R^4`. Let

- `t in R^4` be translation/transport;
- `Q in SO(4)` be orientation-preserving rotation;
- `D = exp(sigma) > 0` be isotropic dilation.

Define

`H_(t,Q,sigma)(x) = t + exp(sigma) Q x`.

This is an element of the orientation-preserving similarity group

`Sim^+(4) = R^4 rtimes (SO(4) x R_+)`.

The composition law follows directly:

`(t2,Q2,sigma2) o (t1,Q1,sigma1)`

`= ( t2 + exp(sigma2) Q2 t1,  Q2 Q1,  sigma2 + sigma1 )`.

The inverse is

`(t,Q,sigma)^(-1)`

`= ( -exp(-sigma) Q^(-1) t,  Q^(-1),  -sigma )`.

This immediately repairs the old `mu=1` obstruction.

### Ordinary helical propagation

Set

`sigma = 0`.

Then `H` lies in the Euclidean-motion subgroup

`SE(4) = R^4 rtimes SO(4)`.

A fixed-radius screw/helical transport therefore does not need to pretend that its translation parameter is also a scale parameter.

### Genuine recursive scaling

Permit

`sigma != 0`.

Then the same grammar extends to similarity recursion without changing the meaning of rotation or transport.

So the proposed decomposition is not merely convenient notation. It is already a standard Lie group with a canonical multiplication rule.

### Where noncommutativity actually comes from

- `SO(4)` rotations generally do not commute.
- rotation and translation do not commute under the semidirect product;
- dilation commutes with pure rotation but rescales translation, so it also participates nontrivially in full composition.

Thus

`H2 H1 != H1 H2`

in general, without manually attaching a braid rule.

The Lie algebra is

`sim(4) = R^4 rtimes (so(4) oplus R)`.

This is a natural candidate transformation grammar for ᚼ/ᚼᚼ.

---

## 2. The finite worldtube should be the state, not the centerline

Nathan's supplied state can be written as

`X(s,xi) = gamma(s) + sum_a xi^a e_a(s)`

with `xi in K_s subset N_s gamma`.

A useful explicit state record is therefore

`W(s) = (gamma(s), K_s, E(s))`,

where `E(s)` is a framed basis/director field for the core.

Then a similarity element acts on the whole framed core:

`gamma -> t + exp(sigma) Q gamma`

`K -> exp(sigma) Q K`

`E -> Q E`.

This separates three things that older scalar/phase constructions often blurred:

- where the core is;
- what shape/scale the core has;
- how the core is oriented/framed.

A material/internal phase can then be an additional state only if the model independently requires it. It no longer has to masquerade as frame gauge.

---

## 3. Covariance repaired as a shape observer

For a finite cross-section with density `rho(xi)`, define

`Q_ab = int_K rho(xi) xi_a xi_b d^3 xi`.

Normalize out scale:

`S = Q / tr(Q) - I/3`.

Then `S` is symmetric and traceless.

Let its eigenvalues be `s1,s2,s3`, with

`s1+s2+s3 = 0`.

Define

`I2 = tr(S^2)`

`I3 = tr(S^3)`.

For a traceless `3 x 3` matrix the characteristic polynomial is

`lambda^3 - (I2/2) lambda - I3/3 = 0`.

Therefore `(I2,I3)` determine the unordered eigenvalue spectrum of `S`; the eigenvectors separately carry orientation.

So the old covariance/eigenframe machinery acquires a precise, limited job:

- `(I2,I3)` = scale-free shape spectrum;
- eigenframe = core orientation;
- `tr(Q)` = absolute second-moment scale.

It no longer generates dynamics.

### Shape-degeneracy discriminant

The cubic discriminant is

`Delta_shape = I2^3/2 - 3 I3^2`.

For a real symmetric `S`, `Delta_shape >= 0`.

`Delta_shape = 0`

when two or more eigenvalues coincide.

That is a useful **shape-symmetry/eigenframe degeneracy detector**. It is not the same thing as a topological or constraint singularity.

This gives H(s)H two diagnostics with different jobs:

- `Delta_shape` for symmetry/eigenframe degeneracy;
- `sigma_min(J)` for loss of regularity in the defining constraints.

---

## 4. Exact equal-3-sphere carrier calculation

### Ambient-dimension caveat

The claimed `S^1` common carrier is correct when the three equal spheres are **3-spheres in R^4** (or equivalently three codimension-one sphere constraints in four ambient coordinates).

In ordinary `R^3`, three generic sphere surfaces intersect in isolated points, not a circle. The ambient dimension is therefore essential and should be explicit in all future statements of the result.

### Geometry

Place three centers in a 2-plane as an equilateral triangle of side `d`. Its circumradius is

`a = d/sqrt(3)`.

The common locus of points equidistant from all three centers lies in the 2-dimensional plane orthogonal to the center triangle through its circumcenter.

Imposing radius `R` leaves a circle of radius

`r^2 = R^2 - a^2`

so

`r_carrier^2 = R^2 - d^2/3`.

Define

`chi = 1 - d^2/(3R^2)`.

Then

`r_carrier = R sqrt(chi)`.

Thus

- `chi > 0`: common `S^1` carrier;
- `chi = 0`: carrier collapses to one point;
- `chi < 0`: no real common intersection.

---

## 5. Exact Jacobian singular values

Let the three constraints be

`F_i(X) = ||X-c_i||^2 - R^2 = 0`, `i=1,2,3`,

with `X in R^4`.

The Jacobian rows are

`J_i = 2 (X-c_i)^T`.

Choose coordinates with the equilateral circumcenter at the origin and a carrier point

`X = (0,0,r,0)`.

A direct symbolic calculation gives eigenvalues of `J J^T`:

`6 a^2, 6 a^2, 12 r^2`.

Using `a=d/sqrt(3)`, the singular values are therefore

`sqrt(2) d, sqrt(2) d, 2 sqrt(3) r`.

Hence

`boxed: sigma_min(J) = min( sqrt(2)d, 2 sqrt(3) sqrt(R^2-d^2/3) )`.

Near the carrier-collapse endpoint `d -> sqrt(3) R`, the second branch is the minimum, so

`boxed: sigma_min(J) = 2 sqrt(3) R sqrt(chi)``

as `chi -> 0+`.

This is stronger than the qualitative claim `sigma_min -> 0`: the prototype transition has a square-root critical law.

### Important second degeneracy

At `d -> 0`, all three centers coincide and `sigma_min(J)` also goes to zero, but for a completely different reason: the three constraints become redundant.

Therefore

`small sigma_min(J)` means **loss of regularity / constraint independence**, not automatically “topology change.”

A transition classifier must inspect branch structure, solution dimension, and constraint ancestry to distinguish:

- redundant-constraint degeneracy;
- tangency;
- carrier collapse;
- branch merger/splitting;
- birth/death of real solutions.

This caveat makes the Jacobian method substantially safer.

---

## 6. General transition detector: strengthen the proposal

For

`F(X;lambda)=0`,

with Jacobian

`J_X = partial F / partial X`,

track at least:

1. `sigma_min(J_X)` — local regularity / rank margin;
2. solution-manifold dimension estimate `dim ker J_X`;
3. determinant or singular values of continuation Jacobians when solving for parameterized branches;
4. branch count / connected-component count where numerically accessible;
5. `Delta_shape` if the finite core has a covariance/eigenframe description.

A genuine structural event is then classified by a signature rather than one scalar threshold.

For example, the equal-3-sphere collapse has:

- `r_carrier -> 0`;
- `sigma_min(J) -> 0`;
- `S^1 -> point -> empty` across the parameter;
- no appeal to any particle label or fitted physical constant.

That is an excellent prototype regression test for a general H(s)H transition finder.

---

## 7. Readout metric as an involution

Let `delta` be the all-plus construction metric and `u` a `delta`-unit field:

`delta(u,u)=1`.

Define

`g = delta - 2 u^flat tensor u^flat`.

Relative to a `delta`-orthonormal basis, the associated matrix is

`G = I - 2 u u^T`.

This is a Householder involution:

`G^2 = I`.

Its eigenvalues are

`-1` along `u`, and `+1` on `u^perp`.

Therefore

`signature(g)=(-,+,+,+)`

and

`det G = -1`.

If `u` is constant, this is simply flat Minkowski signature written relative to the preferred direction.

If `u=u(x)` varies, then `g(x)` is still pointwise Lorentzian but its Levi-Civita connection and curvature can become nontrivial.

This supports the operational reading:

- `delta` = construction geometry;
- `g` = resolver/readout geometry.

But there is an important strength/limitation: `g=delta-2uu` is a **restricted rank-one ansatz**, not an arbitrary Lorentzian metric. The programme should exploit that restriction rather than quietly claiming it reproduces generic GR before checking which metrics/curvatures it can represent.

---

## 8. Instantaneous intersection versus accumulated readout

For a worldtube image `X(W)` and foliation

`Sigma_t = {x : T(x)=t}`,

define the instantaneous readout

`O_t = X(W) cap Sigma_t`.

Define accumulated readout over an interval as

`A_[t0,t1] = union_{t in [t0,t1]} O_t`,

or, when multiplicity/order matters, use the incidence set

`I_[t0,t1] = {(t,x): x in O_t}`.

The incidence-set version is preferable computationally because a plain union forgets temporal ordering and repeated visits.

This distinction can indeed rescue old “point -> line”, “ring -> shell”, etc. language if those were actually statements about accumulated resolving history rather than instantaneous section dimension.

The test is straightforward: recover the old source and retype each statement as either

- instantaneous section topology;
- accumulated incidence/readout topology;
- or genuinely changing source geometry.

Do not harmonize them without checking.

---

## 9. Holonomy and discrete classes

Let `nabla` be the explicitly chosen transport connection on the framed worldtube state, and let `C` be a closed loop.

The monodromy is

`M_C = P exp int_C A`.

For an internal state in representation `rho`, closure can be posed as

`rho(M_C) psi = exp(i theta) psi`.

Equivalently, allowed phases satisfy

`det(rho(M_C) - exp(i theta) I)=0`.

This is more general and cleaner than immediately imposing the scalar condition

`oint k ds = 2 pi n`.

### Spin lift

If the relevant frame holonomy lies in `SO(4)`, spinorial transport uses a lift to

`Spin(4) ~= SU(2)_L x SU(2)_R`.

That supplies a mathematically native pair of chiral sectors. It also dovetails with the earlier self-dual / anti-self-dual decomposition of 2-forms, but no physical identification with SM chirality is assumed here.

The candidate hierarchy is therefore:

`finite worldtube geometry`

`-> chosen/induced frame connection`

`-> holonomy / monodromy`

`-> representation spectrum / closure classes`

`-> discrete state candidates`

`-> only then particle/field identification, if earned`.

---

## 10. A sharpened candidate spine

A more explicit version of Nathan's proposed stack is:

`W=(gamma,K,E)`

`--H in Sim^+(4)--> recursive framed worldtube`

`--nabla--> group-valued transport / holonomy`

`--rho(M) spectrum--> closure classes`

`--cap Sigma_t--> instantaneous readout O_t`

`--incidence accumulation--> observed history A_[t0,t1]`.

Parallel diagnostics:

### Shape channel

`tr Q`, `S`, `I2`, `I3`, `Delta_shape`.

### Structural channel

`singular spectrum of J_X`, branch dimension, branch count/topology.

### Readout-geometry channel

`u`, `g=delta-2uu`, induced readout connection/curvature.

These channels should remain separate until a constitutive law explicitly couples them.

---

## 11. Why this is better than the old machine

The cleaned assignments are now:

- **helix / centerline:** kinematic carrier skeleton;
- **finite core:** physical geometric candidate;
- **covariance tensor:** shape observer;
- **eigenframe:** orientation diagnostic;
- **ᚼ:** element/action of `Sim^+(4)`;
- **ᚼᚼ:** actual group composition, retaining commutators;
- **timesheet / foliation:** resolver geometry;
- **`g=delta-2uu`:** effective readout-signature ansatz;
- **Jacobian singular spectrum:** constraint-regularity/transition detector;
- **holonomy / monodromy:** closure and potential discreteness machinery;
- **particle labels / old numerical constants:** excluded until independently produced by the machinery.

That division of labor is mathematically much healthier.

---

## 12. Next calculations

### A. Build the `Sim^+(4)` ᚼ harness

Represent `H=(t,Q,sigma)` as a homogeneous `5 x 5` matrix

`[[exp(sigma)Q, t], [0,1]]`.

Test:

- composition;
- inversion;
- commutators;
- fixed-radius subgroup `sigma=0`;
- recursively scaled paths `sigma != 0`;
- invariants under conjugation.

### B. Turn the sphere transition into a regression fixture

Sweep `d/R` from `0` to above `sqrt(3)` and compute:

- common carrier radius;
- `sigma_min(J)`;
- rank;
- branch topology.

Verify the exact critical scaling

`sigma_min ~ 2 sqrt(3) R sqrt(chi)`

near the collapse.

### C. Couple shape and structural diagnostics without conflating them

Deform finite cores through families that:

1. become axisymmetric (`Delta_shape -> 0`) without changing topology;
2. undergo actual constraint singularities (`sigma_min(J) -> 0`) without necessarily becoming shape-degenerate;
3. do both simultaneously.

This gives the future solver a clean classification test.

### D. Readout accumulation test

Use a simple finite tube and moving foliation to construct both

`O_t`

and

`I_[t0,t1]`.

Check explicitly which historical SAT “dimension growth” effects are instantaneous and which are accumulated-readout artifacts.

### E. Do not reintroduce old constants

No `3/(4 pi)`, `0.2387`, `0.246`, proton/electron ratio, He-3 label, or other historical target enters any of these tests.

If a dimensionless invariant later approaches one of them across independently specified geometry, log that as an output and only then investigate provenance/meaning.
