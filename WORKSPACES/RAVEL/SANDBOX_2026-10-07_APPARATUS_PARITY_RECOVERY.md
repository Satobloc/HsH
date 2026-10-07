# Ravel sandbox 2026-10-07 — recover apparatus, isolate spin/charge parity

Status: GEN/CANDIDATE. This is a fresh apparatus-focused reinterpretation, not a detection or theory endorsement.

## Source ledger
- Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT THEORY — Superhelicalism.txt; blob 2144eb505a32571cb253b820dacdd62ca90894f7; complete 6,300-character UTF-8 read. Its battery/centrifuge, counterrotating spinners, coil winder, nested spinners, gravimetric comparisons, and turbine comparisons were examined as candidate apparatus, not discarded because of speculative explanation.
- Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/WHIRLY.txt; blob a1314c6f349d8d7ed99189797276de28a3fb3536; complete 16,849-character read. Its frame-rotation and bending-stiffness terms are source proposals, not verified laws; constants, mass formulae, and claimed predictions were not used.
- Controlling onboarding: WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md and REFERENCE_DESK/README.md; source/reference navigation includes HSH_RESOURCES War Room DECLARATION, toolkit index, TOOL_CHEST, and preference BOOT.

## Recovered apparatus and independent construction
The historical proposal explicitly separates: battery voltage/charge alignment, rotation sense, co-/counter-rotation, separation, rotational history, and scale readout. Treat these as independently controllable variables. Use a dual counterrotating charged-ring rig with symmetric geometry, rather than interpret a scale change directly as gravity.

For ring j, angular momentum L_j=I_j omega_j, and magnetic moment m_j=Q_j omega_j R_j^2/2. With equal inertias, omega_1=-omega_2 makes total mechanical angular momentum zero; with Q_1=-Q_2, the magnetic moments add instead of canceling. The complementary Q_1=Q_2, omega_1=-omega_2 configuration cancels both mechanical angular momentum and magnetic moment. This is a standard-EM null/control pair, not an H(s)H prediction.

For two distant coaxial dipoles m_a,m_b separated by z >> R, U_mag approximately -mu0*m_a*m_b/(2*pi*z^3), and axial force magnitude 3*mu0*|m_a*m_b|/(2*pi*z^4). Example Q=1 microcoulomb, R=0.1m, |omega|=100 rad/s, z=0.3m gives |m|=5e-7 A*m^2 per ring and dipole-pair force 1.85e-17 N, equivalent to 1.89e-18 kg weight; this is a far-field estimate and z/R=3 is not safely asymptotic. Exact Biot-Savart plus finite ring mechanics needed for apparatus predictions.

## New discriminator
Define a measured scale/force channel Y(Q1,Q2,omega1,omega2,t), with magnetic field and electric leakage characterized independently. Decompose factorially into parity sectors under global charge inversion C and global rotation reversal W. Ordinary magnetic dipole-dipole force is even under C and even under W (both dipoles reverse); charge-rotation magnetic cross-talk to fixed lab fields may be odd under C and W jointly. A purported history-dependent mechanical force must survive swapping the chronological spin-up sequence while ending at identical instantaneous Q, omega, temperature, magnetic environment, and support loading. Otherwise the historical 'future/past winding' language has no operational content.

Crucial confound: rotating charge creates magnetic field, and centrifuges generate bearing loads, air motion, thermal drift, induced currents, and electrostatic forces. Counterrotation alone is not sufficient to remove these. Measure gravimetric force only after an explicitly characterized settling time, with blind randomized trial order and sham battery loading. Do not assume any nonstandard signal size.

## Failure gates and next solver
1. Compute exact finite-ring electromagnetic force (elliptic-integral Biot-Savart or direct quadrature), with realistic shields and supports.
2. Couple a finite-core torsional rod to the same drive and compare genuine internal history relaxation against thermal/bearing transients, fitting the latter as nuisance models.
3. Pre-register an eight-condition charge/rotation factorial plus time-order swap. Reject an H(s)H-specific interpretation if standard EM/mechanics explains the residual within uncertainty, or if history reversal at matched instantaneous state produces no repeatable residual.
4. Keep distinct hypotheses: standard EM response; apparatus memory/relaxation; speculative H(s)H transport history. No historical constants or particle masses used as fit targets.

New source-handling rule: speculative interpretation does not invalidate an apparatus. Preserve the actual proposed geometry and test it independently.
