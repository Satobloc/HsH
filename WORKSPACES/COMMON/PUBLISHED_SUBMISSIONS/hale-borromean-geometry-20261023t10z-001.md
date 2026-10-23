# Hale :00 | 2026-10-23 10Z | SAT Borromean illustration exact collision audit

STATUS: Historical 3D illustration REJECTED as a disjoint Borromean link. Native 4D finite-core construction UNRESOLVED. BEDROCK unchanged.

SOURCES: Read current BEDROCK.md (509 lines, Git blob 83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8), STATE_OF_THE_THEORY.md (155 lines, blob b5958a1056c2541f00ab4f3477d8acc32426cfe9). Original code SAT_THEORY_ARCHIVE_2023-25/SAT_O REWRITE/SAT 4D/BORROMEAN_LINK_ILLUSTRATION.txt (complete, blob a13a7995113e647a0fdcf50e10c526bc60edf709). Related SAT CLAUDIOCY.txt (blob e5ffc5a4525164c5ba2d118bc47aad52d1867d1e), ORDERS.txt (complete, blob 1f9cec2b7468a87e689239d7b0d00f8e8ad825a5), HsH QUARRY_049_B3_FULL_TWIST_Z3_CLOSURE.md (complete, blob 2bc3fe3cbe18152071edda7315ce8c9d4a3a12ed). Random unrelated full 208-line SAT-GIGAPACK.txt (blob 99a137e4891cd4a3ecaee86cf76a2d06c5af300b), actual Python secrets.randbelow(4) index 2. Public sources only.

MERSEARCH: Worker guide consulted; shared single-slot request occupied by Orson request 2026-10-21-orson-nlm-big-haul-math-001. No new Mersearch run. Bounded direct primary reads, partial corpus coverage.

ORIGINAL CODE EQUATIONS: C1(theta)=(1+cos(theta),sin(theta),0), C2(phi)=(0,1+cos(phi),sin(phi)), C3(psi)=(cos(psi),0,1+sin(psi)). Exact substitution gives C1(pi)=C2(pi)=C3(3pi/2)=(0,0,0). Pairwise equation solving finds origin as the unique common point of each pair. Tangents (0,-1,0),(0,0,-1),(1,0,0) have determinant +1: transverse triple collision. The source code's title "Stable Borromean Link" is incorrect for these embedded 3D circles. Gauss linking integral is undefined for intersecting components. Positive-radius finite cores overlap at origin.

NUMERICAL TRAP: The source uses 200 endpoint-inclusive sampled points. Computed minimum sampled pairwise separations: 0.0222375283453, 0.0177057721913, 0.0176222471733. With 201 points all three distances are machine zero. Sampling can hide an exact collision.

B3 COMPARATORS: Standard closure of (sigma1 sigma2)^3 has identity permutation and pairwise link (1,1,1). Standard closure of (sigma1 sigma2^-1)^3 and of [sigma1^2,sigma2^2] has identity permutation and pairwise link (0,0,0); both are nonidentity in the reduced Burau representation. Triple Milnor invariant NOT computed. These are topology controls, not imposed native 4D closures.

USER CORRECTION IN CLAUDIOCY: Local helices continue into global recirculating paths; arbitrary local capping or deleting strands is not authorized. Q=9 quark-level He-3 versus Q=3 coarse-grained nucleon-level from ORDERS.txt must remain typed separately.

PROJECTION TEST: Lifting the three 3D rings to distinct constant w values (0,d,2d) leaves their 3D projections identical but gives 4D pairwise separation >=d. Radius-a 4D cores disjoint if d>2a. This is a mathematical counterexample to inferring native 4D collisions from 3D projections, NOT a derived physical worldtube solution.

EXECUTION: SymPy exact intersections and tangent determinant, SciPy sample distances, braid crossing/link ledger, reduced Burau braid relation and nonidentity checks, two Class P figures. All assertions passed; one initial scheduler expectation typo corrected before final run. Full runnable code and output archived inline in ChatGPT conversation.

GATE: Original 3D illustration's Borromean claim REJECTED. Exact collision and braid combinatorics INTERNALLY_CHECKED. Actual finite-core Kerr/ER topology, recirculation, clearance and stability UNRESOLVED. No independent CODATA observable or residual, no empirical fit, no BEDROCK promotion.
