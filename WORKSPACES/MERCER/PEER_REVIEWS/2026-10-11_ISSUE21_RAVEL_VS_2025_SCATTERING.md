# Mercer Calder | Independent hostile review #21 | 2026-10-11

**Packet:** [HsH issue #21](https://github.com/Satobloc/HsH/issues/21). **Candidate:** `WORKSPACES/RAVEL/SANDBOX_2026-10-08_COVARIANT_SCATTERING_METRIC_AUDIT.md`, read in full (14,554 characters, blob `1608d2383f65015fe8668a98e73e49add5fb15f7`). **Paired primary archive comparator:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/EARLY LOGGED/2025 scatter amp.txt.txt`, read in full (101 source lines/28,300 characters, blob `bc36c057f6c580b0c7ecc5a6ebb6ede7cc91871b`). Draft revision 3 explicitly records earlier *internal self-audit*, but no co-reviewers' comments were consulted before this independent freeze. Source snippets in archive may be AI-generated analysis; no turn-level Nathan attribution independently established.

**Recommendation:** MAJOR REVISION, not rejection of the useful mathematical benchmark. **No evidence of SAT-specific gravity, UV-complete quantum scattering or observational improvement.**

## 1. Numbered verdict, severity ranked

1. **[CRITICAL / claim boundary]** The archived 2025 object is a Gaussian path-weight toy plus hand-assigned reconnection penalty, not Lorentzian state-to-state 2→2 scattering. It lacks in/out states, energy-momentum conservation at a vertex, an S-matrix element, unitarity/optical-theorem check, or a renormalized 4D continuum measure. It cannot warrant comparisons with four-graviton UV finiteness.
2. **[CRITICAL / attribution]** Ravel's mass profile `m(r)=Mr³/(r²+ell²)^(3/2)` is **chosen**, not derived from the 2025 bend/reconnection functional. Neither `ell=ell_f` nor the anisotropic stress `(rho,p_r,p_t)` is a SAT theorem. The note discloses this, correctly; its abstract/title must not imply a derived SAT scattering metric.
3. **[HIGH / 2025 normalization and cutoff]** Numerical convergence to `1+exp(-T ell_f²)` only verifies the code against its **input weights**. Gaussian mode integrals are measure-dependent, and a normalized channel expectation hides the entire determinant normalization. This invalidates unqualified claims of UV-finite amplitude.
4. **[HIGH / dimensionality]** With `y,x,s` lengths, `∫(y''(x))² dx` has dimensions `L^-1`, hence coefficient in dimensionless exponent has dimensions `L`. The independent reconnection term `T_recon ell_f²` requires `[T_recon]=L^-2`. A shared `T` is invalid without an explicit conversion. The 2025 file's dimension-pass audit does not test this collision.
5. **[MEDIUM / 1PM observable domain]** Ravel's fixed-angle Jacobian cancellation is correct at 1PM but assumes a monotone `b -> alpha` branch `q=ell²/b²<1/3`; near `q=1/3`, `dalpha/db=0` and the differential cross-section is singular/multivalued. The paper mentions monotonicity but should provide the explicit threshold next to equation (7). At extremely weak angles, dropping higher-PM terms may swamp an `ell^4` effect; specify regime and method for comparing to full Schwarzschild.
6. **[MEDIUM / incomplete phenomenology]** Photon capture and ideal null ray scattering are mathematical benchmark observables, not measured events. An anisotropic GR source with this profile can reproduce the same metric, so specificity and empirical adequacy remain completely open.
7. **[MEDIUM / sourcing]** The archive document contains embedded retrospective AI-style assumption/audit scores; these are not evidence of actual human authorship, earliest invention, verified Monte Carlo provenance, or prior-art priority. A dated source genealogy and executable historical script/commit are still needed.
8. **[LOW / communication]** The Saturn-ring Hill equations are standard and not obtained from the chosen black-hole metric. Keep that separate application as a clearly bounded test proposal, rather than a scattering-paper result.

## 2. Archive's strongest actual derivation (quote and fair reconstruction)

The 2025 file explicitly writes, near source line 56:

> `\mathcal A = 1 + e^{-T\ell_f^{2}}.`

The source says this is the analytic 'no-loop + one-loop' result, obtained after normalizing each path-curvature sector to weight 1, setting `alpha_top=1` and imposing the reconnection factor. This is a **valid finite two-term combinatorial sum under its declared weights**. It is NOT a nontrivial calculated Lorentzian scattering amplitude. The archival source's separate UV statement (mode convergence) is not supported by a specified continuum path-integral measure.

## 3. Independent counterexample: the missing path-integral measure

Take fixed endpoint transverse displacement `y(x)=sum_{n=1}^N a_n sin(n pi x/L)`, and `S=κ/2 int_0^L(y'')² dx`. Orthogonality gives

`S = κ pi^4/(4 L^3) sum_{n=1}^N n^4 a_n².`

Thus, with the explicit flat Fourier-amplitude measure `prod_n da_n`,

`Z_N = prod_n sqrt(4 pi L³/(κ pi⁴ n⁴)) = [sqrt(4 pi L³/(κ pi⁴))]^N / (N!)².`

For `L=κ=1`, direct numerical values:
- `N=1: Z_N=0.3591742442503331`
- `N=5: Z_N=4.151102345215007e-7`
- `N=10: Z_N=2.713474848899222e-18`
- `N=20: Z_N=2.1570216230174684e-46`.

Therefore `Z_N -> 0`, not a nonzero UV-finite continuum amplitude. If the integration measure is **normalized separately mode by mode**, then `Z_N=1` by convention at every cutoff. These two explicit regularizations demonstrate why a plotted numerical plateau, absent a specified measure, cannot prove physical UV finiteness. The `y'` small-slope condition imposes further restrictions on unrestricted flat Gaussian integration.

**This does not disprove every possible renormalized bending-path theory. It refutes the old paper's sufficiency claim.**

## 4. Independent positive cross-check of Ravel

Candidate metric `A(r)=1-2Mr²/(r²+ell²)^(3/2)` gives the standard null orbit equation

`u''+u = 3M u²/(1+ell²u²)^(5/2)`

and hence at first order `alpha(b)=4M/b (1+ell²/b²)^(-2)`. Let `q=ell²/b²`: logarithmic differentiation yields

`dln(alpha)/dln(b)=(3q-1)/(1+q)`.

At fixed observed angle, the Schwarzschild 1PM impact parameter is `b_0=b(1+q)^2`. The classical Jacobian then yields

`(dσ/dΩ)_core/(dσ/dΩ)_Schw = 1/[(1+q)^3(1-3q)] = 1+6q²+O(q³)`.

Numerically at `q=0.01`: exact 1PM ratio `1.0006083999254065`, versus `1+6q²=1.0006`. At `q=0.1` ratio `1.0733068584308252`, showing rapid loss of truncated accuracy; at `q -> 1/3^-` the Jacobian diverges. Ravel's cancellation **passes its stated domain**. It does not prove quantum S-matrix UV finiteness or a SAT physical law.

## 5. Comparative assessment (the requested five axes)

| Axis | Winner | Rationale |
|---|---|---|
| (1) Mathematical validity | **Ravel** | Consistent explicit GR metric, stress tensor, geodesic equations, conditional 1PM observable. 2025 amplitudes are weight-defined and continuum normalization unidentified. |
| (2) Predictive scope | **Unequal / conditional Ravel** | Ravel derives null deflection and capture *if its chosen metric is physical*; 2025 source proposes a more directly SAT-specific reconnection mechanism but specifies no physical scattering observable. |
| (3) Source/author provenance | **2025 on historical precedence, neither on authorship proof** | Dated archived proposal precedes Ravel's 2026 reconstruction; AI-generated commentary and alleged test scores are not verified user-authored derivations. Ravel correctly cites origins and labels independent ansatz. |
| (4) Genuinely new information | **Ravel on checked mathematical consequences, neither on established new physics** | Its fixed-angle cancellation is calculable in the chosen model; any novelty relative to outside regular-metric literature is not established. Historical source has a distinct project-level weight/reconnection trial, not a demonstrated new amplitude. |
| (5) Empirical testing | **Tie: neither tested** | Ravel computes observational candidates and parameter inequalities but fits no observations; archive performs internal Monte Carlo against assigned weights, not a physical measurement. |

**Overall:** Ravel is superior as a falsifiable *conditional GR calculation*; the older SAT document retains more direct project-historical conceptual precedence. Different category of contribution, neither outranks the other as an empirically validated SAT theory.

## 6. Annotated rewrite proposal

**Replacement title:** `Null Geodesics and Capture in a Stipulated Finite-Core Spherical Metric: A SAT-History Comparator`.

**Replacement abstract:** `We reexamine a historical SAT bend-and-reconnection toy sum, distinguishing its assigned weights from a Lorentzian scattering amplitude. Independently, we analyze the standard Einstein-gravity metric A(r)=1-2Mr²/(r²+ell²)^(3/2) with its required anisotropic stress. We derive its 1PM deflection, the monotone-branch fixed-angle Jacobian cancellation, photon capture, and horizon threshold. These are conditional consequences of a stipulated metric and are not inferred from the SAT source, nor compared with observations. We identify the missing derivation of the stress tensor and its core scale from a finite-core worldtube action as the decisive open test.`

Annotations to original:
- Abstract §1: replace 'covariant general-relativistic completion' with 'independently chosen Einstein-GR comparison ansatz'; do not imply unique completion.
- Section 2: add explicit measure-dependent Gaussian determinant counterexample above; revise UV conclusions accordingly.
- Section 3: do not call metric an exterior vacuum solution; stress extends to infinity.
- Section 4: write `q<1/3` next to equation (7), and compare 1PM core effect against full post-Minkowskian truncation error for each claimed detection regime.
- Sections 5–6: distinguish ideal ray-capture cross-section, telescope ring/shadow and observed brightness; no numerical empirical constraint absent data/uncertainty propagation.
- Section 7: optionally move Saturn rings to a clearly separate proposed application or appendix.
- Conclusion: name explicit alternative non-SAT matter source that reproduces the metric, and list falsification criteria.

## 7. Decisive follow-up / kill condition

Require an independently supplied, dimensioned, 4D-covariant worldtube-timesheet action with a specified integration measure and external asymptotic states; derive the effective stress distribution or mass profile *without preassigning m(r)*. Numerically evaluate `G_mu_nu - 8π T_mu_nu[action]` and a separately measured null-deflection/capture observable, holding ell fixed from independent data. Failure to derive the profile does **not** refute SAT wholesale, but kills this metric's claim to be a SAT prediction.

**Provenance and exposure:** SAT source and HsH candidate read directly from exact paths above, in full. The HSH_RESOURCES reference packet is a source/tool router only. Hypothesis H proper/direct Schreiber texts not opened. No other reviewer commentary read before freezing this document.

*Mercer Calder | Independent reviewer | SANDBOXED*
