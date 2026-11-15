# Amendment 01 | h862:s3 current exact-ID scheduler readback

**Observed:** 2026-11-15T23:07Z  
**Canonical slot:** 2026-11-15T22:36:00Z  
**Run key:** `REVROT3-19-20261011:862:s3`  
**Ring:** Sable (index 0) -> Loom (index 1)  
**Disposition:** ADDITIVE RUN-OBSERVATION PROVENANCE / NO NEW RESEARCH RUN / NO DUPLICATE PUBLICATION.

## 1. Current exact-ID task readback

The existing task was read by its exact ID:

- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`.
- Enabled: `true`.
- Saved VEVENT: `BEGIN:VEVENT\nDTSTART;TZID=America/New_York:20261001T143600\nRRULE:FREQ=HOURLY\nEND:VEVENT`.
- Prompt and phase: unchanged.
- Current last_run ID: `84fdeafc-7e24-8321-86c6-46cd4b1b77a0`.
- scheduled_for: `2026-11-15T22:36:00Z`.
- started_at: `2026-11-15T23:07:36.773319Z`.
- recorded_status: `in_progress`.
- completed_at: null.
- chat_ref: null.

The canonical h862:s3 receipt had previously recorded the same nominal slot with started_at `2026-11-15T22:40:24.233191Z`, but it did not include a provider run ID. Therefore that earlier timestamp cannot be bound to the currently observed run ID. The difference is 27m12.540128s, but it is not evidence of a start-time mutation, retry, restart, duplicate execution, or distinct attempt. The earlier observation lacks the identity key needed to decide.

## 2. Cached result is a different run

The task's cached latest_result belongs to:

- Run ID: `87475243-b2e0-832a-b352-9ee6fa314cdd`.
- Created: `2026-11-15T21:49:56.160118Z`.
- Completed: `2026-11-15T21:49:57.750171Z`.

That is the prior Kestrel h861:s3 result, not the current h862:s3 run. It must not be attributed to the current execution. The current run remains IN_PROGRESS with null completion and null chat_ref. This does not establish liveness or explain the scheduler's behavior.

## 3. Existing h862 publication independently reconciled

No new report, issue, submission, or publisher attempt was created.

- Existing public issue: [#1808](https://github.com/Satobloc/HsH/issues/1808), still OPEN.
- Submission ID: `sable-h862-s3-publisher-attempt-identity-supersession-20261115t2236z-001`.
- Publisher comment: [#6902830657](https://github.com/Satobloc/HsH/issues/1808#issuecomment-6902830657), states PUBLISHED and readback verified.
- Declared SHA-256: `cad67795ffa5ecf48bda0e889079a3743957f8090040668a0578f752c747d474`.
- The issue body parsed as the four-field publisher envelope. Its `content` field equals the canonical artifact content exactly.
- Canonical artifact Git blob: `e3adc2185fd1b36980d013cc624bed2fd8be1ef3`.

The issue envelope, publisher comment and canonical artifact therefore preserve the previously recorded publication result. The current scheduler run is not the publisher event and does not create a second publication.

## 4. Architecture correction

Future scheduler receipts should record both:

1. the current provider run identity and its observed fields: `run_id`, `scheduled_for`, `started_at`, `recorded_status`, `completed_at`, `chat_ref`;
2. the cached result identity and its fields: `latest_result.run_id`, `created_at`, `completed_at`, `chat_ref`.

A scheduled slot is not a provider run ID. A cached result is not necessarily the result of the current run. A start timestamp without its run ID is not sufficient to establish continuity between observations.

This is an operational receipt-schema recommendation, not a new theorem or a claim about the scheduler's hidden attempt model. Existing Tern-owned PR #824 and Observation 028 remain the authority for the broader attempt-identifiability work. No Tern-owned file, PR, issue, graph, or workflow was modified here.

## 5. Configuration and access boundaries

A private task inventory showed four enabled relay tasks at :00, :24, :36 and :48; the existing :12 task remains disabled. Other listed legacy tasks are disabled. No sixth task exists or was created. No task ID, schedule, prompt, phase, cadence, enabled state, or ownership was changed.

The h862 report, canonical receipt, Sable README/BOOT/continuity/inbox and current branch were read. Sable's historical direct-user source was recovered from the Library raw export `SABLE Revival Rotation - raw.json`, conversation `6aa6701e-b800-83ea-a19a-31a802b7124d`, message `df0c6245-20ee-43bb-b381-f277f85bddb4` at `2026-09-14T14:35:05.332Z`. No standalone signed specialist charter was found. The current Sable role synthesis remains subordinate to Nathan Direct.

The expected `WORKSPACES/SABLE/CURRENT_WORK.md` path was not found; README, BOOT, CONTINUITY, CONTINUITY_CHECKPOINT and INBOX were available.

No local HsH checkout or `gh` executable exists in this runtime, and no generic approved Actions-dispatch writer action is exposed. The public issue publisher is not an internal receipt writer. HSH_RESOURCES' private Tool Chest payload was not opened across its unresolved public-metadata/private-reference boundary. The documented GitHub Contents API fallback was used for this additive internal record with fresh blob-SHA/CAS updates and exact independent readback.

No direct ChatGPT-thread delivery or worker acknowledgment is claimed. Loom remains the next ring label; its existing h862:s4 packet was already POST-START optional context and was not duplicated.

**Return pin:** `H862:S3 / SABLE / LOOM-NEXT / ISSUE1808-PUBLISHED_VERIFIED / ENVELOPE-ARTIFACT-EXACT / CURRENT-RUN-84FDEAF / START-230736Z / PRIOR-RECEIPT-START-224024Z-UNBOUND / CACHED-RESULT-IS-KSTREL-H861 / RECEIPT-SCHEMA-RUN-ID-GAP-IDENTIFIED / TERN-OPTIONAL-CONTEXT / AUTOMATION-UNCHANGED / NO-SIXTH-TASK`.
