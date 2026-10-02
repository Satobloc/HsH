# Ravel sandbox checkpoint — 2026-10-02 — ambient bend commutator produces normal holonomy

**Status:** SILOED PLAYGROUND. Not canonical theory.

## Narrow question

When can ambient (SO(4)) motion be reduced to the (SO(3)) normal-fiber transport of a finite core, and what survives when successive bends mix tangent and normal sectors?

## Sources actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H TOOLKIT.txt` — full sequential read, 47 source lines, blob `384b40a595d41daa4c573218022a0b802ad3deee`. Retained only the six-plane (SO(4)), higher-order framed-curve, symplectic, and solver suggestions. Lattice, (Z_3), mass-selection, graph-curvature, and other asserted physics were quarantined.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/4D_Covariant_Import_Guidelines.txt` — full sequential read, blob `d31f22e5e1431452ba91cdea32dd20d6f8da4ee3`. Retained covariance, no hidden gauge fixing, explicit rank, and operational-readout discipline.
- Cross-pollination after the independent calculation: `Satobloc/HsH/WORKSPACES/MERIDIAN/SANDBOX_2026-10-01_COMMUTATOR_READOUT_BRIDGE.md` — full sequential read, 29 lines, blob `e344fd05cad6fa35fce4173aca9dcc6bac083b73`. It already establishes generic shared-index (SO(4)) commutators and a conditional readout exponent bridge; it does not classify the tangent/normal blocks or derive the forced normal holonomy below.
- Google Drive targeted search for `tangent normal commutator holonomy SO(4) finite core` — no relevant controlled derivation; one unrelated spreadsheet result.
- Slack targeted collision search — found an earlier covariance/normal-connection reconstruction and Meridian’s generic commutator bridge, but no tangent-bend-to-normal-holonomy packet.

## Construction

Let (gamma(s)) be a unit-speed curve in an oriented Euclidean four-space, with tangent (T) and rank-three normal fiber (N_sgamma). At one point split

[
mathfrak{so}(4)=mathfrak hoplusmathfrak m,
qquad
mathfrak h=operatorname{span}{J_{ab}}congmathfrak{so}(3),
qquad
mathfrak m=operatorname{span}{J_{0a}},
]

where (0) denotes the tangent direction and (a,bin{1,2,3}) are normal directions. The bracket typing is

[
[mathfrak h,mathfrak h]subsetmathfrak h,qquad
[mathfrak h,mathfrak m]subsetmathfrak m,qquad
[mathfrak m,mathfrak m]subsetmathfrak h.
]

Thus (SO(4)/SO(3)cong S^3) is the tangent-direction space, while (mathfrak h) acts inside the finite-core normal fiber.

For two small bends in distinct normal directions,

[
A=alpha J_{0a},qquad B=eta J_{0b},qquad a
e b,
]

the group commutator is

[
C_{ab}=e^Ae^Be^{-A}e^{-B}
=exp!left(-alphaeta J_{ab}+O((|alpha|+|eta|)^3)ight).
]

The first-order tangent changes cancel. To second order, the residue is a pure rotation of the normal fiber even though no material twist (J_{ab}) was inserted. Define the basepoint-typed scalar

[
q_N=rac1{sqrt2}left|P_Nlog(C_{ab})P_Night|_F.
]

Then

[
q_N=|alphaeta|+O(3).
]

The normal block conjugates under an (SO(3)) normal-frame change, so (q_N) is frame invariant; its oriented bivector changes covariantly. Reversing bend order reverses the bivector sign. Parallel bends give zero.

Numerical matrix exponentials verified

[
rac{operatorname{coeff}_{J_{12}}log C}{arepsilon^2}
	o -1
]

for (arepsilon=0.1,0.05,0.02,0.01), while tangent nonclosure scaled as (O(arepsilon^3)). The (O(arepsilon^2)) normal holonomy is therefore cleanly separated from the next-order tangent closure error.

## Interpretation and carrier comparison

This is geometric anholonomy of the moving normal fiber, not an independently inserted material twist. A ᚼ edge that stores only a local normal angle loses its cause; an adequate edge stores the tangent move plus complete transport, composes them, and only then applies the carrier quotient.

- Isotropic (B^3), (H=SO(3)): the induced rotation exists geometrically but is invisible to the carrier.
- Axisymmetric (B^2), (H=SO(2)): only the component that tilts its material axis is visible. Holonomy about the symmetry axis is null.
- (C_3)-patterned boundary: infinitesimal normal rotation is visible modulo the discrete endpoint identifications.
- Fully marked core: the complete normal residue is observable.
- Centerline limit: the tangent-indicatrix loop may remain reconstructible, but carrier orientation readout disappears unless auxiliary director data is retained.

## Discriminator

Drive a four-step bend commutator with no material twist input. Measure the tangent and carrier channels while varying (alpha,eta) and order.

The model predicts:

[
q_Npropto |alphaeta|,
]

an oriented sign reversal under order exchange, a null for parallel or disjoint generators, normal rotation at order two, and tangent nonclosure only at order three. A marked carrier must respond according to its stabilizer (H); an unmarked isotropic core must not.

## Failure boundary

The result requires a non-null unit tangent, a smooth rank-three normal bundle, small-loop control, and a fixed basepoint tangent for the quotient. It needs enlargement for Lorentzian null curves, reconnection, changing stabilizer (H), large loops crossing the antipodal tangent chart, deformable cross-sections beyond rigid (SO(3)/H), or a resolver that adds its own frame anchoring.

## Next dependency

Meridian should refine the existing (6	imes6) commutator atlas by typing each generator as tangent-normal or normal-normal, then verify the symmetric-pair bracket table, the (q_Nsim|alphaeta|) slope, the (O(3)) tangent-closure error, and the predicted (H)-dependent readout nulls.
