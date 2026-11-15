# Aldus h852:s2 — CODATA source freshness, prior dependence, and schedule reconciliation

**Run key:** `REVROT3-19-20261011:852:s2`  
**Nominal slot:** 2026-11-15T12:24:00Z  
**Selection:** h=852; seq=4262; ring index 6 = Aldus; next ring index 7 = Calder. This is a deterministic ring label, not authentication of a historical Aldus or Calder instance.  
**Disposition:** `CODATA_SOURCE_FRESHNESS_CONFIRMED / OFFICIAL_MEETING_SCHEDULE_CONFLICT / NIST_LANDING_PAGE_STALE / EXISTING_LEAN_BUILDS_REVERIFIED / P2_HOLD / NO_NEW_PHYSICAL_RESULT`.

## 1. Historical remit and identity boundary

The historical Aldus source is conversation `6a9dea2e-bb98-83ea-a74f-4beb4baa3153`, raw export path:

`DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.09.06•26.09.08•Aldus [AUTO H(s)H Gitter] — raw (2).json`

Raw Git blob: `2f5ea91a449446f64d298b50b0c2ef0d8533900a`.

The prior source-grounded h844 receipt records 47 user-role messages and direct user-role anchors `939e981d-72ec-451b-81a3-f0a07b3a2c48` and `fcff5c18-85c4-4efc-b7e5-df7ee20c0646`, supporting a broad cross-reader/synthesizer remit: read across unrelated subjects and archive areas, combine information not usually combined, notice possible structural connections without forcing a premature theme, and preserve competing hypotheses and source distinctions. No standalone signed specialist charter was found. The narrower “Ensemble Methodologist and Context Architect” title was an assistant proposal Nathan rejected.

The raw export fetch in this run returned no content payload, so the historical role is carried forward from the earlier raw-source parse and h844 receipt, not newly re-transcribed. No authenticated currently usable Aldus thread or run-level chat reference was found. This is source-grounded scheduled work, not participation by the historical Aldus instance.

## 2. Live controls and current project state

Read on HsH main: BEDROCK; the 2026-11-08 Primary Operational Guideline; Steering Charter 2026-10-26; Three Paper Campaign; New Instance Start Here; three-repository onboarding; Revival Rotation V3; thread-routing and scheduler authority; active automation roster; current workflow orientation; worker-upkeep protocol; PWH action queue; Aldus BOOT/CURRENT_WORK; and the latest relevant receipts. The Primary Operational Guideline controls over directly conflicting BEDROCK wording; FIE remains foundational.

Repository front doors were checked:
- HsH main.
- SAT_THEORY_ARCHIVE_2023-25 root README.
- HSH_RESOURCES root README only. Its explicit private-reference boundary was honored; no payload was opened.

HsH main head before this report's writes: `0fbccba225d43d6e5f6cd56d6fe9213ceb940aca`. The latest commit at that point was an automated change to `PUBLIC_SITE/generated/discovery.json` only. The current snapshot blob is `ee91749497b2f9e496abcd9044db4f98706d99a5`; the GitHub file connector returned an empty content payload for this 26-MB-scale generated file, so no current record counts or Paper A/B record-level assertions are made from it.

The source-level P0 mismatch remains: current `tools/site_discovery.py` does not implement the Reader Routing Registry's default-deny treatment of WORKSPACES, and the current discovery test explicitly permits a WORKSPACES Markdown record. Relevant current blobs:
- Builder `97ff9c6d00544251c05bd6bb6053907805438f3e`
- Test `4d646dba614f50b912391c13cd516616700d2ac3`
- Reader Routing Registry `277a94c553e2e17b61bb046a04781b4e44f2229f`
- Presentation Gate `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`

Issue #1747 remains OPEN and canonical. Tern retains P0 authority. The current generated JSON was not parsed, and live reader-route behavior remains unobserved. No P0 repair, route probe, site edit, manuscript edit, or standdown was performed.

Task graph remains 18 records against 16 declared branches; no graph mutation. Current campaign:
- P0 Code Grurple: ACTIVE.
- P1 cognition, Orson-owned: OVERDUE / NOT READY.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
FIE was last fully reviewed November 10; next rereview November 24.

## 3. CODATA 2022 remains the current recommended release

NIST's live version-history page states that Version 9.0, dated 2024-05-09, contains the 2022 CODATA recommended values and is the latest available release as of this check:

https://physics.nist.gov/cuu/Reference/versioncon.shtml

The controlling adjustment paper is Mohr, Newell, Taylor and Tiesinga, *CODATA recommended values of the fundamental physical constants: 2022*, Rev. Mod. Phys. 97, 025002 (2025), DOI 10.1103/RevModPhys.97.025002. It uses data available through 2022-12-31. For G, the existing HsH audit records 16 input measurements, three nonzero input correlations (0.351, 0.134, 0.068), a separate covariance-aware weighted-mean evaluation, and an uncertainty expansion factor of 3.9. The recommended value is 6.67430(15) × 10^-11 m^3 kg^-1 s^-2, with relative standard uncertainty 2.2 × 10^-5. These are evaluation properties, not a single laboratory measurement.

No CODATA 2026 recommended-value release was found. The official CODATA page states a 2026 adjustment closing date of 2026-12-31 and results early 2027:

https://codata.org/initiatives/data-science-and-stewardship/fundamental-physical-constants/

## 4. New public-source schedule discrepancy for the CODATA-TGFC meeting

Two official public sources disagree on the 2026 CODATA-TGFC meeting date:

- The CODATA page says the 2026 meeting “will be held” at BIPM in September 2026.
- The BIPM meeting record lists a meeting on 5–6 November 2026:
  https://www.bipm.org/en/committees/ot/n/a/wg/codata-tgfc/2026-11-05
- The BIPM meetings index also lists 5–6 November:
  https://www.bipm.org/en/hosting/codata-tgfc/meetings

The BIPM meeting record exposes “Working documents” only after login. No minutes, working papers, draft adjustment, or post-meeting outcome were publicly accessible in this check. The BIPM index's “Upcoming Meeting” label is also stale relative to the current date (November 15), while the CODATA page retains the September date. This is recorded as an official schedule/status discrepancy, not evidence that the November meeting occurred, was cancelled, or produced any particular decision.

The NIST 2026 G paper was published April 16, 2026, before the stated December 31 input cutoff, so it is eligible for consideration in the 2026 adjustment. Eligibility is not evidence of inclusion or weighting.

## 5. NIST 2026 G paper: source-version conflict persists

Primary source: Schlamminger et al., “Redetermination of the Gravitational Constant with the BIPM torsion balance at NIST,” Metrologia 63 (2026) 025012, DOI 10.1088/1681-7575/ae570f. The final NIST-hosted PDF is pub_id=961075:

https://tsapps.nist.gov/publication/get_pdf.cfm?pub_id=961075

The NIST publication landing page was created April 16 and updated May 2, 2026. It still displays:
- G = (6.67366 ± 0.00020) × 10^-11 m^3 kg^-1 s^-2;
- relative standard uncertainty 3.0 × 10^-6;
- the statement that this is an independent verification.

The final journal PDF and NIST news release instead report:
- G = (6.67387 ± 0.00038) × 10^-11 m^3 kg^-1 s^-2;
- relative standard uncertainty 5.7 × 10^-5.

The NIST news release is dated April 16 and updated May 5, 2026:
https://www.nist.gov/news-events/news/2026/04/nist-weighs-mystery-gravitational-constant

The PDF's publication history and final Table 19/Equation (64) are controlling for the published result. The NIST landing-page abstract remains stale as of November 15. No correction or erratum was located. This is the already-published source-version conflict in HsH issues #1308 and #1354, not a new issue.

A scripted metadata-arithmetic check gives:
- landing-page absolute/central ratio: 0.00020 / 6.67366 = 2.9968563 × 10^-5, not 3.0 × 10^-6;
- final-PDF ratio: 0.00038 / 6.67387 = 5.6938478 × 10^-5, consistent with 5.7 × 10^-5;
- landing-page central value relative to the final-PDF value: −31.466 ppm.

These are arithmetic consistency checks on displayed source metadata, not a physical calculation, fit, or independent measurement.

## 6. Measurement and evaluation dependency map

The final PDF reports torque data collected 2024-01-24 through 2024-06-22. The measurement chain uses the transferred BIPM Mark II torsion balance, finite source/test-mass supports, dimensional metrology, mass integration, two native readout modes (free deflection and electrostatic servo), and four configuration-level G determinations. Eight torque differences are reported in Table 15; the four final G summaries are correlated in Table 18. Shared mass-integration and autocollimator-nonlinearity contributions produce positive inter-configuration correlations.

The final consensus is not a simple weighted mean. The authors use:
- G_j = μ + λ_j + ε_j;
- λ distributed as a zero-mean multivariate normal with Σ_ij = τ_i τ_j R_ij;
- configuration-specific dark-uncertainty terms;
- a Gaussian prior for μ centered on CODATA 2022 G = 6.6743 × 10^-11, with standard deviation 9 × 10^-15;
- independent half-Cauchy priors for the four τ_j, with medians ranked by expert assessment.

The NIST prior SD is six times the CODATA 2022 standard uncertainty (1.5 × 10^-15). It is therefore broad relative to the CODATA uncertainty, not a hard pin, but the posterior consensus is still statistically dependent on the CODATA-centered prior. The final paper also explicitly says the determination is “not entirely independent” because C. C. Speake contributed to both the BIPM and NIST efforts, in addition to the shared apparatus lineage.

Therefore:
- the four NIST configuration summaries are correlated measurements from one apparatus/calibration chain;
- the final NIST posterior consensus is model-conditioned and CODATA-prior-dependent;
- the NIST replication is not a fully independent apparatus replication of BIPM;
- the final posterior should not be passed into CODATA 2026 as though it were an independent raw datum;
- a future CODATA input review should inspect the underlying configuration estimates, their covariance, the Bayesian prior, and the BIPM lineage before deciding what input representation is admissible.

The published forward measurement equation is N(Δφ) = G · [8 m_s m_t / R_s] · Γ(Δφ), where Γ is a dimensionless finite-mass geometry factor. This is a source-defined laboratory torque/readout chain, not an H(s)H equation. No H(s)H projection, composition map, or observable prediction was supplied.

## 7. Existing secondary analysis and formal work reused, not duplicated

Aster's November 6 source delta already records Vineet Kumar's arXiv preprint 2610.04707, “Covariance scaling and a dual-mode torque diagnostic in measurements of the gravitational constant” (submitted 2026-10-03, updated 2026-10-06). It is a secondary analysis, not a new measurement or CODATA evaluation. It excludes BIPM-14 in its primary historical fit due to apparatus lineage, estimates λ̂=2.967 for 15 historical measurements, and reports that the NIST four-configuration vector is unremarkable under its declared uniform covariance-scaling convention (Qλ=4.840, finite-sample F-tail p=0.382), while a mean-only scaling sensitivity leaves it discrepant. Its four-point torque-offset diagnostic reports 1.918 ± 0.215 pN m under an independent-Type-A approximation. Cross-covariance with the historical data is not published, the four torque differences share one apparatus, and the preprint does not identify the offset mechanism or propose a new G value. The abstract says code will be uploaded; no public code repository was verified in this run.

Existing formal modules were rechecked through actual PR-head Actions logs:

**PR #1306 — CODATA covariance scaling**
- PR head: `7e6cdf625adea090fdb3905ea152d5e70f913702`.
- Actions run #41636346096, job #125918561757.
- Lean 4 verification completed successfully; root build completed 8,945 jobs.
- Module `HsHVerification.CODATACovarianceScaling` built and executed its rational checks (351/1000, 67/500, 17/250).
- The two module theorem reports list `propext`.
- The full log contains zero `sorryAx` and zero `admit` occurrences. This is not a global project axiom audit; no separate tests/lint/nanoda/whole-project audit was run.
- PR remains OPEN / DRAFT / UNMERGED.

**PR #1387 — four-cell factorial contrast identifiability**
- PR head: `2214b0c5492f0c4844e6cc6214ff2aabc253b2c6`.
- Actions run #42595895210, job #129088306392.
- Lean 4 verification completed successfully; root build completed 8,946 jobs.
- Module `HsHVerification.FactorialContrastIdentifiability` compiled its four-cell inverse/reconstruction, bijectivity, and first-harmonic nuisance-span statements.
- The theorem-specific axiom reports list `propext`; the full log contains zero `sorryAx` and zero `admit`.
- Linter warnings remain for an unused `ring` tactic and a `<;>` style suggestion. No separate tests/lint/nanoda/whole-project axiom audit was run.
- PR remains OPEN / DRAFT / UNMERGED.

These are two separate PR-head builds, not one combined integration build. The four-coefficient/four-summary factorial map is saturated at the four aggregate cells; the primary paper's raw acquisition reports eight torque differences. The Lean modules prove only their encoded conditional algebra. They do not validate the NIST measurement, source-to-code translation, covariance premises, CODATA evaluation, or any H(s)H map.

No new Lean module, branch, PR, build, or physical calculation was created. Existing issues #1308, #1354, #1362, #1432, #1435 and #1438 already cover the primary source audit, finite-geometry analysis, four-cell contrast, acquisition-level identifiability, and Table-15/prior-dependence work. No duplicate issue or publisher submission was created.

## 8. Mersearch, tooling, and research boundaries

All four canonical Mersearch lanes remain occupied/requested. No callable Mersearch action was available in this runtime. No request was overwritten, retriggered, released, or replaced. GitHub/public-web retrieval was not represented as Mersearch.

No new tooling was built. Existing Math Hopper #578 and Whirligig Kernel 0 remain existing work items; no smoke test, production solver, dependency, fork, subscription, or cost was added. No SAT-O/Blockwave equation was transcribed or modified. No WWRD rope equivalence or universality is asserted.

Lane 24 remains source-audit only / P2 HOLD under the active P0 interlock. No physical calculation, fit, H(s)H prediction, CODATA numerical comparison, independent measurement, P2 selection, paper-gate advancement, or BEDROCK theory promotion was performed.

## 9. Unrelated reading and return cursor

SAT archive `SAT Mark V/TheTANGLE.txt`, Git blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 1801–1840 were read. This is a flattened creative-language transcript containing the invented term “Whohow”; textual “You said” / “ChatGPT said” labels are not raw role metadata. It is unrelated reading, not theory evidence or Nathan Direct attribution.

- Next unrelated-reading cursor: line 1841.
- FIE last full review: 2026-11-10.
- Next FIE rereview: 2026-11-24.

## 10. Scheduler and final boundaries

The existing :24 task `6abda4c8eda88191bf23a6f2849e9a17` was privately read by exact ID and remains enabled with the exact original hourly America/New_York schedule:
`DTSTART;TZID=America/New_York:20261001T142400`, `RRULE:FREQ=HOURLY`.
Current run record: `48edf5ad-5e5c-8321-be1d-970dd09308c5`, scheduled 12:24Z, started 12:20:54.644739Z, last recorded `IN_PROGRESS`, completion null, chat_ref null. The task-level last_run_time still points to the preceding completed run; this was not treated as a cause or repaired. No task ID, title, prompt, schedule, phase, cadence, enabled state, or automation count changed. No sixth task.

No Calder handoff was created because this source-freshness result creates no actionable task within Calder's protected geometry remit. No direct-thread delivery, consumption, or acknowledgment is claimed.

**Final classification:** `H852_S2_ALDUS / CODATA_SOURCE_FRESHNESS_CONFIRMED / OFFICIAL_TGFC_MEETING_DATE_CONFLICT / NIST_LANDING_PAGE_STALE / PRIOR_AND_APPARATUS_DEPENDENCE_EXPLICIT / EXISTING_LEAN_HEAD_BUILDS_REVERIFIED / P0_ACTIVE / P2_HOLD / NO_NEW_PHYSICAL_RESULT / NO_DUPLICATE_PUBLICATION / AUTOMATION_UNCHANGED`.
