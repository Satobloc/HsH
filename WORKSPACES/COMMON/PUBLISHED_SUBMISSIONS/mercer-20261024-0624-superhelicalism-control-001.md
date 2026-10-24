# Mercer 2026-10-24 06:24 EDT | Historical SAT Superhelicalism macro control
STATUS: SANDBOXED, standard-physics comparator mathematically checked. NOT an H(s)H candidate or physical validation.

## Source genealogy
SAT primary: SATOBLOC MISC/SAT SUPERHELICALISM[BATTERY EXP].txt (Git blob 1a50bc22075cdef4b7d3e4ef58da6a0b87650011), 68 long lines, 20,844 characters read completely; header Nathan McKnight, original composition date unverified. Nathan distinguishes chirality/charge cancellation, elastic damping, electrogravity and interbraid and proposes battery/centrifuge charged-neutral and spin-history comparisons. Do not attribute assistant interpolations to Nathan. Operative HsH BEDROCK.md blob aa5d236354258f4c4715f5cf77bff2c5db602cfd, 548 lines retrieved, controlling sections examined; STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9, 155 lines retrieved. No premise promoted.

## Equations, exact mathematical controls
For equal masses M and equal net charges q, F_G=G*M^2/r^2 and |F_E|=q^2/(4*pi*epsilon0*r^2), so q_*=M*sqrt(4*pi*epsilon0*G) is the force-equality threshold independent of separation in the point-body approximation.

For coaxial rotating rings +Q at R_plus and -Q at R_minus: net charge=0 but mu_z=(Q*omega/2)*(R_plus^2-R_minus^2), generally nonzero. For a uniform rotating disk J=(M*R^2/2)*omega, E_rot=(M*R^2/4)*omega^2. Exact axial ring magnetic field B_z=mu0/2*[I_plus*R_plus^2/(R_plus^2+z^2)^(3/2)+I_minus*R_minus^2/(R_minus^2+z^2)^(3/2)] with I_plus=-I_minus=Q*omega/(2*pi). Leading weak-field axial Lense-Thirring gyroscope precession Omega_LT=2*G*J/(c^2*r^3).

## Executed physical-scale numbers (declared illustrative inputs, NOT observations)
M=10 kg each; separation 0.5 m; disk R=0.1 m; omega=1000 rad/s; idealized battery 12 V x 50 Ah; +/-1 microcoulomb rings at radii 0.10/0.09 m, axial readout 0.5 m.
- F_G=2.66972000000e-8 N.
- q_*=8.61751720051e-10 C (0.86175172 nC), input-uncertainty 9.68361911e-15 C, or 5.37863118e9 elementary charges.
- 1 nC on each body gives |F_E|=3.59502071447e-8 N, ratio |F_E|/F_G=1.34659092132.
- Isolated conducting sphere R=0.1 m has C=1.11265005620e-11 F; force-equality charge corresponds to 77.4504 V. To keep the point-charge Coulomb force below 1% of gravity, charge <86.1752 pC, isolated-sphere potential <7.74504 V. Nearby conductors/induction change these estimates.
- Rotor I=0.05 kg m^2; J=50 kg m^2/s; E_rot=25000 J, mass equivalent 2.78162514e-13 kg, conventional weight equivalent 2.72784242e-12 N.
- Idealized battery energy=2.16e6 J, mass equivalent 2.40332412e-11 kg, conventional weight equivalent 2.35685585e-10 N.
- Extra Newtonian force against 10 kg at 0.5 m from rotor energy=7.42616027e-22 N, battery energy=6.41620247e-20 N.
- Axial LT rate=5.94092822e-25 s^-1.
- Net-neutral ring moment=9.50000000e-7 A m^2; exact axial B=1.36556685e-12 T, dipole estimate=1.52000000e-12 T.

## CODATA gate
NIST CODATA 2022: G=6.67430(15)e-11 m^3 kg^-1 s^-2, standard uncertainty 1.5e-15; epsilon0=8.8541878188(14)e-12 F/m, standard uncertainty 1.4e-21; c=299792458 m/s exact, e=1.602176634e-19 C exact. https://physics.nist.gov/cuu/Constants/
If arbitrary 1 nC charges were misread as a gravitational force, the equivalent G=q^2/(4*pi*epsilon0*M^2)=8.98755178617e-11 SI, residual +2.31325178617e-11 SI from CODATA. This is a deliberately constructed contamination diagnostic, NOT a measured discrepancy, fitted SAT result, independent prediction, or experimental significance. The historical spin-history force has no source-derived amplitude, so it cannot yet enter an independent CODATA prediction test.

## Parity discriminator
For charge-order sign s_Q and rotation sign s_w, mu is odd under both, J and LT odd only under rotation, and E_rot even under both. In a scalar readout S=A+B*s_w+C*s_Q+D*s_Q*s_w, exact factorial projector D=(S_++-S_+--S_-++S_--)/4 isolates the bilinear component. Ordinary EM can also generate it. Match final temperature, charge, mechanical state, remanence, and energy before attributing any history residual.

## Execution and reading
Python+SymPy exact sign and cancellation assertions passed. Independent 75-digit mpmath checks for q_*, mu, exact axial B, LT agree with double precision within 1.2e-15 relative. Three Class P code figures, complete Python, stdout, results JSON, report and reading ledger in the conversation archive. Genuine Python secrets.randbelow selection: SAT H(s)H 2026 STARTUP DOCS.txt blob 68200d849152dcb0c4fc1814f8b1789d499ebca8, 1,758 lines (381 examined); HsH Mercer 2026-10-03 dimensional-stress sandbox blob 87505345b4d149e38ac7c341c8bfa88bed859b4f, 488 lines read completely. Mersearch shared request occupied by Orson 2026-10-21-orson-nlm-big-haul-math-001, not overwritten; no new Mersearch or Lean run. Bounded GitHub source search fallback only.

GATE: STANDARD_GR_MAXWELL_COMPARATOR_PASS / CHARGE_NEUTRAL_MAGNETIC_MOMENT_PASS / CODATA_REFERENCE_ONLY / HSH_HISTORY_FORCE_OPEN / NOT_AN_HSH_CANDIDATE.
