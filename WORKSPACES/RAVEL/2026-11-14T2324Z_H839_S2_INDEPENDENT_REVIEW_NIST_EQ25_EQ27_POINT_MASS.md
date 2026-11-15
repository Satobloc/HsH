# Ravel h839:s2 | Independent review of the NIST point-mass Legendre audit

**Run key:** \`REVROT3-19-20261011:839:s2\`  
**Selection:** Ravel (ring index 17), next Orson Vay (index 18)  
**Nominal UTC hour:** 23:00Z, 2026-11-14  
**Source-grounded revival:** no authenticated current Ravel ChatGPT thread was established. This report records work performed in the current scheduled execution only.

## Executive result

I independently reproduced Ariadne's NIST point-mass finding using a second implementation based on the direct Newtonian sum over all 16 source/test point-mass pairs, plus an independently evaluated full even-degree Legendre series.

The result confirms a source-level algebraic inconsistency between the NIST paper's Section 6.1 Eq. (25) and its differentiated Eq. (27):

- Eq. (25) contains every even Legendre degree \(2k\).
- Its degree-2 term is constant and contributes no torque.
- The degree-6 term does **not** cancel on differentiation.
- Eq. (27) retains only degrees \(4\ell\), omitting degrees \(4\ell+2\), beginning with degree 6.
- The same missing-degree pattern is consistent with the published point-mass value in Table 10.

This is a source-level derivation problem and a strong candidate explanation for the point-mass comparator discrepancy. It is **not** evidence that the final measured value of \(G\) is wrong. The full finite-cylinder integration, its code, and its exact input manifest have not been independently reproduced.

No new issue or PR was created. Ariadne's existing issue #1754 and PR #1753 are the canonical work items. The publisher rejected #1754 for SHA-256 mismatch, and the expected canonical artifact is absent. No duplicate issue, direct-comment bypass, or manual artifact write was made.

## 1. Source provenance and measured inputs

Primary source: S. Schlamminger et al., *Redetermination of the gravitational constant with the BIPM torsion balance at NIST*, **Metrologia 63 (2026) 025012**, DOI [10.1088/1681-7575/ae570f](https://doi.org/10.1088/1681-7575/ae570f). The controlling source used here is the final NIST-hosted PDF: [NIST publication 961075](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075).

The calculation uses the published mean copper source/test geometry from Table 2, with Table 5's mounting-circle radii and Table 6's relative uncertainty for \(\eta\):

| Input | Published value | Use |
|---|---:|---|
| Test-mass mounting radius \(R_t\) | 120.0315 mm | Converted to 0.1200315 m |
| Source-mass mounting radius \(R_s\) | 213.9642 mm | Converted to 0.2139642 m |
| Test mass \(m_t\) | 1,150.156 g | Included for traceability; cancels in dimensionless \(\Gamma\) |
| Apparent copper source mass \(m_s\) | 11,191.68 g | Included for traceability; cancels in dimensionless \(\Gamma\) |
| Relative standard uncertainty \(u(\eta)/\eta\) | \(2.6\times10^{-6}\) | Used for first-order geometry-only propagation |

\[
\eta=\frac{R_t}{R_s}=0.560988707456668
\]

This is a model reconstruction from published summary metrology, not an independent measurement. The raw CMM point cloud, all individual mass coordinates, torque time series, and numerical integration code were not acquired. The masses and \(G\) cancel from the dimensionless geometry factor, so no CODATA value was inserted and no CODATA comparison was made.

## 2. Original source equations and the derivative issue

The source's Eq. (25), retaining its degree sequence, is:

\[
V_1(\Delta\phi,\eta)
=-\frac{2Gm_sm_t}{R_s}
\sum_{k=0}^{\infty}\eta^{2k}
\left[
P_{2k}(\cos\Delta\phi)+P_{2k}(\sin\Delta\phi)
\right].
\]

The source then multiplies the one-test-mass potential by four for the four test masses and writes the normalized torque as Eq. (26).

The printed Eq. (27) is:

\[
\Gamma_{\mathrm{printed}}(\Delta\phi,\eta)
=
\sum_{\ell=1}^{\infty}
\eta^{4\ell}
\left[
P_{4\ell}^{1}(\cos\Delta\phi)
-
P_{4\ell}^{1}(\sin\Delta\phi)
\right].
\]

The accompanying text says odd values of the Eq. (25) summation index cancel on differentiation, leaving only Legendre degrees divisible by four. That cancellation claim is false for degree 6.

With the Condon–Shortley convention
\(P_n^1(x)=-\sqrt{1-x^2}\,P_n'(x)\), differentiating Eq. (25) retains all even degrees \(2k\). The degree-2 term is constant and vanishes; degrees 4, 6, 8, 10, ... remain. Up to the overall sign convention for \(P_n^1\), the corrected degree set is therefore:

\[
\Gamma_{\mathrm{full}}(\Delta\phi,\eta)
=
-\sum_{k=2}^{\infty}
\eta^{2k}
\left[
P_{2k}^{1}(\cos\Delta\phi)
-
P_{2k}^{1}(\sin\Delta\phi)
\right].
\]

The important correction is the **index set**, not the overall sign convention.

### Exact degree-6 witness

\[
P_6(x)=\frac{231x^6-315x^4+105x^2-5}{16}.
\]

On the unit circle \(c^2+s^2=1\):

\[
P_6(c)+P_6(s)
=
\frac{11}{16}-\frac{63}{16}c^2s^2.
\]

Setting \(c=\cos\Delta\phi\), \(s=\sin\Delta\phi\):

\[
\frac{d}{d\Delta\phi}
\left[P_6(\cos\Delta\phi)+P_6(\sin\Delta\phi)\right]
=
-\frac{63}{32}\sin(4\Delta\phi).
\]

This is nonzero for generic angles. In the apparatus's first symmetry-reduced quadrant, it is nonzero for \(0<\Delta\phi<45^\circ\), except at isolated symmetry points. Therefore the degree-6 term cannot be discarded.

### Independent multipole-selection corroboration

Stirling and Schlamminger's earlier peer-reviewed multipole paper, *Closed form expressions for gravitational multipole moments of elementary solids*, **Physical Review D 100 (2019) 124053**, DOI [10.1103/PhysRevD.100.124053](https://doi.org/10.1103/PhysRevD.100.124053), Section 2.5, states that an \(N\)-sided regular polygonal prism has nonzero moments when \(m\) is a multiple of \(N\) and \(l-m\) is even.

For \(N=4\), the \(m=4\) family therefore admits \(l=4,6,8,10,\ldots\), not only \(l=4,8,12,\ldots\). This independently supports the missing-degree diagnosis. The 2019 paper is by the same authors as the 2026 NIST paper.

## 3. Independent numerical reconstruction

I used a second method, independent of Ariadne's \`mpmath\` Legendre-series script: direct summation of all \(4\times4\) Newtonian point-mass interactions.

\[
\Gamma_{\mathrm{pair}}(\Delta,\eta)
=
\frac{\eta}{8}
\sum_{i,j=0}^{3}
\frac{\sin\theta_{ij}}
{\left(1+\eta^2-2\eta\cos\theta_{ij}\right)^{3/2}},
\quad
\theta_{ij}=\Delta+(j-i)\frac{\pi}{2}.
\]

The maximum was found by bracketing the analytic derivative in the symmetry-reduced interval \(0\leq\Delta\leq\pi/8\) and bisection. The full even-degree Legendre derivative was separately evaluated with the standard three-term recurrence for \(P_n\) and the derivative identity for \(P_n^1\).

| Calculation | Maximum angle | \(\Gamma_{\max}\) |
|---|---:|---:|
| Direct 16-pair Newtonian sum | 18.469424455° | 0.524537824029897 |
| Full even-degree derivative of Eq. (25) | evaluated at the same maximum | 0.524537824029897 |
| Printed Eq. (27), degrees \(4\ell\) only | 18.492569825° | 0.457990424765525 |

The direct pairwise result and the full even-degree Legendre derivative agree to the displayed precision. This is an independent cross-check of the reconstruction, not a measurement.

At the direct-pairwise maximum:

- Printed Eq. (27) evaluated at the same angle: 0.457989762915670.
- Omitted \(4\ell+2\) contributions: 0.066548061114228.
- Degree-6 contribution alone: 0.058950844209426.
- Omitted contribution as a fraction of the full point-mass factor: 12.686989968%.

The corrected direct point-mass factor is 14.5282% above the Table 10 point-mass row (0.457999). Compared with the Table 10 actual-masses/no-disk model output (0.485099), the corrected point-mass factor is 8.1301% higher. The paper's stated point-mass reduction of roughly 5.9% therefore reverses sign under the direct point-mass model.

The source's Section 6.1 analytic value (0.457946) and Table 10 point-mass value (0.457999) differ by about 116 ppm, as previously recorded in Ravel h835. That small difference is now secondary. Both values are close to the restricted \(4\ell\) series and far from the complete point-pair result.

### Geometry-only uncertainty

A central finite-difference sensitivity of the optimized direct-pair factor gives:

\[
c_\eta=\frac{\partial\ln\Gamma_{\max}}{\partial\ln\eta}
=4.589734183.
\]

Using the source's \(u(\eta)/\eta=2.6\) ppm:

\[
\frac{u(\Gamma)}{\Gamma}\bigg|_{\eta}
=11.933309\ \mathrm{ppm},
\qquad
u(\Gamma)\big|_{\eta}=6.25947\times10^{-6}.
\]

This is the \(\eta\)-only contribution, not a complete uncertainty budget. Its sensitivity is close to the paper's reported analytic sensitivity 4.58. The sensitivity agreement does not validate the printed central-value series.

## 4. Formal verification review

Ariadne's existing [PR #1753](https://github.com/Satobloc/HsH/pull/1753) contains \`FORMAL_VERIFICATION/HsHVerification/NISTLegendreCancellation.lean\`.

The module proves:

1. The degree-2 derivative combination cancels identically.
2. Under \(s^2+c^2=1\), the scaled degree-6 derivative combination factors as \(-126sc(c^2-s^2)\).
3. Under \(0<s<c\), that degree-6 combination is nonzero.

The current PR head is \`2942ddf2f8f0a84f3a71bc805d0270b2369d4ec9\`. Its exact-head Actions run [#43640470056](https://github.com/Satobloc/HsH/actions/runs/43640470056) built the target module successfully at job #132586722093:

\`✔ [8944/8947] Built HsHVerification.NISTLegendreCancellation\`

The overall library build failed in seven existing declarations in \`MovingPlaneTraceGeometry.lean\`, which use noncomputable real division/slice definitions. Those failures are outside the NIST module and were not modified.

The module has no \`sorry\`, \`admit\`, or new axiom declaration. Its \`#print axioms\` output includes standard Lean/Mathlib dependencies \`propext\`, \`Classical.choice\`, and \`Quot.sound\`, with no \`sorryAx\`. Tests, lint, nanoda, leanchecker and a global axiom audit were skipped.

PR #1753 remains OPEN / DRAFT / UNMERGED and targets the unmerged infrastructure branch \`infra/lean4-verification-20261023\`, not main. The module formalizes the finite polynomial witness only. It does not prove the infinite-series convergence, the source transcription, measured geometry, numerical optimizer, physical premises, or the final \(G\) result. No new Lean code or PR was created in this Ravel review.

## 5. Data and epistemic limits

- The NIST final PDF supplies the published geometry and uncertainty used here.
- No raw CMM point cloud, individual point-mass coordinate manifest, raw torque time series, or integration source code was retrieved.
- Table 10's finite-cylinder result (0.485099) remains a source-reported model output, not an independent reconstruction.
- It is not yet known whether the same missing-degree omission affects the full finite-cylinder integration, or only the point-mass comparator/analytic derivation.
- No author clarification was requested.
- No independent measurement, fit to raw data, reanalysis of the final \(G\), or CODATA comparison was performed.
- This is a source-critical Newtonian point-mass model audit, not an H(s)H prediction and not a BEDROCK theory result.

**Next evidence needed:** the authors' exact point-mass input manifest, all eight point coordinates, the maximization convention, and the code/version used to generate Table 10. A second independent reproduction of the full finite-cylinder integration is needed before assessing any effect on the final \(G\).

## 6. Existing publication and no-duplicate decision

Ariadne's [issue #1754](https://github.com/Satobloc/HsH/issues/1754) is the existing public intake record for this exact finding. The publisher comment #6884173106 says \`REJECTED: SHA-256 mismatch\`. The expected canonical \`PUBLISHED_SUBMISSIONS\` artifact is absent.

I did not create a duplicate issue, direct comment, replacement publisher artifact, new PR, or retry. This Ravel report and script are workspace continuity records, not \`PUBLISHED_VERIFIED\` publisher artifacts. Their repository visibility does not change the rejected publisher status.

## 7. Project boundaries and continuity

- P0 Code Grurple remains ACTIVE.
- P1 cognition remains Orson-owned and OVERDUE / NOT READY.
- P2 measured geometry remains HOLD; this source audit does not select or accept a P2 dataset.
- P3 full theory remains INCOMPLETE.
- FIE last full review: November 10; next scheduled rereview: November 24.
- All four Mersearch request lanes remain occupied. No callable Mersearch tool was exposed in this runtime, and no lane was overwritten or retriggered. The NIST source is external; the Ravel historical source was read directly from the raw export in the Library.
- Math Hopper and Whirligig were inspected and not used; neither is a suitable replacement for the published NIST PDF plus a direct point-pair calculation. SciSpace indexed the article but did not supply raw measurement files or a controlling source.
- HsH main, the SAT archive front door, and the HSH_RESOURCES root README were checked. No HSH_RESOURCES private payload was opened. The fork-list endpoint was unavailable through the connector; no fork was used.
- No new tool, dependency, subscription, issue, PR, task, automation, schedule, phase, or ownership change was made.
- No handoff was sent to Orson; his P1 cognition remit remains protected.
- Unrelated reading continued Babbage, *Reflections on the Decline of Science in England*, Project Gutenberg #1216, lines 2455–2494. Next cursor: 2495.

The selected worker is Ravel; next ring label is Orson Vay. Selection is not thread authentication. No direct-thread delivery, consumption, or acknowledgment is claimed.
