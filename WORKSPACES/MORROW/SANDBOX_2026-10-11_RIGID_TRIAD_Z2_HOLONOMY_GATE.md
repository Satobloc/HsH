# SANDBOXED — Morrow/Kestrel | rigid-triad Z2 holonomy gate | 2026-10-11

## Provenance and scope
Onboarding read this run: `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, Reference Desk, cross-formalism index, scope/quarantine rule, and the mathematical/workflow routing files. Private HSH_RESOURCES treated as navigation, not imported theory; restricted Schreiber/Hypothesis H not consulted.

**Historical SAT source fully read this run:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/RMS Spacetime Filaments.txt` (full returned text), which proposes interbraided composite threads and tugs along filaments. **Current HsH source fully read:** `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt` (full returned text), especially Pillar Four's proposed bi-/tripartite twist locking and Proposition E's aligned vacuum filaments. **Prior current HsH build fully read:** `WORKSPACES/MORROW/SANDBOX_2026-10-11_NORMAL_PLANE_ESCAPE_BRAID_GATE.md`. Source statements are hypotheses, not proofs.

## Independent mathematical construction (LOCAL:MK-TRIAD-20261011)
The earlier two-centerline result used configuration space of a relative vector `R³\\{0}`, homotopy-equivalent to S², with trivial π₁. A **rigid oriented noncollinear three-center triangle** has instead configuration space (with translation and scale factored out) SO(3), since the three labeled vertices determine an oriented body frame. Standard topology gives π₁(SO(3)) = Z₂. A 2π turn of the rigid triad is a noncontractible *loop in the constrained configuration space*, while a 4π turn is contractible.

Fixture: equilateral planar triangle vertices `a_j=ρ(cos(2πj/3),sin(2πj/3),0)`, `j=0,1,2`; `x_j(w)=Q_z(2πnw/L)a_j`. All pair distances are `√3ρ`; equal-w spherical finite cores of radius ε remain disjoint for `√3ρ>2ε`. Each individual history is timelike in Minkowski coordinates w=ct if `2π|n|ρ/L<1`. The orientation lift to SU(2) is `q_n(w)=(cos(πnw/L),0,0,sin(πnw/L))`. At w=L, `q_n(L)=(-1)^n q_n(0)`; parity n mod 2 distinguishes the loop classes **only while the rigid triad constraint is enforced**.

Numerical exact endpoint check: n=1 gives quaternion (-1,0,0,0), n=2 gives (+1,0,0,0). This is a topological classification, NOT a spin-1/2, fermionic-statistics, color, or confinement derivation.

## Attack / failure conditions
1. Mere finite-core pairwise nonintersection does NOT preserve rigid shape. The full ordered configuration space of three points in R³ is simply connected; unconstrained braids can still unwind. Pairwise springs of finite stiffness only create energy barriers, not exact Z₂ sectors.
2. If any side length collapses or the triangle becomes collinear, the body frame is undefined. A 3D triad may evade the SO(3) obstruction by allowing deformations that change its internal shape, without a core collision.
3. A coordinate-selected body frame is not a physical field. To give the Z₂ result physical meaning, derive an interaction that strongly constrains the Gram matrix of three relative vectors or a transported material triad. The finite-core and covariance constraints are independent.
4. A closed loop in configuration space of block histories is not automatically an observable quantum phase; SU(2) double-cover sign alone is not a measurement.
5. Do not conflate an oriented **rigid triangular frame** with a three-strand braid in unconstrained four-dimensional geometry.

## Tight solver test
Use three timelike histories `x_j(w)` with equal-w finite cores. Minimize `E=(A/2)Σ∫|x'_j|²dw +(λ/2)Σ_{i<j}∫(|x_i-x_j|²-3ρ²)²dw`, fixing initial/final labeled triangle positions and imposing noncollision. Run n=1 and n=2 initial configurations for increasing λ; compare least-energy homotopies and minimum pair separation. λ→∞ approaches rigid SO(3) sectors; finite λ should permit escape, potentially through near-collinearity, without collisions. Use a transported frame and explicit gauge checks. Failure criterion: no stable barrier at finite physically derived λ or any apparent barrier disappears with mesh refinement/alternate homotopy.

**Status:** mathematically standard constrained-configuration insight; physical triad locking is a new, unverified sandbox conjecture. No particle constants fitted. Morrow/Kestrel.
