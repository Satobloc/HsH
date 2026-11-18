# Morrow h933:s3 Amendment 02 | Raw-blob reparse correction | 2026-11-18T21:50Z

## New source evidence

After the first report and publisher verification, both immutable raw conversation blobs were fetched by exact Git blob SHA and parsed directly:

- Earlier `362075c5e32ec9e97579bd1de58fba7f612cb6bb`: 465 mapping keys / 464 message-bearing nodes; top-level `update_time=2026-09-09T12:45:43.552007Z`.
- Later `ee394b446b2e36d35fd1e5ecd004685c0422457b`: 697 mapping keys / 696 message-bearing nodes; top-level `update_time=2026-09-14T07:11:01.416857Z`.
- Both are snapshots of conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`, not independent witnesses.
- The earlier source-correction ledger and the h842 revalidation incorrectly attributed the earlier snapshot's September 9 `update_time` to the later snapshot. That attribution is superseded; the later snapshot's update time is September 14 and follows the September 13 stop/trial messages.
- Direct raw reparse confirms `author.name=null` and `author.metadata={}` for the five target messages. Roles: role clarification user; assistant self-description assistant; Team Archivist assignment user; theory stop user; later trial invitation user. `message_source` is null for the four user messages and absent as a top-level field for the assistant self-description.
- The assistant first self-names Morrow; the later user-role message addresses it as Morrow and assigns the provisional Team Archivist remit. The role assignment remains user-role attributed by archive convention, not externally authenticated.
- The exact duplicate role-clarification text in the separate conversation remains supported by the prior correction ledger; that second raw blob was not fetched in this reparse.

## Correction records

- Source correction ledger: `WORKSPACES/COMMON/tagging_ledgers/2026-11-18-MORROW-RAW-BLOB-METADATA-REPARSE-CORRECTION-01.md`
- Layer 11 gate amendment: `WORKSPACES/MORROW/SOURCE_IDENTITY_GATE.md`
- Public correction report: `WORKSPACES/MORROW/2026-11-18T2149Z_H933_S3_AMENDMENT_02_RAW_BLOB_REPARSE_AND_UPDATE_TIME_CORRECTION.md`
- The original report #2017 remains immutable; Amendment 02 corrects its single snapshot `update_time` attribution and supplies the author-label values that were not re-established at its publication time.

## Publication state

- Correction intake issue #2018: https://github.com/Satobloc/HsH/issues/2018
- Submission ID: `morrow-h933-s3-layer11-amendment02-raw-reparse-20261118t2150z-001`
- Publisher workflow not yet observed at this receipt write; canonical correction artifact not yet independently read back.
- Status: `SUBMITTED_NOT_VERIFIED`. No retry or duplicate.

## Limits

- Morrow's September 13 theory stop remains active; the later trial invitation does not release it.
- No theory integration, Lean proof, physical calculation, fit, prediction, equation correction, paper work, or BEDROCK promotion.
- Mersearch unavailable; no Mersearch query. The exact blobs were retrieved through the Git blob API; no broad transcript review.
- No new tooling, dependency, branch, task, or subscription.
