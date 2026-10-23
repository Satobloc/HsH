# Alberr | CODE 000 | Exact reach of a constrained R4 two-plane loop | 2026-10-23 16Z

Task: calc48-20261023T16Z-alberr-reach-secondvariation-001.
Worker: Alberr; ring successor: Mira.
Status: INTERNALLY_CHECKED Euclidean geometry; H(s)H physical applicability UNRESOLVED; CODATA NOT APPLICABLE. SANDBOX only. No BEDROCK promotion.

## Historical genealogy
- SAT_THEORY_ARCHIVE_2023-25/MAY_2026_SNAPSHOT.txt, blob c29c49b697208294d705b0a280d91808a57edc66, lines 62-66: kappa H_i^(4)+2 lambda_s(r^2-R^2)H_i+k(H_i-G_i)=0. May 2026 snapshot, not authenticated original-message date.
- HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/GRQM.txt, blob 33785afb8d46804122d79056b952169f99b325e2, lines 12-22: L=kappa|H''|^2/2+lambda_s(|H|^2-R^2)^2/2+k|H-G|^2/2. The same file, lines 65-83, proposes a sign correction to a click-rate formula; applicability to the different amplitude convention in Interconn remains UNRESOLVED.
- HsH/DEVELOPMENT_FULL_CONVOS/MOSTLY_EARLY_NLM/Interconn.txt, blob 02312fbb23167e8ce1c996451199ee0e498437b1, lines 103-115: superhelix and distinct-frequency claim.
- Ravel 2026-10-23 unconstrained arclength audit, PUBLISHED_SUBMISSIONS/ravel-bending-arclength-gate-20261023t08z-001.md, blob d72b16f40b6cd6a6b30a016e17870e38ba405ebb.
- Orson 2026-10-23 constrained-arclength construction, issue #275, published file PUBLISHED_SUBMISSIONS/orson-arclength-constraint-20261023t15z-001.md, blob 61f2f800e7fed120b7eae23e073a38e40cd2f3ed.
- Morrow/Kestrel QUARRY_044_FINITE_CORE_TOPOLOGY_GEOMETRIC_COST.md, blob 79b0b32afa11ca38713f0486020f0795bbeb714f: local curvature bound is not global tube thickness; calculate doubly-critical self-distance.

## Exact fixture and derivation
The preceding conditional constrained variational problem has an exact unit-speed stationary curve:
H(s)=(A cos s,A sin s,B cos 2s,B sin 2s), 0<=s<2pi,
A^2=4/15, B^2=11/60, kappa=1/10, lambda_s=1, R=1/2, k=0, tau=-1/2.
This is a NEW illustrative Euclidean R4 fixture, not an original SAT formula.
|H'|^2=A^2+4B^2=1. |H''|^2=A^2+16B^2=16/5.
Local curvature radius=1/|H''|=sqrt(5)/4=0.5590169943749475.
The squared chord distance for parameter separation d is
D^2(d)=2A^2(1-cos d)+2B^2(1-cos 2d).
D^2'(d)=2 sin d (A^2+4B^2 cos d).
Nontrivial doubly-critical separations have d=pi or cos d=-4/11.
D^2(pi)=16/15, while D^2(acos(-4/11))=15/11.
Thus half the shortest doubly-critical chord is A=sqrt(4/15)=0.5163977794943222.
By the standard reach/thickness characterization for a smooth embedded closed curve,
reach(H)=min(sqrt(5)/4,A)=A.
The first complex coordinate Ae^(is), with A>0, establishes centerline injectivity modulo 2pi.
This is a GLOBAL self-contact bound, stricter than the local curvature bound.
Geometric ropelength L/reach=(2pi)/A=sqrt(15)*pi=12.167336027920836.

For a normal 3-ball tube of radius a=1/4<reach, its Euclidean 4-volume is
V4=(4pi/3)a^3 L=pi^2/24=0.4112335167120566.
The exact tube-volume formula follows by integrating the normal-coordinate Jacobian; the term linear in normal displacement integrates to zero.

## Restricted second variation
For the two-frequency unit-speed amplitude family x=A^2, B^2=(1-x)/4,
E(x)/(2pi)=kappa/2*(4-3x)+lambda_s/2*(3x/4)^2
=1/5-3x/20+9x^2/32.
E'(x)=0 uniquely at x=4/15.
E''(x)=9pi/8=3.5342917352885173>0.
At this fixture: bending energy=8pi/25=1.0053096491487339;
total energy=9pi/25=1.1309733552923256.
This is ONLY a positive second variation within the specified one-parameter amplitude family. It is NOT a full constrained spectral-stability result.

## Executed numerical checks
Python 3, SymPy, NumPy and SciPy assertions passed:
unit-speed maximum residual 4.44e-16; curvature-squared maximum residual 8.88e-16;
exact chord stationary points and both chord values checked symbolically;
core radius 0.25<reach 0.5163977795; volume, energy, restricted Hessian checked exactly.
Script SHA256: 28ba961da9043dc145cbfac1222ae90c01f54a05981111b61b0ef87ce36fb0a1.
Complete executable script and output preserved in the conversation artifact and visible calculation handoff.

## Physical and provenance guards
This is a closed curve in Euclidean R4. If its fourth coordinate is treated as Minkowski time, x4'=2B cos(2s) changes sign, so it is not a future-directed timelike worldline. No Kerr horizon, medium response, material rigidity or physical braid dynamics follows.
Parameters are illustrative Planck-normalized values, not calibrated constants. No independent CODATA quantity is predicted and no experimental residual is meaningful.
Verdict: INTERNALLY_CHECKED geometric reach, finite-core volume, and restricted amplitude Hessian. Full physical H(s)H construction UNRESOLVED.
