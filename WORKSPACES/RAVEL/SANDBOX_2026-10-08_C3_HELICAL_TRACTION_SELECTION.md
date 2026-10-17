# Ravel sandbox: C3 helical traction selection and force–torque tomography

**Status:** `GEN/CANDIDATE`; quarantined mechanism and apparatus result, not SAT/H(s)H canon.  
**Question:** Does a handed finite core retain a nonzero transverse load after its exterior envelope and threefold strand geometry are perfectly matched?

## Result in one line

A perfectly balanced three-strand helical core has **zero net transverse handed force but nonzero handed axial torque**. Controlled first-harmonic imbalance restores a transverse force whose magnitude and direction are fixed by the imbalance. Thus the transverse term in the previous orientation–chirality coupler is forbidden as a force monopole for exact C3 symmetry; its symmetry-allowed replacement is a torque/couple.

## Provenance and actual read coverage

### HsH source

- `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_17/HsH_INFORMATION_CONSERVATION.txt`, blob `7838ee3582d248233e642dca6dc03d042b08fd51`; directly read sequential lines 1–1200. The relevant source construction distinguishes constituent chirality from configuration chirality, reduces a tripartite structure to three 120-degree-separated trajectories and a generated center/axis, then transports that C3 arrangement helically and nests its centers at another level. It also explicitly treats core diameter, pitch, torsion, orientation and winding ratio as unresolved model quantities rather than fixed particle labels. `⟦SRC:HSH_INFO_CONSERVATION·L301–1200⟧`

### Old archive source

- `SAT_THEORY_ARCHIVE_2023-25/2026/SAT AUDIT — Refine .txt`, blob `247bda4b85a6849c9b0e7e8d8ac6b57cfccdf121`; directly read sequential lines 1–600. The audit retains permutation symmetry and the stationary 120-degree phase configuration but rejects the escalation from an S3/Z3 subgroup to a modulo-three physical law, rejects undefined torsion sums, and states that the 120-degree arrangement is variationally selected rather than topologically enforced. `⟦SRC:SAT_AUDIT_REFINE·L1–600⟧`

### Retrieval and control

- Re-read the controlling front door `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, blob `2e788d4a...`, plus its role-relevant workflow, symbol, citation, toolbox-namespace, reference-desk and Ravel state pointers.
- Submitted bounded Mersearch request `2026-10-08-ravel-helical-traction-cancellation-001` by CAS commit `38b42d1dd462c3eb0daec428c69f544e2e30d472`. Its expected manifest was not yet present; no pending hit was presumed.
- HSH_RESOURCES remained navigation/benchmark machinery only. No external model was imported into the construction.

## Boundary

**Source facts:** the project corpus contains a candidate C3 screw geometry and a corrected audit in which 120-degree separation is a stationary configuration, not a universal topological gate.

**Ravel inference:** a C3 finite core should be decomposed into symmetry channels before any handed response coefficient is assigned. The net force and net torque occupy different C3 representations and need not survive the same cancellations.

**New sandbox conjecture:** if local resolver traction has a component odd under helical handedness, exact C3 balance cancels its transverse resultant but preserves its axial moment. This does not by itself establish an unconventional interaction; it is standard force/moment geometry applied to the proposed finite-core morphology.

## Geometry and exact selection rule

At resolving coordinate \(z\), place the three strand centrelines at

\[
\boldsymbol\rho_j(z)=R\,\mathbf e_r(\psi_j),
\qquad
\psi_j=kz+\alpha+\frac{2\pi j}{3},
\qquad j=0,1,2.
\]

Let \(\chi=\operatorname{sgn}k=\pm1\). The smallest local traction component that reverses with handedness is written

\[
\mathbf f_j^{\rm odd}=\chi f_* w_j\,\mathbf e_\phi(\psi_j),
\]

where \(f_*\) is a local traction scale and \(w_j\) records strand loading. This is an apparatus-level constitutive ansatz; it is not charge, spin or a mass law.

Using \(\sum_j e^{i2\pi j/3}=0\), the complex transverse force and axial torque are

\[
F_x+iF_y
=i\chi f_*e^{i(kz+\alpha)}
\sum_{j=0}^{2}w_j e^{i2\pi j/3},
\]

\[
\tau_z
=\sum_j(\boldsymbol\rho_j\times\mathbf f_j)_z
=\chi Rf_*\sum_{j=0}^{2}w_j.
\]

For exact C3 balance, \(w_0=w_1=w_2=1\):

\[
\boxed{\mathbf F_\perp=0},
\qquad
\boxed{\tau_z=3\chi Rf_*}.
\]

This cancellation occurs at every \(z\), so integrating over any common length does not restore a transverse force. Opposite handedness reverses the torque while preserving the matched exterior envelope.

The result is a discrete-Fourier selection rule. The C3 mean-loading channel \(m=0\) controls torque; the complex imbalance channel \(m=1\) controls transverse force. A symmetric handed core can therefore exert a couple without exerting a net transverse force.

## Controlled symmetry breaking

Apply a calibrated first-harmonic load imbalance

\[
w_j=1+\epsilon\cos(\psi_j-\beta).
\]

Then

\[
\boxed{
\mathbf F_\perp
=\frac{3}{2}\chi f_*\epsilon\,\mathbf e_\phi(\beta)
},
\qquad
\boxed{
\tau_z=3\chi Rf_*
}.
\]

The unknown traction amplitude cancels from the magnitude ratio:

\[
\boxed{
\frac{|\mathbf F_\perp|}{|\tau_z|}
=\frac{\epsilon}{2R}
}.
\]

This is the tight apparatus discriminator. The force must be linear in imbalance, rotate with the imposed imbalance angle \(\beta\), flip with handedness, and obey a slope fixed by the measured core radius.

## Force–torque tomography

The three real strand loads can be reconstructed from only the two net-force components and the axial torque. Define

\[
S_0=\frac{\tau_z}{\chi Rf_*},
\qquad
S_1=e^{-i(kz+\alpha)}\frac{F_x+iF_y}{i\chi f_*},
\qquad
\omega=e^{2\pi i/3}.
\]

Then

\[
\boxed{
w_j=\frac13\left[S_0+2\operatorname{Re}(S_1\omega^{-j})\right]
}.
\]

This supplies a diagnostic before any H(s)H interpretation: if measured force and torque cannot reconstruct the independently imposed loading, the local tangential-traction model is incomplete.

## Numerical and visual check

`c3_helical_traction_tomography.py` evaluates the exact sums, performs noisy blind reconstruction, and draws the equation-defined C3 cross-section.

Parameters were arbitrary dimensionless test values, not historical targets: \(R=0.73\), \(f_*=1.21\), \(\alpha=0.47\), \(\epsilon=0.18\), \(\beta=0.91\).

- Balanced transverse-force residual: \(7.76\times10^{-16}\).
- Balanced torque: \(-2.6499\), exactly matching \(3\chi Rf_*\).
- Imbalanced force prediction error: \(7.99\times10^{-16}\).
- Imbalanced torque prediction error: zero at reported precision.
- Measured \(|F_\perp|/|\tau_z|=0.1232876712\), matching \(\epsilon/(2R)\).
- With complex-force and torque noise \(\sigma=0.002\), 400 random three-weight states were reconstructed with RMS error \(0.001446\).
- Handedness reversal sums for both force and torque were zero at reported precision.

These calculations validate the selection rule and inversion implementation only.

## Apparatus candidate

Build two counter-wound three-strand helical cores with identical strand material, radius, pitch magnitude, external cylindrical envelope, mass distribution and stiffness spectrum. Mount each in a resolver that can measure two transverse force components and axial torque. A segmented contact, field, flow or damping collar supplies independently calibrated \(w_j\).

Run four stages:

1. Achiral straight-strand and nonhelical controls.
2. Balanced C3 loading on both handed cores.
3. Calibrated first-harmonic imbalance swept through \(\beta\).
4. Reversal of motion, detector channels and whole-apparatus orientation.

Ordinary elasticity, friction, fluid drag, electromagnetic induction, bearing torque and detector coupling are not grounds to discard this apparatus. They are the benchmark mechanics that must first reproduce—or fail to reproduce—the selection rule. An H(s)H-motivated residual becomes interesting only after those contributions are modeled and measured.

## Failure conditions

The minimal mechanism fails if:

1. exact C3 balance produces a reproducible transverse force after all measurable imbalance is bounded;
2. handedness reversal does not reverse the odd torque;
3. the force direction does not track \(\mathbf e_\phi(\beta)\);
4. the force/torque ratio is not linear in \(\epsilon\) with slope \(1/(2R)\);
5. finite-core surface integration cancels the torque as well as the force;
6. measured force and torque fail the three-weight inverse reconstruction;
7. conventional mechanics fully accounts for every observation, leaving no additional resolver-coupling question.

## Consequence for the previous coupler

The earlier ansatz \(C=aI+bQ+\chi cJ\) remains admissible for a single anisotropic core or a resolver that already breaks C3 symmetry. It is too permissive for an exactly balanced C3 composite if \(\chi cJ\) is interpreted as a net force term. In that limit the coefficient must satisfy

\[
c_{\rm force}=0,
\]

while a handed torque coefficient \(c_\tau\) may remain nonzero. This is a substantive correction, not merely a refinement of notation.

## Next calculation

Replace the centreline tractions by surface tractions on three tubes of finite radius \(a\), include contact/shadowing between strands, and expand the integrated force and moment in \(a/R\). The first question is whether the torque receives an \(O(a/R)\) correction or whether C3 symmetry pushes the first correction to \(O((a/R)^2)\).
