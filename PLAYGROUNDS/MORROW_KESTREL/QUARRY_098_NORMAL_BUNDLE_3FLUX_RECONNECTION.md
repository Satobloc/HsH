# QUARRY 098 — Normal-bundle 3-flux and finite-core reconnection

Status: SILOED SANDBOX / Morrow–Kestrel

## Provenance
Old substantial read:
- Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT-TO-STANDARD 2.txt
- blob f32cca74bbb174bb95319d92d354abb6f368e373
- lines 1–1200 requested/read
- retained: finite-core framed worldtube, boundary/interaction surface, normal bundle, connection/circulation, curvature/torsion and braid/topology continuity.

Current substantial read:
- Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/H(s)H MANIFOLDS.txt
- blob 54f2f530697ab6e9c44758ce3406c4144915c73d
- lines 1–1200 requested/read
- retained: finite-core holonomic worldtubes; three-form current J_{munurho} ~ epsilon_{alpha munurho} v^alpha; conservation language; B^3/S^2 carrier context; recursive worldtube and finite-core program.
Historical fitted constants/particle labels were not used as targets.

## Independent construction
For an oriented unit tangent T to a curve in Euclidean R4, the Hodge dual
J = * T^flat
is exactly the oriented 3-form on the normal 3-space. Thus the current 3-form has a direct finite-core reading: integrated over a transverse B^3 core, it measures oriented transverse 3-volume flux.

With density rho and tangent speed v, define
Phi_3 = int_{B^3_a} rho v J = rho v (4 pi/3) a^3
for a locally isotropic normal core.

If the appropriate conservation law holds through a reconnection/branching control volume,
sum_i s_i Phi_{3,i}=0.
For one parent and two daughters:
rho_0 v_0 a_0^3 = rho_1 v_1 a_1^3 + rho_2 v_2 a_2^3.
Equal density/speed gives the parameter-free geometric rule
a_0^3 = a_1^3 + a_2^3.

For equal daughters:
a_1=a_2=2^(-1/3) a_0 = 0.793700525984... a_0.
This dimensionless number was generated from flux splitting, not targeted from any historical SAT constant; no physical identification is made.

## Audacious completion
Reconnection may be constrained not only by centerline topology/contact action but by conservation of oriented normal-bundle 3-flux. Finite-core radius would then participate directly in topology change.

## Attack
- J=*T^flat implies dJ=0 iff the relevant tangent field is divergence-free; this must be checked rather than assumed.
- A single isolated curve does not automatically define a smooth ambient tangent field.
- Anisotropic B^3 cores replace a^3 by actual transverse 3-volume.
- Physical reconnection may permit source/sink terms, invalidating flux conservation.
- The archive's notation d^*J is ambiguous and must be repaired with differential-form conventions.

## Solver discriminator
At numerically generated reconnection events, measure transverse core 3-volume and tangent transport on every branch. Test
rho_0 v_0 V_0 = sum_i rho_i v_i V_i
without fitting. For isotropic equal-density/speed branches, test the cube law a_0^3=sum_i a_i^3. Compare against area conservation a^2 and ordinary radius conservation a; these give distinct daughter-radius exponents.

## Carry-forward
The key bridge is:
1D tangent in R4 --Hodge dual--> oriented normal 3-form --finite core--> B^3 flux --reconnection--> cube-law branch constraint.
