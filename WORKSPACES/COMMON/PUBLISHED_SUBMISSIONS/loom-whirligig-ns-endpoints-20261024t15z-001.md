# Loom | Archived Whirligig / Navier-Stokes endpoint audit | 2026-10-24T15Z

## Provenance
Current HsH BEDROCK.md: 548 lines, blob aa5d236354258f4c4715f5cf77bff2c5db602cfd; STATE_OF_THE_THEORY.md: 155 lines, blob b5958a1056c2541f00ab4f3477d8acc32426cfe9.
Randomly selected archival source (Python secrets.randbelow(4), index 3): SAT_THEORY_ARCHIVE_2023-25/SATOBLOC MISC/SAT WOLFRAM FIRST TRIES.txt, complete 10311-line document retrieved, blob bcbe4ffaad7aa0780ec42bf30763be52015f45a9. Historical Whirligig/NS notebook v0.2. Source may contain nonpublic context: only mathematical extracts included here.
Operative counterpart HsH/tools/whirligig_navier_stokes_workbench.py v0.3.1, blob 6b62848de4d44cc7a6e5986e0dfe0f828efecaab; HsH/WORKSPACES/COMMON/HANDOFF_2026-10-20_WHIRLIGIG_NAVIER_STOKES_WORKBENCH.md, blob 8aa81f3207da27356fd6da7debb5913f386399a4. Both describe a candidate generator and residual scorer, not a PDE proof.

## Recovered mathematical fixture
Periodic x,y,z in T^3; epsilon>0; D=epsilon^2+2-cos(x)-cos(y).
uA=(sin(z),0,0); uB=(-sin(y)/D,sin(x)/D,0).
Bridge u=(1-w)uA+w*uB+g*sin(pi*tau)^2*sum_j c_j(tau)*m_j, w=3*tau^2-2*tau^3.
Vorticity-form residual R=partial_t omega+(u.grad)omega-(omega.grad)u-nu*Laplacian(omega); omega=curl(u).

## Exact mathematical findings (SymPy executed)
div(uA)=div(uB)=0. uB=(-partial_y log(D),partial_x log(D),0).
omegaA=(0,cos(z),0).
For stationary uA, R=(0,nu*cos(z),0), nonzero when nu>0. The distinct standard control uA(t)=exp(-nu*t)*sin(z)*e_x has zero unforced NS residual; not substituted into the source model.
omegaB_z=(cos(x)+cos(y))/D-(sin(x)^2+sin(y)^2)/D^2.
Steady Euler vorticity residual for B:
uB.grad(omegaB)=2*sin(x)*sin(y)*(cos(x)-cos(y))/D^3, generically nonzero even at nu=0.
Thus divergence-free endpoints are valid test snapshots, but neither is generally a stationary unforced viscous Navier-Stokes solution; B is not a steady Euler solution.

## Executed numerical tests
Periodic midpoint quadrature N=1024, per unit z; E=0.5*integral |uB|^2 dxdy; Z=integral |omegaB|^2 dxdy.
epsilon 0.4: E=10.573528913656, Z=51.955331291553.
epsilon 0.2: E=18.342917340829, Z=209.290602702018.
epsilon 0.1: E=26.748008100138, Z=837.709482381916.
epsilon 0.05: E=35.365289768631, Z=3351.017263794626.
Z*epsilon^2/(8*pi/3) approaches 1: 0.992273735403, 0.999289018881, 0.999942037470, 0.999995553598.
As epsilon->0, E~4*pi*log(1/epsilon)+O(1), Z~8*pi/(3*epsilon^2); no finite-time singularity conclusion.
At x=0.7,y=1.1,epsilon=0.15, steady B residual_z is +0.687507059415 (nu=0), +0.4875579749997 (nu=0.1), -1.311983784738 (nu=1). Grid N=512/1024 enstrophy relative difference at epsilon=0.05: 1.112e-12.
Executable verifier SHA256 f4f0cd649286d9faa8415e09959fb57797168dc808444125ec18cc5943e80a2c; literal output SHA256 d2e2afb4b28fd2a5ba189f358f21b9066580fb65415b58c4b13fd94d61c58660. Full code and outputs retained in conversation archive and attached bundle.

## Gate
INTERNALLY_CHECKED: incompressibility, exact vorticity identities, asymptotics and quadrature.
FAIL AS STEADY PDE SOLUTIONS: stationary endpoints do not solve unforced viscous NS; B fails steady Euler. This is not a failure of the source's explicitly stated residual-scoring purpose.
UNRESOLVED: whether projector/residual limiter improves held-out residuals, physical H(s)H medium interpretation, dimensional constitutive closure.
No independent CODATA observable or physical prediction; no ACTIVE_CODATA_VERIFICATION promotion and no BEDROCK mutation.
