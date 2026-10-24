# Calder :24 | 2026-10-24 12:24 UTC | Three-strand finite-core / Maxwell / trace gate

**SANDBOXED.** Internal mathematical checks pass. Not an H(s)H candidate or physical prediction. No BEDROCK promotion.

## Source recovery and correction-first
Historical SAT: Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT REDISCOVERY.txt, blob e7384f09394c7e477ef9db13c550163edfd52708, lines 1–180 read; original compilation date not established. Its Nathan-authored opening requires reconstructing known Minkowski kinematics before extrapolation; later assistant text is not Nathan's authority.
Historical SAT F4: 2026/SAT MATH — BACKBONE.txt, blob 1854995be3311f565739f2be64269cbb0385a82f, lines 165–215; assistant-compiled phase/current formulation, with superseded integer-writhe assertions.
Current H(s)H: Meridian's 2026-09-27 coupled filament/timesheet spec, blob b0f203bcfb120402e4537f49401209cfc402c38f, lines 1–220 read. Original trace equation Omega=k*v_sheet-omega retained.
Later correction: Morrow/Kestrel MK148, 2026-10-07, blob a638a27c397780c13b369d6f5a75ec8195373c93: open braids do not automatically have closed-ribbon linking invariants. Orson 2026-10-23 F4 tensor audit already corrected antisymmetric-strain interpretation, not duplicated here.
BEDROCK 548 lines and STATE_OF_THE_THEORY 155 lines retrieved; controlling sections read. Mersearch shared request occupied by Orson; no new Mersearch run or shared-state write. Python secrets.choice actually selected SAT REDISCOVERY and Meridian spec; selected extents above, neither read fully.

## Exact finite-core spatial comparator
Define three spatial material centerlines X_j(s)=(R cos(ks+2*pi*j/3),R sin(ks+2*pi*j/3),s), j=0,1,2. These are NOT asserted Kerr/ER worldtubes. Their global pairwise minimum is

d_min² = min_t [2 R² (1-cos(2*pi/3+k*t))+t²],

NOT merely 3R² from comparing equal s. A sufficient mutual core clearance is 2a<d_min. For R=0.1 m, a=0.012 m, kR=4: d_min=0.0507946447 m, so a_max=0.0253973224 m. Self-embedding and physical stability require further tests.

## Neutrality cannot eliminate the local dipole in this geometry
For real axial line-charge weights w_j, impose sum w_j=0 and sum w_j exp(2*pi*i*j/3)=0. The real 3x3 coefficient matrix has determinant 3*sqrt(3)/2 !=0, so all w_j must vanish. The example (1,-2,1) has zero total charge but transverse complex dipole magnitude 3*lambda*R. This does NOT contradict Aster's earlier three concentric rings: different radii permit cancellations that three equally spaced equal-radius points do not.

## Exact axial Maxwell field and independent check
For infinitely long STATIC helically distributed line charges of signed charge lambda*w_j per axial meter, the Coulomb integral gives

E_x+i E_y = -lambda*k*K_1(kR)/(2*pi*epsilon0) * exp(i*k*s0) * sum_j w_j exp(2*pi*i*j/3).

Identity independently quadrature-checked:
integral_-inf^inf cos(k*t)/(R²+t²)^(3/2) dt = 2*k*K_1(kR)/R.

For weights (1,-2,1), R=0.1 m, lambda=1e-9 C/m, epsilon0=8.8541878188e-12 F/m:

| kR | Axis |E| V/m | E / straight limit | d_min m |
|---:|---:|---:|---:|
|0.25|505.148850|0.936756494|0.171804061|
|0.50|446.620510|0.828220560|0.167033678|
|1.00|324.580344|0.601907230|0.144020602|
|2.00|150.846223|0.279731764|0.093521161|
|4.00|26.9270623|0.0499339955|0.050794645|

All five independent oscillatory quadratures agree with Bessel result to <3e-7 relative. Eleven axial phases pass the exact rotating-vector covariance to <1e-13. Dimensions: [lambda*k/epsilon0]=V/m; kR dimensionless. The field averages to zero as a vector over one pitch but is nonzero locally.

## Readout/material nonuniqueness, cross-sector discriminator
Meridian's existing moving-sheet trace: u_j(s,t)=R exp(i[ks-omega*t+phi_j]), sheet s=v*t, observed Omega=k*v-omega.
Case A: k=10 m^-1, omega=0, v=1 m/s. Material centerlines are static helices with curvature=torsion=5 m^-1.
Case B: k=0, omega=-10 rad/s, v=1 m/s. At each instant, material centerlines are straight with zero curvature/torsion, though they rotate transversely.
Both yield exactly Omega=10 rad/s and identical three-strand moving-sheet traces. A 501-sample numerical comparison gives max trace difference **0.0 m**. Hence one cannot assign case A's static Coulomb source to case B merely because their readout traces agree. Time-dependent Maxwell and Kelvin responses must be calculated from the material source, not the appearance of the trace.

## CODATA 2022
Selected recommended quantity: NIST CODATA 2022 vacuum permittivity epsilon0=8.8541878188(14)e-12 F/m, standard uncertainty 1.4e-21 F/m, https://physics.nist.gov/cgi-bin/cuu/Value?ep0%7Csearch_for=vacuum . Imported input, NOT predicted. If one wrongly interprets the helical field at kR=1 as straight-line electrostatics, inferred epsilon0=epsilon0/[kR*K1(kR)] and residual +5.85603225e-12 F/m. This is a model-form negative control, not a measured residual, fit significance or independent H(s)H prediction.

**Gates:** GEOMETRY/CLEARANCE PASS; NEUTRALITY-DIPOLE OBSTRUCTION PASS (restricted geometry); COULOMB/BESSEL NUMERIC PASS; MATERIAL/TRACE DEGENERACY PASS; CODATA REFERENCE_ONLY; HSH_CANDIDACY NOT ESTABLISHED.

**Handoff to Hale:** recover operative finite-core charge/current support, specify which material configuration carries Maxwell and Kelvin response, and test identical trace versus distinct source dynamics across sectors without adding a fitted law. No Lean execution. Full Python source, results, figures and provenance ledger retained in local reproducibility bundle.
