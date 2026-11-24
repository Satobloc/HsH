# H1004:s3 | Compose product availability with the existing prediction hard gate

**Disposition:** `COMPOSITION_LAYER_ADDED / EXACT_HEAD_CHECKOUT_VERIFIED / FULL_BUILD_PENDING / P2_HOLD / NO_PHYSICAL_PREDICTION`

## 1. Selection and authority

- Nominal hour: h=1004.
- Sequence: 5(1004)+3 = 5023.
- Ring index: 5023 mod 19 = 7.
- Selected label: **Calder**, index 7.
- Next label: **Hale**, index 8.

The closest historical Calder specialist evidence is the September 12 self-report in `WORKSPACES/COMMON/CHECKINS.md`. It describes empirical angle-clustering, adversarial null design, independent-unit discipline, statistical calibration/covariance, and source/provenance separation. No standalone signed Nathan-authored Calder charter was located. The separate same-name covariance/Construction-Story Calder material is not treated as evidence for this remit.

This is assistant-level, source-grounded reconstruction. Deterministic ring selection does not authenticate a historical Calder instance or the current ChatGPT thread. No authenticated current Calder thread binding was recovered, and no cross-thread participation or delivery is claimed.

## 2. Substantive architecture improvement

Extended existing draft [PR #2167](https://github.com/Satobloc/HsH/pull/2167), reusing the Calder Lean project. No new branch or PR was created.

The existing `AnalysisReadiness` contract answers whether a versioned measured product has actually been acquired and characterized for analysis. It does not, by itself, establish that a falsifiable H(s)H prediction and holdout protocol have passed.

An initial implementation duplicated the detailed prediction/holdout fields already formalized in [PR #1487](https://github.com/Satobloc/HsH/pull/1487). After reading that PR's actual `ModelSelectionPreference.hardGate`, I removed the duplicate field-level contract and replaced it with a smaller proposition-valued composition interface:

`evaluationAdmissible data predictionHardGate := analysisReady data = true ∧ predictionHardGate`.

This is the substantive improvement: measured-product availability and prediction admissibility are now separate composable gates, without creating two competing definitions of the prediction protocol. When the existing branches are integrated, the prediction argument can be supplied directly as `ModelSelectionPreference.hardGate candidate`. No cross-branch import or integration is claimed in this PR.

The existing prediction hard gate already carries source admissibility and composable maps; identified/versioned measurement, units and uncertainty; a matched standard comparator; nuisance-adjusted identifiability; frozen shared parameters; an authenticated acquisition-unit map; a partition respecting that map; untouched and unrefitted holdout; an independent holdout result; a declared observable; a prediction frozen before holdout access; and a predeclared falsification rule with a threshold justified by uncertainty.

The new Calder composition layer proves:
- a data-ready record alone does not imply evaluation admissibility when the independent prediction gate fails;
- evaluation admissibility implies analysis readiness;
- evaluation admissibility implies the supplied prediction hard gate;
- the current GW241011 O4-v1 metadata record blocks evaluation because its product-analysis gate is not ready.

The abstract counterexample is a logical proposition witness, not a physical fixture, synthetic dataset, numerical calculation or measurement. The interface is declarative; it does not itself enforce holdout access controls.

## 3. Actual Lean verification

Existing PR branch: `research/calder-versioned-product-coverage-20261120t0636z`.

- Previous branch head: `221a4d8b30b5ad7e670bc79f5651b7310da157ee`.
- Final composition-layer head: `91b70e4964065769905ba67f59f6732fe883adf5`.
- Changed module: `FORMAL_VERIFICATION/HsHVerification/CalderVersionedProductCoverage.lean`.
- No local Lean/Lake/Elan installation; existing repository Actions workflow is the verification route.
- Final exact-head run: [#44948493140](https://github.com/Satobloc/HsH/actions/runs/44948493140).

**Final build status at report preparation:** the exact-head checkout identity assertion has passed for `91b70e4`; the full formal-library build remains in progress. No final build conclusion or theorem-specific axiom output is claimed yet. Do not attribute the earlier successful run #44947993783 to the final head; it compiled the superseded duplicate-field draft at `221a4d8`.

PR #2167 remains OPEN / DRAFT / UNMERGED, stacked on existing PR #1515, not main. At the latest branch readback, main was `b41fa840ffd7040967e91723dcdc42cfea93a148`; the current main-vs-head comparison is 127 commits ahead and 25,410 behind main. No rebase, retarget, merge or BEDROCK promotion was attempted. This integration distance is a material review constraint.

Lean checks only the formalized logical composition and theorem statements. It does not authenticate GWOSC source bytes, validate physical premises, establish calibration validity or statistical independence, or prove any H(s)H geometry-to-observable map. Tests, lint, leanchecker, nanoda and global axiom audit are separate checks and must not be inferred from compilation.

## 4. Why this matters for P2

The existing GW241011 O4-v1 audit remains a source/API metadata stress case, not the selected P2 system.

The source audit records:
- eight H1/V1 legacy strain-file locators in O4 Discovery Papers v1;
- empty API-v2 early-release strain-file and timeline collections for the named event-version scopes;
- no raw strain bytes acquired;
- no acquired-byte SHA-256;
- no bound calibration version, PSD version, data-quality segments or joint covariance.

The prediction gate also remains uninstantiated for this event:
- no source-bound H(s)H equation set;
- no finite-core/source-geometry-to-observable map;
- no explicit projection/readout composition;
- no instantiated frozen candidate family;
- no versioned standard comparator with applicability domain and shared parameters;
- no acquisition-unit map or calibration/holdout split;
- no locked independent holdout;
- no frozen predicted observable;
- no joint uncertainty model or falsification threshold.

The standard comparator family is GR/BBH waveform analysis, but no new comparator implementation or comparison was run. A generic comparator label is not a calibrated model.

The composition layer blocks evaluation even before the existing data gate is satisfied. It prevents a locator, an empty endpoint response, or a downloaded file from being mistaken for a falsifiable H(s)H test.

The separate geometry-first paper/Factory Floor gate still requires a precise source-faithful geometric plot and independent hostile review. Prediction admissibility does not satisfy that presentation/review gate.

**No P2 system was selected. No raw data were downloaded or analyzed. No physical calculation, fit, H(s)H prediction, independent measurement or numerical falsification threshold was produced. P2 remains HOLD.**

## 5. Mersearch and workflow-health findings

No callable Mersearch action was exposed in this runtime, and all four existing request lanes were occupied. No request was overwritten, released, rerun or repurposed.

The existing bridge runs were inspected read-only:

| Lane | Request/run | First failing or completing transition |
|---|---|---|
| 1 | `calder-angle-geometry-source-fidelity-20261102-1337`; run #41454976148 | Three repository checkouts and input capture succeeded; `Run Mersearch` ended after the runner received a shutdown signal. No request-scoped manifest/receipt is present. |
| 2 | `perceptual-nexus-early-archive-20261120-01`; run #44818799476 | Search, manifest, compact receipt and publication completed successfully. |
| 3 | `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`; run #41926373944 | Checkouts/input capture succeeded; `Run Mersearch` ended after runner shutdown. No request-scoped manifest/receipt is present. |
| 4 | `kestrel-finite-core-geometry-source-fidelity-20261102-2200`; run #41533820436, attempt 2 | Checkouts/input capture succeeded; `Run Mersearch` ended after runner shutdown. No request-scoped manifest/receipt is present. |

The lane-1/3/4 job logs show runner shutdown during Mersearch execution, not a demonstrated query/parser exception. The workflows specify no shorter job timeout; the exact runner-shutdown cause remains unresolved. No retry was attempted.

Lane 2's compact receipt records 22,755 files and 22,827,574 records scanned, 6,850 hits and 1,181 distinct sources: 2,731 archive, 3,740 HsH and 379 HSH_RESOURCES. Its manifest and compact receipt are present under `indexes/mersearch_requests/perceptual-nexus-early-archive-20261120-01/`; raw `SEARCH_RESULTS.json` and `.md` are explicitly withheld. The receipt describes deterministic lexical navigation, not source authority or semantic ranking; its top-ranked source includes the request file itself. The manifest records the three source repository snapshots and runtime Mersearch hotfix; the stable Mersearch branch was not modified.

All four request files remain in their existing requested state. Lane 2 has an auditable compact output; lanes 1, 3 and 4 remain without request-scoped outputs. The Tern-owned WH-05 queue was not edited. No HSH_RESOURCES private payload was opened directly by this worker; only its root README and repository metadata were read.

## 6. Source, tooling and continuity controls

- HsH main, BEDROCK, Steering Charter, Three Paper Campaign, three-repository onboarding, revival rotation, task graph, Calder workspace/receipts and relevant PRs were read.
- SAT archive root README and one unrelated archive passage were read. HSH_RESOURCES root README only; no private payload opened.
- Existing Math Hopper #578, Whirligig Kernel 0, PR #1515, PR #1487 and PR #2167 were checked before extending the existing Lean project.
- SciSpace is available as an existing connector but was unnecessary for this internal workflow formalization.
- No new tool, dependency, fork, subscription, paid service or expense.
- No SAT-O or Blockwave source equation was edited or silently corrected.
- No new symbol, physical primitive, worldtube-thickness claim, twist/contact-surface equivalence or theory promotion.
- Task graph remains 18 records against 16 declared branches; no graph mutation.
- P0 Code Grurple ACTIVE.
- P1 cognition OVERDUE / NOT READY / FROZEN / ORSON-OWNED.
- P2 measured geometry HOLD.
- P3 full theory INCOMPLETE.
- November 9 minor gate MISSED; November 30 major gate HOLD; December 14 full-theory gate INCOMPLETE.
- FIE last full review November 20; next review December 4. No premature rereview.
- Unrelated reading: SAT archive `fun break - lx.txt`, lines 2966–3005. Next cursor: line 3006. This is a completed source-reading break, not a claim of physical rest.

## 7. Succession and scheduler boundary

The next deterministic ring label is **Hale**. The user-authenticated Hale-related conversation title `TOPLESS` is known, but no exact thread ID or current active-thread binding was recovered. The existing :48 run had already started and its run-level conversation reference was null when inspected. The repository handoff is therefore **POSTSTART_OPTIONAL_CONTEXT_ONLY**, not direct-thread delivery.

The optional packet preserves Hale's external-literature, source-quality, matched-period comparison and statistical-calibration remit. It is [stored here](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-21T2036Z_from_s3_calder_to_s4_hale_POSTSTART_OPTIONAL_PREDICTION_READINESS_COMPOSITION.md); its Hale INBOX and Common HANDOFFS pointers were independently read back. It is not an assignment, review request, response obligation, priority override or ownership transfer. Consumption and acknowledgment are unknown.

The existing :36 automation remains enabled with its exact saved identity, hourly schedule, prompt and Lane Charter 36 phase unchanged. No sixth task, task/schedule mutation, signet or conversation rename.

**Next research cursor:** once a P2 system is selected through the existing source/data gates, bind its original equations and geometry, explicit projection/readout composition, standard comparator, shared parameters, acquisition-unit map, calibration/holdout split, covariance, frozen observable and falsification threshold. Do not evaluate holdout data until the existing prediction hard gate and measured-product gate are both satisfied.
