# Calculation Relay :00 | Enheduanna | 2026-10-24 17:00 UTC

Status: INTERNALLY_CHECKED mathematics; REJECTED as unforced Navier-Stokes endpoint transition; physical correspondence UNRESOLVED. No CODATA observable.

## Source genealogy and controls
- Historical: Satobloc/SAT_THEORY_ARCHIVE_2023-25, `SATOBLOC MISC/SAT WOLFRAM FIRST TRIES.txt`, blob `bcbe4ffaad7aa0780ec42bf30763be52015f45a9`, 10,311 lines. Undated internal transcript containing the Whirligig/NS v0.2 source; source date not established.
- Current implementation: Satobloc/HsH `tools/whirligig_navier_stokes_workbench.py`, blob `6b62848de4d44cc7a6e5986e0dfe0f828efecaab`, endpoint definitions around lines 114-125.
- BEDROCK `aa5d236354258f4c4715f5cf77bff2c5db602cfd`, 548 lines; STATE `b5958a1056c2541f00ab4f3477d8acc32426cfe9`, 155 lines; both retrieved in full. Controls include ND-2026-10-18-02/03 and 2026-10-23 correction-first and Factory Floor rules.
- Source privacy: original historical document is public but mixes unrelated content; only non-sensitive equations reproduced here.

## Original construction
Flat periodic T^3 = (R/2pi Z)^3, dimensionless coordinates. D=eps^2+2-cos(x)-cos(y), eps>0. u_A=(sin(z),0,0); u_B=(-sin(y)/D,sin(x)/D,0). The historical bridge uses w(tau)=3tau^2-2tau^3, envelope sin^2(pi tau), and divergence-free correction modes.

## Stronger exact reachability obstruction
For any nu>=0, the unforced NS (or smooth Euler for nu=0) solution starting at u_A is U(t)=exp(-nu t)sin(z)e_x, with constant pressure: U_t+(U.grad)U-nu Delta U=0. This is smooth for all t. For any other sufficiently regular unforced solution V with the same initial condition, difference W=V-U obeys d||W||_2/dt <= ||grad U||_infty ||W||_2; since W(0)=0, Gronwall yields W(t)=0. For nu>0 this also covers Leray-Hopf solutions by weak-strong uniqueness. Thus u_B cannot be reached at any finite T, independently of interpolation shape, projector modes, or limiter.

Orthogonality in z gives an exact distance identity (volume-normalized):
  ||u_B-U(T)||_RMS^2 = exp(-2nu T)/2 + E_B/(2pi^2),
  E_B=(1/2) integral_[0,2pi]^2 |u_B|^2 dxdy.
At eps=.15, nu=T=1, periodic midpoint quadrature N=256 gives E_B=21.787901852256 and distance=1.082338045157 (dimensionless). N=512 agrees to displayed precision; N=64 gives 1.082341157912.

For a forced bridge V, with Leray-projected body force f and same initial condition, stability gives
  integral_0^T ||f||_RMS dt >= exp(-integral_0^T ||grad U||_infty dt) ||V(T)-U(T)||_RMS.
At nu=T=1, integral ||grad U||=1-exp(-1); the evaluated necessary lower bound is 0.575223280. This is a mathematical forcing budget, not a measured force.

## Numerical test
A 64^3 periodic Fourier Leray projection of the uncorrected smoothstep bridge at eps=.15, nu=T=1 yields projected forcing RMS 0.707106781 at tau=0, 12.006928378 at tau=.5, and 22.529264139 at tau=1. Trapezoid integration over 17 time nodes gives 11.805651673; this estimate is not a certified quadrature bound. It exceeds the necessary lower bound. Tests performed in Python with SymPy and NumPy, not simulated by prose.

## Gate
PASS: exact solenoidality; explicit global unforced solution; exact energy uniqueness inequality; exact L2 endpoint orthogonality; 64/128/256/512 grid convergence; periodic projected forcing estimate.
FAIL: any exact unforced NS trajectory connecting the stated initial and terminal fields.
UNRESOLVED: a physically justified forcing law, revised boundary conditions, H(s)H identification, and any CODATA observable. The old apparatus remains a useful residual scorer, not a proof of an unforced flow.
No BEDROCK promotion, no tuning, no new physical claim.
