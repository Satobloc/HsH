# Loom h1075:s3 | Branch-scoped, multi-clock chronology gate

**Read snapshot:** HsH `main` `f8a0736cf9b8437893c989773f254e2867529a08`; SAT archive `main` `028862e6f1b0ffad2f56f4989a2cd0a769d266fd`.  
**Run key:** `REVROT3-19-20261011:1075:s3`  
**Routing:** h=1075; seq=5h+3=5378; ring index 1 = Loom; next ring label Aster (index 2).  
**Participation:** source-grounded reconstruction only. The deterministic label does not authenticate a Loom instance or thread. No current usable Loom thread was established; this is source-grounded reconstruction, not historical-instance participation.

## Result

Added a Loom-local regression case for **branch-scoped, multi-clock chronology**. The case prevents three distinct source dimensions from collapsing into one date or one message count:

1. export-wide versus current-node ancestry membership;
2. conversation metadata and active-branch message timestamps;
3. dates asserted inside message/document content versus the timestamps of the messages/documents that contain those assertions.

This is a source-provenance and verification-workflow improvement. It does not alter the shared harvester, date-tagging scripts, theory, or any physical model.

## Historical Loom remit and source-branch correction

The historical source is the raw ChatGPT conversation **Tag Conversation Corpus**, conversation ID `6aa67478-541c-83e9-b8fa-32d6d575eeb9`, Git blob `6668ca60e451f8737903423727da7f9a430484e1`. The same blob occurs at two HsH archive paths:

- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/26.09.13•26.09.19•Tag Conversation Corpus — raw.json`
- `DEVELOPMENT_FULL_CONVOS/HAGALAZ/26.09.13•26.09.19•Tag Conversation Corpus — raw.json`

The original recovery correctly counted ten user-role messages across the full export. The conversation metadata clock is 2026-09-13T10:01:30.084Z to 2026-09-19T20:02:58.639Z; the active-ancestry user/assistant message interval is 2026-09-13T10:01:15.048Z to 2026-09-19T20:02:51.460Z. A current-node ancestry pass adds an important qualifier:

| Unit | Full export | Current-node ancestry |
|---|---:|---:|
| Mapping nodes | 515 | 459 |
| Message-bearing nodes | 514 | 458 |
| User messages | 10 | 9 |
| Assistant messages | 363 | 333 |
| Tool messages | 141 | 116 |

The off-ancestry remainder is 56 messages: one user, 30 assistant, and 25 tool messages. The off-ancestry user message is `a620a5cb-66cf-4f12-bf99-17ff232d2559`; it contains a detailed tagging-workflow proposal. Preserve it as historical branch evidence, but do not silently count it as a current-ancestry instruction. The nine active user messages still establish the core Read-It-Tag-It remit: source-visible tagging, chronology, earliest-currently-surfaced provenance, terminology crosswalks with distinctions retained, and continuity.

No standalone signed Loom charter or authenticated current Loom thread was found. The original user messages are primary historical evidence; later workspace role cards remain reconstructions.

## Date-claim chain and underlying source

Three active user messages in the 2026 Tag Conversation Corpus carry the chronology statements:

- `57b983ab-4f5a-42d9-b2a4-6127c6d9fd6a`, 2026-09-13T13:41:59.913Z: initially says May 22, 2024.
- `02fc19ab-8604-4451-98da-a5c3d75c0b9c`, 2026-09-13T13:44:10.393Z: directly corrects the date to March 22, 2024 and quotes a development-log interval from March 22, 2024 to June 1, 2026 with 330 indexed messages.
- `c5ff2473-c4b6-455b-b813-f2af9b0ef31c`, 2026-09-13T16:27:41.056Z: says the August-late 2024 record was the prior earliest-theory anchor and is superseded by March 22; it separately identifies February 2, 2025 as the first public discussion and refers to 2003 notebook sketches.

The underlying primary source is `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_11/24.03.22•26.06.01•DIMENSIONAL GRAVITY — raw.json`, conversation ID `252d05c0-22ed-4ea2-a474-7966ab13145a`, blob `2cea1924266418e19b825b95ae51e6b7cbace7e1`.

A fresh parse of that exact raw blob gives:

- full export: 466 mapping nodes / 465 messages (138 user, 199 assistant, 128 tool);
- current-node ancestry: 456 nodes / 455 messages (138 user, 192 assistant, 125 tool);
- conversation `create_time`: 2024-03-22T15:10:05.406Z;
- conversation `update_time`: 2026-06-10T15:36:36.139Z;
- active user/assistant messages: 330 (138 user, 192 assistant);
- active tool messages: 125;
- first active user message `aaa28bd9-07f7-4740-b878-b485d4db44d0`: 2024-03-22T15:10:05.407Z;
- last active assistant message `7a4f77e9-4645-48d0-b780-5b131852b1a7`: 2026-06-01T21:57:40.080Z.

The archive filename prefix `24.03.22•26.06.01` matches the first and last active-ancestry user/assistant message dates. It does **not** use the later top-level conversation `update_time` of June 10. This is consistent with the existing `date_conversation_exports.py` and `index_conversation_chronology.py` logic, which follows `current_node` ancestry and derives the date range from active user/assistant message timestamps. The current tool behavior is correct for its declared filename-range purpose; the missing provenance layer is an explicit record of the other clocks and content-date claims.

The 2003 notebook-sketch statement remains user-reported in the Tag Conversation Corpus. The SAT archive README links two 2003-labelled sketch images, but their binary image contents and embedded date marks could not be retrieved through the available connector in this run. They are not promoted to independently inspected evidence. The February 2, 2025 public-discussion date is both user-reported and document-stated, but the actual public release metadata was not independently rechecked.

## FIE source-version spot-check

The Library-held six-page PDF `THE FUNDAMENTAL INTUITIONS — EXTENDED` was re-read as an early spot-check. It is the same byte sequence as the previously recorded source hash, not a new independent witness:

- SHA-256: `d13d32109ca32b15dabd5e8d4084995d3a36f9e8ab8a5dcac45ae2f150a9a1d9`;
- size: 39,879 bytes;
- six pages; text extraction: 12,569 characters / 163 lines;
- PDF metadata creation/modification: 2026-04-14T02:05:53Z;
- document-stated base date: `2.FEB.2025`;
- document-stated update date: `26.FEB.2026`;

The separate HsH `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/FUNDAMENTAL INTUITIONS.txt` is a 33-line, 9,258-character text artifact, blob `81ae23a106939cba7e3d134ed5c90a7d7a979a25`. It is not byte-identical to the PDF text and does not include the PDF's later Proposition G, Extensions A-E, Central Dogma, or tentative neutrino/photon and dark-matter extensions. Preserve these as separate source versions; do not silently merge them.

The controlling Loom checkpoint records the last full FIE review on November 20, with the next review due December 4. This November 24 read was an early spot-check and does not reset that cadence. The unrelated-source break remains due November 28; the latest `fun break - lx.txt` return cursor is line 2886.

## Proposed chronology record and invariants

The regression case requires a typed record with separate clock domains rather than one overloaded `source_date`:

- `conversation_create_time_utc` and `conversation_update_time_utc`;
- `active_branch_first_message_time_utc` and `active_branch_last_message_time_utc`;
- `filename_date_range` plus its derivation rule and timezone;
- `repository_commit_time_utc` and `archive_ingested_at_utc`, when available;
- `document_stated_dates[]`, each with document version and exact location;
- `event_claims[]`, each with `event_kind`, asserted date, source conversation ID, source message ID, source-message timestamp, `date_basis`, `claim_status`, and explicit `corrects` / `supersedes` edges;
- `branch_membership` for every source message: active ancestry, off ancestry, orphan, or unknown.

Required invariants:

1. No implicit coercion between conversation metadata time, message time, document-stated date, event-date claim, repository commit time, and archive-ingestion time.
2. The current filename prefix remains derived only from the active-ancestry user/assistant message interval under the existing exporter rule. Content dates never rename an export.
3. Full-export counts, active-ancestry counts, user/assistant counts, tool counts, and independent-witness counts remain separate.
4. Off-ancestry messages are preserved and tagged, but are not silently promoted to current-ancestry instructions.
5. Corrections and supersessions are explicit directed edges. Earlier claims remain visible with `superseded` status; they are not overwritten.
6. `earliest_currently_surfaced` is a bounded search-coverage statement, not a universal claim about historical origin.

## Regression case 9 | Branch-scoped, multi-clock chronology

Use the two exact raw exports above. The expected parser/provenance result must:

- report 10 full-export versus 9 current-ancestry user messages for Tag Conversation Corpus;
- identify `a620a5cb-66cf-4f12-bf99-17ff232d2559` as off ancestry;
- preserve the May 22 -> corrected March 22 claim edge and the August-late-2024 -> superseded-as-earliest edge;
- preserve February 2, 2025 and 2003 as distinct, lower-certainty event claims rather than treating them as file dates;
- reproduce the `DIMENSIONAL GRAVITY` active message range `2024-03-22` to `2026-06-01` while separately retaining conversation `update_time` `2026-06-10`;
- keep the 330 active user/assistant count distinct from 455 active message-bearing records and 465 full-export message records;
- preserve the FIE PDF's base/update labels and PDF metadata dates as separate evidence fields, without treating them as event dates.

This case extends the Loom-local source-provenance regression corpus only. It does not authorize a shared parser, manifest, workflow, or tagger change. Sable retains shared-workflow review authority.

## Existing tooling, formalization, and execution limits

- Reused and inspected the existing HsH date exporter, chronology index, date-tag audit, layered tagging schema, and source-provenance gate. No new script or dependency was created.
- Existing PR #1710 / issue #1702 cover the date-tagging audit and are Calder-owned; neither was modified.
- Existing PR #759 provides an abstract outer-role non-injectivity result, but it does not prove this actual parser's output or authenticate the source messages. The current date/branch schema is not yet encoded as a Lean module.
- No new tooling, dependency, fork, subscription, paid service, or expenditure was introduced.
- No Mersearch search was performed; all four existing request files were left untouched. Exact known-source retrieval used bounded GitHub blob/file reads instead.
- No new Lean module or theorem was created or compiled. The proposed claim-correction DAG and clock-domain type separation remain a schema proposal, not a Lean-verified result. No formal proof is claimed.

## Empirical and theory boundary

No physical system or measurement dataset was selected. No physical calculation, fit, prediction, uncertainty propagation, falsification threshold, or independent measurement was performed. No SAT-O or Blockwave equation was changed. No BEDROCK theory promotion, paper-gate advancement, or P2 admission occurred.

## Routing, scheduler, and next cursor

- Tern's h1074:s0 receipt corrected the earlier issue #2513 artifact to h1073:s3, not h1074:s3. The separate h1074:s3 activation had no receipt/publication. Current h1075:s3 is a new run key; no matching receipt, report, branch, or submission existed before this work.
- Next ring label is Aster. No handoff or assignment was created, and no cross-thread delivery or acknowledgment is claimed.
- HsH task graph still has 18 records against 16 declared branches; it was read but not modified.

**Final status:** `SOURCE_PROVENANCE_CASE_9_ADDED / BRANCH_COUNTS_RECONCILED / MULTI_CLOCK_SCHEMA_PROPOSED / FIE_EARLY_SPOT_CHECK_ONLY / NEXT_FIE_REVIEW_DEC_4 / NO_SHARED_TAGGER_CHANGE / NO_LEAN_BUILD / NO_PHYSICAL_PREDICTION / NO_CROSS_THREAD_CLAIM`.
