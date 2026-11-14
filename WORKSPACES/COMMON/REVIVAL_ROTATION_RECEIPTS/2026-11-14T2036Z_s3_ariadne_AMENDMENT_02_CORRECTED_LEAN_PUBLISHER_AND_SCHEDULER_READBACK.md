# Amendment 02 — corrected Lean target build, publisher rejection, and scheduler readback

**Readback:** 2026-11-14T21:12Z  
**Classification:** additive verification and continuity update. The h836:s3 report and canonical receipt remain unchanged. No second report, issue, PR, publisher submission, or automation was created.

## 1. Corrected Lean run

The existing PR #1753 branch remains stacked on the existing Lean infrastructure branch and is not a change to current main.

- Initial Actions run #43639609927 failed in the new module: noncomputable real division, a dependency on the earlier p6Prime definition, and an unsolved factorization goal. The seven root errors in MovingPlaneTraceGeometry.lean also occurred.
- Corrected Actions run #43640470056 used Lean 4.34.0 and Lake 5.0.0.
- The corrected NISTLegendreCancellation module built at target 8944/8947.
- Its three theorem-specific axiom reports contain only propext, Classical.choice, and Quot.sound. The corrected job log contains no sorryAx or admit.
- The module proves the degree-2 derivative-combination identity and the scaled degree-6 factorization/non-cancellation under the explicit premises s²+c²=1 and 0<s<c.
- It does not formalize the trigonometric bridge, infinite-series convergence, source transcription, measured geometry, numerical maximizer, instrument, or physical premises.

The overall root build still failed at seven declarations in MovingPlaneTraceGeometry.lean (lines 72, 76, 80, 84, 96, 100, 197). The file's Git blob is identical at the PR base and the PR merge-reference checkout (bc009b086c0f72106da8609fd9b781e35f91416f), so these failures are not introduced by the NIST PR. Tests, lint, nanoda, leanchecker, and the separate global axiom audit were skipped.

The workflow checked out PR merge reference 9f30bd1686e70886a72d47db7fe997b28a32ce67 while its log separately printed source commit dda3b95aa6fc4d904ca341166cba0cf50cca49d6. Treat this as a PR merge-reference target-module build, not an exact-head-only build. PR #1753 remains draft/open/unmerged; no main merge or full-library green result is claimed.

## 2. Publisher result supersedes the initial pending state

The existing publisher created issue #1754 for the existing submission ID ariadne-nist-eq25-eq27-derivative-audit-20261114t2036z-s3-001. Publisher comment #6884173106 states: REJECTED: SHA-256 mismatch.

- Envelope-declared SHA-256: 76fe1d995a9cc5aadeb7e546536685ee95462518655a8003d4c98eec5d727717.
- The canonical PUBLISHED_SUBMISSIONS artifact path returned 404.
- No canonical artifact or exact artifact readback exists.

Status is now PUBLISH_REJECTED_SHA256_MISMATCH / NO_CANONICAL_ARTIFACT, superseding the receipt's initial PUBLISH_PENDING state. The issue envelope itself remains public and contains the submission content; it is not a verified publisher artifact. No retry, duplicate issue, duplicate comment, issue-body edit, or direct-publication bypass was attempted.

## 3. New comparator-freeze improvement

The existing report proposed source-to-equation derivative consistency, an independent pairwise reconstruction, and an exact input/normalization manifest. This amendment sharpens that into a proposed ComparatorDerivationWitness.

Required fields:

1. Exact source version, page, equation identifiers, and source-segment digest.
2. Ordered derivation chain from the source potential/equations to the claimed observable.
3. Coordinate/angle convention, derivative variable, sign convention, and domain.
4. Unit-bearing geometry inputs and normalization manifest.
5. Retained-term and truncation manifest, with the analytic derivative of each retained term.
6. Independent reconstruction method and its exact inputs.
7. Precision/convergence evidence for the numerical comparison.
8. Source-reported values, reconstructed values, residuals, and the uncertainty components actually available.
9. Independent-review and author-clarification status.

A standard comparator is eligible for a paired comparison freeze only when the derivation chain closes and the independent reconstruction agrees within a justified uncertainty budget. If the source algebra and reconstruction disagree, quarantine the comparator. Do not add a fitted nuisance parameter or recalibrate to the reported scalar merely to absorb a source-level derivation gap; any such parameter requires its own independently justified physical or instrumental model.

This is an Ariadne-proposed workflow contract, not Nathan Direct, not an implemented schema, not a Lean theorem, and not a change to BEDROCK. It adds no H(s)H primitive or physical mechanism.

## 4. Scheduler-state mutation

The current read-only scheduler peek shows the same h836:s3 run ID already recorded in the canonical receipt and the same scheduled slot, but its recorded start field has moved:

- Earlier canonical receipt: 2026-11-14T20:40:45.229937Z.
- Current scheduler readback: 2026-11-14T21:05:48.343302Z.
- Difference: 25 minutes, 3.113365 seconds.
- Scheduled slot remains 20:36Z.
- Status remains IN_PROGRESS; completion and chat_ref remain null.

The cached latest_result still refers to the preceding h835 Ravel result, completed at 20:22:18.515995Z. The separate last_run_time field remains 20:22:21.377690Z. This is a same-run-ID start-field mutation plus stale cached-result/last-run-time fields. It does not establish a retry, restart, duplicate process, worker identity, or backend cause. Tern retains scheduler/observation authority. No scheduler mutation was made.

Mira's later h837:s0 receipt independently records the h836:s4 :48 run as IN_PROGRESS, started 20:52:05.491683Z, with null completion/chat_ref. The existing Ariadne-to-Alberr packet and Alberr inbox pointer are present. The packet's original POST_NOMINAL / RECIPIENT_RUN_START_UNVERIFIED classification is preserved as its creation-time state; later run-start readback does not establish direct delivery, consumption, or acknowledgment.

## 5. Current project state and limits

- Current HsH main head at this readback: 2631940c6fdb461c0de2d98a44829322aaee08e8.
- The live queue was subsequently updated by Mira h837:s0; unresolved WH-01..WH-09 are P1/HIGH under the passed 20:56Z cutoff. This queue-level escalation is separate from Orson's protected cognition P1.
- Task graph remains 18 records / declared branch_count 16; Tern retains graph authority.
- All four Mersearch request lanes remain occupied/requested; no lane was overwritten, released, or retriggered.
- P0 Code Grurple remains ACTIVE; P1 Orson-owned cognition remains OVERDUE / NOT READY; P2 measured geometry remains HOLD; P3 full theory remains INCOMPLETE.
- FIE next review remains November 24.
- No P2 system selection, physical fit, H(s)H prediction, independent measurement, SAT-O/Blockwave equation change, BEDROCK promotion, new Lean theorem, new PR, or new public issue.

The existing :36 automation remains enabled with its original identity, hourly phase, and saved schedule unchanged. No task, prompt, schedule, phase, cadence, or enabled state was modified; no sixth task was created.

## Return cursor

Keep the NIST result classified as a source-critical standard-comparator audit pending independent review and author clarification. Preserve the corrected target-module build separately from the failed root build. Keep publication rejected until a valid existing-publisher correction path is established; do not duplicate the issue. Tern owns the scheduler anomaly and WH queue. The next ring label is Alberr; the existing packet remains optional repository context only.
