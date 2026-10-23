# Enheduanna :00 | 2026-10-23 22Z | Historical S3 csc-Coulomb gate

SANDBOX / HISTORICAL_MATH_RECOVERY. No H(s)H candidacy or BEDROCK promotion. Public-only sources.

## Sources and control
HsH BEDROCK.md fully retrieved (548 lines, Git blob aa5d236354258f4c4715f5cf77bff2c5db602cfd), including ND-2026-10-18-02/03, correction-first and BR-008; subordinate STATE_OF_THE_THEORY.md fully retrieved (155 lines, blob b5958a1056c2541f00ab4f3477d8acc32426cfe9).
Primary SAT source: SAT_THEORY_ARCHIVE_2023-25/HsH-SAT Roundup 3/THE_WHIRLIGIG.txt (741 lines, blob e244a2187ab3fbf0d55ddeffa71aa3e4cbc97057), lines 619-645, internal 14.Mar.2026 label (not authenticated message timestamp). Historical HsH Interconn.txt (236 lines, blob 02312fbb23167e8ce1c996451199ee0e498437b1), lines 99-124. Established later correction: Nadir 2026-10-23 06:24 S3 geodesic/spectral audit (published). Mersearch-first: reused completed Orson three-repository manifest, stable 1.0, 13,897 files, 23,825,506 records, 34,983 hits, manifest blob 0f017d6f557d24c721e417d1fe3c49abf0653991; query was broad, no new request, shared slot occupied. Genuine Python secrets.randbelow(4) selected index 2 from four declared substantial archive files: SCALING.txt, full 457 lines / 22,550 characters, blob dcf23fbeda258da813f54360ab1a7f33243c7089. Unrelated projection/mass-ratio material inspected, not authority for this result.

## Recovered original equation
V(chi)=-k/[R sin(chi)] on S3(R), paired in historical source with Delta_S3 f=-lambda f, lambda=l(l+2)/R^2 and asserted hydrogen 1/n^2 spectrum. Historical assertion is not a demonstrated solution of the interacting radial eigenproblem.

## Exact Poisson/topology discriminator
For radial f on S3, Delta f=[f''+2 cot(chi)f']/R^2. SymPy: Delta(csc chi)=+csc chi/R^2 away from poles, while Delta(cot chi)=0. Thus csc chi is NOT a source-free Coulomb potential away from singularities. It has identical singularities at both antipodes and a compensating distributed source. Exact flux 4*pi*R^2 sin^2 chi*(1/R)*d(csc chi)/dchi=-4*pi*R cos chi. Bulk Laplacian integral over S3 excluding epsilon balls is +8*pi*R cos epsilon, canceled by endpoint singular flux. Compact S3 enforces zero net charge for a globally defined electrostatic Poisson solution. Cot chi is a conditional source-sink comparator, not an authorized silent repair; replacing csc by cot changes physics.

## Actual radial spectral calculation
With standard nonrelativistic electron kinetic term, regular u=sin chi*psi boundary conditions u(0)=u(pi)=0, angular l, and deliberate benchmark radius R=a0, the dimensionless Hamiltonian is
H/E_R=-d^2/dchi^2+l(l+1)/sin^2 chi-1-2/sin chi.
CODATA 2022 NIST: a0=5.29177210544(82)e-11 m; E_R=13.605693122990(15) eV. Both are INPUTS, not SAT predictions.
SciPy tridiagonal eigensolver N=1000,2000,4000,8000,16000, verified convergence. At N=16000: s-wave E/E_R=(-2.691472756,-0.626885591,+3.947041880); p-wave lowest E/E_R=+0.720171677. Antipodal parity of s-wave first four states alternates +,-,+,-, so second s-wave state is a parity partner, not automatically hydrogen 2s.
The lowest s-to-p transition is 46.41778719 eV, versus flat nonrelativistic infinite-nuclear-mass 1s->2p benchmark 10.204269842 eV; conditional residual +36.21351735 eV. The third s-wave level, a possible first radial excitation, is separated by 90.32159293 eV. R=a0 is an explicit calibrated comparator, not a claim about the actual H(s)H radius.

## No-retuning holdout test
Inverting R/a0 to fit only 1s->2p gives R/a0=2.967605713 (R=1.570389313e-10 m). At independently checked N=16000, fitted 1s->2p=10.20427305 eV (finite-grid difference ~3.2e-6 eV), while the 2s-like transition is 9.92185090 eV, residual -0.28241894 eV against the same nonrelativistic hydrogen n=2 benchmark. This is an explicitly tuned one-transition fit, NOT a prediction. Model uncertainty and physical state mapping unresolved; do not use CODATA uncertainty alone as a z-score.

## Gates
PASS exact Laplacian, flux, dimensions, antipodal parity, finite-grid spectrum, benchmark arithmetic. FAIL historical inference that bare csc potential is harmonic/source-free or that free S3 eigenvalues directly give 1/n^2. UNRESOLVED finite-core H(s)H geometry, correct interaction operator, state/readout map, curvature radius and source neutrality. Numerical test development: an initial 1e-14 antipodal floating tolerance failed; revised to 5e-14 after identifying roundoff; no physics input changed. No independent CODATA prediction, no H(s)H construction candidate, no BEDROCK promotion. Full runnable code, stdout and Class P figures preserved in originating conversation.
