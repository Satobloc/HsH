# Workshop Relay :36 | h1088:s3 | Elias Kern

**Run key:** `REVROT3-19-20261011:1088:s3`  
**Nominal slot:** 2026-11-25 08:36 UTC  
**Disposition:** `SOURCE_GROUNDED_TRACK_A / PUBLISHER_EVENT_IDENTITY_MAP_REFINED / P0_FRESHNESS_PASS / P0_RECORD_SAFETY_FAIL / NO_IMPLEMENTATION`

## 1. Deterministic selection and identity

- h = 1088.
- seq = 5h + 3 = 5443.
- 5443 mod 19 = 9.
- Selected label: **Elias Kern**, ring index 9.
- Next label: **Nadir Voss**, ring index 10.

This is deterministic routing, not authentication of a historical Elias instance or conversation.

The live automation record shows the current :36 run `c05f69c3-6884-8324-b0bb-4d173008e905`, scheduled for 08:36:00Z, started at 08:37:35.166218Z, still `in_progress`, with `completed_at=null` and `chat_ref=null`. Start was 95.166218 seconds after nominal. This timing alone does not establish a cause.

The cached `latest_result` belongs to the preceding h1087 run `79423b00-6004-832d-ae84-335879aa74c8`, created at 07:51:48.538168Z and completed at 07:51:50.262508Z. Its non-null thread reference matches the task's configured conversation target; the current run's `chat_ref` is null. The cached result is not h1088 output, and a task-level conversation target is not a current-run thread binding. No authenticated Elias thread or cross-thread delivery, consumption, or acknowledgment is claimed. No attempt ID is exposed.

## 2. Historical specialist authority

The primary recoverable role evidence is the 2026-09-24 13:47 ET Nathan-to-Elias entry in `WORKSPACES/ELIAS_KERN/INBOX.md`, blob `250677e079ed012cab54adfcccf9a05a69d7e41c`. It assigns Elias to Track A of the Top/Central/Branch/Hydra prototype with Nathan and Orson, independently but in communication with Sable and Tern's Track B. Each leased pass is to exercise one bounded real-work mechanism, preserve observed behavior, and leave a durable receipt/failure packet. The POC is not production authority.

The Nathan-authored coordination note `WORKSPACES/COMMON/SWITCHBOARD_PROTOTYPE_OPERATIONALIZATION_2026-09-24.md`, blob `28b967dff20e83398b3b7fd3388ab9b6a7cf531a`, identifies Elias as prototype operator/documentarian, Nathan as ergonomics/intended-behavior evaluator, and Orson as the independent cognition observer. It explicitly keeps Track A and Track B independent while allowing evidence exchange.

No standalone signed Elias specialist charter, originating raw conversation ID, or message UUID was recovered. The detailed layer semantics and current composition maps remain assistant reconstruction, not Nathan Direct. The HSH_RESOURCES POC payload was not opened.

## 3. Preflight, source coverage, and Mersearch boundary

Read the live HsH BEDROCK in four contiguous sections (768 lines), Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, Revival Rotation V3/V4, thread-first and navigation preflight controls, duplicate-run-key guard, current branch, relevant receipts, Elias workspace, and the h1088:s2 Hale prestart packet.

Current branch heads checked:
- HsH main: `dfe9b970336fdaca2be9ad8c1d0f96ffde7c8b5d`.
- SAT archive source commit embedded in the verified discovery snapshot: `028862e6f1b0ffad2f56f4989a2cd0a769d266fd`.
- HSH_RESOURCES AI start page read; private POC payload not accessed.

HSH_RESOURCES `indexes/AI_START_HERE.md` confirms that Mersearch is archive-resident, operated through the archive connector and Actions bridge, not a standalone connector action. All four canonical Mersearch request lanes are occupied and remain `requested`; no lane was overwritten, retriggered, released, or replaced. The current lane-2 request is `phy01-internal-first-worldtube-hinton-highercats-20261125-01`. No request-scoped output folder was found for the four current request IDs. The older lane-2 request recorded in the PWH queue is a different request and is not evidence for the current one.

A bounded GitHub code-search fallback was used across HsH and SAT_THEORY_ARCHIVE_2023-25 to locate the historical role source. It is not a Mersearch result and is not exhaustive. No raw originating Elias conversation was recovered. HSH_RESOURCES private payload was not searched.

## 4. Substantive improvement: source-compatible publisher identity composition

I audited the live publisher implementation against the assistant-proposed `PublisherKey` in `WORKSPACES/ELIAS_KERN/EXECUTION_ENVELOPE_COMPOSITION_MAP_v0.2.md`.

Exact current sources:
- `tools/issue_publish.py`, blob `7067e8d9f27a273d90e443afb0493260d9a3ecbf`.
- `.github/workflows/issue-publisher.yml`, blob `66e3261ff13e05bcc915809683b652ea9043703f`.
- Existing PR #951 `EliasPublisherKeyEvidence.lean`, blob `3528637163d85deea7b49386961342eb30610947`.
- Existing PR #951 `EliasPublisherStatus.lean`, blob `7680db10ae9cc895e43f8cf5ef118c2e70336113`.
- Existing Tern PR #1570 attempt-identity formalization, head `832731c6de1be15ba68033b9369c751a2a9a5799`; exact-head Lean run #45528557027 passed.

The workflow triggers on both `issues.opened` and `issues.edited`. The publisher script reads `GITHUB_EVENT_PATH`, validates the issue title/owner/body, computes the content SHA-256, and passes only `submission_id`, content, digest, and `issue.number` to the publish function. It does not read or persist the event action, `issue.id`, issue timestamps, `GITHUB_RUN_ID`, or `GITHUB_RUN_ATTEMPT`. The workflow passes only `GITHUB_TOKEN`. The durable publisher comment records artifact path, commit, and digest, but not the workflow run or attempt.

Therefore the v0.2 proposed `issueOpenedEventId` is not a source-defined field in the current publisher contract and is too narrow for a workflow that also accepts `edited` events. Do not invent a webhook-delivery ID from an issue number or timestamp.

### Corrected typed decomposition (proposal only)

- `IssueResourceKey = (repository, issue.id, issue.number)`.
- `IssueEventSnapshotKey = (repository, issue.id, action, eventPayloadSHA256)`. This identifies the exact raw event-payload snapshot, not the provider's webhook-delivery ID.
- `PublisherExecutionKey = (workflowId, workflowRunId, workflowRunAttempt, IssueEventSnapshotKey, submissionId)`.
- `ArtifactKey = (repository, path, commitSHA, digestAlgorithm, digest)`.
- `PublisherReadbackWitness = (PublisherExecutionKey, ArtifactKey, readbackTime, exactBytesEqual)`.
- `SubmissionOriginBinding = (originatingRunKey, submissionId)`, available only if explicitly carried by a versioned envelope field or separate immutable manifest.

The v1 envelope permits exactly `schema`, `submission_id`, `content`, and `sha256`; it has no typed `originatingRunKey`. The publisher can verify its artifact and readback, but the durable comment alone cannot prove which originating automation run produced the submission. Classify that join `ORIGIN_RUN_UNBOUND`; do not infer it from a submission-ID naming convention or body text.

### Required composition tests

1. `opened` with a valid payload.
2. `edited` with the same submission ID and identical bytes: idempotent artifact, distinct event execution.
3. `edited` with the same submission ID and different bytes: collision rejection.
4. Same workflow run ID with a later run attempt: distinct `PublisherExecutionKey`.
5. Green Actions job with semantic publisher rejection: job success does not imply publication.
6. Publisher artifact readback succeeds but originating automation run is absent: publication may be verified while origin remains unbound.

This refines the existing v0.2 partial-map proposal; it does not replace the four evidence axes or create a second vector. Reuse `EliasPublisherStatus` for job-success-versus-publisher-outcome and Tern's existing `RunObservation.attemptId` gate for optional attempt identity. No duplicate theorem is proposed.

## 5. Durable public updates and P0 currentness

Two additive updates were posted and independently read back exactly:

- [P0 issue #1747 comment #7157534065](https://github.com/Satobloc/HsH/issues/1747#issuecomment-7157534065): latest discovery snapshot is fresh to its generated parent; record safety still fails.
- [PR #951 comment #7157550587](https://github.com/Satobloc/HsH/pull/951#issuecomment-7157550587): publisher event identity and origin-binding correction, design only.

The complete discovery blob was fetched by exact Git blob SHA and parsed:
- Snapshot blob: `7f2b764fb004071a5ffce5a2c85df4c9307fa0d1`.
- Updated: 2026-11-25T08:37:09Z.
- Embedded HsH source: `99ac87ddfdf310329722e1f315c630a90b1a76dd`.
- Current main: `dfe9b970336fdaca2be9ad8c1d0f96ffde7c8b5d`; its parent is exactly the embedded HsH source and the generated commit changes only `PUBLIC_SITE/generated/discovery.json`.

Parsed snapshot:
- 17,865 documents: 14,574 HsH and 3,291 SAT archive.
- 10,933 workspace records, all with generic reader targets and all missing `presentation_state`.
- 10,685 workspace excerpts.
- 48 docket entries, all resolving exactly once.
- 577 visuals: 417 square and 160 non-square.
- Six UTF-8 extraction errors.

Classification: `P0_SOURCE_FRESHNESS_PASS_AT_08:37:09Z / P0_RECORD_SAFETY_FAIL / LIVE_PAPER_A_B_ROUTES_NOT_OBSERVED`. No live reader-route acceptance, deployment, merge, or standdown is inferred. Meridian retains implementation, Mercer independent route QA, and Tern release/standdown authority.

## 6. Gates, PWH, and boundaries

- PR #951 remains OPEN / DRAFT / UNMERGED. Sable's independent Track B `ELIAS-2224` EvidenceLedger/subject-scope disposition remains pending in current Sable/Tern records. No PR head, Lean module, POC, adapter, production workflow, task graph, or scheduler change.
- No new Lean proof or build. Local Lean/Lake/Elan are not installed. Existing PR #951 and #1570 formalizations were inspected and reused; their proofs constrain only their formalized predicates.
- PWH's latest deep review remains Tern h1081:s3. Its next routine review is after five further actual completed worker activations or an earlier material trigger. The intervening relay history contains at least five completed worker reports, but this run did not independently reconstruct every scheduler run ID needed to close Tern's counter. Treat the count as due for Tern reconciliation, not as a completed deep review. Tern retains PWH ownership; no queue or graph edit was made. WH-02 remains Calder-owned; WH-05 remains blocked with all four Mersearch lanes occupied.
- P0 remains ACTIVE. P1 cognition remains overdue/frozen and Orson-owned. P2 November 30 remains HOLD. P3 December 14 remains INCOMPLETE.
- FIE rereview next due December 8; unrelated-source break next due November 28.
- No physical system, dataset, fit, calculation, prediction, uncertainty propagation, or falsification threshold. No SAT-O or Blockwave equation change, manuscript modification, or BEDROCK theory promotion.
- No new tool, dependency, fork, subscription, or expenditure. No HSH_RESOURCES private payload access.

No Common receipt or Elias workspace pointer was rewritten under the standing P0 interlock. This public report is the durable run record. The PR/P0 comments are additive; no duplicate report issue was found before submission.

## 7. Next cursor and scheduler preservation

Next ring label is Nadir Voss. The existing Hale prestart packet was read; it is optional repository context only. No new handoff, assignment, response obligation, or direct-thread delivery is claimed.

The existing :36 Worldtube automation remains enabled with task ID `6a9f52b69ec08191b0a2ba24a074f781` and exact schedule:

`DTSTART;TZID=America/New_York:20261001T143600`  
`RRULE:FREQ=HOURLY`

No task ID, schedule, phase, prompt, cadence, enabled state, or ownership change. No sixth task, signet, or conversation rename.

**Final:** `H1088:S3 / ELIAS_TRACK_A_SOURCE_GROUNDED / PUBLISHER_EVENT_IDENTITY_MAP_REFINED_DESIGN_ONLY / P0_FRESHNESS_PASS / P0_RECORD_SAFETY_FAIL / TRACK_B_PENDING / NO_IMPLEMENTATION / NO_NEW_LEAN_PROOF / NO_PHYSICAL_REANALYSIS / ORIGIN_RUN_UNBOUND / NO_CROSS_THREAD_CLAIM / TASK_UNCHANGED / NO_SIXTH_TASK`.
