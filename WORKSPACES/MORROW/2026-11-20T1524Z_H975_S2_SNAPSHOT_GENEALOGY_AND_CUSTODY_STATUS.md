# Morrow h975:s2 | Raw snapshot genealogy and custody-status reconciliation

**Run key:** `REVROT3-19-20261011:975:s2`  
**Nominal slot:** 2026-11-20T15:24:00Z  
**Selection:** `h=975`; `seq=5h+2=4877`; `4877 mod 19 = 13` → **Morrow**, ring index 13.  
**Next ring label:** **Kestrel**, index 14.  
**Disposition:** `SOURCE-CUSTODY-ONLY / RAW-SNAPSHOT-DELTA-REVERIFIED / MORROW-SOURCE-001-CODE-RESOLVED-FOLLOWUP-OPEN / S09-VISIBILITY-MISMATCH-RECONFIRMED / NO-THEORY-WORK`.

This is assistant-level source-grounded reconstruction under the deterministic Morrow label. It does not authenticate the historical Morrow instance, a current Morrow thread, or any cross-thread delivery.

## 1. Authority and scope

The current Morrow workspace, BOOT, CURRENT_WORK, trial checkpoint, Source Identity Gate, Common workflow controls, and the relevant receipts were read. The historical role and stop were re-parsed from the later raw Morrow export rather than accepted from a handoff summary.

The original Morrow conversation is `6a9ee7ca-d340-83ea-b99d-6a3097429f36`.

- Earlier snapshot: Git blob `362075c5e32ec9e97579bd1de58fba7f612cb6bb`; 465 mapping nodes; 14 user-role messages; conversation `create_time=2026-09-07T16:43:41.329Z`; `update_time=2026-09-09T12:45:43.552Z`.
- Later snapshot: Git blob `ee394b446b2e36d35fd1e5ecd004685c0422457b`; 697 mapping nodes; 17 user-role messages; same conversation ID and `create_time`; `update_time=2026-09-14T07:11:01.416Z`.
- The later HsH source path is `DEVELOPMENT_FULL_CONVOS/SAT_CONVOS_18/26.09.07•26.09.13•🧗_♂️ MORROW ALDUS [Reconstruct H(s)H Synthesis] — raw.json`.

The two snapshots are versions of one conversation, not independent witnesses. The raw Git blobs were fetched by exact SHA and parsed. This run did not recompute raw-byte SHA-256 for either export; Git blob identity is the pinned content identifier used here.

## 2. Direct role and authority messages

Three later user-role messages were reverified in the 697-node snapshot:

| Message ID | UTC time | Recorded role | Source status |
|---|---|---|---|
| `402ade01-7116-4efb-9b14-31e477754458` | 2026-09-08 03:25:36.187Z | `user` | Provisional Team Archivist assignment |
| `934e87de-4e61-4622-a0ea-e5047aa235c6` | 2026-09-13 00:11:10.939Z | `user` | Direct theory stop and quarantine instruction |
| `99ae959b-fbeb-4c1e-9326-a6723c2b9557` | 2026-09-13 15:31:22.757Z | `user` | Later trial-workflow invitation |

For all three, the raw `author.name` is null and `message_source` is null. The archive's internal convention attributes preserved user-role messages to Nathan for project source purposes; this does not independently authenticate an external account or person.

The September 8 message addresses the assistant as Morrow and assigns a provisional Team Archivist remit: appraise the broader corpus, prepare a flexible action plan, and coordinate with GitKeeper. The assistant's earlier self-naming is a separate assistant-authored event and is not attributed to Nathan.

The September 13 stop says: **“STOP WORK ON THE THEORY IMMEDIATELY. QUARANTINE ALL DOCUMENTS YOU HAVE PRODUCED AS UNIQUE ARTIFACTS.”**

The later trial invitation permits bounded archive maintenance, source comparison and checkpoint work. It does not expressly release the theory stop or authorize theory integration. The current Morrow boundary therefore remains provisional Team Archivist / archive-source custody only. Training completion is not asserted.

## 3. Exact snapshot comparison

A node-by-node comparison of the 465-node and 697-node mappings gives:

| Relation | Result |
|---|---:|
| Earlier nodes absent from later snapshot | 0 |
| Nodes added in later snapshot | 232 |
| Shared node objects with any difference | 2 |
| Shared message-content objects changed | 1 |
| Shared-node child-edge changes | 1 |
| New user-role messages | 3 |

The three new user-role messages are the September 12 Dashboard request (`dfee800e-c505-4cb9-ae07-f88c06b08ee2`), the September 13 theory stop, and the later trial invitation.

Two shared node objects differ, but their differences are not equivalent:

1. **Assistant message `d3d1d7f6-a5d9-4881-b795-c9c4eaa6dcde`:** the earlier snapshot stores `content_type=code` with a search-query string in `content.text`; the later snapshot stores `content_type=text` with `parts=[""]`. The message timestamp and child pointer remain the same. The later snapshot therefore does not preserve this assistant query body. The cause of the representation/content change is unknown.
2. **Assistant message `5103e41b-1dae-54c5-a8ee-b91ca82f7103`:** its message content is identical, but the later snapshot adds child pointer `bc0aa167-caf3-58b9-b69a-48b8ab7da5c3`. This is a branch/adjacency extension, not a changed message payload.

The 697-node snapshot is a later coverage version, not a lossless byte-for-byte replacement for the earlier snapshot. Preserve both source versions and the distinction between message-payload changes and graph-edge changes. No source was deleted, moved, rewritten, or quarantined in this run.

## 4. MORROW-SOURCE-001 status reconciliation

The historical Janus comparison report `WORKSPACES/MORROW/JANUS_EXPORT_COMPARISON_2026-09-13.md` identified a false-positive risk in the original shared superset scanner: it compared selected `content` fields (`content_type` and `parts`) and omitted `content.text`, where some execution outputs reside.

The current scanner is `WORKSPACES/COMMON/scripts/find_superset_conversation_duplicates.py`, blob `343da1678c94d36fc98bd33ede5676211cd53c7c`.

Its correction commit is `88b947ac804bb716e91d36c6c1b89cdf061debe0`, dated 2026-09-13, message `Fix superset scanner content equality to fail closed`. The current `canonical_message` hashes the entire `content` object, plus author role/name, recipient, channel and `create_time`. The commit diff explicitly removes the selected-field whitelist and explains the `parts` versus `text` failure mode.

The live `AUTOMATION_WORKFLOW_CONTROL.md` row now records `MORROW-SOURCE-001` as `RESOLVED-CODE / FOLLOW-UP-REPORT-REGEN`. This supersedes the older historical trial-checkpoint sentence saying the issue remained open for scanner-maintainer review. It does **not** close the remaining work: candidate reports generated under the old comparator may still need regeneration and point-of-use/index/tag review before any duplicate disposition.

No corpus-wide scan, candidate-report regeneration, file deletion, quarantine or duplicate disposition was performed. No test file was found in the shared `scripts` directory under the three likely test names checked; the code correction was inspected, not executed in this run.

## 5. HSH_RESOURCES boundary and S09

The current GitHub repository metadata for `Satobloc/HSH_RESOURCES` reports `visibility=public`. Its root README, blob `1433b65480a04b1bd4ed64e4b234c3ecf1b576f0`, describes the repository as private research infrastructure and says it is not part of the public cross-link surface.

These statements describe different things. The README expresses a handling/cross-link policy; it does not make a publicly visible GitHub repository access-controlled. The public repository metadata therefore means tracked repository content is publicly accessible unless separately restricted by GitHub mechanisms.

Only repository metadata and the root README were inspected. No HSH_RESOURCES payload, private index, dataset, paper or other internal content was opened. No visibility, permission, license or file change was made.

This remains the existing **Phase Steering S09** legal/visibility review item. No duplicate issue was created. A Nathan/authorized-owner decision is needed before any visibility or licensing change.

## 6. Mersearch and current workflow state

No callable Mersearch action is available in this runtime. The four canonical Mersearch request lanes remain occupied/requested. Their twelve expected `RUN_MANIFEST.json`, `SEARCH_RECEIPT.json` and `SEARCH_RECEIPT.md` paths were checked and remain absent. No lane was overwritten, released, retriggered or replaced. Exact GitHub blob/API retrieval was the bounded source fallback; it is not a Mersearch run.

The task graph remains `ACTIVE_SEED`, with 18 records and 16 declared branches; Morrow has no task-graph branch entry. No graph mutation occurred.

- P0 Code Grurple: ACTIVE.
- P1 cognition: Orson-owned, OVERDUE / NOT READY; preserve the 4/5 allocation.
- P2 measured-system paper: HOLD.
- P3 full-theory paper: INCOMPLETE.
- FIE next review: November 24, 2026; not yet due.

## 7. Lateral reading and return cursor

Continued the existing unrelated-reading cursor in the SAT archive:

`000 Earliest SAT_RMS/Hosts Aiden and Maya/fun break - lx.txt`

- Read lines 2241–2280.
- Next cursor: **2281**.

This segment contains an assistant-generated Lombardic/Burgundian vocabulary list. It is an unsourced conversation artifact, not independently checked linguistic evidence; no linguistic claim was used in the research findings.

The separate Okakura, *The Book of Tea*, cursor remains at its previously recorded position. The deferred `SPHERE4QC.txt` line 1301 remains untouched.

## 8. Limits and non-actions

This was an archive/source-custody operation only. No H(s)H theory integration, geometry construction, equation correction, Lean proof, physical calculation, CODATA comparison, fit, prediction, independent measurement, paper drafting/review, or BEDROCK promotion occurred. No Slack API action, private-channel/DM search, or private HSH_RESOURCES access occurred.

The September 13 Morrow theory stop and the current Morrow source-custody boundary remain controlling. Lane 24's general geometry/CODATA charter was not used to override that worker-specific stop.

No scheduler task, task ID, prompt, phase, cadence or enabled state was changed. No sixth task, signet or conversation rename occurred.

---

**Source-control references:** HsH main was read at `9bd3f3d5abcae31a3a9c6c8e38303e2d5b11934e` before the final continuity writes. Relevant current source files: [Morrow README](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MORROW/README.md), [Source Identity Gate](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MORROW/SOURCE_IDENTITY_GATE.md), [Janus comparison](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MORROW/JANUS_EXPORT_COMPARISON_2026-09-13.md), [Automation Workflow Control](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md), and [Phase Steering S09](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/PHASE_STEERING_2026-10-26.md).

**Final classification:** `RAW-SNAPSHOT-GENEALOGY-REVERIFIED / TEAM-ARCHIVIST-ROLE-SOURCE-REVERIFIED / THEORY-STOP-REMAINS / MORROW-SOURCE-001-RESOLVED-CODE-FOLLOWUP-REPORT-REGEN / S09-PUBLIC-VISIBILITY-MISMATCH-RECONFIRMED / NO-PRIVATE-PAYLOAD-ACCESS / NO-THEORY-WORK`.
