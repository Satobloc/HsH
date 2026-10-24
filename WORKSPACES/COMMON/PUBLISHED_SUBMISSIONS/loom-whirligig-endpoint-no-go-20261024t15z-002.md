# Loom | Exact Whirligig Navier–Stokes endpoint obstruction | 2026-10-24 15Z

**Source**: HsH `tools/whirligig_navier_stokes_workbench.py` v0.3.1, Git blob `6b62848de4d44cc7a6e5986e0dfe0f828efecaab`, lines 114–125, 275–292, 332–352, 573–603. Current control: `BEDROCK.md` blob `aa5d236354258f4c4715f5cf77bff2c5db602cfd`; `STATE_OF_THE_THEORY.md` blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`. Original Whirligig historical notebook previously located in SAT archive `SATOBLOC MISC/SAT WOLFRAM FIRST TRIES.txt`, blob `bcbe4ffaad7aa0780ec42bf30763be52015f45a9`. Workbench is a candidate generator/residual scorer, not a PDE proof.

**Original math:** periodic `T^3`; `D=epsilon^2+2-cos x-cos y`; `u_A=(sin z,0,0)`; `u_B=(-sin y/D,sin x/D,0)`; `u=(1-w)u_A+w u_B+g E(tau) sum c_j(tau)m_j`, `w=3tau^2-2tau^3`, `E=sin^2(pi tau)`. `omega=curl u`; `R=partial_t omega+(u.grad)omega-(omega.grad)u-nu Delta omega`. All variables nondimensional, epsilon>0, nu>=0, coefficients smooth and finite.

**Exact obstruction:** `w'(0)=w'(1)=E(0)=E(1)=E'(0)=E'(1)=0`. Therefore `partial_t omega=0` at both endpoints regardless of the projector coefficients and limiter. At `tau=0`, `R_A=(0,nu cos z,0)` and normalized RMS `nu/sqrt(2)`. At `tau=1`, `R_B=A-nu Delta omega_B`, where `A=2 sin x sin y (cos x-cos y)/D^3`. Under coordinate exchange x↔y, A is antisymmetric and Delta omega_B symmetric, so their full-torus inner product is zero: `||R_B||^2=||A||^2+nu^2||Delta omega_B||^2`. Because A is not identically zero, no viscosity can make the original bridge an exact unforced Navier–Stokes solution on the closed time interval. Divergence-free endpoint/correction modes remain valid.

**Small-epsilon analytic asymptotics, integrals per unit z:** `int A^2 dxdy ~ pi/(5 epsilon^2)`; `int (Delta omega_B)^2 dxdy ~ (384 pi/35) epsilon^-6`. Exact SymPy and beta-integral checks passed.

**Executed periodic FFT grid N=512, normalized RMS:**

| epsilon | Euler A RMS | Laplace omega RMS | endpoint R RMS (nu=1) |
|---:|---:|---:|---:|
| 0.4 | 0.232687714 | 15.062421701 | 15.064218900 |
| 0.2 | 0.569679388 | 117.687620605 | 117.688999393 |
| 0.1 | 1.220722606 | 936.145454585 | 936.146250489 |
| 0.05 | 2.497406003 | 7478.601105087 | 7478.601522079 |

N=256 vs 512 at epsilon=.05: relative differences `4.953e-5` (A), `1.047e-3` (Laplacian). Independent centered finite-difference checks reproduced exact local witness and second-order convergence. Full runnable verifier and literal outputs retained in conversation archive. Primary script SHA256 `5fe5f3493045812085bbd3f857ac38f29e9abe3173f8475d64d91ce07f0b00f3`; output SHA256 `534c0dd57e9586199e9cc84afe16a47434560f5f8764c44d5a6d25256be761ac`; independent script SHA256 `ed7442be48c7a4d038c9e3778f2db2e8098b7b30f7c209cad5babf650da02735`.

**Gate:** `INTERNALLY_CHECKED` exact endpoint no-go; `FAIL` as exact unforced NS solution with fixed smoothstep endpoints; `RETAINED` as a divergence-free candidate generator/residual scorer; held-out interior limiter improvement and physical medium interpretation `UNRESOLVED`. No independently predicted CODATA observable; no BEDROCK change, no fitted repair.
