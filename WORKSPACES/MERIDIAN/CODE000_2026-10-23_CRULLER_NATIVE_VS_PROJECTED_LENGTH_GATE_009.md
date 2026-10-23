# CODE 000 | Gate 009: native physical length versus projected Cruller length (SANDBOXED)
Date: 2026-10-23. Geometric address: **4D carrier → Clifford torus section → (2,3) worldtube-centerline fixture → stereographic 3D readout → native and displayed lengths**.

## Directive and sources
BEDROCK.md CODE 000: mandatory Prove/Play, Lean and Factory Floor. Read HsH BEDROCK.md, AGENTS.md, Meridian's 008 Alexander/Cruller gate, and original SAT O Derivations/SAT_D5_GAUGE_TOPOLOGY.txt. Shared Mersearch request remains Orson's; not overwritten. This is bounded source recovery, not comprehensive Mersearch. A full Lean proof and Factory Floor publication are **NOT** claimed; no Lean toolchain exists in current container runtime.

## Parent geometry and exact proof
Take native round S³⊂R⁴, radius 1, and Clifford torus
x(u)=(cos(pu),sin(pu),cos(qu),sin(qu))/sqrt(2), gcd(p,q)=1, q≠0.
Native squared speed = (p²+q²)/2, hence length
L_native = 2π sqrt((p²+q²)/2).
Stereographic map P(x)= (x1,x2,x3)/(1−x4), with north pole N=(0,0,0,1).
The differential on the tangent space of S³ obeys |dP|=|dx|/(1−x4). This follows from the inverse stereographic conformal metric ds²_S3=4 ds²_R3/(1+|P|²)² and 1−x4=2/(1+|P|²).
Therefore along the **same** unaltered native curve,
dL_projected/du = sqrt((p²+q²)/2)/(1−sin(qu)/sqrt(2)).
For nonzero integral q, the average of 1/(1−a sin(qu)) across one full interval is 1/sqrt(1−a²), for |a|<1. Taking a=1/sqrt(2):
L_projected = sqrt(2) L_native = 2π sqrt(p²+q²).
For p=2,q=3:
L_native=16.019042244414088,
L_projected=22.65434679827795,
L_projected/L_native=1.4142135623730951.
Thus a **41.42% apparent length inflation** arises purely from the 3D stereographic view without *any* physical stretch. This is a geometry/readout effect; one must not use projected Euclidean path length to infer additional travel time or a speed other than c.

## Executed independent numerical validation
Executed `/mnt/data/code000_cruller_projection_gate.py` in local Python. Recomputed 4D tangent and 3D derivative of P independently on 160001 points; trapezoidal quadrature compared against exact formulas. Residuals:
unit S³ |x·x−1| max 4.440892099e−16;
conformal tangent norm max error 3.552713679e−15;
both integrated length errors 3.552713679e−15;
ratio error 0.
Artifacts saved locally: `/mnt/data/code000_cruller_projection_gate.png`, `/mnt/data/code000_cruller_projection_gate.svg`, `/mnt/data/code000_cruller_projection_gate.py`. Files are not in repository unless separately written.

## Construction implications: strict correspondence, not retrofitting
1. The torus view and spherical parent can genuinely be views of one native curve; we have a **computed projection map**, not two arbitrarily juxtaposed drawings.
2. A coiled population and uncoiled vacuum population must both use the **same native physical metric** and the user-fixed propagation rule ds/dt=c. The projection's apparent speed variations do not change physical speed. A native 4D Euclidean arc length is NOT automatically the physical optical/travel length; metric and propagation carrier still require the existing SAT prescription.
3. 'Light Now' and 'Matter Now' cannot be constructed from mere camera-projection stretching. Tension-driven physical bulk deformation requires separate material strain/metric calculations. This gate gives an exact null control for the visual cruller.
4. The fixture does **not** assert the physical universe is S³, the present slice is S³ instead of B³, Clifford T² is a time sheet, a (2,3) trefoil is a quark, or any horizon or ER bridge is present.
5. Original SATO D5 mapping linking densities→gauge generators is *not* implied by stereographic length, and remains unclosed.

## Fail-rigid propagation
Geometric visualization and geometric path-measure readout: update, with exact factor sqrt(2) for this very fixture. Alexander invariants unchanged under projection so long as projection is an embedding of the curve away from pole. Minkowski physical propagation speed fixed at c; no rate c+H0; cosmological Hubble, QCD, EM, Kerr, Kelvin-medium, spin and flavor constraints not altered or validated by this visual identity.

## Next CODE 000 work
Replace round S³ toy native arc length with the physical resolved 4D metric from original SAT.O construction and a finite-radius embedded worldtube. Recover exact optical/travel functional and 3D sheet projection. Apply it to both straight vacuum and coiled matter curves. Require nonzero physically computed local strain before attributing any deformation to worldtube tension. Pursue Lean formalization when Lean environment available; do not label numerical checks a proof in Lean.
