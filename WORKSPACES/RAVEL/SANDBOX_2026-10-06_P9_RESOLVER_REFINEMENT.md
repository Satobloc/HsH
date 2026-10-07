# Ravel sandbox checkpoint — P9 resolver refinement and contact branch splitting

**Status:** sandbox construction only; not canonical SAT or H(s)H theory.

## Exact reading record

Read the controlling front door WORKSPACES/COMMON/NEW_INSTANCE_START_HERE.md, then its materially relevant Reference Desk, symbol/citation, and toolbox pointers. Mersearch/Mercer_Searcher was not exposed, so retrieval used indexes and direct paths, not generic GitHub search.

Reviewed as quarantined routing/familiarization: HSH_RESOURCES/!_HSH_RESOURCES_INDEX.md; HSH_RESOURCES/HQ/TOOL_CHEST.md; HSH_RESOURCES/info/TOOLKIT_DIGESTION.md; HSH_RESOURCES/info/NATHAN_PREFERENCES/BOOT.md; and HSH_RESOURCES/HQ/THE_WAR_ROOM/DECLARATION.txt.

Fresh SAT source: SAT_THEORY_ARCHIVE_2023-25/[[[SAT_2025_DERIV]]].txt, lines 1–700 contiguously. This covers the embedded ACTION PLAN.txt and ACTION_PLAN--next phase.txt. Useful source fact: the old construction itself says that filament configuration space, metric emergence, phase binding, Hilbert-space structure, dynamics, observables, and failure modes still required explicit definition. Historical mass/topology dictionaries and fitted particle-sector claims were not used as targets or inputs.

Fresh H(s)H source: all of DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/2026-09-26_RUN_133_CURVATURE_FREE_B2_RADIUS_RECONSTRUCTION.md. Source fact: within that frozen quadratic-contact model, area plus span reconstruct a rank-two carrier radius,
\[
\epsilon \sim \frac{A_\Sigma}{2 C_4\ell_\parallel},
\]
and an independent radius breaks an \(S_2/B_2\) degeneracy by a factor of \(\pi\). It was consulted only after the independent P9 construction. Its transferable lesson is that an extra observable can break a reduced-readout degeneracy.

## SAT-to-H(s)H translation

Take the old SAT “filament in 4D” language as a worldtube map, not a particle dictionary:
\[
\mathcal W=\{X^\mu(\tau)+n^\mu_i(\tau)y^i:\;y^T G(\tau)y\le 1\}.
\]
A resolver \(\mathcal R=\{h_k,K_k,C_\mathcal R\}\) maps that tube into channel data
\[
d_k[\mathcal W]=\int_{\Sigma_\tau\cap\mathcal W}K_k(y;h_k)\rho(y)\,dA+\eta_k.
\]
H(s)H should be a compatibility law for these readouts: a claimed observable must survive refinement of \(\mathcal R\).

For the P9 proxy, nuisance parameters obey
\[
g(\theta,\delta;\mathcal R)=J^T R=0,
\]
and implicit differentiation gives
\[
F_\mathcal R(a,o)=S\,\frac{\langle e_1,e_2\rangle}{\langle e_1,e_1\rangle}.
\]
The candidate \(o_\mathcal R(a)\) solves \(F_\mathcal R=0\). A necessary continuum-readout condition is
\[
|o_{\mathcal R_m}-o_{\mathcal R_n}|\le C(g_m^p+g_n^p)+\varepsilon_{\rm num}.
\]
At a contact \(a_c\), an ordinary scalar also requires
\[
\Delta o_n=o_n(a_c+\epsilon)-o_n(a_c-\epsilon)\to0
\]
as spacing and then \(\epsilon\) vanish. A nonzero limit instead requires a discrete contact-state label.

## Computation

Artifacts:

- WORKSPACES/RAVEL/CODE/p9_resolver_refinement.py
- WORKSPACES/RAVEL/CODE/p9_root_multiplicity_scan.py
- WORKSPACES/RAVEL/DATA/p9_resolver_refinement.json
- WORKSPACES/RAVEL/DATA/p9_root_multiplicity_scan.json
- WORKSPACES/RAVEL/FIGURES/p9_resolver_refinement.svg
- WORKSPACES/RAVEL/FIGURES/p9_resolver_refinement.png

The 16/24/32/48 sequence is matched-domain refinement, not strict nesting. I added a true endpoint-preserving log-grid nesting sequence 16/31/61/121.

At fixed bulk coordinate \(a=0.055\):

| channels | family | max log gap | implicit zero \(o_*\) |
|---:|---|---:|---:|
| 16 | both | 0.160291 | -0.012488699 |
| 24 | matched | 0.104538 | -0.007977395 |
| 32 | matched | 0.077560 | -0.008110085 |
| 48 | matched | 0.051157 | -0.006902931 |
| 31 | strict nested | 0.080146 | -0.008403575 |
| 61 | strict nested | 0.040073 | -0.005926359 |
| 121 | strict nested | 0.020036 | -0.005511972 |

The last strict-nesting increment is \(+4.1439\times10^{-4}\). Linear- and quadratic-in-gap extrapolations give -0.0042154 and -0.0044032. This is evidence for bulk stabilization near -0.0043, not a certified limit. The matched-family linear extrapolation is -0.0039424, while its quadratic fit is unstable at -0.0082061. Changing derivative steps shifted matched-sequence roots by at most \(1.09\times10^{-7}\).

At the same inherited contact \(a_c=0.06125742185\), with \(\epsilon=10^{-4}\):

| channels | below root | above root | above − below |
|---:|---:|---:|---:|
| 16 | -0.01744147 | -0.01249719 | +0.00494429 |
| 31 | -0.01392329 | -0.00351128 | +0.01041202 |
| 61 | +0.00596086 | -0.02456442 | -0.03052528 |
| 121 | +0.00854466 | -0.04514513 | -0.05368980 |

A coarse scan over \(o\in[-0.075,0.03]\) found exactly one sign-change interval on each side for N=61 and N=121. The split is therefore not explained by selecting among multiple visible zeros in that interval.

## Inference and sandbox conjecture

**Inference:** the P9 zero behaves like a potentially convergent bulk coordinate but not like an ordinary contact-continuous scalar. Refinement sharpens the contact singularity rather than washing it out.

**Sandbox conjecture — contact-state H(s)H:** a finite-core worldtube needs two readout charts near a topology-changing intersection:
\[
(o,\chi),\qquad \chi=\operatorname{sgn}(h-r_{\rm support})\in\{-1,+1\}.
\]
Particle-like persistence is transport of \(\chi\) plus a smooth within-chart coordinate \(o_\chi\). The competing architecture replaces sharp contact by a physical thickness kernel of fixed width \(\sigma_c\) in \(\log h\); then \(\chi\) is not a state label and \(\Delta o\) must collapse once \(g\ll\sigma_c\).

## Critical confound and failure condition

The current covariance is
\[
C_{ij}=\sigma^2\phi^{|i-j|},\qquad \phi=0.60,
\]
indexed by channel number rather than physical \(\log h\) separation. Refinement therefore shrinks the physical correlation length and adds effectively new information. The observed bulk limit and growing split belong to the combined resolver-plus-noise sequence, not yet to a fixed continuum instrument.

The scalar-zero architecture fails if, under a physically fixed covariance
\[
C(h_i,h_j)=\sigma^2\exp[-|\log h_i-\log h_j|/\lambda]
\]
and fixed contact smoothing, either the bulk roots are not Cauchy, or \(\liminf|\Delta o_n|>0\) while no reproducible contact-state label can be transported.

## Next decisive solver test

Repeat 16/31/61/121 with a covariance fixed in physical log separation, quadrature weights that prevent information growth merely from added channels, three fixed contact widths \(\sigma_c\), and continuation in \(a\).

Discriminator:

- smoothed scalar: for fixed \(\sigma_c>0\), \(|\Delta o_n|\to0\) once \(g_n\ll\sigma_c\);
- contact state: within-chart roots converge, while chart separation approaches a nonzero resolver-independent value and correlates with independently computed \(\chi\);
- failure: neither within-chart convergence nor stable chart separation appears.

Run 133 cross-pollinates only as method: add an independently measured finite-core radius or intersection area. If it predicts the branch label, the degeneracy may be physical; if not, it is a readout artifact.

