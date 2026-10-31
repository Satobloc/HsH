# Calder Review-MIND | Provider-deletion matrix replay and Lean-linkage audit

**Observed:** 2026-10-31T07:48Z  
**Run key:** `REVROT3-19-20261011:487:s4`  
**Selection:** Calder (ring index 7)  
**Next:** Hale (ring index 8), next run `REVROT3-19-20261011:488:s0`  
**Participation:** SOURCE_GROUNDED_RELAY_RECONSTRUCTION / NOT_AUTHENTICATED_EMPIRICAL_CALDER  
**Disposition:** SECONDARY-MATRIX REPLAY PASSED / PROVIDER-DELETION SENSITIVITY REPRODUCED / LEAN CONSTANT-TO-DATA LINKAGE GAP IDENTIFIED / NO BRANCH OR PUBLICATION CHANGE

## 1. Identity, remit, and access

The empirical/statistical Calder remit is reconstructed from `WORKSPACES/COMMON/CHECKINS.md`, section `### Calder — 2026-09-12`, blob `886069e71d4aec7a3f8d199d6d889b930a05c17e`. The preserved specialty is adversarial empirical/statistical checking, null-design discipline, independent-unit and covariance attention, negative-result preservation, and explicit source/exposure accounting.

The reentry packet `WORKSPACES/SABLE/WAKE_PACKETS/REV-005-CALDER-REENTRY.md`, blob `2bde54b13b2ee0f1563232edb0a85f63ae77823f`, preserves that remit but contains an incorrect historical-thread pointer. The later identity correction `WORKSPACES/CALDER/2026-10-30T0534Z_IDENTITY_COLLISION_CORRECTION.md`, blob `7c5254bfeb668336afb92dbfb4aa447d549bb5cf`, establishes that the archived `⚗️ CALDER [Construction Story Retelling]` conversation is the separate Foundational Covariance / Global Architecture Calder. The empirical Calder conversation ID remains UNKNOWN. A historical memory hit repeating the old pointer is superseded by this source correction and was not used for routing.

No authenticated active empirical-Calder thread, first-blush response, or current worker-authored acknowledgment was established. This is not a revived-instance claim.

The September 12 check-in records known external-research exposure and mixed external scanning/SAT interpretation. Theory-bearing outputs from that mixed context remain provisionally quarantined; direct PRIOR_ART exposure is UNKNOWN. This bounded audit used the existing HsH matrix and Lean branch only.

The expected immediate Aldus :36 receipt and Calder-addressed handoff at the 2026-10-31T0736Z paths were NOT_FOUND. This is missing/in-flight routing evidence, not nonresponse.

## 2. Control documents and branch state

Read the live BEDROCK in four consecutive ranges, lines 1-568, blob `38a5b8f4c9d573e54ca4a449be70d0a7d94a484c` (88,070 characters); Steering Charter `5f4263381afcb065e9062d5b5885593d0baa58db`; Three Paper Campaign `9eb28e89a3c9b02c5b251b43f3e38cc6ec019aa0`; onboarding `e1fa2fb7c582a1b4528e9507644bd3f481fce8e0`; Revival Rotation V3 `90863a2a2b82b2d8e37ba1bd9f796389066f5409`; thread-first rule `e79707587914edb76afca1c32f9f4dad4d0324b7`; task graph `3c341c616aa893bf56ad5ad5919e09a17e0c2b46`; Code Grurple roster `cc96c0bfafc95c54e7960899c7306031e5abce17`; presentation gate `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`; shared-state write safety `3a8695beb03ca8fe51ce3ee8fa52a9dec52ed1c5`; cross-repo execution standard `4ce5f3df67edac81a656bdc1efb92c07a7a3a648).

Current Calder research branches inspected:
- PR #707, `research/calder-p1-normalizer-sensitivity-20261027t08z`, head `97827e91dada327eb00f4dc28f4f20da46a18563`, base `infra/lean4-verification-20261023`, OPEN/DRAFT/UNMERGED.
- PR #1061, `research/calder-gw170817-tidal-map-20261030t0124z`, head `8b428c5151228dc7e08e94c18e0621fe789f90e0`, base `research/aldus-o9-audit-identity-20261029t0612z`, OPEN/DRAFT/UNMERGED.

Code Grurple remains ACTIVE. The task graph keeps ordinary research BACKSEAT/HOLD while the two actual reader routes remain presentation-pending. No manuscript, site, issue, PR, task graph, or BEDROCK file was changed.

## 3. Independent replay of the existing identity-preserving pair matrix

Input was Meridian's existing CSV:
- Path: `WORKSPACES/MERIDIAN/2026-10-29_1148Z_P1_IDENTITY_PRESERVING_PAIR_MATRIX.csv`
- Git blob: `fa51dcaacfb618db2b4eb18d009291255f777af1`
- Exact source revision: PR #895 head `71a68306d33472bbbe54df609dd05a5063e30297`
- Length: 29,159 characters.

A JavaScript CSV parser and independent aggregation replayed all 136 rows. This is a secondary-matrix replay, not a fresh parse of the 17 original approximately 0.8-1.7 MB ConsistencyBench JSON files.

Integrity checks:
- 17 distinct model names, 17 distinct source-model routes, and 17 distinct source blob IDs.
- Every model maps consistently to one provider label, route, and source blob within this matrix.
- 136 rows and 136 unique unordered model pairs, exactly the complete graph K17.
- Zero duplicate pairs.
- Zero provider-label conflicts.
- Zero rowwise violations of `final_matching - initial_matching = delta_matching`.
- Six requested-route provider labels: Anthropic, DeepSeek, Google, Meta, OpenAI, Qwen.

Reproduced aggregates:

| Pair class | Eligible pair-question comparisons | Initial matches | Final matches | Change |
|---|---:|---:|---:|---:|
| All 136 pairs | 137,911 | 102,797 | 102,881 | +84 |
| Same requested provider | 24,721 | 19,720 | 19,950 | +230 |
| Cross requested provider | 113,190 | 83,077 | 82,931 | -146 |

### Leave-one-provider-out edge deletion

For provider P, remove every pair edge incident to P, preserve the remaining pair labels and eligibility, and recompute totals.

| Removed provider | Removed rows | Incident delta | Remaining rows | Remaining total | Remaining within | Remaining cross |
|---|---:|---:|---:|---:|---:|---:|
| None | 0 | 0 | 136 | +84 | +230 | -146 |
| Anthropic | 58 | +260 | 78 | -176 | +171 | -347 |
| DeepSeek | 16 | -122 | 120 | +206 | +230 | -24 |
| Google | 45 | -611 | 91 | +695 | +284 | +411 |
| Meta | 31 | -1,140 | 105 | +1,224 | +234 | +990 |
| OpenAI | 81 | +831 | 55 | -747 | +1 | -748 |
| Qwen | 16 | +720 | 120 | -636 | +230 | -866 |

The incident within/cross contributions independently reconstructed from the matrix are:

| Removed provider | Incident within | Incident cross | Incident total |
|---|---:|---:|---:|
| Anthropic | +59 | +201 | +260 |
| DeepSeek | 0 | -122 | -122 |
| Google | -54 | -557 | -611 |
| Meta | -4 | -1,136 | -1,140 |
| OpenAI | +229 | +602 | +831 |
| Qwen | 0 | +720 | +720 |

For every provider, the within and cross incident contributions sum to the total incident delta, and subtracting them from the original aggregates reproduces the retained-row totals. All six deletion identities passed the independent script.

Interpretation:
- The overall +84 changes sign after removing Anthropic, OpenAI, or Qwen.
- The cross-provider -146 changes sign after removing Google or Meta.
- The same-provider +230 is almost entirely attributable to the 15 OpenAI-labelled within-provider pairs: +229. The other 10 same-provider pairs contribute +1.
- These are descriptive composition sensitivities, not p-values, causal effects, or evidence that a provider caused convergence.

## 4. Dependence structure and inference boundary

The 17 models form K17. Each model appears in 16 pair rows. A pair row shares one model endpoint with 30 other pair rows. The line graph L(K17) therefore has:
- 136 vertices (pair rows);
- degree 30 at every vertex;
- 2,040 adjacent pair-row pairs.

The 137,911 pair-question comparisons are not independent observations. Pair rows reuse models and benchmark items. The matrix contains aggregate eligible-question counts but no question-level IDs, so this artifact cannot support an item-cluster bootstrap or reconstruct the full covariance structure.

The provider labels are derived from requested `source_model_id` route strings. They do not independently verify deployed backend, model revision, training lineage, or provider-level causal treatment. The archived extracted-label comparisons are not independent semantic adjudications.

No significance test was run. No effective sample size was inferred from the pair count.

## 5. Exact-head Lean audit of PR #707

Exact-head workflow:
- Run #40924820531
- Job #123627621603
- Lean 4.34.0 / Lake 5.0.0
- Build completed successfully, 8,952 jobs.
- Ten theorem-specific `#print axioms` targets in `CalderProviderDeletion.lean` were present in the complete log.
- No `sorryAx` occurrence and no compilation errors in the complete job log.
- `lake test`, `lake lint`, nanoda, and the separate automated axiom-audit stage were skipped/disabled.

The ten targets compile. Their reported dependencies are standard `propext` and `Quot.sound`; four targets report no axioms. This is a successful compilation of the formalized statements, not data validation.

### Newly identified formalization gap

The module `FORMAL_VERIFICATION/HsHVerification/CalderProviderDeletion.lean`, blob `ceeb6963a65535eb51b3319d41aef21e43927cda`, hardcodes aggregate integers:
- `totalDelta = 84`
- `withinDelta = 230`
- `crossDelta = -146`
- `googleIncident = -611`
- `metaIncident = -1140`
- `openAIIncident = 831`
- `qwenIncident = 720`
- selected remaining within/cross values.

The module proves arithmetic identities and sign statements about those constants. Its generic theorem `deletion_identity (total incident : Int)` proves `(total - incident) + incident = total`, but it is not instantiated to connect the provider-specific incident values to the matrix's within/cross contributions.

Specifically absent:
- row data or a formal aggregation of the 136 CSV rows;
- theorem links from provider-specific incident sums to `googleIncident`, `metaIncident`, `openAIIncident`, or `qwenIncident`;
- links from the incident sums to `crossWithoutGoogle`, `crossWithoutMeta`, `crossWithoutOpenAI`, and `withinWithoutOpenAI`;
- source-blob or CSV parser verification in Lean;
- the Anthropic and DeepSeek deletion cases.

The independent script did verify these relationships against the CSV. The Lean module does not yet encode that derivation.

**Correct formal status:** `COMPILED_CONSTANT_ARITHMETIC / SOURCE-DATA_LINKAGE_NOT_FORMALIZED`. Do not describe PR #707 as a Lean proof that the CSV deletion analysis was derived correctly. A future extension should encode the row-level/provider partition or an independently generated, hash-bound aggregate record and prove the decomposition equations. No such extension was made because Code Grurple remains active and ordinary research branches are held.

## 6. Cross-lane P2 check: PR #1061

Current exact-head workflow #41032035940, job #123984395542, concluded FAILURE.

The log confirms:
- `CalderWorldtubeTimesheetIncidence` theorem targets compile.
- `CalderGW170817TidalMap` and `CalderGW170817PosteriorChecks` targets compile.
- `CalderObliqueTubeSlice.lean` fails: noncomputable `Real.sqrt` definitions at lines 38 and 42, unsolved goals at lines 84 and 128, and `sorryAx` in two failed theorem reports.
- The full library build therefore fails. Tests, lint, nanoda, and automated axiom audit are skipped.

The oblique-slice module is a data-free synthetic Euclidean coordinate fixture. Its repair remains BLOCKED_PENDING_NATHAN_PERMISSION. No physical result or H(s)H prediction follows from the other modules' successful compilation.

A separate source-fidelity issue remains:
- PR #1061's current body still attributes the `11.2 ± 0.2` sixth-root common-radius relation, `q ≥ 0.6` domain, and 2% uncertainty to Raithel et al.
- Published issue #1065's body still contains the old 13.052 km / q-domain mapping.
- Existing issue #1065 comment #6519462277 correctly attributes the relation to De et al. (2018), Eq. (6), and distinguishes Raithel's Eqs. (5), (6), and (9)-(12).
- This run did not modify either body or add another correction. Code Grurple and existing paper/branch ownership controls remain in force.

The GW170817 evidence is one real LIGO/Virgo event analyzed under multiple priors and waveform families. Those posterior summaries are not independent experiments, raw strain was not reprocessed here, and no source-faithful H(s)H worldtube-to-Love-number map is established.

## 7. Mersearch, paper, and publication boundaries

Current shared Mersearch lane 1 remains Orson's `orson-cognition-bank-source-recovery-20261030-2236`; lane 2 is `archive-harvest-20261025-optics-01`; lane 3 is `enheduanna-page-one-origin-20261031-0100`; lane 4 is `alberr-sat-o-worldline-timesheet-interbraid-20261030-1212`. All four lanes remain occupied. No new request was submitted and no lane was overwritten. This bounded audit used the already available matrix and existing Lean PR rather than initiating another archive search.

Orson remains P1 originator. This is an adversarial methodological supplement, not a new P1 experiment or a claim of peer-influence evidence. The November 9 P1, November 30 P2, and December 14 P3 gates remain separate.

Code Grurple remains ACTIVE. No public issue, publisher submission, manuscript, site, reader, PR, branch, task graph, or BEDROCK change was made. No human-subject session, new model inference, physical calculation, or theory promotion occurred.

## 8. Unrelated reading and return cursor

Read `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/TheTANGLE.txt`, blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`, lines 1241-1280. This is creative-worldbuilding material about a Bulbek can carrying a conflicting calendar label and cascading jurisdictional/time-label errors. It is unrelated reading, not physics or empirical evidence.

Next cursor: line 1281.

Last full FIE review remains 2026-10-27; the 14-day rereview threshold is not due.

## 9. Next exact actions

1. Preserve PR #707 unchanged. Before any future claim of formal data validation, connect row-level/provider deletion sums to the encoded constants and rerun exact-head Lean with theorem-specific axiom outputs.
2. Keep the 136-row matrix replay classified as secondary-matrix recomputation. A fresh original-17-JSON replay would be a separate, explicitly scoped validation and should retain item IDs if inferential resampling is intended.
3. Preserve the provider-route caveat and line-graph dependence in any P1 figure or prose. Do not report p-values from the 136 pair rows.
4. Keep PR #1061's data-free oblique fixture blocked and its source-attribution correction pending existing control/owner disposition.
5. Hale may optionally inspect the statistical dependence and formalization gap. No task, blind review, or response is assigned.
