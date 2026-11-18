# Morrow h933:s3 Amendment 02 | Raw-blob reparse and timestamp correction

**Run key:** `REVROT3-19-20261011:933:s3`  
**Reparse time:** 2026-11-18T21:49Z  
**Status:** SOURCE-VERIFIED RAW-BLOB REPARSE / ADDITIVE CORRECTION TO PUBLISHED REPORT #2017

## 1. Why this amendment exists

After publication of the h933:s3 Layer 11 report, I retrieved both immutable Morrow conversation blobs directly by SHA through the Git blob API and parsed their top-level metadata and target message records. This reparse confirms the role/author-label distinction and corrects one factual error in the original report: it assigned the earlier snapshot's `update_time` to the later snapshot.

The original report and its canonical artifact remain immutable. This amendment supersedes only the incorrect snapshot-metadata attribution and the provisional `author.name` values that had not been re-established at the time of the original report.

## 2. Exact raw snapshots

Both blobs contain conversation ID `6a9ee7ca-d340-83ea-b99d-6a3097429f36`. They are two versioned snapshots of one archived conversation, not independent witnesses.

| Field | Earlier snapshot | Later snapshot |
|---|---|---|
| Raw blob SHA-1 | `362075c5e32ec9e97579bd1de58fba7f612cb6bb` | `ee394b446b2e36d35fd1e5ecd004685c0422457b` |
| Repository path in source ledger | `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.09.07•26.09.09•MORROW [Reconstruct H(s)H Synthesis] — raw (3).json` | `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_18/26.09.07•26.09.13•🧗‍♂️ MORROW ALDUS [Reconstruct H(s)H Synthesis] — raw.json` |
| Mapping keys | 465 | 697 |
| Message-bearing nodes | 464 | 696 |
| Top-level `create_time` | 2026-09-07T16:43:41.329181Z | 2026-09-07T16:43:41.329181Z |
| Top-level `update_time` | **2026-09-09T12:45:43.552007Z** | **2026-09-14T07:11:01.416857Z** |
| `is_archived` in export | false | false |

The Git blob API returned decoded JSON strings of 1,749,996 and 3,013,273 characters respectively in this run. Those are decoded character counts, not replacement byte-size measurements. The exact blob SHAs above are the immutable source locators.

## 3. Corrected timestamp attribution

The 2026-11-14 assistant-authored source-correction ledger and its 2026-11-15 revalidation say that the **later** export's top-level `update_time` remains 2026-09-09. That statement is wrong: `2026-09-09T12:45:43.552007Z` belongs to the **earlier** 465-key snapshot.

The later 697-key snapshot's top-level `update_time` is `2026-09-14T07:11:01.416857Z`, after the September 13 stop and trial messages. There is no stale-update-time anomaly in the later snapshot relative to those messages. The earlier snapshot predates them and does not contain either message. The two earlier assistant-authored ledger statements are superseded for this metadata field only; the original ledgers remain unchanged.

The exact message-level timestamps remain:

- Role clarification `2c6ae3c8-f6f9-4d7b-b3df-66ea1ca2bed9`: 2026-09-07T22:24:59.538Z.
- Assistant self-description `32ef4db5-269f-5c1c-8408-188c956cca52`: 2026-09-08T02:43:43.768239Z.
- Team Archivist assignment `402ade01-7116-4efb-9b14-31e477754458`: 2026-09-08T03:25:36.187Z.
- Theory stop `934e87de-4e61-4622-a0ea-e5047aa235c6`: 2026-09-13T00:11:10.939Z.
- Later trial invitation `99ae959b-fbeb-4c1e-9326-a6723c2b9557`: 2026-09-13T15:31:22.757Z.

## 4. Raw author-field reparse

The following fields were read directly from the raw message records in both snapshots:

| Message | Present in | `author.role` | `author.name` | `author.metadata` | `message_source` |
|---|---|---|---|---|---|
| `2c6ae3c8-f6f9-4d7b-b3df-66ea1ca2bed9` | Both | `user` | `null` | `{}` | `null` |
| `32ef4db5-269f-5c1c-8408-188c956cca52` | Both | `assistant` | `null` | `{}` | not present as a top-level message field; nested metadata has no external identity |
| `402ade01-7116-4efb-9b14-31e477754458` | Both | `user` | `null` | `{}` | `null` |
| `934e87de-4e61-4622-a0ea-e5047aa235c6` | Later only | `user` | `null` | `{}` | `null` |
| `99ae959b-fbeb-4c1e-9326-a6723c2b9557` | Later only | `user` | `null` | `{}` | `null` |

For each listed node, the mapping key, node `id`, and embedded `message.id` agree. The raw `author` object contains role, null name and empty metadata; it supplies no external account/person identifier.

Consequences:

- The initial name `Morrow` is first introduced by the assistant-authored self-description `32ef...`; the later user-role assignment `402ade...` addresses the worker as Morrow and assigns a **provisional Team Archivist** remit. The assistant's initial name/role narrative is not a user-authored appointment.
- The user-role assignment, stop and trial invitation all have `author.name=null`. The archive convention may attribute these user-role sources to Nathan for internal project provenance, but no external identity authentication is present in the raw author fields.
- The stop and later trial invitation are separate user-role messages. The later invitation still does not expressly release the theory stop/quarantine.
- The duplicate role-clarification text in the separate `Continue Conversation Here` conversation remains based on the earlier correction ledger; that separate raw blob was not fetched in this reparse. Do not upgrade it to an independently authenticated witness.

## 5. Corrections to h933:s3 report #2017

The original report's sentence assigning `2026-09-09T12:45:43.552007Z` to the later export is corrected: it is the earlier snapshot's `update_time`; the later snapshot is `2026-09-14T07:11:01.416857Z`.

The original report's `author.name` entries marked “not re-established in this pass” for the assistant self-description, stop and trial are now resolved by direct raw-blob reparse: all three have `author.name=null`. The earlier report's read-scope statement remains historically accurate for the time it was authored; this amendment records the subsequent reparse.

No change to the source-role convention, provisional Team Archivist remit, theory stop, quarantine, trial scope, current-thread status, or any theory/physical premise. The two snapshots remain one conversation, not independent witnesses.

## 6. Method and limits

- Mersearch was not callable in this runtime; no Mersearch query is claimed.
- The exact immutable Git blobs were retrieved by SHA through the existing GitHub Git Blob API and parsed directly. The path-based fetch for the later raw file did not return the file; the blob-SHA retrieval succeeded.
- The two source blobs were inspected only for top-level snapshot metadata and the five named message records. No broad transcript review, theory extraction, mathematical construction, physical calculation, fit, prediction, or paper review was performed.
- No new tooling, dependency, fork, branch, task, or subscription was created.
- This is an assistant-authored source-correction amendment, not Nathan Direct and not an external identity-authentication claim.

**Disposition:** `RAW_BLOB_REPARSE_VERIFIED / LATER_UPDATE_TIME_CORRECTED / AUTHOR_NAME_NULL_CONFIRMED / THEORY_STOP_PRESERVED / NO_EXTERNAL_IDENTITY_AUTHENTICATION`.
