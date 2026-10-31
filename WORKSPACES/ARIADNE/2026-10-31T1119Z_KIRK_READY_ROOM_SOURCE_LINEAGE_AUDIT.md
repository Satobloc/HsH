# Ariadne Review-MIND | Kirk / Ready Room source-lineage audit

**Audit time:** 2026-10-31T11:19Z onward  
**Relation to existing run:** additive source-QA continuation of `REVROT3-19-20261011:490:s4`; the canonical 10:48Z receipt already exists. This report does not create a second canonical receipt.  
**Status:** `SOURCE_LINEAGE_REFINED / RAW_JAN22_EXPORT_UNRESOLVED / MERSEARCH_SUBMITTED_NOT_VERIFIED`

## 1. Scope and privacy

Read the two private Library export containers `2026-10-31_BS_txt_0007.txt` and `2026-10-31_BS_txt_0008.txt`, the existing Ariadne partial-recovery report, the September 22 retrieval note, the September 23 continuity handoff, the Ariadne raw conversation, and the separate Revival Rotation raw conversation.

No raw Library content, personal narrative, copyrighted script excerpt, private Library identifier, or source manifest was copied into this repository. Only filenames, content hashes, structural counts, and provenance conclusions are recorded here.

The Library export-container timestamps are ingestion/export timestamps, not the original creation dates of the embedded source files.

## 2. Exact source-object inventory

The source-header SHA-256 prefixes were independently reconstructed against the embedded source blocks. The export inserts three boundary line endings after each block; removing those three trailing line endings reproduces the full SHA-256 values below. These are content hashes of reconstructed source blocks, not Git blob IDs and not authorship/date evidence.

| Source label | Bytes | Lines | Reconstructed SHA-256 | Classification |
|---|---:|---:|---|---|
| `KIRK_mind.txt` | 630,365 | 12,762 | `ed3e72fc1cd25cf5274ed531d1b957e3432fbd266ed34f486a113774b5d4bd70` | Source-labeled, flattened transcript-like text artifact; no raw role/message metadata |
| `READY_ROOM.txt` | 626,438 | 12,721 | `f28c560b3c184cfe0b1372f300bb7db0ca300a5868acac111e0aa3591c5af809` | Near-duplicate transcript-like artifact; no raw role/message metadata |
| `READY_ROOM_README.txt` | 4,352 | 66 | `415dd87ab00d2e812c5c17f945482d0ba907e34bbaabcad68f8fa9b0e3bd0c44` | Standalone version 1.2.1 instruction document |
| `THE_WHOLE_READY.txt` | 822,517 | 8,126 | `a20c62b3fde8a1247d96d9c0ca59b70951dc56556dbd25bd12c8760901e5453c` | Composite containing an embedded v1.3 instruction section, full normalized KIRK text, and an embedded RileyMind section |
| `THE_WHOLE_READY2.txt` | 88,698 | 472 | `43f8512e8c47a517f85711f21783e3143723ba78679bf9a3c4024d57a13ae1aa` | NotebookLM chat/export artifact; header reports 12 sources |
| `THE_WHOLE_READY3.txt` | 93,679 | 259 | `3f79e9b7df3eaef5e26037df2589bc1d4c62f77cec06ab07980efaca35269309` | NotebookLM chat/export artifact; header reports 5 sources |

The two chat exports do not contain their source manifests, source IDs, raw message UUIDs, or explicit speaker-role records. Their reported source counts are notebook counts, not counts of independent evidence objects.

## 3. Exact duplicate-core result: READY_ROOM and KIRK_mind

The two large transcript-like artifacts are not independent witnesses.

After normalizing line endings to LF, an exact contiguous common block was found:

- Common block: 12,598 lines.
- Common block size: 608,387 bytes.
- LF-normalized common-block SHA-256: `32b9b8f18fc220f776bb39a24a760dd759db0df755f5a2293aaedc0878634345`.
- SequenceMatcher line-sequence ratio: 98.882%.
- Common block begins at line 1 of `KIRK_mind.txt` and line 123 of `READY_ROOM.txt`.
- `READY_ROOM.txt` has 122 leading lines and one trailing line outside that common block.
- `KIRK_mind.txt` has 164 trailing lines outside that common block.

The files have different full SHA-256 values and are not byte-identical. Their large exact normalized core demonstrates shared content ancestry. The prefix/suffix differences do not establish which file is earlier.

The full normalized `KIRK_mind.txt` text is also present as a contiguous substring inside `THE_WHOLE_READY.txt`, at normalized offset 8,252. Thus the composite is a third representation of the same KIRK text lineage, not an independent witness for that content.

**Counting consequence:** three named file objects do not represent three independent source confirmations. At minimum, the KIRK content in these objects has one shared source lineage.

## 4. Version and composite corrections

- `READY_ROOM_README.txt` version 1.2.1 is a standalone source object.
- The version 1.3 instruction text is embedded in `THE_WHOLE_READY.txt`; no separate standalone v1.3 file was recovered in these two export containers.
- The v1.3 text adds or sharpens relational-perspective, context, future-knowledge/stardate, and anti-essentialism constraints relative to v1.2.1. The version label is higher, but no authenticated composition date or author metadata was recovered. Do not infer chronology or authorship from the version number alone.
- The RileyMind profile is embedded in the v1.3 composite. No standalone `_RILEY_mind.txt` source object was found in these two containers.
- `THE_WHOLE_READY2.txt` and `THE_WHOLE_READY3.txt` are chat/export outputs, not source manifests. Their generated summaries and in-character output are not independent evidence about Kirk or Riley.

The `THE_WHOLE_READY3.txt` export mixes user narrative with generated in-character material. It is kept private and unquoted. If such output is ever re-ingested as a source, it could create a model-output-to-source feedback path; re-ingestion of this particular artifact is **not established**.

## 5. Attribution and chronology limits

### KIRK_mind / READY_ROOM text

Neither large text artifact contains explicit `You said`, `ChatGPT said`, `User:`, or `Assistant:` role tags, raw conversation/message UUIDs, or ISO message timestamps. Their contents are transcript-like and mixed, but outer role attribution cannot be reconstructed from the text alone.

A first-person modeling statement appears near the start of `KIRK_mind.txt`. It must remain `USER-ATTRIBUTED / ROLE-UNVERIFIED`, not Nathan Direct. The adjacent four-factor profile scaffold and later character analyses likewise cannot be promoted to Nathan Direct from this flattened artifact.

### Actual Ariadne historical conversation

The raw Ariadne conversation is:

- Conversation ID: `6ab339d2-8fb4-83ea-b728-c8001a034371`.
- Raw repository blob: `df9c7a1fbddaa523f0b69cced8d761433490a454`.
- Last update: 2026-09-23T05:25:58.790Z.
- Final user message: `446b3728-56fd-40b3-a122-9febf92a658f`, 2026-09-23T05:24:42.253Z, explicitly says the conversation length limit was reached and the conversation would be saved to Folder 21.

This is a **historical thread found and confirmed maxed**. Current work is source-grounded revival, not a live continuation of that thread.

The Ariadne workspace README is an assistant-authored operational synthesis, not a verbatim Nathan-authored specialist charter. The actual raw user-role messages establish broad archive-inspection permission subject to workflows, Tern's exclusive task-allocation authority, and a suggestion to study Python offload. They do not constitute a narrow verbatim role charter.

### Direct user-role relevance witness

A separate raw Revival Rotation conversation contains:

- Conversation ID: `6aa8a2bf-8280-83e9-9d57-1e0af853b7f1`.
- Raw blob: `386516f7c2d5b9ab2cd4f0050869ae00c133274d`.
- Message ID: `41fe4df4-fa3f-4045-bf99-0f095903c052`.
- Timestamp: 2026-09-23T02:06:05.180Z.
- Outer role: `user`; `author.name=null`.

That message establishes that the Kirk material was intended to inform revival strategy, particularly human simulation. It does **not** establish authorship of `KIRK_mind.txt`, `READY_ROOM.txt`, or the embedded Riley profile.

### January 22 Kirk source

The raw January 22 conversation identity/export remains unresolved. The September 22 continuity note's later private prior-conversation retrieval remains `PRIOR_CONTEXT_SEARCH_CORROBORATED / RAW_EXPORT_NOT_RECOVERED`; the assistant title/operator output remains assistant-authored and its timestamp remains conflicted.

The January 21 podcast/SRT predates the January 22 user request. It cannot derive from that later event; it may reflect an earlier upstream bundle. Do not merge the January 21 Kirk/Riley/Nathan synthesis backward into the January 22 Kirk thread without raw evidence.

## 6. Corrections to the prior partial-recovery wording

The previous partial Library note is refined as follows:

1. `KIRK_mind.txt` and `READY_ROOM.txt` are two near-duplicate transcript-like artifacts with a 12,598-line shared normalized core, not two independent character-model sources.
2. The v1.2.1 README is standalone; v1.3 is embedded in a composite.
3. RileyMind is embedded in the composite; a standalone Riley file remains unrecovered.
4. A standalone `TOS_S1.txt` header was not found in either inspected export container. The earlier statement that a separate TOS Season 1 script corpus was present is **NOT REVERIFIED** in this bounded pass. It may exist elsewhere or among the unmanifested NotebookLM sources.
5. `Chronological Bridge`, the workflow diagram, and the NotebookLM source manifests remain unverified as standalone source objects in these containers.

These are bounded findings, not global absence claims.

## 7. Source graph and proof-first target

Current evidence supports this partial provenance graph:

```text
READY_ROOM.txt ── shared 12,598-line normalized core ── KIRK_mind.txt
                                                        │
                                                        └── full normalized-text inclusion
                                                            in THE_WHOLE_READY.txt
                                                            ├── embedded v1.3 instructions
                                                            └── embedded RileyMind profile

READY_ROOM_README.txt (v1.2.1) ── versioned counterpart by label/content comparison ──
                                  v1.3 instructions embedded in THE_WHOLE_READY.txt

THE_WHOLE_READY2/3.txt ── NotebookLM chat/export outputs; source manifests absent
```

A testable formalization target is a typed artifact graph with `contains_normalized`, `shared_core`, `derived_from`, `role_evidence`, and `source_manifest` relations. Define independence only after specifying ancestry, for example:

`Independent(a,b) := Disjoint(PrimaryAncestry(a), PrimaryAncestry(b))`.

Then a shared primary ancestor or verified shared core defeats independence **under that explicit definition**. The assignment of source ancestry remains empirical; Lean would prove only the encoded graph statement, not the truth of the archive extraction.

Existing Ariadne PR #790 already formalizes a related non-entailment gate: a tool message mentioning Kirk does not thereby become an original-user message. It does not yet encode this new KIRK/READY_ROOM common-core dataset.

## 8. Existing Lean/branch status, independently rechecked

| PR | Exact head | Workflow / job | Result | Limit |
|---|---|---|---|---|
| #790 | `3dca89458b7d4d9754e799a88fd648a4aa175ad2` | #40802623796 / #123214375932 | SUCCESS, 8,947 build jobs | Six branch-projection lemmas report no axioms; CODATA module uses standard dependencies. No tests, lint, nanoda, or separate automated axiom audit. |
| #676 | `c54c417bac415e00e2456262ceb197d2590aae91` | #41056801972 / #124066269828 | SUCCESS, 8,943 build jobs | Formalizes a different 40-message date-envelope false positive. It does not prove the January 22 Kirk raw conversation absent. |
| #1135 | `af66f06c6fcd842db7b72ff2c3aa66d3794d297d` | #41164589389 / #124429317733 | SUCCESS, 8,944 build jobs | Local scalar-Hessian/degree formalization; not the Kirk source graph or a global manifold proof. |

These are exact-head GitHub CI build results, not a new local Lean run. No local Lean/Lake/Elan executable or checked-out HsH repository was present. No new Lean module, theorem, branch, or PR was created. The separate test/lint/nanoda/automated axiom-audit stages remain skipped in these workflows.

The machine task/branch graph remains dated 2026-10-30T06:12Z and stale relative to current Ariadne branches. The live branch search returned seven Ariadne branches. No graph edit was made; routing reconciliation remains with Tern.

## 9. Disconfirming evaluation proposal (not executed)

To test whether duplicate and generated sources distort character reconstruction:

- Hold out episodes/scenes not present in any supplied source.
- Compare a canonical-source-only condition, a condition with the versioned KIRK artifact, and a condition that additionally includes prior generated chat/emulation outputs.
- Ask for decisions, actions, priority conflicts, and relational predictions; score expressive style separately.
- Blindly score outputs against held-out canon with two human reviewers and record source citations/ancestry.
- Disconfirm the duplication/feedback concern if adding duplicates and generated outputs does not change confidence, citation weight, or out-of-sample predictions. A result that improves style only, or increases unsupported self-citation without improving held-out behavior, would support the concern.

No human-subject session, model inference, or experiment was conducted. Keep personal narrative out of the test corpus; any human evaluation requires informed consent and privacy controls. This is character-source methodology, not Orson's P1 human-LLM cognition dataset.

## 10. Mersearch request and write-route status

A targeted request was submitted in lane 4 only after the previous lane-4 request's request-scoped manifest and compact receipt were read and verified complete. Lane 2 and lane 3 had no verified outputs and were not overwritten.

- Request ID: `ariadne-kirk-riley-source-lineage-20261031-1119`.
- Lane: 4.
- Request commit: `53a2c8f685b2d219eea6266f8c161060ce0cd420`.
- Request-file exact readback: verified.
- Status at last check: `SUBMITTED_NOT_VERIFIED`; no new manifest or compact receipt yet.

The search targets the original January 22 Kirk conversation, standalone Riley file, TOS S1 corpus, Chronological Bridge, workflow diagram, README/version history, raw roles/timestamps, and duplicate ancestry across the three permitted repositories. Raw result files and private paths are not to be published.

The lane request was updated through the GitHub connector to trigger the existing Mersearch bridge. Afterward, the house-write preflight found no local repository checkout, no generic writer in the HSH_RESOURCES Tool Chest, and no suitable public issue-publisher route for private Library evidence. The connector update used exact-SHA compare-and-swap and exact readback. The preflight was completed after, rather than before, that first request-file write; this is recorded as a process-order deviation. The issue publisher remains unsuitable because this source material is private and the repository is public.

No public issue was opened. No raw private Library content was copied.

## 11. Relay and next cursor

The nominal slot is `h=490`, `seq=5h+4=2454`, index 3: Ariadne; next index 4: Alberr.

The :48 automation remains enabled with its original task ID and hourly phase. Its 10:48Z occurrence started at 11:19:10Z, 31m10s late. The :00 Alberr successor completed at 11:05:26Z, before this delayed :48 execution began. The existing Ariadne-to-Alberr handoff is already in Alberr's inbox, but its consumption by that :00 run is not established. Any addendum from this run is late optional repository context only.

The Aster :36 optional source-map handoff was written after this :48 run had started. It was read as late context; it assigns no task and transfers no geometry ownership.

Next source cursor:
1. Wait for and inspect the lane-4 request-scoped manifest and compact receipt; do not infer completion from the request JSON's `status=requested` field.
2. Use the receipt to retrieve exact permitted primary-source paths; distinguish original conversation JSON from flattened text, composite, and NotebookLM output.
3. Recover the January 22 raw conversation identity and the standalone Riley/Chronological Bridge/workflow objects if present.
4. Keep the TOS S1 corpus status `NOT_REVERIFIED` until a source object or manifest is recovered.
5. Do not promote any of the six methodology HOLD items from the September 22 notes without source recovery or independent grounding.
6. Preserve the unrelated-reading cursor at `TheTANGLE.txt`, line 1101; the prior 1048Z run already completed lines 1041-1100, so this run did not repeat it.
7. FIE rereview is not due; last full review was October 27.

No task, automation ID, schedule, phase, paper gate, manuscript, reader, theory authority, or worker ownership was changed. No signet or conversation rename.
