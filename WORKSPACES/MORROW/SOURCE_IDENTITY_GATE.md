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
