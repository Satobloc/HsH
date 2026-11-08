# Aster ring-label h680:s3 — Attempt-snapshot lineage test case

**Status:** INTERNAL WORKFLOW ADDENDUM / CASE FOR THE EXISTING EVIDENCELEDGER PROPOSAL / NOT A CANONICAL SCHEMA CHANGE. No theory promotion, paper-gate advancement, new tool, PR, or public publication.

**Execution attribution:** current assistant work under the deterministic Aster ring label. This is not an authenticated historical Aster thread or evidence that the historical Aster instance participated.

## 1. Deterministic occurrence

- Scheduled occurrence: `2026-11-08T08:36:00Z`.
- Nominal UTC hour: `h=680`.
- Sequence: `5h+3 = 3403`.
- `3403 mod 19 = 2`: Aster (index 2).
- Successor: Ariadne (index 3).
- Run key: `REVROT3-19-20261011:680:s3`.
- Existing :36 task ID: `6a9f52b69ec08191b0a2ba24a074f781`.
- Task remains enabled with its original hourly America/New_York DTSTART/RRULE and :36 phase.

The HsH repository default branch is `main`; the current workflow control branch is `CTRL-2026-09-20-GENERALIST / CTRL-03`. No branch was created or changed.

## 2. Historical Aster remit recovered

The original raw conversation export was recovered from HsH:

- Conversation: `6ab006ce-e358-83ea-b3dd-7b23a26c00fa`.
- Raw export blob: `1bf6e65c4ac1650297acb67d7e39f700454a03c8`.
- Direct user message `d15369d1-1412-4f4a-9460-702d2de573ea`: source-critical review asks whether a draft reads like Nathan, whether he has said the substance, and whether it contradicts earlier statements.
- Direct user message `01505af7-37cd-491f-a951-1822934e36ff`: assigns Paper A review.

The historical specialty is source-critical attribution and faithful review, not authority to rewrite source material. Current Aster continuity records Paper A review as frozen. This run did not reopen that review or alter the accepted manuscript state.

## 3. Controlling materials and current project boundaries

Read from the live HsH default branch:

| Material | Blob SHA |
|---|---|
| BEDROCK.md | `0253ace674bbc361464b7bbaac2c41aa3d8e8867` |
| Primary Operational Guideline, 2026-11-08 | `933da3b2e162f057d162f3a4c1ba4ea0a7bb9312` |
| Steering Charter 2026-10-26 | `04822f3e48f746e9e464d893636ed4a670d68683` |
| Three Paper Campaign | `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4` |
| Three-repository onboarding | `fe40260cda5ce360909f2adfd64a3cc3e2c92a05` |
| Current workflow orientation | `2bb6d996ca61f41b2b3fb34480cab1acf906bd4f` |
| Revival Rotation V3 | `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14` |
| V4 not-found revival | `6761337dfcd0847226ee7baad84db0a9c496760a` |
| Duplicate run-key guard | `14531964363c1fa3e6bf1e493a6d744d8a02d4da` |
| Task branch graph | `d42d13f61b8dd8495ed41859fc1a5564abe0c6da` |
| Code Grurple roster | `cc96c0bfafc95c54e7960899c7306031e5abce17` |
| Coordination record | `c23bdf7728f19d3fd23d464ef3377f5aab42b360` |

Code Grurple remains ACTIVE/P0. Paper A/B manuscript review and acceptance remain closed; reader presentation remains a separate unresolved gate. P1 cognition (Nov 9), P2 measured-system geometry (Nov 30), and P3 full theory (Dec 14) remain separate. Orson's cognition ownership is preserved. P2 has no selected measured system for a new calculation. No paper gate advanced.

FIE's last full review remains October 27; the next review point is November 10. It was not prematurely repeated.

## 4. New live case: one occurrence, multiple start-time snapshots

The current read-only Automations peek returned:

```text
automation_id: 6a9f52b69ec08191b0a2ba24a074f781
last_run.id: 4d6ec1ef-e230-8320-bc04-94cec10bc22e
last_run.scheduled_for: 2026-11-08T08:36:00Z
last_run.started_at: 2026-11-08T09:45:09.914064Z
last_run.recorded_status: in_progress
last_run.completed_at: null
last_run.chat_ref: null
```

The repository-preserved earlier `COORDINATION.md` snapshot records the **same run ID and scheduled_for**, but `started_at=2026-11-08T08:33:35.595917Z`. That earlier record did not preserve its own observation timestamp.

The two reported start values differ by **4,294.318147 seconds (71m34.318147s)**. The earlier value precedes the scheduled time by 2m24.404083s; the current value follows it by 1h09m09.914064s. No separate attempt token is exposed. This is a start-time snapshot divergence, not proof of a retry, a scheduler correction, or a distinct worker. Preserve both values and classify attempt lineage as unresolved.

The same peek's cached `latest_result` is a different occurrence:

```text
latest_result.run_id: 1e922715-7540-8332-897d-0a1d03f0e210
latest_result.scheduled_for: 2026-11-08T06:36:00Z
latest_result.created_at: 2026-11-08T07:37:45.850046Z
latest_result.completed_at: 2026-11-08T07:37:48.698339Z
```

Its content says h679/Mercer, while its scheduler timestamp maps to h678. It is not the current h680 result and must not be attributed to this run. The pre-existing h678/h679 discrepancy is already routed to Tern; this report does not reopen or amend that ownership. The task-level `conversation_id` is not the current run's `chat_ref`. Because `chat_ref=null`, no current Aster thread is authenticated and no chat delivery, consumption, or acknowledgment is claimed.

The current task's `last_run_time` field still reflects an earlier result time; it is not used as the occurrence identity or as proof of completion.

## 5. Existing formalization inspected, not modified

Elias's existing PR #951 already separates scheduled occurrence identity from attempt/result compatibility:

- PR head: `4aa7b8e02f01bd2ed847332507c39782dbbd36a2`.
- Merge-reference commit: `57be06f5f95beb27fb23e0f4e676fe1ea36c04c0`.
- `EliasProofTargetIdentity.lean` blob on PR head and merge reference: `8fa26f99f22eeafcbc6a26cbc2f6f4b1c58646c5` (exact target-module blob match).
- Actions run #42402136180; job #128492003772; SUCCESS.
- Actual log: Lean 4.34.0 / Lake 5.0.0; root build completed successfully in 8,957 jobs.

The module defines `AutomationOccurrenceIdentity` with automation ID, scheduled slot and run ID; `AutomationAttemptObservation` with optional attempt token, start time, status and completion; and a separate result observation. The existing theorems reject mismatched occurrence identity and a result created before an attempt. The current h598 replay also demonstrates a stale latest-result rejection.

The target module's relevant identity/temporal theorems reported no custom axioms; other record theorems use standard `propext`, `Classical.choice`, and `Quot.sound`. Tests, lint, nanoda and the separate global axiom-audit stage were skipped. This was a successful merge-reference build with an identical target-module blob, **not** an exact-head-only repository build. It does not authenticate the connector or prove scheduler backend semantics.

Aster's PR #1444 was also checked and left untouched: its existing Lean 4.34.0 merge-reference build #42435344972 succeeded, but exact-head-only verification remains unestablished.

## 6. Substantive improvement: add a snapshot-observation layer to the existing ledger proposal

This h680 case exposes a specific gap between an attempt record and the history of observations made about that attempt.

The existing Elias model can store one `startedAtUnixMicros` value and an optional `attemptToken`. It does not preserve the time at which each connector snapshot was observed. When the same occurrence/run ID is later reported with a different start time, overwriting the first value destroys evidence; choosing either value silently asserts an interpretation the connector does not provide.

**Proposed additive record, for Track B review only:**

```text
AutomationSnapshotObservation {
  observedAtUnixMicros
  automationId
  scheduledFor
  runId
  observedStartedAtUnixMicros
  observedStatus
  observedCompletedAtUnixMicros?
  observedChatRef?
  latestResultRunId?
  latestResultScheduledFor?
  latestResultCreatedAtUnixMicros?
  lastRunTime?
  sourcePayloadDigest
}
```

This is a snapshot of what the connector reported at a particular observation time, not a new attempt identity. It belongs as a child observation of the existing occurrence/attempt/result model, not as a competing EvidenceLedger.

**Acceptance semantics:**

1. Preserve each snapshot append-only and order it by `observedAtUnixMicros`; never overwrite an earlier start value.
2. Equal automation ID, scheduled slot and run ID establish the same reported occurrence, not necessarily the same execution attempt.
3. If the attempt token is absent and start-time snapshots differ, classify `ATTEMPT_LINEAGE_UNRESOLVED`. Do not infer retry, correction, or distinct worker.
4. Keep `latest_result` as a separate pointer. Bind it to the current occurrence only when automation ID, scheduled slot and run ID match; temporal compatibility is an additional necessary check, not sufficient proof.
5. A null `chat_ref` means no current thread binding. A deterministic ring label is a routing label, not an authenticated actor.
6. A stale result pointer must not populate the current run's output or receipt.

**Observed h680 classification:**

| Axis | Status |
|---|---|
| Scheduled occurrence | `h680:s3 / Aster` |
| Attempt lineage | `UNRESOLVED_START_SNAPSHOT_DIVERGENCE` |
| Current result | `MISSING` |
| Cached latest result | `STALE_DIFFERENT_OCCURRENCE` |
| Authenticated current thread | `NOT_ESTABLISHED` |
| Worker identity | `DETERMINISTIC_LABEL_ONLY` |

This is a concrete acceptance case for Elias's existing EvidenceLedger/attempt-result work. PR #951 remains Elias-owned and draft/open/unmerged; its EvidenceLedger implementation is blocked pending Track B disposition. No PR, schema, Python adapter or production workflow was changed. The proposed snapshot layer is **not formalized or Lean-verified**.

## 7. Source-authority sidecar: 2026-11-08 Primary Operational Guideline

BEDROCK entries ND-2026-11-08-01/02 identify direct user statements, while the Primary Operational Guideline file explicitly says it is an assistant-prepared, non-verbatim transcription and that no immutable message UUID/export locator was available.

A prior-context lookup returned two user-message timestamp references, 09:19:09Z and 09:30:43Z, but no raw message UUID or export. Bounded GitHub code searches across HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES found the current guide/BEDROCK transcription but no raw source conversation. All four Mersearch request lanes remain `requested`:

- `calder-angle-geometry-source-fidelity-20261102-1337`
- `archive-harvest-20261025-optics-01`
- `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`
- `kestrel-finite-core-geometry-source-fidelity-20261102-2200`

No lane was overwritten or retriggered. This is not a Mersearch result and the raw source is not recovered.

For provenance purposes, keep authority and locator separate: `NATHAN_DIRECT` is the prior-context authority attribution; locator state is `PRIOR_CONTEXT_TIMESTAMP_ONLY / RAW_EXPORT_NOT_RECOVERED`; the repository guide is `ASSISTANT_PREPARED / NONVERBATIM`; exact quotation is `NOT_VERIFIED`. Do not use the guide as a verbatim Nathan quotation. No BEDROCK edit or authority change was made.

## 8. Tooling, calculation and freshness boundaries

The three repositories were consulted: HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES. The HSH_RESOURCES Tool Chest and existing Math Hopper/Whirligig documentation were checked, as were existing Lean PRs #873, #951, #1444 and #1471 and the available SciSpace connector. No new tool, fork, dependency, plugin, paid service, branch or PR was needed. No local Lean/Lake/Elan executable or local repository checkout was present.

The only new arithmetic was administrative scheduler arithmetic and a timestamp difference, executed from actual scheduler observations. No physical calculation, data-free theory calculation, invented fixture, fit, prediction, or independent measurement was performed. No SAT-O or Blockwave equation was edited.

An unrelated source reading continued in Charles Babbage, *Reflections on the Decline of Science in England*, lines 1581–1620. Next cursor: line 1621. The passage argues that experimental errors should be acknowledged openly, criticism should remain unreserved, and observers should disclose instrument condition and precautions so others can judge conclusions. This supports the provenance discipline here; it is not evidence for H(s)H.

## 9. Handoff and limits

The deterministic successor is Ariadne, h680:s4. Its :48 automation run is already recorded FAILED (run `edb4a1be-5590-8331-845f-ab63721408f3`, scheduled 08:48Z, started 09:25:46.594925Z, completed 09:50:59.798775Z, `chat_ref=null`). Any handoff is therefore late optional repository context only; no thread delivery, consumption, acknowledgment, task, response obligation or ownership transfer is claimed.

Next useful action when a Mersearch lane becomes free: recover the raw source conversation for ND-2026-11-08-01/02 and attach immutable message/export locators. Separately, Elias/Track B may consider the snapshot-observation test case when the existing review gate permits. Tern retains the existing h678/h679 scheduler mismatch.

No BEDROCK theory promotion, paper advancement, new task, task-ID/schedule/phase change, signet use, conversation rename, or cross-thread delivery claim occurred.
