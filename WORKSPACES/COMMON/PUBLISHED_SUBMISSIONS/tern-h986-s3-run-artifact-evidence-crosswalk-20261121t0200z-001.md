# h986:s3 | Run/Artifact Evidence Crosswalk for scheduled automation and Mersearch

**Status:** Tern control-plane supplement; source-grounded proposal and observed workflow reconciliation. This reuses the existing Execution Envelope Composition Map v0.2 and H935 Prediction Producer-Run Binding. It does not introduce a competing global identity taxonomy, modify BEDROCK, promote H(s)H, or establish a physical result.

## 1. Selection and authority

- \(h=986\), \(seq=5h+3=4933\), \(4933\bmod19=12\).
- Selected ring label: **Tern Rook** (index 12); next: **Morrow** (index 13).
- Historical Tern control-plane authority is supported by direct user-role messages recovered from the Ariadne raw conversation export. No separately signed standalone Tern charter or authenticated current Tern thread was established. This is assistant reconstruction, not historical-instance participation.
- The current scheduled automation conversation is not treated as an authenticated Tern thread. No cross-thread delivery or worker identity is claimed.

## 2. Reuse existing architecture, not another taxonomy

The existing Elias Kern **Execution Envelope Composition Map v0.2** already distinguishes SelectionKey, SlotKey, TaskConfigKey, RunKey, optional AttemptKey, CachedResultKey, ConfiguredTargetKey, ObservedThreadKey, SourceKey, SourceRunWitnessKey, PublisherKey, ArtifactKey and DeliveryKey. It explicitly prohibits borrowing a thread reference from task configuration or a stale cached result.

The existing H935 **Prediction Producer-Run Binding** already identifies the remaining P2 requirement: the prediction seal must bind to the exact execution witness that generated the prediction bytes. A digest identifies bytes; a seal identifies a declaration event; neither alone identifies the source, harness, command, environment, inputs and run that produced the bytes.

This run adds a Tern-owned conformance supplement and a small formalized scheduler observation. It does not edit Elias's map, H935, the Threading POC, PR #951 or production.

## 3. Live scheduler observation: task, current run and cached result are distinct

The existing :36 task was observed enabled with its saved hourly schedule and Lane Charter 36 phase unchanged. The current scheduled occurrence was 01:36Z; the provider run began at 02:00:19.747108Z, an observed start offset of 24m19.747108s. It remained IN_PROGRESS, with no completion and a null current-run chat_ref at the readback.

The task-level conversation reference and the cached latest-result chat_ref carried the same value. However, the cached result belonged to the prior 00:36Z occurrence and completed at 00:55:16.532749Z. The current run's chat_ref remained null. Task-level last_run_time and updated_at also predated the current run start, while next_run_time still named the 01:36Z occurrence.

**Classification:** TASK_RESULT_REFERENCE_ALIAS_ON_PRIOR_SLOT / CURRENT_RUN_THREAD_UNBOUND / TASK_SUMMARY_FIELDS_STALE_RELATIVE_TO_CURRENT_RUN / CAUSE_UNKNOWN.

This is a field-scope observation, not proof that the cached reference is a task container, not a current-run thread binding, and not worker authentication. No retry, restart, duplicate execution, process liveness, backend cause or cross-thread delivery is inferred.

### Formalization

Existing Tern PR #1570 was extended on its existing branch with a typed ThreadReferenceObservation and a fail-closed classifier. The h986 witness uses an opaque equality token rather than embedding the raw conversation reference. The first draft commit briefly contained the raw reference; a subsequent commit removed it from the current file, but the earlier commit remains in PR history. PR #1570 must remain OPEN / DRAFT / UNMERGED until an authorized maintainer decides whether history cleanup is required. It distinguishes:

- a non-null reference on the exact current run;
- a task/result reference alias on a prior scheduled slot;
- a cached-result reference without a current-run binding; and
- no reference.

The h986 theorems verify the ring arithmetic, field-level alias classification, absent current-run reference, prior-slot separation, observed start offset and stale task-summary ordering for the pseudonymized record.

- PR #1570 current head: 0509e690e6359279b5ac8de954dfa21627100f8d.
- Exact-head Actions run: [#44854466333](https://github.com/Satobloc/HsH/actions/runs/44854466333), still IN_PROGRESS at this report's checkpoint. No current-head Lean pass is claimed.
- Lean verifies only the formalized field-level classifier. It does not prove the source-to-record mapping, external connector semantics, worker identity, or thread continuity.

## 4. Mersearch Lane 2: execution and artifact binding

The pre-existing user-requested Lane 2 request is perceptual-nexus-early-archive-20261120-01. This automation did not create, overwrite or rerun that request.

The existing Actions execution completed successfully:

- Run [#44818799476](https://github.com/Satobloc/HsH/actions/runs/44818799476), attempt 1.
- Workflow ID 395264519; job 136573978773.
- Run started 2026-11-20T21:16:08Z; the API readback last updated it at 2026-11-21T00:28:37Z with status COMPLETED / SUCCESS. This is an updated_at timestamp, not a separately exposed completion timestamp.
- The manifest pins HsH main 2c0df511907dfbf45756a1971c7dc654c8aac257, stable Mersearch branch 89933c358b67ccbfbbaa680aadeb1f35d22d91b2, SAT archive d10dd333f2487054807bda398995300c538caa7e, and HSH_RESOURCES f39742b5a7d34578cea9218202b8641978038aef.
- The run manifest records bridge_exclusions=["mersearch_requests"] and a publication policy that publishes only the manifest and two compact receipt files. Raw SEARCH_RESULTS files remained in temporary Actions job storage and were not copied to main.
- The stable Mersearch branch was unchanged, but the runtime copy used a hotfix injecting TOOL_NAME and TOOL_VERSION. Stable-script and runtime-script SHA-256 values differ; this is not a byte-for-byte run of the pinned stable script.
- The compact receipt reports 22,755 files and 22,827,574 records scanned, 6,850 hits and 1,181 distinct source paths. It contains a request-file self-hit and duplicate conversation paths across roots; ranking is lexical, not semantic. It is not an exhaustive source inventory or source-critical attribution.

### Exact checkout reconciliation

The job logs expose four successful checkout steps: 2, 4, 5 and 6. Their actual post-checkout commit identities, refs and depths were appended to CLONE_LEDGER.jsonl as four distinct rows. The ledger was independently read back with 107 valid JSONL rows, zero parse errors and exactly four unique rows for this run.

| Checkout | Commit | Depth | Materialization | Comparison |
|---|---|---:|---|---|
| HsH main | 2c0df511907dfbf45756a1971c7dc654c8aac257 | 0 | Full history | Matches HsH run head |
| HsH mersearch-stable-1.0 | 89933c358b67ccbfbbaa680aadeb1f35d22d91b2 | 1 | Shallow | Different pinned branch; no head comparison |
| SAT archive main | d10dd333f2487054807bda398995300c538caa7e | 1 | Shallow | Cross-repository; no head comparison |
| HSH_RESOURCES default branch | f39742b5a7d34578cea9218202b8641978038aef | 1 | Shallow | Cross-repository; no head comparison |

This proves checkout materialization and commit identity. It does not establish GitHub Traffic attribution, a unique actor, or a fresh environment. The global WH-01 run-list partition cursor remains 2026-11-15T18:00:00Z; this targeted reconciliation does not close the full census.

The Mersearch worker guide was updated to record this single post-containment execution, the runtime-only hotfix and the requirement to bind request, run/attempt, job/step, checkout, runtime, artifact and readback evidence. The Lane 2 request remains requested and occupied. No lane was released. Lanes 1, 3 and 4 remain requested; nine expected request-scoped manifest/receipt paths remain absent.

## 5. Crosswalk to an independently falsifiable P2 test

For a future H(s)H comparison, reuse the existing H935 producer-run binding rather than creating a new gate:

1. Freeze the H0 standard comparator and H1 H(s)H candidate, shared/nuisance parameters, calibration, acquisition identity, observable map, units, uncertainty model, holdout, analysis and decision rule.
2. Bind the prediction seal to a SourceRunWitness containing the exact provider RunKey, source repository/commit/blob, harness, command, environment/toolchain, frozen input/data digests, execution scope, output digest, timestamps and skipped-test accounting.
3. Verify the prediction-output digest equals the bytes named by the seal, and that the seal predates holdout access.
4. Keep CI compilation, method replay, prediction generation, independent reproduction and production observation as distinct execution scopes.
5. Require an independent evaluator to apply the frozen observable and uncertainty model to the held-out acquisition. A result outside the preregistered H(s)H prediction region beyond the declared combined uncertainty, while the matched standard comparator remains adequate, counts against that H(s)H candidate.

A new run ID alone does not establish independent evidence; for physical replication, the acquisition root must also be distinct.

**No P2 test is instantiated here.** No measured system, raw physical dataset, acquisition provenance, physical units, uncertainties, calibrated observable map, calibration/holdout split, prediction, numerical falsification threshold, fit or independent measurement was produced. The qualitative intrinsic-thickness source commitment and tentative mutual-curvature hypothesis remain at their existing epistemic status. Twist/holonomy and contact surfaces are not promoted to forced structures by this workflow work. No SAT-O or Blockwave equation was altered.

## 6. PWH deep review and current priorities

- Task graph: 18 records against declared branch_count=16; 5 completed, 12 active, 1 blocked; 17 reachable, 1 unreachable. The discrepancy and all owners/statuses/due dates remain unchanged.
- WH-01: the known Mersearch run's four checkout events are now reconciled; the global run-list cursor remains 18:00Z.
- WH-05: Lane 2 compact outputs exist but raw results are withheld and the request remains occupied; lanes 1, 3 and 4 still lack outputs. No release.
- P0 Code Grurple: current main still contains the source-level workspace-reader policy mismatch. PR #2009 remains OPEN / DRAFT / UNMERGED, without exact-head CI or review. No live route was observed; no rebase, merge, deployment or standdown.
- WH-02 remains highest-priority unblocked and Calder-owned; PR #1710 remains OPEN / DRAFT / UNMERGED. No takeover.
- WH-03/04 Factory Floor intake/lifecycle, WH-06 issue/fork governance, WH-07 Project Desk lineage, WH-08 orphan census and WH-09 migration remain open without new evidence.
- P0 remains ACTIVE; P1 Orson cognition OVERDUE / NOT READY / ORSON-owned; P2 measured geometry HOLD; P3 full theory INCOMPLETE.
- FIE next review remains November 24. A later summary claims a November 20 six-page reread, but this run did not recover an exact source SHA, read extent or return cursor; it is not used to reset the review interval. The unrelated-reading cursor remains h958 lines 2001–2040, next 2041; no duplicate break.

## 7. Durable records and limits

- Existing PR #1570: scheduler thread-reference scope formalization; exact-head build pending.
- Clone ledger: four exact checkout rows added; 107-row readback verified.
- Mersearch worker guide: first post-containment execution and execution-to-artifact binding guidance recorded.
- PWH queue and task graph: deep review appended; branch count, ownership and task statuses preserved.
- Existing PWH issue #1704 already records the Lane 2 output/clone-ledger gap; no duplicate issue or duplicate comment was created.

No new tooling, dependency, fork, subscription, automation or task was created. No automation/task ID, schedule, cadence, prompt or phase was changed; no sixth task. No private HSH_RESOURCES payload was accessed. No BEDROCK theory promotion or paper-gate advancement occurred.

**Next cursor:** check exact-head Actions run #44854466333 for PR #1570; retain the PR as draft pending verification and maintainer disposition of the earlier-history reference. Continue WH-01 only through an authorized existing run-list route, without advancing the 18:00Z cursor on this targeted run. Keep Lane 2 requested/occupied; do not release it based only on compact outputs. Preserve P0/WH-02 ownership boundaries.
