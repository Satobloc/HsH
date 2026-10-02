# Ravel sandbox checkpoint — two-pole memory rejection boundary

**Status:** new sandbox construction and numerical falsification test; not canonical SAT/H(s)H.

## Narrow question

If the finite-core/resolving-medium response contains two causal relaxation channels, when can radius-resolved complex poles reject the simpler one-pole constitutive tomography?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H Dev +/H(s)H NOTATION.txt` — **full sequential read**. The file attempts to encode simultaneous rotation, torsion, expansion, stacking, and asymmetry in four-dimensional and double-shell pictures. It supplies no causal kernel or inverse problem. Its combinatorial layering is retained only as a historical construction motif; its manifold claims and notation are not imported as dynamics.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/SAT_Symbolic_Kernel.txt` — **full sequential read**. Despite its title, it is an older local field/gauge action containing raw theta-four, lattice, modulo-three, BF, and phenomenological sectors. Those are quarantined under current controls. It contains no temporal memory kernel and therefore serves as a negative contrast between a symbolic action “kernel” and a causal response kernel.
3. Google Drive searches for “two relaxation poles memory kernel model selection” and “multi exponential memory complex pole residual” — **indexed search**. One irrelevant conversation spreadsheet matched broad words; no controlled duplicate found.
4. Slack search for “memory” + “pole” — **indexed collision search**. It found the preceding one-pole work and damped-hybrid checkpoint, but no two-pole rejection calculation.

## Source / inference / conjecture boundary

- **Source fact:** the archive repeatedly seeks composable multi-operation structure, but the two read files do not provide a causal constitutive law.
- **Standard mathematical scaffold:** a sum of passive exponential relaxation kernels gives a sum of rational response poles.
- **New sandbox conjecture:** finite-core/support elimination may require two relaxation channels, detectable through structured failure of one-pole reality closure.

## Construction

Inject

\[
\Gamma(u)=\Theta(u)\sum_{j=1}^2\frac{A_{0j}a^q}{\tau_j}e^{-u/\tau_j},
\]

so the complex dispersion relation is

\[
D_2(z)=\omega_c^2-z^2
-iz\sum_{j=1}^2\frac{A_{0j}a^q}{1-iz\tau_j}=0.
\]

The blind adversary is the previous one-pole model,

\[
D_1(z)=\omega_c^2-z^2-\frac{izA_0a^{q_1}}{1-iz\tau}=0.
\]

It receives only \((a_i,z_i)\), not \(\omega_c(a)\), and chooses \((q_1,\tau,A_0)\) to minimize the conservative-core reality residual

\[
r_i=
\frac{\Im\left[z_i^2+
iz_iA_0a_i^{q_1}/(1-iz_i\tau)\right]}{|z_i|^2}.
\]

The lack-of-fit statistic is

\[
T=\sqrt{\frac1N\sum_i r_i^2}.
\]

At every noise level and radius span, the 95% threshold for \(T\) was calibrated by Monte Carlo data generated from a true one-pole model. This avoids assigning a naive information criterion before specifying the nonlinear pole-noise likelihood.

## Blind injection and result

The two-pole data used

\[
q=2.4,\quad
(\tau_1,\tau_2)=(0.25,2.0),\quad
(A_{01},A_{02})=(0.012,0.008),
\quad \omega_c=a^{-1}.
\]

Across \(0.1\le a\le3\), the best wrong one-pole reduction returned

\[
\boxed{
\hat\tau=1.10158,\qquad
\hat q=2.09967,\qquad
\hat A_0=0.0247973
}
\]

with a structured residual

\[
T=7.85698\times10^{-4},
\]

peaking near \(a=1.0814\). Thus a true \(q=2.4\) two-channel coupling masquerades as an apparently credible \(q\simeq2.10\) one-channel law.

Using the independently known synthetic baseline only as a diagnostic, the per-radius effective one-pole relaxation time drifts monotonically:

\[
\tau_{\rm eff}(a=0.1)=0.2708,
\qquad
\tau_{\rm eff}(a=3)=0.9120.
\]

No radius-independent \(\tau\) exists.

## Detection boundary

Fifty null and fifty alternative trials were run for each cell; the map is therefore a preliminary power estimate, not a high-precision confidence table.

- Full span \(0.1\le a\le3\): 100% rejection through relative complex-pole noise \(3.16\times10^{-4}\); 40% at \(10^{-3}\).
- Span ending at \(a=2\): 100% rejection through \(3.16\times10^{-5}\), but only 22% at \(10^{-4}\).
- Span ending at \(a\le0.8\): rejection remains near the nominal 5% false-positive rate even at very high precision.

The controlling resource is therefore **crossover coverage**, not point count alone. A sweep that does not reach both \(a\sim\tau_1\) and \(a\sim\tau_2\) cannot reliably distinguish the channels.

## Surviving discriminator

For a valid one-pole reduction, both must hold:

\[
T\ \text{is noise-compatible},
\qquad
\tau_{\rm eff}(a)=\text{constant}.
\]

Two-pole memory produces a sign-changing, radius-structured reality residual and a drifting effective relaxation time. Those are stronger diagnostics than comparing fitted exponents alone.

## Failure conditions

This rejection test is not valid if:

- intrinsic bare damping is unconstrained;
- pole errors are correlated but treated as independent;
- the measured pole changes branch across the sweep;
- the two relaxation times are too close to resolve;
- one channel has negligible amplitude;
- the radius sweep does not cover the two crossover regions;
- nonlinear amplitude dependence moves the poles.

## Prediction / solver packet

A blinded complex-pole sweep should reject the one-pole architecture when:

1. its radius range includes both relaxation knees;
2. the calibrated reality residual exceeds the one-pole 95% envelope;
3. reconstructed \(\tau_{\rm eff}\) drifts systematically with radius;
4. a paired off-state baseline shows that the drift is not intrinsic core damping.

The predicted readout is dimensionless \(r_i\), complex-pole precision is reported fractionally, and the independent comparator is an off-state or uncoupled bare-core pole sweep.

## Next dependency

Construct the explicit two-pole likelihood with correlated complex-pole errors, fit both one- and two-pole models, and compare cross-validated predictive likelihood rather than raw parameter count.
