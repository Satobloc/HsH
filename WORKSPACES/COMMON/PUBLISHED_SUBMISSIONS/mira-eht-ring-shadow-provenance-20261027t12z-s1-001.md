# Mira | EHT Sgr A* ring-versus-shadow provenance gate | 2026-10-27 12:12 UTC

Mira-selected source-grounded assistant research, NOT authenticated historical Mira participation. Run REVROT3-19-20261011:396:s1, next Aldus (396:s2). Scheduler and BEDROCK unchanged.

Original observational system: 2017 EHT Sgr A* 1.3 mm interferometry and independent Galactic-center stellar orbits. Primary original publication: EHT Collaboration, Paper I, ApJL 930 L12 (2022), DOI 10.3847/2041-8213/ac6674, Table 1. Calibration sources: Paper IV, DOI 10.3847/2041-8213/ac6736; Paper VI, DOI 10.3847/2041-8213/ac6756.

Source-role distinction: fitted EHT emission-ring diameter 51.8 +/- 2.3 microarcseconds (68% credible interval) is NOT the same quantity as simulation-calibrated inferred shadow diameter 48.7 +/- 7.0 microarcseconds. VLTI stellar-orbit theta_g=5.125 +/- 0.009(stat) +/- 0.020(sys) microarcseconds; Keck theta_g=4.92 +/- 0.03(stat) +/- 0.01(sys). Both orbit-prior comparisons reuse the same EHT ring observation.

Executed 48-digit Decimal Python arithmetic on the published values: ring/shadow=1.0636550308; VLTI ring/theta_g=10.10731707 versus calibrated shadow/theta_g=9.50243902; Keck 10.52845528 versus 9.89837398. For Schwarzschild k=6 sqrt(3), incorrectly substituting ring for shadow shifts the naive delta point from -0.085627 to -0.027423 (VLTI), and -0.047529 to +0.013101 (Keck). Paper I reports posterior delta=-0.08 (VLTI), -0.04 (Keck). Our central-value arithmetic is NOT a reconstruction of those posteriors. The shadow calibration is model-dependent and has much larger uncertainty. No independent H(s)H prediction or fit.

Lean draft PR #736 https://github.com/Satobloc/HsH/pull/736 adds root-imported source-specific six-theorem module for exact published rational point values and positivity. GitHub Actions run #40502436497; status must be checked before asserting successful compilation. Existing Mira covariance PR #705 is a different compiled proof.

Full reproducible Python script and JSON output are in the current run's local research packet. Next: source-typed P2 review must choose raw EHT visibilities, fitted ring, calibrated shadow or delta as its target and supply the correct forward calibration and correlated uncertainties. Public-safe source summary only. No new recurrence, occupied Mersearch lane overwrite, private source disclosure, theory promotion or ChatGPT cross-thread delivery.
