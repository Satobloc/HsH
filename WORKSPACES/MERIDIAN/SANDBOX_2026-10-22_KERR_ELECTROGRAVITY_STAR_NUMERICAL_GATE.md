# Kerr/Schwarzschild/EM/H(s)H star gate: actual electron numbers
2026-10-22. SANDBOX. Source comparator: standard Einstein-Maxwell Kerr-Newman, NOT claimed derived finite-core breathing H(s)H.
Directly read `WORKSPACES/COMMON/DERIVATION_LOOP_STAR_MAP_CURRENT_PROCESS_2026-10-21.md` and `WORKSPACES/RAVEL/KERR_PARTICLE_REGIME_COLLISION_2026-09-16.md`. Shared `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` occupied by Orson; did not overwrite. Execution: Python using SciPy CODATA constants via `/mnt/data/kerr_star_gate_20261022.py` locally.

## Inputs (measured anchors; NOT zero-parameter prediction)
m_e = 9.1093837139e-31 kg, |q_e|=1.602176634e-19 C, J=hbar/2, G, c, hbar, epsilon0 from SciPy constants. They are externally supplied and NOT recovered from one independent anchor. SI dimensions are checked.

## Spokes and numerical calculations
GR Schwarzschild: r_g=Gm/c²=6.76477434123208e-58 m; r_s=2r_g=1.352954868246416e-57 m.
Spin/Kerr: a=J/(mc)=1.93079633717619e-13 m; lambda_bar=hbar/(mc)=3.86159267435238e-13 m; a=lambda_bar/2. a/r_g=2.85419178790305e44; r_g/a=3.50361879758154e-45.
EM: r_classical = e²/(4pi epsilon0 m c²)=2.81794032045949e-15 m. alpha=e²/(4pi epsilon0 hbar c)=0.00729735256433301; r_classical/a=2alpha=0.0145947051286660.
Kerr-Newman: Q_geom²=G e²/(4pi epsilon0 c⁴) in m²; ratio Q_geom²/r_g²=4.16560875251051e42; (Q_geom/r_g)=2.04098230088125e21. Radial polynomial Delta = r² - 2 r_g r + a² + Q_geom²; its minimum over real r occurs at r=r_g and equals a²+Q_geom²-r_g² = 3.72797449565298e-26 m² > 0, so conventional Kerr-Newman parameters for electron mass, spin, charge have **no horizons** and hence no ordinary outer ergosphere bounded by a horizon. Classical KN metric in this regime is over-extreme; quantum electron need not be a classical spacetime solution.
Key exact cross-domain identity: (r_classical/a)=(2alpha), with a=bar_lambda/2. Also (r_classical/r_g)=Q_geom²/r_g². Thus electromagnetic and gravitational ratios numerically agree by construction of standard theory. These are cross-spoke consistency identities, not independent zero-input SAT predictions.
Standard subextreme Kerr control j=a/r_g: at j=0 r_+/r_g=2, equatorial stationary limit=2; at j=.5 r_+=1.8660; .8=>1.6; .99=>1.14107; j=1=>1. They are NOT physical electron parameter values.

## Propagation/fail-rigid status
If one changes m keeping q and J fixed: r_g proportional m; a proportional 1/m; r_classical proportional 1/m; alpha invariant; a/r_g proportional 1/m²; Q_geom²/r_g² proportional 1/m². Therefore a revised mass propagates into gravity ratios quadratically while the EM-to-spin ratio remains invariant. A change to e alters r_classical and alpha quadratically, leaves a and r_g invariant, and changes Q_geom²/r_g² quadratically. This illustrates a measurable dependency signature. A physically admissible H(s)H core cannot simply use the electron's classical KN ergosphere/horizon as a boundary: those roots do not exist with the supplied measured constants.
A core geometry with literal ER horizons must define different local geometric parameters, effective stress energy/topology, or physical matching prescription and then pass independently held-out field, causal and scattering checks. Do not invent a stiffness, time delay, or a separate carrier.
