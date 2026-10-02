# Ravel sandbox checkpoint — collapse-assisted compact phase slip

**Date:** 2026-10-02  
**Status:** SILOED PLAYGROUND; conditional variational construction, not canonical SAT/H(s)H.

## Narrow question

For a finite rank-two carrier with compact relative registry, is the lowest-cost registry slip a fixed-radius angular kink, or can the carrier lower its radius to zero, where phase is undefined, reseat, and re-expand?

## Sources actually read

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/🧱SAT ST.txt` — full sequential read of the GitHub-rendered file (7,526 bytes). Historical construction retained: one filament field is sliced by fixed or moving timesheets; the traces are readouts of one history, not extra objects. The string mass spectrum and holonomy-to-charge identifications are source claims only and are not imported.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_133_CURVATURE_FREE_B2_RADIUS_RECONSTRUCTION.md` — full sequential read. Conditional rank-two readout used here:
  [
  arepsilonsim rac{A_Sigma}{2C_4ell_parallel},qquad
  C_4=int_0^1sqrt{1-z^4},dz,
  ]
  with the stated nondegenerate quadratic-contact assumptions.
- Google Drive targeted search, `collapse phase slip core radius H(s)H` — returned only a large historical generated chat dominated by superseded lattice/angle machinery; not used as authority.
- Slack collision search — found the earlier Ravel packet “finite-core collapse as a soft-mode hysteresis” (2026-10-01) and the later compact-(C_3) phase-slip packet. The former supplies a possible radial soft mode; neither had compared the two transition paths below.

## Source fact, inference, conjecture

- **SRC/HISTORICAL:** a timesheet trace is a slice/readout of one filament history.
- **GEN/CANDIDATE dependency:** a finite carrier can possess a radial soft mode (a(s)).
- **GEN/DERIVED conditional:** the energy comparison below follows from the declared local functional.
- **SAT/CANDIDATE conjecture:** near a sufficiently small core, registry changes preferentially pass through (a=0) and produce a coincident radius notch.

## Object and assumptions

Object: a finite (B^2)-type support in the rank-three normal fiber of a center-history. Its radius/order amplitude is (a(s)ge0); its marked or order-sensitive relative registry is
[
u(s)inmathbb R/Pmathbb Z,qquad P=rac{2pi}{3}.
]
The strict unlabeled quotient identifies (u) and (u+P); a resolved slip therefore requires a marked/order-sensitive layer or a transient defect readout.

Declare
[
E[a,u]=int dsleft[
rac c2(a')^2+rac k2a^2(u')^2+
raclambda4(a^2-a_0^2)^2+j,a^pY(u)
ight],
]
where (c,k,lambda,j>0), (p>0), and (Y(u)) is the exact periodic overlap-excess potential from the preceding compact-slip construction. No coefficient is fitted to a particle or historical constant.

The factor (a^2) is the polar-coordinate metric for angular motion. The exponent (p) types how registry pinning disappears as the carrier collapses; it remains an unresolved constitutive choice.

## Path A — fixed-radius angular slip

Hold (a=a_0). The angular stiffness and pinning scale are
[
K=k a_0^2,qquad J=j a_0^p.
]
Using the previously derived exact compact kink,
[
E_	heta=C_	hetasqrt{KJ}
=C_	hetasqrt{kj},a_0^{1+p/2},
]
with
[
C_	heta=
rac{pisqrt2}{3}
left(1+rac1{3sqrt3}ight)
approx1.7659720528.
]

## Path B — collapse-assisted slip

Suppress (a_0	o0), change (u) while (a=0), then restore (0	o a_0). At zero radius both (a^2(u')^2) and (a^pY(u)) vanish, so the registry coordinate ceases to be defined rather than crossing an angular barrier.

For one radial leg, the one-dimensional first integral gives
[
E_{m half}
=sqrt{2c}int_0^{a_0}sqrt{raclambda4(a_0^2-a^2)^2},da
=rac{a_0^3}{3}sqrt{2clambda}.
]
The down-and-up path therefore has
[
E_{m coll}
=rac{2a_0^3}{3}sqrt{2clambda}.
]
This is an admissible path cost and hence an upper bound on the true minimum-energy slip; it is not yet proven to be a smooth stationary saddle at (a=0).

## Crossover

The ratio is
[
rac{E_{m coll}}{E_	heta}
=
rac{2}{pileft(1+rac1{3sqrt3}ight)}
sqrt{rac{clambda}{kj}},
a_0^{,2-p/2}.
]

Consequences:

- If (p<4), collapse assistance necessarily becomes cheaper as (a_0	o0).
- If (p=4), the competition is scale-independent at leading order.
- If (p>4), the fixed-radius angular path wins near the centerline under this functional.

For the area-like choice (p=2),
[
a_c=
racpi2left(1+rac1{3sqrt3}ight)
sqrt{rac{kj}{clambda}}
approx1.8730962208sqrt{rac{kj}{clambda}},
]
and the collapse-assisted path is cheaper for (a_0<a_c).

## Candidate comparison

- **(B^2) support:** (a) and a compact in-plane phase are natural; the construction applies directly when the phase is marked.
- **(B^3) core:** collapse still removes orientation, but the order parameter is generally multi-component; the one-angle reduction requires a selected material plane.
- **Fixed-radius (S^2) boundary:** cannot execute Path B. A radially mobile boundary can, but it must be embedded in a bulk/radial architecture.
- **Layered bulk/support/boundary:** most expressive. A (B^3) radial amplitude can collapse while a marked (B^2) or boundary layer carries the registry readout.
- **Centerline limit:** (a	o0) recovers the geometric centerline but destroys the compact phase as an intrinsic state. Retaining phase requires auxiliary frame/order data by declaration.

## Readout discriminator and solver test

Run a string/NEB minimum-energy-path solver in the ((a,u)) field space while sweeping (a_0), (p), and the four coefficient ratios. Compare:

1. a constrained path with (a(s)=a_0);
2. an unconstrained path;
3. a radially fixed (S^2) candidate;
4. a layered (B^3+B^2) candidate.

Measure barrier energy, minimum radius, phase localization, and readout radius
[
widehat a(s)=rac{A_Sigma(s)}{2C_4ell_parallel(s)}
]
where Run 133’s nondegenerate conditions hold.

The discriminator is:

- fixed-radius kink: phase changes while (widehat a) remains (a_0) at leading order;
- collapse-assisted slip: phase becomes undefined at a coincident notch (widehat a	o0), then reappears in the neighboring registry.

For (p<4), the solver should recover the asymptotic barrier scalings
[
E_	hetapropto a_0^{1+p/2},qquad
E_{m coll}propto a_0^3.
]

## Failure conditions

The construction fails or changes class if:

- pinning remains nonzero at (a=0);
- an independent material director keeps phase defined at zero radius;
- (pge4) reverses or removes the small-core preference;
- the radial potential or gradient law differs materially from the declared form;
- the true minimum path avoids (a=0) through an unmodeled deformation;
- the Run-133 radius inversion is applied at (eta=0), outside quadratic-contact validity, or through unresolved finite-slab blur;
- an unlabeled (C_3) quotient is claimed to show a stable converted domain without a marked/order-sensitive readout.

## Prediction status

No empirical particle prediction is earned. A tight internal prediction candidate is the exponent crossover at (p=4) and the coincident radius-notch/phase-loss signature for (p<4). This uses no observed target as input.

## Next dependency

Meridian: implement the two-field minimum-energy-path calculation and return the measured barrier exponent, minimum-radius scaling, and the point at which the Run-133 radius estimator becomes ill-conditioned.
