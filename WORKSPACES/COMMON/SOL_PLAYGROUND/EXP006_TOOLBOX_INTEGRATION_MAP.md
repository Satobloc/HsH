# EXP006 — Toolbox Integration Map for the H(s)H Reformation

**Date:** 2026-10-02  
**Status:** sandbox integration map  
**Purpose:** identify which machinery from the archived H(s)H toolkit actually strengthens the current mathematical kernel.

## 1. Immediate-use machinery

### A. Calculus of variations for framed curves

This directly belongs in the current action.

We already use:

[
X(s,	au),qquad Q(s,	au)in SO(4),
]

with

[
Omega_s=Q^{-1}Q_s,qquad Omega_	au=Q^{-1}Q_	au.
]

The natural next upgrade is to treat the frame variationally on the group, using

[
delta Q = Qeta,qquad eta(s,	au)inmathfrak{so}(4).
]

Then

[
deltaOmega_s = partial_seta + [Omega_s,eta]
=:D_seta,
]

and similarly

[
deltaOmega_	au=D_	aueta.
]

For a frame action of the form

[
S_Q=int ds,d	au,
left[
rac I2|Omega_	au|^2
-rac C2|Omega_s-Omega_*|^2
-rac D2|D_sOmega_s|^2
ight],
]

the Euler–Poincare equation is schematically

[
oxed{
I D_	auOmega_	au
-
C D_s(Omega_s-Omega_*)
+
D D_s^3Omega_s
=
	au_{m ext}
}
]

where (	au_{m ext}) collects core, medium, topology, and readout torques.

This is much better than linearizing immediately in six scalar angles because the commutators survive.

### B. Symplectic geometry

The toolkit's old phrase “pair bending momentum with torsional holonomy” is too loose, but the symplectic idea is genuinely useful.

Treat the reduced closed-mode variables

[
q=(m,n),qquad p=rac{partial L}{partial dot q}
]

or, in the continuous frame system, canonical variables ((Q,Pi)) on (T^*SO(4)).

The canonical one-form is

[
Theta=langle Pi,Q^{-1}dQangle,
]

and the symplectic form is

[
omega=-dTheta.
]

This gives a legitimate phase-space home for:

- frame rotation;
- conjugate angular momentum;
- holonomy transport;
- Hamiltonian reduction;
- constraints.

For the closed-sector lattice found in EXP005, symplectic reduction may tell us whether the integer closure sectors are distinct reduced phase-space components or merely coordinate artifacts.

### C. Medium response kernels

This is perhaps the most immediately valuable tool for Electrogravity.

Let a medium field (u_A(x)) couple to the worldtube source (J^A(x)):

[
S_{m med}
=
rac12int d^4x,u_Amathcal D^{AB}u_B
+
gint d^4x,J^Au_A.
]

The medium equation is

[
mathcal D^{AB}u_B=-gJ^A.
]

Formally,

[
u_A(x)
=
-gint d^4x',
G_{AB}(x,x')J^B(x'),
]

where

[
mathcal D^{AC}G_{CB}(x,x')=delta^A{}_Bdelta^{(4)}(x-x').
]

Substituting back gives

[
oxed{
S_{m eff}^{m med}
=
-rac{g^2}{2}
int d^4x,d^4x',
J^A(x)G_{AB}(x,x')J^B(x').
}
]

This is a concrete candidate mathematical form for a long-range filament-medium interaction.

It also directly realizes the kind of nonlocal kernel that appeared in EXP004 when hidden modes were integrated out.

Thus “Electrogravity” can be reformulated as:

[
oxed{
	ext{worldtube source}
	o
	ext{medium propagator}
	o
	ext{effective nonlocal interaction}.
}
]

That is much stronger than naming a force.

### D. BV push-forward, but only as an upgrade to EXP004

The archived toolkit called BV a “lossless translation engine.” Later project audits correctly reject that as automatic.

The useful reading is:

[
	ext{microscopic fields}
	o
	ext{effective action on retained fields}
]

with the BV push-forward used only if the gauge/symplectic/BV data are actually specified.

EXP004 already did ordinary Gaussian elimination:

[
S[gamma,q]
	o
S_{m eff}[gamma].
]

BV would be the correct generalization when:

- gauge redundancy matters;
- ghosts/antifields are required;
- the eliminated sector is not just Gaussian;
- topological observables must be tracked under coarse-graining.

So BV is not step 1. It is the mathematically proper future version of the coarse-graining calculation once the field content is mature.

## 2. Useful but second-stage

### E. 1D AKSZ sigma models

Potential use:

A framed worldline/worldtube history naturally looks like a map

[
X:T[1]Sigma_1	omathcal M
]

into a graded symplectic target.

This could package:

- worldline configuration;
- gauge connection;
- holonomy;
- topological observables;

inside one action.

But this should come only after the ordinary geometric action is stable enough to identify the target graded manifold and Hamiltonian function.

Otherwise AKSZ becomes notation without content.

### F. Cobordism / TQFT language

Potentially useful for transition classes between closed H(s)H states.

If one closed solution class (C_i) can reconnect into another (C_j), then a history between them can be viewed as a cobordism.

This may become useful for classifying reconnection events and selection rules.

It is not needed yet for local dynamics.

### G. Fractional Hardy inequalities

Potentially useful if Interbraid generates singular pair/triple interactions like

[
V(r)sim -rac{g}{r^alpha}.
]

Then Hardy-type inequalities can determine whether the energy is bounded below and whether collapse occurs.

This would be extremely useful for a genuine 3-body Borromean candidate, but only after the actual intertube potential is derived.

### H. Discrete-gradient / invariant-preserving numerics

This is practical and near-term.

Our closed-frame/holonomy simulations should preserve:

[
|T|=1,
qquad
Q^TQ=I,
qquad
det Q=1,
]

and ideally discrete energy or momentum invariants.

A structure-preserving integrator is preferable to generic Runge–Kutta if we want to distinguish real drift from numerical drift.

## 3. Machinery I would not promote yet

### Links-Gould polynomials as mass rules

Useful as knot/link invariants, possibly for labeling topological sectors.

Not justified as direct energy or mass formulas without a derived energy functional connecting the invariant to the Hamiltonian.

### (Z_3) fusion as a particle rule

Could emerge later if a genuine threefold symmetry appears.

Do not impose it now.

### Graph Laplacian eigenvalue 1 as a phase-snap threshold

No current derivation.

Keep out of the core.

### Ensemble co-metric inverse as Lorentzian metric

The archive itself identifies the problem:

[
C^{AB}=langle v^Av^Bangle
]

is positive semidefinite, so inversion alone cannot create a Lorentzian minus sign.

The covariance can still encode material/spatial compliance, but the causal signature must come from a clock/readout/principal-symbol mechanism or a separate induced metric construction.

### Yamabe / Hessian machinery

Potentially useful only after a conformal metric PDE actually appears.

Not yet.

## 4. The strongest immediate insertion into the trial action

Upgrade the current H(s)H action to

[
S
=
S_{m carrier}
+
S_{m frame}
+
S_{m core}
+
S_{m med}
+
S_{m int}
+
S_{m readout}.
]

Use

[
S_{m frame}
=
int ds,d	au
left[
rac I2|Omega_	au|^2
-
rac C2|Omega_s-Omega_*|^2
-
rac D2|D_sOmega_s|^2
ight],
]

and

[
S_{m med}
=
rac12int d^4x,umathcal Du
+
gint d^4x,Jcdot u.
]

Integrating out (u) yields

[
oxed{
S_{m eff}^{m medium}
=
-rac{g^2}{2}
int JGJ.
}
]

That gives us a clean candidate for Electrogravity.

Interbraid can then remain direct finite-core interaction:

[
S_{m int}
=
-rac12sum_{i
eq j}
int ds,ds',
V_{m core}
ig(
X_i(s)-X_j(s'),
Q_i,Q_j,K_i,K_j
ig).
]

This produces a principled separation:

[
oxed{
	ext{Electrogravity}
=
	ext{medium-mediated}
}
]

versus

[
oxed{
	ext{Interbraid}
=
	ext{direct worldtube-worldtube}.
}
]

That is exactly the distinction the current verbal theory wants.

## 5. A first medium-mediated dispersion law

Take a scalar toy medium

[
mathcal L_{m med}
=
rac{ho}{2}u_	au^2
-
rac{K}{2}|
abla u|^2
-
rac{M^2}{2}u^2
+
gJu.
]

Then

[
(hopartial_	au^2-K
abla^2+M^2)u=gJ.
]

Fourier space gives

[
u(omega,k)
=
rac{gJ(omega,k)}
{-hoomega^2+Kk^2+M^2}.
]

Hence

[
oxed{
G(omega,k)
=
rac{1}
{-hoomega^2+Kk^2+M^2}.
}
]

For (M=0), the medium supports propagation speed

[
oxed{
c_{m med}^2=rac{K}{ho}.
}
]

This creates a concrete path for asking whether a preferred propagation speed can emerge from medium elasticity rather than be inserted directly.

Again, no physical identification is claimed yet.

## 6. Immediate synthesis with EXP005

The closure sector labels ((m,n)) from EXP005 can couple to the medium through mode-dependent source form factors

[
J_{m,n}(k)
=
int ds,e^{-ikcdot X_{m,n}(s)},mathcal J(s).
]

Then the medium self-energy of a closed sector is

[
oxed{
Delta E_{m,n}
=
-rac{g^2}{2}
intrac{d^4k}{(2pi)^4}
,
J_{m,n}^*(k)
G(k)
J_{m,n}(k).
}
]

This is interesting because the medium can stabilize or destabilize different closure sectors differently.

That gives us a concrete mechanism that could potentially solve the two-plane-collapse problem from EXP005 without inserting an ad hoc stabilizer.

## 7. Best next move

The next serious calculation should be:

1. choose a simple medium operator (mathcal D);
2. compute (J_{m,n}(k)) for the closed double-rotation carrier;
3. evaluate the medium self-energy;
4. minimize with respect to the plane-weight parameter (a^2);
5. test whether an interior minimum (0<a^2<1) appears.

If it does, medium response would provide a derived stabilization mechanism for genuinely 4D two-plane states.

If it does not, that is equally useful.

---

## Open-instance challenge

Take one of the toolkit formalisms that I have **not** promoted, and earn it.

You must show an explicit map

[
	ext{H(s)H variable}
	o
	ext{mathematical structure}
	o
	ext{term in the action}
	o
	ext{derived equation or invariant}.
]

No vocabulary-only import.

Best targets:

- AKSZ;
- fractional Hardy;
- cobordism;
- Links-Gould;
- discrete-gradient numerics.

### Sharper knife

Try to stabilize the EXP005 double-rotation state using **only** a medium response kernel.

Start with

[
Delta E_{m,n}[a]
=
-rac{g^2}{2}
int
J_{m,n}^*(k;a)
G(k)
J_{m,n}(k;a)
,dk.
]

Find whether there exists a physically sensible (G) such that

[
rac{partial E}{partial a}=0,
qquad
rac{partial^2E}{partial a^2}>0
]

for

[
0<a^2<1.
]

If yes, the medium itself can prevent single-plane collapse.

If no, the stabilizer must come from topology, core anisotropy, or another sector.
