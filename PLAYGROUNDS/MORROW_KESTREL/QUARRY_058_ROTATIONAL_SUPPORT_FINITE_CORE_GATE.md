# QUARRY 058 — ROTATIONAL SUPPORT MEETS FINITE-CORE BRAID CONTACT

Status: SANDBOXED / Morrow-Kestrel silo / 2026-10-04

## Provenance actually read
Old archive:
- Satobloc/SAT_THEORY_ARCHIVE_2023-25/HsH AHA TOPOLOGY.txt
- blob 5283ceb8d06109061543711ebe7c46954efe7ede
- requested/read lines 1-900.
- Relevant old construction: matter as topologically metastable/tangled finite structure resisting collapse; Kerr-ring/ER-core/ergosphere/filament discussion; explicit warning that rotation/topological stabilization mechanisms must not be silently merged.

Current H(s)H:
- Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/HAGALAZ_DEF+.txt
- blob f1b7e7a1bbb041b2ad0142aebb75b2bfda29b3e4
- requested/read lines 1-1100.
- Relevant current constructions: finite-core/tangency solver, double-rotation solver, recursive hyperhelix, torus/frame-history separation, noncommuting SO(4).

## Independent construction
Take two equal finite-core strands in a two-strand helical carrier, opposite in phase:
X1(z)=(a cos kz,a sin kz,z), X2(z)=(-a cos kz,-a sin kz,z).
Equal-z centerline separation is 2a; if each tube has radius rho, nonpenetration requires a>=rho.

Give the pair conserved axial angular momentum J. With two equal masses m, I=2ma^2. Add the simplest positive radial confinement (K/2)a^2. The reduced energy is

E(a)=J^2/(4ma^2)+(K/2)a^2.

Stationarity gives

a_*^4=J^2/(2mK),
a_*=(J^2/(2mK))^(1/4).

Finite-core contact occurs when a_*=rho, hence

J_c=sqrt(2mK) rho^2.

Therefore rotational support and finite-core exclusion are distinct mechanisms but meet at an exact gate:
- J>Jc: unconstrained rotational minimum is outside core contact.
- J=Jc: rotational minimum touches the finite-core boundary.
- J<Jc: unconstrained minimum would penetrate the cores, so contact/exclusion/topology must take over.

This independently repairs the old ambiguity between 'rotation stops collapse' and 'topological tangles stop collapse': rotation can set the preferred radius first; topology/contact only becomes load-bearing when that preferred radius enters the forbidden finite-core region.

## Audacious completion
A braid/worldtube state may have a piecewise effective radius:
a_phys=max[a_rot(J), rho] before allowing deformation/reconnection.
Thus decreasing J drives a smooth rotational contraction until a finite-core gate is hit. Beyond it, additional energy must be stored in twist/writhe/contact deformation or released by reconnection. This creates a candidate route:
angular-momentum loss -> core contact -> twist/writhe loading -> topology-changing event.

The candidate dimensionless control is
Xi = J/(sqrt(2mK) rho^2).
Xi>1 free rotational support; Xi=1 contact onset; Xi<1 core-limited sector.

## Failure conditions
1. If the H(s)H reduced action has no positive radial confinement K or no approximately conserved axial rotational quantity J, this fixture is irrelevant.
2. If 4D motion allows strands to evade contact without energetic/topological cost, a>=rho is not a meaningful gate.
3. The two-strand helix is a local mechanical fixture, not a particle model.
4. No historical constant or particle label has been targeted.

## Tight next solver
Derive the radial effective potential from the actual current worldtube action rather than inserting K. Then sweep the conserved SO(4) rotational invariants and finite-core radius. Test whether the first contact obeys a power law Jc proportional to rho^2 in the quadratic regime, and what curvature/jerk corrections do to that exponent. At contact, record Tw, Wr, frame holonomy, contact-set Betti number and whether a reconnection channel opens.

Key discriminator:
Does rotational contraction reach a finite-core gate before the braid/topological sector changes?

If yes, H(s)H gets a clean staged mechanism:
standard 4D rotational mechanics -> finite-core contact -> topological/framing response.
