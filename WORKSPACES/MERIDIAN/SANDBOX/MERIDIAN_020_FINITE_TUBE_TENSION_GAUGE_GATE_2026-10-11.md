# Meridian 020 | Finite-radius worldtube: tension, bending, and SO(3) frame gauge
**SANDBOXED / noncanonical | 2026-10-11 | Meridian**

## Main calculation
For a unit-speed curve γ(s) in auxiliary Euclidean R4, let T=γ', κ⃗=T', a>0 the **normal-fiber radius**, and n∈S² the unit normal. In a Bishop normal frame, X(s,n)=γ(s)+a n and X_s=(1−aκ⃗·n)T. The induced tube-boundary metric has h_ss=(1−aκ cosθ)², h_θθ=a², h_φφ=a²sin²θ. Therefore, for aκ<1,

dV₃=a²(1−aκ cosθ)sinθ ds dθ dφ;  ∫_{S²}dV₃/ds=4πa² **exactly**.

The trace of outward extrinsic curvature is K=2/a−κ cosθ/(1−aκ cosθ). For the LOCAL trial functional E_b=(β₃/2)∫(K−2/a)²dV₃,

dE_b/ds=πβ₃ a²κ² I(q),  q=aκ,
I(q)=−2/q²+ln[(1+q)/(1−q)]/q³
=2/3+2q²/5+2q⁴/7+⋯.

Hence the leading effective rod rigidity B_eff=4πβ₃a²/3, defined by E_b≈(B_eff/2)∫κ²ds. The exact bending cost increases without bound as q→1⁻. This is a local focal gate; global self-overlap needs a separate reach test.

## Frame gauge gate for ᚼ/Whirligig
For arbitrary rotating normal coordinates n_s=−(κ⃗·n)T+Ωn, Ωᵀ=−Ω, the induced metric acquires h_sA≠0, but the Schur complement gives det(h)=a⁴sin²θ(1−aκ⃗·n)² **independent of Ω**. Normal-frame rotation alone is a gauge change, not material twist. A physical twist variable needs an independent transported material director, anisotropic boundary marking, or equivalent gauge-invariant structure.

## Minkowski interpretation and critical caution
For a timelike centerline in flat Minkowski spacetime with Fermi-Walker spatial normals, h_ττ=−c²(1+a a_acc·n/c²)² and the normal fiber remains S². The integrated worldtube measure per proper time is 4πa² (with the c conversion handled in the action). A uniform worldtube area-energy density σ_area gives S_area=−4πa²σ_area∫dτ, algebraically the point-particle action with m_eff=4πa²σ_area/c². **This does not mean area tension supplies no inertia:** proper-length variation produces the free geodesic. It means no *extra curvature penalty at fixed proper length*. The Fermi tube requires a|a_acc|/c²<1 locally. Curved GR, Kerr core, particle identity and physical source law are not established by this kinematic construction.

## Executed checks
SymPy exact integral and series; SciPy quadrature over q=0,.1,.2,.35,.5,.8,.95,.99: area ratio=1 throughout, max bending-integral error 1.70e−14. Independent finite-difference R4 circular tube metric max component error 8.28e−11. 100 seeded SO(3) normal-frame rotations: determinant max discrepancy 5.11e−15 despite large off-diagonal metric terms. Exact bending enhancement relative to leading quadratic term: q=.2→1.02470777, .5→1.18334746, .8→1.74968138, .95→3.08539725, .99→5.12208838.

## Source/provenance and status
Historical SAT substantially read: Satobloc/SAT_THEORY_ARCHIVE_2023-25/`RMS Spacetime Filaments.txt` (complete, SHA 0323682e7a49278b5a76d0c6a5a7787a13eb17d6) and `SAT ALL TOGETHER SYNTHESIS.txt` (opening through ~105, SHA 86cf006ca5ebf58263552c7515a9c9d575caae37). Current HsH substantially read: `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt` (complete, SHA 81ae23a106939cba7e3d134ed5c90a7d7a979a25) and `H(s)H MANIFOLDS.txt` (opening ~180 lines, SHA 54f2f530697ab6e9c44758ce3406c4144915c73d). Project context: Meridian 019 spherical bending; Cross-Formalism Index CF-003/007/009; front door, symbol/toolbox controls and reference desk. Supporting reference packet reviewed for discovery only; no restricted external material accessed. Historical source facts motivate finite-core/timesheet question; mathematical tube identities are independently derived; interpretation as H(s)H mechanics remains sandbox conjecture.

LOCAL:MERIDIAN-020 symbols: a [L] normal-fiber radius; κ [L⁻¹] centerline curvature, q=aκ dimensionless; β₃ coefficient of 3D tube-boundary curvature functional (not Meridian 019 κ_b); Ω [L⁻¹] skew normal-frame connection; K [L⁻¹] extrinsic curvature trace. No symbol promotion.

**Next solver test:** compare equal-proper-length worldlines of different curvature under pure area and bending functionals; introduce a transported material director with gauge-invariant covariant derivative and verify SO(3) invariance. Check higher-derivative mode/stability problems before asserting a physical constitutive law. No theory promotion.
