# Playground 003 — A Cartan/Sim(4) backbone for H(s)H

**Author lane:** Nadir Voss  
**Date:** 2026-10-01  
**Status:** PLAYGROUND / SANDBOX — assistant-generated reconstruction under Nathan's explicit instruction to assume SAT is correct as baseline and push the mathematics hard. Not theory authority.

## 0. Main result

The most coherent mathematical reformation found so far is to treat H(s)H as a finite-core realization of a `Sim^+(4)` Cartan/Weyl-type geometry.

The old SAT name then acquires a concrete geometric decomposition:

- **Scalar** -> local dilation / Weyl component;
- **Angular** -> `SO(4)` rotational connection;
- **Torsion** -> translational Cartan torsion of the framed finite-core geometry.

This is not claimed as recovered historical SAT notation. It is a new mathematical reorganization that appears to make the old name operational.

The second strong result is that generic double rotation in 4D naturally closes translations that a 3D screw leaves open. This gives a clean route from hyperhelical 4D geometry to discrete closure classes without target-fitting particle labels or old constants.

---

## 1. The 4D framed-worldtube state

Let the finite H(s)H object be represented by

`W = (gamma, K, E)`

where

- `gamma(s) in R^4` is a carrier/centerline history;
- `K_s` is a finite three-dimensional transverse core;
- `E(s)` is an oriented orthonormal frame/director field.

A local similarity transformation is

`H = (t,Q,sigma) in Sim^+(4)`

acting as

`x -> t + exp(sigma) Q x`.

The homogeneous representation is

`G = [[exp(sigma) Q, t], [0,1]]`.

For a path-ordered family `G(s)`, define the left Maurer-Cartan strain

`Xi = G^(-1) G'`.

This decomposes into

`Xi = (v, Omega, q)`

with

`v = exp(-sigma) Q^T t'`,

`Omega = Q^T Q' in so(4)`,

`q = sigma'`.

This gives three mathematically distinct local strain channels:

- translational/coframe strain `v`;
- angular strain `Omega`;
- scalar dilation strain `q`.

Already this is cleaner than making one helix pitch or one Q-factor stand for all three.

---

## 2. Cartan-field reinterpretation

Promote the path language to a local 4D differential-form description.

Take

- coframe `e^a`;
- rotational connection `omega^a_b in so(4)`;
- dilation/Weyl one-form `b`.

Then define

`T^a = d e^a + omega^a_b ^ e^b + b ^ e^a`

as translational torsion,

`R^a_b = d omega^a_b + omega^a_c ^ omega^c_b`

as rotational curvature,

and

`F_D = d b`

as dilation curvature.

This supplies a literal three-part field-strength decomposition:

`SAT -> (F_D, R, T)`.

Again: this is a new H(s)H repair, not a claim that historical SAT used Cartan torsion in exactly this technical sense.

### Why this is attractive

The three sectors are not independent decorations. They couple through the structure equations. For example, even before a Lagrangian is chosen, the Bianchi identities link them schematically:

`D R = 0`

and

`D T ~ R ^ e + F_D ^ e`.

So scalar, angular, and torsional behavior are geometrically cross-coupled by construction rather than by bridge factors inserted afterward.

---

## 3. Trial H(s)H construction action

Use the all-plus construction metric `delta` for the sandbox action and its Hodge star `*_delta`.

The smallest quadratic gauge/elastic trial action is

`S_construct = int_W L_construct`

with

`L_construct =`

`(alpha_R/2) R^{ab} ^ *_delta R_{ab}`

`+ (alpha_T/2) T^a ^ *_delta T_a`

`+ (alpha_D/2) F_D ^ *_delta F_D`

`+ L_core(S,I2,I3,trQ)`

`+ L_constraints`.

A minimal core-shape potential could be written abstractly as

`V_core = V(I2,I3,trQ,sigma)`

without assigning particle labels or old numerical constants.

The important point is structural:

- angular curvature costs energy;
- torsional failure-to-close costs energy;
- dilation gradients cost energy;
- finite-core shape has its own constitutive energy.

No old `0.2387`, `0.246`, proton/electron ratio, or manually inserted holonomy bridge is needed to write the action.

### Schematic field equations

Varying `omega` gives a Yang-Mills/Cartan-style equation of the form

`D *_delta R + (torsion-source terms) = 0`.

Varying `e` gives

`D *_delta T + (curvature/core-stress terms) = 0`.

Varying `b` gives

`d *_delta F_D + (dilation-torsion current) = 0`.

The exact coefficients depend on the chosen constitutive sector, but the crucial qualitative result is already fixed: the three SAT sectors source one another geometrically.

---

## 4. Readout metric and the role of c

Let `u` be the distinguished `delta`-unit resolving direction and define

`g = delta - 2 u^flat tensor u^flat`.

Choose coordinates adapted to `u`, with

`u = partial_w`.

Then

`delta = dw^2 + dx^2 + dy^2 + dz^2`

while

`g = -dw^2 + dx^2 + dy^2 + dz^2`.

Now set

`w = c t`.

Then

`ds_g^2 = -c^2 dt^2 + dx^2 + dy^2 + dz^2`.

This gives `c` a cleaner role than the old fixed-speed helix constraint:

> `c` is the conversion/propagation scale relating the preferred resolving coordinate `w` to observed time `t`, not a speed budget that must be imposed on every microscopic helix.

That directly repairs the circularity of assuming `|gamma'|=c` and later claiming the helix explains the role of `c`.

---

## 5. The Ravel helix plus readout metric reproduces the SR proper-time factor

Take the current all-plus helix parameterized by resolving coordinate `w`:

`gamma(w) = (w, R cos(w/h), R sin(w/h), 0)`.

Its construction tangent satisfies

`tan(theta_4) = R/h`.

Under the readout metric `g`,

`ds_g^2 = -dw^2 + (R^2/h^2) dw^2`

so

`ds_g^2 = -dw^2 [1 - tan^2(theta_4)]`.

With `w=ct`, define the 3D readout speed

`v = c tan(theta_4)`.

Then

`d tau = dt sqrt(1 - v^2/c^2)`

for `v<c`.

Thus the standard special-relativistic proper-time factor follows exactly from:

1. all-plus construction geometry;
2. the preferred readout direction;
3. the rank-one metric involution;
4. the existing helix/readout relation.

This is one of the strongest pieces of mathematical support found so far for the H(s)H reformulation.

### Important terminology repair

The project-native `theta_4=0` “null/vacuum-aligned” condition is **not metric-null** under `g`.

At `theta_4=0`, `v=0` and the readout trajectory is timelike.

Metric-null occurs when

`v=c`

or equivalently

`tan(theta_4)=1`,

so

`theta_4 = pi/4`.

Therefore H(s)H should distinguish:

- **interaction-null / vacuum-aligned**: `theta_4=0`;
- **metric-null / lightlike readout**: `theta_4=pi/4` in this simple kernel.

That is a repair, not a rejection of the old terminology.

---

## 6. A natural relativistic particle action emerges at coarse readout

If the finite core carries a rest energy `E_0` determined by its internal geometric/elastic state, define

`M = E_0/c^2`.

Then the coarse readout action is

`S_eff = -M c^2 int d tau`.

Using the result above,

`L_eff = -M c^2 sqrt(1-v^2/c^2)`.

Therefore

`p = partial L_eff / partial v = gamma_v M v`

and

`E = gamma_v M c^2`.

This does not derive the numerical value of mass. It shows that once the finite-core geometry supplies a rest-energy functional, standard SR kinematics follows from the readout map without imposing a material `c`-speed constraint on the underlying helix.

---

## 7. 4D double rotation gives closure that 3D screw motion lacks

This may be the most important purely geometric calculation in this pass.

Take a constant `SO(4)` generator in canonical form

`Omega = omega_1 J_12 + omega_2 J_34`.

Because the two plane rotations commute,

`Q(s) = exp(s Omega)`

is a generic double rotation.

Let `v` be a constant body-frame translation. The corresponding Euclidean-motion trajectory has translation

`t(L) = int_0^L exp(s Omega) v ds`.

If `Omega` is invertible, i.e.

`omega_1 omega_2 != 0`,

then

`t(L) = Omega^(-1) [exp(L Omega)-I] v`.

Hence if

`exp(L Omega)=I`,

we automatically get

`t(L)=0`.

The closure condition is simply

`omega_1 L = 2 pi m`

`omega_2 L = 2 pi n`

for integers `m,n`.

Therefore

`omega_1 / omega_2 = m/n`.

So a generic 4D double rotation supports exact closed translated motion whenever the two rotation frequencies are commensurate.

### Contrast with an ordinary 3D screw

A single 3D rotation generator always has a fixed axis, hence a kernel direction. Translation along that invariant axis survives every full turn and produces an open screw.

A generic 4D double rotation has no fixed axis if both frequencies are nonzero. The translational contribution can therefore average to zero over a common period.

This makes 4D hyperhelical closure structurally less artificial than 3D helical closure.

---

## 8. Discrete closure classes without particle fitting

The double-rotation result naturally labels closed sectors by an integer pair

`(m,n) in Z^2`.

Equivalently, one can use the winding ratio

`omega_1/omega_2 = m/n`.

This produces discrete topological/kinematic classes before any identification with electrons, quarks, generations, or old SAT labels.

The `SO(4)` holonomy over the closed loop has eigenvalues

`exp(+- i omega_1 L)`

and

`exp(+- i omega_2 L)`.

At exact closure they return to unity in the vector representation.

But the spin lift remembers half-angle structure.

---

## 9. Spin(4) and a clean route to fermionic sign

Use

`Spin(4) ~= SU(2)_L x SU(2)_R`.

A `2 pi` rotation in one `SO(4)` plane lifts to `-1` in the corresponding spin representation, while a `4 pi` rotation lifts to `+1`.

Therefore a closed vector-frame loop can still carry nontrivial spinorial monodromy.

This supplies a mathematically legitimate route to a fermionic sign from worldtube/frame holonomy.

It does **not** by itself derive the Pauli exclusion principle. Exclusion additionally requires the many-body antisymmetric state-space structure. But H(s)H would at least possess the correct spinorial sign mechanism without assigning it by hand.

---

## 10. Chirality splitting becomes native

In oriented Euclidean four-space,

`so(4) ~= su(2)_+ oplus su(2)_-`.

Equivalently, rotational curvature decomposes into self-dual and anti-self-dual pieces

`R = R_+ + R_-`.

Define

`E_even = ||R_+||^2 + ||R_-||^2`

and

`E_chiral = ||R_+||^2 - ||R_-||^2`.

A chirality-balanced configuration can satisfy

`E_chiral=0`

while retaining

`E_even>0`.

This gives a precise mathematical interpretation of “chirality cancellation without loss of geometry.”

A future constitutive model can test whether one observed sector couples to the odd/chiral combination and another to the even combination. No EM=GR identification is asserted yet, but the required algebra now exists.

---

## 11. ᚼ recursion as group transport rather than scalar recursion

Let each recursive level carry

`H_k = (t_k,Q_k,sigma_k) in Sim^+(4)`.

Then

`G_N = H_N H_(N-1) ... H_1 G_0`.

This automatically retains:

- noncommuting rotations;
- rotation-translation semidirect effects;
- dilation-translation coupling;
- path/order dependence.

The continuum limit is a `sim(4)` connection.

This is a much better interpretation of ᚼ and ᚼᚼ than a single overloaded screw or scalar geometric series.

### Relation to the old rotated geometric series

The old expression

`sum mu^k Q^k a`

is recovered as a highly restricted special case in which every recursion level uses the same commuting similarity element and one repeatedly acts on the same vector.

So the old formula is not discarded. It becomes the Abelianized/frozen-generator limit of the richer group product.

That is exactly the sort of relationship a successful H(s)H reformation should have to SAT.

---

## 12. A candidate H(s)H trial Lagrangian in 1D reduced form

For a reduced framed-worldtube centerline description, use the Maurer-Cartan strains

`v = exp(-sigma) Q^T gamma'`,

`Omega = Q^T Q'`,

`q = sigma'`.

Decompose

`Omega = Omega_+ + Omega_-`.

A minimal reduced Lagrangian is

`L_HsH =`

`(mu/2) ||v||^2`

`- (A/2) (||Omega_+||^2 + ||Omega_-||^2)`

`- (C/2) q^2`

`- V_shape(I2,I3,trQ_core)`

`- V_close(M_C)`

`- V_constraints`.

A chirality-sensitive constitutive term can be added without particle labels, for example

`- eta (||Omega_+||^2 - ||Omega_-||^2)`

or a parity-even square

`- lambda_chi (||Omega_+||^2 - ||Omega_-||^2)^2`.

The latter allows the model to distinguish balanced from chiral states while keeping the action parity-even.

### Holonomy closure term

Rather than forcing an old phase constant, define

`V_close = Lambda_H^2 d_G(M_C, C_allowed)^2`

where

- `M_C` is monodromy around a closed worldtube cycle;
- `C_allowed` is an allowed conjugacy class or representation eigenphase set;
- `d_G` is a group/geodesic distance.

Then discreteness is associated with the spectrum of allowed monodromy classes, not with a manually selected number.

---

## 13. Candidate full spine

The current best sandbox backbone is

`finite core W=(gamma,K,E)`

`-> Sim^+(4) recursion / ᚼ`

`-> Cartan data (e, omega, b)`

`-> field strengths (T, R, F_D)`

`-> worldtube holonomy / monodromy`

`-> Spin(4) / representation closure classes`

`-> foliation intersection O_t`

`-> accumulated incidence history I_[t0,t1]`

`-> effective readout metric g=delta-2uu`

`-> coarse Lorentzian observables`.

Parallel diagnostics remain separate:

- shape: `S, I2, I3, Delta_shape`;
- structural transitions: singular spectrum of the constraint Jacobian;
- topology/closure: monodromy and branch structure.

---

## 14. What old SAT pieces are now repaired rather than discarded

### Helix

Retained as carrier geometry.

### Rotated geometric series

Retained as a frozen/commuting limit of full `Sim^+(4)` recursion.

### Covariance/eigenframe

Retained as a shape/orientation diagnostic.

### Holonomy

Promoted from scalar phase rhetoric to actual group-valued transport/monodromy.

### Torsion

Reinterpreted as a precise Cartan geometric object candidate.

### Scalar sector

Reinterpreted as dilation/Weyl strain rather than an arbitrary scalar bridge.

### Timesheet

Retained as foliation/readout, with explicit distinction between instantaneous intersection and accumulated incidence history.

### Quantization

Reintroduced only as representation/monodromy closure classes.

### Old numerical constants

Not used.

---

## 15. Strongest provisional conclusions

1. **There is a mathematically coherent H(s)H backbone that can inherit much of SAT without inheriting its old scalar overfitting.**
2. **`Sim^+(4)` is a natural transformation group for ᚼ because it cleanly separates transport, rotation, and scale.**
3. **Cartan/Weyl structure gives a precise new meaning to Scalar-Angular-Torsion as coupled field strengths.**
4. **The readout metric plus the existing helix kernel reproduces the exact SR proper-time factor without treating `c` as a microscopic helix speed budget.**
5. **Generic 4D double rotation closes translated motion under rational frequency ratios, giving natural discrete closure classes.**
6. **Spin(4) then supplies nontrivial spinorial monodromy even when vector-frame closure is exact.**
7. **The old rotated geometric series survives as a restricted limit rather than needing to be thrown away.**

These are mathematical support for the reformation, not physical validation of SAT/H(s)H.
