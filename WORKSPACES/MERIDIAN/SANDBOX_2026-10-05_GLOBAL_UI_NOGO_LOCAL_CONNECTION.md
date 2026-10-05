# Meridian XCIV — Global UI No-Go / Local-Connection Upgrade
Status: SANDBOXED; not canonical SAT/H(s)H.

## Sources actually read
- Old archive: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/Worldlines.txt`, lines 1–1200 requested/read. Extracted the old UI trajectory `y(λ)=r(λ)R(λ)x0`, six-plane SO(4) angular machinery, worldline/superhelix language, and intersectional-trace framing. Historical particle assignments, constants, lattice locks, and claimed predictions were not used as targets.
- HsH Sep-30 dump: `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT BUILDING STORY.txt`, lines 1–1400 requested/read. Extracted its explicit formalization of the evolution operator as dilation + SO(4) rotation and, crucially, the embedded critique that a point map must be upgraded to a contour evolution `γ(λ,s)`.

## Independent result
If a whole filament is transformed by a single similarity
[
Y(s)=rQgamma(s),qquad r>0,;Qin SO(4),
]
then pairwise distances scale uniformly, topology is unchanged, and Euclidean curvature obeys
[
kappa_Y=kappa_gamma/r.
]
More generally all generalized Frenet curvatures scale with inverse length while dimensionless curvature ratios and winding structure are preserved. Therefore a global UI map cannot turn a helix into a genuine superhelix or create new local coiling order. It can only rotate/dilate an already-existing one.

This is a no-go for identifying ᚼ with a global `rR` similarity if ᚼ is supposed to create helix→superhelix structure.

## Minimal upgrade
Promote the frame to depend on filament parameter:
[
Y(s)=r(s)R(s)gamma(s),qquad A_s=R^Tpartial_sRinmathfrak{so}(4).
]
Then
[
R^T Y' = r'gamma+r(gamma'+A_sgamma).
]
The extra term `A_s γ` is absent from the global UI and can generate a second winding scale. This makes the natural H(s)H mechanical object not merely `R`, but the local SO(4) connection `A_s`.

Candidate compact grammar:
[
	ext{SAT map: }(r,R),qquad
	ext{H(s)H mechanics: }(r(s),A_s(s)),quad A_s=R^{-1}R'.
]

For two parameters `(s,t)`, define
[
A_s=R^{-1}partial_sR,quad A_t=R^{-1}partial_tR,
]
and curvature
[
F_{st}=partial_sA_t-partial_tA_s+[A_s,A_t].
]
This gives a precise next distinction: pure local frame re-description has `F=0`; nonzero connection curvature is irreducible path dependence.

## Scripted check
A seed R4 helix transformed by fixed `rQ` gave measured curvature ratio
[
operatorname{median}(kappa_{rQgamma}/kappa_gamma)=0.7407407407407414,
]
matching `1/1.35=0.7407407407407407` to floating-point precision. A parameter-dependent SO(4) rotation `R(s)` produced an additional long-scale modulation in the 3D projection.

## Failure conditions
1. If archived H(s)H "superhelix generation" is always just a similarity image of a pre-existing superhelix, this upgrade is unnecessary.
2. If `A_s` can be gauged away globally and all Wilson/closure observables vanish, it adds notation but no mechanics.
3. If numerical helix→superhelix solvers work with constant `R` and no hidden s-dependence/nonlinear embedding, the no-go derivation must be wrong.

## Next solver
Reconstruct `R(s)` from an actual archived ᚼ helix→superhelix fixture, calculate `A_s`, its two SO(4) canonical rates, and any two-parameter curvature `F`. Blindly test whether the second winding frequency appears in the spectrum of `A_s` rather than being inserted as a separate superhelix parameter.
