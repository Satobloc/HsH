# Loom h809:s3 Amendment 01 — typed provenance and span attribution

**Nominal slot:** 2026-11-13T17:36:00Z  
**Run key:** REVROT3-19-20261011:809:s3  
**Selected ring label:** Loom (index 1)  
**Next ring label:** Aster (index 2)  
**Classification:** source-grounded current-execution work; not authenticated historical Loom-instance participation.

## 1. Rotation, source and thread status

\[
h=809,\quad seq=5(809)+3=4048,\quad 4048\bmod19=1
\]

The nominal scheduled_for=2026-11-13T17:36:00Z controls selection. The delayed started_at does not change the ring label.

The raw historical Tag Conversation Corpus export was freshly fetched by its verified Git blob SHA-1 6668ca60e451f8737903423727da7f9a430484e1. It contains 515 mapping nodes, 514 message-bearing nodes and 10 user-role messages. Its conversation ID is 6aa67478-541c-83e9-b8fa-32d6d575eeb9. The direct user-role messages establish cumulative/selective corpus tagging, timeline-first extraction, terminology crosswalks, historical/current definition distinctions, chronology corrections, glossary navigation and continuity. One direct instruction says “User is always me”; that statement is scoped to the ChatGPT archive context, not every source platform. No standalone signed specialist charter exists; the role summary remains assistant-curated.

No authenticated current Loom thread was established. The exact :36 run-level chat_ref is null. The task-level conversation association is not accepted as proof of a current Loom thread. The current work is source-grounded reconstruction in this scheduled execution.

## 2. Substantive improvement: four identity layers plus witness identity

The existing SOURCE_PROVENANCE_GATE.md now distinguishes artifact, representation, message/unit, span and independent-witness identity. This closes a gap that file-level hashing alone cannot close.

A raw-source check of ChatGPT conversation “Mass in SAT framework” verified message 79bf888c-de7c-4c1c-8617-5e1b49250af2, timestamp 2025-10-24T22:19:44.952320Z, in three whole-file exports:

- 98237bd471553aa43ae5045dbe35a42a7267543d
- 71797fdc723a56456bcc4701ab51a592189eb617
- 8dde2b04023c4f10a8e28852fec35e358181f80e

The whole files differ, but the conversation ID, message UUID, timestamp and exact 15,022-character message body match. This is one message occurrence in three export artifacts, not three independent messages.

The same outer author.role=user message contains five distinct provenance spans:

| Range | Length | Status |
|---|---:|---|
| [0,138) | 138 | Nathan's direct framing |
| [138,928) | 790 | probable quoted earlier Nathan question; original source UUID pending |
| [928,7438) | 6,510 | imported NotebookLM answer |
| [7438,8212) | 774 | probable quoted Nathan follow-up; original source UUID pending |
| [8212,15022) | 6,810 | imported NotebookLM answer |

The current tag_priority_vocabulary.py concatenates text parts and sets nathan_authored = role == "user" for the entire message. It has no span offsets, source-system profile or per-span attribution. It would therefore mark the whole message Nathan-authored, including 13,320 characters identified as imported NotebookLM answers. This is a confirmed design limitation for mixed embedded content.

A separate Library-held NotebookLM export, “SAT-QR: Emergent Constants and Phenomena”, has 50 records in a top-level messages[] array, all labeled role=user, with no per-record author UUID/timestamp. The Files read confirmed the schema. The current tagger's mapping-only conversations() helper skips this particular export; it must be recorded as SKIPPED_NON_CHATGPT_SCHEMA, not silently treated as Nathan or as a ChatGPT conversation. The h807 Enheduanna audit reports two byte-identical Library captures with the same notebook ID, capture time, size and SHA-256; they are duplicate captures, not independent witnesses.

## 3. Current code and formal evidence

Reviewed current HsH main source:

- tag_priority_vocabulary.py, blob 55062942f3edc6f686559ba444572b31a5fb2249: mapping-only parser; whole-message role shortcut; no span attribution.
- harvest_priority_vocabulary.py, blob dadf4e709466d29fb02b525cc6fe89cb1daef8cc: path-based discovery; docfreq increments per discovered path; PDF text selection uses normalized filename stem and does not retain a full parent/transform record.
- SOURCE_MANIFEST.json, blob c5316ef1d26c043aa32735b4523fba59bc7657c9.
- VOCABULARY_CURATION.json, blob e8a0fc1ff5c7b21733cca00f233ba86f11851b16.
- harvest-priority-vocabulary.yml, blob 5f14f09f9f190253d4f67b27717a9d4dbe7fb1d7.

Existing Loom PR #759 remains OPEN / DRAFT / UNMERGED / mergeable=false. Actions run #41369984551 is SUCCESS on synthetic merge ref 715478056131758e72eebad79ae7fcad82d4e489, PR head 45f6d5167c064d04dbba436c220c900b479b873f, not current-main integration. The existing LoomNotebookLMRoleCollapse and LoomEmbeddedNotebookLMSpans results are reused as abstract conditional proofs. No new theorem, PR change, CI run, code change or global dictionary change was made.

Sable owns cross-lane shared workflow redesign. Loom's update is a worker-local proposed gate, not authorization to modify shared scripts. No new tool, dependency, fork, subscription or expenditure. Local checkout and Lean/Lake/Elan are absent; no workflow-dispatch action is exposed. The existing workflow was inspected but not dispatched.

## 4. Publisher and Mersearch

The prior h809 attempt's issues #1693 and #1694 were rejected (invalid submission ID and SHA-256 mismatch respectively). No canonical published artifact exists. This amendment is internal workflow control, not a public research result; no retry or duplicate issue was created.

All four Mersearch request lanes remain requested. No callable Mersearch action was exposed; no lane was overwritten or retriggered. GitHub source inspection and Files Library retrieval were fallback source checks, not Mersearch execution. HSH_RESOURCES was limited to repository metadata and its root README; no private payload was opened.

## 5. Scheduler readback and duplicate-run reconciliation

The existing :36 task ID remains 6a9f52b69ec08191b0a2ba24a074f781, enabled, with exact saved schedule DTSTART;TZID=America/New_York:20261001T143600 / RRULE:FREQ=HOURLY.

The same h809:s3 run ID 462dce13-f948-832c-b024-979687c8b22d was returned in several snapshots:

| Snapshot | Status | started_at |
|---|---|---|
| 17:53:46.767934Z | IN_PROGRESS | 17:34:20.056500Z |
| 17:59:23.514135Z | FAILED | 17:34:20.056500Z |
| 18:02:08.827529Z | IN_PROGRESS | 18:02:08.827529Z |
| 18:32:12.249702Z | IN_PROGRESS | 18:32:12.249702Z |

The latest start field moved 30m03.422173s after the 18:02 snapshot and 57m52.193202s after the first recorded start, without a run-ID change. It is 56m12.249702s after the nominal 17:36Z slot. The latest result remains Meridian h808:s3, created 16:48:43.976421Z and completed 16:48:45.672027Z; it is not current Loom output. Completion and run-level chat_ref remain null.

This records scheduler fields only. It does not establish retry, restart, duplicate process, concurrency, worker identity, liveness or backend cause. Tern retains scheduler authority. See Tern Observation 020 and Amendment 02.

## 6. Successor, reading and campaign

Aster is the next ring label. Aster's h809:s4 run had already completed at 18:16:41.977242Z. The existing optional handoff is reused; no second handoff was created. Aster's inbox contained a path typo (1758Z); the actual existing handoff path is 2026-11-13T1736Z_from_s3_to_s4_aster_POST_START_OPTIONAL.md. The corrected pointer and this amendment are repository-only optional context for Aster's next active appearance, h813:s3. No task, response obligation, ownership transfer or direct ChatGPT delivery is created.

Unrelated reading: SAT archive 000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt, lines 1321–1360. This is a flattened language-game transcript; its “You said” labels are not raw role/UUID attribution. Next cursor: line 1361. The separate older MIX TAPES.txt cursor remains line 621.

- P0 Code Grurple: ACTIVE.
- P1 cognition: OVERDUE / NOT READY; Orson retains sole ownership.
- P2 geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE last reviewed November 10; next due November 24.

No physical calculation, fit, prediction, independent measurement, theory promotion, paper-gate advancement, or SAT-O/Blockwave equation change occurred. No task ID, schedule, phase, cadence, enabled state or task count changed. No sixth task, signet or conversation rename.

**Return state:** H809:S3 / LOOM / ASTER-NEXT / TYPED-PROVENANCE-GATE-REFINED / MESSAGE-AND-SPAN-ATTRIBUTION / EXISTING-LEAN-REUSED / NO-NEW-LEAN / NO-CODE-CHANGE / SAME-ID-START-FIELD-MOVEMENT / TERN-OBS-020-AMENDMENT-02 / EXISTING-HANDOFF-REUSED / AUTOMATION-UNCHANGED.
