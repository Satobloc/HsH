# Aster :48 | Kerr-Newman electron axial-CTC gate (2026-10-23T08Z)
Task: calc48-20261023T08Z-aster-kn-chronology-001
Status: INTERNALLY_CHECKED (standard Einstein-Maxwell comparator); SAT/H(s)H finite-core transfer UNRESOLVED; CODATA 2022 measured inputs, not a zero-input prediction. No BEDROCK promotion.

## Historical genealogy and correction
SAT original conversation: Satobloc/SAT_THEORY_ARCHIVE_2023-25/HsH AHA TOPOLOGY.txt, Git blob 5283ceb8d06109061543711ebe7c46954efe7ede (mixed Nathan/assistant, original message dates unverified). An assistant asserted that an electron-like Kerr-Newman object can have an ergosphere despite lacking a horizon. Nathan explicitly distinguished his own Minkowski-first worldline reasoning from assistant-introduced Kerr-Newman prior art. The historical assistant's unconditional ergosphere assertion fails for the stated electron parameters.
HsH Ravel control: WORKSPACES/RAVEL/KERR_PARTICLE_REGIME_COLLISION_2026-09-16.md, blob 8bc65c97e88afd9c7e6add7386574c0eea3492b9, already correctly excludes the electron-scale classical ergosurface. This packet adds a separate equatorial axial closed-timelike-curve radius, not an H(s)H physical core boundary.

## Standard metric controls (SI-to-geometric length)
M=G*m_e/c^2; a=J/(m_e*c), J=hbar/2; Q^2=G*e^2/(4*pi*epsilon0*c^4); epsilon0=1/(mu0*c^2).
Kerr-Newman Delta=r^2-2*M*r+a^2+Q^2. Horizon roots require M^2>=a^2+Q^2.
Stationary-limit equation: r^2-2*M*r+a^2*cos(theta)^2+Q^2=0. Because Q^2>M^2, its discriminant is negative for every theta: no classical ergosurface.
Equatorial axial Killing norm: g_phiphi=r^2+a^2+a^2*(2*M*r-Q^2)/r^2.
Its sign equals the quartic F(r)=r^4+a^2*r^2+2*M*a^2*r-Q^2*a^2 for r>0.
F(0)=-Q^2*a^2<0; F'(r)=4*r^3+2*a^2*r+2*M*a^2>0 for r>0; F(r)->infinity. Thus exactly one positive root r_CTC; g_phiphi<0 for 0<r<r_CTC on the equator. Constant-t,r,theta azimuthal circles there are timelike and closed in the exact classical KN extension. This is not an ergosphere.
Dimensionless x=r/Q, eps=M/Q, eta=Q/a: eta^2*x^4+x^2+2*eps*x-1=0, unique x>0. Limit eps,eta->0 gives x->1. The positive-r CTC band is present only in this charged classical control; no claim of physical quantum-electron CTCs.

## Executed 70-digit mpmath, CODATA 2022 inputs
m_e=9.1093837139(28)e-31 kg; G=6.67430(15)e-11 SI; mu0=1.25663706127(20)e-6 SI; h=6.62607015e-34 J s exact; e=1.602176634e-19 C exact; c=299792458 m/s exact.
M=6.76477434123208126291409605e-58 m.
a=1.93079633717618773834372978e-13 m.
Q=1.38067846999185203174835623e-36 m.
r_CTC=1.38067846999185203174767975e-36 m.
r_CTC/Q=0.99999999999999999999951004.
r_CTC/a=7.15082395490303481840936734e-24.
Q/M=2.040982300882465839448e21.
Q/l_P=0.0854245431029146627205036251.
Approximate standard uncertainty u(r_CTC)=1.55148682636e-41 m, propagated from CODATA G, mu0, m_e with zero-correlation approximation. Dominated by u(G); no model uncertainty included.
Exact symbolic signs, 70-digit root, 240-step independent bisection, limits and dimensional factors checked; ALL_ASSERTIONS_PASSED.
Input-dependent derived scale, not a predicted measured quantity: no CODATA residual or theory z-score. The radius lies below Planck length, where classical metric extrapolation is not a physically certified quantum-electron prediction.

## H(s)H transfer gate
Classical Kerr-Newman electron: no horizon, no ergosurface, yet a tiny positive-r equatorial axial-CTC region in the analytic metric. None of these facts supplies a finite-core carrier, ER throat, material shell, Pauli exclusion or causal completion. Any proposed H(s)H replacement must give an explicit metric/topology and admissibility conditions. Do not add new mechanisms to force the answer. No source private content included.
Reference constants: NIST CODATA 2022, https://physics.nist.gov/cuu/Constants/ .
