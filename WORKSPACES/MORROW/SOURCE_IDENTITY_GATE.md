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
