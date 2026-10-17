# Mercer | Oblate Kerr-shell *analogue* capacity gate | 2026-10-10

**Status:** SANDBOX / local mathematical fixture; no physical or canonical theory claim. **Authority:** Nathan Oct 9 SAT-first source and quarantine rule. No Hypothesis H or directly Schreiber-authored material accessed.

## Primary sources actually read
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT ALL TOGETHER SYNTHESIS.txt` (37,220 chars fetched; first ~25,000 read substantially). Recovered the July 3 SAT minimal worldline/timesheet grammar, reciprocal sheet-deformation proposal, straight aligned vacuum reference, and preference for geometrically constrained encoding.
- `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SPEC_COUPLED_FILAMENT_TIMESHEET_STRING_BRIDGE_V01.md.txt` (23,331 chars read complete). Meridian Sept 27 sandbox specification: finite-core intersection, timesheet response, and explicit caution that ring/string-like intersections do not establish literal string/particle physics.
- `HsH/BEDROCK.md`, `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, Oct 9 Nathan-direct rule, and role-relevant Common controls.
- Reference familiarity: Common `REFERENCE_DESK/README.md`, BigBook index + document CSV, HSH_RESOURCES War Room declaration and its 39 detected link routes (overview only), Toolkit source index, Tool Chest, digestion plan, human index, Nathan preferences BOOT, and KERR 14-record catalog shard. **No individual Kerr paper deep-read or corpus-wide search claimed.** The source catalog is navigation, not authority.

## Independent fixture and notation
All symbols **LOCAL:MERCER-OBLATE-20261010**, no shared namespace promotion. Let an idealized equipotential oblate contact shell on a three-dimensional timesheet satisfy
`(x²+y²)/a²+z²/b²=1`, `0<b<=a`, `f=sqrt(a²-b²)`. For the *trial* harmonic scalar response `u=-grad V`, `laplacian V=0` outside, define signed flux `Q=surface_integral(u dot dA)`. This is **not** an exact Kerr geometry, traversable ER throat, or physical charge.

The ellipsoidal exterior solution yields geometric capacity (length)
`C_geo = Q/V_surface = 4*pi*f/atan(f/b)`,
with `C_geo(a,a)=4*pi*a` and `C_geo(a,0+)=8*a`.

At fixed `Q`, on the symmetry axis `z>=b`:
`V_axis(z) = Q*atan(f/z)/(4*pi*f)`,
`u_z(z) = Q/[4*pi*(z²+f²)]`.
Thus the exact ratio to a point-source inverse-square response is
`u_z/u_point = z²/(z²+f²)`.
The large-distance angular expansion is
`V(r,theta)=(Q/4*pi)[1/r - f² P_2(cos(theta))/(3*r³)+O(f⁴/r⁵)]`.
The leading shape correction to the force/field is quadrupolar `r^-4`, not a new `r^-2` source. Orientation averaging cancels this term at leading order.

Surface normal flux density is
`u_n(theta)=Q/[4*pi*a²*b*sqrt(sin²(theta)/a²+cos²(theta)/b²)]`;
its surface integral equals `Q` exactly, with increasingly concentrated rim loading for `b/a -> 0`.

For two independent equipotential exterior ports joined by an abstract 1D neck, a **lumped approximation only** gives
`C_pair=[2/C_geo + L/A_neck]^-1`,
`Q=C_pair*Delta V`. It reproduces the previous spherical toy fixture for `b=a, A_neck=4*pi*a²`. It does **not** solve a globally joined 3D Laplace/ER problem.

## Numerical verification (scripted)
Numerically integrate `I(0)=integral_0^infty ds/[(a²+s)*sqrt(b²+s)]`, compare `8*pi/I(0)` with closed-form `C_geo`; independently integrate `u_n` over the oblate shell. Maximum relative capacity discrepancy `3.42e-15`; maximum flux discrepancy `1.11e-16` for tested shapes.

| b/a | C_geo/(4*pi*a) | axial field / point field at z=2a | at z=10a |
|---:|---:|---:|---:|
| 1.00 | 1.000000 | 1.000000 | 1.000000 |
| 0.50 | 0.826993 | 0.842105 | 0.992556 |
| 0.10 | 0.676573 | 0.801603 | 0.990197 |
| 0.02 | 0.644702 | 0.800064 | 0.990103 |

## Discriminator and failure conditions
1. **Geometry cannot generate flux**: if equal boundary potentials and no conserved source/sector, `Q=0` for every oblate shape. A passive shell cannot generate charge.
2. Two oppositely oriented mouths in the same accessible region remain dipolar at large distances; individual oblate quadrupoles do not fix this topology.
3. An oriented, real oblate electrostatic shell would produce orientation-dependent `r^-4` corrections. Without a specified suppression/averaging mechanism it must face empirical constraints.
4. An actual Kerr singular support need not admit equipotential oblate material-shell boundary conditions. Static Laplace response is not Maxwell dynamics and has no causal propagation by itself.

**Next test:** solve the coupled finite-volume/finite-element exterior + finite-neck boundary problem with continuity of flux and potential, sweep `b/a, L/a`, and compare fixed-potential, fixed-flux, impermeable and dynamical contact regimes. Only after identifying a genuine SAT/H(s)H source of signed flux should one consider physical charge.

**Provenance:** old SAT geometry → Sept 30 HsH finite-core sandbox → Mercer independent oblate Laplace calculation → HSH_RESOURCES KERR catalog triage only. No external theory import.
