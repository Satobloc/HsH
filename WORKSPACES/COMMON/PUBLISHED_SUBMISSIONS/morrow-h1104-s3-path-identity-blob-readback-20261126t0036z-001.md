# Morrow h1104:s3 | Exact-path and blob-readback witness

**Run key:** `REVROT3-19-20261011:1104:s3`  
**Nominal slot:** `2026-11-26T00:36:00Z`  
**Deterministic selection:** Morrow, ring index 13; next Kestrel, index 14.  
**Disposition:** `SOURCE_CUSTODY_PATH_VARIANT_FOUND / PATH_PRESENT_CONTENTS_EMPTY / BLOB_CONTENT_READ / ROLE_AUDIT_PATH_CORRECTION_PENDING / THEORY_STOP_PRESERVED`.

This is source-grounded assistant execution, not authentication or continuation of a historical Morrow instance/thread.

## 1. Authority and permitted scope

The recovered Morrow conversation is `6a9ee7ca-d340-83ea-b99d-6a3097429f36`. Direct user message `402ade01-7116-4efb-9b14-31e477754458` establishes a provisional Team Archivist remit: appraise the broader corpus, prepare a flexible action plan and coordinate with GitKeeper.

Direct user message `934e87de-4e61-4622-a0ea-e5047aa235c6` explicitly stops theory work and requires quarantine of prior theory artifacts. Later message `99ae959b-fbeb-4c1e-9326-a6723c2b9557` permits archive/maintenance, provenance, historical reconstruction and bounded source/equation checking, but does not expressly lift the stop.

Accordingly, this run performed source-custody and retrieval-workflow work only. No theory integration, physical prediction/calculation, Lean proof, equation correction, paper work or BEDROCK promotion.

No authenticated current Morrow thread was established. The Tern h1104:s2 packet arrived after this run started and was consumed only as optional repository context; it creates no assignment or response obligation.

## 2. Exact current-tree source crosswalk

Current HsH main at the readback was `71bbc1557d42d650e11cf3884c0bc9aefbbfcc3a`, tree `53c76499d5710c7b8e32271b92ef6632ac8fff69`. The recursive tree was complete, not truncated, with 17,678 entries.

Both historical Morrow snapshots are present as distinct paths in that exact tree:

| Snapshot | Exact repository path | Git blob | Bytes |
|---|---|---|---:|
| Earlier | `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_9/26.09.07•26.09.09•MORROW [Reconstruct H(s)H Synthesis] — raw (3).json` | `362075c5e32ec9e97579bd1de58fba7f612cb6bb` | 1,752,700 |
| Later | `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_18/26.09.07•26.09.13•🧗_♂️ MORROW ALDUS [Reconstruct H(s)H Synthesis] — raw.json` | `ee394b446b2e36d35fd1e5ecd004685c0422457b` | 3,017,953 |

The earlier and later blobs are snapshots of the same conversation ID, not independent witnesses. Existing Source Identity Gate Layer 8 records their raw-byte SHA-256 values (`4f79b15e…` and `4f5311f6…` respectively); those prior values were reused, not recomputed in this run.

### Newly verified path discrepancy

The Morrow role-lane audit's later-path literal uses `🧗‍♂️` (code points U+1F9D7 U+200D U+2642 U+FE0F). The exact current-tree path uses `🧗_♂️` (U+1F9D7 U+005F U+2642 U+FE0F). The strings are visually similar but not identical.

- Fetching the ZWJ candidate path returned GitHub 404.
- The exact underscore path resolved to blob `ee394b446b2e36d35fd1e5ecd004685c0422457b`.
- The path-based file wrapper returned that blob SHA but an empty content body (zero characters).
- Fetching the same blob by exact SHA returned the full JSON content, which parsed successfully.

This is not source absence or content corruption. It is a path-literal mismatch plus a path-fetch/body-return limitation. The Source Identity Gate already contains the correct underscore path; the role-lane audit pointer is the stale surface. Its correction remains pending.

## 3. Snapshot coverage and authority consequence

The two parsed snapshots contain 465 versus 697 mapping nodes and 14 versus 17 user-role messages. All 465 earlier mapping keys occur in the later snapshot; the later snapshot adds 232 keys. The provisional Team Archivist instruction occurs in both. The September 13 theory stop and later archive/maintenance trial invitation occur only in the later snapshot.

The later snapshot therefore carries authority-relevant user instructions absent from the earlier export. The earlier export must not be treated as the complete authority record merely because its blob remains retrievable. The two exports are not independent corroboration.

## 4. Corrected retrieval workflow

For large archive JSON, keep four independent fields rather than collapsing them into one “file found” result:

1. **Candidate path string:** preserve exact Unicode code points; do not silently normalize or substitute visually similar glyphs.
2. **Tree membership:** resolve the exact path against a complete, non-truncated tree pinned to a commit/tree SHA.
3. **Path-read result:** record returned blob SHA and whether content was actually returned. An empty body with a valid blob SHA is `PATH_PRESENT_CONTENT_NOT_RETURNED`, not `PATH_ABSENT`.
4. **Blob-read result:** fetch by the tree-bound blob SHA, parse the returned content, and retain the raw-byte hash status separately. A prior SHA-256 is not a fresh recomputation.

Use `PATH_ABSENT` only when the exact candidate path is absent from a complete tree at the pinned commit. Use `PATH_VARIANT_MISMATCH` when the candidate literal differs from the actual tree path. Keep snapshot identity (commit/tree/path/blob) separate from message identity (conversation ID, message UUID, outer role, timestamp and parent ancestry).

This is a source-custody workflow correction, not a new source-authority or theory claim.

## 5. Operational boundaries and return cursor

- Tern's h1104:s2 PWH deep review is `PUBLISHED_VERIFIED` at [issue #2571](https://github.com/Satobloc/HsH/issues/2571). Its next deep review is after five further independently verified completed work products, or an earlier material trigger. Queue/graph reconciliation remains Tern-owned.
- The PWH queue and task graph remain under the active P0 interlock; no queue, graph, Morrow checkpoint, source-gate or scheduler mutation was made.
- All four Mersearch lanes remain occupied. No new search, overwrite, retry or release. No private HSH_RESOURCES payload was opened.
- The automatic discovery refresh committed `71bbc155` as a direct child of Tern's publication commit `3536146389`; it changed only `PUBLIC_SITE/generated/discovery.json`. Discovery source currentness is PASS at this cut. Workspace presentation safety remains FAIL; live Paper A/B routes are NOT OBSERVED; deployment is NOT VERIFIED.
- FIE rereview is next due December 8. The unrelated-source break is next due November 28; the Babbage old/new crosswalk remains parked at its existing cursor.

**Next action:** after the P0 interlock permits reference-file maintenance, append the exact underscore path correction to the Morrow role-lane audit without erasing the earlier literal, then independently read back the corrected file. Next deterministic worker label: Kestrel. Any repository handoff is optional context only; no direct-thread delivery, consumption or acknowledgment is claimed.

No task ID, schedule, phase, prompt, enabled state or cadence changed. No sixth task, signet or conversation rename.