# Elias Kern | Calculation Relay :00 | 2026-10-25T23Z | M87* Kerr-limit audit

Status: STANDARD_SCHWARZSCHILD_CONTROL_CHECKED; REAL_EHT_RING_COMPARED_WITH_DIFFERENT_OBSERVABLE; HSH_FINITE_CORE_UNRESOLVED; NOT_HSH_CANDIDATE; NO_BEDROCK_PROMOTION.

## Real system and independent data

M87* stellar kinematics: Gebhardt et al., ApJ 729, 119 (2011), M_star=(6.6 +/- 0.4)e9 solar masses at adopted D=17.9 Mpc (distance treated as fixed conditional input, not independently measured here).
Gas-dynamical comparator: Walsh et al. 2013, as reported by EHT Paper VI (2019), M_gas=3.5(-0.7,+0.9)e9 solar masses at same 17.9 Mpc.
EHT: April 2017 1.3-mm VLBI observations, published April 10 2019, bright emission-ring diameter 42 +/- 3 microarcseconds (Paper I, ApJL 875 L1).
Sources: https://doi.org/10.3847/2041-8213/ab0ec7 ; https://doi.org/10.3847/2041-8213/ab1141 ; https://arxiv.org/abs/1101.1954 .
Unit convention: IAU 2015 nominal solar GM = 1.3271244e20 m^3/s^2, an EXACT nominal conversion, not an independently measured present-Sun value; IAU 2012 AU = 149597870700 m exact, pc=(648000/pi) AU. CODATA 2022 G=(6.67430 +/- 0.00015)e-11 SI is used for Planck conversions ONLY, and cancels from the physical GM/D angular calculation.

## Archival recovery and corrected status

Primary SAT archive: HsH AHA TOPOLOGY.txt, Git blob 5283ceb8d06109061543711ebe7c46954efe7ede, 2634 lines, 163731 characters, mixed NATHAN/CLAUDE dialogue with unverified original message dates. Assistant section beginning "The exact mechanism" gives Kerr horizon polynomial Delta=r^2-2Mr+a^2, roots r_+/-=M +/- sqrt(M^2-a^2), and Kerr-Newman extension Delta=r^2-2Mr+a^2+Q^2. The polynomial is valid in geometric units; "exactly two roots" must be qualified as at most two REAL roots, one repeated at extremality and zero real roots when overextreme. Elsewhere in that document an assistant says the electron-like Kerr-Newman ergosphere persists without horizon. That claim is false for actual electron charge and spin.
Corrective operative source: HsH/WORKSPACES/RAVEL/KERR_PARTICLE_REGIME_COLLISION_2026-09-16.md, blob 8bc65c97e88afd9c7e6add7386574c0eea3492b9, 7733 chars. Shows electron Kerr-Newman stationary-limit discriminant negative everywhere; electron-like geometry has neither classical horizon nor ergosurface. Does not rule out a separately derived H(s)H finite-core worldvolume. Historical assistant claims are not automatically Nathan Direct.
The same standard Kerr/Schwarzschild family is now tested at an ACTUAL black-hole-scale source. Spin parameter of M87* is not independently fixed by these inputs, so use the Schwarzschild a=0 exact limiting control, not a claim M87* is nonspinning.
Random substantial unrelated reading: SAT archive HsH COSMOTOPOLOGY.txt, blob 9f42b96adfa1cb9b310ad8d89843b93ae0379922, 2898 lines / 98867 characters fetched; includes torus/Klein inversion, closed timelike curves, particle-topology discussions, and archive navigation. Those claims are NOT inserted into the observational calculation.
Controls read: HsH root BEDROCK.md blob 4cabda482c48c217614b868a2138409275df9bf7, 563 lines / 86946 chars; subordinate STATE_OF_THE_THEORY.md blob b5958a1056c2541f00ab4f3477d8acc32426cfe9, 155 lines / 11012 chars. ND-2026-10-18-02/03, ND-2026-10-25-01 and coordinate-artifact safeguards applied.
Mersearch lanes 1-4 all had existing requests; no lane overwritten and no Mersearch run claimed. Bounded GitHub search only, so genealogy is not exhaustive.

## Exact control and numerical results

For Kerr Q=0: Delta=r^2-2Mr+a^2, with M=GM_phys/c^2 as a LENGTH; real horizon radii require |a|<=M. In the exact a=0 Schwarzschild limit, r_+=2M, r_ph=3M, null critical impact parameter b_c=3sqrt(3) M, and angular critical-curve diameter d_crit=6sqrt(3) GM_phys/(c^2 D).
Critical-curve coefficient 6sqrt(3)=10.3923048454133, dimensionless.
Stellar dynamical mass gives theta_g=3.639449693345 microas; d_crit(stars)=37.822270682787 +/-2.292258829260 microas (mass uncertainty only, D=17.9 Mpc held fixed).
Gas dynamical mass gives d_crit(gas)=20.057264756023 microas, lower/upper mass-only uncertainty -4.011452951205/+5.157582365835 microas.
Measured EHT bright EMISSION ring=42 +/-3 microas.
Formal emission-minus-critical-curve differences: stars +4.177729317213 microas; gas +21.942735243977 microas. Conditional quadrature ratios 1.10653475 and 3.67757691 respectively are NOT calibrated statistical significances: the observed emitting plasma ring is NOT identical to the mathematical null critical curve; model systematics and distance covariance are omitted.
Empirical emission-ring diameter / independent stellar theta_g = 11.540206223155 +/-1.081036811589 (conditional mass + ring errors, D fixed).
EHT's model-dependent emission ring calibration coefficient 10.7 to 11.5 would give 38.9421117 to 41.8536715 microas for the stellar mass. This is a standard GRMHD/radiative-transfer comparison, not a novel H(s)H result.
Forcing observed ring to equal pure Schwarzschild critical curve gives inverse-fitted M=7.329015286e9 solar masses; this is a FIT with a mismatched observable, not a prediction, and is NOT adopted.

## Native Planck normalization

With CODATA 2022 G and exact c,hbar: lP=1.6162550244237053e-35 m; tP=5.391246448313604e-44 s. Stellar M87 mass=6.02981899753461e47 Planck masses; adopted D=3.417383264029739e58 Planck lengths. Native d_crit=6sqrt(3) M/D=1.83367542776432817e-10 radians, exactly matching SI GM/(c^2 D) calculation at tested precision. No free parameters introduced.

## Mathematical checks and gates

PASS: quadratic discriminant, Kerr a=0 Schwarzschild limit, r_ph=3M and b_c=3sqrt(3)M, dimensions, positive radii, mass-linear scaling, exact Planck/SI identity, uncertainty propagation with explicit exclusions.
CORRECTED: archival "exactly two horizons" means zero, one degenerate, or two distinct REAL horizon roots depending on discriminant. The old electron-ergosphere claim is already corrected in Ravel; no new theory change.
UNRESOLVED: M87 spin j; observed plasma ring to critical-curve transfer; H(s)H finite-core epsilon, coil radius, and radiative/optical readout; independent cross-sector physical prediction.
NOT ADMITTED: no independent H(s)H quantitative result to verify against CODATA or EHT. The standard GR control is mathematically sound, not a new H(s)H candidate.
NO BEDROCK PROMOTION. No protected signet.

Runnable complete local calculation and Class P plot retained in the visible ChatGPT relay turn, script filename m87_kerr_shadow.py. No invented observational inputs or tuned constants.
