# Source Identity Gate
**Owner:** Morrow archive/source-custody workspace  
**Status:** operational method; not theory authority  
**Introduced:** h857:s3, 2026-11-15

## Purpose

Prevent filename, path, index metadata, repository content identity, extraction derivatives, authorship, and intent from being collapsed into one unsupported claim.

## Required evidence layers

1. **Display label:** the filename or title used by a source. A label is a locator, not an identity.
2. **Local path record:** filesystem path and recorded timestamps. These are metadata, not proof of authorship, composition date, or byte identity.
3. **Repository path:** the current tracked location. A path can be an alias or duplicate.
4. **Git content identity:** Git blob ID and byte length. Equal blob IDs establish identical repository content, not independent witnesses.
5. **Raw-byte digest:** independently computed SHA-256 over the retrieved file bytes. Compare it with any source digest asserted by an extraction manifest.
6. **Derivative binding:** extraction request ID, source digest, tool, OCR status, page count, output path, and derivative blob. A matching source digest binds the derivative to those bytes; it does not establish who authored the source or how the derivative was used.
7. **Authorship and intent:** require a source-specific author/byline or direct user-role statement. Do not infer either from a filename, extraction requester, repository path, or matching hash.

## Allowed conclusions

- Equal Git blob IDs across paths mean those tracked paths contain identical Git object content.
- A separately computed raw-byte SHA-256 matching the extraction manifest's source SHA verifies the binary-to-manifest binding.
- Identical extracted page text supports a text-content correspondence, not a PDF build-lineage claim.
- Multiple paths to one blob are aliases, not independent source witnesses.
- Local index rows may be grouped by recorded metadata, but remain unbound to repository paths until a path-level crosswalk exists.

## Forbidden shortcuts

- Same filename does not imply same document.
- Same title does not imply same version.
- Same blob does not imply independent corroboration.
- Filesystem creation/modification times do not establish authorship or in-document date.
- Extraction metadata does not establish source authorship or Nathan Direct intent.
- A source-content match does not authorize theory integration, equation correction, physical prediction, or BEDROCK promotion.

## Status vocabulary

- CONTENT_IDENTITY_VERIFIED
- EXTRACTION_SOURCE_BINDING_VERIFIED
- LOCAL_PATH_MAPPING_UNRESOLVED
- AUTHORSHIP_UNRESOLVED
- INTENT_UNRESOLVED
- NATHAN_DIRECT_NOT_ESTABLISHED

Use only the statuses supported by the recorded evidence. Preserve unresolved edges rather than filling them with contextual guesses.


## Additive Layer 8 — Repository Snapshot Binding
**Introduced:** h876:s3, 2026-11-16. This is an additive source-custody requirement; it does not replace or renumber the original seven evidence layers.

A Git blob identifies content bytes, not the repository snapshot, tree, path membership, or chronology in which those bytes were observed. For every version-specific source claim, record the pinned tuple:

`(repository_full_name, commit_sha, tree_sha, path_at_commit, blob_sha)`

Required fields:
- repository full name and ref observed;
- exact commit SHA and tree SHA;
- exact path at that commit;
- Git blob SHA-1 and byte length;
- separately computed SHA-256 over the retrieved UTF-8 bytes;
- commit author and committer timestamps, explicitly typed as repository metadata;
- commit signature status (verified / unsigned / unavailable / not checked);
- exact membership-check method and result, including whether a recursive tree response was truncated;
- stable source ID (conversation ID/document ID) and message/record locators where applicable;
- retrieval time, or an explicit statement that it was not separately recorded.

**Rules:** a branch name is a moving pointer; pin the commit/tree. A commit timestamp is not a source composition date. Commit-account metadata is not source-content authorship. Snapshot membership is not runtime context retrieval, thread identity, or delivery. Two exports sharing a conversation ID are not byte-identical or independent by that fact alone. A missing path, blob mismatch, truncated tree, or digest mismatch yields `SNAPSHOT_MEMBERSHIP_NOT_VERIFIED`; never silently fall back to the current path.

Recommended statuses: `SNAPSHOT_MEMBERSHIP_VERIFIED`, `SNAPSHOT_MEMBERSHIP_NOT_VERIFIED`, `SNAPSHOT_HISTORY_UNRESOLVED`, `COMMIT_SIGNATURE_UNSIGNED`, and `SOURCE_AUTHORSHIP_UNRESOLVED`.

Applied witness: [h876:s3 Morrow repository snapshot witness](2026-11-16T1236Z_H876_S3_REPOSITORY_SNAPSHOT_WITNESS.json). It records two exports of conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36` at exact HsH main commit/tree, their distinct Git blobs and SHA-256 digests, and their node-level delta. The witness is source-custody evidence only; it does not lift the theory stop.

## Layer 8 clarification — negative path membership vs content retrieval

Path membership and content retrieval are separate observations:

- `path_membership_status`: `PRESENT`, `ABSENT`, or `UNKNOWN`.
- `content_retrieval_status`: `READ`, `EMPTY`, `ERROR`, or `NOT_ATTEMPTED`.

Record `PATH_ABSENT` only when the exact commit/tree is pinned, a recursive tree enumeration is complete (`truncated=false`), and the exact path is not present. A failed or empty path-content fetch is not evidence of absence. If the exact tree contains the path but the content reader fails, record `PATH_PRESENT_CONTENT_UNREADABLE`. If the tree is unavailable or truncated, record `PATH_MEMBERSHIP_UNKNOWN`.

An exact tree-membership witness can establish that a path exists even when a separate content-read operation fails. Conversely, a successful current-path read does not establish membership in an earlier snapshot unless it is fetched at that exact commit/ref.

Applied correction: h876:s3 Amendment 03 confirms `WORKSPACES/MORROW/INBOX.md` and `WORKSPACES/MORROW/TRIAL_CHECKPOINT.md` were present in the pinned 2026-11-16T12:57Z tree; the earlier report's absence statement was incorrect. See `2026-11-16T1322Z_H876_S3_NEGATIVE_PATH_MEMBERSHIP_CORRECTION.md`.


## 9. Attachment / retrieval / repository chronology

Treat these as distinct typed events, not interchangeable dates:

1. **Attachment event:** a raw conversation's system attachment metadata records a file ID in the context of a user turn. It supports that the file was supplied/available in that conversation; it does not establish the embedded author's identity.
2. **Repeat attachment record:** the same file ID appears again in a later raw conversation or later system injection. Record the new exposure timestamp, but do not call it a new content version or independent source witness without a new file identity or changed bytes.
3. **Retrieval event:** a file-search/tether-quote/tool result returns content for an existing file ID. This is retrieval, not a second upload.
4. **Repository path commit:** pin the exact repository, path, commit, tree and blob. The first commit returned for a path establishes tracked repository history at that commit; it does not establish the file's composition date or first existence outside that repository.
5. **Composition/authorship event:** require a source-specific authoring turn, byline, or direct user-role statement tied to the artifact. If absent, retain UNKNOWN even when the prose has a recognizable voice.

Do not call an attachment event a repository copy, a retrieval event an upload, or a Git commit timestamp a composition date. When one file ID recurs across raw exports, group the events by that ID while retaining every conversation/node/timestamp separately. Bind content identity independently through exact text comparison, Git blob identity, and a recomputed raw-byte digest when available.

Applied correction: h910:s4 distinguishes the first verified BLOCKWAVE.txt attachment event (2025-09-16), repeat same-file-ID attachment records (2025-09-18), the file-search retrieval event (2025-09-16), and the first extant HsH path commit returned (2026-10-08). Embedded authorship remains UNKNOWN.


## Layer 10 — Evaluation-event / artifact binding
**Introduced:** h914:s3, 2026-11-18. This is an additive source-custody crosswalk; it does not redefine the typed event taxonomy in Aldus PR #1860 or Hale's prediction/holdout hard gate in PR #1487.

A typed preregistration, prediction-seal, holdout-access/unblind, evaluation, or replication event must bind to the exact artifact(s) it asserts occurred. Event chronology and artifact identity are separate evidence axes: a hash identifies bytes; a timestamp orders an event only under its declared source/clock/scale and uncertainty; neither alone authenticates actor, exposure, isolation, completeness, or independence.

Required event/artifact tuple:
- stable event ID/type, claim/protocol ID, actor or exact run+attempt attribution (otherwise UNKNOWN), causal parent event IDs, and evidence locator;
- exact artifact identity using Layer 8's repository/commit/tree/path/blob tuple, byte length, and independently computed raw-byte SHA-256; for non-Git sources use provider/source ID and version plus digest where obtainable, without inventing Git fields;
- event-time interval, named clock domain/scale and time-source evidence; separately observed-at interval and retrieval/audit source;
- versioned model/code, parameter state, calibration/data manifest, holdout-partition manifest and split unit (event/experiment vs frame/view), observation/readout version, metric, threshold, and uncertainty source bound to the frozen protocol artifact;
- exact frozen prediction-output bytes/digest and prediction-seal event ID;
- source-identified access/unblinding events and exact evaluation-result artifact (code, inputs, outputs, residuals/decision); deviations are new linked events, never silent protocol rewrites;
- replication event tied to distinct acquisition/run provenance and protocol/result artifacts. Distinct source IDs alone do not establish statistical independence.

Append-only event records preserve corrections as new linked records. Do not infer timestamp, actor, independence, completeness, or causal role from filename, issue number, run label, or hash alone. A prediction digest establishes byte identity, not generation time or holdout isolation. Incomplete access history remains UNKNOWN.

Suggested status vocabulary, on independent axes: EVENT_ARTIFACT_UNBOUND, EVENT_ARTIFACT_IDENTITY_VERIFIED, PREDICTION_BYTES_VERIFIED, SEAL_TIME_ORDER_VERIFIED, HOLDOUT_ACCESS_HISTORY_UNKNOWN, HOLDOUT_ACCESS_HISTORY_VERIFIED, EVALUATION_RESULT_BOUND, REPLICATION_LINEAGE_VERIFIED. Use VERIFIED only for the specific evidence actually checked. These statuses are operational evidence labels, not theory authority or empirical validation.


## Layer 11 — Speaker-role / person-identity attribution
**Introduced:** h933:s3, 2026-11-18. This is an additive source-custody requirement; it does not renumber or replace Layers 1-10.

A raw conversation export can establish the role value recorded for a message without independently authenticating the real-world person behind that role. Keep the exported speaker role, any author-name field, the project's role-to-person attribution convention, external identity authentication, and present runtime/thread identity as separate evidence axes.

For each archived message used to establish a direct instruction, role, preference, correction, or authority claim, preserve:

1. The Layer 8 snapshot tuple, source conversation ID, raw path, node key, embedded message ID, and node/message-key agreement or mismatch.
2. Exact `author.role` value from the message record.
3. Exact `author.name` value, including `null`; never fill a missing name from context.
4. Exact `message_source` or equivalent field when present; preserve absent/null separately from a value.
5. Message-level `create_time`, source field and unit; keep conversation-level `create_time` and `update_time` separate.
6. The archive role-to-person convention actually applied, with its controlling source/version.
7. External identity-authentication status, independently of the archive convention.
8. Copy/duplicate/snapshot relations: same event in another snapshot, exact duplicate in another conversation, derivative, or independent source event.
9. Attribution scope: the exact message and claim attributed. An assistant-authored neighboring message never inherits user-role attribution.

In the preserved project archives, `author.role=user` is attributed to Nathan for internal source purposes under `WORKSPACES/COMMON/TRAINING_SOURCE_MAP.md`. This is an archive convention, not an additional raw-message field and not external account/person authentication. Where the convention is used, describe the source as **user-role source attributed to Nathan by the project archive convention**. Do not silently upgrade that to external identity authentication.

Use orthogonal statuses rather than one composite `VERIFIED` label:

- `MESSAGE_ROLE_VERIFIED`
- `AUTHOR_LABEL_NULL` / `AUTHOR_LABEL_PRESENT`
- `ARCHIVE_ATTRIBUTION_BY_CONVENTION`
- `EXTERNAL_IDENTITY_AUTHENTICATED` / `EXTERNAL_IDENTITY_NOT_AUTHENTICATED`
- `MESSAGE_NODE_BINDING_VERIFIED` / `MESSAGE_NODE_BINDING_UNVERIFIED`
- `DUPLICATE_CONTENT_RELATION_VERIFIED` / `INDEPENDENT_SOURCE_RELATION_NOT_ESTABLISHED`
- `ATTRIBUTION_CONFLICT`

Rules:

- `author.role=user` establishes that the pinned export records a user-role message; apply the project convention only when its source and scope are explicit.
- `author.name=null` remains null. Do not replace it with Nathan, a worker name, or a guessed account identifier.
- `author.role=assistant` remains assistant-authored even if the assistant names itself or describes a role.
- Repetition of one message across snapshots of the same conversation is not multiple independent source events.
- Exact text copied into another conversation is a duplicate-content relation, not independent identity confirmation.
- A raw export, archived title, automation label, deterministic ring selection, or `chat_ref=null` does not establish a currently usable ChatGPT thread or cross-thread delivery.
- If conversation-level timestamps conflict with later message-level timestamps, preserve the anomaly and use the exact message-level `create_time` for the message event.
- Missing external authentication is not negative evidence about who actually authored the message; it is simply an unverified identity edge.

**Applied witness:** Morrow's provisional Team Archivist source message `402ade01-7116-4efb-9b14-31e477754458` is recorded as `author.role=user`, `author.name=null`; the project archive convention attributes it to Nathan for internal source purposes. The adjacent assistant self-description `32ef4db5-269f-5c1c-8408-188c956cca52` remains assistant-authored. The separate duplicate role-clarification prompt in conversation `6a9bd6f4-8104-83ea-ac9b-ab97497a280e` is not independent corroboration. Morrow's September 13 stop and later trial invitation remain distinct message events; the later invitation does not expressly release the earlier stop. See the verified batch and corrections:
- `../COMMON/verified_batches/2026-10-30-MORROW-TEAM-ARCHIVIST-ARCHIVE-APPRAISAL-01.md`
- `../COMMON/tagging_ledgers/2026-10-30-MORROW-ROLE-SOURCE-ID-CORRECTION-01.md`
- `../COMMON/tagging_ledgers/2026-11-14-MORROW-DIRECT-ROLE-STOP-TRIAL-RAW-SOURCE-CORRECTION-01.md`

This layer is source-custody policy, not theory authority, an identity-authentication claim, or permission to resume quarantined theory work.


### Layer 11 source-reparse amendment | h933:s3 | 2026-11-18

The two immutable raw Morrow snapshots were retrieved by Git blob SHA and parsed after the initial Layer 11 report. Both have conversation ID `6a9ee7ca-d340-83ea-b99d-6a3097429f36`; they are snapshots of one conversation, not independent witnesses.

- Earlier blob `362075c5e32ec9e97579bd1de58fba7f612cb6bb`: 465 mapping keys / 464 message-bearing nodes; top-level `update_time=2026-09-09T12:45:43.552007Z`.
- Later blob `ee394b446b2e36d35fd1e5ecd004685c0422457b`: 697 mapping keys / 696 message-bearing nodes; top-level `update_time=2026-09-14T07:11:01.416857Z`.
- The 2026-11-14 source-correction ledger and 2026-11-15 revalidation incorrectly attribute the earlier snapshot's September 9 `update_time` to the later snapshot. This amendment supersedes that attribution. The later snapshot's September 14 `update_time` is after the September 13 stop and trial messages; there is no later-snapshot update-time anomaly on this evidence.
- Direct raw fields for messages `2c6ae3c8-f6f9-4d7b-b3df-66ea1ca2bed9`, `32ef4db5-269f-5c1c-8408-188c956cca52`, `402ade01-7116-4efb-9b14-31e477754458`, `934e87de-4e61-4622-a0ea-e5047aa235c6`, and `99ae959b-fbeb-4c1e-9326-a6723c2b9557` show `author.name=null` and empty `author.metadata={}`. Roles are respectively user, assistant, user, user, user. The three later-only user messages are absent from the earlier snapshot.
- For each named record, mapping key, node `id`, and embedded `message.id` agree. `message_source` is null for the four user messages; the assistant self-description has no top-level `message_source` field.
- The assistant first self-names Morrow in message `32ef...`; the later user-role message `402ade...` addresses the worker as Morrow and assigns the provisional Team Archivist remit. Do not attribute the assistant's self-description to the user.
- No external account/person identifier appears in the parsed `author` objects. The project archive convention still maps user-role sources to Nathan for internal attribution only; external identity remains unauthenticated.

See `WORKSPACES/COMMON/tagging_ledgers/2026-11-18-MORROW-RAW-BLOB-METADATA-REPARSE-CORRECTION-01.md` for full source table and correction scope. This changes no role, theory-stop, quarantine, trial, or BEDROCK status.


## Layer 11 applied witness 02 — duplicate role-clarification prompt in a second conversation
**Introduced:** h937:s2, 2026-11-19. This is a second applied case, not a second Morrow appointment, an independent identity witness, or a change to the Layer 11 rule.

### Layer 8 snapshot tuple

- Repository: `Satobloc/HsH`; ref observed: `main`.
- Pinned commit: `cec0f8d854efbf46d71e998d48f86079db190f50`.
- Pinned tree: `774c63edf300da396e89ea6596434258097e2121`.
- Commit author and committer: `github-actions[bot]`; both timestamps `2026-11-19T01:21:06Z`; signature status: unsigned.
- Membership method: exact GitHub Contents directory listings queried with `ref=cec0f8d854efbf46d71e998d48f86079db190f50`; each exact path returned the expected blob SHA and byte length. A recursive repository-wide tree enumeration was not performed; no `truncated` result is claimed.
- Stable source ID: conversation `6a9bd6f4-8104-83ea-ac9b-ab97497a280e`.
- Retrieval: direct Git blob reads during h937:s2 on 2026-11-19 UTC; exact per-request seconds were not separately recorded.

| Snapshot | Path at pinned commit | Git blob SHA-1 | Byte length | Correct SHA-256 of UTF-8 re-encoding of decoded Git blob text |
|---|---|---|---:|---|
| A | `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_8/26.09.05•26.09.07•Continue Conversation Here — raw.json` | `50130870fd2be749f5c5224993937fe2005c51eb` | 2,647,227 | `3f01d769e36dbf1d186e2aa74888d8cd89c315745f03acde445a7f0606e847ad` |
| B | `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_13/26.09.05•26.09.07•⚒️ Continue Conversation Here — raw.json` | `8c738e4bc63e4464fbca2ef7d8f81cf1d4f78387` | 2,646,059 | `8734c681877a5b0f44cefc484a0c5635f54d3c5ca38848d50c256faf47822231` |
| C | `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_21/26.09.05•26.09.07•⚒️ Continue Conversation Here — raw.json` | `8631862362dd5acbaab8bbb9e8deee6f409ab7dc` | 2,646,059 | `4b53c18c72cb5c4d67a2ec0baf012235ed532ad31ff4246bbd0a36334e812147` |

The decoded Git blob text was re-encoded as UTF-8. For each snapshot, the reconstructed byte length equals the GitHub blob size, and computing the Git object digest `SHA1("blob " + byte_length + NUL + bytes)` exactly reproduces the GitHub blob SHA-1. This validates the byte reconstruction used for the SHA-256 values. The SHA-256 routine was also checked against standard ASCII and Unicode test vectors. The original report's SHA-256 column is superseded by correction intake [#2043](https://github.com/Satobloc/HsH/issues/2043); report [#2041](https://github.com/Satobloc/HsH/issues/2041) remains immutable. Correction #2043 is now PUBLISHED_VERIFIED: run #44438668792 succeeded, publisher commit `a7c31b1c99825fb1cefb7e374f1b0b31f82a5a16`, artifact blob `2300fbd2fafe66a9c57c8990e708966e92abe0d6`, 1,954 characters, SHA-256 `af7ef590b767256bd2a938bea1af5c0ce38e06bf8aa7e7828e8fc3e68dac54cd`; exact issue/artifact payload readback matched.

### Snapshot and node relations

All three exports have the same conversation UUID, conversation-level `create_time=2026-09-05T08:47:04.404894Z`, 884 mapping keys, and 18 user-role messages.

- A: title “Continue Conversation Here”; conversation-level `update_time=2026-09-07T22:25:43.875500Z`.
- B and C: title “⚒️ Continue Conversation Here”; conversation-level `update_time=2026-09-10T06:58:10.589039Z`.
- A versus B: five other message-bearing nodes differ; the target prompt and its descendant branch do not differ.
- B versus C: zero mapping-node differences; the only top-level difference is `safe_urls` array ordering. They are distinct Git blobs, but their message mappings are identical.
- These are three snapshots of one conversation, not three independent witnesses.

### Target message and exact duplicate

Target message `67ad3c22-c1b8-4f66-9815-586184630e6a` appears in all three snapshots. Mapping key and embedded `message.id` agree. Its raw fields are `author.role=user`, `author.name=null`, `author.metadata={}`, `message_source=null`, message-level `create_time=2026-09-07T22:25:13.750Z`, parent `1a18fd79-dea3-5fa9-ab13-b009e26c3ac7`, child `388771ce-bde3-4fd6-8863-6d775643bd90`. The text is 1,353 JavaScript UTF-16 code units.

It compares exactly equal to Morrow conversation message `2c6ae3c8-f6f9-4d7b-b3df-66ea1ca2bed9`, message-level `create_time=2026-09-07T22:24:59.538Z`, 14.212 seconds earlier. This is an exact duplicate prompt in another conversation, not an independent appointment or identity confirmation.

The duplicate prompt's actual descendant chain is:

`67ad3c22` (user) → `388771ce` (assistant thoughts) → `3387d652` (assistant thoughts) → `0f059b6c` (assistant text promising to write a role statement) → `338a8e00` (assistant reasoning recap) → `7a189c49` (assistant partial completion).

The terminal assistant node has `error_code=work_usage_limit_exceeded` and empty text. It does not contain a role statement. A scan of the 18 user-role messages found no later user message after the duplicate prompt in this conversation.

### Layer 11 result

- `MESSAGE_ROLE_VERIFIED`
- `AUTHOR_LABEL_NULL`
- `MESSAGE_NODE_BINDING_VERIFIED`
- `DUPLICATE_CONTENT_RELATION_VERIFIED`
- `ARCHIVE_ATTRIBUTION_BY_CONVENTION` only, for internal project provenance
- `EXTERNAL_IDENTITY_NOT_AUTHENTICATED`
- `INDEPENDENT_SOURCE_RELATION_NOT_ESTABLISHED`
- No `ATTRIBUTION_CONFLICT` observed in this bounded case

The actual provisional Morrow Team Archivist assignment remains the separate user-role message `402ade01-7116-4efb-9b14-31e477754458` in conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`. The assistant self-description `32ef4db5-269f-5c1c-8408-188c956cca52` remains assistant-authored. The separate duplicate prompt adds no second appointment and no external identity field. The September 13 theory stop and later trial invitation remain distinct; the later invitation does not expressly release the stop.

This is source-custody only. It does not lift Morrow's theory stop, authorize Lean/theory work, or change any BEDROCK, physical, paper, or scheduler state. Full report: [publisher issue #2041](https://github.com/Satobloc/HsH/issues/2041); corrected snapshot checksums: [correction intake #2043](https://github.com/Satobloc/HsH/issues/2043).


## Layer 12 — External service action / side-effect binding
**Introduced:** h971:s3, 2026-11-20. This specializes Layer 10's event/artifact binding for remote service operations. It does not replace or renumber Layers 1–11 and is not a theory authority.

A recorded tool invocation, successful wrapper lifecycle, provider-accepted operation, visible resource state, and causal attribution to a particular invocation are different evidence claims. Keep them as separate stages:

1. **Invocation record:** exact source conversation/export, message/node ID, tool/action name, serialized payload bytes/digest, and every target/resource identifier actually preserved in that payload.
2. **Wrapper execution:** call-node status, tool-result status, work-activity status, and returned body bytes, recorded independently. Do not collapse these into one success flag.
3. **Provider acceptance:** raw provider response/receipt, provider request or event ID, returned resource ID, provider timestamp, and acceptance/error status.
4. **Resource-state readback:** independently retrieved resource locator, retrieval scope, readback time, exact returned bytes/content digest, and the fields actually observed.
5. **Causal binding:** explicit evidence linking the invocation to the provider event/resource. Matching content or nearby timestamps alone do not establish causation.
6. **Multiplicity:** count distinct provider-side request/audit events, using provider idempotency keys where available. Duplicate wrapper nodes, conversation copies, work-item IDs, or matching payloads do not establish multiple external operations.

Use orthogonal statuses rather than a composite VERIFIED label:

- `CALL_RECORD_VERIFIED`
- `WRAPPER_EXECUTION_REPORTED`
- `PROVIDER_ACCEPTANCE_VERIFIED`
- `RESOURCE_STATE_READBACK_VERIFIED`
- `CALL_TO_RESOURCE_BINDING_VERIFIED`
- `EXTERNAL_OPERATION_COUNT_VERIFIED`
- `CALL_TARGET_UNBOUND`
- `CALL_PAYLOAD_INCOMPLETE`
- `TOOL_RESULT_BODY_EMPTY`
- `SERVICE_READBACK_ASSISTANT_REPORTED`
- `READBACK_SCOPE_NEGATIVE_ONLY`
- `CURRENT_SERVICE_STATE_UNKNOWN`
- `EXTERNAL_OPERATION_COUNT_UNKNOWN`
- `PRIVATE_SCOPE_NOT_ACCESSED`

Rules:

- `message.status=finished_successfully` and `work_activity.status=completed` establish recorded wrapper lifecycle only. They do not, by themselves, establish provider acceptance.
- An empty tool-result body is neither proof of failure nor proof of external success.
- A resource readback can establish state at its recorded time only to the extent that the raw provider response and resource locator are retained. It does not, by itself, establish which invocation caused the state.
- A published assistant report describing a live readback is testimony about an earlier observation, not the raw provider receipt. Preserve it as `SERVICE_READBACK_ASSISTANT_REPORTED` until the provider artifact is independently retained.
- A negative public search establishes only the searched public scope. It does not establish global absence or authorize private-channel/DM access.
- Preserve unknown target IDs, provider IDs, causal edges, operation counts, and currentness. Do not fill them from adjacent context.

### Applied witness 01 — Morrow/Aldus Slack send/edit wrapper pair
**Source snapshot:** HsH main commit `d28028e31142b2ef315967edff8486b8b6c10e4d`, tree `cb39f220b39fab29fa7bb0138c52a8bf86bc6da9`, complete recursive tree (`truncated=false`, 16,259 entries). Raw blobs and byte digests are recorded in [Morrow h971:s3 report](2026-11-20T1136Z_H971_S3_SLACK_ACTION_PAYLOAD_ATTRIBUTION_CORRECTION.md).

The two graphs contain byte-identical send payloads (SHA-256 `f6ee3afa93f186ab556768e1dec31e099c7f8a6b65656e94022facb5bb6d7f04`) and byte-identical edit payloads (SHA-256 `20f2719ffb4b30eb4b9086fb927fa5cab7305077217da3b2d77e8939fa9616ed`). The send payload preserves a 4,996-code-unit message but no channel/thread target IDs. The edit payload is 132 bytes and contains only `args.message={}`; no replacement text or target message ID is preserved. All four tool-result bodies are empty (empty-body SHA-256 `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855`).

This corrects the attribution in immutable reports #689, #2171 and #2185: the published #689 39/39 line-match claim cannot be reproduced from the pinned edit node; #2171's edit content/length and preserved channel/thread assertions are not supported by the pinned payloads; #2185's service-state conclusion relies on the assistant-authored #689 readback summary, not a retained provider response. The #689/#2171/#2185 issues remain unchanged; the correction is additive.

Applied statuses:
- `CALL_RECORD_VERIFIED`
- `DUPLICATE_PAYLOADS_VERIFIED`
- `WRAPPER_EXECUTION_REPORTED`
- `CALL_PAYLOAD_INCOMPLETE`
- `TOOL_RESULT_BODY_EMPTY`
- `SERVICE_READBACK_ASSISTANT_REPORTED`
- `CALL_TO_RESOURCE_BINDING_UNVERIFIED`
- `EXTERNAL_OPERATION_COUNT_UNKNOWN`
- `CURRENT_SERVICE_STATE_UNKNOWN`
- `PRIVATE_SCOPE_NOT_ACCESSED`

The 2026-10-27 service-readback claim remains preserved as a historical assistant report; this run did not access Slack, re-read the message, or search private scope. See [correction report](2026-11-20T1136Z_H971_S3_SLACK_ACTION_PAYLOAD_ATTRIBUTION_CORRECTION.md) and publisher intake #2186 (`SUBMITTED_NOT_VERIFIED` at this checkpoint). This layer changes no Morrow theory-stop, quarantine, paper, physical, scheduler, or BEDROCK status.


### Layer 12 applied witness 01 — publication and prior-report correction readback

- Correction report issue #2186 is `PUBLISHED_VERIFIED`; publisher comment #7038851479.
- Canonical artifact commit `d567d89043daee51cb4f7ba6057cef75deb0bd87`; blob `3e94d051bd21e0916a08994186963ebf561f9fc7`; SHA-256 `d08ba53847309107730af954656a6b776ed810666482c42e2e0b117aa4449120`; 13,099 UTF-8 bytes.
- Workspace report, issue-envelope content and canonical artifact readback match exactly.
- Prior issues #689, #2171 and #2185 received additive correction comments #7038877008, #7038877497 and #7038878031 respectively. Their bodies remain immutable.
- This verifies the publication artifact and correction pointers only. It does not upgrade the historical Slack readback to a raw provider receipt, establish the external operation count, bind the archived calls to a specific Slack resource, or establish current Slack state.
- Canonical run receipt: [h971:s3 Morrow](../COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-20T1136Z_s3_morrow.md); [Amendment 01](../COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-20T1154Z_s3_morrow_AMENDMENT_01_PUBLISHER_VERIFIED_AND_CORRECTION_LINKS.md).


## Layer 8 applied witness 02 — H975:s2 raw Morrow snapshot genealogy and byte digests

**Recorded:** 2026-11-20, during duplicate-run reconciliation of `REVROT3-19-20261011:975:s2`.  
**Purpose:** close the raw-byte digest omission in the already-published H975 source-custody report. This is a source-identity witness only; it does not authenticate the present runtime or lift Morrow's theory stop.

Pinned snapshot tuple:

- Repository: `Satobloc/HsH`
- Commit: `9bd3f3d5abcae31a3a9c6c8e38303e2d5b11934e`
- Tree: `ece2082e3ce552f5acc5249db80be8c52a08947b`
- Commit metadata: 2026-11-20T15:30:50Z; GitHub reports unsigned. Commit-account metadata is not source-content authorship.

| Snapshot | Path at pinned commit | Git blob | UTF-8 bytes | Raw-byte SHA-256 |
|---|---|---|---:|---|
| Earlier | `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.09.07•26.09.09•MORROW [Reconstruct H(s)H Synthesis] — raw (3).json` | `362075c5e32ec9e97579bd1de58fba7f612cb6bb` | 1,752,700 | `4f79b15eabfa8ba3b15d774fd873c72d91529ec601986a9fb97b9e9a860bc856` |
| Later | `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_18/26.09.07•26.09.13•🧗_♂️ MORROW ALDUS [Reconstruct H(s)H Synthesis] — raw.json` | `ee394b446b2e36d35fd1e5ecd004685c0422457b` | 3,017,953 | `4f5311f6464ef43ac76c1b269a8068f294c9ba6ab173bffc54f17dcb5022ef58` |

Both exact paths were present in directory listings pinned to the commit/tree. The two blobs were fetched by exact Git SHA and parsed. For each, Git blob SHA-1 was independently recomputed over `blob <byte-length>\\0 + raw UTF-8 bytes` and matched the repository blob ID; SHA-256 was computed over the same raw bytes. This verifies the byte-to-blob binding.

Both snapshots have conversation ID `6a9ee7ca-d340-83ea-b99d-6a3097429f36` and the same create time, so they are two snapshots of one conversation, not independent witnesses.

- Earlier snapshot: 465 mapping nodes / 14 user-role messages; update time 2026-09-09T12:45:43.552007Z.
- Later snapshot: 697 mapping nodes / 17 user-role messages; update time 2026-09-14T07:11:01.416857Z; all 697 nodes and all 17 user-role messages are on its current-node ancestry.
- Earlier node keys missing from later: 0; later-added node keys: 232.
- One shared message object differs: assistant node `d3d1d7f6-a5d9-4881-b795-c9c4eaa6dcde`. Earlier query text is not preserved in the later snapshot; later content is `text/parts=[\"\"]`. Cause unknown.
- One shared child-edge list differs: assistant node `5103e41b-1dae-54c5-a8ee-b91ca82f7103` gains child `bc0aa167-caf3-58b9-b69a-48b8ab7da5c3`; message content is unchanged.
- Later-only user-role messages: `dfee800e-c505-4cb9-ae07-f88c06b08ee2`, `934e87de-4e61-4622-a0ea-e5047aa235c6`, `99ae959b-fbeb-4c1e-9326-a6723c2b9557`.

For the direct role/stop/trial messages, raw `author.role=user`, `author.name=null`, and `message_source=null`. The HsH archive's user-role attribution convention is preserved; it is not independent external-account authentication. No present-thread identity or cross-thread delivery is established.

**Applied statuses:** `SNAPSHOT_MEMBERSHIP_VERIFIED`, `CONTENT_IDENTITY_VERIFIED`, `RAW_BYTE_SHA256_VERIFIED`, `USER_ROLE_SOURCE_VERIFIED`, `EXTERNAL_IDENTITY_NOT_AUTHENTICATED`, `CURRENT_THREAD_NOT_AUTHENTICATED`.  
**Authority effect:** none. Morrow remains provisional Team Archivist / archive-source custody only; the September 13 theory stop remains active.

## Layer 13 applied witness 01 — July 18 2026 worldtube/morphology source readback

**Recorded:** 2026-11-20, assistant-level scheduled h983:s0.  
**Scope:** source identity and fidelity only. This is not theory integration and does not lift the September 13 theory stop.

### Raw-source identity and snapshot genealogy

The Library raw conversation titled **Mathematical Tool Exploration** has conversation metadata from 2026-07-05T21:12:05.179Z through 2026-07-18T05:33:54.172Z. Three Library copies were found:

| Library copy | Library-added metadata | Raw bytes | Raw SHA-256 | Git-style blob SHA-1 |
|---|---|---:|---|---|
| `raw.json` (earlier copy) | 2026-08-22T02:26:38Z | 6,345,292 reported | Not computed; raw-byte materialization was not authorized | Not computed |
| `raw.json` (later copy) | 2026-08-25T01:23:51Z | 6,345,292 | `a1e067cd17b741a4395e804eec9c6706e27091d46f6f295bc4e76b525ece098a` | `8d9f36aa6672ebc34e75025dee6668d537dba302` |
| `raw(1).json` | 2026-10-05T19:06:42Z | 4,897,261 | `c291f5101944fe0b11f51beb7b3d50d391b9f4f6123f298b83396e42d5b8a007` | `d786cfe775e5c06283f906287013df5a7e654295` |

The two materialized snapshots share the same conversation identity and the same two relevant user-role message records, including their timestamps, parent links and text. They are different raw byte streams and are not independent witnesses. The earlier 2026-08-22 copy reports the same size and relevant node content as the 2026-08-25 copy, but raw-byte equality is **not verified** because its materialization route was denied. A separate **AI Enclosure Critique** export contains a transcript copy in a different conversation; it is not a primary witness or independent corroboration.

For the two direct messages, the raw records say `author.role=user`, `author.name=null`, and `message_source=null`. This is user-role source attribution, not external account authentication. Private Library file IDs, conversation UUID and message UUIDs are intentionally not copied into this public repository record.

### Direct propositions and historical assistant translations

Two user-role messages occur on 2026-07-18:

1. **05:29:42.674Z:** the finite core associated with the Kerr ring is corrected from a ring in four-dimensional history to a tube; the message connects entering that tube with entering the Kerr singularity's interior and attributes the Pauli-exclusion rationale to that geometry.
2. **05:33:15.107Z:** a straight worldtube is described as vacuum, specifically a BEC-sea vacuum; particle-identifying features and behavior are attributed to the tube's morphology, with topology included in morphology. The phrase “any straight angle is vacuum energy” is preserved as ambiguous rather than normalized.

The adjacent assistant response correctly preserves the distinction between a spatial Kerr ring and a tube-like history, but then adds a non-admissible/excised-core interpretation, three explicit assumptions, and a conditional forbidden-configuration argument. It leaves the exchange phase of `-1` as a further proof obligation. The next assistant response expands “identifying features and behaviors” into mass, charge, spin, exchange behavior and interaction character; proposes a framed/decorated embedding class; and interprets the straight-angle phrase as a local straightness contribution with a vacuum baseline to subtract or normalize. Those are assistant reconstructions, not direct definitions.

### Earlier SAT source and missing bridge

The SAT archive file [FUNDAMENTAL INTUITIONS.txt](https://github.com/Satobloc/SAT_THEORY_ARCHIVE_2023-25/blob/main/DEV%20CONVERSATION/FUNDAMENTAL%20INTUITIONS.txt), blob `0318d803fc4bb948d781d1aa0d9257dc2bcead77`, carries a Nathan annotation dated 2026-09-19. It describes 1D particle worldlines/filaments in four dimensions, a 3D time surface/wavefront, and the perceived particle as their intersection. Its Proposition E associates near-aligned filaments with vacuum and misalignment with matter. This is an annotated historical archive document, not the July 18 raw conversation.

The earlier filament/time-surface picture and the later finite-core worldtube/morphology statement are not yet connected by a source-defined map. The chronology is preserved; neither is silently substituted for the other.

### Stable source-fidelity glossary

| Term | Source-grounded meaning | Unresolved type or condition |
|---|---|---|
| Filament / worldline | Earlier SAT 1D history curve in 4D | Thickening or lift to a finite-core carrier |
| Time surface / timesheet | Earlier 3D wavefront or resolving surface | Metric, causal character and readout map |
| Worldtube | Later 4D history-tube language with finite core | Core dimension, boundary and embedding are not specified |
| Kerr ring | Spatial ring used in the Kerr analogy | Its relation to the finite 4D core is not formally defined |
| Morphology | Directly includes topology and determines particle features/behavior | No invariant, equivalence class or action is specified |
| BEC-sea vacuum | Historical direct designation for the straight-worldtube configuration | Current methodology retains BEC vacuum as a candidate, not settled ontology |
| Straight angle | Direct phrase linked to vacuum energy | “Angle” versus “straightness” is unresolved |
| Excised/non-admissible core | Assistant's proposed way to state an exclusion region | Not a direct definition or derived result |
| Framed/decorated embedding class | Assistant-proposed mathematical packaging | Proposal only; no source-defined map or proof |

### Mapping diagram

```text
EARLIER SAT ARCHIVE
1D filament/worldline in M4
        + 3D time surface
        -> 0D intersection/readout
        -> perceived particle

JULY 18 2026 DIRECT SOURCE
finite-core tube in 4D history
        + Kerr-ring analogy
        + straight tube = BEC-sea vacuum
        + morphology (including topology)
        -> particle-identifying features/behavior

HISTORICAL ASSISTANT TRANSLATION
spatial Kerr ring swept through history -> tube
        + non-admissible/excised-core assumption
        + coincidence assumptions -> forbidden configuration
        + exchange phase -1 as further proof obligation
        + framed/decorated embedding class as candidate

MISSING MAPS
filament -> finite-core worldtube
worldtube -> timesheet section/readout
morphology -> typed invariant or equivalence class
straight-angle phrase -> defined vacuum-energy term
```

### Original versus translated propositions

| Direct source proposition | Historical assistant translation | Fidelity status |
|---|---|---|
| The 4D core is a tube, not a ring. | A spatial Kerr ring swept through history becomes a tube-like singular set. | Dimensional correction preserved; the swept-set construction is assistant wording. |
| The tube geometry is tied to Pauli exclusion. | Exclusion follows if the core is non-admissible/excised and identical-state coincidence requires interpenetration; exchange phase `-1` remains to be derived. | Direct motivation preserved; mechanism and assumptions are assistant additions. |
| Straight worldtube is BEC-sea vacuum. | Straight components are the undeformed carrier baseline. | Possible interpretation, not a direct equivalence. |
| Particle identity/behavior comes from morphology, including topology. | Full deformation class packages topology, geometry, embedding, framing and phase; mass/charge/spin/exchange/interaction are readouts. | Broad idea preserved; the list and mathematical package are assistant additions. |
| “Any straight angle is vacuum energy.” | Normalize or subtract a straight-vacuum baseline. | Ambiguous phrase; assistant chooses one interpretation without a source-defined variable. |

### Discrepancy ledger

1. **Worldline/worldtube:** the earlier 1D filament and later 4D history tube are both source-grounded, but no thickening, embedding or support map relates them.
2. **Kerr geometry:** the direct source uses “interior” language. The assistant adds an excised/non-extendible core to avoid relying on a literal Kerr singularity interior. That addition is not direct and was not independently adjudicated as GR physics in this source-custody pass.
3. **Pauli mechanism:** the direct source asserts a geometric rationale; it does not define a configuration space, exchange loop, antisymmetric state or `-1` phase. The assistant itself leaves that phase as a proof obligation.
4. **Morphology:** topology is explicitly included by the direct source; the assistant turns this into a more specific decorated/framed embedding class and enumerates observables not individually named by the user.
5. **Vacuum baseline:** “straight angle” is not typed. Local straightness, angular misalignment and baseline subtraction must not be conflated.
6. **BEC status:** the July 18 message is a historical direct BEC-sea assertion; the later current methodology treats BEC-ocean vacuum as a candidate. Preserve both dates and statuses without promoting the ontology.
7. **Snapshot genealogy:** multiple Library copies are snapshots of one conversation, not independent corroborating witnesses; one same-sized copy remains unverified at the raw-byte level.

### Formalization and physical status

No source-faithful Lean theorem is ready: the core dimension, boundary, admissible configuration space, exchange action and projection maps are unspecified. Morrow's explicit theory stop also prohibits a Lean theory proof. No Lean module or run was created. No physical fixture, calculation, fit, prediction, independent measurement or CODATA scoring was performed.

**Authority effect:** none. Morrow remains provisional Team Archivist / archive-source custody only. The September 13 theory stop remains active; the later bounded trial invitation and this source-fidelity assignment do not authorize theory integration or promotion.

**Next deeper cursor:** recover the earlier exchange that introduced the Kerr-core/Pauli rationale; locate a direct clarification of “straight angle”; then seek source-defined filament-to-worldtube and worldtube-to-timesheet maps. Do not fill missing maps by analogy or assistant reconstruction.


## Additive Layer 14 — PR Branch-History Reference Custody
**Introduced:** h986:s4, 2026-11-21. This is a source/branch-history record only; it is not a Lean review, proof endorsement, theory integration, or authorization to alter another worker's PR.

For an existing public PR, distinguish the current file from retained historical commits:

| State | Commit | File blob | Custody observation |
|---|---|---|---|
| Initial h986 addition | `ef93db12991b36718c4e792f905efc7268b79384` | `fb0391d2d8816261340020083b7f2a823897d080` | The h986 source record contained a literal task-conversation reference |
| Redaction commit | `0509e690e6359279b5ac8de954dfa21627100f8d` | `0be342cdb268ffa3737c73139ff8d38748304eac` | The h986 record substituted an opaque equality token |
| Current corrected head | `efdcf0533bf79bd4323de375e4c64358dc4a4922` | `7d378eb4a932303613cc57d0e3aea36e5b0b0175` | The h986 record retains the opaque token; the raw value is absent from that record |

The raw value is deliberately not copied into this gate. The earlier commit remains in branch history; a current-file redaction does not imply historical erasure. No force-push, history rewrite, merge, or cleanup was performed. PR #1570 remains OPEN / DRAFT / UNMERGED pending authorized maintainer disposition. The existing PR comment #7055758821 is the contemporaneous source for the privacy safeguard; this layer records a bounded readback of the three source versions.

The associated nominal-slot correction is also versioned separately: issue #2243 preserves its original published bytes but has superseded run-label metadata; issue #2246 is the single open correction intake and had no publisher confirmation at the Morrow readback. Tern's later receipt amendment reports exact-head build success; Morrow did not re-run or evaluate Lean.

**Allowed conclusion:** the h986 source record changed from a literal reference to an opaque token in the current file, while the earlier commit remains retrievable in branch history.

**Not established:** erasure from history, provider-side privacy exposure, current access to the referenced conversation, worker identity, thread continuity, proof correctness, or authorization to rewrite the PR branch.

## Additive Layer 15 — Authority-Scope, Stop/Release, and Bounded-Continuation Binding

**Introduced:** h990:s3, nominal 2026-11-21T06:36Z.  
**Disposition:** SOURCE-CUSTODY / OPERATIONAL-WORKFLOW ONLY. This layer does not resume theory integration, release a prior stop, or grant new access or publication authority.

### Gap addressed

Layer 11 separates exported speaker role, archive attribution, external identity, and the scope of attributed text. That last item is attribution scope, not permission scope. A correctly attributed user-role message can still authorize only a narrow operation. Layers 8, 9, and 14 respectively bind repository snapshot, message chronology, and branch-history custody; none alone determines whether a later instruction changes an earlier prohibition.

Reuse the existing access/exposure distinctions in Mira's public-safe matrix (#1222): research reading, public indexing, internal-review exposure, redistribution, publication, and theory integration are separate operations. Layer 15 does not create a competing access taxonomy. It binds source-backed instructions to the operation and object they actually authorize.

### Authority-event record

For every instruction relied on to establish a role, permission, stop, exception, or release, record:

1. **Source locator:** exact conversation/source ID; Layer 8 repository/commit/tree/path/blob tuple where available; node and embedded message IDs; parent-edge context.
2. **Speaker evidence:** literal exported author.role, literal author.name including null, the named archive attribution convention, and external identity status as separate fields.
3. **Message chronology:** exact message-level timestamp, source field, and unit. Conversation-level timestamps, commit times, and retrieval times remain separate.
4. **Event kind:** one of the event types below. Do not infer kind from a file title or assistant summary.
5. **Principal and recipient:** who is being addressed, preserving unknown or ambiguous values.
6. **Operation scope:** allowed and prohibited verbs, using the existing access/exposure categories rather than a single Boolean authorized or quarantined.
7. **Object scope:** exact artifact, source family, branch, version, destination, or bounded work item. Missing targets remain UNKNOWN.
8. **Supersession edge:** explicit stop/release or supersession target IDs. A later timestamp alone is not a supersession edge.
9. **Effective interval:** start, expiry, and any condition that ends the instruction. Do not infer expiry from silence or elapsed time.
10. **Context inheritance:** for elliptical replies such as “continue” or “try writing now,” record the immediate parent and the exact inherited target; do not widen beyond it.

### Event types and semantics

| Event type | Effect |
|---|---|
| ROLE_ASSIGNMENT | Establishes only the stated baseline remit; not blanket authority over adjacent lanes. |
| WORKFLOW_INVITATION | Adds only the listed operations that do not conflict with an active stop. |
| STOP_OR_QUARANTINE | Blocks the named operations/objects immediately; remains active until an explicit release covers it. |
| BOUNDED_CONTINUATION | Permits continuation of the named branch/object/action only; does not release a broader stop. |
| BOUNDED_WRITE_RETRY | Inherits the immediate parent context for one retry; unresolved target or destination remains incomplete. |
| EXPLICIT_RELEASE | Must directly and unambiguously identify the stop/restriction and the scope being released. |
| REASSIGNMENT | Changes the named task/role scope only when issued by an authorized source; does not silently rewrite unrelated stops. |
| SCHEDULER_SELECTION | Routing metadata only; no authority or identity effect. |
| ASSISTANT_SUMMARY | Evidence about what an assistant reported, not an independent grant or release. |
| UNKNOWN_OR_CONFLICT | Hold the affected operation; preserve both source records and the unresolved relation. |

### Precedence and decision rule

1. Verify the source event and its snapshot before evaluating its authority.
2. A role assignment supplies its stated baseline scope only.
3. A stop dominates earlier grants where their operation/object scopes overlap.
4. A later invitation may authorize non-conflicting archive, maintenance, reading, comparison, or other named work; it does not silently repeal a stop.
5. A bounded continuation applies only to the exact branch/object/action and context established by its parent chain.
6. An elliptical write retry inherits only its immediate parent target. If the target, destination, or payload identity cannot be recovered, classify it as scope-incomplete rather than general write permission.
7. A release must explicitly identify the stop and the portion being released. Partial release leaves the remainder active.
8. Ring selection, task title, generic lane prompt, task-level conversation reference, null current-run chat_ref, cached result, assistant self-description, artifact existence, silence, and elapsed time do not grant or release authority.
9. If source order, scope intersection, or supersession is ambiguous, use AUTHORITY_UNRESOLVED and do not perform the disputed operation.
10. author.role=user remains an archive role field plus the named attribution convention; it is not external account/person authentication.

For operation \(a\), object \(o\), and time \(t\), the policy readout is:

\[
\operatorname{Permitted}(a,o,t)
=
\bigl(G(a,o,t)\land\neg S(a,o,t)\bigr)
\lor X(a,o,t,s)
\]

where \(G\) is a source-backed grant, \(S\) is an active stop covering the operation/object, and \(X\) is an explicit exception that names the active stop and the exact action, object, version, and interval. An invitation can add to \(G\); it does not make \(S\) false. An active stop is cleared only by a source-backed EXPLICIT_RELEASE that identifies it.

This is an operational permission rule, not a Lean theorem, a physical model, or evidence that any source event is authentic beyond the stated archive checks.

### Applied source-custody witness

The existing Morrow source record and scoped-continuation audit (#2017, #1571) provide a concrete sequence:

- the provisional Team Archivist assignment establishes a limited archive/source-custody remit;
- the later direct theory stop and quarantine restrict theory integration and the specified artifact class;
- the subsequent archive/maintenance trial invitation adds named source and workflow operations but does not expressly rescind the stop;
- “Ok, good. Continue” is a branch-specific continuation, not a global release;
- “Try writing now” is an elliptical write-retry prompt parented to a prior assistant report; it does not broaden the theory remit or release the stop;
- the current h990:s3 deterministic Morrow ring label and generic Lane Charter 36 prompt are scheduler/task context, not a new direct authority event.

Current disposition remains ROLE_SCOPE_ESTABLISHED / STOP_ACTIVE / INVITATION_ADDITIVE / BOUNDED_CONTINUATION_ONLY / NO_GENERAL_RELEASE / SCHEDULER_LABEL_ONLY. The permitted work here is source custody and operational provenance; no theory integration is performed.

### Applied source-custody witness 02: stop/trial parent ancestry (h1013:s2, 2026-11-22)

The combined Morrow/Aldus raw snapshot at `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.09.07•26.09.09•MORROW [Reconstruct H(s)H Synthesis] — raw (3).json`, Git blob `ee394b446b2e36d35fd1e5ecd004685c0422457b`, conversation ID `6a9ee7ca-d340-83ea-b99d-6a3097429f36`, was reparsed as a finite parent-pointer graph.

- User-role provisional Team Archivist assignment: node `402ade01-7116-4efb-9b14-31e477754458`, message time `2026-09-08T03:25:36.187Z`, depth 68.
- User-role theory stop/quarantine: node `934e87de-4e61-4622-a0ea-e5047aa235c6`, message time `2026-09-13T00:11:10.939Z`, depth 534.
- User-role trial invitation: node `99ae959b-fbeb-4c1e-9326-a6723c2b9557`, message time `2026-09-13T15:31:22.757Z`, depth 679.

Deterministic parent traversal finds the role assignment is an ancestor of the stop by 466 edges, and the stop is an ancestor of the trial invitation by 145 edges. The trial is 55,211.818 seconds after the stop. It is therefore a descendant in the same branch, not a sibling. Within this 697-key/696-message snapshot, the only user-role nodes at or after the stop are the stop and the trial invitation.

Both raw messages have `author.role=user` and null `author.name`; archive attribution remains distinct from external identity authentication. The later invitation permits bounded archive/provenance/reading/note/equation-checking operations under its stated Clearinghouse and non-authoritative conditions, but it does not explicitly identify and release the stop or lift the unique-artifact quarantine. Descendant status and later timestamp do not themselves create an EXPLICIT_RELEASE. The stop remains active for theory integration, prediction/paper development, and promotion.

This is a source-graph/provenance check, not a Lean proof, physical result, or identity authentication. The existing Layer 11 raw-digest custody record was not recomputed in this run; the pinned Git blob and parsed parent graph were used. No theory work is authorized by this witness.

### Orthogonal status vocabulary

Use separate fields, not one composite green status:

- ROLE_SCOPE_ESTABLISHED
- STOP_ACTIVE
- INVITATION_ADDITIVE
- BOUNDED_CONTINUATION_ACTIVE
- BOUNDED_WRITE_RETRY_CONTEXTUAL
- BOUNDED_WRITE_SCOPE_INCOMPLETE
- EXPLICIT_RELEASE_VERIFIED
- AUTHORITY_UNRESOLVED
- SCHEDULER_LABEL_ONLY
- EXTERNAL_IDENTITY_NOT_AUTHENTICATED

### Limits

This layer does not change the source convention, release any quarantined theory artifact, establish a live Morrow thread, or authorize access to private HSH_RESOURCES material. It does not alter task ownership, scheduler configuration, paper gates, BEDROCK, SAT-O, or Blockwave equations. No physical calculation, fit, prediction, independent measurement, Lean theory proof, paper work, or theory promotion is part of this layer.


## Additive Layer 16 — Workflow Definition, Execution, and Artifact Custody

**Introduced:** h994:s2, nominal 2026-11-21T10:24Z.  
**Disposition:** SOURCE-CUSTODY / OPERATIONAL-PROVENANCE ONLY. This layer does not authorize scanner execution, candidate disposition, theory work, or access beyond existing permissions.

A workflow definition, configured trigger, run record, job execution, artifact upload, artifact retrieval, and committed output are different evidence objects. Do not collapse them into a single `WORKFLOW_EXISTS` or `REPORT_EXISTS` claim.

### Required event/artifact distinctions

1. **WORKFLOW_DEFINITION_VERIFIED** — exact workflow path/blob is present in a pinned repository tree.
2. **TRIGGER_CONFIGURED** — the pinned workflow definition specifies a push, schedule, dispatch, or other trigger. A `workflow_dispatch` declaration establishes capability, not execution.
3. **RUN_OBSERVED** — an exact Actions run ID/event/commit association is retrieved. A workflow file or commit alone does not prove a run occurred.
4. **JOB_STEP_OBSERVED** — exact job and relevant step records/logs are retrieved. An empty or unavailable Jobs API result is not evidence of zero checkout or zero provisioning.
5. **ARTIFACT_UPLOAD_VERIFIED** — a successful upload step and artifact identity/metadata are observed. An artifact name in YAML is only a configured destination.
6. **ARTIFACT_READBACK_VERIFIED** — the artifact bytes are actually retrieved and checked, preferably with byte count and SHA-256.
7. **COMMITTED_OUTPUT_VERIFIED** — a generated output file is independently found in a pinned repository tree. An Actions artifact is not a committed file.

### Rules

- A workflow may generate files in its runner workspace and upload them without committing them. In that case, an artifact-output route exists while a committed report surface remains absent.
- Do not infer that no push-triggered run occurred from a connector wrapper that exposes only pull-request-triggered runs or a bounded first page.
- Preserve `RUN_NOT_OBSERVED`, `JOB_NOT_INSPECTED`, `ARTIFACT_NOT_VERIFIED`, `COMMITTED_OUTPUT_NOT_ESTABLISHED`, and `PROVISIONING_UNKNOWN` separately.
- A later report revision that says no workflow exists must be checked against the exact tree at the report's own commit, not merely today's main branch.
- Do not dispatch, rerun, download, delete, or disposition artifacts outside the selected worker's authority and available tools.

### Applied case: MORROW-SOURCE-001

- Current Mercer QA report: `WORKSPACES/MERCER/SUPERSET_SCANNER_QA_2026-09-13.md`, current blob `67b8506f1239047db31d0fb69186df8c6b8b982b`.
- Initial QA version at report commit: blob `20a3703d1b52421dee04388499e0e2631bce125f`; it did not contain the later sentence claiming no scanner workflow existed.
- Existing workflow: `.github/workflows/superset-conversation-duplicate-scan.yml`, blob `9bc8211e6281614c843debc499f29ced2f6dc6ec`.
- Workflow creation commit: `5ef2d75d8c955c931415790ca7e55a94102eae59`, 2026-09-13T08:34:27Z.
- Mercer QA report commit: `364911089407f1f01246b16a02fe041dfdd79aae`, 2026-09-13T18:56:14Z. The same workflow blob is present in that exact tree.
- The workflow defines push and manual-dispatch triggers, writes two scanner outputs under `WORKSPACES/COMMON/analysis/`, and uploads `superset-conversation-duplicate-scan`. It does not commit those outputs.
- Current scanner blob: `343da1678c94d36fc98bd33ede5676211cd53c7c`. Regression test blob: `20afa9df88400c6da8e5847bd1b70cd978aea5c8`.
- Public additive correction: [issue #2201, comment #7061322242](https://github.com/Satobloc/HsH/issues/2201#issuecomment-7061322242), SHA-256 `a7bbbcfd1e0509cba270372f27f162b14e7c573716d439775e7c8041eda85704`, 3,534 UTF-8 bytes; readback verified.

**Current evidence state:** `WORKFLOW_DEFINITION_VERIFIED / TRIGGER_CONFIGURED / ACTIONS_ARTIFACT_OUTPUT_ONLY / RUN_ARTIFACT_UNVERIFIED / COMMITTED_OUTPUT_NOT_ESTABLISHED / OLD_CANDIDATE_OWNER_UNKNOWN`. The Common `MORROW-SOURCE-001` row remains unchanged pending its authorized maintainer. No workflow was dispatched and no candidate was dispositioned in h994:s2.

## Layer 17 — Raw-export graph completeness and FIE annotation-copy fidelity
Date: 2026-11-21. Relay key: REVROT3-19-20261011:1002:s0. Status: SOURCE CUSTODY ONLY.

This layer refines Layer 13. It does not add an independent witness, theory claim, or authorship claim.

### July 18 raw-export genealogy

Two raw-byte Library exports of the same Mathematical Tool Exploration conversation were compared. The August 22 Library copy remains unmaterializable as raw bytes; its reported size is 6,345,292 bytes and no digest is claimed.

| Snapshot | Library date | Bytes | SHA-256 | Git-style blob SHA-1 |
|---|---|---:|---|---|
| raw.json | 2026-08-25 | 6,345,292 | a1e067cd17b741a4395e804eec9c6706e27091d46f6f295bc4e76b525ece098a | 8d9f36aa6672ebc34e75025dee6668d537dba302 |
| raw(1).json | 2026-10-05 | 4,897,261 | c291f5101944fe0b11f51beb7b3d50d391b9f4f6123f298b83396e42d5b8a007 | d786cfe775e5c06283f906287013df5a7e654295 |

Both materialized exports share conversation identity, title, creation time 2026-07-05T21:12:05.179Z, and update time 2026-07-18T05:33:54.172Z. They are snapshots of one conversation, not independent witnesses.

| Measure | 2026-08-25 | 2026-10-05 |
|---|---:|---:|
| Mapping nodes | 1,139 | 826 |
| Message-bearing nodes | 1,138 | 825 |
| Visible user-role messages | 139 | 139 |
| Current-node ancestry | 1,120 | 810 |

The 826 mapping IDs in the October 5 export are all present in the August 25 export. The August 25 export has 313 additional nodes and the October 5 export has none absent from August 25. Of the 313 additional nodes, 310 are on the August 25 current-node ancestry: 187 system, 75 tool, 42 assistant, and 6 hidden user-editable-context nodes. Three are off-chain system nodes. The six user-role nodes are hidden context, not visible conversational turns.

All 139 visible user-role messages are present in both exports with identical IDs, text content, and timestamps. Eight visible-user parent pointers differ; 120 visible-user child lists differ; metadata differs on all 139 visible-user message objects. The 24 shared content-payload differences are confined to 14 tool and 10 assistant messages; none is a visible user message.

The two July 18 direct source messages retain identical user role, text, timestamps, and immediate parent links. Their downstream child edges differ. In the August 25 snapshot the second message passes through a hidden system wrapper before the same assistant response; in the October 5 snapshot it points directly to that response.

Conclusion: October 5 is a reduced serialization, not a complete replacement for August 25. It preserves all visible user turns, including the two July 18 source statements, but omits substantial system/tool/assistant ancestry and hidden context. Use August 25 when fuller conversation-history context is required. Do not count either snapshot as independent corroboration.

### Fundamental Intuitions source-copy delta

SAT archive original: DEV CONVERSATION/FUNDAMENTAL INTUITIONS.txt, Git blob 0318d803fc4bb948d781d1aa0d9257dc2bcead77, 9,655 characters / 9,657 UTF-8 bytes.

HsH copy: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt, Git blob 81ae23a106939cba7e3d134ed5c90a7d7a979a25, 9,258 characters / 9,258 UTF-8 bytes.

Exact text comparison: the HsH body equals the SAT original after removing the initial 394-character / 396-byte annotation and its 3-character / 3-byte separator. No other body difference was found. The omitted annotation is dated 2026-09-19, labeled as a Nathan annotation, and says the original Fundamental Intuitions remain core bedrock, extended but not superseded. It is a file annotation, not a recovered raw chat message.

The separate LIBRARY/presented/fundamental-intuitions.md is an editorial derivative whose header says not every mechanism remains current. That is not a substitute for the omitted annotation. The statements can coexist if conceptual foundation and specific revisable mechanisms remain separate.

The SAT archive and HsH WORLDTUBE THOUGTS.txt mirrors are byte-identical at Git blob 735f2a95e492944a244d1ceba31f33b6b5606119. This is a transcript mirror, not an independent witness.

### Geometry/source boundary

The earlier FIE source describes 1D filaments/worldlines in M4, a 3D time surface/wavefront, and particle readout at their intersection. The July 18 direct source describes a finite-core worldtube, a straight-tube BEC-sea vacuum, and particle-identifying features/behavior arising from morphology, with topology included in morphology. The same direct message connects the finite-core/Kerr-ring description to Pauli exclusion.

Assistant expansions such as an excised/non-admissible core, a framed/decorated embedding class, mass/charge/spin readouts, and a specific straight-vacuum normalization remain assistant reconstructions. The exchange phase of minus one remains an unproved obligation.

Unresolved source maps: filament to finite-core worldtube; worldtube to timesheet section/readout; morphology to a typed invariant/equivalence class; and the phrase straight angle to a defined vacuum-energy term. Do not silently map straight angle to theta-four or a plane/normal convention. BEC-sea vacuum is a historical direct designation; current POG status remains a working hypothesis, not established ontology.

### Formalization and authority boundary

No source-defined typed map, configuration space, boundary, or exchange action is supplied from which to state a source-faithful geometric theorem. Morrow's September 13 direct theory stop remains active. No Lean theory proof, theory integration, equation correction, physical calculation, CODATA scoring, fit, prediction, independent measurement, or BEDROCK promotion was performed.

### Publication incident

Public submission issue #2295 was rejected by the existing publisher because the declared SHA-256 did not match the exact decoded issue content. Declared digest: 4ae1632e6bbba1faf86a266e0cfc1ddc48f11757372aecd21f119e8cd59da2e6. Independently recomputed issue-content digest: 8c581107e9779a44469daf2af353d112f4c10ab52a606204571c2a57e0f447be over 14,662 UTF-8 bytes. The publisher's rejection is correct. Issue #2295 is retained as the single incident/submission record; no duplicate issue, manual destination write, or publisher bypass is authorized.

## Layer 18 — Digest implementation attestation

**Recorded:** 2026-11-22, h1009:s3. **Scope:** source-custody and digest-implementation provenance only; no theory authority or physical claim.

Treat digest verification as three separately evidenced components:

1. **Target identity:** exact source/artifact bytes, locator/version, byte length and encoding. Reuse Layer 1/8 and the publisher intake's final-content rule; do not redefine the target after hashing.
2. **Implementation identity:** algorithm, implementation/tool, exact version, runtime/backend where observable, and source/package blob when custom code is used.
3. **Execution evidence:** known-answer test results from the same implementation and runtime used for the target digest, plus a second-tool comparison on the same byte buffer where available.

Required rules:

- Prefer maintained standard implementations such as Python `hashlib` or a system digest utility. Do not use a hand-written digest routine for consequential source/publication work.
- A custom implementation is not admissible until its exact source blob is pinned, its known-answer suite passes in the same runtime, and its output is cross-checked against a maintained implementation.
- Re-run the tests after any source, dependency, runtime or build change. A test result from another implementation or another runtime does not validate the current one.
- Record tool/runtime versions and actual test outputs. If the backend is not exposed, record it as UNKNOWN; do not infer it.
- Distinguish `KAT_PASS` from `TARGET_DIGEST_MATCH`. Passing test vectors validates the implementation for those vectors; it does not verify that the correct target bytes were supplied.
- A second command-line tool agreeing is a tool-level cross-check. Do not claim independent cryptographic implementations unless their implementation/backend provenance is actually established.
- Keep the publisher's own validator and canonical artifact readback as separate acceptance events. The publisher workflow runs Python 3.12; a local test under another Python version does not establish the exact Actions runtime's OpenSSL/backend version. A green Actions conclusion alone remains insufficient because the publisher can post `REJECTED:` and exit 0.

### Required attestation fields

`algorithm`; `target_kind`; `target_locator_and_version`; `encoding`; `byte_length`; `target_digest`; `implementation`; `implementation_version`; `runtime_version`; `backend_version_or_UNKNOWN`; `implementation_source_blob_or_STANDARD_LIBRARY`; `known_answer_vectors`; `known_answer_results`; `crosscheck_tool_and_version`; `crosscheck_result`; `execution_timestamp`; `status`.

Suggested independent statuses: `DIGEST_IMPLEMENTATION_UNBOUND`, `DIGEST_KAT_FAILED`, `DIGEST_IMPLEMENTATION_KAT_PASS`, `DIGEST_TOOL_CROSSCHECK_MATCH`, `TARGET_DIGEST_MATCH`, `TARGET_DIGEST_MISMATCH`, `IMPLEMENTATION_PROVENANCE_UNKNOWN`. Do not collapse them into one `VERIFIED` flag.


### Applied witness 01 — h1009:s3

### Runtime and known-answer validation

The current relay Python runtime reported Python 3.13.5, OpenSSL 3.5.5 (27 Jan 2026). The system utility reported GNU coreutils `sha256sum` 9.7.

Python `hashlib.sha256` and `sha256sum` agreed on all four byte inputs:

| Input bytes | Length | SHA-256 |
|---|---:|---|
| Empty byte string | 0 | `e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855` |
| ASCII `abc` | 3 | `ba7816bf8f01cfea414140de5dae2223b00361a396177a9cb410ff61f20015ad` |
| UTF-8 U+00E9 (`c3 a9`) | 2 | `4a99557e4033c3539de2eb65472017cad5f9557f7a0625a09f1c3f6e2ba69c4c` |
| UTF-8 U+0065 U+0301 (`65 cc 81`) | 3 | `bf12767b0f2a56b2190075bae8169f656e3ce8d6357d4aff184bc6c7ea48f9f6` |

The two visually similar Unicode strings intentionally have different byte sequences and digests. No normalization is implied.

The inspected publisher implementation is `tools/issue_publish.py`, blob `7067e8d9f27a273d90e443afb0493260d9a3ecbf`. It calls `hashlib.sha256(content.encode()).hexdigest()`. The existing publisher workflow is `.github/workflows/issue-publisher.yml`, blob `689984b19027ed84f0e949f01c4d8a89edf68fee`, and pins `python-version: '3.12'`. The current relay's Python 3.13.5 test is not represented as a run of that separate Python 3.12 Actions environment. No manual workflow dispatch was performed; this report is intended for the existing issues.opened publisher route.

These tests validate the current relay's observed Python/tool implementations on the listed inputs. They do not hash a separate source file, authenticate authorship, prove source completeness, or establish publication acceptance. The publisher script was inspected, not executed.


## Layer 19 — Publisher write-conflict classification and bounded ref-race recovery

**Scope:** source custody and operational publication provenance only. This layer does not reopen Morrow's September 13 theory stop, authorize theory integration, or alter any physical/equation status.

### Applied incident witness: HsH publisher issue #2359

- Issue: [#2359](https://github.com/Satobloc/HsH/issues/2359), submission `morrow-h1024-s4-open-carrier-source-custody-20261122t1648z-001`.
- Workflow: [run #45047667817](https://github.com/Satobloc/HsH/actions/runs/45047667817), attempt 1, job `137285700763`.
- The publisher job's checkout, Python setup and initial preparation succeeded. The failure occurred inside `Validate, publish and read back`, at `tools/issue_publish.py` line 66, the Contents API `PUT` to `branch=main`, with HTTP 409 Conflict.
- Because execution reached the PUT, the event passed the publisher's `validate()` stage and the initial target-path GET had returned absent. This was **not** the recorded SHA-256 validation rejection seen in issue #2295.
- Checkout commit: `39be1f81d0139f7aba20eb6296242f036e0e464c`. A later main commit, `d3b4c73c2daed3ef200cb95cb5ade8c8a808b09a`, is its direct child and has commit time 2026-11-22T17:08:51Z. The failed PUT was logged at 17:08:57.827Z; checkout's final `git log -1` was logged at 17:08:55.182Z. This supports a main-ref advancement race during checkout/write preparation, but the HTTPError response body was not captured, so the exact 409 cause remains **UNCONFIRMED**.
- The workflow's concurrency group serializes publisher jobs with one another; it does not serialize all other commits to `main`. The publisher script performs GET-then-PUT against `main` and has no explicit 409 recovery.
- Before retry, issue #2359 still had its original OWNER-authored envelope, zero comments, and no canonical artifact at the expected path. The declared submission digest remained `d07bbeceefc4d38f070d1b5be878fbbc5227d1a8436550a96a7838f321051632`; the issue envelope's content length remained 10,913 characters.

### Failure-phase taxonomy

Do not collapse these states into generic `PUBLISHER_FAILED` or `SHA_MISMATCH`:

1. `PAYLOAD_FREEZE_OR_DIGEST_MISMATCH` — the exact issue-envelope content does not hash to its declared digest.
2. `PUBLISHER_SCHEMA_OR_AUTHORITY_REJECTED` — envelope schema, author association, submission ID or size fails before target inspection.
3. `TARGET_ABSENT_AT_PRECHECK` — publisher GET returns 404; this is only a precondition, not publication.
4. `WRITE_CONFLICT_409` — validated content reached the Contents API PUT, which returned 409. Cause may be a branch-ref race or another conflict; do not call it a digest rejection.
5. `TARGET_COLLISION` — a canonical path exists with different content; never overwrite it.
6. `READBACK_MISMATCH` — the PUT returned but canonical readback differs from the exact submitted content.
7. `PUBLISHED_VERIFIED` — publisher confirmation plus exact issue-envelope/canonical-artifact content match and digest verification are present.

### Bounded recovery rule for HTTP 409

After a 409, preserve the original issue as the sole intake and perform one read-only reconciliation: fetch the exact issue envelope, comments, canonical target path and current `main` head. Then:

- If the target exists and its decoded content is byte-for-byte identical to the frozen submission, classify idempotent publication and verify the digest/comment; do not write again.
- If the target exists with different content, stop at `TARGET_COLLISION`; no overwrite or duplicate issue.
- If the target is absent, the issue envelope is unchanged, and `main` advanced after the failed job's checkout, one rerun of the **same failed publisher job on the same issue** is permitted after recording the new main head. This is a bounded retry against changed repository state, not a retry of an unchanged failure.
- If `main` did not advance, do not retry without the 409 response body or another changed diagnostic. Preserve the failure and route it to the publisher maintainer.
- If the single rerun also returns 409 while the target remains absent, stop. Record `REF_CONFLICT_ESCALATION / NOT_PUBLISHED`; no third attempt, issue edit, manual canonical-path write, or duplicate issue.
- On any apparent success, independently compare the exact issue-envelope `content`, workspace report and canonical artifact; recompute SHA-256 over the exact UTF-8 content; and retain the publisher confirmation plus readback. A green Actions conclusion alone is insufficient.

**Applied recovery state at Layer 19 creation:** one failed attempt was confirmed; pre-retry target absence and unchanged issue were rechecked; the main head had advanced from the checkout commit. One rerun was submitted against the same run/issue. Attempt 2 was still IN_PROGRESS at the last readback; no publication success is claimed here. Its final disposition must be appended as an applied witness, not inferred.

**Limits:** this is an operational failure-classification and recovery protocol, not a code change to `tools/issue_publish.py`, not a global fix for all GitHub Contents API conflicts, and not proof of the exact internal cause of this 409. No theory, Lean, physical calculation, equation, paper, or BEDROCK claim is involved.


### Layer 19 applied witness 01 — h1024 issue #2359 bounded retry

- Original attempt 1: run [#45047667817](https://github.com/Satobloc/HsH/actions/runs/45047667817), job `137285700763`, failed at the Contents API PUT with HTTP 409. The error body was not captured.
- Reconciliation found the target absent, the issue envelope unchanged, no publisher comments, and main advanced from the failed checkout `39be1f81d0139f7aba20eb6296242f036e0e464c`.
- One rerun of the same failed job on the same issue was submitted. Attempt 2, job `137348432379`, completed SUCCESS at 2026-11-22T20:44:34Z.
- Attempt 2 explicitly checked out `main` with `fetch-depth=1`; its actual checkout SHA was `25f24ac000132f9b3d2214de800fc9f533b83ec7`, while the original issue-event/run head remained `39be1f81d0139f7aba20eb6296242f036e0e464c`. The second attempt therefore used the newer main head.
- Publisher confirmation: [comment #7085509206](https://github.com/Satobloc/HsH/issues/2359#issuecomment-7085509206). Publisher commit `8b9810c8788fcc4606925fa72d4065eb080e8426`; canonical artifact blob `c0cf5b1edad47a2cb5dc1f5f741c5db40332bcae`; SHA-256 `d07bbeceefc4d38f070d1b5be878fbbc5227d1a8436550a96a7838f321051632`.
- Independent readback compared the parsed issue-envelope `content` with the canonical artifact: exact string equality, 10,913 characters. The publisher comment's digest equals the frozen issue-envelope digest.
- Final h1024:s4 status: **PUBLISHED_VERIFIED**. The same issue #2359 was reused; no duplicate issue or manual canonical write.
- This successful retry on a newer main checkout strongly supports the branch-ref advancement explanation for the first 409, but does not conclusively establish the server's exact conflict cause because attempt 1's HTTPError body was not captured.


## Layer 8 applied witness 02 — Sable source-inventory sampler crosswalk | Morrow h1047:s3 | 2026-11-23

- Public report: [Morrow h1047:s3, issue #2429](https://github.com/Satobloc/HsH/issues/2429), `PUBLISHED_VERIFIED`; publisher run [#45208517767](https://github.com/Satobloc/HsH/actions/runs/45208517767), confirmation comment #7106064624, artifact commit `8365634bf4f2fc07d788d67d0fc5b610c509fc20`, blob `f3b5b02b10fbf62208bfa0b28505793c6cbafe0a`, SHA-256 `504e0ed5c106f8de2e8b15f55bd1da424cd31d99a2a07ae6400a10b3de4873ac`; exact issue-envelope/artifact content comparison passed. Non-blocking PR scope note: [#2222 comment #7106028447](https://github.com/Satobloc/HsH/pull/2222#issuecomment-7106028447).
- HsH `main` preflight commit: `846ea0a100cb87473c6b56c43afdf976c004931e`. Current-main sampler blob `32ad549bff5cf9a34ed26f6b5059f2ad746642e7`, version `sable-source-inventory/0.2.1`.
- PR #2222 exact head: `3c56938e024accfc0a5097927ae3e106ee68dc09`; sampler blob `efcd135392be267d0c79dd79903094a519cf9b0b`, version `sable-source-inventory/0.2.2`. Exact-head Actions run #44812295233 succeeded on the bounded symlink/quarantine regression suite. PR remains OPEN / DRAFT / UNMERGED.
- At PR head, `FileRecord` contains repository label, path, topdir, suffix, kind, size, content SHA-256 and optional line count. The summary carries tool, seed, sample size, counts, `inventory_sha256`, repository counts, quarantine/symlink counts and quarantine policy. It does not carry `run_id`, input repository commit/tree, or per-row Git blob identity.
- `inventory_sha256` hashes joined `(repository, path, size_bytes, content_sha256)` rows; it is not a Git tree ID. The upload helper's `commit_sha` identifies the destination commit for the generated output, not a source-input commit.
- **Applied status:** `SAMPLER_SUMMARY_NOT_SNAPSHOT_BOUND`. A separate orchestrator-side run manifest may supply the missing input identities, but its private payload was not inspected under Morrow's no-payload boundary. End-to-end status remains `ORCHESTRATOR_MANIFEST_UNVERIFIED / UNKNOWN`, not a proven workflow defect.
- Keep the PR's symlink/quarantine gate separate from Layer 8 snapshot binding. No PR edit, formal review, approval, merge, or ownership change was made. No private HSH_RESOURCES payload was opened or copied.
- This is an applied witness for the existing Layer 8 requirement, not a new global schema or theory claim.


## Layer 20 — Publisher issue-label and prior-publication binding

**Scope:** source custody and publication-intake identity consistency only. This layer does not authenticate the originating worker/run, alter publisher execution identity, or change Morrow's September 13 theory stop.

### Distinct identities

Keep these records separate:

- **Issue resource:** `(repository, issue.id, issue.number)`.
- **Human-readable issue label:** title, including any optional worker/run token such as `hNNN:sN`.
- **Content submission:** `(submission_id, exact UTF-8 content SHA-256)`.
- **Publisher execution:** workflow/run/attempt and triggering event action, when actually exposed.
- **Published artifact:** `(repository, fixed path, commit SHA, Git blob SHA, content digest)`.
- **Originating run:** a separate binding that is not established merely by the issue title or a caller-supplied `submission_id`.

Do not collapse these identities into one. A title prefix such as `[HSH-PUBLISH-V1]` proves only that the issue is routed through the publisher's title gate.

### Label-consistency check

When both the issue title and submission ID explicitly encode a worker/run label, compare the parsed values before accepting publication:

`title_run_key == submission_id_run_key`

If the values differ, classify `ISSUE_SUBMISSION_LABEL_MISMATCH`. Preserve the issue and its exact envelope; do not claim publication. If the title does not encode a run key, use `TITLE_RUN_LABEL_UNSPECIFIED`; do not infer one.

This is a consistency check, **not authentication**. A matching title and submission ID can still be fabricated or detached from the actual scheduled run. Keep `ORIGIN_RUN_UNBOUND` unless a separate immutable, source-linked run manifest or equivalent evidence establishes the join.

### Prior-publication binding

A publisher confirmation plus exact canonical artifact readback binds an issue to the submission it published at that time. Do not repurpose that issue for another worker/run or different content, even if a later body edit can trigger the workflow again. A distinct new submission requires its own valid intake event; a rejected submission remains its single audit record and is not to be edited/retried/replaced contrary to the current publication-intake rule.

The current workflow listens to both `issues.opened` and `issues.edited`; therefore a body edit can trigger another publisher execution. That event behavior does not change the issue's earlier title, prior publication, or identity history. Record the actual action/run/attempt when exposed; do not infer it from an issue update timestamp or comment alone.

### Applied witness — HsH issue #1865, Morrow h1123:s3

Pinned source cut: HsH main `f2fb03b4f44d0bdbb42c96427ca4cbad29b068a6`.

- Issue #1865 title remains `[HSH-PUBLISH-V1] Morrow h888:s0 | Lane 00 source-custody addendum`.
- Its earlier publisher confirmation #6933327250 identifies the h888 artifact at `WORKSPACES/COMMON/PUBLISHED_SUBMISSIONS/morrow-h888-s0-lane00-source-custody-20261117t0000z-001.md`, Git blob `cd54c2ff22f16efcfb68eec85908543694c0d007`. The artifact's heading and run key both identify h888:s0.
- The current issue body instead contains submission ID `morrow-h1116-s0-equation-transcription-correction-20261126t1224z-001` and h1116 content. The title and submission run labels therefore disagree.
- The current body declares SHA-256 `23f73da839728101865ce714b0aa03d38b9374ecda04160d50a6bc365a915d5b`; publisher comments #7191982352 and #7192014379 say `REJECTED: SHA-256 mismatch`.
- No h1116 canonical artifact was found at its expected submission path. The h888 artifact remains present and distinct. The current issue is not a verified h1116 publication.
- The current publisher workflow file is `.github/workflows/issue-publisher.yml`, blob `66e3261ff13e05bcc915809683b652ea9043703f`; it listens to `opened` and `edited`. The current publisher script is `tools/issue_publish.py`, blob `7067e8d9f27a273d90e443afb0493260d9a3ecbf`. Its title check verifies the publisher prefix, not equality between an encoded title run key and the body `submission_id`. This is a bounded source-level finding, not a claim that the script caused the digest mismatch.
- Elias h1088:s3 issue #2538 already formalizes publisher event/execution/artifact identity composition and the `ORIGIN_RUN_UNBOUND` limitation. This Layer 20 is narrower and additive: it addresses the missing human-readable title/submission run-label consistency check. It does not duplicate or replace that event-identity work.

### Proposed maintainer regression cases

1. Title h888:s0 + submission ID h1116-s0 → reject as `ISSUE_SUBMISSION_LABEL_MISMATCH` before artifact write.
2. Title h1116:s0 + submission ID h1116-s0 → pass this consistency check only; origin remains unbound unless separately evidenced.
3. Title with no parseable run label → `TITLE_RUN_LABEL_UNSPECIFIED`; do not fabricate a match.
4. Previously published issue edited to a different submission ID → preserve prior-publication binding and reject reuse, even if the body-edit event invokes the workflow.

**Status:** `SOURCE_GAP_CONFIRMED / MAINTAINER_CHANGE_PROPOSED_NOT_IMPLEMENTED / ISSUE1865_H1116_NOT_PUBLISHED / NO_RETRY / NO_DUPLICATE_ISSUE`.

This is an operational provenance/verification rule only. No publisher code, workflow, theory, equation, physical claim, task, or scheduler state was changed.


## Layer 21 — h1135:s0 exact Unicode path and rejected publisher intake

**Scope:** raw-source custody and publication-intake readback only. This layer does not release Morrow's September 13 theory stop, authenticate a worker instance, or authorize geometry integration.

### Raw source and snapshot identity

- Conversation: 6a9ee7ca-d340-83ea-b99d-6a3097429f36.
- Earlier blob: 362075c5e32ec9e97579bd1de58fba7f612cb6bb; 465 mapping keys.
- Later blob: ee394b446b2e36d35fd1e5ecd004685c0422457b; 697 mapping keys, 696 message-bearing nodes, 17 user-role messages, one null root node.
- The earlier mapping is a strict key-prefix of the later mapping: 465 shared keys, zero older-only keys, 232 later-only keys (145 assistant, 84 tool, 3 user). These are snapshots of one conversation, not independent witnesses.
- Reparsed current ancestry reaches all 697 mapping nodes. Direct user-role records 402ade01-7116-4efb-9b14-31e477754458 (2026-09-08T03:25:36.187Z), 934e87de-4e61-4622-a0ea-e5047aa235c6 (2026-09-13T00:11:10.939Z), and 99ae959b-fbeb-4c1e-9326-a6723c2b9557 (2026-09-13T15:31:22.757Z) are on that ancestry. Each has author.name=null; raw author fields do not externally authenticate the human account.
- The later trial invitation permits source custody, provenance, chronology, source comparison, theory-material reading/note-taking and bounded mathematical/equation checking. It does not expressly rescind the earlier stop or authorize theory integration, equation correction, physical prediction, Lean theory proof, paper work or BEDROCK promotion.
- Separate workspace-creation conversation 6a9dea2e-bb98-83ea-a74f-4beb4baa3153, direct message 53a18c37-9c45-4616-b67d-25fe2e36a6c5 at 2026-09-13T09:12:50.281Z, precedes first Morrow README commit c18c66a26de2660d7336df7569dd4a5d656f39be at 09:14:25Z by 94.719 seconds. This is chronology, not proof of runtime identity or causation.

### Exact path correction

Pinned current HsH main at readback: commit 002f7c70d1787f832804b25c9b3efc410fb4364e; tree 9c6ba33509594255d6854af97278229661566ebf; recursive tree complete, 17,900 entries, truncated=false.

The tree places blob ee394b446b2e36d35fd1e5ecd004685c0422457b (3,017,953 bytes) at:

~~~text
DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_18/26.09.07•26.09.13•🧗_♂️ MORROW ALDUS [Reconstruct H(s)H Synthesis] — raw.json
~~~

The actual path uses U+1F9D7 U+005F U+2642 U+FE0F. The November 14 and November 18 ledgers record the visually similar U+1F9D7 U+200D U+2642 U+FE0F path. The ZWJ variant returns 404; the exact underscore path returns the correct blob SHA but an empty path-reader body; blob-by-SHA retrieval succeeds. This is a path-locator correction, not a blob-identity correction. Do not silently normalize the underscore to a ZWJ.

### Publisher rejection witness — issue #2666

- Issue: #2666, title and submission run label both identify Morrow h1135:s0.
- Submission ID: morrow-h1135-s0-raw-source-path-identity-correction-20261127t0700z-001.
- Declared content SHA-256: 18aadc4f6a0c653698d569f4a61986a1a8ef269f0fe13bb2a07a6d5c2b4979a6.
- SHA-256 of the exact content string read back from the issue envelope: 5f6a935767b4ffdb78a5849dd4d1cb08eab85fa64eb1e6f76f1d41387374307d.
- The mismatch is one final LF present in the Python draft used for the declared digest but absent from the submitted issue content.
- Publisher workflow run #45959906780, job #140375260476, completed with process conclusion success but printed REJECTED: SHA-256 mismatch. Issue comment #7212712822 records the rejection.
- The run event head was e0cb305c5f9cb4dc08ce860ca177329b1d331e4a; the job log shows checkout of main at 88ce490d49214b3b209da41a96b7f1046ccd2d29. Current main later advanced to 002f7c70d1787f832804b25c9b3efc410fb4364e. Keep event head, job checkout and current branch distinct.
- Expected canonical artifact path is absent. The issue body is an audit record, not a published artifact.
- Apply Layer 20: do not edit, retry, replace or duplicate rejected issue #2666. No publisher success or artifact readback is claimed.

### Lane and repetition controls

- Mersearch request lanes 1, 2, 3 and 4 remain occupied. Lane 1 Calder-angle, Lane 3 Calder-IRI and Lane 4 Kestrel-finite-core have request files but no request-specific manifest/receipt. Lane 2 Ariadne-Kirk has a compact manifest/receipt (24,200 files, 23,273,608 records, 38 hits, six paths) but remains requested/not released; no raw-hit inventory was used. No new query, overwrite, release or retrigger.
- Existing WWRD source-fidelity work already covers the first-blush heuristic and its boundaries: Tern 2026-11-01 audit; Loom June-22 source correction; Calder h807 moving-slice crosswalk; Mercer h824 SAT-O1/Blockwave/WWRD audit; published rope contact/torsion comparator. No WWRD audit was repeated.
- The h1116:s0 Morrow geometry report already covers the November 8 time-normal/worldtube/timesheet source family. No geometry integration was repeated.
- Task graph remains 16 declared branches / 18 records; Tern retains reconciliation. Tern's PWH queue remains under Tern ownership; no queue or graph edit.
- No predecessor Tern h1134:s4 receipt or handoff was found in the current main tree or Morrow inbox. This is HANDOFF_NOT_FOUND_AT_READBACK, not evidence of a missed check-in.
- No authenticated current Morrow thread; no direct-thread delivery or cross-thread acknowledgment.

**Status:** PATH_VARIANT_CORRECTED / RAW_BLOB_REPARSED / PUBLISHER_REJECTED / NO_CANONICAL_ARTIFACT / NO_RETRY / SOURCE_CUSTODY_ONLY / THEORY_STOP_PRESERVED.


## Layer 22 — Dataset row-kind, identifier-domain, and derived-count binding

**Scope:** archive/source custody, dataset representation, and conversion provenance only. This layer does not release Morrow's September 13 theory stop, authorize Lean theory proof, alter Orson's P1, or promote a physical or cognitive claim.

### Required identity stack

Keep these distinct for every tabular corpus and converted framework object:

1. **Source snapshot:** dataset/repository ID, immutable revision, file paths and file digests.
2. **Source row:** source-native row key, including its actual uniqueness domain.
3. **Row kind:** source-native event/message type.
4. **Semantic unit:** conversational turn, task-state event, submission event, session/group, participant, or annotation.
5. **Converted object:** framework object type and its actual key.
6. **Analysis unit and denominator:** the unit used in each reported statistic.

A bare row identifier must not be treated as globally unique merely because it is named 'id' or 'message_id'. If the source uses sentinel IDs for system records or scopes IDs within a group/session, preserve a source-unique composite key (candidate: '(group_id, message_id)') or publish an explicit collision/overwrite ledger. A dictionary keyed by a non-unique field can silently replace earlier rows; record the exact constructor path and collision semantics. Framework object count must never silently replace raw-row count or analysis-unit count.

### Required reconciliation ledger

Before accepting a converted corpus count, record:

- raw rows by source-native row kind;
- distinct source keys and duplicate-key groups;
- composite-key uniqueness;
- converted object count and overwrite policy;
- analysis-unit count and inclusion rule;
- exact source snapshot and conversion-code revision.

### Applied witness — DeliData / ConvoKit 4.1.2

Source report and run-bound intake: [Morrow h1142:s3, issue #2696](https://github.com/Satobloc/HsH/issues/2696). The issue body is the source-grounded report; its publisher status must be read from the publisher confirmation and canonical artifact, not inferred from issue creation.

- The 2023 DeliData paper reports 500 dialogues and 14,003 annotated conversational utterances (DOI '10.1145/3610056'). Its annotation table totals 14,003.
- The current Hugging Face 'gkaradzhov/DeliData' page reports 500 group IDs and 17,610 table rows. Its schema distinguishes MESSAGE (chat entry), INITIAL (task/setup record), and SUBMIT (participant submission event); the README says system messages use message_id = -1. The page displayed only short revision 'dfccbf5'; full snapshot identity was not recovered.
- ConvoKit 4.1.2 DeliData documentation reports 500 conversations and 17,111 utterances.
- At ConvoKit tag commit '7825beeca5ce43b00a9402d9a6773514613eb923', the DeliData conversion notebook (blob '7ae63bdaa713f03ce1adc0b052d3d6198467b9c8') converts every TSV row to an Utterance, sets id=row['message_id'], retains message_type in metadata, and passes the list to Corpus(utterances=...).
- At the same tag, convokit/model/corpus.py (blob '4be85709b26a76d2ee7bc71c7a34d96c8f48dd38') constructs self.utterances = {utt.id: utt for utt in utterances}. Repeated IDs are overwritten by later list entries; this constructor path does not invoke the separate add_utterances() warning path.

**Conditional count mechanism:** if the raw 17,610-row snapshot contains exactly one INITIAL system row per each of the 500 groups and each uses message_id = -1, the global-ID dictionary collapses 499 rows: 17,610 - 499 = 17,111. This exactly matches the ConvoKit documentation count. The remaining difference from the paper's 14,003 chat utterances is consistent with INITIAL and SUBMIT event records being included in the conversion count.

**Do not promote the conditional mechanism to an exact row-type census.** The 500 INITIAL count, exact SUBMIT count, full Hugging Face revision/tree, and identity of the snapshot used for ConvoKit's hosted corpus were not independently retrieved. No raw TSV download or row-by-row census was performed. The proposed exact decomposition (14,003 MESSAGE + 3,107 SUBMIT + one retained INITIAL) is arithmetic implied by the hypothesis, not an observed distribution.

### Disposition

CONVERSION_COLLISION_MECHANISM_CONFIRMED / EXACT_ROW_TYPE_COUNTS_NOT_VERIFIED / SAME_SNAPSHOT_IDENTITY_NOT_ESTABLISHED.

Next decisive source check: pin the full Hugging Face revision or official archive; count MESSAGE / INITIAL / SUBMIT; count message_id = -1 by group_id; reproduce the tagged ConvoKit dictionary length; then compare against the actual hosted deli-corpus snapshot. Do not alter third-party data or code from this source-custody finding alone.

No raw participant data was downloaded; no participant-level analysis, model trial, human experiment, P1 manuscript work, theory integration, equation correction, Lean theory proof, PWH queue/graph/worker-checkpoint write, task mutation, or BEDROCK promotion occurred.


### Layer 22 source-attribution amendment — h1142:s3

Append-only correction to the applied DeliData witness and issue #2696 (issue comment #7221744999):

- The current Hugging Face dataset page directly reports 17,610 rows and defines the group_id field. It does not itself report a verified distinct-group count of 500.
- The 500-dialogue figure is reported by the 2023 DeliData paper; the 500-conversation figure is reported by ConvoKit 4.1.2 documentation. Distinct group_id values in the current Hugging Face snapshot were not independently counted.
- Therefore the 499-collision reconciliation is conditional on the current raw snapshot containing 500 distinct groups and exactly one INITIAL system row with message_id = -1 per group.
- The raw TSV file count was not independently counted. The earlier phrase “raw 500 TSV files” in the issue report is corrected to “raw TSV files.”
- The issue body and canonical artifact remain immutable. This is an append-only source-attribution correction, not a republished or replaced artifact.

Status remains: CONVERSION_COLLISION_MECHANISM_CONFIRMED / DISTINCT_GROUP_COUNT_NOT_VERIFIED / EXACT_ROW_TYPE_COUNTS_NOT_VERIFIED / SAME_SNAPSHOT_IDENTITY_NOT_ESTABLISHED.


### Layer 22 source-version amendment — h1142:s3

Append-only correction to issue #2696 (comment #7221776904):

- The documentation page actually inspected is titled **ConvoKit 5.0.0 documentation**; it reports 17,111 utterances and 500 conversations. The 17,111/500 documentation count must not be attributed to version 4.1.2.
- The conversion code was separately inspected at ConvoKit tag v4.1.2 (tag commit 7825beeca5ce43b00a9402d9a6773514613eb923). Its conversion notebook blob is 7ae63bdaa713f03ce1adc0b052d3d6198467b9c8; its corpus.py blob is 4be85709b26a76d2ee7bc71c7a34d96c8f48dd38.
- Current ConvoKit master at commit 91a1df0143668d8e0017f932f97ac878e53b91fa retains the same conversion notebook blob and the same dictionary-key construction in corpus.py at line 220; current corpus.py blob is 18ff79042c5a36154180b8ea7d33e8fccdef87a6.
- The exact hosted-corpus source snapshot remains unidentified. The count-collision mechanism is code-supported in both inspected code states, but the 499-row attribution remains conditional on the raw row-type and distinct-group census.

The issue body and published artifact remain immutable; this is a source-version correction, not a republished report.


### Layer 22 amendment 03 — exact DeliData snapshot pin (Morrow h1146:s2; 2026-11-27)

**New source identity evidence.** The public Hugging Face repository `gkaradzhov/DeliData` currently resolves `main` to `dfccbf5d5206330d074a0d31e1a564b68bf6a4eb`. That commit changes README only; its parent/data-upload commit is `743e2eb60d7b5a581d82beed94a91ad0306354cb`, titled “Upload 500 files.” The exact data-upload snapshot is therefore pinned to the full `743e2eb...` commit, while current `main` is `dfccbf5...`. The rendered upload diff is capped at 50 files, so this does not independently enumerate every file.

Sources: [current main commit](https://huggingface.co/datasets/gkaradzhov/DeliData/commit/dfccbf5d5206330d074a0d31e1a564b68bf6a4eb); [data-upload commit](https://huggingface.co/datasets/gkaradzhov/DeliData/commit/743e2eb60d7b5a581d82beed94a91ad0306354cb); [dataset page](https://huggingface.co/datasets/gkaradzhov/DeliData).

The dataset page reports 17,610 rows; the upload commit title reports 500 files. Neither count was independently recomputed from all TSVs. One displayed viewer example has an `INITIAL` row with `message_id=-1`; no corpus-wide sentinel/group or row-kind census was executed. Addenda 01–02 to issue #2696 remain the controlling source-attribution and ConvoKit-version corrections; the original report artifact is unchanged. The 17,610 HF row metadata, 17,111 ConvoKit 5.0.0 utterance figure, and 14,003 paper annotation figure remain distinct reported populations, not reconciled counts.

**Execution boundary:** the installed `hf` CLI exposes `datasets info` and `datasets sql`, but its pinned-revision request failed on runtime DNS resolution. `duckdb`, `datasets`, and `pyarrow` Python packages are absent; no local HsH or Mersearch stable checkout exists. All four Mersearch request lanes remain occupied; no request was overwritten or submitted. No raw TSV or participant-level text was downloaded or analyzed.

**Disposition:** `SOURCE_REVISION_PINNED / ROW_KIND_CENSUS_PENDING / SENTINEL_GROUP_AUDIT_PENDING / CONVOKIT_CONVERSION_NOT_REPRODUCED`. Next decisive operation: at the pinned revision, count row kinds per file, test `message_id=-1` against `group_id`, and separately reproduce ConvoKit dictionary construction.

## Layer 21 applied witness 02 — current-main snapshot membership (Morrow h1161:s3; 2026-11-28)

**Scope:** source-custody and exact locator continuity only. This does not alter Morrow's September 13 theory stop, authenticate the human account behind archived messages, authorize geometry integration, or change any theory/equation status.

### Composite locator rule

For a raw conversation source, keep these identities separate and bind them together in the retained locator:

1. repository and immutable commit SHA;
2. root/tree SHA and the exact path's tree membership;
3. exact path codepoints/UTF-8 spelling;
4. Git blob SHA and byte size;
5. retrieval-channel result (path reader versus blob-by-SHA);
6. conversation/node identity, author-role field, and current-ancestry evidence.

A branch name alone is not an immutable snapshot; a path alone does not identify content; a blob alone does not establish membership in a particular repository snapshot. Retrieval success does not authenticate the human account. A path-reader blank response is not proof of absence when the pinned tree entry and blob-by-SHA retrieval succeed.

### Applied witness — Morrow raw export in current main

At the readback snapshot, main was commit 3953e9a52481a1e5499e957afe798580ea437797, parent e67494e9cc2d0001ad10e46e3d1c132a521ca3a2, root tree 4994afdb8f05ac69389fba06db0f6d68a9602615. The commit is an unsigned GitHub Actions bot refresh of PUBLIC_SITE/generated/discovery.json; it is repository snapshot metadata, not source authorship or a new conversation version.

A bounded non-recursive tree walk found the exact path through complete, non-truncated subtrees:

- root tree 4994afdb8f05ac69389fba06db0f6d68a9602615: 154 entries;
- DEVELOPMENT_FULL_CONVOS tree 6daff191bed5c1a35549c706e729ac687cec589e: 123 entries;
- SAT_CONVOS_18 tree b3bc3b73d90a60dbc857281ff4ca0a6c3bab8653: 22 entries.

Exact path (preserve the underscore):

~~~text
DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_18/26.09.07•26.09.13•🧗_♂️ MORROW ALDUS [Reconstruct H(s)H Synthesis] — raw.json
~~~

The climber/underscore/male-sign/variation-selector sequence is U+1F9D7 U+005F U+2642 U+FE0F, not the visually similar ZWJ sequence U+1F9D7 U+200D U+2642 U+FE0F.

The tree entry remains blob ee394b446b2e36d35fd1e5ecd004685c0422457b, size 3,017,953 bytes. Blob-by-SHA retrieval and JSON parsing succeeded. The export has 697 mapping entries, 696 message-bearing nodes, and 697 nodes on its exported current ancestry. Direct user-role records 402ade01-7116-4efb-9b14-31e477754458, 934e87de-4e61-4622-a0ea-e5047aa235c6, and 99ae959b-fbeb-4c1e-9326-a6723c2b9557 are all on that ancestry; each has author.name=null. This supports attribution within the export, not external human-account authentication.

No raw message text is repeated here. The raw bytes were not rehashed to SHA-256 in this pass; the Git blob SHA-1 is the verified object identifier. The blob is unchanged from Layer 21. This is a later repository-snapshot membership witness, not a new source version or an independent conversation witness.

### Disposition

CURRENT_SNAPSHOT_MEMBERSHIP_VERIFIED / EXACT_PATH_PRESERVED / BLOB_UNCHANGED / HUMAN_AUTHENTICATION_NOT_ESTABLISHED / SOURCE_CUSTODY_ONLY / THEORY_STOP_PRESERVED.

No worker-local BOOT, CURRENT_WORK, TRIAL_CHECKPOINT, or INBOX update is made under the active P0 interlock. No PWH queue/task-graph write, physical calculation, Lean theory proof, equation correction, theory integration, paper work, or BEDROCK promotion occurred.
