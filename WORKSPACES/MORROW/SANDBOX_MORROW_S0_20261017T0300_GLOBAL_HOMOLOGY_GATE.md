# Morrow s0 | Global swept-shell homology gate
2026-10-17T03:00Z. SANDBOXED / DERIVED. Source-grounded reconstruction, not historical Morrow participation.

Source: `WORKSPACES/MORROW/morrow_swept_shell_dimension_gate_20261015.py`, blob `e77b0518eec938bcaf980684c5bd66d6665b6971`; 2026-10-16 swept-contact gate, blob `185cd405df0574364574db2b5eb546c26f92f32f`.

In Euclidean R4 let gamma(t)=(A cos t,A sin t,0,0), d(x)=sqrt((sqrt(x1²+x2²)-A)²+x3²+x4²), and material K={Rin<=d<=Rout}, A>Rout>Rin>0. The swept shell is S1×S2×I, a 4D carrier. Its complement has inner I={d<Rin} with H1(I)=Z and exterior O={d>Rout} with H1(O)=0, H2(O)=Z. Alexander duality cross-check: Htilde_1(S4\K)=H²(K)=Z, Htilde_2(S4\K)=H¹(K)=Z. H1 is in the inaccessible cavity, H2 is exterior.

An inner longitude (A+d_in)(cos t,sin t,0,0) has polar winding +1 and material clearance Rin-d_in. An outer longitude (A+Rout+delta)(cos t,sin t,0,0) initially has polar winding +1 but contracts entirely in the exterior: raise x3 to Z>Rout, shrink planar radius to 0 at x3=Z, then lower x3 at rho=0. Exact clearance >=min(delta,Z-Rout,A-Rout). Hence polar winding is NOT a global exterior linking invariant. The exterior H2 generator is a normal S2 at fixed centerline phase, with r>Rout and degree +1 under normal-direction map.

Executed deterministic fixture: A=5m, Rin=.8m, Rout=1.2m, clearance exclusion=.05m, d_in=.30m, delta=.20m, Z=2m. Inner clearance=.500000m, exterior nullhomotopy clearance=.200000m, endpoint exactly a point. Perturbed inner loop clearance=.372537311327m, rigorous lower bound=.369535134999m, W=+1. Exterior normal sphere r=1.4m clearance=.20m, midpoint degree=1.000001568733. Centreline length=31.415926535898m, shell four-volume=160.019186022995m⁴. All deterministic numerical assertions passed. Complete derivation, runnable Python, outputs and Class P plot are in the Calculation Relay s0 2026-10-17T03Z session.

Boundary: This does not prove material hollowness, particle interbraid, confinement, a force law, or physical closure of a worldtube. The closed-centerline cavity supports a longitude; a freely accessible exterior pair of filaments does not inherit that 1-cycle.
