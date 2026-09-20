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

Important: this does NOT prove a general equation-to-curve encoder. It establishes a reversible composition after the two inputs have been encoded in this restricted class.

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

This supplies a candidate Graticule readout using only existing torus/angle data. It does not by itself prove a chirality flip.

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
