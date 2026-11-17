# Hale h898:s2 | CODATA–NIST covariance-scaling preprint audit

**Run key:** `REVROT3-19-20261011:898:s2`  
**Selection:** \(h=898\), \(5h+2=4492\), \(4492\bmod19=8\): **Hale** (index 8).  
**Next ring label:** **Elias Kern** (index 9).

This is a source-grounded Hale revival, not an authenticated continuation of a historical Hale ChatGPT thread. The historical remit is supported by the 2026-09-12 worker-authored check-in and Sable's REV-006 re-entry packet: external literature scanning, code-first statistical analysis, matched-period comparisons, negative controls, calibration controls, and source-exposure separation. There is no standalone signed Nathan-authored Hale specialist charter. The candidate `Workshop Relay :00 | Hale` thread remains insufficiently authenticated; latest verified Hale activity before this run was h879:s2 on 2026-11-16. No new thread was created.

## Executive finding

Vineet Kumar's arXiv preprint [2610.04707](https://arxiv.org/abs/2610.04707), submitted 2026-10-03, analyzes covariance scaling in the CODATA G archive and a later four-configuration NIST torsion-balance result. Its public [reproducibility repository](https://github.com/vineetsci/g-metrology/tree/132c8c5c58654fbb062d555e4bce64c2126f8f6b) contains source-pinned CODATA/NIST summary data, a SHA-256 manifest, analysis code, machine-readable results, tests, and claim-to-code traceability.

An independent Python/NumPy/SciPy calculation from the source-pinned published summary values reproduces the preprint's principal GLS, predictive-covariance, and torque-offset results to reported rounding. It also reproduces the separate CODATA 2022 G weighted-mean result when the official 3.9 uncertainty expansion is applied.

The headline “NIST is not statistically unusual” is **conditional**, not a new consensus value: the preprint's \(p=0.382\) result depends on applying the historical covariance scale to both the NIST covariance and historical-mean uncertainty. Its mean-only scaling sensitivity remains discrepant. The authors call uniform scaling of the NIST covariance a modelling convention, not an independently measured property of the NIST experiment.

This is a reproducibility and claim-ceiling audit of published summary data. It is not an H(s)H prediction, a new physical calculation, an independent replication, or a P2 system admission.

## 1. Source and version authority

HsH main at preflight: `0f4b1fe36db1e81ed4f2d38a192f5a56c0c49e8c` (2026-11-17 10:08:51Z). Live BEDROCK, 2026-10-26 Steering Charter, Three Paper Campaign, Lane 24 capsule, onboarding/revival instructions, current task graph, recent receipts, and Hale continuity/inbox were checked. HsH, SAT archive, and HSH_RESOURCES front doors were reviewed; no private HSH_RESOURCES research payload was opened.

### CODATA 2022

Controlling source: Mohr, Newell, Taylor and Tiesinga, *CODATA recommended values of the fundamental physical constants: 2022*, J. Phys. Chem. Ref. Data 54, 033105 (2025), DOI `10.1063/5.0279860`, published 2025-09-16.

The adjustment cutoff is 2022-12-31. The G section states that the 16 G determinations and three correlations are unchanged from the 2018 closing dataset; G is independent of the other adjusted constants and is evaluated separately as a covariance-weighted mean. CODATA retains expansion factor 3.9, reports \(\chi^2=12.9\) on 15 df, upper-tail \(p=0.61\), Birge ratio 0.93, and recommends:

\[
G_{2022}=6.67430(15)\times10^{-11}\ {\rm m^3\,kg^{-1}\,s^{-2}}.
\]

The 3.9 factor is a CODATA evaluation choice selected to reduce every normalized residual to 2 or less; it is not a fitted universal variance parameter. The 2026 NIST result postdates this cutoff and is not an input to CODATA 2022. The next adjustment's stated data cutoff is 2026-12-31.

### NIST 2026

Controlling source: Schlamminger et al., *Redetermination of the gravitational constant with the BIPM torsion balance at NIST*, Metrologia 63 (2026) 025012, DOI `10.1088/1681-7575/ae570f`, [final PDF](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075). The final PDF controls over the NIST landing-page abstract, which still displays an earlier value.

The finite source/test-mass torsion balance moves its source-mass assembly between torque extrema separated by 37.67°. A numerical finite-mass integration factor maps measured torque difference, source radius, and masses to \(G\). Free-deflection mode records six pendulum periods at each source-mass position; the autocollimator samples every 40 ms and a TTL signal gates a GPS-disciplined 20 MHz clock. Electrostatic-servo and free-deflection modes are both used.

The reported data were acquired 2024-01-24 through 2024-06-22. Table 15 gives four matched free/servo torque pairs (three copper orientations and one sapphire configuration), with Type A uncertainties only, \(k=1\). Table 16 gives four configuration-level G values. Table 18 gives the 4×4 correlation matrix for those four G values, **not** a covariance matrix for the four Table 15 torque differences.

The final NIST consensus, \(6.67387\pm0.00038\times10^{-11}\) (\(k=1\)), comes from a Bayesian hierarchical model with configuration-specific dark uncertainties and a Gaussian prior centered on CODATA 2022, \(6.6743\times10^{-11}\). It is therefore not an independent holdout against CODATA 2022. The preprint instead uses the four Table 16 values and Table 18 covariance. The NIST paper says its blind multiplicative offset was unsealed at CPEM 2024; the published 2026 vector is not a still-blinded prospective holdout.

## 2. Reproducibility package

Pinned repository: `vineetsci/g-metrology`, commit `132c8c5c58654fbb062d555e4bce64c2126f8f6b` (2026-10-10 13:22:45 +05:30).

- `data/MANIFEST.json` blob `4e157b181469732fd2247abbbd06b3374ae53132`.
- `data/codata_2018_g.yaml` blob `4e6b8935cfaf735a883ea6eb70d514cdec957bdb`; manifest SHA-256 `f7769f47dd4db10ba25f9663e921e9f48035ff753e47ad2a277976dad33ef662` (5,093 bytes).
- `data/nist2026_configurations.yaml` blob `63d745844db0970dcaf571f29e690884191db7cf`; manifest SHA-256 `8d1255f63ec2fc080dbb40f28b30411881695d84c893dd89f56ee612482bbf30` (4,598 bytes).

The package includes analyses, machine-readable results, tests, data provenance, and a claim ledger. Its NIST torque analysis loads Table 15 values through the YAML-backed data layer. The manifest declares byte counts and hashes. The repository's GitHub Actions API returned zero workflow runs; the presence of tests is not evidence of a CI test run.

The package's full `--core` command and test suite were not executed here. Instead, a separate Python calculation from the source-pinned summary values and covariance entries was compared with the package's machine-readable outputs. This was not a byte-level re-hash of the YAML files.

## 3. Independent numerical reproduction

For the CODATA inputs, the covariance was assembled as \(S_{ii}=u_i^2\), \(S_{ij}=r_{ij}u_i u_j\), using the three published correlations: NIST-82/LANL-97 = 0.351; HUST-05/HUST-09 = 0.134; HUST-09/HUSTT-18 = 0.068. The GLS estimator was

\[
\hat\mu=\frac{\mathbf1^TS^{-1}y}{\mathbf1^TS^{-1}\mathbf1},\quad
u^2(\hat\mu)=\frac1{\mathbf1^TS^{-1}\mathbf1},\quad
Q=(y-\hat\mu\mathbf1)^TS^{-1}(y-\hat\mu\mathbf1).
\]

### 3.1 CODATA 2022 G weighted mean

After applying \(k=3.9\) to standard uncertainties (and \(k^2\) to covariance):

| Quantity | Independent result |
|---|---:|
| Weighted mean, units \(10^{-11}\) SI | 6.6743003956 |
| Standard uncertainty, same units | 0.0001477760 |
| Relative standard uncertainty | 22.14 ppm |
| Expanded-covariance \(\chi^2\) | 12.865 |
| Upper tail, 15 df | 0.613 |
| Birge ratio | 0.926 |

This reproduces CODATA's rounded `6.67430(15)`, 12.9, 0.61, and 0.93. It reconstructs the separate G weighted-mean evaluation, not the full 79-constant/133-input CODATA adjustment.

### 3.2 Historical proportional covariance scale

| Historical set | N | Q | MLE \(\sqrt{Q/N}\) | Birge \(\sqrt{Q/(N-1)}\) |
|---|---:|---:|---:|---:|
| Complete CODATA-2018 archive | 16 | 195.679 | 3.497 | 3.612 |
| Excluding BIPM-14 | 15 | 132.088 | 2.967 | 3.072 |

The MLE scale, Birge ratio, and CODATA's 3.9 policy expansion are distinct quantities.

### 3.3 NIST four-configuration predictive comparison

The NIST vector (units \(10^{-11}\) SI) and relative standard uncertainties are: copper-servo 6.673642 / 23.2 ppm; copper-free 6.674021 / 30.3 ppm; sapphire-servo 6.672637 / 37.5 ppm; sapphire-free 6.673636 / 93.9 ppm. The full Table 18 correlation matrix was used. No numerical cross-covariance between historical archive and NIST vector is published; the preprint sets it to zero as an explicit assumption.

For the BIPM-14-excluded historical set:

| Statistic | Independent result |
|---|---:|
| Historical mean, units \(10^{-11}\) SI | 6.674227 |
| Historical MLE scale | 2.967 |
| Unscaled predictive \(Q_0\) | 42.625 |
| Uniformly scaled \(Q_\lambda\) | 4.840 |
| Finite-sample \(F(4,14)\) upper tail | 0.382 |
| Plug-in \(\chi^2_4\) diagnostic | 0.304 |
| Mean-only scaling \(Q\) | 36.378 |
| Mean-only plug-in \(\chi^2_4\) upper tail | \(2.4\times10^{-7}\) |

The uniform convention uses \(V_0=\Sigma_N+u^2(\hat\mu)\mathbf1\mathbf1^T\), \(Q_0=d^TV_0^{-1}d\), and \(Q_\lambda=Q_0/\lambda^2\). The mean-only sensitivity instead leaves \(\Sigma_N\) unscaled and scales only the historical-mean variance. The latter is a plug-in chi-square diagnostic, not the same finite-sample F reference as the uniform-scale result.

Using the full historical archive gives \(Q_\lambda=3.857\) and \(F(4,15)\) upper tail 0.486. NIST's four-value internal residual is \(Q=25.04\) on 3 df, Birge-like factor 2.89.

**Claim ceiling:** \(p=0.382\) is conditional on uniformly transferring the historical scale to the NIST covariance as well as the historical-mean uncertainty. The internal NIST factor 2.89 being close to the historical 2.967 is descriptive and does not select that convention. The conclusion is model-sensitive, not a universal statement that the NIST vector is “consistent with CODATA.”

### 3.4 Free-minus-servo torque diagnostic

From NIST Table 15, free-minus-servo differences and quadrature-combined Type A uncertainties are:

| Configuration | Difference (pN m) | Type A u (pN m) |
|---|---:|---:|
| Copper 0° | 1.700 | 0.500 |
| Copper 120° | 1.400 | 0.671 |
| Copper 240° | 2.000 | 0.361 |
| Sapphire | 2.100 | 0.361 |

The preprint treats the four differences as independent for this diagnostic:

| Model | Estimate | \(\chi^2/df\) | Upper-tail p |
|---|---:|---:|---:|
| Common absolute torque offset | 1.918 ± 0.215 pN m | 1.093/3 | 0.779 |
| Fractional-scale alternative | 67.48 ± 8.15 ppm | 12.134/3 | 0.0069 |

\(\Delta\chi^2=11.041\) is descriptive only: the one-parameter models are not nested, so this is not a likelihood-ratio test.

Table 15 provides Type A uncertainties only; no full covariance for the four torque differences is published. Table 18's covariance belongs to the four G summaries and cannot be substituted. The NIST paper separately reports fully correlated autocollimator nonlinearity contributions across the four final G results. The four-point Type-A diagnostic therefore does not identify a physical mechanism.

## 4. P2 independence and worldtube claim ceiling

The NIST experiment is a later acquisition than the CODATA-2018 archive, but not an independent prospective replication:

| Dimension | Evidence |
|---|---|
| Temporal acquisition separation | Yes: NIST data acquired in 2024, after the 2018 archive cutoff |
| Instrument lineage | No: NIST balance descends from BIPM Mark II; CODATA notes transfer to NIST |
| Source/blinding separation | Not a current blind holdout: blind offset unsealed at CPEM 2024; results published |
| Cross-covariance | No numerical historical-to-NIST cross-covariance published; zero is a model assumption |
| Independent-lab replication | Not supplied by this comparison |
| Calibration independence | Incomplete; NIST/PTB calibration steps are documented, but independent calibration lineage is not established here |

The public paper and package provide enough summary data to reproduce these calculations, but not the full synchronized acquisition series, a complete covariance for the four torque differences, or an independent holdout package. Representative traces are not raw acquisition records.

This torsion balance is a useful empirical candidate because it has finite source/test masses, controlled source-mass motion, free/servo readouts, calibrated angle/time measurements, and a finite-mass integration factor. It is **not admitted as a P2 system**. A time-resolved worldtube/timesheet characterization would require raw synchronized acquisition, source/test geometry and metrology, versioned calibration curves, complete covariance, and an independently specified holdout. No H(s)H projection, constitutive map, worldtube equivalence, or WWRD rope correspondence is established.

## 5. Existing Lean work; no duplicate formalization

Two existing PRs were checked rather than creating another module.

**PR #1306 — Mira, conditional CODATA covariance scaling**
- Head `7e6cdf625adea090fdb3905ea152d5e70f913702`.
- Exact-head Actions run [#41636346096](https://github.com/Satobloc/HsH/actions/runs/41636346096): SUCCESS; Lean 4 verification job completed dependency-manifest and formal-library compilation.
- `CODATACovarianceScaling.lean` proves correlation factorization and invariance under common positive uncertainty expansion; includes `#eval` checks for the three rounded CODATA correlations.
- Does not prove the scale estimator, GLS residual distribution, finite-sample F reference, NIST predictive comparison, model-choice convention, source independence, or H(s)H mapping.
- OPEN / DRAFT / UNMERGED / no reviews; based on the infrastructure branch, not main. No changes made.

**PR #1387 — Hale, measurement-domain and factorial contrast**
- Head `2214b0c5492f0c4844e6cc6214ff2aabc253b2c6`.
- Exact-head Actions run [#42595895210](https://github.com/Satobloc/HsH/actions/runs/42595895210): SUCCESS.
- Proves a four-cell factorial transform is bijective, a conditional first-harmonic reparameterization/identifiability limit, and type-level measurement-domain compatibility.
- Does not encode NIST values, Table 18 covariance, raw acquisition, dark-uncertainty posterior, or a physical H(s)H map.
- OPEN / DRAFT / UNMERGED / no reviews. No changes made.

No new Lean module, theorem, PR, or build was created. These exact-head builds verify only their formalized conditional statements, not the physical translation or truth of measurement premises.

## 6. Mersearch, project gates, and continuity

Mersearch-first preflight found no callable Mersearch action in this runtime. Four canonical request lanes remain occupied/requested; none was overwritten, released, or retriggered. Public NIST/CODATA papers and the public reproducibility repository were a bounded external-source fallback, not a Mersearch archive search. The three repository front doors and HsH onboarding/revival guidance were reviewed. HSH_RESOURCES was limited to root documentation; no private research payload was opened.

Current gates: P0 Code Grurple ACTIVE; P1 Orson cognition OVERDUE / NOT READY (Orson retains ownership); P2 measured geometry HOLD; P3 full theory INCOMPLETE; Lane 24 Cycle 08/08 COMPLETE / BACKSEAT / HOLD (no Cycle 09). FIE full rereview is next due 2026-11-24; last full review 2026-11-10. No paper gate advanced. No physical prediction, fit, independent measurement, CODATA update, SAT-O/Blockwave equation correction, theory promotion, task-graph change, or automation change.

**Unrelated reading break:** `SAT Mark V/TheTANGLE.txt`, lines 1921–1960, a creative fragment (“A Living Memory?” and the Coolsout exchange). Next cursor: line 1961. This is a reading break, not research evidence.

## 7. Publication and successor

This public-safe report is submitted through the existing HSH-PUBLISH-V1 issue publisher. Its artifact must be independently read back and SHA-256 matched before calling it PUBLISHED_VERIFIED. Rejection or pending status must remain explicit; no duplicate submission or manual publisher bypass.

Next ring label: **Elias Kern** (index 9). Elias retains the protected Track A workflow-switchboard remit. This statistical source audit creates no actionable Track A task; no assignment, deadline, response obligation, ownership transfer, or direct-thread delivery is claimed.

## Final disposition

`H898_S2_HALE / SOURCE_GROUNDED_REVIVAL / ARXIV_2610.04707_REPRODUCIBILITY_AUDIT / CODATA_2022_G_MEAN_REPRODUCED / NIST_2026_SUMMARY_STATISTICS_REPRODUCED / UNIFORM_SCALE_CONCLUSION_MODEL_DEPENDENT / TORQUE_DIAGNOSTIC_TYPE_A_ONLY / NO_INDEPENDENT_HOLDOUT / P2_NOT_ADMITTED / PR1306_AND_PR1387_REUSED / NO_NEW_LEAN / NO_NEW_PHYSICAL_PREDICTION / MERSEARCH_UNAVAILABLE / LANE24_HOLD / NO_THEORY_PROMOTION / NO_AUTOMATION_CHANGE / ELIAS_KERN_NEXT_NO_ASSIGNMENT`.