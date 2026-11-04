# NIST torsion-balance geometry: C4 selection, finite-support correction, and source-table audit

**Status:** public source/geometry audit addendum. Candidate measurement benchmark only. This is not an H(s)H prediction, P2 system selection, or theory promotion.

## 1. Primary source and provenance

S. Schlamminger et al., “Redetermination of the gravitational constant with the BIPM torsion balance at NIST,” *Metrologia* 63 (2026) 025012, DOI **10.1088/1681-7575/ae570f**. NIST-hosted final PDF, publication record **pub_id=961075**, published 16 April 2026. The paper reports consensus \(G=(6.67387\pm0.00038)\times10^{-11}\ \mathrm{m^3\,kg^{-1}\,s^{-2}}\), with relative uncertainty about 57 ppm.

The measurement campaign collected torque data from 24 January through 22 June 2024. The paper reports two readout methods (free deflection and electrostatic servo) and four configurations (copper/sapphire source masses crossed with the two methods). The four resulting G determinations are correlated, not four independent experiments; the paper supplies a correlation matrix and a configuration-specific Bayesian “dark uncertainty” model. Its consensus prior is centered on CODATA 2022.

CODATA provenance remains distinct: the 2022 adjustment is NIST version 9.0, with a 31 December 2022 data cutoff; G is treated separately from the main least-squares adjustment as a weighted mean of 16 measured values, including three correlated pairs and an uncertainty expansion factor of 3.9. The previous HsH report #1308 already records this adjustment, the NIST prior dependence, the cross-configuration covariance, and the NIST landing-page versus final-journal abstract discrepancy. This addendum does not repeat or revise that comparison.

No raw torque time-series or machine-readable CMM geometry files were retrieved. The calculations below use the paper’s published equations and tables only; they are not a raw-data reanalysis.

## 2. Identifiable measured geometry and readout

The copper configuration uses four source masses and four test masses in fourfold azimuthal arrangements. Published mean parameters include:

- source mass per unit: \(m_s=11.19168\ \mathrm{kg}\);
- test mass per unit: \(m_t=1.150156\ \mathrm{kg}\);
- source-mass mean-circle radius: \(R_s=213.9642\ \mathrm{mm}\);
- test-mass mean-circle radius: \(R_t=120.0315\ \mathrm{mm}\);
- copper peak-to-peak torque difference at the 0-degree orientation: \(31.1979\ \mathrm{nN\,m}\).

The CMM procedure used a Zeiss Xenos coordinate-measuring machine, tactile probing, fitted reference planes/cylinders, and a least-squares estimate from the four mass centers. The paper’s uncertainty budget reports \(u(R_s)/R_s=2.1\times10^{-6}\), \(u(\eta)/\eta=2.6\times10^{-6}\), and \(c_\eta(\Gamma_{\max})\simeq4.4\), giving an 11.3 ppm contribution from \(\eta\) to the geometry factor.

The two readout paths are physically distinct: free deflection uses pendulum motion and moment of inertia; electrostatic servo balances gravitational torque with calibrated electrical torque and a measured residual twist correction. The paper reports a persistent servo/free offset and leaves its origin unresolved, handling configuration-specific excess dispersion in the Bayesian combination. These are two channels on one apparatus, not independent acquisitions.

## 3. Fourfold symmetry and the leading torque harmonic

The paper’s point-mass expansion uses \(\eta=R_t/R_s\). Fourfold source-mass symmetry leaves only even Legendre degrees in the potential; after differentiating to obtain torque, only degrees divisible by four remain. The leading nonconstant angular term is therefore the fourth harmonic.

For the first nonconstant term:
\[
P_4(\cos\theta)+P_4(\sin\theta)
=\frac{9+35\cos(4\theta)}{32},
\]
so its torque contribution is proportional to \(\eta^4\sin(4\theta)\). At fixed \(R_t\), the leading far-field factor is
\[
\frac{\eta^4}{R_s}=\frac{R_t^4}{R_s^5},
\]
which explains the asymptotic \(R_s^{-5}\) hexadecapole scaling. This is a standard mass-geometry result, not an H(s)H or rope-mechanics equivalence.

The actual apparatus has \(\eta=R_t/R_s=0.5609887075\), so it is not in an extreme \(\eta\ll1\) limit. The paper’s full finite-geometry calculation gives a local logarithmic derivative
\[
\left.\frac{d\ln\Gamma_{\max}}{d\ln R_s}\right|_{R_t,\mathrm{shape}}=-4.41.
\]
Consequently, for \(N\propto R_s^{-1}\Gamma_{\max}\),
\[
\left.\frac{d\ln N}{d\ln R_s}\right|_{R_t,\mathrm{shape}}=-5.41.
\]
This is a local sensitivity at the nominal finite geometry, not a universal power law. It differs from the asymptotic exponent \(-5\).

## 4. Finite-support correction: point masses are inadequate

The paper’s Table 10 reports:
- full actual-mass-plus-disk effective geometry factor \(\Delta\Gamma/2=0.485641\);
- point-mass/no-disk approximation \(0.457999\);
- relative difference \(-56{,}919\) ppm.

The point-mass approximation is therefore about 5.6919% below the full finite-support result. The paper assigns 11 ppm to mass-integration uncertainty and reports a final relative G uncertainty of 57 ppm. Thus the point-mass discrepancy is about 5,174 times the assigned mass-integration uncertainty and about 999 times the final relative measurement uncertainty.

The full integration represents 307 shapes (8 test masses and 299 disk components); the disk contributes about 0.12% of \(\Gamma_{\max}\). The lesson for a future H(s)H observable map is narrow but important: a point/centerline collapse cannot be presumed adequate for this measurement precision. The map must preserve the finite 3D support and the relevant C4 geometry.

## 5. Two source-internal table conflicts

These are source-critical findings, not author-approved corrections. No erratum was located in the sources checked. The original entries must remain preserved.

### 5.1 Table 1: source-radius sensitivity sign

**Published Table 1 entry:** \(c_{R_s}(G_f)=-5.4\), \(c_{R_s}(G_s)=-5.4\).

The paper defines \(c_x(y)=\partial\ln y/\partial\ln x\) in Eq. (21), gives
\[
G=\frac{\Delta N\,R_s}{8m_sm_t(\Gamma_{\max}-\Gamma_{\min})}
\]
in Eq. (5), and gives
\[
\left.\frac{d\ln\Gamma_{\max}}{d\ln R_s}\right|_{R_t}=-4.41
\]
in Eq. (34). Holding the measured torque and other inputs fixed therefore gives
\[
c_{R_s}(G)=1-(-4.41)=+5.41.
\]
The paper’s later discussion also states \(c_G(R_s)\simeq+5.4\) when estimating the effect of a 500 nm change in \(R_s\). Table 1’s negative sign conflicts with both the equation chain and that later discussion. **Likely correction candidate:** Table 1 should read approximately \(+5.4,+5.4\), not \(-5.4,-5.4\). This is a sign correction to the table entry only; it does not establish an error in the reported G result.

### 5.2 Table 10: geometry-factor unit label

**Published Table 10 header:** \(\Gamma/( \mathrm{kg^2\,m^{-1}})\).

Section 6 explicitly calls \(\Gamma\) a dimensionless geometry factor, and Eq. (22) is
\[
N=G\,\frac{8m_sm_t}{R_s}\,\Gamma.
\]
Since \([G]=\mathrm{m^3\,kg^{-1}\,s^{-2}}\) and \([m_sm_t/R_s]=\mathrm{kg^2\,m^{-1}}\), the prefactor already has torque units \(\mathrm{kg\,m^2\,s^{-2}}\). Thus \(\Gamma\) must be dimensionless for Eq. (22) to be dimensionally consistent. The same \(\Gamma\) is used in the G-recovery equation and Table 15. **Likely correction candidate:** Table 10’s unit label should be “dimensionless” (or omitted), not \(\mathrm{kg^2\,m^{-1}}\). The numerical relative difference is unit-independent. No equation or numerical value is changed by this proposed editorial correction.

## 6. H(s)H mapping contract and epistemic boundary

The standard laboratory map is explicit:
\[
(\rho_s,\rho_t,\text{finite CMM geometry})
\longrightarrow \Gamma(\Delta\phi)
\longrightarrow N(\Delta\phi)
\longrightarrow (O_{\mathrm{free}},O_{\mathrm{servo}}).
\]
The source/test mass supports are finite 3D density distributions; the torque is a geometric interaction integral; the two readout maps have different instrument response and calibration.

For an H(s)H comparison, the missing map is not supplied by a shared “4D” label. It would require an explicit projection/composition chain from the source-defined worldtube/timesheet state to the laboratory mass-density supports, then to the interaction/torque functional, then to each calibrated instrument readout. It must preserve the C4 action, finite-support geometry, units, shared parameters, nuisance parameters, covariance, and calibration/holdout boundaries. The existing HsH map contract is issue #1341. The P2 docket remains issue #565: HOLD / no final system selected. This NIST apparatus is recorded as an external geometry/measurement comparator only; it is not inserted as a P2 selection.

No H(s)H prediction, fit, physical equivalence, rope-universality claim, or theory promotion follows.

## 7. Lean status

The existing Ravel geometry chain in draft PR #1133 was rechecked. The current PR head is ca0a57e55caef5df3cd291957c158384fd15d0c1; the branch remains open/draft/unmerged and its base is stale relative to current main. Associated Actions run #41836778560 completed successfully: the Lean 4 verification job built 8,950 targets. The modules include the carrier/sheet dimension gate, carrier-slice reconstruction, fiber-transport non-uniqueness, and coupling dimensional audit. Selected theorem-specific #print axioms outputs showed standard dependencies; the separate test, lint, nanoda, and automated axiom-audit steps were skipped. The overall combined status also contained a Vercel deployment failure, distinct from the successful Lean job.

The existing Mira/CODATA covariance module in PR #1306 also has a successful Lean 4 build (run #41636346096, 8,945 targets); it is a separate worker’s branch and was not modified.

The new C4 identity and \(c_{R_s}(G)\) chain above were algebraically checked but **not yet formalized or compiled in Lean**. No new branch or PR was created: no local Lean/Lake/Elan or Mathlib runtime was installed, and the existing PR scopes/Code Grurple interlock were preserved. A future Lean module should separately prove the \(P_4\) identity, its derivative, and the conditional logarithmic-sensitivity chain. Such a proof would check only the formalized algebra, not the physical premises or H(s)H translation.

## 8. Epistemic status

- **Measured/published:** NIST torque differences, CMM geometry, mass parameters, two instrument methods, four correlated configuration estimates.
- **Calibrated/evaluated:** CMM radii, servo/free readout calibrations, mass-integration geometry, uncertainty/covariance and Bayesian consensus.
- **Derived here from published tables/equations:** \(\eta\), the point-mass relative discrepancy and its uncertainty ratios, the local sensitivity sign chain, and the dimensional audit of \(\Gamma\).
- **Proposed:** H(s)H projection/composition map and future Lean theorem.
- **Not established:** raw-data reanalysis, independent CODATA replication, H(s)H forward prediction, reverse identification, physical equivalence, P2 selection, or theory validation.

## Primary-source locator

NIST publication record pub_id=961075; *Metrologia* 63 (2026) 025012; DOI 10.1088/1681-7575/ae570f. Key locations: Eq. (5), Eq. (21), Table 1, Eqs. (22), (25), (27), (34), Tables 5, 6, 7, 10, 15, 16, and 18. Internal cross-references: HsH issues #1308, #1341, and #565; Ravel PR #1133; CODATA formalization PR #1306.
