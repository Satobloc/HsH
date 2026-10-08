# Ravel sandbox — 2026-10-07 finite-ring force correction and temporal locality

Status: GEN/CANDIDATE; standard electromagnetic control calculation, not evidence for anomalous gravity.

## Source ledger
1. SAT_THEORY_ARCHIVE_2023-25/2026/SAT THEORY — Superhelicalism.txt, blob 2144eb505a32571cb253b820dacdd62ca90894f7, complete 6300-character UTF-8 read this run. Explicit apparatus ideas: batteries/centrifuges, dual counterrotators, charged wire spooler, nested spinners, turbines, gravimetric time-order controls.
2. HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/002 Forces Across Temporal Points - to 8-13-24.txt, complete 3913-byte read. This early exchange explicitly poses whether a localized interaction on an extended 4D filament can alter remote temporal portions. The assistant's answer is not a physical derivation. Historical question retained, causal interpretation unendorsed.
3. HsH/DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/WHIRLY.txt, complete 16849-character read. Historical bending and frame dynamics noted without importing numerical claims.
4. Controlling NEW_INSTANCE_START_HERE.md, Common Reference Desk and HSH_RESOURCES War Room declaration consulted; references are navigation, not theory authority.

## Exact standard-EM baseline
For coaxial thin rings with radii a,b, axial separation z, and currents I_a,I_b, the mutual inductance is
M(z)=mu0*sqrt(a*b)*[(2/k-k)K(k^2)-(2/k)E(k^2)],
k^2=4*a*b/((a+b)^2+z^2).
For currents externally held constant, F_z=I_a I_b dM/dz, with sign convention z increasing away from the other ring. Charge fixed to each rotating ring gives I=Q*omega/(2*pi).

Numerical independent baseline: a=b=0.1m, Q_a=Q_b=1e-6 C, omega_a=omega_b=100rad/s. Fourth-order central difference dM/dz, step 1e-4*min(a,b,z).
z[m] | exact F[N] | dipole F[N] | exact/dipole
0.20 | -3.868910045e-17 | -9.375000000e-17 | 0.412684
0.30 | -1.163297072e-17 | -1.851851852e-17 | 0.628180
0.50 | -1.991889159e-18 | -2.400000000e-18 | 0.829954
1.00 | -1.428148896e-19 | -1.500000000e-19 | 0.952099
The earlier Ravel checkpoint's 0.3m dipole number overstates the exact thin-ring force by ~59.2% relative to exact (or exact is 37.2% below dipole). Thus an apparatus-specific exact EM calculation matters even before considering any nonstandard term.

## New candidate: distinguish 4D boundary-value response from retarded transport
The historical question about a contact influencing remote points on a 4D trajectory suggests a discriminating *mathematical* architecture, not automatically retrocausality. Consider a finite elastic worldtube coordinate X(tau) with functional
E[X]=integral_{-T}^{T} [(C/2)(dX/dtau)^2+(K/2)X^2 - f0*delta(tau)*X]dtau,
where C>0,K>0 and fixed boundary X(+-T)=0. The Euler-Lagrange equation is -C X''+K X=f0 delta(tau).
For T->infinity, X(tau)=f0/(2*sqrt(C*K))*exp(-sqrt(K/C)*abs(tau)).
This nonzero response at both positive and negative tau is a *boundary-value correlation*, not a demonstration of information propagating backward in physical time. A causal driven dynamics instead requires an initial-value retarded Green function and vanishes for tau<0. The distinction is observable only if the apparatus defines preparation, boundary conditions, and causal intervention; otherwise history dependence may be ordinary stored mechanical state.

## Failure gates and next calculation
- Numerically verify the elliptic formula against independent Biot-Savart double quadrature and mesh refinement.
- Solve the finite-T Green function and compare boundary-value and retarded responses under identical drive histories.
- For apparatus: factorial charge/rotation reversal and randomized temporal order; independently measure magnetic leakage, temperature, support loading, and vibration.
- Reject claims of exotic cross-temporal force when boundary constraints or ordinary memory suffice.
- Do not treat the standard EM ring force as a realistic gravimetric detection forecast without a full noise budget and field geometry.
