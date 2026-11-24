# Enheduanna h948:s2 | CODATA adjustment scope and evidence-status reconciliation

**Run key:** `REVROT3-19-20261011:948:s2`  
**Nominal slot:** 2026-11-19T12:24:00Z  
**Selected ring label:** Enheduanna (index 11)  
**Next deterministic label:** Tern Rook (index 12)  
**Execution class:** `ASSISTANT_LEVEL_SOURCE_GROUNDED_RECONSTRUCTION / NO_AUTHENTICATED_THREAD`

## 1. Identity, historical authority, and source boundary

The fixed-ring calculation is `h=948`, `seq=5h+2=4742`, and `4742 mod 19 = 11`. This is deterministic routing, not authentication of a ChatGPT instance or thread.

The current Enheduanna source-layer census and README were read. The only recovered direct Nathan instruction is broad archive-revival guidance to consider all archives when examining the Enheduanna case. It is not a standalone specialist charter. The source-critical remit in the workspace is an assistant-maintained reconstruction, not historical-worker testimony or Nathan Direct.

Existing-thread-first lookup was repeated through prior-conversation context and repository continuity. Personal-context retrieval surfaced a 2025 first-person Enheduanna roleplay in Ur (September 10–11), but no exact usable conversation ID or current thread pointer was recovered. The later “Interesting discovery shared” conversation is an embedded-dialogue container, not an authenticated Enheduanna worker thread. No new chat was created and no cross-thread delivery is claimed.

The underlying 2026-09-23 MARLOWE raw export is in the HSH_RESOURCES boundary. Its locator and message ID are recorded in the existing source genealogy, but the restricted raw payload was not opened. The current source census remains the controlling operational boundary.

## 2. CODATA 2022 source/version and adjustment architecture

**Controlling evaluation:** Mohr, Newell, Taylor and Tiesinga, [*CODATA recommended values of the fundamental physical constants: 2022*](https://doi.org/10.1103/RevModPhys.97.025002), Rev. Mod. Phys. 97, 025002 (2025). The companion [Journal of Physical and Chemical Reference Data publication](https://doi.org/10.1063/5.0279860) is 54, 033105 (2025). These are two publication venues for the same CODATA 2022 evaluation, not independent experimental confirmations.

**Current NIST database:** [Standard Reference Database 121](https://physics.nist.gov/cuu/Constants/), Web Version 9.0, dated 2024-05-09 ([NIST version history](https://physics.nist.gov/cuu/Reference/versioncon.shtml)). As of 2026-11-19, the 2022 recommended set remains the latest published CODATA set. NIST's [next-adjustment notice](https://physics.nist.gov/cuu/Constants/) sets the input-data publication cutoff at 2026-12-31; CODATA's [official programme page](https://codata.org/initiatives/data-science-and-stewardship/fundamental-physical-constants/) says the 2026 adjustment results will be made available in early 2027. No 2026 recommended set is claimed here.

### 2.1 The 79-versus-80 count is a scope distinction, not an 80-parameter global fit

The paper's main least-squares adjustment uses **133 input data and 79 adjusted constants**, hence 54 degrees of freedom:

`133 - 79 = 54`.

Newtonian `G` is explicitly treated separately because it is independent of the other adjusted constants. Its separate evaluation is a covariance-aware weighted mean of **16 determinations**, with three nonzero input correlations. It has one estimated mean and therefore 15 degrees of freedom:

`16 - 1 = 15`.

Table XXIII's broader catalogue says “55 of 80” adjusted constants and includes `G` as its first entry. The paper's separate `G` evaluation supplies the one additional value beyond the 79 parameters in the main global adjustment:

`79 main-adjustment constants + 1 separately adjusted G = 80 catalogue entries`.

Therefore **80 is not the number of parameters in the 133-input main least-squares system**. It is the broader table-level count including the separately evaluated `G`. The paper's Table XXXII also includes `G` among the recommended values, while Section XV and Table XXX describe its separate evaluation.

This resolves the apparent count discrepancy without changing or “correcting” the source.

### 2.2 Measurement, covariance, and uncertainty treatment for G

The 2022 evaluation's `G` input set contains 16 published determinations and three reported nonzero correlations:

- NIST-82 / LANL-97: `0.351`
- HUST-05 / HUST-09: `0.134`
- HUST-09 / HUSTT-18: `0.068`

The measurement methods are heterogeneous (including torsion-balance, atom-interferometric, and other apparatus families); the CODATA paper's Table XXX identifies the methods and the source publications. The three correlations are part of the input covariance and must not be discarded by treating all 16 values as independent.

The paper retains the `G` uncertainty expansion factor `k=3.9`, reports `chi^2=12.9` for 15 degrees of freedom, upper-tail `p=0.61`, and Birge ratio `0.93`. It states that the 16 `G` determinations and their three correlations were unchanged from the 2018 closing data set; consequently, the 2022 recommended `G` value is unchanged from 2018. The recommended value is `6.67430(15) × 10^-11 m^3 kg^-1 s^-2`, with relative standard uncertainty `2.2 × 10^-5`. This is an evaluated weighted mean, not one new laboratory measurement.

For the main adjustment, the paper separately reports 133 inputs, 79 adjusted constants, and 54 degrees of freedom. It discusses expansion factors `1.7` for specified input groups and `2.5` for the D1–D6 group; those factors are not interchangeable with the separate `G` factor `3.9`.

### 2.3 Existing formalization reused

Mira's existing [PR #1306](https://github.com/Satobloc/HsH/pull/1306) was inspected rather than duplicated.

- Exact PR head: `7e6cdf625adea090fdb3905ea152d5e70f913702`.
- Exact-head Actions run: [#41636346096](https://github.com/Satobloc/HsH/actions/runs/41636346096).
- Job: `125918561757`.
- Lean 4.34.0 / Lake 5.0.0; the formal-library build completed successfully.
- Module: `FORMAL_VERIFICATION/HsHVerification/CODATACovarianceScaling.lean`.
- The module proves the conditional algebra that common positive expansion of standard uncertainties by `k`, with covariance entries expanded by `k^2`, preserves the correlation coefficient. It also includes exact-rational evaluation checks for the three published rounded `G` correlations.

The PR remains OPEN / DRAFT / UNMERGED and is based on the existing verification infrastructure branch, not merged main. This is an actual prior exact-head Lean build, not a new local run. No Lean or Lake executable is installed in this runtime. No new theorem or PR was created because the existing formalization already covers the relevant covariance-scaling identity and the new finding is source-scope accounting.

**Proof limit:** Lean checks only the encoded algebra. It does not prove that the CODATA input correlations, uncertainty expansion factors, laboratory methods, or source-to-formal translation are correct.

## 3. New method lead: preferential-median reanalysis is not a new measurement

SciSpace discovery surfaced a 2026 IEEE Transactions on Instrumentation and Measurement article, *Preferential Median as a New Estimator for Adjustment of the Newtonian Gravitation Constant Value*, DOI `10.1109/TIM.2026.3701185`.

The accessible abstract/metadata state that the method is applied to CODATA 2018 adjustment data and reports a lower uncertainty using an alternative interval-fusion/preferential-aggregation estimator. The full text and its detailed covariance/coverage treatment were not available in the inspected SciSpace result and were not independently audited here.

Classification: `METHOD_PROPOSAL / REANALYSIS_OF_CODATA_2018_INPUTS / NOT_AN_INDEPENDENT_MEASUREMENT / NOT_AN_OFFICIAL_CODATA_RECOMMENDATION`.

Its reported uncertainty must not be compared with CODATA 2022 as though it were a new experiment or an independent measurement. Before any comparison, inspect the full estimator, the exact 2018 input set, dependence/correlation treatment, coverage properties, and whether the reported uncertainty has the same meaning as CODATA's expanded standard uncertainty.

The existing Hale h898 and Aldus h852 audits already reproduce or discuss the official separate `G` weighted-mean evaluation and the covariance-scaling preprint. Those calculations were reused as prior work and were not repeated.

## 4. Lateral source-reading break

A deliberate non-physics reading was completed using Sophus Helle's annotated translation, [*The Exaltation of Inana*](https://enheduana.org/exaltation/).

**Read extent:** poem lines 1–15, 27, 93–95, 107–115, and 138–150, including the site's textual-basis notes.  
**Next cursor:** line 151.

This is a modern annotated translation, not a direct tablet image or a complete independent collation. Its notes identify the Delnero score edition, Zgoll's manuscript work, and Attinger's translation/commentary. Line 138's final verb has multiple manuscript readings; the existing Enheduanna source note already records the variants. The reading reinforces the source-critical limit: a translation's selected reading is not automatically an uncontested autobiographical statement by the ancient author. No new variant count or intentional-polysemy claim is made.

## 5. Archive/tooling reconnaissance and limits

- **Mersearch:** no callable Mersearch action is exposed in this runtime. All four canonical request lanes were re-read and remain `requested`; no lane was overwritten, retriggered, released, or newly submitted.
- **Fallback:** bounded GitHub search was used in HsH and the public SAT archive. This is navigation evidence, not a Mersearch execution or an exhaustive absence claim.
- **HSH_RESOURCES:** root README and repository metadata only; no restricted source payload or private index was opened.
- **SAT archive onboarding:** root README was read. Its referenced `AI` directory is not present at the current main tree path, so that pointer is stale; the repository's root navigation and `..findex.txt` remain available.
- **Math Hopper:** existing `tools/archive_math_hopper.py`, its panorama, and issue #578 were checked. The three-repository pilot remains CONFIGURED_NOT_VERIFIED; the hopper is extraction/provenance tooling, not a proof engine.
- **Whirligig:** existing sandbox, hostile reviews, and current priority were checked. It was not used for this CODATA source-count task and no physical equivalence is inferred.
- **Lean:** existing PR #1306 reused; no local Lean/Lake executable and no local full repository checkout.
- **SciSpace:** available and used for literature discovery; the IEEE paper's full text was not retrieved.
- **Forks:** the GitHub connector did not allow the public forks endpoint; no fork inventory is claimed.
- No new tool, dependency, fork, subscription, paid API, or external service was created or purchased.

## 6. Project and governance state

- **P0 Code Grurple:** ACTIVE. Existing reader/presentation repair remains unmerged; no deployment, route probe, manuscript edit, or standdown.
- **P1 Orson cognition:** OVERDUE / NOT READY / ORSON-OWNED. No P1 manuscript, protocol, dataset, owner, or paper gate changed.
- **P2 November 30 measured-system paper:** HOLD. No final measured system was selected and no raw physical data were acquired in this run.
- **P3 December 14 full-theory paper:** INCOMPLETE.
- **November 9 minor gate:** MISSED.
- **FIE:** last full review recorded November 10; next review November 24, so no stale-triggered full rereview was due.
- **Task graph:** ACTIVE_SEED, 16 declared branches and 18 records; discrepancy unresolved. No graph mutation.

No physical calculation, CODATA numerical comparison, fit, H(s)H prediction, independent measurement, or theory promotion was performed. The CODATA source reconciliation is a prerequisite correction, not an empirical result for H(s)H.

## 7. Scheduler and handoff

No automation, task ID, prompt, phase, schedule, cadence, enabled state, or task graph was changed; no sixth task was created. The current automation lookup did not expose the task record in this execution context, so no fresh scheduler readback is claimed.

Next deterministic ring label is Tern Rook, h948:s3. Personal-context lookup did not establish an authenticated current Tern thread. This report is a repository-published optional context artifact, not a direct message, task assignment, consumption, acknowledgment, or ownership transfer.

**Final status:** `CODATA_79_80_SCOPE_RECONCILED / G_SEPARATE_16_INPUT_WEIGHTED_MEAN / EXISTING_PR1306_LEAN_BUILD_REUSED / IEEE_PREFERENTIAL_MEDIAN_CLASSIFIED_AS_2018_REANALYSIS / NO_NEW_PHYSICAL_CALCULATION / P0_ACTIVE / P2_HOLD / PUBLISHED_VERIFIED_PENDING_READBACK`.
