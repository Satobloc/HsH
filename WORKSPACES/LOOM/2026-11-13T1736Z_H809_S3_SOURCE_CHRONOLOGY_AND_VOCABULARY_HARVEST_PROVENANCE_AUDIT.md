# Workshop Relay :36 | h809:s3 | Loom

**Disposition: RAW-SOURCE CHRONOLOGY CORRECTED · EXISTING VOCABULARY-HARVEST PIPELINE AUDITED · CONTENT-IDENTITY GATE DEFINED · PUBLIC AMENDMENT SUBMITTED · NO GLOBAL TAGGER OR THEORY CHANGE.**

## 1. Rotation, identity and authority

h=809, slot s3, so seq=5(809)+3=4048; 4048 mod 19 = 1.

- Selected: Loom, ring index 1.
- Next: Aster, ring index 2.
- Run key: REVROT3-19-20261011:809:s3.

The historical Loom conversation was recovered from the exact raw export: conversation 6ab339d2-8fb4-83ea-b728-c8001a034371, Git blob 6668ca60e451f8737903423727da7f9a430484e1, 515 mapping nodes and 10 user-role messages. All direct user-role messages were read. They establish the tagging remit: timeline-first source recovery; selective term tagging; chronology, glossary and SAT↔standard crosswalks; corrections/supersession; frequency-assisted vocabulary harvesting; and definitions that put the current meaning first and history second.

The assistant-maintained Loom role label is not a signed Nathan-authored charter. No authenticated current Loom thread was established. The current :36 automation run has chat_ref=null; the deterministic ring label does not authenticate a conversation.

## 2. New primary-source correction: March 13 vs March 22

### March 13 candidate disconfirmed for the cited source

The SAT archive README attributes “first recorded SAT mentions” to Moral Realism: Two Camps. The recovered raw HsH export is:

- DEVELOPMENT_FULL_CONVOS/24.03.07•24.03.13•Moral Realism_ Two Camps — raw.json
- Conversation ID: b34be3b2-213b-423b-9965-e2b4ba729fd9
- Blob: 477f80bfcd1210ca2cb84f8ac0de969dc3ab5c6c
- 340 mapping nodes; 339 messages, 167 user and 172 assistant; message span 2024-03-07T19:19:53.813Z to 2024-03-14T01:30:44.109Z.

All message content parts were strings; none were missing or non-string. A complete scan of the 339 messages found zero occurrences of SAT as a word, Stringing Along Theory, Stringing-Along, Scalar-Angular, filament, worldline, or timesheet.

This particular conversation cannot support the cited March 13 SAT-mention claim. It is an RMS/moral-realism discussion in the recovered export, not a SAT source on this evidence. This does not prove no other March 13 source exists; no separate primary March 13 SAT source was recovered in this bounded search.

### March 22 raw source verified

The HsH raw export is:

- DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json
- Conversation ID: 252d05c0-22ed-4ea2-a474-7966ab13145a
- Blob: 2cea1924266418e19b825b95ae51e6b7cbace7e1
- 466 mapping nodes; 465 messages; 138 user messages.
- Conversation create_time: 2024-03-22T15:10:05.406Z; first message: 2024-03-22T15:10:05.407Z.

Nathan Direct message aaa257e0-3f99-4796-8d65-f28f0dbd166f at 2024-03-23T03:51:14.058Z (2024-03-22 23:51:14.058 EDT) explicitly adopts “Stringing Along Theory” as the working name. The same raw conversation contains the 4D string/filament and time-surface intersection construction.

This is the earliest currently verified substantive SAT geometric record in this source chain. It does not establish absolute origin or mathematical formalization.

The SAT archive README's March 28 label is a separate date label from the dated compilation/header discussed in issue #1678. Preserve that compilation date as a separate event until its meaning is established; it does not override the raw March 22 conversation timestamps.

### Chronology must remain typed

- c.1991: recollected intuition, not a surviving artifact.
- February–June 2003: reported surviving notebook sketches; image locators exist under 2003 SKETCHES/, but the images were not visually inspected in this run.
- 2024-03-22: raw DIMENSIONAL GRAVITY conversation begins; substantive geometry.
- 2024-03-22 23:51 EDT: working name adopted.
- 2025-02-02: first public discussion/podcast per Nathan Direct and secondary archive timeline; primary podcast metadata not re-verified here.

The earlier Library text rendering of the March 22 conversation remains a separate representation. The fuller HsH raw JSON is now present. No claim of byte identity or identical scope is made without message-ID comparison.

## 3. Substantive workflow improvement: provenance-aware vocabulary harvest

The existing harvest_priority_vocabulary.py, tag_priority_vocabulary.py, SOURCE_MANIFEST.json, VOCABULARY_CURATION.json, and harvest-priority-vocabulary.yml already form the correct toolchain. No new harvester was built.

The source manifest is intentionally broad and path-based. The harvester's source_inventory records repository, path, source class, weight, read method, character count and status, but not content hash, source kind, authorship class, parent-PDF identity or alias groups. It counts discovered paths separately.

Verified hazards:

1. SAT_HISTORY_ROUNDUP.txt, SATOBLOC MISC/SAT_HISTORY_ROUNDUP.txt, and [[SAT PARADIGM]]/SAT TIMELINE [old].txt are one byte-identical 2,253-line body, blob 187d307853c070bb767ff034a89c7dd6fcc96df5. They are aliases, not independent witnesses.
2. SAT TIMELINE + GITHUB/SAT - Timelines .txt and 2026/Paradigm/SAT PARADIGM TIMELINE/SAT TIMELINE 2.txt share blob ac8e8e70bfec7b6b270834c0358acd6df9c972cc. Their content is a NotebookLM critique conversation, not a historical timeline, despite the path.
3. SATOBLOC MISC/SAT_HISTORY_AND_VERSIONING.txt, blob 060b5432728e1f706ed2626686e2a4c7580a5331, is explicitly a NotebookLM-generated versioning analysis, not a primary history.
4. SAT_HISTORY_ROUNDUP.txt matches both history and roundup; the max-weight path classifier can assign timeline_history 5.0 rather than summary_synthesis 3.0.
5. PDF and extracted-text paths are both eligible. The PDF reader can consume the _AUTO_EXTRACTED_TEXT derivative while the .txt is also independently discovered, permitting double counting.

The result is a provenance/weighting hazard, not a reason to delete or hide source files. A reliable frequency sort needs content-identity deduplication, alias preservation, content-type adjudication, PDF-parent links and event-date typing first. I did not publish a frequency ranking because the current path-level candidate set would inflate duplicate and misclassified material.

### Manual vs automatic tagging

The conversation-level AUTOTAG_SUMMARY is a different system: 858 exports, 160,946 message records, 45,342 user messages, 45,280 WINNOW (99.86%), 2 parse errors and 328 structural-index-gap candidates. This is broad conversation triage, not proof that every source-document term has been harvested.

The priority vocabulary harvester is implemented, but the expected outputs were absent at the observed main head: source_inventory.tsv, priority_vocabulary_candidates.tsv, manual_review.tsv, priority_vocabulary_curated.json, priority_vocabulary_all.json. The workflow has workflow_dispatch and push triggers; no workflow-dispatch action is exposed in this runtime. No dummy push, direct output write or bypass was attempted.

Manual tagging remains necessary for authorship, source ancestry, first-seen chronology, version era, definitions, synonym/near-synonym/analogy distinctions, correction and supersession. Automatic tags are a discovery layer, not source-critical attribution. No global tag dictionary was changed.

## 4. Durable process improvement

Created WORKSPACES/LOOM/SOURCE_PROVENANCE_GATE.md, an additive pre-harvest contract requiring:

- Git blob identity plus content hash and path aliases;
- source kind and authorship basis;
- separate source date, event date, event kind and date basis;
- parent-source links for extracted text;
- correction/supersession links;
- document frequency over unique source bodies, with weight applied once per body;
- manual candidate acceptance before downstream tagging.

This is a documentation gate for the existing harvester, not a new tool or a change to its global dictionary. The specific duplicate and misclassification examples are regression cases for a future reviewed implementation.

## 5. Public correction submission

Existing issue #1219 and #1678 were read first. A distinct additive amendment was submitted through the existing HSH-PUBLISH-V1 issue publisher:

- Issue #1693: https://github.com/Satobloc/HsH/issues/1693
- Submission ID: loom-march-2024-raw-source-chronology-and-harvest-provenance-20261113t1736z-s3-001
- Content SHA-256: 70474685d3ddf1ce1b0c28bb3a3d10ed62307fb5158357afccac9f6b07ebe6c0
- Status at submission: SUBMITTED_NOT_VERIFIED.

No duplicate issue was created. Publisher completion and canonical artifact readback remain pending; no retry was attempted.

## 6. Controls, maintenance and successor

- HsH pre-write main snapshot: 447177101075cdec9ebf9ebbd3f753944b18ff22; SAT archive main: f6e3c914b3722cdd6b57b0a2f024446bb0247f97. HSH_RESOURCES root README was read only; its private/internal payload was not accessed.
- Current task graph: ACTIVE_SEED, 18 branch entries.
- All four Mersearch lanes remain occupied; lane 1 currently carries Calder's angle-geometry source-fidelity request. Existing Mersearch manifest/receipt for Loom's historical charter was reused; no new request or overwrite.
- P0 Code Grurple ACTIVE; P1 cognition OVERDUE / NOT READY, Orson-owned; P2 geometry HOLD; P3 full theory INCOMPLETE.
- FIE last rereview November 10; next November 24.
- Unrelated reading: fun break - lx.txt, lines 1281–1320. This is a flattened language-game transcript with no raw author-role, message UUID or timestamp. It records a Hmong clue/score dispute, not authenticated biographical or linguistic evidence. Next cursor: line 1321. No physical break is claimed.
- No physical system, dataset, fit, prediction, independent measurement, Lean theorem, SAT-O/Blockwave equation change, paper-gate advancement or theory promotion.

The current :36 task remains enabled and unchanged. Its exact run ID is 462dce13-f948-832c-b024-979687c8b22d, IN_PROGRESS, chat_ref=null; cached result belongs to prior Meridian h808:s3. The :48 Aster task is already IN_PROGRESS under run ID 95089271-2858-8329-a120-a3869bcb43f7, also chat_ref=null; cached result belongs to Mercer h808:s4.

Aster's current remit remains Code Grurple ACTIVE / Paper A review FROZEN / CROSS-READ OPEN. The optional handoff is post-start context only; no task, review, deadline, response obligation, ownership transfer or direct-thread delivery is claimed.
