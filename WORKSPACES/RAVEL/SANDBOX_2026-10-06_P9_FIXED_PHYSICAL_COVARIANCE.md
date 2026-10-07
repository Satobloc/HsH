# Ravel sandbox checkpoint — fixed-physics P9 resolver audit

**Status:** sandbox construction; not canonical SAT/H(s)H theory.

## Exact source record

Controlling onboarding was refreshed from WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md and materially relevant Reference Desk, symbol, citation, toolbox, HSH_RESOURCES index/Tool Chest/toolkit-digestion, and War Room routing documents. Mersearch/Mercer_Searcher was not exposed, so indexed and direct-path retrieval was used.

Fresh SAT archive source: SAT_THEORY_ARCHIVE_2023-25/2026/SAT MATH — BACKBONE.txt, lines 1001–2000 contiguously. This region is a generated “axiomatic” assembly mixing direct mass rules, DSR/LQG imports, anomaly interpretations, and strong closure claims. It is used here as a negative methodological control: measurement-dependent maps cannot become carrier laws merely by being called axioms. Its constants, particle assignments, lattice/granularity assumptions, and phenomenological targets were excluded.

Fresh H(s)H source: HsH/DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/RUN_141_GAUGE_SAFE_HAGALAZ_TRIANGLE_RESIDUAL.md, complete (129 lines). Source fact: the raw translation residual is gauge-dependent, while the quotient class
\[
[t]\in\mathbb R^4/\operatorname{im}(I-L)
\]
and its projected obstruction are invariant under allowed origin changes. The transferable method is to classify an obstruction only after quotienting representational freedom. Run 141 remains sandboxed and does not control this P9 model.

## Independent construction

The earlier nested audit changed two things simultaneously:

1. the channel locations \(h_i\);
2. the noise covariance \(C_{ij}=\sigma^2\phi^{|i-j|}\).

Because \(|i-j|\) is an index distance, densification shortened the correlation length in physical \(\log h\). The apparent bulk limit near \(-0.0043\) was therefore not a fixed-instrument continuum limit.

I replaced it with
\[
C^{\rm phys}_{ij}
=\sigma^2\exp\!\left[-\frac{|\log h_i-\log h_j|}{\lambda_h}\right],
\qquad
\lambda_h=\frac{g_{16}}{-\log 0.60}=0.31378\ldots,
\]
so the physical correlation length is fixed and reproduces the old nearest-neighbor correlation on the 16-channel reference grid.

A second scheme conserves the total quadratic-information budget. With normalized trapezoid weights \(w_i\) in \(\log h\),
\[
C^{\rm budget}=D\,C^{\rm phys}D,\qquad
D_{ii}=\sqrt{\frac{1/16}{w_i}}.
\]
Dense channels therefore subdivide the reference observation budget rather than creating unlimited independent precision.

## Numerical results

Artifacts:

- WORKSPACES/RAVEL/CODE/p9_physical_covariance_refinement.py
- WORKSPACES/RAVEL/CODE/p9_contact_epsilon_scaling.py
- WORKSPACES/RAVEL/DATA/p9_physical_covariance_refinement.json
- WORKSPACES/RAVEL/DATA/p9_contact_epsilon_scaling.json
- WORKSPACES/RAVEL/FIGURES/p9_physical_covariance_refinement.svg

At the bulk coordinate \(a=0.055\):

| channels | index AR(1) | physical GP | physical GP + fixed budget |
|---:|---:|---:|---:|
| 16 | -0.01248870 | -0.01300606 | -0.01334463 |
| 31 | -0.00840357 | -0.01344319 | -0.01339618 |
| 61 | -0.00592636 | -0.01338577 | -0.01304018 |
| 121 | -0.00551197 | -0.01515156 | -0.01352123 |

For the fixed-budget sequence, linear- and quadratic-in-gap extrapolations are \(-0.0133177\) and \(-0.0134357\). The last increment is \(-4.81\times10^{-4}\). Thus the bulk zero is compatible with stabilization near \(-0.0134\) under this declared instrument, but it is not an invariant of the forward geometry alone: changing the readout metric changes the limit materially.

At the inherited sharp contact \(a_c=0.06125742185\), the fixed-budget above-minus-below jumps are:

| channels | jump at \(\epsilon=10^{-4}\) |
|---:|---:|
| 16 | +0.00256980 |
| 31 | -0.01931552 |
| 61 | -0.00141967 |
| 121 | +0.00602777 |

Each root search found exactly one coarse sign-change interval, no derivative stencil crossed a contact stratum, and the nuisance Hessian remained positive.

Approaching contact did not smooth the split:

| channels | \(\epsilon=2\times10^{-4}\) | \(10^{-4}\) | \(5\times10^{-5}\) |
|---:|---:|---:|---:|
| 61 | -0.00207486 | -0.00141967 | -0.00124181 |
| 121 | +0.00355897 | +0.00602777 | +0.00882104 |

## Source fact, inference, conjecture

**Source fact:** the archive segment contains measurement-centric constructions but does not establish that its readout variables are carrier invariants. Run 141 demonstrates, in a different sandbox, how a gauge-dependent raw residual must be replaced by a quotient obstruction.

**Inference:** the P9 bulk zero is an instrument-calibrated coordinate. Fixing covariance and total information removes most of the previous density drift, but produces a different limiting coordinate. Sharp contact remains non-smooth, while its jump magnitude and sign fail refinement compatibility.

**New sandbox conjecture:** H(s)H readout should be formulated as a quotient atlas. For an admissible resolver family \(\mathfrak R\), a carrier descriptor is not a raw zero \(o_{\mathcal R}\), but an equivalence class
\[
[o]=\{o_{\mathcal R}:\mathcal R\in\mathfrak R\}/\sim
\]
only when explicit transition maps \(T_{\mathcal R'\mathcal R}\) satisfy
\[
o_{\mathcal R'}=T_{\mathcal R'\mathcal R}(o_{\mathcal R})
\]
and cocycle consistency. The current P9 roots have no recovered transition law, so they remain calibration coordinates.

The prior contact-state proposal is not promoted. The data support a singular readout stratum, but not a resolver-independent transported label.

## Failure condition

Reject P9 as a carrier descriptor if no low-complexity transition map predicts roots across covariance kernels, channel families, and information budgets within numerical error. Reject a contact-state interpretation if the sharp-contact jump lacks a stable quotient invariant or independently measured branch label.

## Next discriminator

Replace the square-root contact by an explicitly declared finite-core smoothing width \(\sigma_c\) in log height and repeat the fixed-budget 16/31/61/121 ladder for three fixed \(\sigma_c\). The competing predictions are:

- finite-core scalar: for \(g_n\ll\sigma_c\), contact jumps collapse and bulk roots converge;
- quotient/contact state: within-chart roots converge and a resolver-independent obstruction remains;
- readout artifact: roots move without a stable transition map under either refinement.

A second independent observable—support radius or intersection area, as suggested methodologically by Run 133—should then be tested as the possible branch label rather than inferred from P9 itself.

