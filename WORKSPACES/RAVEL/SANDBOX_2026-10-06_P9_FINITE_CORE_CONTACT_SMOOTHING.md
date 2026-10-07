# Ravel sandbox checkpoint — finite-core contact smoothing

**Status:** sandbox readout experiment; not canonical SAT/H(s)H theory.

## Exact reading record

Refreshed WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md and the materially relevant Reference Desk, HSH_RESOURCES index, Tool Chest, Nathan preference router, and War Room declaration. HSH_RESOURCES remained a quarantined methods/routing layer. Mersearch/Mercer_Searcher was not exposed, so indexed and direct-path retrieval was used.

Fresh SAT archive source: SAT_THEORY_ARCHIVE_2023-25/2026/SAT THEORY — Filament onto.txt, lines 1–1000 contiguously of a 1732-line file. This exploratory conversation contains extensive black-hole/particle speculation and generated formalization. The useful source facts are narrower:

1. Nathan describes the active mechanical picture as a rigid filament coupled to a flexible time surface.
2. Nathan explicitly corrects the generated “UV safety lock”: it is not a lock/rule, but a state-change boundary whose basic observable still needs definition.
3. Nathan repeatedly marks the surrounding black-hole, particle, lattice, and numerical claims as speculation or as needing tests.

No particle identifications, numerical constants, lattice claims, or black-hole equivalences were imported.

Fresh H(s)H source: HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/RUN_142_AFFINE_RESIDUAL_OBSTRUCTION_CLASSIFICATION.md, complete (175 lines plus terminal newline). It classifies when a raw affine translation is removable and when its quotient component is invariant. It was consulted after the independent smoothing construction. Its transferable lesson is that an apparent residual should be retained only after the admissible representation change has been factored out.

## Independent finite-core construction

The previous P9 fixture used the exact branch function
\[
x_+=\max(x,0),
\]
inside a square-root intersection kernel. That is a zero-width boundary. It cannot by itself decide whether a finite-core worldtube should have a hard contact chart or a continuous transition layer.

Define the local, provisional readout width
\[
\sigma_c>0
\qquad\text{(LOCAL:P9_SMOOTH_CONTACT; dimensionless log-height width)}
\]
and replace
\[
x_+\longmapsto
S_{\sigma_c}(x;h)
=h\sigma_c\log\!\left(1+\exp\frac{x}{h\sigma_c}\right).
\]
Then
\[
S_{\sigma_c}\to x_+\quad(\sigma_c\to0),
\]
while every fixed \(\sigma_c>0\) removes the branch cusp. This modifies only the readout kernel, not the worldtube carrier.

The solver retained the physical-log-height covariance and fixed information budget from the preceding checkpoint.

## Numerical result

At the inherited contact \(a_c=0.0612574218504\), using symmetric probes \(a_c\pm10^{-4}\):

| \(\sigma_c\) | channels | \(g/\sigma_c\) | bulk root | contact jump |
|---:|---:|---:|---:|---:|
| 0.02 | 31 | 4.007 | -0.00645513 | \(-1.385\times10^{-5}\) |
| 0.02 | 61 | 2.004 | -0.00570703 | \(-1.350\times10^{-5}\) |
| 0.02 | 121 | 1.002 | -0.00491290 | \(-1.219\times10^{-5}\) |
| 0.08 | 31 | 1.002 | -0.04346691 | \(+3.211\times10^{-6}\) |
| 0.08 | 61 | 0.501 | -0.04285730 | \(+3.270\times10^{-6}\) |
| 0.08 | 121 | 0.250 | -0.04185151 | \(+3.135\times10^{-6}\) |

For \(\sigma_c=0.08\), \(N=121\):

| probe half-width \(\epsilon\) | root jump | jump/\(2\epsilon\) |
|---:|---:|---:|
| \(2\times10^{-4}\) | \(5.6983\times10^{-6}\) | 0.01425 |
| \(1\times10^{-4}\) | \(3.1350\times10^{-6}\) | 0.01568 |

The near-constant divided difference shows that the residual is an ordinary smooth slope, not a finite jump. The prior sharp-contact values were \(10^{-3}\)–\(10^{-2}\), changed sign under refinement, and did not scale linearly with \(\epsilon\).

Artifacts:

- WORKSPACES/RAVEL/CODE/p9_finite_core_contact_smoothing.py
- WORKSPACES/RAVEL/CODE/plot_p9_finite_core_contact_smoothing.py
- WORKSPACES/RAVEL/DATA/p9_finite_core_contact_smoothing.json
- WORKSPACES/RAVEL/FIGURES/p9_finite_core_contact_smoothing.svg
- backward-compatible contact-width extensions in support_mirror_mode_asymmetry.py and p9_implicit_normal_jet.py

The captured data contain the completed 31/61/121 channel sweeps and two most informative epsilon points. The redundant \(5\times10^{-5}\) 121-channel solve was stopped because the inherited sharp-contact quadrature still subdivides at every obsolete branch point and had become computationally disproportionate.

## Boundary between fact, inference, and conjecture

**Source fact:** the archive itself distinguishes a state-change boundary from the generated hard “lock,” and leaves its observable undefined. Run 142 separately demonstrates the need to quotient removable residual structure.

**Numerical inference:** every fixed positive contact width tested converts the P9 contact discontinuity into a smooth response. Once \(g\lesssim\sigma_c\), the contact jump is stable across resolver refinement and proportional to probe separation.

**Negative result:** the bulk zero is strongly width-dependent:
\[
o_*\approx-0.005\quad(\sigma_c=0.02),\qquad
o_*\approx-0.042\quad(\sigma_c=0.08).
\]
Therefore smoothing does not recover a carrier invariant. It selects a family of calibrated readout maps.

**New sandbox conjecture:** if finite-core H(s)H has a physical transition thickness, its primary local descriptor should be the dimensionless resolution ratio
\[
\zeta_c=\frac{g}{\sigma_c},
\]
not a bare contact/no-contact bit. Hard chart splitting is the singular limit \(\sigma_c\to0\); smooth finite-core transport is the regime \(\zeta_c\ll1\).

## Failure condition

Reject this smoothing architecture if a geometry-derived kernel with independently specified finite-core width does not reproduce the observed linear-in-\(\epsilon\) collapse, or if its roots fail strict refinement at fixed \(\sigma_c\). Reject any claim that P9 determines the core width: the present calculation inserts \(\sigma_c\) as a readout parameter and shows sensitivity, not identifiability.

## Next decisive test

Promote neither tested width. Instead:

1. generate synthetic data with a hidden \(\sigma_c\);
2. fit support, low modes, and \(\sigma_c\) jointly;
3. withhold an independent dense contact sweep;
4. test whether \(\sigma_c\) is identifiable and whether recovered bulk coordinates transfer across channel families.

A tight prediction candidate is resolution collapse: after plotting against \(\zeta_c=g/\sigma_c\), independently generated channel families should approach the same smooth-contact curve. Failure of that collapse would show that \(\sigma_c\) is merely another acquisition regularizer.

