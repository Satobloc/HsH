# Meridian ◈ | Smooth stellar interior from a one-profile tetrad
**Date:** 2026-10-08 UTC / 2026-10-07 EDT  
**Status:** SANDBOXED mathematical representation, NOT a new physical theory, NOT a claim of derivation of Einstein equations.  
**Task:** Test the center-cusp failure of the previous conformal-Householder stellar interior construction.  
**Exposure:** Old SAT primary material and current HsH source were read before constructing the solver; HSH_RESOURCES used only for tool/reference routing.

## Sources actually read
- SAT archive: `2026/SAT MATH — BACKBONE.txt`, opening 320 lines (fetched ~51k chars; ~28k chars inspected in this pass): historical Universal Indicatrix `y=r R x0`, `R∈SO(4)`, tetrad/metric mapping, timewave-filament coupling. Generated synthesis; its physical assertions are not accepted as proofs.
- HsH: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT Math Extension.txt`, lines 1–320 (entire returned ~6.9k chars): proposed optics/ADM/Frobenius/strain crosswalk; assistant-generated suggestions, not Nathan-endorsed derivations.
- HsH: `DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/KEY CONCEPT - IRI.txt`, lines 1–200: Nathan's direct statement that worldtube bending resistance is inertia and class-dependent; assistant's calculations distinct.
- HsH: `🔑/🔑.md` opening: one gradient, no dual shell; O_eff minimal representation, GR as anchor.
- Control: `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, `REFERENCE_DESK/README.md`, symbol registry, Mersearch release, workflow and scheduler pointers. HSH_RESOURCES 5-Oct packet triaged via its toolkit index, War Room declaration and Common desk; quarantine roots unopened.

## Construction (new LOCAL:MERIDIAN-INTERIOR symbols)
Standard GR constant-density star, units G=c=1, exterior mass M, areal radius R, 0<2M/R<8/9.
Set a=sqrt(1-2M/R), k=2M/R^3, C=4/(1+a)^3 and isotropic Euclidean radius ρ.
Define z=k C²ρ² and
  λ(ρ)=2C/(1+z)
  N(ρ)=[(3a-1)+(3a+1)z]/[2(1+z)].
Let a *fixed* unit time normal e4 and coframe deformation F=diag(λ,λ,λ,N):
  g=Fᵀ diag(+,+,+,-) F
   = -N²dτ²+λ²(dρ²+ρ²dΩ²).
The areal radius is r=ρλ=2Cρ/(1+z), and
  dr/dρ=λ(1-z)/(1+z)=λ sqrt(1-k r²).
The lapse satisfies N=(3a-sqrt(1-k r²))/2, exactly the standard interior Schwarzschild lapse.
The isotropic surface ρ_s=R(1+a)²/4 matches the exterior
  λ_ext=(1+M/(2ρ))²,
  N_ext=(1-M/(2ρ))/(1+M/(2ρ)).
Both functions and first derivatives match at ρ_s; both have vanishing radial derivatives at ρ=0, hence smooth Cartesian center.

## Exact constraint identities
Writing ψ=sqrt(λ), the spatial scalar curvature is
  ^3R = -8 ψ^(-5) (ψ''+2ψ'/ρ) = 6k = 12M/R³ = 16π ε,
  ε=3M/(4πR³).
The lapse obeys
  Δ_γ N = 4π N (ε+3p),
  p=ε(b-a)/(3a-b), b=(1-z)/(1+z).
These identities, the areal map, the surface C1 matching, and the center-regularity derivatives were checked symbolically with SymPy (all residuals identically zero).
For this particular matter model there is even a **single radial profile**:
  N=(3a+1)/2 - λ/(2C).
For the vacuum exterior, N=2/sqrt(λ)-1. Both relations are matter/region-specific, not universal H(s)H laws.

## What follows, and what does NOT
- The previous center cusp is an ansatz failure, not a generic 4D geometric obstruction. A smooth 4D coframe reproduces the full star with a fixed time-normal direction.
- In standard GR, metric geometry alone does NOT uniquely identify a physically privileged normal-turning mechanism: the same metric may be described by different frames/coordinates. A physical time-normal requires a separately specified operational/invariant constraint.
- This coframe is a standard tetrad representation. F need not be the Jacobian of a Euclidean coordinate transformation; calling it a deformation is descriptive, not an invented force.
- No numerical SAT constants, 24-cell assumptions, or particle labels enter this test.

## Failure condition and next solver test
The standard incompressible solution becomes singular at the Buchdahl threshold 2M/R→8/9 (N(0)→0 and central pressure diverges); do not attribute that to H(s)H.
Next: define a candidate ᚼ as a *frame deformation plus constrained normal rotation* and test whether normal-rotation invariants are uniquely determined by a prescribed metric + matter field. If not, treat the split as representation freedom, not derived physics. Compare exact Einstein residuals, Frobenius integrability, smooth Cartesian center, and C1 surface matching. A meaningful physical discriminator must depend on an invariant not adjustable by a frame choice.

**Reproducible script and Class P figures:** supplied in task thread as `meridian_smooth_frame_2026-10-08.zip`; GitHub note does not claim script committed.
