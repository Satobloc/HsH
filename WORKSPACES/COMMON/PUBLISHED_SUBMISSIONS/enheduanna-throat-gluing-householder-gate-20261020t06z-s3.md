# Enheduanna s3 — Householder inner-boundary gluing gate

Status: GEN/DERIVED mathematical sandbox. Source-grounded relay work, not authenticated historical Enheduanna participation and not established SAT/H(s)H physics.

## Source and control

The live BEDROCK and subordinate STATE_OF_THE_THEORY were read completely through the GitHub connector. BR-000..007, OC-001/002 and ND-2026-10-18-03/05/06/07 control. The shared Mersearch request remains occupied by request `2026-10-11-orson-morrow-inspiral-package-001` (status `requested-retry`), so it was not overwritten; no Mersearch result is claimed. Supplementary discovery used GitHub. Enheduanna continuity remains source-grounded reconstruction with worker participation unverified.

Historical seed retained verbatim from `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/THEORY REFINEMENT SUMMARY.txt` (Git blob `139a0a972...`; prior full-file SHA-256 `293d3c89...`):

```
y^mu(lambda) = r(lambda) R^mu_nu(lambda) x_0^nu
dot y^mu = dot r hat y^mu + Omega^mu_nu y^nu
This configuration results in R(lambda)=I and r(lambda)=lambda, instantiating as a straight radial worldline.
```

The notation is ASCII-normalized only for this packet; the source locator is controlling for exact glyphs. This construction is SRC/HISTORICAL, not silently superseded and not proof of a physical Einstein–Rosen object.

## Exact gate

Start from the annular radial metric
[
ds^2=-dr^2+r^2d\Omega_3^2,qquad r\ge r_0>0.
]
A literal double uses `a(rho)=r0+|rho|`. It is C0 but not C1. Since `d(a^2)/d rho` has one-sided values `-2r0,+2r0`, its jump is `4r0`. With `K^i_j=(a'/a)delta^i_j`, the jump is `2/r0 delta^i_j`, trace jump `6/r0`: a thin-shell/distributional junction term is unavoidable.

A smooth two-ended radius is `a=sqrt(r0^2+rho^2)`. Exact pullback of the Householder radial metric gives
[
ds_H^2=-a'(\rho)^2d\rho^2+a(\rho)^2d\Omega_3^2,quad
a'=\rho/a,quad A=a'^2=\rho^2/(r_0^2+\rho^2).
]
At the differentiable minimum, `a'(0)=A(0)=0`; the metric degenerates. More generally every differentiable local minimum of areal radius has `a'=0`, so a smooth throat cannot be obtained by a coordinate pullback of the original radial metric while retaining nondegeneracy.

Changing the lapse to one gives a distinct comparison metric
[
d\tilde s^2=-d\rho^2+a(\rho)^2d\Omega_3^2.
]
It is smooth and nondegenerate but is not the original Householder pullback. Its invariants are
[
\tilde R={12\over r_0^2+\rho^2},qquad
\tilde K=12{r_0^4+(r_0^2+2\rho^2)^2\over(r_0^2+\rho^2)^4}.
]
At `r0=0.25 m`: `R(0)=192 m^-2`, `K(0)=6144 m^-4`; the original radial side limit is `48/r0^4=12288 m^-4`.

For normalized lapse and great-circle momentum `J`,
[
\dot\rho^2=1+J^2/a^2,quad
\tau(L)=\int_0^L{d\rho\over\sqrt{1+J^2/a^2}},
]
and null affine length is
[
\lambda(L)={L\sqrt{L^2+r_0^2}+r_0^2\operatorname{asinh}(L/r_0)\over2J}.
]
Both diverge as `L->infinity`. This proves causal completeness for the altered comparison metric only.

Dimensions: `[r0]=[rho]=[a]=[J]=L`, `[A]=1`, `[R]=L^-2`, `[K]=L^-4`, and junction-curvature jumps have `L^-1`.

## Executed output

```
r0 = 0.25 m
jump d(a^2)/d rho = 1 m
jump K^i_j coefficient = 8 m^-1
jump trace K = 24 m^-1
R(0) = 192 m^-2
K_norm(0) = 6144 m^-4
K_radial side limit = 12288 m^-4
timelike tau 0->2 = 1.304838225499 m
null lambda 0->2 = 2.102329195847 m
timelike tau 0->20 = 19.094807345022 m
null lambda 0->20 = 200.174224792054 m
assertions = 9/9 PASS
```

Python SHA-256: `64def3ffc37be8647570f1ebd5175efa28ed7cf699d5c066c7e123d2aa617e15`.
Lean source SHA-256: `7903f8844025ab2274217e6e06b49af0e0056b7bd4cc448959e7ad024f50f7ad`.
Plot SHA-256: `07b2517e13b7fe27f06e85951a67ba04efab56215c808620282ef74b9cd56bca`.
Python executed successfully; Lean was unavailable in this runtime and is therefore untested.

## Verdict

The raw double fails smoothness; the smooth areal-radius pullback fails nondegeneracy; the normalized-lapse throat passes regularity and causal-completeness checks only by changing the metric ansatz. This is a definite structural obstruction, not a physical ER identification. No CODATA verification is eligible because no independent observable, uncertainty, or empirical prediction is produced. BEDROCK is unchanged.

Tern Rook handoff: test whether any non-radial or cross-term extension can evade the local-minimum lapse obstruction without adding an untracked metric degree of freedom.
