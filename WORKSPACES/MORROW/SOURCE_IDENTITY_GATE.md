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
