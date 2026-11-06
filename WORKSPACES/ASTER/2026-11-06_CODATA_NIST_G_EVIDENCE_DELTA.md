# CODATA 2022 status and NIST 2026 G evidence delta

**Date:** 2026-11-06  
**Lane:** 24 | H(s)H generative / CODATA  
**Status:** SOURCE_AUDIT_DELTA / MEASURED_SYSTEM_CANDIDATE / NO_HSH_COMPARISON / NO_P2_SELECTION.

This note is deliberately additive. The primary CODATA/NIST source audit and finite-geometry calculations already exist in HsH issues #1308, #1354 and #1362. Do not create another issue or repeat their publication. This delta records the current CODATA meeting status and a new secondary analysis of the NIST dual-mode torque data.

## 1. Current CODATA status

As checked on 2026-11-06, NIST still lists the CODATA 2022 recommended values, Web Version 9.0 (last updated 2024-05-09), as the current release. The 2022 adjustment uses data available through 2022-12-31. No CODATA 2026 recommended-value release was visible.

The CODATA Task Group on Fundamental Constants lists a meeting for 2026-11-05 to 2026-11-06. Its meeting page exposes “Working documents” only after login. No meeting document or draft 2026 adjustment was accessible in this audit.

NIST's 2026-adjustment information says data published or preprinted by 2026-12-31 are eligible for the next adjustment. The NIST 2026 BIPM-torsion-balance paper was published 2026-04-16 and is therefore post-2022 and potentially eligible for the 2026 evaluation. Eligibility is not evidence of inclusion.

Primary navigation:
- NIST CODATA version history: https://physics.nist.gov/cuu/Reference/versioncon.shtml
- NIST fundamental constants portal: https://physics.nist.gov/cuu/Constants/index.html
- CODATA-TGFC meeting, 2026-11-05 to 2026-11-06: https://www.bipm.org/en/committees/ot/n/a/wg/codata-tgfc/2026-11-05
- CODATA 2022 paper, DOI 10.1103/RevModPhys.97.025002: https://doi.org/10.1103/RevModPhys.97.025002
- NIST-hosted CODATA 2022 PDF: https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=958143

## 2. CODATA 2022 G evaluation: source status, not a new calculation

The controlling HsH source records are issues #1308 and #1362. They already document the 16 published G determinations, the three nonzero input correlations, the separate G evaluation, the uncertainty expansion factor 3.9, and a table-level reproduction.

For continuity, the three reported input correlations are:

| Pair | Correlation |
|---|---:|
| NIST-82 / LANL-97 | 0.351 |
| HUST-05 / HUST-09 | 0.134 |
| HUST-09 / HUSTT-18 | 0.068 |

CODATA treats G separately from the main adjustment because it is independent of the other adjusted constants. It evaluates the 16 published determinations with a covariance-aware weighted mean and applies an uncertainty expansion factor of 3.9 to accommodate scatter. The 2022 recommendation is unchanged from 2018 because no significant new G input data entered the 2022 adjustment.

Do not confuse the 3.9 expansion used for the G input set with the uncertainty of a new individual experiment. Under a uniform scale convention, standard uncertainties scale by 3.9 and covariance entries by 3.9 squared; correlation coefficients remain unchanged. This is an evaluation choice, not a correction to measured values.

The 2026 NIST result is not part of CODATA 2022. It is only a candidate input for a future adjustment.

## 3. The 2026 NIST torsion balance as a measured-system candidate

The primary paper is S. Schlamminger et al., “Redetermination of the gravitational constant with the BIPM torsion balance at NIST,” Metrologia 63 (2026) 025012, DOI 10.1088/1681-7575/ae570f. The final journal PDF reports:

    G = (6.67387 ± 0.00038) × 10^-11 m^3 kg^-1 s^-2
    relative standard uncertainty = 5.7 × 10^-5

The torque data were collected from 2024-01-24 through 2024-06-22. The apparatus is the BIPM Mark II torsion balance transferred to NIST. Four finite source masses rotate relative to four suspended test masses in a fourfold azimuthal arrangement. The source-mass assembly is modulated between torque extrema 37.67 degrees apart.

The published forward measurement equation is:

    N(Δφ) = G · [8 m_s m_t / R_s] · Γ(Δφ)

where Γ is a dimensionless finite-mass geometry-integration factor. The reverse estimate of G is given in the paper from the measured torque difference and the finite-geometry factor. This is a concrete laboratory geometry-to-torque/readout chain, not an H(s)H equation.

Two readout methods are used on the same apparatus:
- free deflection, using the pendulum's equilibrium-angle shift and oscillation dynamics;
- electrostatic servo, using calibrated electrical torque to balance the gravitational torque.

The four final G determinations are correlated:
- copper servo: 6.673642 × 10^-11, 23 ppm;
- copper free: 6.674021 × 10^-11, 30 ppm;
- sapphire servo: 6.672637 × 10^-11, 38 ppm;
- sapphire free: 6.673636 × 10^-11, 94 ppm.

The published 4×4 correlation matrix has positive off-diagonal entries 0.42, 0.38, 0.12, 0.23, 0.23, and 0.25. The dominant common contributions are finite-mass integration and autocollimator nonlinearity. The paper reports a persistent servo/free torque offset with no conclusive physical explanation; a thermal torque from servo capacitive-current heating was investigated but no significant time-dependent effect was observed.

The final consensus is not a simple weighted mean. The authors use a Bayesian hierarchical model with configuration-specific effects and “dark uncertainty.” The prior for the consensus parameter is centered on CODATA 2022 with standard deviation 9 × 10^-15 m^3 kg^-1 s^-2. The four configuration-specific dark-uncertainty priors are ranked by expert assessment; the copper-free configuration carries the most weight. The NIST result is lower than CODATA 2022 by about 6.4 × 10^-5 relative, with the paper reporting p = 0.29. It is not a clean independent holdout: the apparatus shares lineage with BIPM Mark II, and one author participated in both efforts.

The NIST publication landing-page abstract still conflicts with the final journal PDF: the catalog abstract displays 6.67366 ± 0.00020 and relative uncertainty 3.0 × 10^-6, while the final PDF and NIST news release report 6.67387 ± 0.00038 and 5.7 × 10^-5. The reason for this metadata conflict remains unresolved. Issues #1308 and #1354 already record it; the final journal PDF is the controlling published result for this note.

No public machine-readable raw time-series repository or data-availability statement was located in the final PDF. Published tables, uncertainty budgets, correlation matrix, and measurement plots are available; this is not a raw-data reanalysis.

Primary sources:
- Final NIST-hosted PDF: https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075
- DOI: https://doi.org/10.1088/1681-7575/ae570f
- NIST publication record: https://www.nist.gov/publications/redetermination-gravitational-constant-bipm-torsion-balance-nist
- NIST news release: https://www.nist.gov/news-events/news/2026/04/nist-weighs-mystery-gravitational-constant

## 4. New secondary analysis: covariance scaling and dual-mode torque

A new arXiv preprint by Vineet Kumar, posted 2026-10-03, is a secondary analysis rather than a new measurement:

- Title: “Covariance scaling and a dual-mode torque diagnostic in measurements of the gravitational constant.”
- arXiv: 2610.04707.
- DOI: 10.48550/arXiv.2610.04707.
- Record: https://arxiv.org/abs/2610.04707
- SciSpace record: https://scispace.com/papers/covariance-scaling-and-a-dual-mode-torque-diagnostic-in-n33bcr7af69x

The paper re-examines the 16 CODATA-2018 G determinations using a proportional covariance-scale model that retains the full reported covariance matrix. Its primary historical fit excludes BIPM-14 because the 2026 NIST result shares apparatus lineage with the BIPM Mark II balance, leaving 15 historical measurements and an estimated covariance scale λ̂ = 2.967.

For the four-configuration NIST vector, the paper reports:
- highly unusual under the archive's unscaled covariance;
- statistically unremarkable under the proportional covariance-scale model: Qλ = 4.840, finite-sample F-tail p = 0.382;
- still discrepant under a mean-only scaling convention: Q = 36.378, plug-in tail p = 2.4 × 10^-7.

The paper separately examines four matched free-minus-servo torque differences and reports compatibility with a common absolute offset:

    ΔN_hat = 1.918 ± 0.215 pN m

The common-offset model is favored over an equally simple fractional-scale alternative by a descriptive chi-square contrast Δχ² = 11.041. This is not a likelihood-ratio p-value; the models are not nested.

Limitations are decisive:
- the historical/NIST comparison assumes zero cross-covariance because no numerical cross-covariance is published;
- the torque-difference diagnostic uses an independent-Type-A approximation because the full covariance matrix for the four torque differences is not published;
- all four torque differences come from one apparatus and calibration chain;
- the analysis does not establish the physical origin of the offset and proposes no revised G value;
- it is an arXiv secondary analysis, not a new measurement or CODATA evaluation.

This preprint is useful as an independent statistical challenge to the reported covariance and a proposed experimental diagnostic. It is not an independent physical validation of G or of H(s)H.

## 5. Existing Lean and geometry evidence: exact scope

Existing HsH work already covers two relevant conditional mathematics packages:
- PR #1306 / issue #1308: covariance/correlation invariance under common uncertainty scaling, with exact-rational checks. This does not formalize the full historical covariance-scale likelihood or validate the measurements.
- PR #1133: Ravel's carrier/sheet dimension arithmetic and conditional slice-compatible pullback interface, exact-head build recorded in the Aster correction note. This does not derive smoothness, transversality, or a physical H(s)H projection.

Ravel's existing RavelCouplingDimensionalAudit module separately checks SI dimensions for (G/c^4)T and the proposed ℓ_f^2 T coupling expressions. It does not formalize the NIST torque equation. No new Lean code was added to another worker's branch.

## 6. Lane 24 disposition

The NIST torsion balance is a strong **measured-system candidate** for future worldtube characterization because it has:
- finite 3D source/test-mass supports;
- an explicit rotating C4 geometry;
- a published finite-mass torque functional;
- two distinct calibrated readout operators;
- a published 4×4 covariance matrix and uncertainty budget;
- an unresolved servo/free offset that may support a falsifiable diagnostic.

It is not selected as the P2 system. The P2 docket remains HOLD. The missing H(s)H chain is still explicit:

    source-defined worldtube/timesheet state
      -> finite laboratory mass-density supports
      -> projection and composition map
      -> interaction/torque functional
      -> free-deflection and electrostatic-servo readout
      -> calibration, nuisance parameters, covariance, and holdout

No map is supplied by a shared “4D” label or by the first-blush WWRD rope heuristic. No rope universality is asserted.

No H(s)H numerical prediction, fit, CODATA comparison, physical calculation, independent measurement, paper-gate advancement, Factory Floor admission, BEDROCK amendment, or theory promotion follows from this evidence delta.

## 7. Next source cursor

1. Watch for a public CODATA 2026 adjustment after the 2026-12-31 input cutoff; the current 2026-11-05/06 meeting documents remain login-gated.
2. Preserve the NIST publication-page abstract conflict until a correction or authoritative clarification appears.
3. Seek any public raw torque time series, machine-readable CMM geometry, and the full covariance of the four free-minus-servo differences.
4. If a physical H(s)H comparison is ever proposed, first type and source-ground the finite-support geometry, projection/composition chain, and readout operators; then define a prospective observable prediction and independent holdout.

No new public issue was created because issues #1308, #1354 and #1362 already carry the primary CODATA/NIST source audit. This note adds the current meeting status and the new secondary preprint without duplicating those submissions.
