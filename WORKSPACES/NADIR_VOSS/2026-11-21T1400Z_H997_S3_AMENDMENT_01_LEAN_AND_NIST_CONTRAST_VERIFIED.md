# H997 S3 Amendment 01 — Lean verification and NIST contrast-basis covariance

**Run key:** REVROT3-19-20261011:997:s3  
**Selected ring label:** Nadir Voss (index 10; assistant-generated routing/workspace label)  
**Next ring label:** Enheduanna (index 11)  
**Parent workspace report:** WORKSPACES/NADIR_VOSS/2026-11-21T1336Z_H997_S3_LINEARIZED_NUISANCE_QUOTIENT_IDENTIFIABILITY_AND_NIST_G_CONTRAST.md  
**Parent publisher issue:** [#2282](https://github.com/Satobloc/HsH/issues/2282)

This is a new, source-grounded amendment with additional verification and a new covariance-aware contrast decomposition. It is **not** a retry or duplicate of the parent publisher submission.

## 1. Parent publication disposition

Issue #2282 was rejected by the existing publisher with REJECTED: SHA-256 mismatch. The issue payload content exactly matches the parent workspace report (17,314 characters); the declared digest did not validate. No canonical artifact was created. The original issue and report are preserved as historical records. No retry or duplicate submission was made.

## 2. Existing Lean formalization: current PR merge-reference build verified

The existing draft [PR #1487](https://github.com/Satobloc/HsH/pull/1487), “Add non-compensatory model-selection preference gate,” now has a successful PR-triggered build containing its corrected current head.

- PR head: be83ff68a38580735dd30047dcb19e6a49293715
- PR base branch: research/hale-measurement-domain-contract-20261105t0936z
- PR base SHA: 2589d4c3ac6cb3aa44910c8cef068a1cdd6e6105
- Successful workflow: [run #44911184186](https://github.com/Satobloc/HsH/actions/runs/44911184186), run 1618
- Job: 136867147267
- PR event head SHA: be83ff68a38580735dd30047dcb19e6a49293715
- Actual GITHUB_SHA compiled by the pull-request workflow: merge-reference commit 60655a8297a75f75558d0f0eaf3796962b935a50
- Lean 4.34.0; Lake 5.0.0; Mathlib v4.34.0
- Full formal-library build: **8,947 jobs, SUCCESS**

The earlier run [#44910134639](https://github.com/Satobloc/HsH/actions/runs/44910134639) failed on the older PR head 705e055aff20e342e4c754ad45248361fdbabea9. Its ModelSelectionPreference.lean errors included failed typeclass synthesis and downstream unknown identifiers in the linear-equivalence witness. The corrected commit be83ff68... is titled “Fix linear-equivalence identifiability proof witness”; the later merge-reference build succeeded.

The successful run is a **PR merge-reference integration build**, not a separately demonstrated head-only checkout. It verifies the corrected PR content together with the declared base. The five hard-gate/tie-break theorem outputs report no axioms. The six linearized nuisance-quotient theorem outputs report [propext, Classical.choice, Quot.sound]; no sorryAx appears in those theorem-specific outputs. Tests, lint, leanchecker, nanoda and the global axiom audit were skipped. This is not a global no-axiom/no-sorry certification.

The formal result remains conditional. For a specified linearized additive-response model, the candidate coefficient is structurally identifiable exactly when its response direction lies outside the range of the standard-plus-admitted-nuisance response map. An invertible linear change of readout coordinates preserves that structural condition. Lean does not supply or authenticate the physical map, the nuisance basis, the measured data, the covariance, or a physical premise.

PR #1487 remains OPEN / DRAFT / UNMERGED and stacked on its existing measurement-domain base. No rebase, merge, retarget or theory promotion was performed.

## 3. New measurement-architecture improvement: separate common readout offset from material-by-readout interaction

Primary source: Stephan Schlamminger et al., “Redetermination of the gravitational constant with the BIPM torsion balance at NIST,” Metrologia 63 (2026) 025012, DOI [10.1088/1681-7575/ae570f](https://doi.org/10.1088/1681-7575/ae570f), [official NIST PDF](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075).

The measured system is the BIPM torsion balance operated at NIST. The paper reports data collected from 24 January through 22 June 2024. The four Table 16 estimates are ordered here as:

\[
y=(G_{\mathrm{Cu,servo}},G_{\mathrm{Cu,free}},
G_{\mathrm{Sa,servo}},G_{\mathrm{Sa,free}}).
\]

The point estimates are:

\[
y=10^{-11}
(6.673642,\ 6.674021,\ 6.672637,\ 6.673636)
\ \mathrm{m^3\,kg^{-1}\,s^{-2}}.
\]

For covariance propagation I used the Table 18 diagonal relative standard uncertainties, in ppm, and its published correlation coefficients:

\[
u_{\mathrm{rel}}=(23.2,\ 30.3,\ 37.5,\ 93.9)\times10^{-6},
\]

\[
R=\begin{pmatrix}
1&0.42&0.38&0.12\\
0.42&1&0.23&0.23\\
0.38&0.23&1&0.25\\
0.12&0.23&0.25&1
\end{pmatrix},
\qquad
\Sigma=\operatorname{diag}(y\odot u_{\mathrm{rel}})
R
\operatorname{diag}(y\odot u_{\mathrm{rel}}).
\]

The parent report already calculated the material-by-readout interaction:

\[
D=(G_{\mathrm{Sa,free}}-G_{\mathrm{Sa,servo}})
 -(G_{\mathrm{Cu,free}}-G_{\mathrm{Cu,servo}})
 =6.20\times10^{-15}
\ \mathrm{m^3\,kg^{-1}\,s^{-2}},
\]

\[
u(D)=6.118\times10^{-15},\qquad D/u(D)=1.013.
\]

The new calculation adds the common free-minus-servo readout contrast:

\[
M=\tfrac12[
(G_{\mathrm{Cu,free}}-G_{\mathrm{Cu,servo}})
+(G_{\mathrm{Sa,free}}-G_{\mathrm{Sa,servo}})
],
\]

\[
M=6.890\times10^{-15}
\ \mathrm{m^3\,kg^{-1}\,s^{-2}},
\qquad
u(M)=3.379\times10^{-15},
\qquad M/u(M)=2.039.
\]

The joint contrast covariance is:

\[
\operatorname{Cov}(M,D)=10^{-30}
\begin{pmatrix}
11.416&16.917\\
16.917&37.430
\end{pmatrix}
\left(\mathrm{m^3\,kg^{-1}\,s^{-2}}\right)^2,
\]

giving:

\[
\operatorname{Corr}(M,D)=0.8184.
\]

Relative to the arithmetic mean of the four reported point estimates, the contrasts are \(M=103.24\pm50.63\) ppm and \(D=92.90\pm91.68\) ppm. These are ratios to propagated combined standard uncertainties from rounded published summary values, **not p-values, posterior probabilities or preregistered significance tests**.

Reproducible calculation:

~~~python
import numpy as np

g = np.array([6.673642, 6.674021, 6.672637, 6.673636]) * 1e-11
u_rel = np.array([23.2, 30.3, 37.5, 93.9]) * 1e-6
R = np.array([
    [1.00, 0.42, 0.38, 0.12],
    [0.42, 1.00, 0.23, 0.23],
    [0.38, 0.23, 1.00, 0.25],
    [0.12, 0.23, 0.25, 1.00],
])
C = np.outer(g * u_rel, g * u_rel) * R
L = np.array([
    [-0.5, 0.5, -0.5, 0.5],  # common free-minus-servo effect
    [ 1.0,-1.0, -1.0, 1.0],  # sapphire-minus-copper interaction
])
contrast = L @ g
contrast_cov = L @ C @ L.T
contrast_u = np.sqrt(np.diag(contrast_cov))
contrast_corr = contrast_cov[0, 1] / np.prod(contrast_u)
print(contrast, contrast_u, contrast_corr)
~~~

### Interpretation and limitation

The two contrasts answer different questions:

- \(M\) measures the average free-minus-servo offset across the two source-mass campaigns.
- \(D\) measures whether that offset differs between sapphire and copper.

They are algebraically distinct estimands but statistically correlated. Treating them as two independent pieces of evidence would be incorrect. The covariance is part of the result, not optional decoration.

The paper itself reports that servo-mode estimates are below corresponding free-deflection estimates in both campaigns, and says the origin of the systematic offset remains unexplained. It introduces configuration-specific “dark uncertainty” in a Bayesian hierarchical model. The calculations above use the published Table 16 point estimates and Table 18 combined-standard-uncertainty correlations; they do **not** include a reconstructed joint posterior for those dark-uncertainty terms. No raw-data reanalysis was performed.

## 4. Added workflow gate: contrast-basis covariance completeness

The model-selection workflow should now distinguish two layers:

1. **Structural identifiability:** does the candidate response survive the quotient by the standard-model and admitted nuisance-response directions? PR #1487 formalizes this condition for a linearized additive model.
2. **Statistical detectability:** given the measured covariance, can the predeclared observable/contrast be distinguished at the chosen uncertainty-based threshold?

For a declared data vector \(y\), define the intended contrast matrix \(L\) before evaluating the result. Then calculate the complete covariance for those estimands:

\[
z=Ly,\qquad \operatorname{Cov}(z)=L\Sigma L^\mathsf{T}.
\]

The operational check is:

- name each estimand and its physical interpretation before reading the holdout;
- verify that the selected rows of \(L\) are linearly independent for the claimed estimands;
- propagate the full source covariance, including shared calibration/systematic contributions;
- report off-diagonal covariance/correlation between contrasts;
- distinguish common-mode effects from interactions;
- do not count correlated contrasts as independent evidence;
- freeze shared calibration parameters and the prediction before accessing the holdout;
- justify any falsification threshold from the real uncertainty model.

If the claim is that a model has no effect, absence of a resolved contrast is not by itself evidence of equivalence. A predeclared equivalence margin and adequate precision are separately required.

This is a measurement-analysis and model-selection workflow improvement, not a new physical model or a completed H(s)H test.

## 5. Scope, project state and next cursor

- No H(s)H geometry-to-NIST-observable map \(A\) or candidate response \(v\) has been specified. The Lean theorem is not instantiated physically.
- No H(s)H prediction, fit, holdout, falsification threshold, independent measurement or P2 system selection is claimed.
- P2 remains HOLD. P0 Code Grurple remains ACTIVE. P1 remains Orson-owned / NOT READY. P3 remains INCOMPLETE.
- No SAT-O or Blockwave source equation was changed. No thickness, twist, contact surface, force law or physical premise was promoted.
- No new tool, dependency, fork, subscription, paid endpoint, branch or PR was created.
- Mersearch was not run in this activation: the stable local checkout was absent, all four bridge lanes were occupied or unreleased, and no callable Mersearch action was exposed. The existing Lane 2 compact receipt belongs to a different request and was not repurposed. The h997:s2 Elias audit records three other lanes interrupted after runner shutdown, with cause unknown. Direct known-path source retrieval is partial fallback, not an exhaustive Mersearch search.
- HSH_RESOURCES private/internal payload was not accessed.
- The existing :36 task, its ID, hourly cadence, prompt and Lane Charter 36 phase remain unchanged. No sixth task.

**Next useful step:** keep PR #1487 draft/unmerged; if a real H(s)H response map is later source-grounded for a measured system, populate its standard-plus-nuisance operator and candidate response, then evaluate the predeclared contrast basis using the full measurement covariance and untouched holdout. Do not infer a physical effect from this NIST comparator.
