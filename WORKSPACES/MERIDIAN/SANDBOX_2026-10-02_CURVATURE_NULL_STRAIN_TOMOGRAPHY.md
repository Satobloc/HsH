# Meridian XVIII — curvature-null strain tomography from finite-core contact

**Status:** SANDBOXED / speculative bridge; not canonical theory.
**Sources freshly read:** `SAT O Derivations/SAT_D4_STRAIN_CURVATURE_MAPPING.txt` (complete); `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_133_CURVATURE_FREE_B2_RADIUS_RECONSTRUCTION.md` (complete). HSH_RESOURCES/PRIOR_ART not used.

## Source boundary
SAT D4 defines foliation strain (S_{\mu\nu}=\nabla_\mu u_\nu+\nabla_\nu u_\mu) and maps metric perturbation (\delta g\sim S) to linearized curvature through derivatives of (S). Run 133 gives, within its frozen generic rank-two quadratic-contact model,
[
\varepsilon_{rec}\sim \frac{A_\Sigma}{2C_4\ell_\parallel}.
]

## New sandbox construction
A locally affine, approximately constant strain can satisfy
[
\nabla S=0\quad\Rightarrow\quad \delta\Gamma=0,\;\delta R=0
]
at the D4 linearized order while still deforming a finite core.

Take (F=I+\tfrac12 S) to first order and an initially isotropic core of radius (\varepsilon_0). Its support radius in unit direction (n) becomes
[
\varepsilon(n)=\varepsilon_0\|F^Tn\|
=\varepsilon_0\left[1+\frac12 n^TSn\right]+O(S^2).
]
If the Run-133 contact reconstruction tracks this directional support radius, then
[
q(n)\equiv2\left(\frac{A_\Sigma(n)}{2C_4\ell_\parallel(n)\varepsilon_0}-1\right)
=n^TSn+O(S^2).
]
Thus finite-core contact can detect a strain channel that curvature alone is blind to at this order.

Because a symmetric 4x4 strain tensor has 10 independent components, measurements of (q(n_a)) along >=10 sufficiently independent directions form a linear inverse problem for (S). A 30-direction random numerical fixture reconstructed a generic symmetric (S) with max coefficient error (5.9\times10^{-17}) (noise-free double precision; design-matrix condition number 3.74).

Decompose
[
S=\frac{\operatorname{tr}S}{4}I+S_0.
]
The spherical mean of (q) gives (\operatorname{tr}S/4); angular variation gives the traceless shear (S_0).

## Candidate grammar
[
\text{SAT foliation strain}\to
\begin{cases}
\nabla S\to \delta R & \text{curvature channel},\\
S\to \text{finite-core support}\to(A_\Sigma,\ell_\parallel) & \text{contact channel}.
\end{cases}
]
H(s)H therefore need not identify geometry solely with curvature: finite thickness can make affine strain mechanically/readout-visible before strain gradients generate curvature.

## Failure conditions
This bridge fails if Run-133's reconstructed (\varepsilon) is not the directional support radius under deformation; if the core relaxes so rapidly that affine strain leaves no finite-core memory; if the SAT (\delta g\sim S) identification cannot consistently be represented by (F=I+S/2); or if higher-order/background connection terms make nominally constant (S) curvature-producing in the tested fixture.

## Solver test / prediction candidate
Construct a flat-background fixture with prescribed constant symmetric (S), zero numerical strain gradient, and an isotropic finite core. Sweep normals (n\in S^3). Prediction at first order:
[
2(\varepsilon_{rec}(n)/\varepsilon_0-1)=n^TSn,
qquad \delta R=0.
]
Then impose a controlled spatial gradient (S(x)=S_0+x^\alpha G_\alpha). Contact tomography should retain the local (S_0) term while the curvature channel switches on with derivatives. This cleanly separates **strain amplitude** from **strain-gradient curvature**.

— Meridian XVIII
