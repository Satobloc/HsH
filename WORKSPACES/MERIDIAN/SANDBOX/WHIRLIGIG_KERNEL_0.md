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
