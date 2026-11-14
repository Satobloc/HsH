# H818:S2 | Calder — NIST/CODATA covariance, reproducibility, and null-design audit

**Date:** 2026-11-14  
**Selection:** fixed 19-person ring; nominal UTC hour h=818; seq=5h+2=4092; index 7 → Calder; successor index 8 → Hale. This is deterministic work routing, not authentication of a historical Calder or Hale ChatGPT thread.  
**Scope:** bounded source/statistical audit of an actual published G measurement and an external reproducibility preprint. **No P2 system selection, H(s)H physical calculation, fit, prediction, or theory promotion.**

## 1. Authority and source hierarchy

### Calder remit

The historical Calder entry in WORKSPACES/COMMON/CHECKINS.md (2026-09-12, lines 55–108; blob 886069e71d4aec7a3f8d199d6d889b930a05c17e) describes empirical angle-clustering tests, null design, independent observational-unit discipline, calibration/covariance, and source/provenance control. It is role-continuity evidence, not a standalone signed Nathan-authored charter. Calder BOOT/CURRENT_WORK preserve that distinction.

### Lane and campaign boundary

Live BEDROCK (blob 0253ace674bbc361464b7bbaac2c41aa3d8e8867, 667 lines), Steering Charter (blob be44c424674764c602b5f618dfce528c0f97b0ef), Three Paper Campaign (blob 2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4), three-repository onboarding, revival V3/V4, thread-routing, and current workflow orientation were read before work.

P0 Code Grurple remains the active publication interlock. Calder's current BOOT explicitly keeps Lane 24 BACKSEAT/HOLD until P0 standdown or separate explicit authorization to proceed. Repeating the standing Lane 24 charter is not treated as selection of a P2 system or release of that hold. This work is therefore a source-level statistical audit, not P2 execution.

The three-paper gates remain separate. This audit does not satisfy the P2 Nov 30 major-paper gate or Dec 14 full-theory gate.

## 2. Primary source chain and versions

### NIST 2026 measurement

Final source: Jackson et al., *Redetermination of the gravitational constant with the BIPM torsion balance at NIST*, Metrologia 63 (2026), DOI [10.1088/1681-7575/ae570f](https://doi.org/10.1088/1681-7575/ae570f); [final NIST PDF](https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075).

The final paper reports
\[
G=(6.67387\pm0.00038)\times10^{-11}\;\mathrm{m^3\,kg^{-1}\,s^{-2}},
\]
with relative standard uncertainty about 56.9 ppm. Its data-acquisition interval is 2024-01-24 through 2024-06-22. The paper provides four configuration-level G estimates and their full 4×4 correlation structure, alongside free-deflection/servo torque measurements and a detailed uncertainty budget. Raw torque time series and the full CMM point cloud were not obtained; the published tables, not raw laboratory data, are the analysis inputs here.

The source-version discrepancy between the current NIST landing-page abstract and final DOI/PDF was already documented in Aster h817:s2. This audit pins all values to the final DOI/PDF and does not duplicate or amend that correction.

### CODATA 2022

Official source: [NIST CODATA 2022 recommended values](https://physics.nist.gov/cuu/pdf/wall_2022.pdf), with the evaluation described in [Mohr et al., Rev. Mod. Phys. 97, 025002 (2025)](https://doi.org/10.1103/RevModPhys.97.025002).

As of 2026-11-13, the latest published recommended value remains
\[
G_{2022}=6.67430(15)\times10^{-11}\;\mathrm{m^3\,kg^{-1}\,s^{-2}}.
\]
The 2022 evaluation retained the same 16 G input determinations and the same common uncertainty expansion factor 3.9 as the 2018 input set; it did not incorporate the 2026 NIST paper. The 2026 CODATA adjustment is not yet published.

The historical input file used below is the 16-determination CODATA-2018 input set, with three nonzero correlations and unexpanded k=1 standard uncertainties. CODATA's published expansion factor 3.9 is a separate evaluation choice, not the same quantity as the empirically estimated scale factors below.

### Secondary analysis and reproducibility package

Vineet Kumar, [arXiv:2610.04707](https://arxiv.org/abs/2610.04707), version 1 (submitted 2026-10-03), is a secondary statistical analysis, not a new measurement or a CODATA adjustment.

Pinned public code/data repository: [vineetsci/g-metrology at commit 132c8c5c58654fbb062d555e4bce64c2126f8f6b](https://github.com/vineetsci/g-metrology/tree/132c8c5c58654fbb062d555e4bce64c2126f8f6b).

Relevant immutable file blobs at that commit:
- data/codata_2018_g.yaml: 4e6b8935cfaf735a883ea6eb70d514cdec957bdb
- data/nist2026_configurations.yaml: 63d745844db0970dcaf571f29e690884191db7cf
- data/MANIFEST.json: 4e157b181469732fd2247abbbd06b3374ae53132
- results/machine_readable/prospective_nist.json: 320fa88f01e1f8facd5d0f4d311ac26da92a705e
- results/machine_readable/historical_dispersion.json: 3ea8ba599386d285d58d56e1c3726d43310ee59a
- results/machine_readable/torque_offset.json: bf0cbeb8b998faf7defaa20701c08f83487ccaa7
- results/machine_readable/nist_factorial_results.json: 70e8869f5095489b9647de6863b65b6b76773a6b
- results/machine_readable/nist_structure_profiles.json: b3d03bfb8e58e80eec99350a8bf1aba30e68e97d

The package declares version 1.0.0 and MIT software licensing; third-party data retain their source licenses. It includes a SHA-256 manifest, a loader that checks canonical hashes, a core reproduction path, and regression tests. However, the inspected GitHub repository has no tag/release, no CI workflow directory, and zero forks; the pinned main commit is not signature-verified. The package's local tests were not run here. I independently reproduced selected numerical outputs from the exact pinned YAML values/covariance in Python/NumPy/SciPy and matched the machine-readable result JSON to floating-point tolerance. This is not a full package test or independent raw-data reproduction.

## 3. Statistical model and dependence structure

The CODATA historical set has 16 determinations, with three nonzero pair correlations. The prospective analysis excludes BIPM-14, leaving N=15 and ν=14, to reduce direct overlap with the NIST/BIPM lineage. The NIST 2026 vector contains four configuration-level G estimates with six nonzero pair correlations. These four estimates share one apparatus, geometry, calibration chain, and personnel/design lineage; they are not four independent laboratories or four independent replications.

The preprint assumes zero cross-covariance between the historical CODATA vector and the NIST vector because no cross-experiment covariance matrix is published. This is an explicit modeling assumption, not a measured fact. Excluding BIPM-14 reduces one direct overlap but does not prove all remaining cross-covariance is zero.

The NIST paper's Bayesian consensus model uses a CODATA-centered prior. Its prior width for the common mean (9×10⁻¹⁵ SI) is distinct from the reference scale used for configuration-effect priors (9.6×10⁻¹⁵ SI); do not conflate these parameters. The preprint's primary prospective comparison uses the four published configuration estimates and their covariance, not the final Bayesian consensus as if it were an independent observation.

## 4. Independent numerical reproduction

All G values below are in units of 10⁻¹¹ m³ kg⁻¹ s⁻². The torque contrasts are in pN·m. Inputs are the published CODATA-2018 and NIST-2026 tables in the pinned YAML files above; no synthetic physical fixture or data-free physical calculation was used.

### Historical dispersion

After excluding BIPM-14 and using the three published correlations:

- GLS historical mean: 6.6742267429
- Q = 132.0881584, N = 15, ν = 14
- common-scale MLE λ̂ = √(Q/N) = 2.9674698
- Birge ratio √(Q/ν) = 3.0716231

Using the full historical covariance versus diagonal-only changes Q from 133.2237520 to 132.0881584 and λ from 2.98020 to 2.96747. The correlations are not dominant for this particular historical residual statistic, but they are retained.

### NIST prospective vector

Using the full NIST 4×4 covariance:

- Unscaled predictive quadratic: Q₀ = 42.6246337.
- Under the preprint's **uniform common-scale** convention (same λ multiplies historical-mean variance and NIST covariance): Q = 4.8404756; finite-sample F(4,14) = 1.1294443, upper-tail p = 0.3822865.
- Under the preprint's **mean-only** sensitivity (historical mean variance scaled, NIST quoted covariance left unscaled): Q = 36.3781467; descriptive χ²₄ upper-tail p = 2.419×10⁻⁷.

These are not two estimates of one assumption-free probability. The F result is conditional on a common scale applying to both covariance blocks, independent Gaussian training/test vectors, and zero historical-to-NIST cross-covariance. The mean-only calculation is a sensitivity convention, not an alternative validated data model.

### New covariance-scale bridge sensitivity

The preprint's five-point quoted-error stress test varies NIST quoted standard uncertainties by 0.8–1.2 **around the uniform-scale convention**. It does not bridge the mean-only and uniform conventions.

I added a transparent interpolation solely to quantify that gap. Hold the historical mean variance at λ²/a_H, and scale the NIST covariance by κ²:
\[
V(\kappa)=\kappa^2 S_N + \frac{\lambda^2}{a_H}\mathbf 1\mathbf 1^T,
\qquad
Q(\kappa)=d^T V(\kappa)^{-1}d.
\]
Here d = y_N − μ̂_H 1, a_H = 1ᵀ S_H⁻¹ 1. This uses the actual published NIST and CODATA covariance matrices.

- κ = 1 (mean-only endpoint): Q = 36.3781.
- κ = λ = 2.96747 (uniform endpoint): Q = 4.84048.
- Q crosses the descriptive 95% χ²₄ threshold 9.4877 at κ = 2.09013, about 70.4% of the way from unit scale to λ on the standard-uncertainty scale.
- The corresponding variance-interpolation fraction is α = 0.43155.

**Limit:** the intermediate κ values are a sensitivity path, not a third physical model and not an exact finite-sample F calibration. The threshold only shows how much NIST covariance inflation is required to move the Mahalanobis distance below a conventional χ² reference boundary while the historical mean variance remains scaled. It does not establish which covariance convention is correct. The package's 0.8–1.2 stress grid around uniform scaling remains entirely above κ≈2.09 and therefore does not resolve this model-choice question.

### NIST internal configuration dispersion and the importance of correlations

The four NIST configuration estimates give:

- Full-covariance Q = 25.038375 on 3 df.
- Internal Birge-like factor = 2.888966.
- Diagonal-only Q = 19.098301.

Dropping the published NIST correlations reduces the internal Q by about 23.7% relative to the full value (equivalently, the full-covariance Q is about 31.1% larger than diagonal-only). The NIST correlation matrix materially changes the residual geometry and must not be discarded. The NIST internal scale factor is about 2.65% below the historical λ=2.96747, but these are not independent replications: the NIST four-vector is one correlated apparatus/configuration family.

### Free-deflection versus servo torque diagnostic

From NIST Table 15, the four published free-minus-servo torque differences are approximately [1.7, 1.4, 2.0, 2.1] pN·m. Combining the reported Type-A standard uncertainties in quadrature gives [0.500, 0.671, 0.361, 0.361] pN·m.

Under the preprint's independent-Type-A approximation:

- Common absolute offset: 1.91835 ± 0.21513 pN·m; Q = 1.09289 on 3 df.
- Fractional-scale fit: 67.4773 ± 8.1545 ppm; Q = 12.13387 on 3 df.
- ΔQ = 11.04098.

The two models are non-nested; ΔQ is descriptive and is **not** a likelihood-ratio p-value. The full covariance of the four torque differences is not published. The 4×4 covariance of the derived G estimates is not a substitute for the torque-difference covariance. These four contrasts are repeated configurations of one apparatus, not independent instruments. The common-offset result is a hypothesis-generating apparatus diagnostic, not an identified physical mechanism.

The package's supplementary NIST structure-profile output reports an AIC difference of about 0.004 between material-effect and independent-dark-effect models, effectively indistinguishable at this resolution. Its 2×2 material/mode decomposition is descriptive of four derived configuration estimates; it does not establish a general material mechanism or population-level replication. The additive-versus-intercept contrast and interaction test remain conditional on the supplied covariance and model.

## 5. Null-design implications

The present published summaries cannot identify whether the free/servo contrast is a fixed apparatus offset, fractional calibration effect, material/configuration effect, or another correlated systematic. A useful follow-up would need:

1. Multiple predeclared source-mass separations or gravitational-torque levels, with order randomized and configuration labels blinded where practical.
2. Paired free/servo acquisition at each level, repeated across independent acquisition blocks and, decisively, across an independently designed balance or measurement technique.
3. Raw torque time series, servo voltage/current, autocollimator calibration and nonlinearity records, CMM point clouds, mass-property uncertainty, source/test-mass geometry, temperature/pressure/thermal logs, and synchronized timestamps.
4. A full covariance model for the paired torque differences, including shared calibration, common drift, autocorrelation, mass geometry, and cross-configuration terms. Do not infer this covariance from the published G-estimate covariance.
5. A preregistered encompassing contrast such as dᵢ = ΔN + f N_g,i + εᵢ, with the covariance estimated from calibration/repeated blocks and a separate instrument/acquisition holdout. Absolute-offset and fractional-scale hypotheses are special cases; do not choose between them after seeing the same four points.
6. A genuinely different instrument/technique to break the BIPM/NIST apparatus lineage. More configurations on the same balance do not create independent replication.

No torque-level fixtures or illustrative numbers from the preprint were reused as measured data. No power calculation was made without actual pilot covariance and instrument capability.

## 6. H(s)H and geometry boundary

This is a standard-metrology control and a statistical-method audit, not an H(s)H validation. No H(s)H forward map, inverse map, worldtube/timesheet representation, responsive-medium term, or observable prediction was instantiated.

If P2 is later authorized, the minimum source-grounded chain would be:
- finite source/test-mass geometry and rotation → laboratory gravitational torque;
- calibrated instrument readout O from torque/servo/autocollimator state to observed signal;
- explicit forward Φ and reverse Π maps with domains, codomains, conditions and uncertainty propagation;
- a prospective residual signature fixed before a separate acquisition/instrument holdout.

Newtonian finite-mass integration remains the standard comparator; a point-mass approximation is a negative control, not an H(s)H signature. No equivalence to WWRD climbing-rope mechanics is asserted.

## 7. Lean, existing tools, and Mersearch

- Local Lean/Lake/Elan are not installed in this runtime.
- Existing HsH PR #1306 (Mira, open/draft/unmerged) already proves the conditional algebraic covariance-factorization and uniform-expansion correlation-invariance identities. Its exact PR head 7e6cdf625adea090fdb3905ea152d5e70f913702 passed Lean 4.34.0/Lake 5.0.0 build #41636346096 (8,945 jobs); the dedicated axiom audit, nanoda, lint and test stages were skipped. This does not prove the finite-sample F distribution, the zero-cross-covariance assumption, or any measurement premise. I did not edit Mira's PR or create a duplicate theorem.
- Calder PR #1515 remains separate and untouched. Math Hopper #578/PR #991 and Whirligig Kernel 0/PR #1115 were checked as existing infrastructure; no new tooling was warranted. SciSpace was available and used only as a discovery aid; factual claims above are pinned to primary sources and the versioned package.
- No new dependency, fork, subscription, paid API, tool, branch, PR, issue, or public submission was created.
- No callable Mersearch connector is available in this runtime. The four canonical request lanes remain occupied; no query, overwrite, release, reset, or retry was performed. The current four bridge workflows contain the compact-receipt and 95 MiB pre-push gate. Lane 2's old GH001 oversized-publication failure predates that code correction; its request remains unverified/occupied. Lanes 1, 3 and 4 retain their previously recorded runner-shutdown cancellations. Existing Tern records already cover the first failing transitions; no duplicate observation was created.
- HSH_RESOURCES was limited to its root README/metadata; no private payload was opened. The SAT archive and HsH root orientations were read.

## 8. Project controls and continuity

- P0 Code Grurple: ACTIVE. Comparing h817 main baseline 19a3251dceb03bd118e6c305bb28cdad1b5c5caf with pre-write main 29d000e33ee65bd8274ecd3c95ba2aa76bca0617 showed 27 commits ahead, zero behind, and no changes to the eight protected P0 paths. No route probe or trigger.
- P2: HOLD / no selected system / no raw dataset and calibration-covariance package / no independent holdout / no instantiated Φ, Π, O.
- P1 cognition remains Orson-owned and OVERDUE / NOT READY; P3 remains INCOMPLETE.
- Task graph blob 4ee79fa0a30fedb1feffd0a92c2716f87a365670: 18 records vs declared branch_count=16; no duplicate IDs, dangling parent/child references, or nonreciprocal edges; one root-traversal-unreachable node WORLD-TUBE-POLARIMETRY-READOUT-2026-11-03. This is the previously reported Tern-owned graph discrepancy; no mutation.
- FIE next rereview: November 24, 2026.
- Unrelated reading completed: Lewis Carroll, *Alice's Adventures in Wonderland*, Project Gutenberg #11, lines 741–780. Next cursor: 781. No physical break claimed.

## 9. Disposition

**SOURCE_AUDIT_COMPLETE / INDEPENDENT_STATISTICAL_REPRODUCTION_PARTIAL / COVARIANCE_CONVENTION_SENSITIVITY_ADDED / P2_HOLD / NO_HSH_PREDICTION / NO_PUBLICATION / NO_TASK_MUTATION.**

The next useful research step, if/when P0 stands down and P2 is explicitly released, is not another fit to these four configuration values. It is acquisition of the raw torque/CMM/calibration records and a preregistered, covariance-aware, independently instrumented source-separation test.
