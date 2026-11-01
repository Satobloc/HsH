# Ariadne source-snapshot and Lean-input correction

**Audit date:** 2026-11-01  
**Status:** `SOURCE_VERSION_CORRECTED / LEAN_INPUT_SEMANTICS_CORRECTION / MERSEARCH_NAVIGATION_QA`

This additive note corrects the Ariadne Kirk/Riley source-lineage record and two proof-status descriptions. It does not add a human/LLM experiment, authorship finding, or theory claim.

## 1. Two Ariadne exports are different snapshots

The public HsH raw export at `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/26.09.22•26.09.23•ARIADNE — raw.json` (Git blob `df9c7a1fbddaa523f0b69cced8d761433490a454`) is an older snapshot of the same conversation represented by a later Library-held raw export used by the existing `AriadneArchiveWitness.lean` proof packet.

| Snapshot | Mapping nodes | Messages | User | Assistant | Tool | Empty root |
|---|---:|---:|---:|---:|---:|---:|
| Public HsH export | 1,322 | 1,321 | 8 | 529 | 784 | 1 |
| Later Library export used by PR #790 | 1,364 | 1,363 | 10 | 555 | 798 | 1 |

The 42-node difference is 2 user, 26 assistant, and 14 tool messages. The later export explains the larger counts in PR #790; the two exports are not identical snapshots.

The later snapshot contains two additional user-role turns after the earlier apparent length-limit notice. The prior statement that the conversation was confirmed maxed at that notice is superseded. The thread continued beyond it; the final exhaustion boundary remains unverified. No private message text, Library file identifier, or private export hash is reproduced here.

## 2. Lean input semantics need correction

PR #790's exact-head Actions run #41215958162 compiled head `68aadf6c90e6b69a03999e8c3cd8d22c58118e20`: Lean 4.34.0, Lake 5.0.0, 8,948 build jobs. The retrieved log contains no `sorryAx`. Six target-specific axiom reports were inspected: `contains_trans` has no axioms; the other five use `propext`, `Classical.choice`, and `Quot.sound`. Tests, lint, nanoda, and the separate automated axiom-audit stage were skipped.

Independent parsing shows that the one non-message mapping node is the `client-created-root` sentinel. There is no message with an unknown role. Therefore `RoleCounts.unknownCount = 1` is actually an empty-node count, and `ariadne_active_partition = 1364` is a mapping-node total, not a message total.

Correct partition:
- 1,363 messages = 10 user + 555 assistant + 798 tool + 0 unknown-role.
- 1,364 mapping nodes = 1,363 messages + 1 empty root sentinel.

Lean verifies the supplied tuple arithmetic, not the semantic classification of the source node. Recommended repair: distinguish `unknownRoleCount` from `emptyNodeCount` and rename the 1,364 theorem as a mapping-node partition.

The existing term counts reproduce: 117 Ariadne-conversation messages for `Kirk` (11 assistant, 106 tool, zero user) and 58 for `Riley` (7 assistant, 51 tool, zero user). The direct user-role instruction that Kirk material informs revival/human-simulation methodology is in a separate Revival Rotation conversation, not in the Ariadne raw export. These counts establish archive-role distribution only, not authorship.

## 3. Mersearch paths are not independent witnesses

The completed `ariadne-kirk-riley-upstream-stack-20261030-1200` request reports 15,590 files, 20,808,904 records, 551 hits, and 31 paths. Its compact receipt is a navigation summary; raw results were not published.

- Four Revival Rotation path entries collapse to one 346-node conversation graph. Three paths are exact copies of Git blob `386516f7c2d5b9ab2cd4f0050869ae00c133274d`; a fourth blob `722949d7646bf8cb4eed18c4ff110b55d4fbbb5f` has an identical parsed message mapping and differs only in `safe_urls` ordering.
- Two Ariadne raw-export paths share Git blob `df9c7a1fbddaa523f0b69cced8d761433490a454`, so they are one archived source object.
- The compact receipt ranks `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` with one matching record and `best_score=326`. This is a self-match to the active query, not 326 source hits, but it can distort ranking.

Path and hit counts are navigation measures, not counts of independent witnesses. Future searches should exclude the active request file itself where the pinned searcher supports that exclusion. No occupied Mersearch lane was overwritten or reused.

## 4. Cross-lane CI correction

PR #1135's successful run #41164589389 compiled merge ref `4d7b0fb41326a82635bbc75644d1b7bb8649c282`, merging PR head `af66f06c6fcd842db7b72ff2c3aa66d3794d297d` into base `61cc8b65ffed70296e0121dbae067892a79c81d4`. It is a successful merge-ref build, not exact-head verification. The PR description's exact-head wording is premature. Build: 8,944 jobs; no `sorryAx` in the retrieved log; tests, lint, nanoda, and automated axiom audit skipped.

PR #790 remains draft and unmerged; its branch is 58 commits ahead and 5,817 behind current main. PR #1135 is also substantially behind main. Neither was rebased or merged.

## 5. Limits

No human-subject session, model inference, physical calculation, paper advancement, new branch, new PR, or theory promotion occurred. Orson retains P1 cognition ownership. The November 9, November 30, and December 14 gates remain separate.

Next: correct the empty-sentinel semantics on the existing PR branch and obtain a new exact-head Lean build; continue bounded recovery of the January 22 Kirk source and standalone Riley materials; preserve all existing Mersearch requests and exclusions.
