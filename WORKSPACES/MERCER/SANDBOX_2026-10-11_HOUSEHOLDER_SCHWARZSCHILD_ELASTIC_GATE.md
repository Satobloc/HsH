# SANDBOXED | Mercer: Householder Schwarzschild exterior / elastic-director gate (2026-10-11 UTC)

**Status:** mathematical representation and constitutive obstruction only. Nothing here is a physical claim or a derivation of gravitational dynamics. **CF:** CF-008 induced metric; CF-009 medium response.

## Primary reading / provenance
- Old SAT: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SAT ALL TOGETHER SYNTHESIS.txt`, blob `86cf006ca5ebf58263552c7515a9c9d575caae37`, substantial opening (~20k characters) including the worldline-timesheet grammar, aligned vacuum, timesheet backreaction and 4D Euclidean proposal. Historical conceptual claims are not proven by the source.
- Old math toolbox: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H TOOLKIT.txt`, blob `384b40a595d41daa4c573218022a0b802ad3deee`, entire document.
- HsH Sep 30: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt`, blob `81ae23a106939cba7e3d134ed5c90a7d7a979a25`, entire 33-line document, especially intuitions 5–6, Proposition B and E. Compiled file is not assumed wholly Nathan-authored without message-level verification.
- Current cross-read after construction: `WORKSPACES/MERIDIAN/SANDBOX_2026-10-05_BASIS_FREE_LORENTZ_RECOVERY.md`, blob `e1e7c7590ad20bae1b75507f24887b67589dd9c6`, entire; uses same Householder algebra but not this radial Schwarzschild mapping.
- Read current `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md` and material controls. Reviewed HSH_RESOURCES toolkit catalog, toolkit digest, Tool Chest, BOOT, War Room declaration and directory-level relevant references/tools; no external model imported. Restricted prior art not entered. Shared Mersearch request `2026-10-10-orson-one-drop-universe-math-001` is occupied; not overwritten. No claim of exhaustive historical novelty.

## Exact mathematical construction
In Euclidean flat 4-space `δ=dx0²+dr²+r²dΩ²` (`x0=ct`), choose unit director `u=cosθ(r)e0+sinθ(r)er` and Householder metric `g=δ−2u♭⊗u♭`. Put `A=cos(2θ)`, `S=sin(2θ)`, `A²+S²=1`:

`ds²=−A dx0²−2S dx0 dr+A dr²+r²dΩ²`.

For `A≠0`, `dT=dx0+(S/A)dr` gives exactly `ds²=−A dT²+A⁻¹dr²+r²dΩ²`. Direct symbolic computation for arbitrary A yields `G^T_T=G^r_r=(rA'+A−1)/r²`, `G^θ_θ=G^φ_φ=(rA''+2A')/(2r)`. **If** standard vacuum Einstein equations are imposed, `A=1−r_s/r`, giving exact Schwarzschild exterior with `sin²θ=r_s/(2r)`. The 4D Ricci tensor vanishes and Kretschmann invariant is `12r_s²/r⁶`. This imports GR's field equation; the SAT medium has not dynamically generated A or r_s.

At `r=r_s`, θ=π/4 and the original cross-term metric is regular, although diagonal Schwarzschild time is singular. This fixed real-unit-director representation fails for `r<r_s/2` because A<-1, and for negative-mass Schwarzschild because A>1. These are limitations of the ansatz, not of GR.

## New constitutive obstruction
For a naive positive Euclidean elastic director energy `E=(κ/2)∫|∇δu|²d³x` with `[κ]=energy/length`, the radial director's angular variation contributes:

`|∇δu|²=(θ')²+2sin²θ/r²=(r_s/r³)[1+1/{8(1−r_s/(2r))}]`.

Outside `r_s`, integrated to outer radius R,

`E(R)=2πκr_s[ln(R/r_s)+(1/8)ln((R−r_s/2)/(r_s/2))]`.

Thus `E(R)~(9π/4)κr_s ln(R/r_s)` **diverges logarithmically** at infinity. This is an obstruction to the *naive quadratic director-stiffness action*, not a divergence in Schwarzschild curvature or a general no-go theorem for H(s)H.

Control: a screened profile `A_screen=1−exp(−(r−r_s)/r_s)` matches the horizon A and A' but has finite gradient energy `E(∞)/(κr_s)≈10.8888459353` while `G^T_T=exp(−(r−r_s)/r_s)(r/r_s−1)/r² ≠0` outside the horizon. Simple screening trades exact vacuum GR for finite naive elastic energy.

## Executed tests
Python/SciPy numeric quadrature matches the closed-form E at R/r_s=2,10,100,1000 with max error `7.11e−15` (units κr_s). Eight independent 2×2 coordinate-transform checks yield max error `8.88e−16`; numerical vacuum Einstein residual max `2.22e−16`. Independent SymPy 4D curvature calculation returns exactly Ricci=0 and K=12r_s²/r⁶. Dimensionless E/(κr_s) at R=10,100,1000: Schwarzschild 16.7801,33.0925,49.3720; screened 10.8762,10.8888,10.8888.

## Failure conditions / next solver
Need a director/worldtube constitutive action whose Euler–Lagrange equation **selects** the Schwarzschild profile without hand-fitting it; inspect its energy, positive modes, principal symbol and causal cone. Try an invariant combination or boundary term avoiding the logarithmic cost without ghost degrees of freedom; include a finite core and independent perturbation/metric check. If this cannot be achieved, the Householder map remains a useful representation but not a physical medium mechanism.

Full runnable Python, JSON fixture, detailed checkpoint and Class P figures were produced in the run workspace and are linked in the corresponding conversation, not assumed committed with this note.

**Mercer Calder | 2026-10-11 | SANDBOXED**
