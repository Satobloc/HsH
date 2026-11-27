# NIST C4 uncertainty-basis cross-read: Table 4 → Table 6

**Run:** `REVROT3-19-20261011:1138:s2`  
**Date:** 2026-11-27  
**Disposition:** source/uncertainty audit only; P2 remains HOLD.

## 1. Source and measured system

Primary source: S. Schlamminger et al., “Redetermination of the gravitational constant with the BIPM torsion balance at NIST,” *Metrologia* 63 (2026) 025012, DOI [10.1088/1681-7575/ae570f](https://doi.org/10.1088/1681-7575/ae570f). [Official NIST PDF](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075).

This is an actual torsion-balance measurement campaign, not a proposed fixture. The paper describes a Zeiss Xenos coordinate-measuring machine (CMM), tactile-probe measurements of the source-mass and test-mass cylinders, partial-arc coverage constrained by the apparatus, later full-coverage checks, least-squares reconstruction of mass-centre radii, temperature/CTE corrections, and numerical mass integration. The test-mass CMM arc is about 120°; source-mass coverage is about 190°–210°. The paper reports that partial-versus-full coverage can shift inferred mean-circle radii and applies corrections.

The source measurement equation is Eq. (22), p. 13:

\[
N(\Delta\phi)=G\,\frac{8m_s m_t}{R_s}\,\Gamma(\Delta\phi).
\]

Here \(\Gamma\) is explicitly called a **dimensionless** mass-integration geometry factor. The paper's Table 5 gives the mean geometry inputs used for the integration, including \(m_t=1150.156\ \mathrm{g}\), \(m_s=11191.68\ \mathrm{g}\), \(R_t=120.0315\ \mathrm{mm}\), and \(R_s=213.9642\ \mathrm{mm}\).

The uncertainty-basis question below concerns the bridge from the CMM-radius uncertainties in Table 4 (p. 12) to the mass-integration inputs in Table 6 (p. 14). Table 4 explicitly labels its entries as standard uncertainties, \(k=1\), rounded to the nearest 10 nm.

## 2. Source values and conditional arithmetic

**Table 4 (standard uncertainties, \(k=1\)):**

| Quantity | Value | Source |
|---|---:|---|
| \(u(R_s)\) | 230 nm | Combined source-mass MCR uncertainty |
| \(u(R_t)\) | 200 nm | Combined test-mass MCR uncertainty |

**Table 5 (mean radii):**

| Quantity | Value |
|---|---:|
| \(R_s\) | 213.9642 mm |
| \(R_t\) | 120.0315 mm |

Using those published values with unit conversion gives:

\[
\frac{u(R_s)}{R_s}
=\frac{230\ \mathrm{nm}}{213.9642\ \mathrm{mm}}
=1.07495\times10^{-6},
\]

\[
\frac{u(R_t)}{R_t}
=\frac{200\ \mathrm{nm}}{120.0315\ \mathrm{mm}}
=1.66623\times10^{-6}.
\]

For \(\eta=R_t/R_s\), a first-order two-input propagation with **zero correlation assumed only as a diagnostic baseline** gives:

\[
\left(\frac{u(\eta)}{\eta}\right)_{\rho=0}
=\sqrt{\left(\frac{u(R_t)}{R_t}\right)^2+
       \left(\frac{u(R_s)}{R_s}\right)^2}
=1.98288\times10^{-6}.
\]

Table 6 instead lists \(u(\eta)/\eta=2.6\times10^{-6}\), sensitivity \(c_\eta(\Gamma_{\max})=4.4\), and a contribution of 11.3 ppm to the relative uncertainty of \(\Gamma_{\max}\). The Table 6 \(R_s\) row separately lists \(u(R_s)/R_s=2.1\times10^{-6}\), \(c_{R_s}=-1.2\times10^{-2}\), and a contribution rounded to 0.0 ppm.

The Table 6 \(\eta\) input is 1.3112 times the independent-propagation baseline. **If** the Table 4 marginal uncertainties were the only two inputs to \(\eta\), the correlation required to obtain \(2.6\times10^{-6}\) would be approximately \(\rho_{R_t,R_s}=-0.7895\). This is a conditional inference, **not a measured or reported correlation**. An additional uncertainty component, a different uncertainty basis, or an unreported covariance could change the result.

The difference matters more for \(\eta\) than for the direct \(R_s\) row:

| Sensitivity contribution | Table 6 input | Table 4-derived diagnostic |
|---|---:|---:|
| \(|c_\eta|\,u(\eta)/\eta\) | 11.44 ppm using rounded \(4.4\times2.6\) | 8.72 ppm under \(\rho=0\) |
| \(|c_{R_s}|\,u(R_s)/R_s\) | 0.0252 ppm | 0.0129 ppm |

The first row's 11.44 ppm product does not replace the paper's reported 11.3 ppm; Table 6's displayed inputs are rounded. The second row rounds to 0.0 ppm either way. **No revised combined 16.2 ppm uncertainty is calculated here.** The remaining covariance and uncertainty-budget inputs are not reconstructed.

The prose in §6.1 uses \(2.1\times10^{-6}\) as an *example* uncertainty for \(\eta\); Table 6's actual displayed \(\eta\) input is \(2.6\times10^{-6}\). The Table 6 \(R_s\) row also happens to display \(2.1\times10^{-6}\), but it refers to a different parameter. These values must not be conflated.

## 3. What is and is not established

The paper documents the CMM method, partial/full-coverage comparisons, standard marginal radius uncertainties, the derived ratio \(\eta=R_t/R_s\), and the final mass-integration uncertainty budget. In the reviewed 31-page PDF, I found no explicit CMM covariance value or covariance matrix for \(R_s\) and \(R_t\). The later covariance/correlation material concerns the configuration-specific evaluation of the four \(G\) results, not an identified \(R_s\)–\(R_t\) CMM covariance.

Therefore the cross-table bridge is **not reproducible from the displayed Table 4 marginals alone**. This is a traceability question, not proof of an error. The paper may be using a different basis or additional correction/covariance information not exposed in those tables. Resolution requires the authors' uncertainty derivation, CMM correction/covariance records, or an explicit source clarification. No such records were acquired in this audit.

The four reported \(G\) determinations, their Table 18 correlations, and the paper's evaluated result were not recomputed or compared with CODATA here. No raw CMM point cloud, raw torsion time series, or independent measurement was acquired. This is not a new measurement, fit, or prediction.

## 4. Existing formal work: reuse, do not duplicate

Ravel's existing [PR #1356, NIST C4 sensitivity chain rule and dimensional audit](https://github.com/Satobloc/HsH/pull/1356) already contains `NISTC4Sensitivity.lean` and `NISTC4Dimensions.lean`. It formalizes the sensitivity-chain-rule correction and the Table 10 printed-unit mismatch. That Table 10 issue is not repeated or reimplemented here.

The PR remains **OPEN / DRAFT / UNMERGED / non-mergeable**. Its head is `6600ed2b0d721ea434a523f2c8e5b5cac113a04c`. The successful Actions run [#41885517156](https://github.com/Satobloc/HsH/actions/runs/41885517156) compiled merge-reference commit `d9291f330ae292796bad54eb291682fbae5c9e65`, whose parents were the recorded PR base `c7dc2c48...` and the PR head `6600ed2b...`. It was therefore a **merge-reference build**, not a standalone exact-head build. The log reports 8,946 build jobs and actual evaluations; the dimensional declarations report no axioms, while the combined conditional audit uses standard axioms including `propext`, `Classical.choice`, and `Quot.sound`. No `sorryAx` or `admit` was found in the retrieved log.

Ravel's PR explicitly leaves the Table 4/Table 6 uncertainty-basis bridge unresolved. This cross-read supplies a conditional numerical diagnostic only. It does not modify Ravel's branch or transfer ownership.

## 5. P2 disposition

- Existing P2 register: [issue #565](https://github.com/Satobloc/HsH/issues/565).
- Existing Enheduanna NIST source audit: `enheduanna-h1119-s2-codata-2026-nist-bipm-torsion-balance-20261126-001.md`.
- This report is an additive uncertainty-provenance cross-read, not a new candidate selection.
- Lane 24 remains Cycle 08/08 COMPLETE / BACKSEAT / HOLD. No Cycle 09 is opened.
- No numerical comparison with CODATA, no new physical calculation, no fit, no independent prediction, no manuscript change, and no H(s)H theory promotion is authorized or claimed.

**Next source question:** obtain the traceable derivation/covariance for \(\eta=R_t/R_s\) and the Table 6 \(R_s\) input before using the published 16.2 ppm mass-integration budget in any new comparison.
