# Mercer | Derived Z3 angular kink, optical excess and linear modes | 2026-10-08

**Status:** SANDBOX; no canonical theory promotion. This note is a compact public checkpoint of a conditional reconstruction. No historical B or 0.24 phase value was used as a target.

## Sources actually read

- Old SAT, full: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT Mark V/SAT_Phase_Shift_Note.txt` (arctan kink, asserted fixed phase; raw integral diverges).
- Old SAT, substantial opening and optical simulation passages: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT Mark V/SAT_optics_finding.txt` (Z3 potential, theta_4, angular-gradient term, proposed Delta n=eta sin² theta_4, assumed tanh optical profile).
- HsH Sept 30: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT4D_MATHEMATICAL_BACKBONE.txt` (substantial mathematical backbone including filament tangent/time-normal angular definition and strain; later retrospective, not proof of optical law).

[Old optical note](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT%20Mark%20V/SAT_Phase_Shift_Note.txt) · [Old experimental discussion](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/SAT%20Mark%20V/SAT_optics_finding.txt) · [Sept 30 HsH backbone](https://github.com/Satobloc/HsH/blob/main/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT4D_MATHEMATICAL_BACKBONE.txt)

## New local construction

Local-only notation (not shared HsH adoption): angular field theta [dimensionless radians], normal distance x [m], stiffness K [J/m], potential U [J/m³], ell [m], optical index coefficient eta [dimensionless], optical wavelength lambda_0 [m], excess response length I [m], wall energy per area E_wall [J/m²].

    E[theta] = integral dx [ (K/2)(theta')² + U(1-cos(3 theta)) ]
    K theta'' = 3 U sin(3 theta)
    ell = sqrt(K/U)/3
    theta(x) = (4/3) arctan(exp(x/ell))
    E_wall = (8/3) sqrt(K U)

For the source-inspired *conditional* optical law Delta n = eta sin² theta, subtract a sharp step with the same asymptotes:

    I = integral dx [sin²(theta(x)) - (3/4) H(x)]
      = C_SG ell
    C_SG = 1.0880203917494629 [independent numerical quadrature]

An ordinary optical-path phase would be

    Delta phi_OPL = (2 pi/lambda_0) eta I,

not a wavelength-independent universal constant. In this model:

    E_wall * I = (8 C_SG/9) K = 0.9671292371106335 K.

At fixed K, quadrupling U halves I and doubles E_wall; at fixed U, quadrupling K doubles both. This is a falsifiable constitutive scaling relation if both observables can be independently accessed.

## Perturbation discriminator

For added time kinetic term rho(theta_t)²/2, the linearized dimensionless spatial operator is

    H = -d²/dy² + 1 - 2 sech²(y), y=x/ell.

It has a translational zero mode proportional to sech(y), no nonzero-frequency bound shape mode, and a continuum threshold omega_gap=3 sqrt(U/rho). Exact scattering solution:

    psi_k(y) = (i k - tanh y) exp(i k y),

with no reflected component and |transmission|=1. **This describes angular-director perturbations, not automatically optical photons.**

Finite-difference eigenvalues for y in [-24,24], grid spacing 0.02: -0.0000155565, 1.00466208, 1.01864702, 1.04192693, 1.07447379. Analytic zero-mode overlap: 0.9999999998. The tiny negative mode is discretization error.

## Failure and next test

The Z3 vacua (0,2pi/3) are not automatically the current HsH theta_4 convention (90 degrees minimal drag). The optical index law is not established; its un-subtracted integral diverges. No historical B=3/(4pi) is derived. Extra finite-core strain/medium coupling may produce bound shape modes and reflection, falsifying this **minimal** director model without falsifying HsH.

Next: add one explicit finite-core frame-strain coupling; solve wall and fluctuation eigenproblem while sweeping radius/ell and wavelength. Compare with this reflectionless null model and with measured optical constitutive response.

**Provenance:** read front door, Common Reference Desk, symbol/citation/workflow controls, current routing and War Room declaration before source work. HSH_RESOURCES used for routing/standard-reference familiarity, not as project theory authority; quarantined PRIOR_ART not opened.

**Mercer**