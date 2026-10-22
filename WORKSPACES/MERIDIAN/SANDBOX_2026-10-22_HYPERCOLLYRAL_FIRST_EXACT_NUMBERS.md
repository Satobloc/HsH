# Hypercollyral: first exact 4D toroidal-hypersurface numbers
2026-10-22, SANDBOX / geometry fixture, not adopted physical cosmology.
Source context: HsH `WORKSPACES/MERIDIAN/SANDBOX_2026-10-22_HYPERCOLLYRAL_NOMENCLATURE.md`, `WORKSPACES/MERIDIAN/SANDBOX_2026-10-20_CRULLER_FIRST_GLOBAL_TOPOLOGY.md`; shared Mersearch slot still Orson-owned. New math executed in Python and verified numeric integration, `/mnt/data/hypercollyral_gate.py` locally (not committed); chart `/mnt/data/hypercollyral_gate.png` locally.

## Native 4D model (explicit candidate only)
Define solid hypercollyral region in R4, R>r>0:
`B={(x1,x2,x3,x4) : (sqrt(x1^2+x2^2)-R)^2+x3^2+x4^2 <= r^2}`. Its boundary H is 3D and topologically S1 x S2, volume region S1 x B3. Parametrize H with angles phi, theta, psi:
`X=((R+r cos theta) cos phi, (R+r cos theta) sin phi, r sin theta cos psi, r sin theta sin psi)`.
`ds_H^2 = r^2 dtheta^2+(R+r cos theta)^2 dphi^2+r^2 sin^2 theta dpsi^2`.
`Area_3(H)=8 pi^2 R r^2`; `Vol_4(B)=8 pi^2 R r^3/3`. Numerically integrated area independently.

At R/r=3 with r=1: area_3=236.8705056261446; vol_4=78.95683520871486; C_outer=2pi(R+r)=25.132741228718345; C_inner=2pi(R-r)=12.566370614359172; C_equator=2pi R=18.84955592153876; outer/inner ratio=2. This dimensionless 3:1 example is NOT a cosmological choice.

## Winding/length gate
For longitudinal wrapping degree p of ANY smooth closed path on H, `L >= 2 pi (R-r)|p|`, from ds >= (R+r cos theta)|dphi| >= (R-r)|dphi|. For a fixed theta (constant psi), equality is `L_p(theta)=2pi |p|(R+r cos theta)`. At R/r=3, two wraps along inner latitude have length 25.132741228718345, exactly equal to one OUTER wrap length. Two midlatitude wraps have length 37.69911184307752. For fixed path length L, `|p| <= floor(L/(2pi(R-r)))` is a necessary bound, not a guaranteed existence or stability statement. Conversely L>C_outer does NOT require p>=2: extra length may go into meridional winding, bending/shelf-cocking, etc. A continuous homotopy of a closed surface curve cannot change p without changing closure/class/topology; stretching alone does not flip the integer.

The earlier low-dimensional 2D torus calculation cannot be uncritically imported. H is 3D; intersecting H transversely with a 3D timesheet gives 2D, while intersecting finite 4D bulk B with such a sheet gives 3D material region. The globally sliced solid hypercollyral bulk may be a solid torus, not a 3-ball; a local wrinkle footprint may be 3-ball-shaped, but it requires a defined localized 4D wrinkle.

## Antimatter gate
Neither L>C_outer nor p=2 alone forces negative oriented time crossings, charge conjugation, or positron behavior. Need actual resolving time/phase normal and physical charge/statistics map. Track sign of n·T at transverse intersections. If T is an actual global time function and material paths future-timelike, then time-monotonicity prohibits reversing crossing signs along the SAME future-directed history. A periodic angular phase is not automatically a causal time. These must be tested, not asserted.

No free stiffness, surface physics, photon coupling, number of timesheets, or particle mass derived.
