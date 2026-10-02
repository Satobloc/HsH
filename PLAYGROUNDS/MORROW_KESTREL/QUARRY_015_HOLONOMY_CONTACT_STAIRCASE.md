# Morrow–Kestrel XV — Holonomy quantizes access to the contact regime

Status: SANDBOX / NON-CANONICAL
Date: 2026-10-02

## Provenance read this run

Old SAT:
`SAT_THEORY_ARCHIVE_2023-25/DEBATING AI PODCAST/The New Physics - Zitterbewegung & Worldtubes.srt`
blob `d7807b1871ef96f491a1178df9f4ee7356072af3`.
Read lines 1–650. Retained only: worldtube+timesheet minimal grammar; advance+oscillation -> helix; filament thickness distinct from coil radius; persistent coil -> nested superhelix/braid; hard-core versus soft coil-coil overlap as distinct ideas.

Current H(s)H:
`HsH/WORKSPACES/COMMON/PLAYGROUNDS/CALDER_VANE/002_OPEN_INSTANCE_LAGRANGIAN_CHALLENGE_2026-10-01.md`
blob `b20c0c51ec1192a4edee9ff3c2ca535b5cdada96`.
Read complete file. Retained: X=(gamma,F,B), finite-core resolver coupling, director holonomy, fiber-to-base promotion gamma_(n+1)=gamma_n+F_n a_n, and closure H_F^N a=a up to symmetry of B.

No historical numerical constant or particle label was used as a target.

## Construction

Take a periodic parent carrier of length L and a marked material offset a of magnitude r. Let the director holonomy per parent circuit be a rotation by angle Theta in the relevant normal 2-plane.

After N circuits, polar closure requires

N Theta = 2 pi m,  m in Z.

Thus the winding per parent circuit is rational,

w = Theta/(2 pi) = m/N.

Fiber-to-base promotion on the N-cover has local rotation rate

omega = Theta/L = 2 pi m/(N L),

and therefore the dimensionless promoted-helical tightness is

q = r omega = (2 pi r/L)(m/N).

Run XIV independently derived the first nonlocal-neighbor catastrophe for a simple promoted helix:

tan x_c = x_c,
x_c = 4.493409457909064...,

q_c = sqrt(-1/cos x_c)
    = 2.145539290889752....

Therefore a holonomy sector can enter the nonlocal-contact-capable geometry only if

|m|/N > (q_c/(2 pi))(L/r).

Equivalently,

|Theta| > q_c L/r

on the chosen lifted branch.

This is a discrete topology/holonomy gate on access to a continuous geometric catastrophe.

## Core symmetry

If the finite body B identifies offsets under a p-fold material symmetry C_p, closure only requires

H_F^N a = S_j a,  S_j in C_p.

Hence

N Theta = 2 pi ell + 2 pi j/p,

so

w = (ell+j/p)/N

and

q = (2 pi r/L)(ell+j/p)/N.

Thus changing the material representation changes which contact-capable sectors exist without changing the centerline action.

## Consequence

Holonomy does not create contact or topology change. It quantizes which promoted geometries are kinematically admissible. Geometry then decides whether a nonlocal critical pair exists; finite B decides overlap; constitutive dynamics decides surgery.

The sequence is

director holonomy
 -> allowed rational winding sector
 -> ᚼ promotion
 -> q
 -> nonlocal-distance catastrophe
 -> finite-core overlap
 -> reconnection gate.

This gives a concrete sense in which topology can constrain dynamics without being treated as a force.

## Discriminator

For fixed L/r and closure cover N, define

m_min(N) = floor[N q_c L/(2 pi r)] + 1

for a polar marked core.

Then sectors |m| < m_min cannot possess the simple-helix nonlocal-neighbor basin at all, regardless of reconnection strength.

For C_p material symmetry replace m by ell+j/p.

A solver should reproduce this staircase exactly in the straight-parent limit and show how curvature, 4D escape, anisotropic support and non-Abelian SO(3) holonomy deform it.

## Failure conditions

1. If the relevant offset is gauge because B is isotropic/unmarked, the discrete holonomy sector is not physically readable.
2. If full 4D relaxation changes the holonomy class or bypasses the 3D nonlocal-distance catastrophe at negligible cost, the gate is only metastable.
3. If parent curvature destroys the simple relation omega=Theta/L strongly enough, the straight-parent staircase is only a local benchmark.
4. If H_F is genuinely non-Abelian along the carrier, a single angle Theta is insufficient; the full path-ordered holonomy must replace this Abelian reduction.
5. Contact still does not imply reconnection.

## Next calculation

Use the full SO(3) path-ordered holonomy H_F=P exp integral Omega ds. For a generic finite body B with symmetry group G_B, classify closure sectors by the condition H_F^N in G_B. Promote each sector with gamma_(n+1)=gamma_n+F_n a_n, then compute the first nonlocal critical pair of D(s,s') and finite-body overlap.

The hard question: can two noncommuting director histories have the same endpoint holonomy but different promoted contact graphs? If yes, H(s)H recursion carries path information beyond holonomy class, and the correct state variable is not H_F alone but the connection history modulo gauge.
