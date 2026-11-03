# Morrow | Mersearch source coverage and snapshot-dedup audit | 2026-11-03T20:36Z

**Disposition:** `ARCHIVE_ONLY / RESULTS_PRESENT / COMPACT_RECEIPT_VERIFIED / FULL_RESULTS_WITHHELD / PUBLICATION_PENDING`  
**Run key:** `REVROT3-19-20261011:572:s3`  
**Selected label:** Morrow, index 13. **Next:** Kestrel, index 14.  
**Scope:** source custody, transcript coverage, snapshot identity, and handoff hygiene only. This is not theory integration or a physical result.

## 1. Morrow authority and boundary

The historical source is the 697-node raw `Morrow Reconstruct` snapshot, conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`, blob `ee394b446b2e36d35fd1e5ecd004685c0422457b`.

- Nathan Direct user message `402ade01-7116-4efb-9b14-31e477754458`, 2026-09-08T03:25:36.187Z, establishes the flexible Team Archivist remit and GitKeeper coordination.
- Nathan Direct user message `934e87de-4e61-4622-a0ea-e5047aa235c6`, 2026-09-13T00:11:10.939Z, explicitly stops theory work and orders quarantine of Morrow's theory artifacts.
- Trial-workflow message `99ae959b-fbeb-4c1e-9326-a6723c2b9557`, 2026-09-13T15:31:22.757Z, permits bounded archive maintenance, provenance and source comparison; it does not lift the earlier theory stop.

The standing archive policy maps raw `author.role=user` to Nathan Direct. Do not infer a different speaker from formatting or style. For a user-supplied embedded document, preserve the outer Nathan Direct message while separately recording any unknown byline or creation history of the embedded artifact.

No authenticated current Morrow ChatGPT thread was established. This is source-grounded work in the present scheduled execution, not a claim of literal historical-instance continuity.

## 2. Mersearch execution and status correction

The request `morrow-finite-slab-originals-20261103-0524` now has a request-scoped manifest and compact receipt:

- Generated: 2026-11-03T09:38:44.472318Z.
- Tool: `Mercer_Searcher_1.0`, stable ref `mersearch-stable-1.0`, commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`.
- Coverage: 16,884 files, 21,032,761 records, 68 hits, 21 distinct source paths.
- Compact root counts: `archive=15`, `hsh-main=53`. The receipt exposes no Resources-root count; no zero-count claim is made.
- Source commits: SAT archive `1d9b39babb82915b05dda47ebe5fd034108ab813`; HsH `689a71897d7c39cf1942f2c2316bf0906dbe3007`; HSH_RESOURCES `029e0119d454fcfa768d82ce31cf4901f26d0da9`.
- Manifest blob: `9ebe3f89525e66f529d0b87a8734bb359e3a10e8`. Compact receipt blob: `bfb41f2c4b10594fae4e8ca9b0cfabf786f17344`.
- Full-result output SHA-256: `e243a120c09fd0ee77ed7882d99c9cf0c60b11dcb3dc7af474f993a4503917d0`. Full `SEARCH_RESULTS.json/.md` are withheld; only the bounded receipt is published.

The run used a runtime-only hotfix because the stable script references undefined `TOOL_NAME/TOOL_VERSION`: stable script SHA-256 `5fb48b8a5f19422313246445d0c663a2a39064934706082dd9100d3368b4b8c7`; runtime script SHA-256 `be9efdb308268c8a941fc6385b72d64517dd62caacb0dbfdabd6878ebfb3e4b4`. The stable branch itself was not changed.

**Status correction:** the earlier `SUBMITTED_NOT_VERIFIED` state in the h557 receipt and Kestrel's 05:24 inbox entry is superseded by `RESULTS_PRESENT / COMPACT_RECEIPT_VERIFIED / FULL_RESULTS_WITHHELD`. The shared lane-3 request file now belongs to Orson's later request `orson-cognition-origin-bank-20261103-1745`; it was not modified. Do not resubmit Morrow's request or overwrite Orson's lane.

## 3. Raw source crosswalk

The 996-node raw conversation `SAT theory clarification`, conversation ID `69378c7f-6320-8325-9e10-83e42fe1433c`, is blob `507a7000082415373ee98dbc95f18a991dff3c5a`. The HsH path `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_5/25.12.08•26.06.01•SAT theory clarification — raw.json` and SAT archive root copy `SAT theory clarification — raw.json` have the same blob SHA. They are one raw conversation mirrored in two repositories, not two independent witnesses.

Key Nathan Direct user-role nodes in that conversation:

| Message UUID | UTC | Source classification | Transcript location |
|---|---|---|---|
| `d13c1409-87c4-4fc2-a0aa-7c670d95f7be` | 2025-12-09 03:33:24.524 | Time-slice-as-field and energy-exchange proposal | `SAT_DEC2025.txt`, line 34 |
| `05c717ab-5f2f-4fc3-bfa9-437b28f14a91` | 2025-12-09 03:37:21.551 | Finite-thickness slab swept by a propagating field, coupled to particle-trajectory change | `SAT_DEC2025.txt`, line 35; `NEOSAT 2025.txt`, line 54 |
| `75d25e2b-923b-4db2-b56f-202895213fc9` | 2025-12-09 04:16:50.676 | Intersection angle proposed as the natural time-trajectory interaction descriptor | `SAT_DEC2025.txt`, line 54 |
| `07e8d0d0-5790-4f61-98b5-6af71acc7d8c` | 2025-12-09 04:35:56.748 | Allocation between time-field distortion and particle wave-equation evolution, including a local/global convertibility claim | Absent from both text witnesses |
| `39c6f4b3-9a5a-4788-805e-cf4444d69c7c` | 2025-12-09 07:41:47.277 | Angle/curvature and gravity discussion | `SAT_DEC2025.txt`, line 169 |

Other raw user-role hits in the compact receipt identify additional Nathan Direct source turns: `59eb2972-f027-4a64-ab54-faf90a7ff01f` (2025-10-19, Particle geometry analysis; a user-supplied SAT.O10 module whose embedded byline/history is not separately established); `7c1a1cda-d2c9-4b69-90c2-22d6bbd22677` (2025-12-22, Conversation topics suggestions); `22b411ad-43f8-425a-8e97-095eff720cd9` (2025-12-22, Theory discussion response); `9fa0fe93-4307-48a9-825f-6e1d8a148922` (2026-05-30, a research request about worldline intersection angle and energy exchange); `b8e27cef-650b-43bc-9baf-2ef5edd5b214` (2026-06-02, GitHub Archive Review); and `59a38049-e410-455d-afe9-87fcbc6f5264` (2026-09-06, Succinctness And Math Check, explicitly provisional).

These are source statements, proposals, or research requests. Their recovery does not establish mathematical proof, physical truth, a calibrated prediction, or independent measurement.

## 4. Transcript coverage audit

A bounded script scanned the 996-node SAT theory clarification conversation for user-role turns matching the relevant time-thickness/slab/trajectory/energy-exchange/time-field term family:

- 30 matching user-role nodes.
- 25 full message bodies occur as exact substrings in `SAT_DEC2025.txt` (329 lines; blob `af62e4b31216703687fd39e4f1182a55796d1c63`).
- 12 occur as exact full-body substrings in `NEOSAT 2025.txt` (1,135 lines; blob `e985d599fffdff05fc859be98c6cdb827ed211a0`).
- The two transcript files are not byte-identical.

Five user-role nodes in this bounded scan are absent from both text witnesses:

| Message UUID | UTC |
|---|---|
| `8a8bc474-c62b-4f66-9411-79b586b7a822` | 2025-12-09 04:06:42.059 |
| `9561f902-e3cb-43d5-93e1-cdffab706a1f` | 2025-12-09 04:18:16.642 |
| `07e8d0d0-5790-4f61-98b5-6af71acc7d8c` | 2025-12-09 04:35:56.748 |
| `4b9e0d38-945f-4bae-b1a9-db7e544c1fa3` | 2025-12-22 00:31:52.879 |
| `d2b3eb81-916c-4e7c-aa7b-93a69f58074a` | 2025-12-24 01:16:58.806 |

This is a bounded one-conversation comparison, not a corpus-wide transcript-completeness claim. The missing 04:35 turn is material to the historical record because it is the local/global allocation statement already used in Kestrel's 17:00 geometry report.

## 5. Path counts are not independent-source counts

The compact receipt's 21 distinct paths are path-level counts. The selected source paths already contain:

- Exact same-blob mirrors: SAT theory clarification (`507a7000...`) across HsH/SAT archive; SAT PRE-H(s)H TIGHTENING (`054a76d76cd8a44b18fa4c545ece4e0e3f9f4e8e`) across HsH/SAT archive; Theory discussion response (`9da248def68201ca24446c7d2d742d832766440c`) across two HsH paths.
- Versioned snapshot families with the same conversation/message identity and same target message body but different raw-file blobs: GitHub Archive Review (two snapshots, 1,355 and 1,782 nodes) and Succinctness And Math Check (four snapshots, 657, 1,157, 2,394 and 667 nodes).

Thus the 21 path count is not 21 independent conversations or independent source witnesses. At minimum, three exact duplicate pairs and two versioned snapshot families are present in the selected paths.

**Workflow improvement:** future source receipts should report separate counts for (1) matching paths, (2) unique raw blob SHAs, (3) unique conversation IDs, (4) unique message UUIDs, and (5) transcript/compiled-document hits. Preserve both path lineage and content identity. This is a recommendation from this audit, not a Mersearch code change.

## 6. Remaining source gaps

- HsH and SAT archive copies of `SAT PRE-H(s)H TIGHTENING.txt` are the same 5,169-line blob `054a76d76cd8a44b18fa4c545ece4e0e3f9f4e8e`. The user-like passage at line 1942 remains a transcript witness without a recovered raw message UUID/role locator in this pass. The assistant-authored `XW-012_NAIVE_TIMESHEET_TO_FINITE_SLAB_LINEAGE.md` calls it firsthand, but that note does not itself supply the raw message locator or establish the transcript's absolute composition date. `XW-013_PUBLIC_FINITE_SLAB_CHRONOLOGY_AND_SCALE_CANDIDATE.md` is a secondary chronology note, not the originating conversation.
- SAT archive `H(s)H Dev +/H(s)H MANIFOLDS.txt` is blob `54f2f530697ab6e9c44758ce3406c4144915c73d`, 4,740 lines. The numeric tags visible around line 142 and elsewhere, including `(193,230,232,410,445)`, `(54,849)`, and `(2,90,1133)`, remain unresolved locators. They are not raw message UUIDs and were not mapped here. The document is a compilation, not a raw Nathan message.
- The compact receipt withholds full `SEARCH_RESULTS.json/.md`. I did not inspect all 68 hit records or all 21 paths. No private Resources path or content is reproduced here.

## 7. Tags and disposition

Tags applied in this report: `NATHAN-DIRECT`, `RAW-ROLE-VERIFIED`, `TRANSCRIPT-WITNESS`, `DUPLICATE-BLOB`, `VERSIONED-SNAPSHOT`, `COMPILED-SUMMARY`, `SOURCE-COVERAGE-PARTIAL`, `NUMERIC-LOCATOR-UNRESOLVED`, `MERSEARCH-RESULTS-PRESENT`, `FULL-RESULTS-WITHHELD`, `SUPERSEDES-SUBMITTED-NOT-VERIFIED`.

No SAT-O/Blockwave equation was transcribed, normalized, or corrected. No theory integration, physical calculation, fit, prediction, Lean theorem, paper work, BEDROCK change, or paper-gate advancement occurred. The direct theory stop remains controlling. Training status is not asserted.

The existing publisher remains unready: issue #1313 is open without a confirmation comment or published artifact, and the inspected workflow still has a five-minute job timeout with full checkout. This report is a workspace record only, not a published submission. No new issue, duplicate submission, PR, branch, tool, Mersearch request, or automation was created.

**Next source cursor:** Harold Jacoby, *Practical Talks by an Astronomer*, HSH_RESOURCES historical text, lines 941-980 read during this run; next cursor line 981. FIE last full review 2026-10-27; next 14-day rereview due 2026-11-10. No physical break is claimed.
