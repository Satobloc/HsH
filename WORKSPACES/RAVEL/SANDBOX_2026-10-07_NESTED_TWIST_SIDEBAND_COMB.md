# Ravel sandbox checkpoint — nested-twist sideband comb

**Status:** `GEN/CANDIDATE`. This is a constrained sandbox mechanism, not SAT/H(s)H canon. No historical constant, particle label, or archive numerical result was used as a target.

## Exact source ledger and actual coverage

1. **Archive source:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/SAT THEORY — Superhelicalism.txt`, blob `2144eb505a32571cb253b820dacdd62ca90894f7`, complete 6,369-byte read. The file argues that naïvely scaling a fundamental helical system into a macroscopic bundle fails because component spacing, stiffness, phase cancellation, charge cancellation, winding history, and emergent structure change with scale. Its proposed gravimetric devices and empirical claims were not imported.
2. **Current HsH source:** `Satobloc/HsH/DEVELOPMENT_FULL_CONVOS/7OCT26_A_GRADE_MINEABLES/TAKE2.py`, blob `e11721903ad78d7e3c39b1e879154a7ab539e307`, complete 22,605-byte read. It is a wrapper that writes an interconnected-equation calculator. It commendably keeps unavailable quantities explicit and retains competing formula variants, but it also defaults multiple historical anchors and propagates them into mass, mixing, gravity-scale, and interpolation outputs. Those anchors and outputs were treated as quarantined dependency examples, not evidence or targets.
3. **Controlling sources reread:** `WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md`, `WORKSPACES/COMMON/REFERENCE_DESK/README.md`, `CURRENT_WORKFLOW_ORIENTATION_V2.md`, `BEDROCK.md`, `STATE_OF_THE_THEORY.md`, Ravel `CONTINUITY.md`/`STATE.md`, current symbol/citation/toolbox controls, task graph, and root `🔑/🔑.md`. HSH_RESOURCES remained routing/reference infrastructure rather than theory authority.

## Recovered SAT construction

The useful old construction is not the proposed apparatus. It is the warning that a large-scale coil cannot be assumed to reproduce a small-scale coil merely by geometric enlargement. A nested carrier has at least two mechanically distinct levels:

- an outer winding/history;
- an inner winding transported along it;
- scale-dependent stiffness and spacing;
- phase cancellation among inner components;
- an observable that may discard most inner detail.

In current finite-worldtube language, the minimal question is therefore not whether two drawings look like helices. It is whether an intersection operator can distinguish a fine material-frame winding transported through an outer winding from one unmodulated fine carrier.

## Independent construction

Let (u\in[0,1]) be the material coordinate of a finite core. Use the smallest phase-modulated nested profile

\[
\vartheta(u)=
a_{\rm out}\sin(\pi u)
+b_{\rm in}\sin\!\left[
k_c\pi u+\mu_N\sin(\pi u)+\psi
\right].
\]

Here (k_c\) is an integer fine-winding carrier and (\mu_N\) is the outer-to-inner transport modulation. The controlled twist-bias observable is

\[
G(x)=2\int_0^1\sin^2(\pi u)
e^{2i[xu+\vartheta(u)]}\,du.
\]

This uses the matter/frame bias developed in the preceding heterodyne checkpoint; it is not an additive ambient `H0+c` field.

The Jacobi–Anger expansion gives the discriminator:

\[
\sin\!\left[k_c\pi u+\mu_N\sin(\pi u)+\psi\right]
=\sum_{r=-\infty}^{\infty}
J_r(\mu_N)\sin[(k_c+r)\pi u+\psi].
\]

A genuinely transported inner winding therefore produces a constrained Bessel sideband ladder. Because

\[
\sin^2(\pi u)=\frac12[1-\cos(2\pi u)],
\]

the intersection weight copies each sideband into a triplet at indices

\[
k_c+r,qquad k_c+r-2,qquad k_c+r+2.
\]

This is not an arbitrary Fourier fit: all sideband amplitudes are tied to one modulation parameter (\mu_N\). A single unmodulated carrier has (\mu_N=0) and cannot reproduce the full bias-dependent complex residual pattern.

For small modulation,

\[
\frac{J_{\pm1}(\mu_N)}{J_0(\mu_N)}
\simeq \pm\frac{\mu_N}{2},
\qquad
\frac{J_{\pm2}(\mu_N)}{J_0(\mu_N)}
\simeq \frac{\mu_N^2}{8}.
\]

Thus the first sidebands grow linearly with outer-to-inner coupling, while the second pair begins quadratically.

## Blind numerical result

The hidden synthetic profile was declared independently:

\[
k_c=14,quad
a_{\rm out}=0.085,quad
b_{\rm in}=0.068,quad
\mu_N=0.92,quad
\psi=0.31.
\]

Noisy complex observations used 23 training biases and 11 withheld biases. The integer carrier was scanned blindly over (8\le k_c\le19).

| Quantity | Hidden | Recovered |
|---|---:|---:|
| (k_c) | 14 | 14 |
| (a_{\rm out}) | 0.085000 | 0.085006 |
| (b_{\rm in}) | 0.068000 | 0.068005 |
| (\mu_N) | 0.920000 | 0.919251 |
| (\psi) | 0.310000 | 0.310868 |

Model comparison:

- nested model AIC: (-1.40);
- best single-carrier AIC: (432.70);
- (\Delta\mathrm{AIC}=434.09) in favor of the nested transport law;
- nested withheld complex RMS error: (6.62\times10^{-6});
- single-carrier withheld RMS error: (2.99\times10^{-3}), **451.6 times larger**.

The carrier-only null correctly found the central integer (k_c=14), but could not reproduce the structured complex sidebands. This is important: detecting the fine carrier is weaker than detecting nesting.

## What follows conditionally for H(s)H

If a particle-like finite worldtube contains winding transported along winding, its operational descriptor should not be only total twist, endpoint holonomy, or one fine carrier. It should include a constrained cross-scale modulation law. The smallest chain is

\[
\text{outer frame transport}
+\text{inner winding}
+\text{finite-core intersection}
\longrightarrow
\text{Bessel-constrained sideband comb}.
\]

The sideband comb is a possible mechanics-level definition of “superhelical” that does not depend on visual resemblance.

## Stronger experiment

The decisive test is a controlled outer-deformation sweep. Hold the same fine carrier fixed while varying the outer transport amplitude. Across all runs, fit one common (k_c,b_{\rm in},\psi), allowing only (\mu_N) to change. The sidebands must obey the same Bessel family:

- first sidebands linear near (\mu_N=0);
- second sidebands quadratic;
- all sidebands collapse to the carrier-only state as (\mu_N\to0);
- zeros and sign reversals track the corresponding (J_r(\mu_N)) zeros;
- a detector transfer function may change overall gain/phase but must not move the bias locations of the comb.

## Failure conditions

Reject or revise this architecture if:

- independently varied outer deformation does not reweight the sidebands according to one Bessel parameter;
- different bias ranges or structural modes demand incompatible (k_c) or (\mu_N);
- a detector-fixed transfer function reproduces the same complex comb;
- resolver thickness moves the inferred carrier rather than attenuating high-order sidebands;
- freely adding unrelated Fourier harmonics eliminates the advantage after honest complexity penalties and withheld tests;
- finite-element transport of an actual nested worldtube fails to produce the phase-modulated profile assumed here.

## Boundary between fact, inference, and conjecture

- **Source fact:** the archive source warns that naïve cross-scale helical parity neglects scale-dependent internal cancellation and mechanics. `TAKE2.py` demonstrates why explicit dependency status is necessary but does not validate its propagated equations.
- **Ravel inference:** transported fine winding on a coarse winding is minimally represented by phase modulation, whose sidebands are mathematically constrained.
- **New sandbox conjecture:** twist-bias interrogation of a finite anisotropic core can distinguish nested/superhelical transport from a single fine carrier through a Bessel-constrained complex sideband comb.

## Artifacts

- `WORKSPACES/RAVEL/CODE/nested_twist_sideband.py`
- `WORKSPACES/RAVEL/DATA/nested_twist_sideband.json`
- `WORKSPACES/RAVEL/FIGURES/nested_twist_sideband.svg`

