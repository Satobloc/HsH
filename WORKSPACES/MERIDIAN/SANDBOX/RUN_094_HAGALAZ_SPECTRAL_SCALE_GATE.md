# RUN 094 — Hagalaz spectral scale gate

**Branch/task:** Meridian / Hagalaz solver unification / spectral ruler  
**Status:** SANDBOX / PROVISIONAL / exact analytic gate  
**Date:** 2026-09-21  
**Operation:** turn Nathan's Laplace–Beltrami “waistline” suggestion into a falsifiable Hagalaz scale/deformation discriminator using the exact RUN 061 product-torus carrier.  
**Quarantine:** none consulted.  
**Nathan Words disposition:** no new topic packet beyond the current-turn directive was available/needed; RUN 092's UI packet disposition remains upstream context only.

## 0. Result

For the exact 4D product-torus carrier from RUN 061,

\[
C(p,q)=(a\cos p,a\sin p,b\cos q,b\sin q),
\qquad ds^2=a^2dp^2+b^2dq^2,
\]

the scalar Laplace–Beltrami spectrum is

\[
\lambda_{mn}=m^2/a^2+n^2/b^2.
\]

This yields an exact **spectral scale gate** for a candidate Hagalaz order jump.

If order `j -> j+1` is a pure similarity with length ratio `mu`, then

\[
g_{j+1}=\mu^2 g_j
\quad\Longrightarrow\quad
\lambda_k^{(j+1)}=\mu^{-2}\lambda_k^{(j)}
\]

for every matched eigenmode `k`. Therefore every mode must infer the same scale factor

\[
\boxed{\mu_k=\sqrt{\lambda_k^{(j)}/\lambda_k^{(j+1)}}=\mu}.
\]

Mode-dependent `mu_k` is a direct rejection of **pure isotropic similarity** for that jump. It does not by itself identify the cause; anisotropic deformation, metric distortion, topology/boundary change, mode-matching failure, or numerical error remain alternatives.

## 1. Exact waistline readout on the RUN 061 carrier

The factor modes give

\[
a=\lambda_{10}^{-1/2},\qquad b=\lambda_{01}^{-1/2}.
\]

Hence the two intrinsic factor circumferences are

\[
W_a=2\pi/\sqrt{\lambda_{10}},\qquad
W_b=2\pi/\sqrt{\lambda_{01}}.
\]

Using the RUN 061 constraint `a^2+b^2=rho^2`, the ambient three-sphere radius is reconstructed as

\[
\boxed{\rho=\sqrt{\lambda_{10}^{-1}+\lambda_{01}^{-1}}}.
\]

The exact stereographic Donut parameters then follow from RUN 061:

\[
R=\rho^2/a,\qquad r=\rho b/a.
\]

Thus, within this restricted carrier family, the intrinsic spectrum recovers the two factor rulers, the ambient `S^3` radius, and the associated projected Donut dimensions. This is a precise toy realization of a spectral “waistline”; it is not yet a cosmological measurement claim.

## 2. A dimensionless shape channel independent of overall scale

The ratio

\[
\boxed{\eta=\lambda_{10}/\lambda_{01}=b^2/a^2}
\]

is invariant under uniform similarity scaling. Equivalently `b/a=sqrt(eta)`.

Therefore a candidate Hagalaz jump has two immediately separable spectral readouts:

- **scale:** any matched `mu_k=sqrt(lambda_k/lambda'_k)`;
- **shape:** `eta=lambda_10/lambda_01`.

Pure similarity requires both:

1. all matched `mu_k` agree;
2. `eta' = eta`.

A change in `eta` is an exact anisotropy/shape-change flag on this family.

## 3. Symmetric carrier and degeneracy splitting

At `a=b`,

\[
\lambda_{10}=\lambda_{01}=1/a^2.
\]

The lowest factor modes are degenerate. A deformation `a != b` splits them:

\[
\Delta\lambda=|1/a^2-1/b^2|.
\]

A convenient dimensionless split is

\[
\boxed{D=\frac{|\lambda_{10}-\lambda_{01}|}{\lambda_{10}+\lambda_{01}}}
=\frac{|a^2-b^2|}{a^2+b^2}.
\]

`D=0` for the symmetric product torus and `0<D<1` for unequal positive radii. `D` is scale-free. It is therefore a clean candidate readout for the project's speculative “same carrier, differently jammed/deformed state” branch: deformation can be sought as spectral splitting rather than inferred from visual resemblance. No particle identification follows from `D` alone.

## 4. Relation to the helical closure ruler

RUN 092 established Hagalaz most cleanly as a local generator rather than a static endpoint tuple. Nathan's subsequent closure-ruler direction suggests pairing a local/per-rung ruler with a global spectral ruler.

For a uniform closed winding sector `(m,n)` on the RUN 061 carrier, the curve length is

\[
\ell_{mn}=2\pi\sqrt{a^2m^2+b^2n^2}.
\]

The spectral eigenvalue with the same integer label is

\[
\lambda_{mn}=m^2/a^2+n^2/b^2.
\]

These are **not reciprocals in general**. The closure ruler and spectral ruler therefore carry complementary information rather than being trivially identical. Under uniform scaling `a,b -> mu a, mu b`, however,

\[
\ell_{mn}\to\mu\ell_{mn},\qquad
\lambda_{mn}\to\mu^{-2}\lambda_{mn},
\]

so the product

\[
\boxed{I_{mn}=\ell_{mn}^2\lambda_{mn}}
\]

is dimensionless and scale invariant. Explicitly,

\[
I_{mn}=4\pi^2(a^2m^2+b^2n^2)(m^2/a^2+n^2/b^2).
\]

This is the first exact bridge between the closure/tape language and the Laplace–Beltrami ruler on the current carrier family.

## 5. Hagalaz spectral gate

For any proposed closed Hagalaz step where comparable compact carrier metrics can be defined:

1. compute/match a low spectrum `{lambda_k}` before and after;
2. infer `mu_k=sqrt(lambda_k/lambda'_k)`;
3. test dispersion of `log(mu_k)`;
4. separately compare scale-free spectral ratios/degeneracy structure;
5. classify:
   - **spectral similarity:** common `mu_k`, preserved ratios/degeneracies;
   - **spectral deformation:** no common `mu_k` and/or changed scale-free ratios;
   - **unresolved:** ambiguous mode matching, insufficient convergence, topology/boundary mismatch.

For numerical work define

\[
\epsilon_{scale}=\operatorname{std}_k(\log\mu_k),
\]

with a convergence-dependent tolerance rather than a fixed universal threshold.

## 6. Critical typing boundary for RUN 092

RUN 092's recursive object is a **curve in R4**, not itself a 2D compact torus. A scalar Laplace–Beltrami operator on the 1D curve would mostly report its total intrinsic length and would discard the normal-frame structure that RUN 092 was built to expose.

Therefore do **not** blindly apply the product-torus spectrum to the RUN 092 centerline.

The next computational spectral pass must first choose the geometric object whose metric is meant to carry Hagalaz information, e.g.:

- a compact tube/swept surface around the closed carrier;
- a closed product-torus/Hopf carrier already possessing a 2D metric;
- a connection/covariant Laplacian acting on frame/normal-bundle data rather than scalar functions on the centerline.

This typing gate prevents a superficially successful spectrum from erasing the six SO(4) channels.

## 7. Cosmological round-S3 control

For a round three-sphere of radius `rho`, scalar Laplace–Beltrami eigenvalues are

\[
\lambda_l=l(l+2)/\rho^2.
\]

The first nonzero level `l=1` gives

\[
\rho=\sqrt{3/\lambda_1},
\qquad
W_{great}=2\pi\sqrt{3/\lambda_1}.
\]

This is a useful analytic control for the phrase “waistline of the universe,” but it assumes the round-S3 model. Spectrum alone does not uniquely determine arbitrary global geometry; isospectral non-isometric manifolds are a standing guardrail.

## 8. What changed

- Laplace–Beltrami is promoted from analogy to an exact **scale/deformation gate** on the existing RUN 061 carrier.
- The helical/closure ruler and spectral ruler are shown to have the correct opposite scale covariance, with `ell^2 lambda` providing a dimensionless bridge.
- The tempting next step “take the Laplacian of the RUN 092 curve” is rejected as under-typed because it would erase the frame/normal information central to Hagalaz.

## 9. Blockers / next cursor

No Nathan action required.

**Next cursor:** build the first genuinely closed Hagalaz carrier using the exact product-torus/Hopf family, compute its closed-path frame holonomy, and carry the same `(m,n)` sector through the spectral gate. This would combine closure, holonomy, scale, and shape in one record without losing the current solver typing.
