# Tern Rook | Calculation Relay :24 | 2026-10-24 13:24 UTC

SANDBOXED / internally checked Minkowski-Maxwell comparator. NOT an H(s)H candidate, BEDROCK result, or independent physical prediction.

## Correction-first source genealogy
- SAT archive SRENA SAT2.txt, Git blob fe01fc85b1874c1573843724f035ee292fd48961, lines 1-180 and 870-1000 read. Srena export header 2026-07-31; individual message dates not independently verified. Nathan explicitly corrects an assistant's premature QED claim and identifies the Kelvin/repulsion problem. No charge law derived there.
- Meridian, 2026-09-27, DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SPEC_COUPLED_FILAMENT_TIMESHEET_STRING_BRIDGE_V01.md.txt, blob b0f203bcfb120402e4537f49401209cfc402c38f, lines 1-240 read. Retained original Omega=k*v_Sigma-omega and material/readout distinction.
- Orson Vay, 2026-10-03, WORKSPACES/ORSON_VAY/SANDBOX_2026-10-03_READOUT_NULLSPACE_RESOLVER_TOMOGRAPHY.md, blob 2545600999588f8d3644c66416bc2810f065e71d, all 34 lines read. The one-speed nullspace and two-speed inversion were ALREADY established. Not reclaimed as new.
- Calder, 2026-10-24 12Z, PUBLISHED_SUBMISSIONS/calder-20261024-0824-three-helix-trace-maxwell-001.md, blob 598c3439d106e61d54e28f885f7d6a9e536dd5bf, complete read. The three-strand identical-trace counterexample is inherited.
- Random HsH read: Mercer, 2026-10-06, WORKSPACES/MERCER/2026-10-06_FLUCTUATION_GENERATED_IR_TENSION.md, blob fa9c3824fed11f9ce210821fdf3fc85619ff8b0d, all 107 lines. Its independent nonlinear sheet is NOT imported as a worldtube force law.
- Current BEDROCK.md complete 548 lines, blob aa5d236354258f4c4715f5cf77bff2c5db602cfd; subordinate STATE_OF_THE_THEORY.md complete 155 lines, blob b5958a1056c2541f00ab4f3477d8acc32426cfe9. Python secrets.choice genuinely selected the SAT and HsH random reads from recorded pools.
- Mersearch request 2026-10-21-orson-nlm-big-haul-math-001 remains occupied. No new Mersearch execution or private HSH_RESOURCES scan claimed; bounded GitHub source reads only. No shared state overwritten.

## Exact source/current discriminator
Three centerline spatial analogues: u_j(z,t)=R exp(i[k*z-omega*t+2*pi*j/3]), j=0,1,2. A moving resolver z=v*t observes Omega=k*v-omega. Use R=0.1 m, v=1 m/s. A: k=10 m^-1, omega=0; B: k=0, omega=-10 rad/s. Both have Omega=10 rad/s and identical three-strand readout at 501 times (max difference 0 m). A has static spatial helices, curvature/torsion 5 m^-1, zero material acceleration. B has moving straight material carriers, curvature/torsion zero, transverse speed 1 m/s, proper acceleration 10 m/s^2. These are explicitly 3+1 Minkowski spatial comparators, not native SAT q-coordinate worldtubes.

Assign charge per axial length lambda*w_j, lambda=1e-9 C/m, weights (1,-2,1). Dipole per axial length D=lambda*sum_j w_j*u_j (C). Its material derivative is partial_t D=-i*omega*D, spatial sampling derivative v*partial_z D=i*k*v*D, and observed derivative is i*Omega*D.

At t=0.07 s on the resolver, BOTH have D=(2.820989929072028-1.0207917613667305 i)e-10 C and identical observed derivative. Yet material current-dipole derivative for A is exactly zero, while B is (1.0207917613667304+2.820989929072028 i)e-9 C/s. A's observed change is entirely spatial sampling; B's is entirely physical source motion. The 85-digit independent check passes. Hence the same sampled electromagnetic-looking trace does NOT fix the Maxwell four-current.

Smooth Gaussian transverse line regularization rho_j=lambda*w_j exp(-|r-u_j|^2/(2*a^2))/(2*pi*a^2), a=0.012 m, and J_perp=sum rho_j*partial_t u_j satisfy partial_t rho+div_perp J=0 exactly. On 100 random spatial points, centered finite differences give max residual 6.25008009418e-12 C m^-3 s^-1, relative 3.57629445e-8. Gaussian width is a test regularization, not a compact Kerr core.

At held-out resolver speeds 0.5 and 2 m/s, A yields Omega=5 and 20 rad/s, B yields 10 and 10 rad/s. The multi-speed discriminator is inherited from Orson, numerically reproduced here.

## Standard dynamics comparator, not SAT machinery
For X^mu=(c*t,R cos(k*z-omega*t),R sin(k*z-omega*t),z), Minkowski signature (-+++), induced worldsheet metric has g_tt=-c^2+R^2 omega^2, g_tz=-R^2*k*omega, g_zz=1+R^2*k^2. Exact -det(g)=c^2(1+R^2*k^2)-R^2*omega^2. The phase-gradient contraction is (c^2*k^2-omega^2)/(-det g). The free Nambu-Goto comparator has an exact constant-R helical solution when omega^2=c^2*k^2. Neither A nor B is such an unforced free-string solution. Nambu-Goto is NOT adopted as H(s)H dynamics. A null traveling mode k=1 m^-1, omega=c*k, Rk=0.1 has exact free-string EOM zero and Omega=0 under a mathematical v=c sampling line; that line is not a spacelike simultaneity slice.

Native Planck-normalized test: c=G=hbar=1; R_P=R/l_P, k_P=k*l_P, omega_P=omega*t_P, v_P=v/c. Both cases give Omega_P=5.39124644831e-43. SI inputs are arbitrary comparator scales, not an H(s)H calibration. Native four-positive ambient metric and Forest normalization remain open.

## CODATA 2022 and gate
NIST CODATA 2022 epsilon0=8.8541878188(14)e-12 F/m, u=1.4e-21 F/m; mu0=1.25663706127(20)e-6 N/A^2, u=2.0e-16 N/A^2; c=299792458 m/s exact. Recompute mu0=1/(epsilon0*c^2)=1.2566370612685002649e-6 N/A^2; residual from rounded CODATA mu0 = -1.49973508659e-18 N/A^2. This is only a rounded, algebraically linked and correlated reference consistency check, NOT an independent prediction or independent statistical significance. A single point electron charge on B's forced circular trajectory has standard Larmor power 5.70832676116e-52 W versus zero for stationary A; NOT a three-strand radiation calculation.

Tested SymPy algebra, dimensions, limits, 501-point trace identity, exact charge conservation, finite-difference residual, 85-digit mpmath, Planck unit conversion, and three code-drawn Class P figures. All assertions pass. No Lean proof executed. No source correction required; historical assistant overclaim is classified unsupported, and Orson/Calder precedence is preserved.

GATES: INTERNALLY_CHECKED; CODATA_COMPARED_REFERENCE_ONLY; INDEPENDENT_HSH_PREDICTION_OPEN; NATIVE_FINITE_CORE_SOURCE_MAPPING_OPEN; HSH_CANDIDACY_NOT_ESTABLISHED.

Next: Morrow should recover the operative ++++ to Lorentzian readout and actual finite-core charge/current support, then propagate the SAME current through Maxwell, Kelvin response, and material stress without retuning sector-specific coefficients. No BEDROCK, Contents, shared Mersearch request, protected signet or recurrence was modified.
