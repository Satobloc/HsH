# Append-only amendment 02: Meridian PR #895 CI checkout identity

**Amends, does not replace:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-10-30T2200Z_s0_meridian.md` and its Amendment 01.  
**Recorded:** 2026-10-31T2048Z.  
**Scope:** CI checkout identity and current branch integration state only. Amendment 01's source-attribution correction remains authoritative.

## 1. Correct the exact-head claim

The earlier Amendment 01 described Actions run `41141185069`, job `124358367833`, as building the exact PR head `71a68306d33472bbbe54df609dd05a5063e30297`.

Direct inspection of the complete job log shows that the job checked out:

`refs/remotes/pull/895/merge`

at merge commit:

`72095ccf6fdc136dc04934b5df7ff801d2fc65d0`

The PR head remained `71a68306d33472bbbe54df609dd05a5063e30297`. Therefore the correct status is:

**MERGE_REF_BUILD_SUCCESS / EXACT_HEAD_NOT_VERIFIED.**

The merge-ref build completed `lake build` successfully with 8,946 targets under Lean 4.34.0 / Lake 5.0.0. The full job log contains 21 in-file `#print axioms` outputs: six from `MeridianCosmotopologyFidelity` and fifteen from the two P1 modules also present in the PR. The six geometry outputs list only the standard dependencies `propext`, `Classical.choice`, and `Quot.sound`; the mapping-torus endpoint theorem lists `propext` and `Quot.sound`. No `sorryAx` occurs in the retrieved full log.

The workflow explicitly set `test=false`, `lint=false`, `nanoda=false`, and `axiom-audit=false`. The in-file axiom reports are real build output, but they are not a separate automated axiom-audit stage. No exact-head-only compilation is established by this run.

## 2. Current branch integration state

PR #895 remains open, draft and unmerged:

- Head branch: `research/meridian-cosmotopology-source-gate`
- Head: `71a68306d33472bbbe54df609dd05a5063e30297`
- Base branch: `infra/lean4-verification-20261023`
- Base SHA: `61cc8b65ffed70296e0121dbae067892a79c81d4`
- Current main SHA observed in comparison: `64010865222f1ee0b56fad70cbc808db8bf2668f`
- Comparison against main: 55 commits ahead, 5,426 behind.

The PR is not main-based. Whether the old verification base is intentionally pinned is unresolved. Do not rebase, retarget or merge without the responsible branch owner and Code Grurple standdown.

The PR contains five changed files, including `MeridianAnswerProjection.lean`, `MeridianProviderPartition.lean`, and the P1 pair-matrix CSV. Those cognition/benchmark artifacts remain outside this geometry lane and under the protected P1 owner. No files were moved or edited.

## 3. Control-graph status

The live `TASK_BRANCH_GRAPH.json` read in this run does not register PR #895. Its HAGALAZ solver-unification entry remains listed active but explicitly BACKSEAT/HOLD under Code Grurple; its next cursor is path-dependent transport/history. No graph, branch, PR, task, ID, schedule or cadence was changed.

**Use this amendment as authoritative:** the build succeeded on the PR merge ref, not the exact PR head. The formalized statements compile in that merge context; their translation and physical premises remain separate questions.
