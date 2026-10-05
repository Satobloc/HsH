# MERCER — enrollment as a coupled-mode avoided crossing
SANDBOXED. 2026-10-05.

Sources actually read:
- SAT_THEORY_ARCHIVE_2023-25/SAT 20 Build Plans/SAT20_Emergent_Filament_Surface_Theory_Neutral.txt — complete file. Used: 4D manifold + filament ensemble; filament perturbations; filament-surface coupling. Did not inherit its gauge/Planck claims.
- HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/IMAGES_to_UNIVERSES.txt — substantial opening theory block. Used: live Sep-30 proposal to distinguish a non-worldtube Kelvin-like medium from an enrolled/persistent worldtube quotient; traveling coil-let vs persistent coil language. Cosmological and particle identifications remain quarantined.

Independent sandbox construction:
Represent a free-medium mode q and an enrolled-worldtube mode u by
  q_tt + Omega_q(k)^2 q + g u = 0
  u_tt + Omega_u(k)^2 u + g q = 0
with Omega_q^2=c_m^2 k^2 and Omega_u^2=c_f^2 k^2+omega_0^2.
Then
  omega_±^2 = (A+B ± sqrt((A-B)^2+4g^2))/2,
A=c_m^2 k^2, B=c_f^2 k^2+omega_0^2.

Consequence: if "enrollment" is a real reversible coupling rather than a categorical change of ontology, the two sectors cannot simply cross. They produce an avoided crossing. At A=B the eigenmodes are 50/50 mixtures and the squared-frequency splitting is exactly 2|g|. For weak g, frequency gap Δomega≈|g|/omega_cross.

Interpretation:
- far below/above resonance, modes are mostly free-medium or mostly enrolled;
- near resonance, identity swaps continuously between branches;
- a localized packet swept through the crossing should undergo mode conversion (Landau-Zener-like in an inhomogeneous/slowly varying background).

Failure conditions:
1. independently identified free/enrolled modes cross with no splitting despite nonzero local coupling;
2. inferred splitting does not scale with the independently measured coupling;
3. mode composition does not exchange across the crossing;
4. one branch becomes unstable because g^2 > A B over the claimed stable regime.

Tight solver test:
Build the two uncoupled dispersions first, measure c_m,c_f,omega_0, then switch on a separately calibrated coupling g. Predict the complete hybrid dispersion with no spectral refit. At the uncoupled crossing require 50/50 eigenvector content and squared-frequency gap 2|g|.

Numerical fixture only (not fitted to SAT): c_m=1, c_f=0.62, omega_0=0.75, g=0.20 gives k_cross≈0.956 and omega_-≈0.845, omega_+≈1.055.

Main payoff:
The Sep-30 "aether fluid -> filament formation/enrollment" idea has a minimal standard-physics signature: enrollment should look spectrally like hybridization. This supplies a calculable bridge between a Kelvin-like unbound medium and persistent finite worldtubes without requiring them to be wholly separate substances.
