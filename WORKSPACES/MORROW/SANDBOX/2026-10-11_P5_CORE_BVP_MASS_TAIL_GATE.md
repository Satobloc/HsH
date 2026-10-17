# SANDBOXED | Morrow/Kestrel | p=5 exterior core boundary-value gate | 2026-10-11

**Status:** Independent mathematical sandbox, not SAT/H(s)H doctrine or physical particle prediction. Geometric units G=c=1. No historical particle constants fitted.

## Source provenance actually read
- Old SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/RMS Spacetime Filaments.txt`, entire 10,663 characters, blob `0323682e7a49278b5a76d0c6a5a7787a13eb17d6`; physical time surface, 4D filaments, reciprocal tug. `Filament onto.txt`, opening ~15,000 of 103,710 characters, blob `a13c67ff2b47cf178672804d91771e01d4c4a3e1`; flexible timesheet and finite tension conjectures.
- Current HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt`, entire 9,258 characters, blob `81ae23a106939cba7e3d134ed5c90a7d7a979a25`; reciprocal time-surface/filament forces. `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SATv TIME_WAVEFRONT.txt`, entire 3,400 characters, blob `fe1a6f603798c31fa4e5bf704bb31cbcc5ec4ce9`; aligned vacuum and tentative selective interaction.
- Predecessor: `WORKSPACES/MORROW/SANDBOX/2026-10-11_P5_VARIATIONAL_TAIL_GATE.md`, entire; conditional p=5 asymptotic selection and unconstrained whole-space Derrick obstruction.
- Onboarding front door, current scope, Cross-Formalism Index, symbol/namespace/citation controls, Common state, reference desk and October 5 supporting-resource overview read. No external theory imported, no restricted materials accessed. Exact-path reading, no corpus-wide novelty/search claim.

## Typed test objects and equation
`LOCAL:MORROW:P5-CORE`: theta(r) = Euclidean unit-normal tilt, **not** historical SAT theta_4; u=(cos theta,sin theta e_r), D=theta_r²+2sin²theta/r²; E5=4pi int_(r_c)^infinity r² D^(5/2) dr. Induced metric g=delta-2u⊗u, with m(r)=r sin²theta(r). This is a test ansatz; m is not a derived particle mass.

Euler–Lagrange: [r² D^(3/2) theta_r]_r=D^(3/2) sin(2theta).
Let x=ln r, w=dtheta/dx, S=w²+2sin²theta. Exact autonomous system:

- theta_x=w
- w_x=[w S+sin(2theta)(sin²theta-w²)]/[2w²+sin²theta].

## New symbolic repair
The decaying p=5 branch has theta=A r^-1/2 + B r^-3/2 + C r^-5/2 + ... . SymPy series substitution yields B=-(5/33)A³ and C=(531/15730)A⁵. Thus with M=A²,

**m(r)=M-(7/11)M²/r+(530/1573)M³/r²+O(r^-3).**

The induced static lapse is f=1-2M/r+(14/11)M²/r²+... . This is *RN-like geometrically*, not an electric-charge derivation. Effective Einstein source has rho=m'/(4pi r²)~7M²/(44pi r⁴), p_r=-rho, p_t~rho. This repairs the earlier practice of prescribing an unrelated finite-mass profile by hand.

## Numerical exterior fixture
Independent SciPy solve_ivp inward from x=20 with M=1, relative tol 1e-12, absolute tol 1e-14, max step .025. At r=2M: theta=0.6588201243, m=0.7495393145, f=0.2504606855, m'=0.0980740822, p_t/rho=0.778528870. At r=5M: m=0.8850140532, f=0.6459943787, p_t/rho=0.901745992. Sampled r>=1.5M has m'>0 and 0<p_t/rho<1 (NEC/WEC/DEC), not an analytic all-radius proof. Extrapolated static lapse zero is at r≈1.3166354597M; choose test core r_c=2M so exterior f>0.

For r_c=2M and unnormalized E5, exterior energy E5=0.5033070059. Canonical core boundary momentum P_c=20pi r_c² D_c^(3/2) theta_r(r_c)=-3.4022550977. **The core action needed to balance this traction has not been derived.** No junction/stability proof.

At r=2M: f'=0.2766955751, f''=-0.2003420707; timelike-radial and timelike-angular curvature boosts are nonzero and noncommuting, but this is ordinary GR holonomy, not a particle spin or braid invariant.

## Important correction and failure gates
Unconstrained whole-space Derrick scaling remains an obstruction to an E5-only smooth lump. However dilation u(x/lambda) changes asymptotic mass M->lambda M, so it is **not an admissible variation at fixed M**; fixed core radius also breaks it. Do not misapply the earlier no-go to this exterior boundary-value solution.

The full model fails if no finite core can provide the traction and acceptable junction/stability/energy constraints. Next: specify a core boundary action independently, vary both theta_c and r_c, shoot outward from its physical traction rather than prescribing M at infinity. Keep the ER/Kerr core speculative.

## Reproducibility
Full report and Python numerical solver, plus three code-rendered Class P figures, retained in Morrow/Kestrel conversation artifact `morrow_kestrel_p5_core_20261011`. No private HSH_RESOURCES paths cited as public evidence.
