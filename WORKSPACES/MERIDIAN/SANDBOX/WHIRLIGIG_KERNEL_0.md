# Meridian Sandbox — Whirligig Kernel 0

**Status:** NEW CONSTRUCTIVE WORK / SANDBOX ONLY  
**Date:** 2026-09-20  
**Purpose:** Build and falsify the smallest information-preserving Whirligig kernel before applying it to SAT/H(s)H or the historical GR↔QM target.

## 1. Contract

The historical intent is treated as a problem specification, not as a constraint on repairs.

A useful Whirligig kernel must provide:

1. an explicit encoder;
2. an admissible geometric state space in which required source information cannot silently disappear;
3. a geometric composition/deformation operator;
4. an explicit decoder or readout;
5. stated invariants/equivalence relations;
6. reproducible round-trip and adversarial tests;
7. a failure/intervention budget.

No isomorphism/equivalence claim is credited without explicit maps and composition tests.

## 2. Minimal exact information-preserving composite

For two phase-bearing planar inputs define

H1(s) = (a cos θ1(s), a sin θ1(s), 0, 0)

H2(s) = (0, 0, b cos θ2(s), b sin θ2(s))

and

C(s) = H1(s) + H2(s).

Let P12 and P34 be orthogonal projections onto the first and second coordinate 2-planes.

Then exactly:

P12 C = H1
P34 C = H2.

Therefore the composite is lossless for the two encoded parameterized curves.

Also

||C||² = a² + b².

For constant a,b the entire admissible family lies exactly on S³ of radius ρ = sqrt(a²+b²). A soft embedding penalty is unnecessary for this restricted kernel.

Important: this does NOT establish a general equation-to-curve encoder. It establishes a reversible composition after the two inputs have been encoded in this restricted class.

## 3. Parameterization is information

For constant-frequency phases θi = ωi s + φi,

P12 C'' = -ω1² P12 C
P34 C'' = -ω2² P34 C.

Together with first-derivative orientation, the parameterized composite recovers frequency magnitude and winding direction for this oscillator class.

An unparameterized geometric trace does not in general retain absolute ω under arbitrary reparameterization. Therefore a lossless state must retain the parameter/clock (or an equivalent channel), plus orientation where required.

## 4. Reduced bending functional

For variable phases and fixed radii,

||C''||² =
a²[(θ1'')² + (θ1')⁴] +
b²[(θ2'')² + (θ2')⁴].

Thus define the first repaired reduced functional

J[θ1,θ2] = ∫ ds {
  κ/2 * [a²((θ1'')²+(θ1')⁴) + b²((θ2'')²+(θ2')⁴)]
  + γ[1-cos(θ1-θ2)]
}.

The relative-phase term is intentionally used instead of a Euclidean C-H overlap penalty. The latter penalizes a correct orthogonal composite.

## 5. Euler–Lagrange equations

Because L depends on second derivatives, use

∂L/∂θ - d/ds(∂L/∂θ') + d²/ds²(∂L/∂θ'') = 0.

This yields

κ a² [θ1'''' - 6(θ1')² θ1''] + γ sin(θ1-θ2) = 0

κ b² [θ2'''' - 6(θ2')² θ2''] - γ sin(θ1-θ2) = 0.

The coupling enters with equal and opposite signs.

## 6. Exact symmetry checksum

The functional is invariant under common phase translation

θ1 -> θ1 + α
θ2 -> θ2 + α.

The associated generalized Noether momentum for this second-derivative Lagrangian is

P = κ[
  2a²(θ1')³ - a² θ1'''
  + 2b²(θ2')³ - b² θ2'''
].

Along an exact extremal, dP/ds = 0.

This gives the first internal numerical checksum for a Whirligig solve.

## 7. Immediate historical repair result

The near-primary Deep Dive functional used a soft S³ penalty plus a Euclidean coupling/overlap term. In this restricted information-preserving family:

- S³ membership is exact by construction;
- orthogonal projection gives exact decoding;
- naive Euclidean overlap is the wrong objective for preserving two orthogonal inputs;
- bending minimization alone does not make a nontrivial encoded orbit stationary.

Therefore the first repair principle is:

> optimize only inside an explicitly information-preserving admissible family, and couple decoded relations/invariants rather than forcing the encoded components to occupy the same coordinates.

This is a local constructive replacement, not a historical claim.

## 8. Graticule bridge

For constant frequencies, tangent magnitudes in the two planes are a|ω1| and b|ω2|. Define the unsigned tangent-contribution angle

tan β = b|ω2| / (a|ω1|).

Keep signs of ω1 and ω2 separately for CW/CCW orientation.

The winding ratio ω2/ω1:
- rational -> closed torus orbit;
- irrational -> non-closing/dense torus winding.

This supplies a candidate Graticule readout using only existing torus/angle data. It does not by itself establish a chirality flip.

## 9. Hagalaz consequence

Any Hagalaz transport intended to be lossless for this kernel must retain enough information to recover:
- both projected components or equivalent state;
- relative phase;
- orientation/winding sign where relevant;
- parameter/clock information or a declared gauge-equivalent substitute.

Bare relative similarity data are insufficient if those channels are absent.

## 10. Benchmark ladder

W0 — exact algebraic round trip for two harmonic planar encodings.
W1 — numerical integration of the coupled fourth-order phase equations; verify P conservation and projection decoding.
W2 — reparameterization adversary: same geometric trace, altered clock; measure which outputs change.
W3 — representation adversary: common SO(4) rotation with frame carried vs discarded.
W4 — allow variable radii while enforcing exact S³ constraint; test decoder conditioning.
W5 — define an equation/state encoder for a restricted, known differential-equation family and test source recovery.
W6 — derivational-path experiment between two known related equations with the answer withheld from the optimizer.
W7 — only after W0–W6: historical GR↔QM target.

## 11. Current falsification questions

- Does phase coupling generate useful relational structure or merely synchronize phases?
- Is bending energy actually correlated with derivational simplicity on known equation families?
- Which equivalence class of parameterizations should count as the same encoding?
- Can the decoder remain well-conditioned under admissible deformations?
- What extra state must Hagalaz carry for exact round trips?
- Does Graticule add diagnostic information rather than merely re-labeling torus coordinates?
- Can Three Spheres supply transition operations/bifurcations useful to the search rather than decorative geometry?

Negative answers are acceptable outcomes.

## 12. W1 numerical boundary-value test — PASS at toy level

Parameters: a=b=κ=1, γ=0.2, s∈[0,2π], θ1:0→2π, θ2:0→4π, with θ1''=θ2''=0 at both endpoints.

A numerical fourth-order boundary-value solve converged.

Results:
- uncoupled linear-seed objective: 54.6637121724624
- coupled-extremal objective: 54.6522245593226
- reduction: 0.0114876131398
- max |θ1-s|: 0.0285673982 rad
- max |θ2-2s|: 0.00799657863 rad
- generalized phase momentum P: 18.0028317793926 to 18.0028317815109
- P peak-to-peak numerical drift: 2.1183e-9.

Interpretation: the reduced kernel supports a nontrivial coupled deformation while preserving imposed winding endpoints, and the independently derived symmetry checksum is conserved to numerical precision. This is not yet evidence that bending energy tracks algebraic derivational simplicity.

## 13. W2 reparameterization adversary — FAIL for current score, yielding a repair

Take the same geometric torus trace with θ1=u, θ2=2u and reparameterize by u(s)=s+0.2 sin s. This is monotone and has u(0)=0, u(2π)=2π, so the geometric image and total windings are unchanged.

Current parameter-dependent bending score:
- linear parameter: 53.4070751110
- reparameterized: 60.1621276348
- difference: 6.75505252375.

Therefore the current bending score is not representation invariant under a clock change.

### Required repair

Separate:
1. carrier/decoder parameter information, retained because source recovery may depend on it;
2. intrinsic geometric complexity, scored independently of arbitrary reparameterization.

Candidate geometric score:

B_geo = ∫ ||dT/dℓ||² dℓ.

For C(u)=(cos u,sin u,cos 2u,sin 2u),

B_geo = (17/25) sqrt(5) * 2π ≈ 9.55374803422,

independent of monotone reparameterization covering the same oriented trace once.

Clock/parameter complexity, if physically or algebraically meaningful, should be retained and optionally scored as a separate channel rather than contaminating geometric equivalence.

Design fork:
- if λ is gauge/representation, quotient it from geometric score;
- if λ is physical/algebraic information, retain it in decoding but prevent arbitrary clock choice from gaming geometric path ranking.

## 14. Revised immediate frontier

1. implement intrinsic B_geo;
2. verify numerical invariance under multiple monotone reparameterizations;
3. define carrier-clock channel and equivalence relation;
4. rerun W1 with geometric score and clock information separated;
5. then test SO(4) representation changes and restricted equation encoders.

This is a constructive repair discovered by adversarial testing, not historical machinery.

## 15. W3 common-SO(4) representation adversary — PASS with frame, FAIL without it

Let Q∈SO(4), C_Q=QC, and transport each decoder projector covariantly:

P_i^(Q)=Q P_i Q^T.

Then

P_i^(Q) C_Q = Q H_i

exactly. Intrinsic bending is also unchanged because Q preserves Euclidean inner products.

If Q is discarded and the original fixed coordinate projectors are applied to QC, decoding generally fails.

Conclusion: the kernel does not require a unique absolute SO(4) lift. It requires either:
- a carried frame/projector channel, or
- an explicit gauge choice.

Geometric scoring should be gauge/representation invariant; decoding may use the auxiliary frame channel.

## 16. W5 pre-test exposes an encoder problem

For y''+ω²y=0, the normalized phase-plane solution (y,y'/ω) is a circle for every ω. Thus an intrinsic geometric score on that solution trace cannot distinguish the source equations; ω survives only in parameter/clock data.

Therefore an arbitrary equation -> solution curve -> normalized geometry pipeline is not sufficient for equation comparison.

### New encoder requirement

The solver should geometrize the differential equation/operator itself, not merely decorate a selected solution.

For a scalar n-th-order ODE

F(x,y,y',...,y^(n))=0,

introduce derivative-state coordinates (x,y0,y1,...,yn), with yk representing the kth derivative. The equation is the geometric constraint surface

F(x,y0,...,yn)=0.

A lifted solution curve must also satisfy derivative consistency/contact conditions

dy0 - y1 dx = 0,
dy1 - y2 dx = 0,
...
dy_(n-1) - yn dx = 0.

This supplies an exact, non-arbitrary geometric encoding of the equation plus its admissible solution directions.

For the harmonic oscillator,

F = y2 + ω² y0 = 0,

so different ω define genuinely different constraint surfaces even when normalized solution traces look geometrically identical.

This is NEW constructive machinery based on standard differential-geometric derivative-state reasoning; it is not attributed to historical UI/Whirligig.

### Consequence

The Whirligig architecture should distinguish at least three objects:

1. equation geometry — constraint surface/operator structure;
2. solution geometry — admissible integral curves;
3. representation channels — clock/frame/gauge data required for exact decoding.

The original UI equation->4D-curve ambition appears to have collapsed these layers. Separating them may close the encoder gap without arbitrary coefficient-to-shape decoration.

## 17. W6a equation-surface transformation benchmark — PASS

Benchmark family:

E(ω): y'' + ω² y = 0.

Derivative-state equation geometry:

F_ω = y2 + ω² y0 = 0,

with contact/derivative consistency dy0-y1 dx=0 and dy1-y2 dx=0.

Search transformation family:

X=a x, Y0=y0, Y1=y1/a, Y2=y2/a².

This preserves the contact conditions up to nonzero scalar factors and maps

F_ω1 -> Y2 + (ω1²/a²)Y0 = 0.

Matching target E(ω2) requires

a=ω1/ω2.

Numerical blind-to-optimum minimization of surface-coefficient mismatch recovered:
- ω1=1.7, ω2=3.2: a=0.531250000064 vs exact 0.53125; residual ~6.1e-18.
- additional positive rational/irrational frequency pairs recovered the analytic scale to numerical tolerance.

This is an explicit structure-preserving equation-to-equation map with an exact inverse.

## 18. W6b term-elimination / normal-form benchmark — PASS

Source family:

y'' + p y' + q y = 0.

Search point-transformation family:

U=e^(c x) y.

Induced derivative map:

U' = e^(cx)(y'+c y)
U'' = e^(cx)(y''+2c y'+c² y).

Substitution of the source equation leaves a first-derivative component proportional to 2c-p. Minimizing that component discovers

c=p/2,

and yields the canonical reduced equation

U'' + μ U = 0,

where

μ = q - p²/4.

Numerical searches recovered c=p/2 to machine precision for multiple p,q pairs, including irrational coefficients.

If μ≠0, a second discovered/known scale X=sqrt(|μ|)x reduces the family to three normal forms:

μ>0: U_XX + U = 0
μ=0: U_XX = 0
μ<0: U_XX - U = 0.

The inverse maps are explicit, so solution-space information is retained.

### Why this matters

This is the first constructive benchmark in which the solver philosophy does more than preserve or visualize an equation. A transformation search:
- removes a term;
- exposes the controlling reduced coefficient μ;
- collapses a two-parameter continuum into three canonical classes;
- preserves exact reverse mapping.

This is modest but real evidence that geometry/transformation search can reduce equation complexity on a controlled family.

It does NOT establish that the same strategy scales to nonlinear systems, PDEs, SAT/H(s)H, or the historical GR↔QM target.

## 19. Emerging solver architecture

The current constructive architecture is now:

equation/operator
-> derivative-state constraint geometry
-> admissible structure-preserving transformation family
-> invariant geometric/operator mismatch score
-> optimized transformation
-> canonical/intermediate equation geometry
-> decoded algebraic transformation/normal form
-> exact inverse / round-trip test.

Solution curves are a separate layer and may be used for boundary conditions, observables, or verification, but they are not allowed to stand in for the equation geometry itself.

Whirligig is therefore provisionally better interpreted as a transformation-search engine over equation geometries than as a machine that simply bends arbitrary 4D solution curves together.

Graticule can become a diagnostic coordinate/readout system over invariants and transformation state.

Hagalaz can become a representation-transport layer carrying intrinsic geometry plus required clock/frame/gauge channels.

Three Spheres remains a candidate transition/bifurcation operator family; no forced integration yet.

## 20. Experimental emphasis update — throughput over architecture ceremony

Nathan clarified the ultimate purpose: the machines are intended to make handling of (hyper[super])helical architecture more efficient. Do not spend the project indefinitely verifying architecture before exercising it. Run many equations early, including:
- positive controls with known useful transforms;
- negative/hostile controls expected not to simplify under the admitted machinery;
- genuine SAT/H(s)H-shaped targets.

Architecture checks remain instrumentation, not the research product. Surprises are desirable when reproducible.

### Expanded benchmark populations

**Positive controls**
- constant-coefficient linear ODEs (already passing);
- Euler-Cauchy: x²y''+a x y'+by=0, with t=ln x reducing it to constant coefficients;
- Riccati subclasses, e.g. y'=q(x)+y² with y=-u'/u giving u''+q(x)u=0;
- other equations with known point/contact/scaling reductions.

**Hostile/negative controls**
- nonlinear equations outside the current transformation library;
- equations with deliberately broken symmetry/inhomogeneous structure;
- cases where a proposed simplification loses source information;
- same geometry with incompatible clock/operator data;
- pendulum-type θ''+sin θ=0 as an early guard against spurious linearization.

**SAT/H(s)H-shaped targets**
- coupled oscillatory/helical systems;
- double rotations in orthogonal planes;
- variable radius/pitch carriers;
- exact S3-constrained 4D curves;
- relative-phase/twist couplings;
- nested/superhelical composition;
- holonomy-like frame transport;
- bifurcation/transition cases from Three Spheres;
- later, actual live SAT/H(s)H equations after the machinery has enough breadth to make the comparison informative.

## 21. Helical architecture moves to center of bench

For

C(s)=(a cos(ωs), a sin(ωs), b cos(νs), b sin(νs)),

constant speed squared is

v²=a²ω²+b²ν²,

and because C'·C''=0, intrinsic curvature satisfies

κ_C² = (a²ω⁴+b²ν⁴)/(a²ω²+b²ν²)².

Thus a substantial part of the double-rotation architecture is compressible into direct intrinsic invariants rather than repeated coordinate expansion.

Research question: can the machines exploit such invariants to compare, simplify, compose, or transform nested/helical descriptions more cheaply than direct coordinate/operator manipulation while retaining exact decoding?

This is now a primary benchmark question, not an eventual application.

## 22. H1 exact invariant decoder for the constant double rotation — PASS algebraically

This run asks the practical helical-throughput question directly: can the four coordinate functions of the basic 4D double rotation be compressed to a small invariant packet and then decoded without knowing the coordinate-plane presentation?

Let

C(s)=(a cos(ωs+φ), a sin(ωs+φ), b cos(νs+ψ), b sin(νs+ψ)).

Define four scalar derivative moments

m0 = ||C||²,
m1 = ||C'||²,
m2 = ||C''||²,
m3 = ||C'''||².

For constant a,b,ω,ν,

m_k = a²(ω²)^k + b²(ν²)^k,   k=0,1,2,3.

Set x=ω² and y=ν². The two-frequency moment sequence obeys

m_{k+2} = S m_{k+1} - P m_k,

where

S=x+y,
P=xy.

Provided

D = m0 m2 - m1² != 0,

we recover

S = (m0 m3 - m1 m2)/D,
P = (m1 m3 - m2²)/D.

Therefore x and y are the roots of

z² - S z + P = 0.

After choosing the unordered root pair {x,y}, the squared radii are recovered by

a² = (m1 - m0 y)/(x-y),
b² = (m0 x - m1)/(x-y),

up to interchange of the two helical planes. Frequencies are then |ω|=sqrt(x), |ν|=sqrt(y). Winding signs and phase origins are not contained in these four unsigned scalar moments and remain orientation/frame channels.

The determinant has a useful exact interpretation:

D = a² b² (x-y)² = a² b²(ω²-ν²)².

Thus decoder failure is not mysterious. D=0 exactly when one component has zero radius or the two squared frequencies coincide. In those cases the scalar invariant packet cannot distinguish a genuine two-mode carrier from a collapsed/degenerate one.

### Why this is useful

For the nondegenerate constant double rotation, the coordinate-expanded carrier can be replaced for many comparison/classification tasks by the four-scalar packet

M(C)=(m0,m1,m2,m3),

with an exact algebraic decoder for the two radii and two frequency magnitudes, modulo plane exchange and the explicitly excluded orientation/phase information.

Because each m_k is a Euclidean norm, M is invariant under a common constant SO(4) representation rotation. This makes it directly compatible with the W3 result: a large part of the helical architecture can be compared without carrying an arbitrary absolute 4D frame, while signed winding/phase can remain in the auxiliary frame/orientation channel.

This is a concrete efficiency gain for the intended hyper/superhelical use: repeated coordinate expansion is unnecessary for recovering the basic two-mode scale/frequency architecture.

### Graticule/Hagalaz implications

- Graticule can compute its unsigned tangent contribution from decoded values: tan β = b|ν|/(a|ω|), without requiring the original coordinate presentation.
- The frequency ratio magnitude |ν/ω| is likewise decoded directly, so rational/irrational winding tests can operate on the invariant packet.
- Hagalaz can use M as a candidate frame-independent carrier summary for this restricted family, supplemented by phase/orientation channels only when the operation needs them.
- D supplies a natural conditioning/degeneracy diagnostic: near D=0, decoding will be noise-sensitive even though the exact formulas exist.

### Status and limit

**CLAIMED (new sandbox derivation), algebraically checked in this run.** This is not promoted as a general hyperhelical decoder. It covers the constant-radius, constant-frequency two-plane carrier only. Variable pitch/radius and nested moving frames will require local/windowed moments, additional invariants, or explicit transport data.

Immediate next helical cursor: stress-test the decoder numerically near D=0 and under small perturbations/noise, because efficiency is useful only if the compressed representation is adequately conditioned.

## 22. Mixed equation batch begins

The experimental program is now explicitly throughput-first. Architecture validation is retained only as instrumentation needed to distinguish useful output from artifact.

### Exact positive controls verified

1. Euler-Cauchy:
   x²y'' + axy' + by = 0.
   With t=ln x and y(x)=Y(t):
   Y_tt + (a-1)Y_t + bY = 0.
   This feeds directly into the already-passing constant-coefficient normal-form machinery.

2. Riccati subclass:
   y' = q(x) + y².
   With y=-u'/u:
   u'' + q(x)u = 0.
   This is an exact nonlinear-to-linear transformation on domains where u is nonzero.

3. Bernoulli:
   y' + P(x)y = Q(x)y^n.
   With z=y^(1-n):
   z' + (1-n)Pz = (1-n)Q.
   Exact subject to the substitution's ordinary branch/domain qualifications.

These are deliberately heterogeneous transformation types: coordinate logarithm, logarithmic derivative, and nonlinear power substitution.

### Result

Generic derivative-state geometry supplies a common validity/scoring arena but does not by itself reveal these substitutions. Therefore a useful Whirligig requires a transformation proposal mechanism/search grammar rather than a single universal curve trick.

Provisional grammar families:
- affine/scaling coordinate transforms;
- logarithmic/exponential coordinate transforms;
- dependent-variable powers;
- logarithmic derivatives;
- gauge-like multiplicative transforms;
- frame rotations / SO(n) transforms;
- parameter changes;
- later contact transformations and problem-specific helical moves.

The grammar proposes; geometric/operator constraints score validity and usefulness.

## 23. Information debt

Every candidate transform now receives separate bookkeeping for:
- utility / simplification;
- invertibility;
- domain/branch restrictions;
- discarded variables or phases;
- approximation order;
- singular sets;
- gauge/frame dependence.

Call the aggregate non-lossless burden **information debt**.

A useful approximate transform may have nonzero debt. It is not rejected automatically. But debt cannot be silently converted into a claim of exact equivalence/isomorphism.

Early hostile control: nonlinear pendulum θ''+sin θ=0 does not become an exact linear constant-coefficient system under the current cheap grammar without approximation or state-dependent structure. Small-angle linearization therefore carries explicit approximation debt and is not scored as an exact equivalence.

## 24. Helical invariant compression

For the 4D double rotation

C=(a cos ωs,a sin ωs,b cos νs,b sin νs),

define

v²=a²ω²+b²ν²

and contribution fraction

η=a²ω²/v².

Then

κ² = [ηω² + (1-η)ν²]/v².

Five random numerical parameter sets reproduced the direct 4D coordinate calculation to floating-point precision.

This is elementary algebra, but operationally important: the full trigonometric coordinate representation can be replaced by a compact invariant state for this task. The intended hyper/superhelical efficiency program should seek many such sufficient invariant state vectors and composition laws.

### New practical target

For each helical architecture, attempt to construct the smallest state vector sufficient for the requested operations, rather than carrying expanded coordinates by default.

Measure:
- state dimension;
- expression complexity;
- evaluation cost;
- composition cost;
- reversibility/information debt;
- numerical conditioning.

A geometry machine earns its keep when these improve on direct expanded handling.


## 25. Worthwylie enrichment — moving-frame compression

Enrichment is allowed to be exploratory for the worker, not forced to track the immediate benchmark.

Let a hyperhelical carrier be

C(s)=Q(s)h(s), Q(s)∈SO(4),

and define body-frame angular velocity

A=Q^T Q'.

Then exactly,

C'=Q(h'+Ah)

and

C''=Q[h''+2Ah'+(A'+A²)h].

This separates internal helix motion h from moving-frame motion A. A direct numerical witness using a frame composed of 1-2 and 1-3 rotations plus a two-frequency internal carrier gave:
- velocity compact/direct residual ~7.92e-11;
- acceleration residual ~5.35e-6 under crude finite differencing;
- skew-symmetry residual ||A+A^T|| ~4.42e-11.

The acceleration cross-term 2Ah' explicitly captures interaction between internal and carrier-frame motion.

Status: APPEARS TO WORK / exact identity symbolically; numerical finite-difference witness consistent. Mechanistic usefulness for SAT/H(s)H unresolved.

## 26. Worthwylie enrichment — noncommutativity depth

For standard rotation generators,

[J12,J13]=J23.

Concrete epsilon=0.2 witness:
- ||exp(eJ12)exp(eJ13)-exp(eJ13)exp(eJ12)|| = 0.0563774315788
- leading commutator scale e²||[J12,J13]|| = 0.0565685424949.

Thus nested rotations in noncommuting planes cannot generally be compressed to an unordered set of frequencies. Order is information.

Candidate compact hierarchy:

radii/phases
+ frame generators
+ required commutators
+ higher nested commutators only as demanded.

Hypothesis for testing: representation cost may scale more usefully with noncommutativity depth than with fully expanded coordinate-expression size.

This is an exploratory development direction, not yet part of the Whirligig core contract.

## 27. Numerical adjudication rule

Hard methodology update from Nathan:

> No amount of symbolic manipulation can substitute for one numeral-by-numeral calculation.

Operationally, every serious claimed operator/result should receive at least one complete concrete numerical witness:
input -> encode -> operation -> decode -> output -> independent reference -> residual.

Symbolically derived and numerically demonstrated are separate statuses. Prefer additional random, irrational, near-singular, boundary, and hostile cases when useful.
