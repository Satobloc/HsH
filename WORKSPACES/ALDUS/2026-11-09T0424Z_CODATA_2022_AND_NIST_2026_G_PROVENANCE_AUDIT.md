# Aldus h700:s2 — CODATA 2022 and NIST 2026 gravitational-constant provenance audit

**Disposition:** INTERNAL SOURCE-QC COMPLETE / NO PHYSICAL MODEL CALCULATION / NO CODATA RECOMPUTATION / NO P2 SYSTEM SELECTED / P0 ACTIVE.

**Run key:** `REVROT3-19-20261011:700:s2`  
**Nominal slot:** 2026-11-09T04:24Z  
**Deterministic ring result:** h=700; seq=3502; 3502 mod 19 = 6; ring label Aldus (index 6); next Calder (index 7). This is a routing label, not authenticated participation by a historical Aldus or Calder ChatGPT thread.

## 1. Historical remit and governing boundaries

The Aldus remit was checked against the current Aldus continuity card and the five direct Nathan user-message anchors recorded there for the original conversation:

- Conversation: `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`
- Raw export blob: `2f5ea91a449446f64d298b50b0c2ef0d8533900a`
- Direct user-message anchors: `ec01d986-5b09-4c44-897c-75c1bb2aca99`, `f8dfe961-6de6-4e4c-b74d-8b993ddfa337`, `939e981d-72ec-451b-81a3-f0a07b3a2c48`, `fcff5c18-85c4-4efc-b7e5-df7ee20c0646`, `3eec9833-d2c8-44f3-9ce6-0d0cbfc9180d`.

Recovered remit: broad cross-disciplinary R&D, reading across unrelated subjects and archive areas, combining information not usually combined, noticing structural connections without forcing a premature theme, and preserving source distinctions and competing hypotheses. The narrower “Ensemble Methodologist and Context Architect” title was an assistant proposal Nathan rejected. The later first-extant/first-public chronology and Bayesian workflow is not retroactively attributed to the original charter.

The current HsH BEDROCK, Nathan Direct methodology, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, Revival Rotation V3, task graph, current branch, prior receipts, and current Aldus work record were read. The source-to-model, measurement-to-observable, and CODATA-evaluation distinctions remain controlling. No BEDROCK edit or theory promotion was made.

## 2. Current branch, task graph, and Mersearch preflight

- HsH default branch: `main`; branch head observed during this run: `e3d77d81` (full SHA retained in the GitHub branch readback).
- Task graph: 16 declared branches and 18 records. This count difference was not interpreted as an error or modified; Tern retains reconciliation authority.
- The earlier h698 Lane 1 pointer mismatch is no longer present in the current read: Lane 1's request file again matches the task-graph request ID.
- Current Mersearch requests remain occupied/requested:
  1. `calder-angle-geometry-source-fidelity-20261102-1337`
  2. `archive-harvest-20261025-optics-01`
  3. `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`
  4. `kestrel-finite-core-geometry-source-fidelity-20261102-2200`
- All four request files report REQUESTED. The 12 request-scoped manifest/receipt paths (three per request) were absent at readback. No lane was released, overwritten, or retriggered.
- No Mersearch connector/action is exposed in this runtime. No Mersearch search was run and no Mersearch completion is claimed. No new request was submitted. Existing HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES onboarding/front-door material was checked; SciSpace was available and used for bounded literature discovery, not as a Mersearch substitute.

## 3. CODATA 2022 is an evaluated adjustment, not a single measurement

The current NIST constants site identifies the internationally recommended set as **2022 CODATA**. The values became available on 20 May 2024; the detailed review paper was published 30 April 2025. The 2022 adjustment uses theoretical and experimental data available through 31 December 2022 and is a least-squares adjustment under the CODATA Task Group on Fundamental Constants.

Primary sources:
- NIST constants portal: https://physics.nist.gov/cuu/Constants/index.html
- Mohr, Newell, Taylor & Tiesinga, “CODATA recommended values of the fundamental physical constants: 2022,” Rev. Mod. Phys. 97, 025002 (2025), DOI: https://doi.org/10.1103/RevModPhys.97.025002

For Newtonian G, the 2022 paper states:
- 16 input measurements were used.
- Three input pairs are correlated: NIST-82/LANL-97 (r=0.351), HUST-05/HUST-09 (r=0.134), and HUST-09/HUSTT-18 (r=0.068).
- The inputs had not changed since the 2018 adjustment; no new G datum was included in 2022.
- A multiplicative expansion factor of 3.9 was applied to the input uncertainties to reduce inconsistencies to the Task Group's accepted level.
- The separate weighted-mean calculation reports χ²=12.9 for 15 degrees of freedom, p=0.61, Birge ratio 0.93.
- The 2022 recommended value is G = 6.67430(15) × 10^-11 m^3 kg^-1 s^-2, with relative standard uncertainty 2.2 × 10^-5.

This is a versioned evaluated value with a documented input set, correlation structure, and uncertainty expansion. It must not be conflated with a later individual experiment or its own posterior combination.

The NIST constants page states that the next regularly scheduled adjustment is CODATA 2026 and that eligible data must have been discussed in a publication preprint or publication before 31 December 2026. The NIST 2026 G paper below is therefore eligible for consideration, but its inclusion and weighting in the future adjustment are not yet known.

## 4. NIST 2026 BIPM torsion-balance replication: measurement chain and uncertainty

Primary source:
- Schlamminger et al., “Redetermination of the Gravitational Constant with the BIPM torsion balance at NIST,” Metrologia 63 (2026) 025012, DOI: https://doi.org/10.1088/1681-7575/ae570f
- NIST landing page: https://www.nist.gov/publications/redetermination-gravitational-constant-bipm-torsion-balance-nist
- NIST-hosted final PDF: https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075

The paper reports data collected 24 January–22 June 2024. The BIPM Mark II torsion-balance apparatus was transferred to NIST and modified. G was determined through two readout methods:
- free deflection (mechanical angular response, read by an autocollimator);
- electrostatic servo (electrostatic torque balance, using calibrated RMS voltages, capacitance gradients, and residual-angle correction).

Four final configurations were combined: copper-servo, copper-free, sapphire-servo, sapphire-free. Source/test mass geometry and mass-integration factors are measured inputs; CMM dimensional metrology, autocollimator calibration, capacitance and voltage standards, pressure corrections, torsion response, and mass properties enter the uncertainty budget.

The four individual determinations and relative standard uncertainties (k=1) are:
- copper-servo: 6.673642 × 10^-11, 23 ppm;
- copper-free: 6.674021 × 10^-11, 30 ppm;
- sapphire-servo: 6.672637 × 10^-11, 38 ppm;
- sapphire-free: 6.673636 × 10^-11, 94 ppm.

The reported inter-determination correlations are positive:
- copper-servo/copper-free 0.42;
- copper-servo/sapphire-servo 0.38;
- copper-servo/sapphire-free 0.12;
- copper-free/sapphire-servo 0.23;
- copper-free/sapphire-free 0.23;
- sapphire-servo/sapphire-free 0.25.

The dominant uncertainty contributions include mass integration and autocollimator nonlinearity. Several inputs are shared across configurations, so the four determinations are correlated; treating them as independent would be wrong.

The paper finds a persistent servo/free offset in both copper and sapphire campaigns. A possible thermal torque following servo voltage was investigated, but no significant time-dependent effect was observed. The origin remains unknown. The authors model the four determinations as
`G_j = μ + λ_j + ε_j`,
where `λ_j` are configuration-specific effects with covariance `Σ_ij = τ_i τ_j R_ij`, and `ε_j` is the configuration's measurement error. The prior for `μ` is Gaussian and centered on the CODATA 2022 recommended value; the `τ_j` use reliability-scaled half-Cauchy priors. This is a Bayesian hierarchical consensus estimate with explicit dark uncertainty, not a raw single-measurement output.

The final PDF reports
`G = (6.67387 ± 0.00038) × 10^-11 m^3 kg^-1 s^-2`,
relative standard uncertainty `5.7 × 10^-5`. The paper reports a relative difference of `−6.4 × 10^-5` from CODATA 2022 and p=0.29 after its uncertainty treatment. That comparison is the authors' model-conditioned result; it is not an independent H(s)H prediction. The paper also says the replication is not entirely independent of the BIPM effort because C. C. Speake contributed to both efforts.

The paper identifies no single dominant cause for the discrepancy with the earlier BIPM determination. It quantifies several systematic effects, including test-mass geometry, pressure forces, autocollimator nonlinearity, and configuration-level dark uncertainty. The remaining discrepancy is unresolved. This null result and the expanded uncertainty are scientifically important; they should not be smoothed away by fitting a preferred value.

## 5. NIST landing-page / final-PDF version conflict

The NIST publication landing page, created 16 April and updated 2 May 2026, still displays:
`G = (6.67366 ± 0.00020) × 10^-11`,
relative standard uncertainty `3.0 × 10^-6`, and a relative offset of `2.81 × 10^-4` from the BIPM result.

The NIST-hosted final PDF for the same DOI instead reports:
`G = (6.67387 ± 0.00038) × 10^-11`,
relative standard uncertainty `5.7 × 10^-5`.

A small scripted arithmetic check of the landing-page pair gives
`0.00020 / 6.67366 ≈ 3.0 × 10^-5`,
not `3.0 × 10^-6`. The final-PDF pair gives
`0.00038 / 6.67387 ≈ 5.69 × 10^-5`,
consistent with the PDF's stated `5.7 × 10^-5`. The landing-page central value differs from the final-PDF central value by approximately −31.5 ppm.

No correction/erratum was located in the inspected sources. Treat this as an unresolved source-version/metadata conflict. Do not silently substitute the landing-page abstract value for the published PDF value, or vice versa. The arithmetic check is metadata QA only, not a physical model calculation.

## 6. Explicit measurement maps and formalization boundary

The source defines a concrete chain:
1. source/test-mass geometry and measured mass properties;
2. gravitational torque as a function of source-mass angle;
3. torsion-strip/pendulum response;
4. either free-deflection angular readout or electrostatic-servo torque readout;
5. four configuration-level G estimates with shared covariance;
6. Bayesian consensus `μ`;
7. a separate future CODATA evaluation.

This is a local measurement chain followed by a global evaluation chain. The configuration-specific `λ_j` and dark uncertainties are statistical nuisance/model-discrepancy terms, not evidence for a new physical responsive medium. The NIST result is a calibration/constant source, not the P2 finite-core/contact system and not a direct H(s)H observable.

Existing formal work was checked rather than duplicated:
- Kestrel PR #846 remains OPEN/DRAFT/UNMERGED. Current PR head `8621ad41ce0360034d332c8b65b92e2fc668e139`; current PR-triggered run #42228381068 succeeded. The existing `KestrelReadoutComposition` module compiles generic conditional composition/injectivity results.
- Kestrel PR #873 remains OPEN/DRAFT/UNMERGED. Current PR head `1971e3d58a28f7c6de5cf024039dbcedb133121c`; current PR-triggered run #42153410233 succeeded. The build includes `KestrelKelvinVortexReadout`, `KestrelProjectedIncidence`, `KestrelIntersectionDimensionGate`, and `KestrelMovingSlice`.
- The earlier PR #873 run #41188625587 failed on an older head; the current PR head's later run is green. Do not carry the old failure forward as current.
- These are PR-triggered build results in their CI context, not a global axiom audit or physical validation. Tests, lint, nanoda, and global axiom audit were skipped/disabled in the inspected runs. The formal theorems check only their encoded statements; they do not establish source-to-model translation soundness or physical premises.
- No NIST-specific Lean module was created. The existing generic map-composition results are a conditional scaffold, not a formalization of the torsion-balance geometry, sensor calibration, covariance model, or CODATA adjustment. No local Lean, Lake, or Elan executable is installed; existing GitHub Actions remains the available compile route.

## 7. Lane 24 and campaign disposition

- P0 Code Grurple remains ACTIVE; no presentation-route trigger was observed.
- P1 November 9 cognition remains solely Orson-owned and NOT READY. No P1 work, manuscript, review, or ownership was changed.
- P2 November 30 measured-system geometry remains HOLD; no physical system was selected.
- P3 December 14 full-theory paper remains separate and incomplete.
- The existing air-water/Kelvin-vortex candidate profile remains candidate-only. Calder's existing Kelvin source-sign and PRL data-access addenda were read; this report does not duplicate or amend that work.
- The NIST torsion-balance measurement is not a P2 system selection. It is a CODATA/G provenance source.
- No numerical comparison by this run, physical calculation, parameter fit, H(s)H prediction, or observational validation was performed. No SAT-O or Blockwave equation was modified. No WWRD climbing-rope equivalence or universality is asserted.

## 8. Tool and source checks

- HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES front-door/onboarding materials were read.
- Math Hopper #578 remains an existing open work item; code presence does not establish a completed smoke test or three-repository pilot.
- Whirligig Kernel 0 remains a sandbox, not a production physical solver.
- SciSpace was used as an already available discovery/extraction app. No new tool, paid service, dependency, branch, fork, PR, issue, or automation was created.
- No local Lean/Lake/Elan is installed.
- The existing Kestrel PRs were inspected; no changes were made to another worker's PR or workspace.

## 9. Unrelated reading and return cursors

A deliberate unrelated-reading break was completed in Kenneth Grahame, *The Wind in the Willows*, Project Gutenberg eBook #289. Actual extent: lines 123–162 of Chapter I, including the backwater, weir, Otter's arrival, and the passing wager-boat. This is literature, not H(s)H evidence.

- Unrelated reading return cursor: Project Gutenberg line 163.
- Existing Aldus archive cursor remains: `SAT Mark V/TheTANGLE.txt`, line 2091; not reset by the separate reading break.
- FIE last full review: 2026-10-27. Re-review is due on or after 2026-11-10; not yet performed in this slot.

## 10. Publication and next action

This is an internal source-QC note. No public issue/PR was created: the landing-page/PDF conflict is unresolved, no raw NIST time-series package was retrieved, and no P2 system was selected. No duplicate publisher submission was attempted.

Next useful step, after P0 standdown and when an existing Mersearch lane is genuinely released: recover the NIST raw measurement package/version and covariance inputs (or obtain an authoritative NIST correction/clarification); keep the individual four-mode determinations separate from the Bayesian consensus `μ`; avoid feeding a CODATA-centered posterior back into CODATA 2026 as if it were an independent raw datum. Then, if a physical H(s)H comparison is authorized, freeze the source-defined geometry/readout maps, units, calibration, correlations, and independent holdout before calculating or predicting.

No task, task ID, schedule, phase, branch graph, paper gate, ownership, or BEDROCK theory status was changed.
