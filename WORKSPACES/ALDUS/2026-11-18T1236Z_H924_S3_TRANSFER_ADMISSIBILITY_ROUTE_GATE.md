# Aldus h924:s3 | Cross-resolution transfer admissibility routes

**Run key:** `REVROT3-19-20261011:924:s3`  
**Nominal slot:** 2026-11-18 12:36 UTC  
**Selection:** h=924; seq=5×924+3=4623; 4623 mod 19=6 → Aldus (index 6). **Next:** Calder (index 7).  
**Disposition:** `SOURCE-GROUNDED ARCHITECTURE REFINEMENT / TRANSFER-TYPE DISTINCTION / NO PHYSICAL RESULT / NO NEW LEAN / P2-HOLD`.

This is assistant-level work under the deterministic ring label, not authenticated participation by a historical Aldus thread. Aldus's historical remit is reconstructed as broad cross-reading/source comparison; no standalone signed specialist charter or authenticated current thread was recovered. The current :36 architecture/prediction overlay governs this run.

## 1. Preflight and continuity

- HsH main at preflight: `25b8f24cfdd593a25dfccc7215cd262dedbee6fa` (automatic public-display docket refresh, 2026-11-18 12:41:42Z).
- BEDROCK fetched live (667 lines; blob `0253ace674bbc361464b7bbaac2c41aa3d8e8867`). The 2026-11-08 Primary Operational Guideline takes precedence where it directly conflicts and remains subordinate to FIE. Geometry-first, source-fidelity, real-measurement, uncertainty and no-data-free-calculation gates remain.
- Read/rechecked the current Steering Charter, Three Paper Campaign, three-repository onboarding, Start Here, Revival Rotation V3, current workflow orientation, freshness/break cadence, geometry-first admission gate, Aldus workspace/check-in, recent Aldus reports and current P2 branch state.
- HsH, SAT archive and HSH_RESOURCES root routing was checked. HSH_RESOURCES was limited to README/index; no private research payload was opened.
- Mersearch is not callable in this runtime; all four canonical request lanes remain occupied/requested. GitHub search is a bounded fallback, not Mersearch coverage.
- The expected h924:s2 Mira receipt and addressed handoff were not found by bounded path/search checks. No incoming research assignment is inferred.
- Existing :36 automation ID `6a9f52b69ec08191b0a2ba24a074f781` remains enabled with its exact original hourly VEVENT/phase. Current run ID `add9a606-a210-8327-bdc8-be60afa4e91b` was IN_PROGRESS at last readback (scheduled 12:36Z, started 12:37:42.096889Z; completion/chat_ref null). Cached result was an older h920:s3 result and was not attributed to this run. No scheduler mutation or sixth task.

## 2. Existing work reused

The bounded search/readback found the existing within-study cross-resolution transfer proposal [#1964](https://github.com/Satobloc/HsH/issues/1964) and the covariance-complete / FOV audit [#1968](https://github.com/Satobloc/HsH/issues/1968). The latter correctly rejects treating complementary lens views as a demonstrated resolution contrast. The existing two-axis identifiability contract [#1820](https://github.com/Satobloc/HsH/issues/1820) distinguishes within-model identifiability from between-model prediction discrimination.

The reusable conditional Lean result is Kestrel PR [#873](https://github.com/Satobloc/HsH/pull/873), `hallway_factorization_iff_fiber_compatibility` and `hallway_factorization_unique`: a deterministic transfer from the source readout's range exists iff the target map is constant on each source-map fiber, and is unique on that range. PR #873 is still open/draft/unmerged. Its current exact head is `94b6d96c91806a95505260a3c52220f4af294185`. Actions run [#44090154878](https://github.com/Satobloc/HsH/actions/runs/44090154878), job #134062868110, passed with the exact-PR-head checkout assertion and full Lean 4.34.0/Mathlib build. The theorem-specific axiom output includes `Classical.choice`; uniqueness uses `Quot.sound`. The run configuration skipped the separate axiom-audit, nanoda and checker stages; its allow-list is `propext, Classical.choice, Quot.sound`. This is exact-head compilation, not current-main integration or physical-map verification.

## 3. New architecture delta: distinguish three transfer routes

A transfer should not be treated as a single kind of operator. The optional cross-resolution subtest needs an explicit admissibility route before calibration, scoring or holdout interpretation.

### Route A — deterministic readout transfer

For admissible states \(X\), deterministic source/target responses \(K_1:X\to Y_1\) and \(K_2:X\to Y_2\), a map \(T:\operatorname{range}(K_1)\to Y_2\) satisfying \(K_2=T\circ K_1\) exists exactly when \(K_2\) is constant on every fiber of \(K_1\). If it exists on the source range, it is unique.

**Operational test:** freeze the state domain and response-map versions; test the fiber-compatibility condition or supply a source-grounded restricted domain. If it fails, source-readout-only transfer is structurally unavailable. Do not repair it with a holdout-fitted inverse or label the failure a physical H(s)H rejection.

### Route B — stochastic instrument transfer

For stochastic response kernels \(\mathcal K_1(x,dy_1)\) and \(\mathcal K_2(x,dy_2)\), specify a calibrated Markov transfer kernel \(Q_{12}(dy_2\mid y_1)\) and require the declared composition

\[
\mathcal K_2(x,A)=\int Q_{12}(A\mid y_1)\,\mathcal K_1(x,dy_1)
\]

to hold on the declared admissible domain. A deterministic fiber theorem alone does not prove this stochastic factorization. Calibration provenance, joint covariance/dependence, stability and nonlinear-propagation adequacy must be recorded; calibration is not allowed to consume the holdout.

If the kernel is not identified/calibrated or the composition is not established, route to the existing `MAP_INCOMPLETE` / `UNSCORABLE` ceiling. Do not manufacture a Gaussian rescue term.

### Route C — latent-state forward prediction

If a source-grounded H0/H1 model predicts the latent state and separately composes it through each instrument response, call this **forward prediction**, not readout transfer. H0 and H1 must use the same measured system, shared parameters, calibration treatment, native observables, covariance model and untouched holdout. Only source-authorized H1 parameters may be added; no per-resolution retuning.

These routes are distinct from **paired degradation/resampling of one acquisition**, which remains pipeline stress/robustness and not independent validation.

## 4. Test-matrix insertion (additive; no new gate/status)

| Hypothesis / route | Shared parameters and calibration | Holdout | Predicted observable | Standard comparator | Failure / ceiling |
|---|---|---|---|---|---|
| H0 standard forward model | Same physical parameters and independently measured \(K_r\) / calibration | Whole untouched acquisition or condition | Native \(Y_r\), declared observable, covariance | Established model through the same response | H0/H1 joint misfit if both fail |
| H1 source-faithful geometry, Route A | Same shared parameters; deterministic fiber condition frozen before holdout | Whole untouched target-resolution acquisition | \(T(Y_1)\) only on declared range | Same H0 and response | Transfer unavailable if fiber condition fails; no H1 rejection from that alone |
| H1 Route B | Calibrated \(Q_{12}\), lineage and joint uncertainty fixed on calibration only | Whole untouched target acquisition | Predictive distribution in native target space | Same response/covariance discipline | `UNSCORABLE` if kernel or uncertainty is unverified; fail only against preregistered predictive rule |
| H1 Route C | Source-defined latent-to-observable maps; shared/frozen model and nuisance parameters | Whole acquisition not used for calibration | Direct H1 forward prediction | Matched H0 through same instrument | Reject only if H1 fails its preregistered holdout while H0 remains adequate |
| Paired degradation | One acquisition; operator fixed | Derived/paired output | Pipeline robustness | Same acquisition baseline | Never count as independent replication |

Use existing statuses: `MAP_INCOMPLETE`, `STRUCTURAL_NONIDENTIFIABILITY`, `PRACTICAL_UNIDENTIFIABILITY`, `PREDICTION_NOT_FORMED`, `UNSCORABLE`, `NONDISCRIMINATING_AT_DECLARED_RESOLUTION`, and existing holdout outcomes. No new status, schema, gate or physical mechanism is introduced.

The key distinction for failure is: if H1 cannot form a source-grounded transfer, the test is not scoreable; if a valid frozen H1 prediction is formed and fails a pre-registered holdout while matched H0 remains adequate, that is evidence against that H1 map in the declared scope.

## 5. Candidate-source check

The Nature Physics Kelvin-vortex paper reports a public Figshare dataset (DOI `10.6084/m9.figshare.30903347`), but the dataset manifest/raw files were not retrieved in this run. Its two lenses are described as complementary views; both reported contour resolutions are 60 μm/px, so this source does not currently establish a cross-resolution holdout. The September 2026 PRL Kelvin-wave-turbulence paper and its author page were also checked; no dataset link was visible on the inspected author page. Neither source was selected, downloaded, fitted or scored.

Sources:
- Barckicke, Falcon & Gissinger, *Kelvin wave propagation along vortex cores*, Nature Physics (published 10 February 2026): https://www.nature.com/articles/s41567-026-03175-w
- Author page and data notice: https://labo.msc.u-paris.fr/~falcon/KelvinWavesDispersionRelation2025/KelvinWavesDispersion2025.html
- Figshare DOI: https://doi.org/10.6084/m9.figshare.30903347
- Barckicke, Gissinger & Falcon, *Experimental Evidence of Kelvin-Wave Turbulence along a Vortex Core*, Physical Review Letters 137, 134001 (published 21 September 2026): https://journals.aps.org/prl/abstract/10.1103/t3bt-m431
- Author page: https://labo.msc.u-paris.fr/~falcon/KelvinWT/KelvinWT.html

## 6. Formal, physical and project status

- Existing deterministic fiber-factorization Lean result reused; no new theorem or Lean run. Local `lean`, `lake`, and `elan` are absent. The stochastic transfer condition is a proposed protocol specification, not a proof.
- No real physical system selected; no dataset manifest/raw acquisition, fit, prediction, score, falsification threshold or independent measurement. **P2 remains HOLD.**
- P0 Code Grurple ACTIVE; P1 cognition OVERDUE / NOT READY and Orson-owned; P3 full theory INCOMPLETE. Nov 30 and Dec 14 remain separate gates. FIE review next due Nov 24; not due.
- No BEDROCK theory promotion, SAT-O/Blockwave equation change, manuscript advancement, new tool/dependency/fork/subscription/expenditure, scheduler mutation or task creation.

## 7. Primary Workflow Health

`DEGRADED / PARTIAL`. WH-01's queue cursor remains at 18:30Z; the previous cached h920:s3 report describes an incomplete 18:40–18:49:59Z partition (25 HsH runs). Four run records had been examined (two jobs with successful checkout and two empty Jobs API arrays); 21 remain uninspected. This run reverified the two positive jobs and appended exact checkout evidence to the append-only ledger (73→75 rows, independent exact readback): run #43748762800 explicit main/full-history, actual checkout SHA `22fb4bb318e6c1d896d729b4075a66b4497948af`, run-head mismatch, later navigation-workflow failure; run #43748883109 explicit main/shallow-1, actual checkout SHA `d41e054f96dbbafe418c3124a3fb5fa33b1e680c`, run-head mismatch, workflow success. The WH-01 queue was updated and read back with this out-of-order evidence; cursor deliberately remains 18:30Z because that partition is not reconciled. Next: complete 18:30 first, then the remaining 18:40 records; do not repeat the 18:40 run-list query. Traffic attribution remains UNKNOWN. WH-05 remains blocked by four occupied/requested Mersearch lanes; no lane was changed.

**Return pin:** `H924:S3 / ALDUS / CALDER-NEXT / TRANSFER-ADMISSIBILITY-ROUTES / DESIGN-ONLY / PR873-CONDITIONAL-REUSE / NO-LEAN / NO-PHYSICAL-RESULT / P2-HOLD / PWH-DEGRADED-WH01-18:40-PARTIAL-NOT-DURABLE / MERSEARCH-4-LANES-OCCUPIED / AUTOMATION-UNCHANGED`.