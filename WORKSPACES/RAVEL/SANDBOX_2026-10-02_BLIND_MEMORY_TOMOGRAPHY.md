# Ravel sandbox checkpoint — blind one-pole memory tomography

**Status:** sandbox conjecture / conditional derivation, not canonical SAT/H(s)H.

## Narrow question

Can the one-pole finite-core memory law recover its hidden constitutive parameters \((q,\tau,A_0)\) using only radii \(a_i\) and measured complex poles \(z_i\), without supplying the relaxation time or targeting an external observable?

## Sources actually read

1. `Satobloc/SAT_THEORY_ARCHIVE_2023-25/H(s)H Dev +/H(s)H REWORK.txt` — **full sequential read**. Relevant source facts: it preserves the user correction that finite-core worldtube dynamics must be reduced to a minimally explicit action; coefficients must be classified as explicit, inferred, constitutive unknown, speculative, or repair; a local potential contributes a gap rather than a gradient term; an imposed Lorentz ratio is calibration, not emergence.
2. `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/002 Forces Across Temporal Points - to 8-13-24.txt` — **full sequential read**. Relevant source facts: the archive question asks whether an interaction can act along a four-dimensional particle history; the generated answer contrasts ordinary causal propagation with a speculative tension/configuration influence along a filament. No usable dynamical law is supplied.
3. Google Drive targeted searches for “inverse complex pole relaxation time constitutive tomography” and “memory kernel parameter identifiability” — **indexed search, no matches**.
4. Slack search for “relaxation” + “identifiability” — **indexed search, no matches**.

## Source / inference / conjecture boundary

- **Source fact:** the corpus motivates finite histories, propagation along them, and an explicit quadratic dynamics, but does not derive the present memory kernel or inversion.
- **Standard mathematical inference:** a causal exponential kernel has a rational frequency response with one pole.
- **New sandbox construction:** treat the finite-core/support elimination as a one-pole self-energy and use pole reality closure to infer its parameters.

## Construction

Assume the resolved coordinate obeys

\[
\ddot x+\omega_c(a)^2x+\int_0^\infty
\frac{A_0a^q}{\tau}e^{-u/\tau}\dot x(t-u)\,du=0.
\]

For a complex pole \(z\),

\[
D(z)=\omega_c^2-z^2-\frac{i z A_0a^q}{1-i z\tau}=0.
\]

### Case A — independently known conservative baseline

With \(\omega_c(a)\) known, define \(\Sigma_i=z_i^2-\omega_{c,i}^2\) and

\[
B_i(\tau)=\Sigma_i\frac{1-i z_i\tau}{-i z_i}
=\frac{i\Sigma_i}{z_i}+\tau\Sigma_i.
\]

At the correct \(\tau\), every \(B_i\) is real positive and
\(\log B_i=\log A_0+q\log a_i\). The least-squares relaxation estimator is therefore closed form:

\[
\hat\tau=
-\frac{\sum_i w_i\,\Im(i\Sigma_i/z_i)\Im\Sigma_i}
{\sum_i w_i(\Im\Sigma_i)^2}.
\]

Then a linear regression in \((\log a,\log B)\) gives \((q,A_0)\).

### Case B — literally only radii and complex poles

Do not supply \(\omega_c(a)\). Instead require only that the bare core be conservative, so its squared frequency is real and positive:

\[
\omega_{c,i}^2(q,\tau,A_0)=z_i^2+
\frac{i z_i A_0a_i^q}{1-i z_i\tau}\in\mathbb R_{>0}.
\]

The blind objective is

\[
\chi^2(q,\tau,A_0)=
\sum_i\left[
\frac{\Im\omega_{c,i}^2}{|z_i|^2}
\right]^2.
\]

For fixed \((q,\tau)\), \(A_0\) enters linearly and is eliminated analytically; the remaining two-dimensional landscape has an isolated minimum if the radius sweep has enough dynamic range.

## Numerical closure test

Synthetic inputs were generated from \(q=2.4\), \(\tau=0.8\), \(A_0=0.02\), \(\omega_c=a^{-1}\), and 41 logarithmically spaced radii \(0.1\le a\le3\). The inversion received only \((a_i,z_i)\).

- Noiseless recovery: \(\hat\tau=0.800000000004\), \(\hat q=2.399999999996\), \(\hat A_0=0.0200000000001\); normalized least-squares cost \(1.14\times10^{-26}\).
- 300 trials with independent complex relative pole noise \(2\times10^{-5}\):
  - \(\tau\): median 0.79995, 95% interval [0.79822, 0.80166].
  - \(q\): median 2.40011, 95% interval [2.39820, 2.40194].
  - \(A_0\): median 0.0199977, 95% interval [0.0199611, 0.0200363].
- A high-frequency-only window \(a\le0.35\) is poorly conditioned: the 95% interval widens to \(\tau\in[0.641,0.906]\), \(q\in[1.24,2.99]\). Thus “many points” do not replace a sweep that reaches the relaxation crossover.

## Discriminator and failure condition

The recovery is unique only conditional on a conservative bare core and a one-pole passive memory channel. If arbitrary intrinsic bare damping \(\gamma_c(a)\) is allowed, then

\[
\omega_c^2\rightarrow \omega_c^2-i z\gamma_c(a)
\]

can absorb the same imaginary closure at each radius. The pole data then do **not** identify \((q,\tau,A_0)\) without an off-state baseline, a constrained model for \(\gamma_c(a)\), or an independent readout. Multi-pole memory also fails the one-pole test by producing radius-dependent inferred \(\tau_i\) and a structured nonzero minimum.

## Tight solver / experiment

Sweep a geometry-controlled radius through frequencies on both sides of \(|z|\tau\sim1\); fit complex poles rather than linewidth alone. Run:

1. the poles-only reality-closure inversion above;
2. a paired uncoupled/off-state measurement of \(\omega_c(a)\);
3. a one-pole versus two-pole residual comparison.

Accept the one-pole finite-core memory candidate only if the same \((q,\tau,A_0)\) closes both pole reality and the independently measured baseline, with no radius trend in residuals.

## Surviving invariant

The useful object is not a fitted linewidth exponent. It is the cross-radius **reality closure**

\[
\Im\left[z_i^2+
\frac{i z_i A_0a_i^q}{1-i z_i\tau}\right]=0,
\]

which is representation-stable under changes of plotting coordinates but not under adding hidden dissipative degrees of freedom.

## Next dependency

Inject a second relaxation pole and test whether information criteria plus the radius dependence of \(\tau_i\) reliably reject the one-pole model at realistic pole precision.
