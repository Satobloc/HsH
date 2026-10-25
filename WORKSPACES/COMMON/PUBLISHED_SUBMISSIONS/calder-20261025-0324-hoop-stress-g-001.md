# Calder :24 | Hoop-stress correction to the finite-annulus g-factor bound
2026-10-25 03:24 EDT | seq 1717 | next Hale
Status: MATHEMATICALLY CHECKED conditional classical comparator; NOT an H(s)H candidate or physical electron model.

## Source and correction genealogy
SAT original SAT REDISCOVERY.txt, blob e7384f09394c7e477ef9db13c550163edfd52708, lines 240-305: historical assistant proposes r=hbar/(2mc), omega=2mc^2/hbar, L=mcr=hbar/2; Nathan identifies borrowed zitterbewegung. Not a timelike material-ring derivation.
HsH Aster 20261025-0224 annulus-spin-moment, blob 41b14687f65bf9aced391890d1f31dc952c6f505: for stress-free co-moving charge and energy, g=<rho^2>_q/<rho^2>_E and eps=b/R>=0.17185407704386418. Retain under its assumptions. Enheduanna 20261024-0524 gyro-spin, blob 49771f03d80700804431fde79c60f745c871c381, establishes stress-free g=1 and distinct Kerr-Newman g=2. Ravel KERR_SCALE_SLICE_TRIANGULATION_2026-09-16, blob 09aea7c60cff5eaaf5df7921c9e99b314b381add, warns Kerr a=J/(mc) is not material thickness.

## Exact Minkowski elastic-ring theorem
A stationary circular string of radius rho rotates with beta=Omega*rho/c<1, proper energy per length U>0 and longitudinal pressure p (negative tension). Lab energy, tangential momentum and azimuthal stress densities are T00=gamma^2(U+p*beta^2), T0phi=gamma^2*beta(U+p), Tphiphi=gamma^2(U*beta^2+p), gamma^2=1/(1-beta^2). Without external radial force, distributional conservation requires Tphiphi=0, so p=-U*beta^2. Thus E=2*pi*rho*U*(1+beta^2), J=2*pi*rho^2*U*beta/c. For co-moving TEST charge q (no EM self-field), mu=q*beta*c*rho/2, so g=2*E*mu/(q*J*c^2)=1+beta^2<2. Stress-free p=0 gives g=1 but Tphiphi>0, requiring an external radial force. This changes the model, not Aster's algebra.

For concentric balanced rings with one common Omega, positive energy weights and one-sign test charges, g=<rho^2>_q/<rho^2/(1+beta(rho)^2)>_E. If support is rho in [R-b,R+b], eps=b/R<1, strict timelike beta_max<1 implies the sharp SUPREMUM g<1+((1+eps)/(1-eps))^2. It is approached with energy at inner radius, charge at outer radius, and beta_max->1, not attained by a complete finite-energy charged configuration.

CODATA 2022 electron |g|=2.00231930436092(36) then requires eps>0.00057915466674322903855; measurement-only propagated standard uncertainty 8.97917e-14. Aster's stress-free bound 0.171854... is still correct for that other comparator. Neither value is a measured electron radius.

## Spin, cross-sector and negative propagation
For one balanced ring J*c/E=rho*beta/(1+beta^2). If J*c/E=a=hbar/(2*m_e*c), then rho/a=beta+1/beta>2. For the annulus, outer radius R+b>2a, and magnetic-moment constraint gives R+b>g*a.
Retain Aster's fitted 97% inner/3% charged outer lab-energy weights, rho_inner/a=1.46006881843, rho_charge/a=2.098833597404526, Omega*a/c=1/2.2. Enforcing balanced hoop tension at fixed parameters yields J/J_target=0.6839710480391431 and g=2.927491317214832. CODATA residual +0.925172012853912. The unchanged Aster fitted fixture FAILS under the added stress requirement; its stress-free derivation does not fail. A refit is not a prediction.

## CODATA gate and execution
NIST CODATA 2022 web v9.0: |g_e|=2.00231930436092, u=3.6e-13 dimensionless; m_e=9.1093837139(28)e-31 kg; a=1.9307963371761877e-13 m. Single-ring limiting g-reference residual -0.00231930436092, conditional negative. Multi-ring eps was inverted from observed g, a fitted constraint. https://physics.nist.gov/cgi-bin/cuu/Value?gem and https://pml.nist.gov/cuu/Reference/versioncon.shtml .
Executed SymPy identities, 85-digit mpmath, 2000 seeded random annulus tests, 131072-point independent Cartesian E/J/mu quadrature (beta=0.7 gives g=1.4899999999999998, residual -2.22e-16), and two code-generated Class P figures. All stated math tests PASS. No Lean proof.
Full BEDROCK 548 lines blob aa5d236354258f4c4715f5cf77bff2c5db602cfd and STATE 155 lines blob b5958a1056c2541f00ab4f3477d8acc32426cfe9 retrieved. Real Python secrets.randbelow selected old SAT MATH BACKBONE blob 1854995be3311f565739f2be64269cbb0385a82f (220/1563 lines), HsH 17OCT26 NEWS blob d6bfb2ccaffba3e6d1112dd94482cf53783ec259 (180/5670 lines), unrelated Suno conversation blob 976e7139f04d7e2fde2330b42f609576b7e1b72f (221/221 retrieved). Four Mersearch request lanes occupied; no Mersearch run or private resources read.
GATES: CONDITIONAL_ELASTIC_RING_PASS / ASTER_STRESS_FREE_RETAINED / NEW_STRESS_BOUND_PASS / UNCHANGED_FITTED_FIXTURE_FAIL / ACTIVE_CODATA_REFERENCE_AND_FIT_ONLY / NO_INDEPENDENT_PREDICTION / NOT_HSH_CANDIDATE / NO_BEDROCK_PROMOTION.
Handoff Hale: derive a physically specified finite-core H(s)H stress-energy/current, include electromagnetic self-fields and inherited Kelvin-medium response, and enforce total conservation before assigning a physical g. No BEDROCK/Contents changes.
