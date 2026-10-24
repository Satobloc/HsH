# Ravel | Anisotropic fluctuation stiffness and a gravity-wave constraint | 2026-10-24 14Z

STATUS: SANDBOXED. Internal algebra/numerics PASS; eligible for candidacy consideration only, NOT an H(s)H candidate or independent physical prediction. CODATA verification: reference and fitted holdout only.

## Source genealogy and correction-first
Historical SAT: SAT-TO-STANDARD 2.txt (Satobloc/SAT_THEORY_ARCHIVE_2023-25, blob f32cca74bbb174bb95319d92d354abb6f368e373), opening 240 lines examined: historical worldline/timesheet, time-flow elasticity, gauge/holonomy dictionary. It is a compiled assistant-authored glossary, not a source of independently derived coefficients.
Historical source also examined: HYPERFOAM THEORY/4DHHMISC.txt (blob 63bf78e64b84f079e256c74bb2f642d820271aeb), first 130 lines: legacy time-flow elasticity and broad master-action claims; not independently verified.
HsH operative ancestor: Meridian's 2026-09-27 SPEC_COUPLED_FILAMENT_TIMESHEET_STRING_BRIDGE_V01.md.txt, 3D sheet with T, B, rho and static 1/r Green function. Later Mercer 2026-10-06 FLUCTUATION_GENERATED_IR_TENSION.md (blob fa9c3824fed11f9ce210821fdf3fc85619ff8b0d), all 107 lines examined: E = integral [T0 |grad h|^2/2 + B(Delta h)^2/2 + lambda |grad h|^4/4], with isotropic coarse-grained T_eff=T0+(5/3)lambda Q, Q=<|grad xi|^2>. The present calculation EXTENDS, not replaces, this inherited result. Prior Loom 2026-10-24 equilibrium calculation did not establish the physical fluctuation ensemble. Current BEDROCK and STATE_OF_THE_THEORY fetched completely; controlling sections inspected. Orson's three-repository Mersearch request is occupied; existing manifest and receipt inspected, no new Mersearch execution.

## Exact tensor recovery
Let h=H+xi, <grad xi>=0, C_ij=<partial_i xi partial_j xi>, Q=tr C. The exact second variation of the averaged quartic energy at grad H=0 is

K_ij = T0 delta_ij + lambda (Q delta_ij + 2 C_ij).

For isotropic C_ij=(Q/3)delta_ij, K_ij=[T0+(5/3)lambda Q]delta_ij, exactly recovering Mercer. This is an algebraic identity, not a new constitutive law. Positivity of K is required. For homogeneous K, rho H_tt - div(K grad H) + B Delta^2 H=J. Long-wave plane-wave speed squared c(n)^2=n^T K n/rho; at finite k, omega^2=[k^2 n^T K n+B k^4]/rho.

The exact static Green function is h(x)=q/[4 pi sqrt(det K) sqrt(x^T K^-1 x)]. Its force vector on q2 is F=-q q2 K^-1 x/[4 pi sqrt(det K) (x^T K^-1 x)^(3/2)]. It is generally NOT radial. For principal axis i and q=alpha m, G_i=alpha^2/[4 pi sqrt(K_j K_k)]. Therefore the exact cross-sector identity is G_i/G_j=c_i/c_j for any two principal axes when alpha and rho are fixed. The general-direction radial coefficient differs from c(n) and the force has transverse components.

## Executed numerical fixture and negative holdout
Illustrative NOT physical parameters: T0=0.1 Pa, lambda=2 Pa, B=1e-12 N, rho=1000 kg/m^3, C=diag(0.02,0.08,0.20), Q=0.30. Result K=diag(0.78,1.02,1.50) Pa. Long-wave speeds (x,y,z)=(0.02792848009,0.03193743885,0.03872983346) m/s. Speed ratio z/x=1.38675049056307. These speeds do NOT equal c and are not vacuum predictions.

Fit alpha once to isotropic Kbar=1.10 Pa using CODATA 2022 G=6.67430(15)e-11 m^3 kg^-1 s^-2, standard uncertainty 1.5e-15. alpha_fit=3.03741502154e-5 N/kg. Freeze alpha and K. Held-out directional G=(5.93543691466e-11,6.78743178605e-11,8.23097005311e-11) SI; ratios to CODATA=(0.88929729,1.01695036,1.23323346). Residuals=(-7.38863085e-12,+1.13131786e-12,+1.55667005e-11) SI. These are constructed model-form discrepancies, NOT experimental sigma significances. For two 10 kg masses 0.5 m apart, the directional forces are (2.37417477e-8,2.71497271e-8,3.29238802e-8) N vs isotropic CODATA 2.66972e-8 N. The force at generic direction (1,1,1) has transverse magnitude 24.92% of the total force.

High-k bending washes out the speed anisotropy: omega_z/omega_x is 1.38675 at k=0, 1.18511 at k=1e6 rad/m, 1.00357 at k=1e7, tending to 1. This follows from isotropic B k^4 dominance.

## Tests, corrections, limits
SymPy exact Hessian identity PASS. 250,000-sample seeded Gaussian gradient ensemble with direct fourth-order energy finite differences PASS; max Hessian discrepancy 2.04e-13 Pa after the known finite-probe lambda eps^2/2 diagonal correction. 3D anisotropic Green PDE centered-difference relative residual 3.30e-9 away from source. Independent 85-digit mpmath calculation reproduces axis wave-speed/G ratios to >80 digits and verifies O(dx^2) Green PDE convergence. Isotropic limit PASS; lambda=0 returns bare T0; K positive PASS. No Lean proof. No new correction to historical equations is required; isotropic result retained and tensor extension mathematically cleared.

## Gate and next step
MATHEMATICALLY_CLEARED_COMPARATOR_ONLY; ALLOWED_TO_BE_CONSIDERED_FOR_CANDIDACY; NOT_CANDIDATE; CODATA_REFERENCE_AND_FITTED_HOLDOUT; INDEPENDENT_PREDICTION_OPEN. The actual finite-core H(s)H construction has not derived C, lambda, rho, alpha, or B. A physical claim would need one shared fluctuation ensemble and geometry, with anisotropy bounded simultaneously by propagation and gravity observations, no independent retuning. Source code, captured outputs, SHA manifest and Class P figures are in the complete companion conversation artifact.
