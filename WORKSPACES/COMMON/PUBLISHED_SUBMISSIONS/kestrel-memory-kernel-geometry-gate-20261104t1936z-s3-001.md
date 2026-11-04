# P2 architecture gate: coarse-grained memory and geometry-derived inertia

**Run:** Workshop Relay :36, 2026-11-04 19:36 UTC  
**Status:** Assistant-proposed test architecture. Not a physical prediction, empirical result, or BEDROCK change.

## New distinction

Existing Kestrel work already specifies static geometry-to-readout maps, cross-scale readout composition, fiber-based identifiability, and block-interaction compatibility. This note adds a separate question:

**When fine nested geometry is reduced to a coarse slice, is the coarse state sufficient to predict later slice readouts, or do eliminated internal degrees of freedom survive as memory?**

This does not assert that a four-dimensional block fundamentally evolves. Any transfer map is an induced relation between slices under a declared time function and observer, derived from the full representation and established sector physics, not a new fundamental time-flow law.

## Slice-transfer closure

Let X_f(tau1), X_f(tau2) be admissible fine slice states; C_tau_i declared coarse-graining maps; Phi_f(tau1 -> tau2) the source-defined fine slice-transfer relation; and Phi_bar a candidate coarse transfer.

Markovian coarse closure requires:

\[
C_{\tau_2}\circ\Phi^f_{\tau_1\to\tau_2}
=
\bar\Phi_{\tau_1\to\tau_2}\circ C_{\tau_1}.
\]

Equivalently, if two fine states collapse to the same initial coarse state, they must produce the same later coarse state:

\[
C_{\tau_1}(x)=C_{\tau_1}(y)
\;\Longrightarrow\;
C_{\tau_2}(\Phi^f(x))=C_{\tau_2}(\Phi^f(y)).
\]

This applies the existing fiber-factorization criterion to slice transfer. It is distinct from the static scale/readout commutation condition in [Kestrel's multiscale readout contract, issue #1169](https://github.com/Satobloc/HsH/issues/1169).

If the condition fails, the coarse slice alone is not a sufficient predictive state. Retain additional source-defined variables, derive a memory/history term from eliminated degrees, or mark the coarse representation unresolved. A freely fitted memory kernel is not an acceptable substitute for a derived or independently constrained reduction.

## External comparator: memory-induced inertia

A relevant, previously unincorporated comparator is Francisco Monroy's *Inertial Response from Variational Openness: A Generalized Mach Principle*. The seven-page source copy identifies itself as a preprint submitted to Elsevier and explicitly says it has not been peer reviewed. Its source record is SSRN 7398357: https://ssrn.com/abstract=7398357.

The paper treats coupling to complementary degrees of freedom as a causal variational response. After reduction, a coordinate-memory kernel K(s) can contribute an effective inertial sector. When the required temporal moments exist and retained motion is slow relative to the memory timescale, it obtains:

\[
m_{\mathrm{open}}
=
-\frac12
\left.\frac{d^2}{d\omega^2}\operatorname{Re}\widetilde K(\omega)\right|_{\omega=0}
=
\frac12\int_0^\infty s^2K(s)\,ds.
\]

The same low-frequency expansion links static, dissipative, and inertial coefficients:

\[
\kappa_{\mathrm{eff}}=\kappa_0+K_0,\qquad
\Gamma_{\mathrm{eff}}=\Gamma_0-K_1,\qquad
m_{\mathrm{eff}}=m_0+\frac12K_2.
\]

Its delayed-feedback example links changes as Delta-kappa = k, Delta-Gamma = -k tau, and Delta-m = k tau^2/2. It calls for joint fitting of the real and imaginary parts of inverse susceptibility over the same low-frequency band, rather than inferring inertia from a resonance shift alone.

Limitations matter. The weak result is that causal exterior response can contribute to inertia. The stronger claim that the residual local term vanishes, m0 = 0, is additional and does not follow from the memory construction. Causality alone does not guarantee finite kernel moments, a controlled local derivative expansion, nonnegative induced inertia, or stability. The source leaves a covariant derivation from explicit exterior fields for future work and reports no dataset generated or analyzed.

The separate arXiv paper [*Variational Openness*, arXiv:2605.17032](https://arxiv.org/abs/2605.17032), is the foundational variational formulation, not the same paper as the SSRN inertial-response preprint. The latter's PDF lists DOI 10.1002/andp.19183600402 as a reference to Einstein's 1918 paper; that DOI must not be assigned to Monroy's preprint.

## Consequence for H(s)H

Nathan Direct entries ND-2026-10-18-04 and ND-2026-10-18-07, as transcribed in live BEDROCK, require nested-worldtube comparisons that hold coarse geometry fixed while varying internal geometry, and vice versa. They do not supply a memory kernel or coarse transfer law.

The proposed H(s)H map is:

\[
\text{fine nested geometry}
\longrightarrow
(\text{retained coarse state},\;\text{derived response/memory})
\longrightarrow
\text{sector response}
\longrightarrow
\text{instrument record}.
\]

The map from H(s)H geometry and interaction rules to an effective kernel is not defined. The Monroy model is a competing reduced description, not an equivalence or evidence for H(s)H. Its variational interface is a partition of degrees of freedom, not necessarily a material contact surface. It must not be identified with the H(s)H time surface, worldtube boundary, or contact law by analogy.

Thickness, twist, or contact structure is not forced merely because a low-frequency inertial coefficient is fitted. Such structure becomes a candidate forced feature only if source-defined geometry determines a distinctive kernel or cross-channel signature that survives calibration/holdout and cannot be reproduced by the generic memory comparator within declared nuisance and uncertainty. If eliminating a feature changes no identifiable held-out observable, it is not forced by that dataset. If it is needed only because the coarse state fails to close, distinguish an explicit retained variable from a derived memory representation.

## Test matrix

| Element | Required specification |
|---|---|
| Hypothesis | H(s)H geometry determines a slice-transfer law and, where reduction requires it, a specific memory response |
| Shared parameters | Source-defined geometry and coupling parameters, frozen across frequencies and sectors |
| Calibration | Declared time/frequency interval, force/displacement calibration, timebase, instrument transfer function |
| Holdout | Separate time blocks or frequency band, retaining temporal correlations and shared calibration errors |
| Predicted observable | Complex inverse susceptibility chi^{-1}(omega), real and imaginary parts, plus independent geometric readout if available |
| Standard comparator | Local Newtonian/GR response and causal reduced-memory model on the same data and nuisance budget |
| Falsification | Frozen H(s)H map/kernel fails held-out response outside covariance-derived region, or requires unconstrained per-channel/per-frequency retuning |
| Stronger claim | Any all-inertia-induced claim needs a source-defined coupling parameter and predeclared zero-coupling intercept test; do not import the comparator's lambda into H(s)H |

If the Markovian slice-transfer condition fails but a source-derived memory or augmented-state model passes holdout, the Markovian coarse representation is falsified, not necessarily the full four-dimensional construction. If neither the declared memory reduction nor H(s)H predicts held-out data, the proposed reduction fails.

## Formal and empirical status

The existing Lean theorem hallway_factorization_iff_fiber_compatibility in Kestrel's KestrelProjectedIncidence.lean is the relevant conditional result: a deterministic downstream map factors through a coarse map exactly when it is constant on that map's fibers. The proposed slice-transfer condition applies that theorem once physical maps are defined.

The module compiled in existing [Kestrel PR #873](https://github.com/Satobloc/HsH/pull/873) workflow [#417589](https://github.com/Satobloc/HsH/actions/runs/41758925555), and its theorem-specific axiom report ran. The overall PR build nevertheless failed later in KestrelMovingSlice.lean; the PR remains open, draft, and unmerged. This is not a full-project green build. Lean does not establish that the proposed H(s)H maps exist or that their physical premises are true.

No new Lean theorem was added. No P2 physical system was selected; no raw time-series dataset, units, calibration covariance, or independent holdout was retrieved. No physical calculation, fit, or prediction was performed. The Kelvin-wave experiment and its Figshare dataset remain a candidate only; raw data have not been retrieved. P2 remains on HOLD.

This is an assistant-proposed architecture and comparator, not a Nathan Direct equation, historical SAT equation, independent measurement, theory promotion, or Factory Floor submission. BEDROCK, SAT-O, and Blockwave originals are unchanged.
