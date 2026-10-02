# Ravel sandbox — compact C3 phase-slip defect (2026-10-02)

**Status:** SILOED PLAYGROUND. Not canonical SAT or H(s)H.

## Fresh source reads

- `SAT_THEORY_ARCHIVE_2023-25/Filament onto.txt` — substantial sequential read, lines 1–520. Retained the user correction that a “domain wall transition” is not a test until its basic observable is specified, plus the older mechanical intuition of twist accumulation, phase reversal, flexible resolver and rigid filament. Particle, black-hole, lattice, force, and historical numerical claims were not imported.
- `HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_104_EXACT_FINITE_SLAB_FOLD_DISCRIMINATOR.md` — full sequential read. Retained its exact finite-slab readout function and two-valued thickness/core inverse; used only after deriving the phase defect.
- Live dependency: `WORKSPACES/RAVEL/SANDBOX_2026-10-02_CONTACT_OVERLAP_CUSP_LOCKING.md` — the prior conditional contact-overlap potential.

Google Drive and common Slack were searched for an existing controlled phase-slip/domain-wall calculation; none was found.

## Object

A resolved, unlabeled C3 material support inside a finite worldtube. Let (u(s)) be the relative-spacing mode
[
(	heta_0,	heta_1,	heta_2)
=
(0,,2pi/3+u,,4pi/3-u).
]
Because the strands are unlabeled,
[
usim u+P,qquad P=rac{2pi}{3}.
]

At either contact cusp ratio
[
epsilon=rac1{4sqrt3}quad	ext{or}quadepsilon=rac34,
]
the exact pair-overlap excess over one period is (JY(u)), with (Y(u+P)=Y(u)), (Y(P-u)=Y(u)), and on (0le ule P/2),
[
Y(u)=
egin{cases}
dfrac{2u}{pi},&0le ule P/4,\[4pt]
dfrac{4u}{pi}-dfrac13,&P/4le ule P/2.
end{cases}
]

## Minimal defect action

Add the least longitudinal transport cost:
[
E[u]=int dsleft[
rac K2(u')^2+JY(u)
ight],
qquad K>0, J>0.
]
Here ([K]={m energy}	imes{m length}) and ([J]={m energy}/{m length}).

For a static slip joining (u(-infty)=0) to (u(+infty)=P), the first integral is
[
rac K2(u')^2=JY(u).
]

Because (Y(u)sim |u|) at each minimum, the solution reaches the vacuum at finite distance. It is a compact defect rather than an exponential-tail kink. The exact support width is
[
oxed{
L_{m slip}
=
pisqrt{rac{K}{2J}}
left(1+rac1{sqrt3}ight)
}
]
and the defect energy is
[
oxed{
E_{m slip}
=
rac{pi}{3}sqrt{2KJ}
left(1+rac1{3sqrt3}ight).
}
]

Numerical quadrature reproduced the dimensionless coefficients
[
L_{m slip}/sqrt{K/J}=3.503991299241047,
qquad
E_{m slip}/sqrt{KJ}=1.765972052755425
]
to (9	imes10^{-16}).

The profile is piecewise parabolic. On its first segment,
[
u(s)=rac{J}{Kpi}(s-s_L)^2,
]
until (u=P/4); the curvature doubles on the next segment because (Y'(u)) doubles.

## Quotient consequence

The regions (u=0) and (u=P) are the same unlabeled C3 composite. Therefore a resolver coupling that respects strand permutation cannot supply a bulk free-energy difference between them.

A localized perturbation can create a slip–antislip pair only by depositing at least
[
oxed{E_{m pair}=2E_{m slip}}.
]
Once separated beyond their compact supports, the hard-gate model gives no force between them. A smoothed interface will generally restore short-range tails and permit annihilation.

A branch-selective volume gain (P	au L), and hence
[
L_c=rac{2E_{m slip}}{P	au},
]
exists only if the perturbation distinguishes persistent strand labels. That explicitly breaks the permutation quotient and is a different carrier/readout architecture.

## Finite-slab collision check

Run 104 gives
[
M_4=
2pisqrt2,arepsilon^{7/2}K_{m inc}^{-1/2}J_{m slab}(h/arepsilon)
]
and a thickness/core inverse fold at
[
h/arepsilonapprox0.3686624695.
]

That fold can mimic abrupt reconstructed-parameter switching. A pure C3 phase slip should alter the phase/contact channel while leaving the span (R=arepsilon+h) and bulk (M_4) unchanged to leading order. A simultaneous branch jump in reconstructed ((h,arepsilon)) is therefore a readout-fold warning, not phase-slip evidence.

## Source fact → inference → conjecture

**Source fact:** the old archive explicitly says “domain wall transition” is undefined without a basic observable. The finite-slab packet proves a separate readout inverse can fold.

**Derived result:** conditional on the hard contact-overlap potential and a longitudinal stiffness (K), the C3 defect has exact compact support and the energy above.

**Sandbox conjecture:** resolver-driven “snaps” could be compact phase-slip pairs, but only a strand-resolving intervention can stabilize a finite converted domain.

## Failure conditions

- (J<0): the C3 registry is unstable rather than pinned.
- No longitudinal stiffness (K): no finite defect energy or width.
- Smooth contact law: the compact support is replaced by tails; the formulas above cease to be exact.
- Persistent strand identity: (usim u+2pi/3) is invalid.
- Bulk radius or slab thickness changes across the event: the defect is not a pure phase slip.
- An observed discontinuity lying near the finite-slab inverse fold may be a reconstruction artifact.

## Solver test

Implement both the phase field and exact slab readout. Inject a localized energy pulse and measure:

1. pair-creation threshold (2E_{m slip});
2. compact width (L_{m slip}proptosqrt{K/J});
3. unchanged (R) and (M_4) for a pure slip;
4. convergence from compact support to short tails as the contact gate is smoothed;
5. loss of branch stabilization when the readout is permutation invariant.

This is a mechanics/readout discriminator, not an empirical particle prediction.
