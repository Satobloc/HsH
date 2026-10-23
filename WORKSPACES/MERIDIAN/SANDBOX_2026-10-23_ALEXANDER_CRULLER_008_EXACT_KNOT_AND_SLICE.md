# SANDBOXED | Alexander × Cruller 008: exact knot fixture, projection, invariants (2026-10-23)

## Inputs, provenance, execution
Read BEDROCK.md, AGENTS.md; predecessor WORKSPACES/MERIDIAN/SANDBOX_2026-10-22_ALEXANDER_CRULLER_INVERSE_GATE_007.md; WORKSPACES/MERIDIAN/SANDBOX_2026-10-20_CRULLER_FIRST_GLOBAL_TOPOLOGY.md; original SAT archive SAT O Derivations/SAT_D5_GAUGE_TOPOLOGY.txt. Mersearch shared slot belongs to Orson (`2026-10-21-orson-nlm-big-haul-math-001`); NO new Mersearch run, only bounded targeted reads. Code executed this turn in Python in `/mnt/data/alexander_cruller_gate.py`, image `/mnt/data/alexander_cruller_008.png`; these local files are NOT published in GitHub by this markdown commit. Labels old 'filaments' in D5 translate to proposed physical worldtubes, NOT fluid medium-vortex cores.

## 1. Exact parent and projection
Use a fixed geometric fixture S³⊂C², |z1|²+|z2|²=1, in native R4 with Hopf coordinates
z1=cos χ e^{iα}, z2=sin χ e^{iβ}.
Clifford T²: χ=π/4, splitting ONE S³ into complementary linked solid tori.
A closed embedded (p,q) curve for gcd(p,q)=1 is
K_{p,q}(u)=2^{-1/2}(cos(pu),sin(pu),cos(qu),sin(qu)), u∈[0,2π).
The unchanged stereographic map from N=(0,0,0,1) is
P(x1,x2,x3,x4)=(x1,x2,x3)/(1−x4).
The Clifford torus image obeys exactly (sqrt(X²+Y²)−sqrt(2))²+Z²=1, a torus of revolution in R3. This is a true projection/readout of the SAME curve in native four-space, not an independent doughnut structure. Note topology S³ slice vs B³ ball slice remains a **real unresolved difference**: S³ is not B³. One cannot substitute them under homeomorphism.

## 2. Independently checked numeric identities
Python/NumPy 1801-point fixture for (p,q)=(2,3) produced max norm error |sum x_i²−1|=2.220446049250313e−16 and max stereographic torus equation residual 2.55351295663786e−15. Both at floating-point tolerance. These verify formulas only.
On the unit-radius S³ the induced metric on Clifford T² is 1/2(dα²+dβ²); hence
|K'_{p,q}|²=(p²+q²)/2, L_{p,q}=2π sqrt((p²+q²)/2).
Executed values: L_23=16.01904224441409, L_21=9.934588265796101. This is *intrinsic geometric curve length* in the illustrative round S³. It is not travel time or c until a physical propagation trajectory is specified. For genuine arc length s, ds/dt=c remains user-fixed, and a travel time L/c follows only with physically justified path/metric.
Finite radius requires an injective tubular neighborhood bounded by reach, not just a plotted line; the crude 35-sample nonlocal chord result 0.31003846 has NO analytic-thickness or reach certification and must never be used as one.

## 3. Alexander invariant: distinguish same carrier from same topology
2-strand Artin braid β_n=σ₁^n, reduced Burau matrix ρ(σ₁)=[−t].
One polynomial representative of Alexander invariant for braid closure is
Δ_n(t)=(1−(−t)^n)/(1+t), up to ±t^k; multi-component cases include normalization ambiguities.
SymPy executed:
n=1 -> 1 (unknot);
n=2 -> 1−t (Hopf link, 2 components);
n=3 -> t²−t+1 (trefoil knot);
n=4 -> −(t−1)(t²+1) (2-component link);
n=5 -> t⁴−t³+t²−t+1 (cinquefoil).
The closed β_3 trefoil can be represented by Clifford torus (2,3); β_1 unknotted (2,1) uses identical torus carrier, distinct embedded trajectory. This is a nontrivial discriminant: changing the optical view cannot change Alexander polynomial under ambient isotopy. Knot-changing transitions need a different topology-changing operation (e.g. crossing/reconnection or another high-dimensional mapping), not just camera movement. In full R4 two S1 knots have different isotopy behavior than in S3; all link/knot identifications are explicitly **within the S3 section**.

## 4. What this achieves and does NOT
Achieves:
- precise S3→R3 torus view of one object;
- parameterized curves with correct norm, projected surface and intrinsic length;
- topological discrimination of apparently related coils that are genuinely distinct knots.
Does NOT derive Cruller time sheet, differential bulk tension/curvature, matter/vacuum distinction, Kerr-associated cores, physical worldtube braid interactions, SU(3), spin-statistics, Hubble law, and not yet horned-sphere embedding.
Original SAT.O D5 claims density-derived gauge coupling and Yang–Mills from linking. Nothing in present Alexander polynomial derivation supplies dimensionally defined gauge currents, correct Yang–Mills representations, renormalized coupling or real dynamics. Status D5 gauge correspondence **not transferred**; topo invariants may constrain admissible braid sectors but cannot establish SU(3) physics.

## 5. Star-map dependencies / failure propagation
Geometry sector: established mathematical fixture. Topological braid sector: Alexander polynomial gives knot distinction *for closed curves on S3*. Worldtube physical correspondence: open. Bulk tension, Kerr/ER, medium circulation, EM, flavor, spin, cosmological propagation: unchanged/unproved. QCD/D5: no closure, not promoted. In particular the user-fixed c is untouched and no independent propagation speed constructed.

## 6. Next strongest gate
Construct the actual four-dimensional parent geometry and continuous physically distinguished worldtube cores W_i with one geometrically defined slice/readout; calculate which embedded link classes occur on the slice, finite-core reach, and complement π1/H1, and compare stereographic and branched readouts while preserving W_i. Separately test any global return against causality and metric descent. Only *then* ask how 3D pinned/coiled worldtube distributions yield local puckering versus straight uncoiled bulk.
