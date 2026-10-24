# Alberr | SO(4) double-cover and stabilizer ambiguity | 2026-10-24T11Z

Task `calc48-20261024T11Z-alberr-spin4-stabilizer-001`. Status **INTERNALLY_CHECKED** (pure geometry); H(s)H spin interpretation **UNRESOLVED**; no CODATA observable, fit, or BEDROCK promotion.

## Historical recovery and established correction

SAT archive `2026/SAT MATH — BACKBONE.txt` F1, blob `1854995be3311f565739f2be64269cbb0385a82f`, writes `SO(4) ≅ SU(2)_L × SU(2)_R` and associates factors with weak handedness. This is correct as a Lie-algebra decomposition but **not** a global group isomorphism. An already present later SAT source `2026/SAT++.txt`, blob `5c4e20eb52043b655eb81496962133e0ffe33f04`, explicitly gives the global quotient. Thus the present work **verifies and applies a historical correction**, rather than claiming to originate it:

`Spin(4) ≅ SU(2)_L × SU(2)_R`, while `SO(4) ≅ (SU(2)_L × SU(2)_R)/{(1,1),(-1,-1)}`.

## Exact construction

Identify `R^4` with quaternions. For unit quaternions `(a,b)`, define `F(a,b)(x)=a*x*conj(b)`. Then `F(a,b)=F(-a,-b)`; the kernel is exactly `{(1,1),(-1,-1)}`. For commuting `a=exp(i α)`, `b=exp(i β)`, the resulting 4D rotations in `(x1,x2)` and `(x3,x4)` have angles `α−β` and `α+β`, respectively.

For the established two-rate frame `R(θ)=R12(θ)R34(2θ)`, choose `α=3θ/2`, `β=θ/2`. At `θ=2π`, `R=I4` but the Spin(4) lift is `(-1,-1)`, not `(1,1)`. In general integer windings `(m,n)` give endpoint sign `(-1)^(m+n)`; this is a statement about the **chosen SO(4) frame loop**, not automatically a fermion.

**New discriminator: the centerline alone does not determine the spin-lift sign.** Choose `x0=(sqrt(1−4u),0,sqrt(u),0)/sqrt(1−3u)` and `q(θ)=R(θ)x0`. The stabilizer loop `S(θ)=R24(θ)` (indices one-based) fixes `x0` exactly. Therefore `R_alt(θ)=R(θ)S(θ)` gives the **identical point trajectory** `q(θ)`, but adds a nontrivial 2π normal-plane rotation. At `2π` its Spin(4) lift is `(+1,+1)`. Thus the same centerline has frame lifts with opposite endpoint signs; any spin assignment requires independently specified framing/transport, not merely centerline winding.

## Executed tests

Python/NumPy with quaternion and independently constructed Euclidean Clifford gamma matrices. **ALL_ASSERTIONS_PASSED**: 500 pseudorandom unit-quaternion pairs; 121 integer winding pairs; 513 centerline/stabilizer samples; 129 quaternionic frame reconstructions. Max SO(4) orthogonality residual `6.66e-16`; max determinant residual `1.22e-15`; max quaternion reconstruction residual `8.88e-16`; maximum same-centerline and stabilizer residuals exactly `0`; Clifford anticommutator residual exactly `0`. Two frame loops differ by up to `2.8284` in Frobenius norm while tracing identical centerlines.

## Boundaries

This result does not identify a physical spinor, prove a weak-interaction mechanism, or license an extra carrier. `π1(SO(4))=Z2`, while the orbit lies in `S3` and does not uniquely fix its SO(4) framing. No independent physical prediction or CODATA comparison exists. Correcting the group quotient is mandatory; selecting a physical framing is **UNRESOLVED**. Public-safe mathematics only; no private archive passages or protected signet.
