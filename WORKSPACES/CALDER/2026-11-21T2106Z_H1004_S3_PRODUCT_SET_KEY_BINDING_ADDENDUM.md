# H1004:S3 Amendment 01: Product-set-bound prediction gate

**Status:** `WORKSPACE_ADDENDUM_READY / LEAN_EXACT_HEAD_BUILD_PASSED`

This is a distinct follow-up to the pre-existing h1004:s3 report, not a replacement or retry of its rejected publisher submission.

## 1. Run identity and attribution

- Nominal run key: `REVROT3-19-20261011:1004:s3`.
- Scheduled slot: 2026-11-21 20:36Z.
- Automation run observed: `aeee624b-7e8c-8330-b254-1c537be24298`, started 2026-11-21 21:06:19Z.
- Existing task: `6a9f52b69ec08191b0a2ba24a074f781`, unchanged.
- `seq = 5(1004)+3 = 5023`; `5023 mod 19 = 7`.
- Selected ring label: **Calder**, index 7. Next label: **Hale**, index 8.

The deterministic label is not authentication of a historical Calder instance or current ChatGPT thread. The current run record has `chat_ref=null`. No direct-thread participation or cross-thread delivery is claimed.

No standalone signed Calder specialist charter or `ROLE_CHARTER.md` was found. The closest historical evidence is a September 12 worker-authored self-report in `WORKSPACES/COMMON/CHECKINS.md` (lines 53-106), describing empirical angle-clustering, adversarial null design, independent-unit discipline, and statistical calibration. It is not a Nathan-authored appointment or authenticated worker identity. Calder's existing WH-02 ownership was not changed.

The original h1004:s3 workspace report was already present on main before this invocation. It is not attributed to this run. Its publisher intake, issue #2302, was rejected for invalid schema. That submission was not edited, retried, or duplicated.

## 2. Substantive architecture improvement

Extended the existing [PR #2167](https://github.com/Satobloc/HsH/pull/2167), branch `research/calder-versioned-product-coverage-20261120t0636z`, with a product-set identity contract.

The earlier composition accepted an arbitrary proposition:

`evaluationAdmissible data predictionHardGate := analysisReady data = true ∧ predictionHardGate`

That did not bind the prediction gate to the same measured product set as the readiness record. In principle, a readiness record for product set A could be paired with a prediction proposition intended for product set B.

The revised module introduces:

- `ProductSetKey`: catalog event release, event version, source-snapshot URI, and source-listed product descriptors.
- `AnalysisReadiness key`: readiness is indexed by that exact product-set key.
- `PredictionGateBinding key`: the prediction hard-gate proposition carries the same type-level key.
- `evaluationAdmissible`: accepts readiness and prediction gate only at the same key.
- `reindexPredictionGate`: transfer to another product-set index requires an explicit equality proof.

The source-defined key is for GWOSC event `GW241011_233834`, O4 Discovery Papers v1, using the catalog snapshot `https://gwosc.org/eventapi/json/O4_Discovery_Papers/GW241011_233834/v1/` and the eight product descriptors already present in the source report.

This is a metadata/catalog identity, not a raw-byte digest, acquisition receipt, calibration identity, or proof that the source mapping is correct. The product list is order-sensitive. Exact per-product locators and byte digests remain future work.

The formalization proves that product readiness alone is insufficient, that the current GW241011 O4-v1 readiness record blocks evaluation, and that the prediction proposition must be supplied at the same product-set index. The `False` gate used in the generic theorem is a logical counterexample only, not a physical fixture or synthetic dataset.

**Integration remains incomplete:** the current `Candidate` in [PR #1487](https://github.com/Satobloc/HsH/pull/1487) does not yet expose `ProductSetKey`. No automatic cross-PR adapter is claimed. Before wiring, the source-bound measurement packet or Candidate must carry the same exact product-set key. The type index is an asserted scope binding, not source authentication.

## 3. Actual Lean verification

The first exact-head run, [#44950097553](https://github.com/Satobloc/HsH/actions/runs/44950097553), checked out head `c8f2a9fae33b2b3946bab0652300999c7ef14c98` at fetch depth 1 and failed during compilation at `CalderVersionedProductCoverage.lean:392:17`: the proof attempted `cases h.1`, but Lean requires a local variable reference for `cases`. The checkout and source-identity assertion succeeded. This was a formal proof-script error, not a counterexample to the architecture or a physical result.

The proof was corrected by first binding `h.1` to a local hypothesis and then eliminating that hypothesis. Corrected head:

`5d6b90dcb1c07e385058f359ea8bbc2dc6961500`

[Corrected exact-head run #44950701184](https://github.com/Satobloc/HsH/actions/runs/44950701184), job `136987764096`, completed successfully.

- Lean 4.34.0; Lake 5.0.0.
- Explicit checkout ref: `5d6b90dcb1c07e385058f359ea8bbc2dc6961500`.
- Fetch depth: 1.
- Actual checked-out HEAD: `5d6b90dcb1c07e385058f359ea8bbc2dc6961500`, matching the PR head.
- Source-checkout identity assertion: PASS.
- Full formal-library build: **8,959 jobs successful**.
- Ten theorem-specific axiom reports in `CalderVersionedProductCoverage` report that the declarations do not depend on any axioms. No `sorryAx` appears for those declarations.
- The current readiness evaluation prints `false`, as required by the missing bytes, SHA-256, calibration, PSD, data-quality, and covariance fields.
- Tests, lint, leanchecker, nanoda, and global axiom audit were skipped. Existing warnings occur in other library modules; the new Calder module emitted no warning in the build log.

Two `conversation-json-content-ci` runs (#44950093353 and #44950696770) returned zero job records and failed. They are not Lean verification results. Their exact job endpoints were queried; the state is `NO_JOB_RECORD_RETURNED`, not proof that no checkout occurred.

No local Lean, Lake, or Elan executable is installed. No local `.git` directory was found in the inspected container paths. GitHub Actions was the actual formal verification route for this change.

PR #2167 remains OPEN / DRAFT / UNMERGED on its existing stacked base. No rebase, retarget, merge, or base integration was attempted. The successful build verifies only the formalized type and proposition statements, not the source-to-key translation, physical premises, or an H(s)H prediction.

## 4. Physical and prediction boundary

The GWOSC record remains a metadata-readiness stress case, not a selected P2 physical test. The current readiness record has event-version, product-version, and locator flags true, but bytes-acquired, SHA-256-verified, calibration-version, PSD, data-quality-segment, and covariance flags false. `analysisReady` therefore remains false.

No raw strain bytes were downloaded or reprocessed. No numerical physical calculation, fit, H(s)H geometry-to-observable map, frozen prediction, calibration/holdout comparison, independent measurement, or falsification threshold was produced. No P2 system was selected. P2 remains HOLD.

The next physical step, if P2 later selects this system, is to acquire the exact source-listed products, verify byte digests, bind calibration/PSD/data-quality/covariance versions, then expose the same product-set key in the model-selection Candidate before any prediction/holdout comparison. The current type-level contract does not supply those missing measurements.

## 5. Source, workflow, and continuity corrections

- **FIE correction:** the controlling Aldus rereview is [the November 9 report](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ALDUS/2026-11-09T2324Z_FIE_REREVIEW_AND_3HEB_FIG3C_INTEGRITY.md), blob `fd34b22654f2e072d58736816e427e1de7f220f1`. It records a complete six-page rereview through 2026-11-10 00:17Z. The next 14-day review is due **2026-11-24**, not December 4. The previous h1004:s3 report's November 20 / December 4 statement is superseded. No FIE rereview was due on November 21.
- **Unrelated-reading correction:** this invocation fetched lines 2966-3005 of the SAT archive's `fun break - lx.txt`, but those exact lines were already recorded by the pre-existing h1004:s3 report. This duplicate read is not counted as a new break or cursor advancement. The subsequent h1004:s4 Hale report records lines 3046-3085 and global next cursor **3086**. No new reading break is claimed.
- **Mersearch:** no callable Mersearch action is exposed in this runtime, and all four shared request lanes remain occupied/requested. Lane 2 has a request-scoped manifest/compact receipt but its publication failed; lanes 1, 3, and 4 remain occupied without a releasable completed result. No request was overwritten, released, or retriggered. GitHub search/fetch was bounded fallback navigation, not Mersearch and not exhaustive coverage.
- The task graph readback has 18 records against 16 declared branches (5 completed, 12 active, 1 blocked). No graph mutation was made.
- The PWH queue leaves WH-02 Calder/authorized-maintainer-owned and WH-05 Tern-owned. No queue or ownership change was made.
- The SAT archive root and AI welcome/navigation documents, HsH onboarding and live operational documents, and HSH_RESOURCES root/AI start index were read. No HSH_RESOURCES source payload was opened.
- No SAT-O or Blockwave equation was changed or re-attributed. No new tooling, dependency, fork, subscription, or expenditure was introduced. Existing Lean PR infrastructure was reused.

## 6. Handoff and automation

The next ring label is Hale. Hale's h1004:s4 run had already started at 2026-11-21 20:46:44Z and remained in progress with no authenticated run-level thread reference. The earlier h1004:s3 handoff pointer to the optional Hale packet existed in `HANDOFFS.md` and Hale INBOX, but the referenced packet file returned 404. Any recovered packet is explicitly a post-start repository-only reconstruction, not the original packet bytes, direct ChatGPT delivery, consumption, or acknowledgment. No assignment, review request, response obligation, or ownership transfer is created.

The existing :36 task remains enabled with its exact saved ID, hourly schedule, prompt, and Lane Charter 36 phase unchanged. No sixth task, task/ID/cadence change, signet, or conversation rename. The current run's `chat_ref` is null; no cross-thread delivery is claimed.

**Next research cursor:** extend the source-bound measurement packet/Candidate in PR #1487 with the same exact ProductSetKey before claiming cross-contract integration. Keep both PRs draft and unmerged pending independent review and real-data readiness.
