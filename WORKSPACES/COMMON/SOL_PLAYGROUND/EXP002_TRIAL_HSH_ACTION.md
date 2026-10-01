# EXP002 — From Finite Readout Geometry to a Trial H(s)H Action

**Status:** sandbox derivation / trial action; not current theory  
**Date:** 2026-10-01  
**Owner:** GPT-5.6 Sol

## 0. Provenance warning before doing any math

I initially used `WORKSPACES/WORLDTUBE_LAB/FINITE_CORE_TANGENCY_PACKET_002.md` as a useful source of geometry. During this pass I checked its direct dependency, `FINITE_CORE_CROSS_SECTION_PACKET_001.md`, and found that Packet 001 is explicitly **QUARANTINED (2026-09-13)** because Nathan halted that integration lane after identifying a category failure in its assessment process.

Therefore:

- Packet 001 does **not** control this derivation.
- Packet 002 is treated as historically suggestive, not authoritative, because it directly depends on Packet 001.
- The core transverse/tangency formulas used below are rederived independently from local tube/surface geometry.

The independent tangency integral reproduces the coefficient `8*pi*sqrt(2)/5`; this is a mathematical check, not rehabilitation of the quarantined lane.

---

## 1. Source skeletons actually used

### SOURCE A — old SAT fundamental geometry

`Satobloc/SAT_THEORY_ARCHIVE_2023-25/DEV CONVERSATION/FUNDAMENTAL INTUITIONS.txt`

Inherited conceptual skeleton:

1. extended 4D particle history / filament;
2. resolving time surface;
3. observed particle = intersection/readout;
4. real interaction between extended object and resolving surface;
5. backreaction of filament network on resolving surface;
6. particle properties sought in intersection geometry.

### SOURCE B — old SAT stripped master Lagrangian

`Satobloc/SAT_THEORY_ARCHIVE_2023-25/_AUTO_EXTRACTED_TEXT/SAT Tester.txt`

Historical stripped equation:

`L_SAT = sum_i sum_o [ 1/2 mu_i |d lambda/dH|^2 + sum_j kappa F_braid + alpha (d lambda/dH · T)^2 + V_geom(lambda) ]`.

I do **not** import the numerical benchmark constants or the document's claims of successful locking. I use only the structural division:

- propagation/geometric kinetic term;
- braid/topology term;
- tangent/time-flow coupling;
- geometric potential.

### SOURCE C — H(s)H operator normalization handoff

`WORKSPACES/WORLDTUBE_LAB/OPERATOR_NORMALIZATION_HANDOFF.md`

Useful constraints:

- use common length coordinates, `w=ct`;
- normalize before heavy formalization;
- finite-core definition of `ᚼ` remains open;
- `ᚼᚼ` is intended as a coupled angle–expansion state, not a square;
- write canonical behavior once and expose only departures;
- old/new Lagrangians should be compared after the same normalization.

---

## 2. Minimal finite-core object

### INVENTION, using standard framed-curve / Cosserat geometry

Let the center-history be

`gamma : I -> R^4`,

parameterized by arclength `s`, with

`T = d gamma/ds`, `|T|=1`.

Choose an orthonormal normal frame

`E_a(s)`, `a=1,2,3`,

with `E_a · T = 0`.

Represent a genuine finite core by a positive-definite cross-sectional support tensor `Q(s)` and embedding

`X(s,y) = gamma(s) + E_a(s) y^a`,

with ellipsoidal fiber

`K_s = { y : y^T Q(s)^(-1) y <= 1 }`.

For an isotropic core,

`Q = r^2 I_3`.

The normal-frame connection is

`Omega_ab = E_a · dE_b/ds = -Omega_ba`.

The curvature components are

`kappa_a = E_a · dT/ds`,

so

`|kappa|^2 = sum_a kappa_a^2`.

A frame-covariant cross-section derivative can be written schematically as

`D_s Q = Q' + [Omega,Q]`.

This vanishes for pure frame rotation of a physically unchanged isotropic core.

---

## 3. Resolving surface as a field, not a fixed cartoon sheet

### INVENTION + IMPORT (phase-field regularization)

Introduce a scalar resolving field `phi(x)` on the ambient 4D construction space.

Its transition layer `phi≈0` is the finite-thickness resolving surface. A standard phase-field block is

`L_phi = sigma_phi [ (xi/2) (partial_A phi)(partial^A phi) + (1/xi) W(phi) ]`,

with a double-well example

`W(phi) = (phi^2 - 1)^2 / 4`.

Here `xi` is interface thickness.

This is an external mathematical import, not an inherited SAT mechanism. It is useful because:

- the resolving surface has finite thickness automatically;
- the surface can deform and backreact;
- the thin-interface limit is controlled;
- no literal delta-function interaction is required at finite `xi`.

Define a smooth readout kernel `f_xi(phi)` peaked near `phi=0`.

Then the tube/surface overlap functional is

`O_i[phi,X_i,Q_i] = int ds int_{K_i(s)} d^3y J_i(s,y) f_xi(phi(X_i(s,y)))`.

In the thin-interface limit, choose normalization so

`f_xi(phi) -> delta(phi) |grad phi|`,

which makes the readout geometric under reparameterizations of the level-set field.

This one functional is the key move: **finite readout is computed from actual overlap rather than inserted as an angle formula.**

---

## 4. Independent local readout derivation

Use signed-distance coordinates near a contact point so the resolving surface is locally

`Phi=0`, `|grad Phi|=1`.

For an isotropic radius-`r` core, let `z` be the normal fiber coordinate along the surface normal. Near the center-history contact,

`Phi(X) = z + alpha s + (1/2) A s^2 + higher order`,

where

`alpha = n · T`

and

`A = d^2/ds^2 Phi(gamma(s)) |_(0)`.

The thin-surface readout of a full `B^3_r` core is

`O = int ds int_{u1^2+u2^2+z^2 <= r^2} du1 du2 dz delta(z + alpha s + A s^2/2)`.

After integrating over `z`,

`O = pi int_D ds [ r^2 - (alpha s + A s^2/2)^2 ]`,

where `D` is the set for which

`|alpha s + A s^2/2| <= r`.

### 4.1 Transverse limit

If `|alpha| >> sqrt(|A| r)`, the quadratic term is negligible over the contact region.

Then

`O_tr = V(B^3_r)/|alpha|`

so

`O_tr = (4 pi/3) r^3 / |alpha|`.

This reproduces the secant/Jacobian behavior directly from the delta integral.

### 4.2 Exact quadratic tangency

At `alpha=0`, intersection exists for

`|s| <= sqrt(2r/|A|)`.

Therefore

`O_tan = int_{-sqrt(2r/|A|)}^{+sqrt(2r/|A|)} pi [r^2 - A^2 s^4/4] ds`

and hence

`O_tan = (8 pi sqrt(2)/5) r^(5/2) / sqrt(|A|)`.

This coefficient was independently checked symbolically.

### 4.3 Universal crossover function

Set

`x = s sqrt(|A|/r)`

and

`Lambda = alpha / sqrt(|A| r)`.

Let `sigma_A = sign(A)`.

Then

`O(r,alpha,A) = pi r^(5/2) |A|^(-1/2) F(Lambda,sigma_A)`

with

`F(Lambda,sigma_A) = int_{D_Lambda} [1 - (Lambda x + sigma_A x^2/2)^2] dx`,

`D_Lambda = {x : |Lambda x + sigma_A x^2/2| <= 1}`.

Forced asymptotes:

`F(0,±1) = 8 sqrt(2)/5`,

and

`F(Lambda) ~ 4/(3 |Lambda|)` for `|Lambda| -> infinity`.

So the transverse and tangency formulas are not rival laws. They are asymptotic sectors of one finite-core overlap function.

**Observation:** the natural dimensionless control parameter is not an arbitrary threshold constant. It is

`Lambda^2 = alpha^2 / (|A| r)`.

---

## 5. Cross-sectional anisotropy and readable orientation

For ellipsoidal `Q`, the support radius along the projected resolving normal `n_N` is

`rho_n = sqrt(n_N^T Q n_N)`.

If `Q=r^2 I`, `rho_n=r` and local normal-frame rotation is gauge.

If `Q` is anisotropic, the relative orientation between `Q` and the readout normal changes `rho_n`; rotation becomes relationally observable.

Define normalized shape

`S = Q/tr(Q) - I/3`.

Then candidate frame-invariant shape diagnostics include

`I2 = tr(S^2)`,

`I3 = det(S)`,

and a readout-relative anisotropy

`zeta = n_N^T S n_N`.

The new point here is not the invariants themselves but their placement in the action: anisotropy affects readout by changing the support function entering `O`.

---

## 6. A concrete trial realization of ᚼᚼ

### INVENTION — explicitly provisional

For the normal-frame angular velocity, use the axial vector dual to `Omega_ab` in the three-dimensional normal fiber:

`omega^a = (1/2) epsilon^{abc} Omega_bc`.

Let `c^a` be a material/chirality director when such a director is actually present.

Define a selected rotation rate

`omega_H = c · omega`.

For the cross-sectional expansion rate define

`e = (1/6) d/ds ln det(Q)`.

For isotropic `Q=r^2 I`,

`e = r'/r`.

Now define a candidate coupled angle–expansion residual

`h_H = omega_H - q_H e`.

Interpretation:

- `h_H=0`: canonical coupled rotation–expansion relation;
- `h_H != 0`: departure from canonical ᚼᚼ behavior.

The corresponding minimal penalty is

`L_H = (K_H/2) h_H^2`.

`q_H` is **not** to be target-fit. It must either be fixed by the eventual geometric definition of the canonical ᚼ relation or removed. It is left symbolic here so the algebra can expose what would have to be derived.

---

## 7. Trial H(s)H action

### INVENTION, structurally descended from the SAT stripped Lagrangian

Use a geometric block action

`S_trial = S_phi + sum_i S_tube,i + S_top`.

### 7.1 Resolving-field block

`S_phi = int d^4x sigma_phi [ (xi/2) partial_A phi partial^A phi + W(phi)/xi ]`.

### 7.2 Tube block

For each finite worldtube:

`S_tube,i = int ds L_i`

with

`L_i =`

`  (B_i/2) |kappa_i|^2`

`+ (C_i/4) Omega_i:Omega_i`

`+ (K_Q,i/8) tr[ (Q_i^(-1) D_s Q_i)^2 ]`

`+ V_Q(Q_i)`

`+ (K_H,i/2) h_H,i^2`

`+ g_R,i int_{K_i(s)} d^3y J_i f_xi(phi(X_i))`

`+ V_self,i`.

### 7.3 Topology / intertube block

`S_top = sum_{i<j} kappa_ij B_ij[gamma_i,E_i,Q_i; gamma_j,E_j,Q_j]`.

`B_ij` is intentionally typed but unresolved here. It is the slot corresponding to the old SAT braid/interbraid term. It should become a genuine holonomy/link/reconnection functional, not a decorative `F_braid` symbol.

### Compact display

`L_HsH^trial = L_bend + L_twist + L_core-strain + V_core + L_H + L_readout + L_self + L_top + L_phi`.

This is an **effective geometric trial action**, not yet a claimed fundamental Lorentzian field theory.

---

## 8. Direct map from the stripped SAT action

Historical SAT block:

`1/2 mu |d lambda/dH|^2`

-> trial H(s)H:

`(B/2)|kappa|^2 + (C/4)Omega:Omega + (K_Q/8)tr[(Q^-1 DQ)^2]`.

Interpretation: the single ideal-filament geometric-motion term is decomposed into finite-core bending, twist, and shape strain.

Historical SAT block:

`kappa F_braid`

-> trial H(s)H:

`S_top = sum kappa_ij B_ij`.

Historical SAT block:

`alpha (d lambda/dH · T)^2`

-> trial H(s)H:

1. an eventual canonical incidence/alignment term if independently needed;
2. more importantly, the finite overlap coupling `L_readout` to a deformable resolving field.

Historical SAT block:

`V_geom(lambda)`

-> trial H(s)H:

`V_Q + L_H + V_self`, with explicit finite-core degrees of freedom.

**Observation:** finite-core H(s)H does not need to throw away the SAT skeleton. It can unpack each ideal-filament term into typed geometric substructure.

---

## 9. Euler–Lagrange equations: resolving-field backreaction

Vary `phi`.

For the phase-field block,

`delta S_phi / delta phi = sigma_phi [ -xi Box phi + W'(phi)/xi ]`.

The tube overlap contributes a source localized on tube material:

`J_R(x) = sum_i g_R,i int ds int_{K_i} d^3y J_i f_xi'(phi(X_i)) delta^4(x-X_i)`.

Therefore the resolving field obeys the trial equation

`-sigma_phi xi Box phi + sigma_phi W'(phi)/xi + J_R = 0`.

This is the cleanest current realization of the old SAT requirement that the extended filament/tube structure **backreact on the resolving surface**.

It is also the bridge to my workspace/readout experiment: what is read changes the next readout geometry because the readout carrier sources `phi`.

---

## 10. Euler–Lagrange equations: reduced isotropic core

Take

`Q=r^2 I`

and one material rotation coordinate `theta` with

`omega_H = theta'`.

Then

`h_H = theta' - q_H r'/r`.

Use the reduced local Lagrangian

`L_red = (K_r/2) r'^2 + (K_H/2) h_H^2 + V(r) + g_R O(r,alpha,A) + V_top(theta,...)`.

### 10.1 Radius equation

Because

`partial L/partial r' = K_r r' - K_H q_H h_H/r`,

and

`partial L/partial r = K_H q_H h_H r'/r^2 + V'(r) + g_R partial_r O`,

the Euler–Lagrange equation simplifies to

`K_r r'' - (K_H q_H/r) h_H' - V'(r) - g_R partial_r O = 0`.

The apparent extra `h_H r'/r^2` terms cancel exactly.

### 10.2 Rotation equation

If `theta` enters only through `h_H` and anisotropic/topological/readout potentials,

`K_H h_H' - partial_theta[ V_aniso + g_R O + V_top ] = 0`.

If the system is isotropic and uncoupled so the bracket has no `theta` dependence,

`h_H' = 0`.

**Observation:** in this trial realization, the angle–expansion mismatch is a conserved quantity when no relational torque acts on it. Readout anisotropy, topology, or material marking are precisely what can make it evolve.

This gives a concrete mathematical meaning to the earlier methodological claim that rotation of an isotropic full core is gauge until a relational structure makes it observable.

---

## 11. Explicit readout forces in the two asymptotic regimes

### 11.1 Transverse regime

`O_tr = (4 pi/3) r^3 / |alpha|`.

Thus

`partial_r O_tr = 4 pi r^2 / |alpha|`,

and

`partial_alpha O_tr = -(4 pi/3) r^3 sign(alpha)/alpha^2`.

A readout-coupled tube therefore experiences a strong incidence torque as it approaches tangency, but the divergence is an artifact of using the transverse asymptote outside its regime.

### 11.2 Tangency regime

`O_tan = C_t r^(5/2) |A|^(-1/2)`,

with

`C_t = 8 pi sqrt(2)/5`.

Then

`partial_r O_tan = 4 pi sqrt(2) r^(3/2) |A|^(-1/2)`,

and

`partial_A O_tan = -(4 pi sqrt(2)/5) r^(5/2) sign(A) |A|^(-3/2)`.

The finite core converts the false `1/|alpha|` singularity into finite curvature-controlled response.

---

## 12. The workspace/readout connection, now in equation form

My earlier playground abstraction was

`extended state W + resolving surface Sigma -> readable section R`.

The trial action upgrades that from metaphor to a specific variational mechanism:

1. finite carrier geometry `X,Q` determines overlap with `phi`;
2. overlap determines a readout measure `O`;
3. the same overlap sources the `phi` equation;
4. therefore readout changes future readout geometry.

Minimal recursion:

`(X_k,Q_k,phi_k) -> O_k -> phi_(k+1) -> O_(k+1)`.

Nothing here proves a cognition model. It does produce an explicit **backreactive accessibility mechanism** with a finite-core crossover parameter

`Lambda = alpha/sqrt(|A|r)`.

That is the current mathematical core of my J-space/readout connection.

---

## 13. Strong observations from the derivation

### Observation 1 — readout crossover is a scaling function, not a magic angle

The finite-core crossover is governed by a dimensionless ratio `Lambda`; no fixed legacy projection angle is required.

### Observation 2 — tangency is not a pathology

The centerline/secant model makes tangency look singular. A finite core makes it a distinct regular scaling regime.

### Observation 3 — support type matters observably

Bulk, boundary, and rank-restricted carriers have different intersection dimensions and scaling exponents. A future H(s)H Lagrangian should therefore specify what actually carries action: bulk, boundary, material director field, or layered combination.

### Observation 4 — isotropic local rotation is gauge

A full isotropic core cannot make normal-frame rotation locally observable by itself. A material director, anisotropy, boundary marking, topology/holonomy, or external relational structure is needed.

### Observation 5 — a plausible ᚼᚼ term is a mismatch penalty

The simplest typed realization is not “angle plus expansion” as two free numbers. It is a residual such as

`h_H = omega_H - q_H e`,

with only the departure penalized or propagated.

### Observation 6 — old SAT backreaction can be made variational

Promoting the resolving sheet to a finite-thickness field produces an actual field equation sourced by tube overlap. This is much stronger than saying “the filament pulls on time.”

### Observation 7 — the finite-core action naturally separates ontology from readout

`X,Q` describe the carrier; `phi` describes the resolving mechanism; `O` describes their relation. One does not have to identify the readout with the carrier.

---

## 14. What is still missing before this deserves to be called a serious H(s)H Lagrangian

1. Decide construction metric/signature and whether/where the effective Lorentzian metric enters.
2. Derive the actual finite-core type: bulk `B^3`, boundary `S^2`, rank-two support, or layered object.
3. Derive the canonical ᚼ relation instead of leaving `q_H` symbolic.
4. Replace `B_ij` with an actual braid/holonomy/reconnection functional.
5. Specify intertube forces and self-contact/reconnection rules.
6. Check reparameterization invariance carefully.
7. Normalize dimensions and coefficients against one common action scale without fitting legacy numbers.
8. Recover the centerline SAT limit by `r->0` with internal modes frozen/scaled explicitly.
9. Test whether the phase-field resolver is useful or an unnecessary import; the thin-level-set version should remain as a control.
10. Compare this action against at least one older SAT/H(s)H Lagrangian term by term after normalization.

---

## 15. Immediate solver targets

1. Numerically evaluate the universal crossover function `F(Lambda)`.
2. Fit no constants: verify only the forced asymptotes `F(0)=8sqrt(2)/5` and `F~4/(3|Lambda|)`.
3. Replace isotropic `r` with ellipsoidal `Q` and compute readout torque versus orientation.
4. Integrate the reduced `(r,theta)` Euler–Lagrange system with and without anisotropic torque.
5. Couple one tube to a 1D phase-field analog and test hysteresis / recursive readout.
6. Add a second tube and test whether a genuine intertube/topological term can be made local or must remain global/nonlocal.

---

## 16. Current compact trial equation

If forced to hand another theorist one line, it is this:

`S_trial = int d^4x L_phi[phi] + sum_i int ds { (B/2)kappa^2 + (C/4)Omega:Omega + (K_Q/8)tr[(Q^-1 D_sQ)^2] + V_Q(Q) + (K_H/2)(omega_H-q_H e)^2 + g_R int_{K_i} d^3y J f_xi(phi(X)) } + sum_{i<j} kappa_ij B_ij`.

Everything interesting now has somewhere typed to live:

- finite core;
- rotation;
- expansion;
- readout;
- backreaction;
- topology;
- deformation;
- centerline limit.

The unresolved blocks are visible instead of hidden inside a single metaphorical coefficient.
