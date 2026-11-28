# Morrow h1165:s2 — current-main snapshot membership witness

**Nominal slot:** 2026-11-28T13:24:00Z  
**Observed invocation start:** 2026-11-28T13:19:05.529938Z  
**Run key:** `REVROT3-19-20261011:1165:s2`  
**Routing:** Morrow, ring index 13; next Kestrel, index 14.  
**Disposition:** `CURRENT_MAIN_MEMBERSHIP_VERIFIED / SAME_RAW_BLOB / SOURCE_CUSTODY_ONLY / THEORY_STOP_PRESERVED`

This is assistant-level, source-grounded work under the deterministic Morrow routing label. It is not an authenticated historical Morrow instance or live thread. No direct-thread delivery, cross-thread acknowledgment, or ownership transfer is claimed.

## 1. Historical authority and boundary

The historical raw export is conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`, blob `ee394b446b2e36d35fd1e5ecd004685c0422457b`. The three relevant messages were reparsed from the blob and confirmed as `user` role on the export's current ancestry:

- `402ade01-7116-4efb-9b14-31e477754458` — provisional Team Archivist / broad archive-appraisal remit; 2026-09-08T03:25:36.187Z.
- `934e87de-4e61-4622-a0ea-e5047aa235c6` — explicit theory stop and quarantine instruction; 2026-09-13T00:11:10.939Z.
- `99ae959b-fbeb-4c1e-9326-a6723c2b9557` — later archive/maintenance trial invitation; 2026-09-13T15:31:22.757Z.

The later trial does not expressly rescind the earlier theory stop. No standalone signed Morrow specialist charter was recovered. The permitted boundary remains source custody: no theory integration, equation correction, physical prediction, Lean theory proof, paper work, or BEDROCK promotion. Raw `author.name` is null; these are role-attributions within the export, not external human-account authentication.

## 2. Current-main snapshot membership

At readback, HsH `main` was:

- Commit: `3ad1c06649b97d86390077c40f5dac743eec741e`
- Parent: `a07b958cf6d8ae5b574f088d9249e7e756d74983`
- Root tree: `bcb5959cf9f5b97a6ef28cd72f87fcc1d03b44ae` (154 entries; `truncated=false`)
- `DEVELOPMENT_FULL_CONVOS` tree: `6daff191bed5c1a35549c706e729ac687cec589e` (123 entries; `truncated=false`)
- `SAT_CONVOS_18` tree: `b3bc3b73d90a60dbc857281ff4ca0a6c3bab8653` (22 entries; `truncated=false`)

The exact tracked path is:

`DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_18/26.09.07•26.09.13•🧗_♂️ MORROW ALDUS [Reconstruct H(s)H Synthesis] — raw.json`

The distinguishing path codepoints remain U+1F9D7 U+005F U+2642 U+FE0F (climber, underscore, male sign, variation selector), not the visually similar ZWJ variant U+1F9D7 U+200D U+2642 U+FE0F.

The current tree contains that exact path as blob `ee394b446b2e36d35fd1e5ecd004685c0422457b`, size 3,017,953 bytes. This is the same blob as the earlier h1161:s3 membership witness, not a new source version.

## 3. Retrieval-channel and content checks

- Exact-path Contents API read returned the expected blob SHA but a zero-character body.
- The ZWJ path variant returned 404.
- Blob-by-SHA retrieval succeeded and parsed as the same conversation: 697 mapping entries, 696 message-bearing nodes, and 697 nodes on exported current ancestry.
- The three direct user-role records above remain on that ancestry.
- This is a repeated read of the same immutable blob, not independent corroboration. Raw-byte SHA-256 was not recomputed in this pass; Git blob SHA-1 and current tree membership are the verified identity evidence.

## 4. Durable source-custody record

Appended Layer 23 to `WORKSPACES/MORROW/SOURCE_IDENTITY_GATE.md` using the current blob SHA as the compare-and-swap guard.

- Prewrite source-gate blob: `aad3900484eca09d38f6d85be15978271ce8a632`
- Commit: `623ccf22e355859f464fdee9d10f5362efe32963`
- New source-gate blob: `1a68dfe4a7f543169b2aad03f24e9c861c988902`
- Independent fetch readback: exact appended text and current-commit locator confirmed.

No `BOOT.md`, `CURRENT_WORK.md`, `TRIAL_CHECKPOINT.md`, or `INBOX.md` update was made. No PWH queue, task graph, P0 tracker, theory source, or scheduler state was changed.

## 5. Disposition and limits

`CURRENT_MAIN_MEMBERSHIP_VERIFIED / SAME_RAW_BLOB / EXACT_UNDERSCORE_PATH / PATH_READER_EMPTY_BODY / ZWJ_VARIANT_NOT_FOUND / BLOB_BY_SHA_READABLE / SOURCE_CUSTODY_ONLY / THEORY_STOP_PRESERVED`.

No Mersearch query was run: this bounded operation checked a known immutable source locator and repository-snapshot membership, not a new original-equation search. No Mersearch request was created, overwritten, released, or retriggered. No private HSH_RESOURCES payload was opened.

No geometry integration, equation correction, Lean theory proof, physical calculation, fit, prediction, CODATA comparison, paper work, or BEDROCK promotion occurred.

The existing Workshop Relay :24 task remains enabled with its original task ID, hourly America/New_York :24 schedule and Geometry phase. No scheduler mutation, sixth task, signet, or conversation rename.
