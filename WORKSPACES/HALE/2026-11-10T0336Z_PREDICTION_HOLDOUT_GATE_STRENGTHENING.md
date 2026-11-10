# Prediction / holdout gate strengthening

**Date:** 2026-11-10  
**Run key:** `REVROT3-19-20261011:723:s3`  
**Worker label:** Hale (deterministic ring selection; not authenticated ChatGPT-thread identity)  
**Status:** WORKFLOW CONTRACT STRENGTHENED / LEAN MERGE-REFERENCE BUILD PASS / PR OPEN-DRAFT / P2 HOLD / NO PHYSICAL PREDICTION

## 1. Rotation and authority boundary

The nominal UTC hour is **h=723**. Therefore:

- `seq = 5×723 + 3 = 3618`
- `3618 mod 19 = 8`
- Selected ring label: **Hale** (index 8)
- Next ring label: **Elias Kern** (index 9)

Selection is deterministic bookkeeping, not authentication of a ChatGPT instance or thread.

The historical Hale material was reviewed before work. The 2026-09-12 Hale check-in is an assistant self-report that chose the Hale label and described external-literature scanning, matched-period comparison, scoring/statistical analysis and calibration. REV-006 is an assistant reconstruction, not a signed Nathan Direct charter. Those are useful specialist-history clues, not identity proof.

The current main head at intake was `6365259a71146cde8a1e3d52cfeca5f332a662f0`. No matching h723:s0, h723:s1 or h723:s2 receipt/handoff was found at intake. The :00 automation's visible attempt was a delayed h722:s0 run recorded failed; the :24 automation's visible attempt was a delayed h722:s2 run still in progress. Neither is treated as the immediate h723:s2 predecessor. No h723:s2 Calder handoff is claimed.

## 2. Substantive architecture improvement

The existing draft **PR #1487** formalizes the rule that human intelligibility is a tie-break only after empirical hard gates pass, empirical equivalence is established, and the preferred candidate is no more complex componentwise.

The previous contract used broad propositions such as `measuredDataAndUncertaintyReady` and `independentHoldoutPasses`. Those labels left important real-world obligations implicit. I strengthened the existing module rather than creating another branch, PR or tool.

The revised module separates three evidence protocols:

### Measurement evidence

- target system identified;
- dataset versioned and provenance recorded;
- measurement scale and units declared;
- uncertainty model declared.

### Holdout protocol

- acquisition-unit map authenticated against the actual experiment;
- partition/fold assignment respects that map;
- holdout remains untouched;
- holdout is not refitted;
- independent holdout result is established.

### Prediction protocol

- predicted observable declared;
- prediction frozen before holdout access;
- falsification rule predeclared;
- threshold justified by the declared uncertainty model.

The hard gate now requires all of these in addition to source admissibility, explicit composable maps, a matched standard comparator, nuisance-adjusted identifiability, frozen shared parameters and the componentwise complexity ledger.

This closes a specific loophole: a theorem that folds factor through a *declared* acquisition-unit map does not authenticate that map against the real experiment. Likewise, a generic “holdout passed” proposition is insufficient unless the prediction and rejection rule were frozen before holdout access.

The new theorem `hardGate_requires_measurement_holdout_prediction_evidence` proves that the formal hard gate exposes each of these obligations. The existing theorem `intelligibility_cannot_rescue_failed_candidate` continues to prevent a human-preference tie-break from rescuing a failed hard gate.

**Epistemic status:** assistant-proposed workflow contract derived from Nathan's 2026-11-08 methodology directive. It is not a Nathan Direct theorem, not a physical model, and not evidence that any external proposition is true.

## 3. Lean verification

Existing PR branch:

`research/intelligibility-selection-gate-20261108t1336z`

- PR: #1487, still OPEN / DRAFT / UNMERGED.
- Parent/base PR: #1387, still OPEN / DRAFT / UNMERGED.
- Updated commit: `9c660ab099cfa39afcf7facc16f97e2e2cd24d9a`.
- Updated module blob: `522e7ad0d86c6f29227b4fafc2badfbe41e80add`.
- The module blob at the PR head and the build's merge reference is identical.
- Actions run: #42751414165.
- Job: #129615670395.
- Lean: 4.34.0.
- Lake: 5.0.0.
- Full root build: **8,947 jobs successful**.
- The five theorem-specific `#print axioms` reports say **does not depend on any axioms**.
- The module contains no `sorry` or `admit`.

**Build classification:** MERGE-REFERENCE BUILD SUCCESS / MODULE BLOB MATCHES PR HEAD / NOT A STANDALONE EXACT-HEAD BUILD. The checked-out source commit was merge reference `b39252b542ca0519b92bd2ed82a56c38ce348a7b`, not PR head `9c660ab...`.

Tests, lint, nanoda and the global axiom-audit stage were disabled/skipped. This is a successful Lean build of the formal library and the new module, not a whole-project no-sorry or axiom audit.

Adjacent verification completed during this run:

- PR #1538, two-contour vortex readout/covariance bridge, remains OPEN / DRAFT and is stacked on unmerged PR #1189.
- Its exact-head Actions run #42678421460, job #129366005810, succeeded on head `ae0e98444b97dcc61de41c15b08a16751f39a9bc`.
- Full root build: 8,955 jobs successful.
- Three new theorem-specific axiom reports list `propext`, `Classical.choice`, and `Quot.sound`.
- Tests, lint, nanoda and global axiom audit were skipped.

These proofs concern formalized map/readout and covariance statements. They do not validate the physical source-to-mode translation, authenticate an acquisition-unit map, establish statistical independence, or establish an H(s)H prediction.

## 4. Connection to the existing real-data test matrix

The existing Hale report dated 2026-11-06 and its published issue #1432 contain the bounded NIST/BIPM four-cell contrast analysis. It uses the final-paper aggregate values and Table-18 covariance, not raw torque time series or CMM point-cloud bytes.

The existing candidate matrix remains:

| Hypothesis | Shared parameters | Calibration / holdout | Predicted observable | Standard comparator | Falsification condition |
|---|---|---|---|---|---|
| M0 standard baseline | One G, measured source/test geometry, common calibration inputs, published covariance/dark-uncertainty structure | Calibration on declared training acquisitions; independent acquisition blocks/orientations reserved before scoring | Raw torque, angle/time series, servo voltage/electrostatic torque and derived configuration G values | NIST mass-integration factor and native free/servo readout equations | Held-out joint residual/predictive score outside a predeclared region using full covariance and dark uncertainty |
| M1 minimal H(s)H interaction | One source-defined H(s)H map and shared physical parameters across configurations; same nuisance flexibility as M0 | Same training data and frozen holdout as M0 | Both material configurations and both native readout channels | M0 with identical geometry, calibration and nuisance flexibility | Failed joint holdout prediction or no predictive improvement over M0 |
| M2 finite-core thickness | Only if an internal source defines the object, units and map; no per-cell retuning | Independent thickness constraint or training-only calibration; untouched holdout | Predeclared change in torque/angle/servo observables | M0 and M1 | Non-identifiable thickness, per-cell retuning, or failed holdout |
| M3 twist/contact structure | Only source-defined structures with explicit projection/composition maps | Same shared-parameter and holdout rules | Predeclared material/readout/orientation interaction pattern | M0, M1 and simpler ablation | No independent predictive gain or absorption by configuration-specific nuisance terms |
| M4 cross-mode transfer | Explicit calibrated bridge only when native prediction is unavailable | Calibrate bridge on one declared domain; hold out target domain | Target-domain observable with propagated covariance | Native M0 readout model | Uncalibrated/non-identifiable bridge or failed target-domain holdout |

The four aggregate NIST cells form a saturated 2×2 factorial decomposition. At that summary level there is no residual degree of freedom for an additional H(s)H-specific term. The existing report therefore does not select NIST for P2.

No numerical falsification threshold is assigned here. Raw acquisition data, complete raw-level covariance/calibration records, authenticated acquisition-unit map, independent holdout and a source-defined H(s)H forward map remain absent. The threshold must be fixed from the actual uncertainty model before holdout access, not chosen after seeing residuals.

The air-core water-vortex and He-4 Kelvin-wave records remain candidates only. The Figshare DOI was retried through the available web reader, but no raw bytes or dataset manifest were obtained. No system was selected.

## 5. Forced versus optional geometry

The NIST apparatus forces finite three-dimensional source/test-mass supports, measured geometry and mass inputs, source-mass orientation, distinct free and servo readout paths, correlated shared inputs and configuration-specific dark uncertainty.

It does **not** force an H(s)H worldtube thickness, twist, contact surface or particular local/global shape hierarchy. Those become admissible only when an internal source defines them, explicit projection/composition maps carry them into the measured interaction/readout, and they alter a predeclared observable on independent holdout data.

The current measurement-domain and quotient/covariance PRs supply useful conditional mathematics, not those missing physical maps.

## 6. Mersearch, archives, tooling and paper gates

All four shared Mersearch request lanes remain `requested`. No lane was overwritten, cancelled or reused. The three-repository onboarding and the HSH_RESOURCES private-reference boundary were respected. No SAT-O/Blockwave equation was retrieved, transcribed, corrected or modified.

The existing HSH_RESOURCES arXiv scanner remains version 0.4; no scanner work was revived. Existing Math Hopper, Lean PR and Whirligig work was inspected through the current branch/receipt lineage before modifying the existing PR. No new tool, dependency, fork, paid service, branch or PR was created.

FIE rereview was already completed by Aldus at 2026-11-10T00:17Z: six pages, 12,358 extracted characters, 197 lines, no OCR. Next review is due November 24. It was not repeated.

Unrelated reading quantum: `000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`, lines 1001–1040, source blob `f33eb29...`. Next cursor: line 1041. This was a deliberate lateral reading switch, not a physical break; no physical break is claimed by this cloud runtime.

Campaign remains unchanged:

- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition: Orson-owned / NOT READY.
- P2 November 30 geometry: HOLD.
- P3 December 14 full theory: INCOMPLETE.

No paper, reader route, BEDROCK premise, theory status or publication gate was changed. No theory promotion occurred.

## 7. Scheduler and handoff status

The existing :36 automation remains enabled with its original ID and exact hourly schedule:

`6a9f52b69ec08191b0a2ba24a074f781`  
`DTSTART;TZID=America/New_York:20261001T143600`  
`RRULE:FREQ=HOURLY`

At the last scheduler readback, the current :36 run was IN_PROGRESS, scheduled for 2026-11-10T03:36Z, started 03:31:42.309660Z, with `chat_ref=null`. Work and repository records are complete; scheduler completion is not claimed.

The next deterministic ring label is Elias Kern at h723:s4. The :48 automation remains enabled with its original ID/schedule. No authenticated current Elias thread was established. A repository-only optional-context handoff is recorded separately; it creates no assignment, response obligation, review request, ownership transfer or cross-thread delivery claim.

The task graph still declares 16 branches while containing 18 records; Tern retains reconciliation authority. No graph edit was made.

No automation ID, prompt, schedule, phase, task count or cadence was changed. No sixth task was created. No chat rename or signet was performed.

## 8. Next cursor

1. Keep PR #1487 draft until independent review; do not merge the stacked parent/child pair by inference.
2. Authenticate the actual acquisition-unit map from the raw experiment before treating any fold split as independent.
3. Obtain raw NIST torque/angle time series, CMM files, calibration and orientation records, and raw-level covariance, or explicitly retire NIST as the P2 candidate.
4. Recover an internal source defining the candidate H(s)H state-to-interaction/readout maps. Do not infer thickness, twist or contact maps from analogy.
5. Only after 1–4, freeze a distinctive observable, shared parameters, standard comparator, holdout unit map and uncertainty-derived falsification threshold before opening the holdout.

**Return pin:** `H723:S3 / HALE-LABEL / MODEL-SELECTION-HARD-GATE-STRENGTHENED / LEAN-MERGE-REF-BUILD-PASS / MODULE-BLOB-MATCHES-HEAD / PR1487-OPEN-DRAFT / PR1538-EXACT-HEAD-BUILD-PASS / P2-HOLD / NO-PHYSICAL-PREDICTION / MERSEARCH-LANES-OCCUPIED / FIE-FRESH / LATERAL-READING-1041 / AUTOMATIONS-UNCHANGED`


### Timing amendment — h723:s3 → h723:s4 optional context

A later scheduler readback shows the h723:s4 :48 run started at `2026-11-10T03:50:28.324069Z` with no `chat_ref`. The handoff packet commit was created at `03:52:38Z`; the Elias inbox append commit was created at `03:52:48Z`. Therefore this packet is **POST_START_OPTIONAL_CONTEXT_ONLY**, not pre-start context. No consumption, reading, acknowledgment, thread delivery or ownership transfer is claimed.
