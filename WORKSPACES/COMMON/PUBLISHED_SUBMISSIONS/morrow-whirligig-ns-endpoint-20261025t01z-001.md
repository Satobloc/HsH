# Morrow :00 | Historical Whirligig/NS endpoint obstruction | 2026-10-25T01Z

SANDBOXED mathematical audit. Not BEDROCK, not a tentative H(s)H construction candidate, not a Navier-Stokes regularity proof.

## Source provenance
- Ring: h=337; seq=1685; index=13 Morrow; next ring Kestrel; next hourly Orson Vay.
- HsH BEDROCK.md fully retrieved (548 lines; blob aa5d236354258f4c4715f5cf77bff2c5db602cfd), including ND-2026-10-18-02/03 and correction-first; STATE_OF_THE_THEORY.md fully retrieved (155 lines; blob b5958a1056c2541f00ab4f3477d8acc32426cfe9).
- Primary SAT archive [[H(s)H runs]]/baseline/target_equations.txt, complete 31 lines, blob 936ed435eb522996325a3fd5b5b6955f8fc6722a.
- Related older SAT archive H(s)H Dev +/H(s)H CLAUDUH.txt, blob 6d743efc2b75bbdabf124d0ce1cb5f73f9ea95c3, 197 lines/32433 chars, inspected lines 1-75. Original composition date uncertain.
- Later HsH tools/whirlygig_navier_stokes_workbench.py v0.3.1, blob 6b62848de4d44cc7a6e5986e0dfe0f828efecaab, 680 lines/24543 chars; and WORKSPACES/COMMON/HANDOFF_2026-10-20_WHIRLIGIG_NAVIER_STOKES_WORKBENCH.md blob 8aa81f3207da27356fd6da7debb5913f386399a4.
- Genuine random reading: secrets.randbelow(5) returned index 4 from declared five-file SAT pool. Selected 2025-8-24 STATUS OVERVIEW.txt, fully read 144 lines/11233 chars, blob a23e1458a882340de4f6319c7eb8a34c7f6c5ab0; unrelated bending-weighted scattering claim not independently verified.
- Mersearch guide blob 53ff8ba46672110efebeaa7785ad1e0dd2a782af; four shared lanes occupied. NO Mersearch execution, GitHub search fallback only, incomplete three-root coverage; HSH_RESOURCES not accessed. Public-only material.

## Original mathematics
On T^3, x,y,z dimensionless; epsilon>0:
u_A=(sin z,0,0);
D=epsilon^2+2-cos x-cos y;
u_B=(-sin y/D,sin x/D,0).
w(tau)=3tau^2-2tau^3; E(tau)=sin^2(pi tau);
u_W=(1-w)u_A+w u_B+g E sum_j c_j(tau)m_j.
omega=curl u_W;
R_NS=(1/T)partial_tau omega+(u_W.grad)omega-(omega.grad)u_W-nu Delta omega.
The original target is R_NS=0.

## Exact reconstruction and correction
1. psi=log D; u_B=(-partial_y psi,partial_x psi,0). Both endpoints divergence-free. D>=epsilon^2, so u_B smooth periodic for epsilon>0.
2. w'(0)=w'(1)=E'(0)=E'(1)=0. With smooth finite Fourier correction coefficients, endpoint time derivatives vanish, regardless of winding, projector or limiter.
3. At tau=0, omega_A=(0,cos z,0), Delta omega_A=-omega_A; advection/stretching vanish. R_NS=(0,nu cos z,0), hence at z=0 the norm is nu. FAIL for nu>0.
4. At tau=1 and x=y=0, u_B=0, omega_B=(0,0,2/epsilon^2), Delta omega_B=(0,0,-8/epsilon^4-2/epsilon^2). Thus R_NS=(0,0,nu*(8/epsilon^4+2/epsilon^2)). FAIL for all nu>0, epsilon>0. This endpoint obstruction is independent of the Whirligig correction.
5. Earlier assistant interpretation that u_B at origin scales as 1/epsilon^2 is incorrect: u_B(0)=0. On y=0 the exact positive-axis velocity maximum is 1/[epsilon sqrt(2+epsilon^2)], asymptotic 1/(sqrt(2)epsilon). Vorticity origin scales 2/epsilon^2 and viscous residual scales 8nu/epsilon^4. This corrects an interpretation, not the original field.
6. epsilon->0 is a singular parameter family on the z-circle, not a finite-time NS blowup. Periodic vorticity integral is zero for epsilon>0 because omega_z=Delta log D.
7. Units: angular coordinates and solver coefficients are dimensionless; physical interpretation needs length L, speed U, nu_nd=nu_phys/(UL), residual scale U^2/L^2. No physical calibration or independent CODATA quantity.

## Executed tests
- SymPy exact divergence, streamfunction, Laplacian, endpoint residual, velocity extremum: PASS.
- At nu=1, epsilon=.15: u-axis max 4.68775035956, omega origin 88.8888888889, endpoint R=15891.3580247.
- At nu=1, epsilon=.03: u-axis max 23.5649245279, omega origin 2222.22222222, endpoint R=9878765.4321.
- Independent stdlib nested central-difference curl/Laplacian: h=epsilon/128 gives relative errors 1.379e-4 and 1.373e-4 for epsilon=.15,.03; ratios approach 4 on halving h. PASS.
- Divergence finite differences at three off-axis points converge to zero at second order. Initial too-strict 1e-8 absolute assertion FAILED and was retained; corrected to explicit convergence test.
- T^2 periodic integral of vorticity converges to ~2e-15 on 512x512 grid at epsilon=.15.
- Complete runnable scripts, stdout, retained failure and Class P plot in Nathan conversation/local bundle.

## Gate
INTERNALLY_CHECKED: mathematical endpoints, streamfunction, regularization and exact residual.
REJECTED AS EXACT VISCOUS SOLUTION: supplied smoothstep bridge cannot solve unforced incompressible viscous NS at both endpoints for nu>0 with finite smooth corrections.
UNRESOLVED: alternate time evolution, forcing, physical Kelvin medium mapping, worldtube core calibration. No uniquely justified repair.
NOT A TENTATIVE H(s)H CANDIDATE; no CODATA quantity or independent physical prediction; no BEDROCK/STATE changes.
