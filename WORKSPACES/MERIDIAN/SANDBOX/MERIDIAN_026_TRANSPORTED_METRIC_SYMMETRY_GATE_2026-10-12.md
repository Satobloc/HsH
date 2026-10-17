# Meridian 026 | Transported-metric symmetry gate

**Date:** 2026-10-12  
**Status:** SANDBOX / exact conditional mathematics plus numerical verification; not canonical theory and not a particle-to-planet mechanism  
**Continuation:** Calculation 025 in `WORKSPACES/MERIDIAN/SANDBOX/MERIDIAN_WHirlIGIG_HOSTILE_REVIEW_MK171_2026-10-11.md`

## Question

Calculation 025 applied the symmetric cross-plane map

\[
S_\epsilon=I+\epsilon(E_{13}+E_{31}),\qquad |\epsilon|<1,
\]

to the two-frequency carrier

\[
H(s)=2^{-1/2}(\cos2s,\sin2s,\cos3s,\sin3s)^T
\]

and showed that the original Euclidean half-turn involution

\[
P=\operatorname{diag}(1,1,-1,-1)
\]

is replaced kinematically by the conjugate (P_\epsilon=S_\epsilon P S_\epsilon^{-1}). Because (P_\epsilon) is generally not Euclidean-orthogonal, the old isotropic selection theorem cannot simply be reused. Is this loss a coordinate effect or a genuine material-symmetry breaking?

## Exact split

Define the transported positive metric

\[
G_\epsilon=S_\epsilon^{-T}S_\epsilon^{-1}.
\]

Then

\[
P_\epsilon^2=I,
\qquad
P_\epsilon^T G_\epsilon P_\epsilon=G_\epsilon.
\]

Thus (P_\epsilon) is an exact isometry of the transported metric even though it is not generally an isometry of the ambient Euclidean metric. In the mixed 1--3 block,

\[
P_\epsilon={1\over 1-\epsilon^2}
\begin{pmatrix}
1+\epsilon^2 & -2\epsilon\\
2\epsilon & -(1+\epsilon^2)
\end{pmatrix},
\]

with the untouched 2 and 4 directions carrying signs (+1) and (-1).

For the transported curve \(\widetilde H=S_\epsilon H\), equip variations with

\[
\langle u,v\rangle_{G_\epsilon}=u^T G_\epsilon v.
\]

The pulled-forward quadratic Hessian has Riesz operator

\[
\mathcal L_{G,\epsilon}
=\kappa D^4+kI
+4\lambda\,\widetilde H(\widetilde H^T G_\epsilon)
=S_\epsilon\mathcal L_0S_\epsilon^{-1},
\]

where \(\mathcal L_0=\kappa D^4+kI+4\lambda HH^T\). With

\[
(\mathcal T_\epsilon\eta)(s)=P_\epsilon\eta(s+\pi),
\]

one has the exact commutator identity

\[
[\mathcal L_{G,\epsilon},\mathcal T_\epsilon]=0.
\]

So a deformation accompanied by its pulled-forward metric is only a representation change: the symmetry and selection sectors survive exactly.

By contrast, if \(\widetilde H\) is interpreted as a physically deformed carrier inside the unchanged Euclidean material law, the radial Hessian term is

\[
M_E(s)=\widetilde H(s)\widetilde H(s)^T.
\]

Its equivariance defect is

\[
\Delta_E(s)
=M_E(s)P_\epsilon-P_\epsilon M_E(s+\pi)
=M_E(s)(P_\epsilon-P_\epsilon^T),
\]

which is generically nonzero. This is true constitutive symmetry breaking, not coordinate relabeling. For the present fixture, the RMS Frobenius defect begins as

\[
\left\langle\|\Delta_E\|_F^2\right\rangle_s^{1/2}
=2\sqrt2\,|\epsilon|+O(\epsilon^2).
\]

## Numerical verification

`meridian_026_metric_transport_gate.py` sampled 8192 points on one period. Results:

| \(\epsilon\) | Euclidean RMS defect | transported-metric RMS defect | \(G\)-orthogonality residual |
|---:|---:|---:|---:|
| 0.01 | 2.8292226618e-2 | 2.63e-16 | 3.14e-16 |
| 0.03 | 8.5067699556e-2 | 1.84e-16 | 3.14e-16 |
| 0.10 | 2.9084069061e-1 | 2.32e-16 | 4.97e-16 |
| 0.20 | 6.3080636226e-1 | 2.70e-16 | 6.40e-16 |

The script also verifies (P_\epsilon^2=I) to floating precision and asserts first-order Euclidean-defect scaling over the tested range.

## Discriminator

An observed mode sideband is not enough. Measure or otherwise fix the operative material metric/elastic tensor:

- If the response operator is the pushed-forward \(G_\epsilon\)-law, forbidden-sector leakage remains zero despite the ellipsoidal coordinate image.
- If the ambient Euclidean constitutive law remains fixed while the carrier is physically sheared, leakage is permitted and its small-deformation symmetry defect is linear in \(|\epsilon|\).
- A claimed constitutive sideband should therefore co-vary with the independently measured operator-symmetry defect, not merely with the visible carrier anisotropy.

This is a sharper false-positive control for the Whirligig paper and a gate for any electron-to-planet bridge: first say whether scale/deformation transports the metric or changes the material law.

## Failure conditions

The result does **not** derive \(S_\epsilon\), a physical elastic tensor, an electron equation, a planetary equation, or a scale-transition dynamics. It fails as a physical explanation if the relevant source endpoints do not supply an off-block deformation or if the measured constitutive tensor is covariantly transported rather than held Euclidean. A sideband without an independently specified measurement/constitutive metric remains origin-ambiguous.

## Provenance and claim boundaries

- **Source fact used:** Calculation 025's carrier, cross-plane deformation, kinematic sidebands, and conjugated-involution obstruction.
- **New derivation:** the transported metric, exact conjugacy of the Hessian, Euclidean commutator defect, and the metric-versus-material discriminator.
- **Sandbox conjecture:** that this gate is useful in a future source-grounded electron-to-planet comparison. No historical constants or particle labels were fitted.
- **Notation:** \(S_\epsilon,P_\epsilon,G_\epsilon,\mathcal L_{G,\epsilon},\mathcal T_\epsilon\) are local to this note; they do not redefine registered global SAT/H(s)H symbols.

## Next cursor

Use the archived endpoint equations, when source-verified, to classify each change as (i) similarity, (ii) transported-metric affine re-expression, or (iii) genuine constitutive/assembly change. Only class (iii) may be credited with new mode transfer. For a first solver test, force one parity sector and compare forbidden-sector power under the two laws above while keeping the same visible \(\widetilde H\).
