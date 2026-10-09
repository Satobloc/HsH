# MK172 | Hopf linkage, helical worldtubes and finite time-sheet thickness
**Morrow/Kestrel | SANDBOX | 2026-10-09**

## Result
A timelike helical worldline is open in four-dimensional spacetime but may have a closed three-dimensional *full-history spatial image*. Two such complete spatial images can be Hopf-linked without the underlying future-directed 4D histories carrying a protected linking charge. At fixed time a 1D centerline intersects a 3D hypersurface in 0D points; a full 4D finite-core worldtube (3D normal fibers) intersects it in a 3D volume, with 2D boundary. This typing prevents circular-looking projections from being confused with local closed particle intersections.

For a circular centerline of radius R and angular frequency omega per fourth-length coordinate T=ct, thicken its spatial trace by a ball radius a<R, and collect the union through a finite full time-sheet window DeltaT. Once the arc approaches one revolution, a projected tunnel forms when endpoint support balls first meet. The exact threshold in this spatial-ball model is

DeltaT_crit = [2*pi - 2*asin(a/R)]/abs(omega).

With beta=R*abs(omega)<1, a necessary causal lower bound is DeltaT_crit > R*[2*pi-2*asin(a/R)]. This is a **system-dependent geometric threshold**, not a universal measurement of timesheet thickness. Real finite normal cores differ from assumed spatial balls.

## Numerical fixture
Worldlines: X1(T)=(T,2*cos(.2T),2*sin(.2T),0), X2(T)=(T,2+cos(.2T),0,sin(.2T)). Timelike speeds 0.4c and 0.2c. Their full-history spatial images have Gauss linking number -1, confirmed by quadrature at 60/120/240/480 samples. Minimum spatial centerline separation 1, so both a=0.12 spatial cores remain disjoint, gap >=0.76. A full spatial turn spans DeltaT=31.415926536 (length units). The circular first image develops a tunnel at DeltaT=30.815565951, or 98.088993% of a turn; the second at 30.213027712, or 96.171054%. Independently buffered spatial curves have 0 holes just below and 1 hole just above the first threshold.

A Euclidean R4 normal-ball tube has local fixed-time longitudinal cross-section semiaxis a*sqrt(1+beta^2); a Minkowski rest-frame core has a*sqrt(1-beta^2). These are distinct carrier specifications; applying the closure equation to either is only a local approximation unless the full curved geometry is resolved.

## Historical thickness recovered
Old SAT primary: EARLY LOGGED/2025-10-24_00 SAT O.txt, read completely, calls a one-Planck-length-thick *time wavefront* a tentative assumption. SATOBLOC MISC/NEOSAT 2025.txt, opening development dialogue and relevant later slab statements substantially read: Nathan describes a propagating time field sweeping a slab of given time thickness, explicitly distinguishing point intersection at one instant from accumulated intersection over a sweep. SAT METRICS — Basic.txt, read complete: 2e-21 m is the *historical intrinsic filament thickness*, **not** necessarily the time-sheet thickness. Dim.txt, read substantially: the old 2e-21 m numerical estimate assumes a 1e-21 m lattice spacing, so this is not a parameter-free numerical derivation.

Current HsH primary: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-25_RUN_110_ASYMMETRIC_CORE_INCIDENCE_BIFURCATION.md, read completely; 2026-09-26_RUN_136_CROSSOVER_INVERSE_MAP_IDENTIFIABILITY.md, read completely. They separate normal core support from resolving-slab width. Local tangency span sees rho_core + h_sheet at leading order; a separate independent observable is needed to disentangle them. The predecessor Packet 001 has a quarantine warning and was not used as theory authority. Argus XW-014 and XW-015 are secondary historical provenance aids, not physics premises.

## Failure and next discriminator
A global Hopf director n:S3->S2 whose fibers are linked must itself be derived from admissible H(s)H fields and transport, not supplied by juxtaposing two helical drawings. Future-directed time normal limited to a contractible hemisphere obstructs degree-one construction in that field. The new exact ring-closure transition is topological **in the readout set** only, not a new worldline invariant. Compare one independently determined time-slab width against BOTH localized cross-section spans and projected first-tunnel onset at varied omega, R, and carrier shapes; if impossible, the assumed resolving map fails.

Portable full derivation, exact source coverage, Python tests, three Class-P figures and numerical results are provided in the originating conversation's MK172 research bundle. Mersearch stable release guidance was read; a shared bridge request from another worker was not overwritten. Narrow known-file archive lookups substituted; no corpus-wide completeness or novelty claim. No historical constants were used as calibration targets.