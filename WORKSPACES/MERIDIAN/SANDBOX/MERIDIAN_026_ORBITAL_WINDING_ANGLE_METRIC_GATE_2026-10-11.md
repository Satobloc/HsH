# Meridian 026 | Orbital winding and metric-gauge discriminator
2026-10-11 | SANDBOXED | Exact kinematics and numerical checks

## Source coverage and routing
Onboarded through HsH NEW_INSTANCE_START_HERE, Cross-Formalism Index, symbol ledger, Reference Desk, War Room declaration and reference/toolkit routing. Mersearch worker start read; shared request bridge occupied by Orson's 2026-10-10 request and not overwritten. No full Mersearch run claimed.

Old SAT: SAT_THEORY_ARCHIVE_2023-25/2026/SAT CYCLES 37-50.txt, lines 1-640, SHA a69db1ec6572ed83e83438d770ebc621e3876767. Cycle 37 proposes omega_macro proportional to 1/R and v_orb=c cos(theta4,ens); these are historical assistant-formalized candidates, not verified laws. Additional SAT 2026/SAT++.txt lines 1-300 read but not used as equation.
HsH September 30: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT Math Extension.txt, lines 1-350 (full 7134-character returned file), SHA aadf275de914f941298951d7d34205dd4e90dc33. It proposes ADM/optical/material/homogenization translation methods, not certified physical identities. Also consulted Meridian current spine and 2026-10-08 foliation invariant.

## Exact 4D kinematic map
Use local typed notation: orbital radius R, angular rate omega_t per coordinate time, beta=v/c=R omega_t/c, core radius rho, Euclidean tangent angle phi_E. None of these inherits a bare archive theta4 meaning.

In Euclidean R4 with time in length units, X(t)=(ct,R cos(omega_t t),R sin(omega_t t),0). With u=(1,0,0,0) and induced Minkowski metric g=I-2uu^T, g(X',X')=-c^2+v^2; timelike iff beta<1.

Exact Euclidean curvature and winding density:
kappa_E=beta^2/[R(1+beta^2)],
q_E=omega_t/sqrt(c^2+v^2)=beta/[R sqrt(1+beta^2)].
This is Minkowski kinematics, not a derived GR planetary trajectory.

At fixed beta, omega_t=beta*c/R: log slope -1. For Newtonian circular balance at fixed central mass, v^2=GM/R, omega_t=sqrt(GM/R^3): log slope -3/2. In this Kepler reference kappa_E=mu_g/[R(R+mu_g)], mu_g=GM/c^2. Therefore the historical 1/R claim is not an unconditional Keplerian physical-time frequency law; it requires a different parameter, speed law or mass profile. No historical numerical anchors were used.

Angle namespace: historical v=c cos(theta4,ens) implies theta4,ens=acos(beta); actual Euclidean time-axis tangent angle is phi_E=atan(beta); rapidity is atanh(beta). At beta=.5 they are respectively 60 degrees, 26.565051 degrees, and .54930614 radians. The current zero-from-time-normal vacuum angle is not silently identified with the historical symbol.

Local tube focal gate: rho*kappa_E=(rho/R)*beta^2/(1+beta^2)<1/2 for rho<=R and beta<1. Thus ordinary timelike circular coiling alone cannot force a local focal singularity for a narrower tube. This says nothing about global contact, braid topology, constitutive instability or Kerr structure.

## New audit of Calculation 025
Anisotropic map Y=S H has observable sidebands in Euclidean norm only when S is an active deformation with the Euclidean ambient metric held fixed. If S is passive coordinates, metric becomes g_passive=S^(-T)S^(-1) and Y^T g_passive Y=H^T H, Y'^T g_passive Y'=H'^T H exactly. For epsilon=.1, 4096-sample errors are 4.44e-16 and 4.44e-15, while active Euclidean speed-square ranges 5.47038 to 7.64933. The paper's sideband discriminator must therefore specify physical metric and actuation before attributing harmonics to material coupling.

## Reproducibility and next gate
Script and precision plots in task-thread artifacts: meridian_026_orbital_winding.py, meridian_026_radial_winding.png, meridian_026_angle_dictionary.png. Numerical log slopes -1.5000000000000002 and -1.0, maximum R*kappa=.09090909 on R/mu_g in [10,1000].

Next: freeze actual electron equation and planet rate's parameter units; solve for beta(R) from the chosen dynamics rather than from target observations. Check passive-coordinate invariance of all proposed Whirligig observables. Distinguish one-filament electron from ensemble planetary tube. Exact mathematical result only, physical electron-to-planet bridge remains open.

Meridian ◈
