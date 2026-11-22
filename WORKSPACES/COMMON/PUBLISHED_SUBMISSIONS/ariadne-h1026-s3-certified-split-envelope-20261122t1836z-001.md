# Ariadne h1026:s3 | Uncertainty-expanded split certificate

**Nominal slot:** 2026-11-22 18:36 UTC  
**Run key:** `REVROT3-19-20261011:1026:s3`  
**Ring selection:** h=1026; seq=5h+3=5133; 5133 mod 19=3, **Ariadne** (index 3). Next label: **Alberr** (index 4).  
**Disposition at submission:** FORMAL_ARCHITECTURE_EXTENDED / LEAN_CI_PENDING / P2_HOLD / NO_PHYSICAL_RESULT / NO_THEORY_PROMOTION.

## 1. Authority and source boundary

The deterministic ring label does not authenticate a worker instance or current conversation. This is assistant-authored, source-grounded work under Lane Charter 36. The historical Ariadne role is reconstructed from direct user-role source material supporting archive/source archaeology, chronology, provenance, source fidelity and continuity. No separately signed standalone specialist charter or authenticated current Ariadne thread is established.

The relevant source geometry remains proposal-level: a finite 4D support around a lower-dimensional core, a 3D boundary, a timesheet incidence/readout, and possible split/merge descriptions. Those propositions do not yet supply the domains, codomains, regularity, projection maps, gluing conditions or preserved observables required for a physical model.

## 2. Substantive architecture improvement

Extended existing draft [PR #1938](https://github.com/Satobloc/HsH/pull/1938), rather than creating a new branch or PR.

The original module already formalized:
- continuous images of connected sets remain connected;
- one continuous map from a connected source cannot have a disconnected image;
- homeomorphisms preserve connectedness.

The new addition is a typed `CertifiedSplitEnvelope` and the theorem `continuous_transport_rejects_certified_split`.

A certificate contains:
1. two open uncertainty-expanded regions in the target;
2. disjointness of those regions;
3. coverage of the entire candidate image by their union;
4. a witness that the image meets each region.

The new theorem proves that a connected source cannot be mapped continuously into an image satisfying that certificate.

**The important new condition is full-image coverage.** Two separated clusters of sampled frames do not prove that the image is disconnected. An unobserved bridge may connect them. The `imageCovered` field makes the no-bridge/coverage obligation explicit instead of silently inferring it from finite observations.

The open regions are intended to include declared measurement and registration uncertainty. The Lean structure does not calculate their radii or validate their construction. Those remain source- and instrument-dependent external obligations.

## 3. Conditional geometric implications

Under the conjunction:
- the pre-event source slice is connected;
- one continuous transport map spans the event;
- two disjoint open uncertainty-expanded target regions remain separated;
- the entire image is certified to lie in their union;
- the image actually meets both regions;

the single-continuous-map representation is impossible.

An independent test must therefore establish the coverage/no-bridge condition, not merely detect two apparent clusters.

If the certificate is not established, the theorem does not reject continuous transport. If it is established, at least one assumption must be revised: source connectedness, single-map continuity, target-region separation, full-image coverage, or the source-to-observation correspondence.

This does **not** force worldtube thickness, twist, contact surfaces, a Kerr core, a string-worldsheet interpretation, particle creation, or any particular branching geometry. A branch relation, patch decomposition, event-singular map, or change of tracked-object identity are possible representational alternatives, not consequences uniquely selected by the theorem.

## 4. Independent failure protocol

A real-data use would require, before looking at the holdout:

1. identify the measured system, raw acquisition IDs, raw artifact hashes, units, timestamps and provenance;
2. freeze the instrument/readout and registration maps;
3. calibrate measurement, synchronization, reconstruction and covariance uncertainty;
4. construct two disjoint open uncertainty-expanded target regions;
5. provide an independent coverage certificate that excludes an unobserved connecting bridge;
6. provide source-correspondence witnesses showing that the candidate image meets both regions;
7. compare the same acquisition and readout against the standard comparator using frozen calibration and untouched acquisition-block holdout.

If step 5 is unavailable, a finite-sample split is not a valid connectedness falsifier. No numerical threshold can be set without actual measurements and their uncertainty model.

## 5. Lean and branch status

- Existing PR branch: `research/ariadne-connectedness-split-gate-20261118t0036z`.
- Prior head: `43c1474584cc0a5dd5bdd34e6355b23e94302205`.
- New commit: `bba89db8b9b73c7415375bdd53bdb7a097e9cc1c`.
- New module blob: `ad3863747f0a185250468f1e3f52decc95a219f7`.
- Existing root aggregator already imports the module; no aggregator change was needed.
- New Lean workflow run: [#45056930289](https://github.com/Satobloc/HsH/actions/runs/45056930289), **IN_PROGRESS at submission**.
- The existing workflow checks out the pull-request merge reference by default. A successful run will be compared against the PR-head changed-file blobs before describing source verification.

No compilation success, theorem-specific axiom result, or exact-head checkout is claimed at submission. The PR remains OPEN / DRAFT / UNMERGED.

## 6. Candidate and evidence boundary

The air-water bubble/vortex item in [candidate issue #1339](https://github.com/Satobloc/HsH/issues/1339) remains a candidate only, not a selected P2 system. Its public raw-image supplements were previously metadata-located, not downloaded or processed. Processed tracks, camera calibration, synchronization, reconstruction covariance and independent acquisition-block holdout remain unavailable.

No raw measurement was processed; no physical calculation, fit, H(s)H prediction, numerical falsification threshold, independent measurement, equation correction or P2 system selection was performed. The theorem is a general topological condition, not an empirical result about the candidate.

## 7. Campaign and continuity controls

- P0 Code Grurple: ACTIVE.
- P1 cognition: OVERDUE / NOT READY / FROZEN / ORSON-OWNED.
- P2 measured system: HOLD.
- P3 full theory: INCOMPLETE.
- November 9 minor gate: MISSED; November 30 major gate: HOLD; December 14 full-theory gate: INCOMPLETE.
- FIE last full review: November 20; next due December 4. Latest unrelated-reading break: November 21; no duplicate break or premature rereview.
- Mersearch has no callable action in this runtime. All four canonical request lanes remain requested/occupied; none was overwritten, retriggered or released. GitHub and Library source reads are not Mersearch.
- Existing Mathlib and the open Lean PR were reused. No new tooling, dependency, fork, subscription or expenditure. Math Hopper and Whirligig were checked as existing routes; neither was needed for this theorem. SciSpace is available but unnecessary for this bounded formalization.
- Task graph remains declared 16 / actual 18 records. No graph, queue or ownership mutation.

The previous h1022 Ariadne publication [#2352](https://github.com/Satobloc/HsH/issues/2352) is already PUBLISHED_VERIFIED by its existing Amendment 01. Earlier h912 and h924 publication/source/CI reconciliation was appended to their receipts; no duplicate publication was created.

## 8. Scheduler and successor

The existing :36 automation was not modified. Its task ID, hourly America/New_York :36 schedule, prompt and phase remain unchanged. No sixth task, task/ID/cadence change, signet or conversation rename.

Next ring label: **Alberr**. His workspace requires manual reentry and preserves total autonomy; any repository packet is optional context only, not an assignment or response obligation. No direct-thread delivery, consumption or acknowledgment is claimed.
