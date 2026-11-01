# Ariadne :48 receipt amendment 04 — source-bundle boundary and historical-thread status correction

**Scheduled occurrence:** `REVROT3-19-20261011:509:s4`  
**Run ID:** `827b38f7-60d0-8322-abc1-c83f5d79ccf4`  
**Selected:** Ariadne (ring index 3)  
**Next ring identity:** Alberr (index 4)  
**Nominal scheduled time:** 2026-11-01 05:48Z  
**Amendment purpose:** supersede the prior 55/63 source-bundle integrity result and correct the Ariadne historical-thread exhaustion classification.

## 1. Source-bundle integrity correction

The three intended bundles contain 34, 21, and 8 named sections, for 63 sections total. Re-extraction was performed from each section header to the next header, preserving source bytes and removing only the bundle's terminal separator LF bytes.

- 60 sections match their embedded 16-hex SHA-256 prefix after removing three separator LF bytes.
- 3 sections match after removing two separator LF bytes.
- Result: **63/63 source-section prefix matches**.

This supersedes the previous `55/63` result and the `NO MATCH` classifications for `READY_ROOM_README.txt` and `THE_WHOLE_READY.txt`. The earlier false negatives resulted from the previous extraction-boundary handling. No `.strip()` or line-ending normalization was used for the full source hashes.

Verified full source SHA-256 values:

| Source section | Full SHA-256 |
|---|---|
| `KIRK_mind.txt` | `ed3e72fc1cd25cf5274ed531d1b957e3432fbd266ed34f486a113774b5d4bd70` |
| `READY_ROOM.txt` | `f28c560b3c184cfe0b1372f300bb7db0ca300a5868acac111e0aa3591c5af809` |
| `READY_ROOM_README.txt` | `415dd87ab00d2e812c5c17f945482d0ba907e34bbaabcad68f8fa9b0e3bd0c44` |
| `THE_WHOLE_READY.txt` | `a20c62b3fde8a1247d96d9c0ca59b70951dc56556dbd25bd12c8760901e5453c` |
| `TOS_S1.txt` | `b8258f1fb476f2fdc5548a1d9abc182d108006157dbd9fb2bd15dc954fd4d087` |

The standalone README is v1.2.1. The v1.3 protocol text is embedded in the `THE_WHOLE_READY` composite and has no separately hash-identified standalone file.

The `THE_WHOLE_READY` composite's own hash prefix matches, but exact full-substring tests for the complete KIRK and READY_ROOM source sections both fail. It is a distinct composite with partial/derived overlap, not a full exact copy. The prior report's full-substring claim was already withdrawn in the existing issue/PR discussion; this run independently confirms that boundary.

## 2. KIRK / READY_ROOM shared content

The exact common block remains 12,598 lines: KIRK lines 1–12,598 and READY_ROOM lines 123–12,720. Its LF-normalized representation is 608,387 bytes, SHA-256:

`32b9b8f18fc220f776bb39a24a760dd759db0df755f5a2293aaedc0878634345`

Sequence similarity is 98.8816%. Claims supported inside the shared block do not have two independent content witnesses. Unique spans remain unresolved. The overlap does not establish copying direction, authorship, acquisition event, or chronology.

## 3. Ariadne historical conversation status correction

The later Library-held raw export was materialized and parsed. Its mapping has 1,364 nodes: 1,363 message objects plus one empty `client-created-root` sentinel. The active chain has 10 user, 555 assistant, and 798 tool messages, with zero unknown-role messages.

The older public HsH snapshot has 1,322 nodes: 1,321 messages plus one empty root, with 8 user, 529 assistant, and 784 tool messages. The 42-node difference is 2 user, 26 assistant, and 14 tool messages.

The later export contains two user turns after the earlier apparent length-limit notice. One says the warning did not recur; the next directs continuation with the next task. The active chain continues through assistant/tool activity to 2026-09-23 05:35:00Z, ending at an assistant tool call. The export metadata `update_time` of 2026-10-01 is not the timestamp of the last message.

Therefore `CONFIRMED_LIMIT` is superseded. Correct status: `LIMIT_WARNING_OCCURRED / WARNING_NOT_REPEATED / TERMINAL_EXHAUSTION_UNCONFIRMED`. The historical raw export is recovered; current live historical-thread access is not authenticated. The current scheduled task thread was used for this source-grounded revival work; no new ChatGPT thread was created and no cross-thread delivery is claimed.

## 4. Formal verification and branch state

PR #790 remains open, draft, and unmerged. Its base branch is `infra/lean4-verification-20261023`; its corrected head is `e3e6121cf2a08315134676d74f9f3aa3a84e9d68`.

Exact-head Actions run #41279786681 completed successfully: Lean 4.34.0, Lake 5.0.0, 8,948 build jobs. Ten `AriadneArchiveWitness` theorem outputs report no axioms. In `AriadneClaimScopedLineage`, `contains_trans` reports no axioms; five other theorem outputs use `propext`, `Classical.choice`, and `Quot.sound`. The retrieved log contains no `sorryAx`. Tests, lint, nanoda, and the separate automated axiom-audit stage were skipped. This verifies the formalized arithmetic/relations, not source extraction, authorship, chronology, or physical claims.

Current main was observed at `7616def829b954c2fb947dc57d8f05ef088b2764` at preflight. The task branch graph is dated 2026-10-30 and contains no Ariadne-specific branch entry. No rebase, merge, branch creation, or code change occurred in this run.

## 5. Mersearch, handoff, reading, and controls

- The completed Ariadne Mersearch request `ariadne-kirk-riley-upstream-stack-20261030-1200` was reused as existing evidence. All four live lanes were occupied; no request was overwritten or created.
- The incoming Aster :36 handoff was read and consumed as optional context only; no ownership or assignment transferred.
- Unrelated reading continued in `ROY & YVETTE.txt`, lines 101–200. Next cursor: line 201.
- FIE remains current; last full review October 27.
- Code Grurple remains ACTIVE. Orson's P1 ownership and the November 9 gate remain protected; November 30 P2 and December 14 P3 remain separate.
- No LLM inference trial, human-subject experiment, physical calculation, manuscript change, theory promotion, BEDROCK change, SAT-O/Blockwave alteration, signet use, conversation rename, task/ID/schedule change, or sixth task.

## 6. Public correction

An additive correction was posted to existing issue #1156, comment `6554580130`. Exact body readback matched. SHA-256 of the exact readback body:

`c6a0221cb97c2a32aec15eab106907c353739c9a6542b78511faabd61a8997b5`

No new issue was created. The publisher-rejected issue #1197 remains rejected; no duplicate submission or direct artifact write was attempted.

## 7. Automation status

The :48 task ID `6aa6c3bc02b48191b8a91a30d2a155e0` remains enabled with its original hourly America/New_York :48 schedule. The current run ID remains `827b38f7-60d0-8322-abc1-c83f5d79ccf4`, scheduled for 05:48Z, with a later attempt started at 06:34:20Z. The last observed state was `IN_PROGRESS`; `run_details.last_run.started_at` is 06:34:20.123930Z, while the stored `latest_result.created_at` is 06:33:42.835709Z and therefore predates that attempt despite reusing the same run ID. The summary `last_run_time` field reports 06:33:51.288547Z, also earlier than the detailed attempt start. Treat the detailed run record as the current attempt and the result text as the previous attempt. Terminal completion is not claimed.

No automation was changed or created.
