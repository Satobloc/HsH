# SAT.O Blockwave velocity-curl gate | Kestrel continuation | 2026-10-22 16Z

**Status:** INTERNALLY_CHECKED kinematic identity; historical physics UNRESOLVED; no CODATA observable. **SANDBOXED.**

## Primary archive provenance

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25/LEAN CHECK_drafts/SATO-BLOCKWAVE_leancheck.txt`, Git blob `b128efd3004fe34e48dc7da2c39bdd14f9926ddc`, section I, velocity variation. The Lean-looking file contains `sorry` and is not a Lean proof.
- Live `Satobloc/HsH/BEDROCK.md`, Git blob `83caab6cb3b2dc89ae4ba81cf3ff4873494ca8e8`, including ND-2026-10-18-02/03 and ND-2026-10-22-02/03.
- `STATE_OF_THE_THEORY.md`, Git blob `b5958a1056c2541f00ab4f3477d8acc32426cfe9`.
- Comparison `WORKSPACES/MERIDIAN/SANDBOX_2026-10-22_CRULLER_R4_MATERIAL_CURVATURE_SHEAR_AND_OSCULATING_ORIENTATION.md`, Git blob `45a3676dee8c34de92b018b30b5148d4cd0e6bc9`. It is an independent geometric comparison, not an originating source for the SAT.O equation.

## Source and derived equations

Original stationary velocity equation (archived):

    v = grad chi + lambda/rho * grad(rho*Phi)

For smooth rho>0 and spatially constant lambda:

    v = grad(chi+lambda*Phi) + lambda*Phi*grad(log rho)
    curl v = lambda*grad Phi cross grad(log rho)

For a simple connected loop in a simply connected nonsingular patch:

    circulation = integral(surface) lambda*(grad Phi cross grad(log rho)).n dS

EXPLICIT OFF-SHELL CONTROL: rho=1+a*x>0, Phi=b*y, chi=0 yields

    v=(lambda*a*b*y/(1+a*x), lambda*b,0)
    curl v=(0,0,-lambda*a*b/(1+a*x))

For the counterclockwise circle x=R cos t,y=R sin t and |aR|<1:

    circulation = 2*pi*lambda*b*(sqrt(1-a^2*R^2)-1)/a

Independent SciPy quadrature at (lambda,b,R)=(1,2,1): a=.05 -> -0.31435586072092336; a=.2 -> -1.2694612240263887; a=.6 -> -4.188790204786391; errors <3e-15 against the analytic formula.

ALIGNMENT HOLDOUT: grad Phi parallel grad rho makes curl v=0; lambda=0 makes curl v=0. Spatially variable lambda adds grad(lambda) cross (grad(rho*Phi)/rho), so the printed identity has an explicit constant-coupling prerequisite.

## Gate and propagation

- **INTERNALLY_CHECKED:** exact vector identity, explicit nonzero-curl field, circulation, control limits and dimensional gate. Tested with executed SymPy/SciPy.
- **UNRESOLVED:** the explicit curl fixture is NOT a solution to all historical Euler-Lagrange equations; it proves only that the velocity equation alone permits such structure. No Kelvin-vortex persistence, repulsion, spin, electromagnetic or Kerr mechanism established.
- **REJECTED dimensional claim:** with rho mass/volume and Phi energy/mass, the source's dimensionless lambda makes the action interaction term energy-density/time; lambda requires dimensions of time to homogenize this historical 3+1 Lagrangian, unless source variables are independently retyped.
- **CODATA:** none applicable. No independently predicted dimensional observable or uncertainty-normalized residual. No BEDROCK promotion or new physical mechanism.
- **Genealogy:** archived SAT.O mathematical exposition, not independently attributed to Nathan as sole equation author.
- **Privacy:** only explicitly named public HsH and SAT repositories read; no prior-art or quarantined source consulted.

## Reproducibility

Source kernel, with SymPy:

    v = grad(chi) + lam*grad(rho*phi)/rho
    assert simplify(curl(v) - lam*grad(phi).cross(grad(rho))/rho) == zeros(3,1)

Complete executed script and output are retained in the corresponding ChatGPT calculation turn's downloadable reproduction bundle.

**Publication:** This packet is a verification-queue control, not an established physical law or a CODATA result.
