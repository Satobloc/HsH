# Meridian | Nonconvex torus and active wavefront contact (2026-10-10)
SANDBOX geometry; not Kerr, ER, Pauli, force, or theory promotion.

Primary sources actually read: SAT archive `SAT ALL TOGETHER SYNTHESIS.txt` (substantial, July 2026 source); HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/002 Forces Across Temporal Points - to 8-13-24.txt` (complete), `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/CLOSED_STRING_VIZ.txt` (complete). Onboarding front door, BEDROCK, Oct 9 controls, HSH_RESOURCES War Room and toolkit navigation reviewed. Restricted Hypothesis H and direct Schreiber material not accessed. Exact paths used, no corpus-wide retrieval.

LOCAL notation: two inertial coaxial circular-ring traces in 3+1 Minkowski have major radii R1,R2, proper toroidal neighborhood minor radii r1,r2, axial separation d(w)=d0+v*w, gamma=(1-v*v)^(-1/2), w=ct. The second core's axial thickness Lorentz-contracts by 1/gamma. Let b=abs(R2-R1). If b>r1+r2, actual contact impossible. Otherwise:
```
Dmax(b)=max_{u in [-r1,r1], |b-u|<=r2}
 sqrt(r1*r1-u*u)+(r2/gamma)*sqrt(1-((b-u)/r2)^2).
```
Exact filled-core contact at w iff abs(d(w))<=Dmax(b). In centered active slab thickness Delta, contact opportunity iff max(0,abs(d0)-abs(v)*Delta/2)<=Dmax(b). Singular ring contact separately requires R1=R2 and d(w)=0. Shell-boundary contact is separate again.

Fixture R1=1,R2=1.1,r1=r2=.12,v=.8,Delta=.2,d0=.22:
Dmax=.175492359832365, slab threshold=.255492359832365. No contact at w=0; contact at w=-.1; no singular-ring contact. Active contact duration=.04436544979046; 4D filled-core overlap hypervolume=.000333705587. Three numerical resolutions converge; 120 randomized tests independently checked with Shapely.

New generic onset discriminator: near a smooth nondegenerate slab-edge contact, 4D overlap grows as penetration^(5/2). Direct numerical log slope 2.4949625.

Negative controls: full 3D convex hulls of disjoint coplanar tori overlap through the central aperture; nested filled toroidal cores can overlap without shell-boundary contact. Do not flatten singular support, shell boundary, filled core, full 4D intersection and active slab into one contact channel.

Limits: inertial, coaxial, axial boost, circular ring, provisional filled toroidal cores. Active slab is foliation-dependent; no force law, exclusion statistics or coiling derived. Next: tilted/curved Fermi-normal nonconvex tube solver with separate local fold and global contact gates.

Complete runnable script, detailed source record, numerical controls and Class P figures: Meridian conversation `meridian_torus_contact_2026-10-10.zip`.
