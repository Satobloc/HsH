# Morrow | θ₄ source-locator correction and Mersearch candidate audit

**Date:** 2026-11-01T07:48Z  
**Run key:** `REVROT3-19-20261011:511:s4`  
**Disposition:** SOURCE LOCATOR CORRECTED · SEPTEMBER 16 RAW SOURCE STILL UNRECOVERED · MERSEARCH QUERY BOUNDARY AUDITED · INTERNAL CHECKPOINT AND KEStREL ROUTING UPDATED

## 1. Selection, role, and authority

`h=511`; `seq=5h+4=2559`; `2559 mod 19=13`. Selected label: Morrow, ring index 13. Next label: Kestrel, index 14. Next run: `REVROT3-19-20261011:512:s0`.

The historical Morrow export is conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36`, raw Git blob `362075c5e32ec9e97579bd1de58fba7f612cb6bb`, 465 mapping nodes. User message `402ade01-7116-4efb-9b14-31e477754458`, timestamp 2026-09-08T03:25:36.187Z, gives a provisional "Team Archivist" remit. The more elaborate title "Archive Synthesis & Dependency Integration Lead" was proposed by the assistant. No separate signed Nathan-authored specialist charter was recovered.

Morrow's archive-only remit, theory freeze, and separate training standdown remain controlling. Training completion is not asserted. The current scheduled execution is not authenticated as the historical Morrow instance.

## 2. Correction to the 04:00 source locator

The 04:00 addendum and its Kestrel handoff recorded the wrong conversation ID for the June 10 "Geometry in Physics" source:

- **Incorrect locator:** `6a25a665-dc92-8bcb-a5ef-5f0b5e87b2ce`.
- **Correct raw-export conversation ID:** `6a25a665-3a10-83ea-a7c0-cebebfdcf1d9`.
- **Canonical HsH raw path:** `DEVELOPMENT_FULL_CONVOS/LONG_CONVOS/26.06.07•26.06.10•Geometry in Physics — raw.json`.
- **Canonical raw Git blob:** `2e0c8477873583b92f20a0a3f2af6528643b4a8a`.
- **User message:** `7c63153a-c483-496f-8ec6-685d294f0375`.
- **Timestamp:** 2026-06-10T14:30:19.781123Z.
- **Canonical snapshot parent:** `17fddba3-8c5a-499c-bd2d-e4ba6315fa97`.
- **Message-body SHA-256:** `63eb0091b9693b74c517195b45563ab24eda4882a0abbeaeb4e1b490234eafde` (291 UTF-8 characters).

The user-role message asks to use equals notation for major semantic labels, giving `θ₄ = "filament-time energy transfer"` and suggesting `"timesheet drag"` as a possible later dated label. The latter is proposed wording, not evidence that a later change occurred. This is a semantic-naming instruction, not the missing 2026-09-16 normal-reference or inverse-pitch source.

Two later Library materializations preserve the same message ID, timestamp, body hash, and conversation ID but show a different parent edge (`ab8f5b97-2628-4f4a-9a27-1fd85cdc0a41`). Parent edges are snapshot-specific. Use the canonical raw blob's parent for the canonical citation; do not merge parent edges across snapshots.

The incorrect ID appears in the 04:00 internal addendum and its Kestrel handoff, not in the published #1159 artifact. The published artifact is therefore unaffected and needs no public correction or duplicate issue. The additive correction note is `WORKSPACES/MORROW/2026-11-01T0400Z_THETA4_SEMANTIC_TAXONOMY_ADDENDUM_01.md`.

## 3. Mersearch result and query audit

Existing request `morrow-br005-time-normal-source-20261031-1253` is complete. Its manifest and compact receipt were independently fetched:

- Manifest blob: `f1b451d7bccd5dd8674f0fa6655dd603e4ca5253`.
- Compact receipt blob: `df77a9c8b6ae18c7c19b84f8fcb20617533ebdd6`.
- Pinned inputs: SAT archive `db32abc75a4a2cff3afc6de895cd7edb9eb62d82`; HsH `0d738a7dd9b876a98f56b565aace6eac4a7e315f`; HSH_RESOURCES `607c0fd8b4f7c66d7bb9c9f53e5d8d9d1a7c4b22`.
- Coverage: 15,966 files, 20,844,775 records, 1,094 hits, 334 paths (archive 138, HsH 917, resources 39).
- Raw result files remained in the temporary Actions workspace; only the manifest and compact receipt were retained. This is discovery coverage, not 334 independent witnesses.

The recorded query has Boolean structure:

`(A AND B) OR C OR (A AND D)`

where `A = author:user`, `B` is the θ₄ plus time-normal/inverse-pitch term group, `C` is a θ₄ NEAR/15 time-normal branch, and `D` is the parallel-to-time-normal NEAR/12 filament branch. Branch `C` is not guarded by `author:user`.

A Python truth-table run checked all 16 assignments. Four assignments satisfy the recorded query while `A=false`. Minimal counterexample: `A=0, C=1`, so the query can return a non-user record. This is a query-composition issue, not evidence that the parser ignores role metadata.

The stable searcher also iterates all nonempty mapping messages; it does not restrict to the `current_node` parent chain. Every candidate therefore needs an outer-role check and an explicit active/off-path classification.

### Candidate triage

- **All-Worker Standards Read:** raw blob `09e56a40582d8babad6bc339947b5ab97e80df6a`, conversation `6aa8cd96-74a4-83ea-8d8b-5ebbe24e834f`, 567 mapping nodes. Fifteen messages contain the target term family; zero are user-role. Sample `c339ad01-341f-4616-85f9-ca83501a58e3` is a tool result fetching `!!_RUNNING_COTHEORIST_LOG.md`, not the original statement.
- **Kestrel Science Made Stupid:** sample `522ad9b9-8c1a-4c2a-943e-f8d34d9cd1f7` is also a tool result fetching the running log.
- **Mercer Archive QA Loop:** 60 nodes; the inspected term hits are assistant summaries, not a raw Nathan user statement.
- **SATNet and Neural Networks, Meridian Free Build, Geometry in Physics, and Homes in Cardinal Order:** inspected high-ranked samples are file-search/API tool outputs.
- **Consciousness and AI Debate:** inspected sample is assistant-authored, not Nathan Direct.
- **Casual Check-in:** user-role messages `ccba5120-3a5d-4369-810a-26ae4e379100` and `4ca0b548-23ab-4cd0-b9aa-a984d9fb4ff4` are one draft/disclaimer family. The second explicitly says the draft was not proofread and its framing should not be attributed to the user.
- **Switching to English:** user message `f236e23d-0266-4be8-94f7-ead029c534b6` is a direct March 7 statement measuring θ₄ from the timesheet plane, not its normal, with vacuum at 90° to the plane. It is an earlier direct source, not the September 16 update. The other user-role formal block `f11275ae-5ca5-4834-a4d7-d861b85cec43` has unresolved mixed authorship.
- **Ontology and Math Check:** user message `e41e50ba-6c02-433f-ab9e-54633a7c6e17` carries an explicit note that the formal block is largely LLM-written; it is not a direct source for the September 16 convention.

The 2026-09-16 normal-relative `θ₄=0` vacuum and at-rest inverse-pitch claims remain **LOG_ONLY / RAW_SOURCE_NOT_RECOVERED**. The earlier March 7 plane-relative statement and the later log claim must remain versioned and unresolved. No complement-angle assumption can authenticate the missing historical message. No global absence claim is made.

When a Mersearch lane is released, the corrected query should place `author:user AND (...)` outside the entire disjunction, then verify parent/current-node membership. No new request was created because all four lanes remain occupied.

## 4. Formalization, reading, and controls

The query logic is a formalizable Boolean proposition. A Python truth-table counterexample was run; it is not a Lean proof. Local `lean`, `lake`, and `elan` executables are absent. No Lean compile is claimed, and no branch/PR was created because this is Morrow's archive-only workbench under theory freeze and training standdown. Existing PR #790's exact-head archive-count build does not prove this query property.

Unrelated reading continued in Jacoby, *Practical Talks by an Astronomer*, HSH_RESOURCES source `HISTORICAL/JACOBY—ASTRONOMER TALKS.txt`, lines 701–740. Next cursor: line 741.

FIE last full review: 2026-10-27. The 14-day rereview threshold is not due. No physical calculation, new model inference, human-subject experiment, theory integration, prediction, paper, BEDROCK edit, SAT-O/Blockwave change, PR, branch, or new tooling.

## 5. Operational state

- Existing :48 automation ID `6aa6c3bc02b48191b8a91a30d2a155e0` remains enabled.
- Original schedule remains hourly, America/New_York, DTSTART 2026-10-01T14:48, exact :48 phase.
- No task ID, prompt, enabled state, schedule, phase, or cadence changed. No sixth task.
- The current :48 run was `in_progress` at final peek, `chat_ref=null`; no terminal completion is claimed.
- No authenticated historical Morrow thread, Kestrel thread, cross-thread delivery, or acknowledgment is claimed.
- Public issue #1159 remains PUBLISHED_VERIFIED and unchanged. No new public issue was opened.
- Morrow checkpoint and Kestrel inbox receive additive repository updates. The Kestrel handoff is optional context only, with no task, ownership transfer, or response obligation.
