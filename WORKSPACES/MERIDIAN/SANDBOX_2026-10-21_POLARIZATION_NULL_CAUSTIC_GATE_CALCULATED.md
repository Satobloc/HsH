# Meridian | Gravitational polarization -> optical caustic -> local disappearing/reappearing images: calculated gate | 2026-10-21

**SANDBOX / Python executed; not a native Cruller spacetime solution.** The physical polarization constitutive tensor for H(s)H remains undefined. The computation therefore tests the GR optical consequence required by the proposed mechanism *conditionally*, rather than claiming to derive the gravity source.

## Exact optical tidal control

For a bundle of affinely parameterized rays, screen Jacobi matrix obeys D''=-T D with D(0)=0, D'(0)=I (depending on conventions T is optical tidal matrix from Riemann). For one screen eigen-direction with a constant focusing eigenvalue q>0, scalar D''+qD=0 has exact solution D(lambda)=sin(sqrt(q) lambda)/sqrt(q). The first conjugate point occurs at sqrt(q)L=pi, equivalently q L² = pi² ≈9.869604401. For q=0, D(L)=L. For a time-dependent finite polarization-driven metric disturbance q(lambda,t)=q_base+delta q(lambda,t), this constant-q critical value is a reference calibration ONLY; the real outcome depends on the integrated path-ordered Jacobi system.

Numerically verified via scipy solve_ivp at L=1 with rtol=1e-11, atol=1e-13:
q=0 -> D=1
q=1 -> D=0.8414709848068
q=4 -> D=0.4546487134118
q=9 -> D=0.0470400026864
q=pi² -> D≈0 (first conjugate point)
q=12 -> D=-0.0914947649962 (parity inversion beyond caustic).
Maximum numerical mismatch from exact sin expression <1e-9 (indeed ~1e-12). A conjugate point/focusing caustic means branching and potentially high magnification, NOT universal star invisibility.

## Exact local fold demonstrator

Canonical fold lens map beta=y²-s(t), fixed beta=0, with s(t)=t²-1. Local image solutions y_±(t)=±sqrt(s(t)) exist at |t|>1, merge at t=-1, do not exist within this LOCAL PATCH when |t|<1, and recur at t=+1. Demonstrates precise return possibility; does NOT assert all image branches disappear globally or that such a time-varying s(t) is sourced by a physically conserved matter/medium model. Plot generated: /mnt/data/cruller_polarization_fold_20261021.png . Solver script: /mnt/data/cruller_polarization_fold_20261021.py.

Counts: t=-2: 2 branches; t=-0.5: 0; t=0:0; t=0.5:0; t=2:2. With a standard positive-mass compact lens, an untracked background image can remain. At a fold caustic image magnifications diverge in point-source idealization rather than become dark; finite sources regularize. Thus a robust whole-source blackout requires a **separately computed total received flux below a detector threshold**, not simply fold loss of a local pair.

## Crucial gravitational polarization typing

Assume an independently derived gravitational-polarization response P in a material sector such that delta T_mu nu[P] exists and satisfies the Einstein constraints and covariant conservation. Solve delta G_mu nu=8pi delta T_mu nu to obtain metric g[P]; compute optical screen curvature T_AB=R_{mu nu rho sigma} e_A^mu k^nu k^rho e_B^sigma (sign depending conventions). Only then is q(lambda,t) source-derived. Ordinary GR matter tidal polarization, gravitational-wave polarization, EM polarization rotation and hypothetical vacuum susceptibility are different types. No equality is presumed.

In vacuum Ricci focusing is zero but Weyl tidal shear can still form caustics; tracing only scalar Ricci R_mu nu k^mu k^nu would miss the potential effect. For Einstein sourced null matter, R_mu nu k^mu k^nu=8pi T_mu nu k^mu k^nu because null contraction annihilates trace and Lambda contributions. This identifies precisely WHERE Einstein's 8pi enters one scalar piece of the optical focusing without making 8pi a rotation or a free parameter; Weyl still matters.

## Testable constraints and next gate

A full Cruller source must supply P->delta T, metric g, proper null transport, all visible image branches, frequency/opacity, and time evolution. Prediction for genuine disappearing/returning *star* would need total apparent flux, astrometric lensing signature, multiple image parity and time delays, polarization diagnostics, cross-source coherence. Source may remain visible along other paths. Gravitational caustics do not automatically force disappearance, return, or chiral bias. Left-handed Cruller requires oriented geometric information in the source, not inserted in scalar q.

Status completed mathematical null/fold/caustic fixture only; physical Cruller polarization and global stellar return NOT calculated. Do not promote to BEDROCK.