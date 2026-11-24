# Tern h963:s4 | P0 reader-gate patch replay and control-plane snapshot

**As of:** 2026-11-20 03:53Z  
**Disposition:** P0 SOURCE-LEVEL POLICY MISMATCH STILL PRESENT ON MAIN / EXACT PR-HEAD TESTS 4/4 PASS / PR NOT INTEGRATED / FOUR-LEASE SNAPSHOT RECONCILED / NO LIVE ROUTE CLAIM.

## 1. Selection, source authority, and identity

For nominal UTC hour h=963 and slot s=4:

- seq = 5(963)+4 = 4819
- 4819 mod 19 = 12
- selected ring label: Tern Rook (index 12)
- next ring label: Morrow (index 13)

The ring label is a deterministic routing value, not an authenticated worker or conversation identity. Historical Tern source recovery in the existing h960:s0 continuity record identifies direct-user instructions supporting Comptroller control of scheduled-task allocation and workflow coordination. No standalone signed Tern specialist charter or geometry-specific remit was recovered.

The current :48 run has no authenticated `chat_ref`. Existing-thread-first lookup did not establish a current usable Tern conversation. This is assistant-level, source-grounded work, not authenticated historical-instance participation.

## 2. P0 Code Grurple: current-main source finding

The current HsH `main` head at readback was `7e291ad1b198f69787f8a16e8726fc3f75eb328d`.

Current source objects:

- `tools/site_discovery.py`: blob `97ff9c6d00544251c05bd6bb6053907805438f3e`
- `PUBLIC_SITE/READER_ROUTING_REGISTRY.md`: blob `277a94c553e2e17b61bb046a04781b4e44f2229f`
- `PUBLIC_SITE/PRESENTATION_GATE.md`: blob `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`
- `PUBLIC_SITE/PRESENTATION_CONTRACT.md`: blob `b871249564a45278383e41eebd8aaa5d8c64aa3c`
- `PUBLIC_SITE/AUTOMATIC_DISCOVERY.md`: blob `36b2669c328466f0f579e188fbec5796d6ca44dc`

The current collector still:

1. admits eligible `WORKSPACES/**` files through `eligible(path)`;
2. assigns the generic `reader.html?mode=browse` route to every eligible document record;
3. permits Markdown/text workspace records into the excerpt-candidate set; and
4. excludes only `PUBLIC_SITE/` paths, not `WORKSPACES/`, from the rolling 48-item docket. The earlier #1747 snapshot happened to show zero workspace records in that 48-item docket; that snapshot outcome is not a code-level exclusion guarantee.

The reader registry separately says `WORKSPACES/**` must not be ordinary reader content without an explicit presentation derivative. The presentation gate requires a pending/omitted state rather than raw-source fallback. The source-level policy mismatch therefore persists on current `main`.

The current `PUBLIC_SITE/generated/discovery.json` object has blob `f2fd75148e4928a11cf5247a95bf3d5aaa640529`, but the connected file reader returned an empty body. Its per-record contents could not be independently parsed in this run. No live site route, browser rendering, deployment, or public raw-display incident was observed. The defensible status is **source-level mismatch confirmed; current rendered exposure NOT OBSERVED**.

The existing P0 issue [#1747](https://github.com/Satobloc/HsH/issues/1747) remains open. No standdown, route probe, source edit, reader edit, feed edit, deployment, or ownership change was made.

## 3. Existing PR #2009: exact-head local test replay

The proposed fix remains in [PR #2009](https://github.com/Satobloc/HsH/pull/2009), branch `fix/workspace-discovery-presentation-pending-20261118t1936z`.

Exact PR-head source objects were fetched and their Git blob hashes independently recomputed:

- `tools/site_discovery.py`: `c648a5666ddf87c3ab0ad6607f0762796bc7f160`
- `tests/test_site_discovery.py`: `e7ca2989115e44aab570f6baefa73e2882bc3caa`

Both hashes matched the connector-returned blob identities byte-for-byte.

Local execution:

```text
Python 3.13.5
python -m unittest discover -s tests -v
Ran 4 tests
OK
exit code 0
```

The four passing tests cover square/exclusion boundaries, incremental revision/deletion/last-good behavior, metadata-only workspace records with legacy reader/excerpt removal, and truncated-tree traversal.

The patch's intended behavior is clear: retain workspace metadata for discovery, set `reader=None`, mark `PRESENTATION_PENDING`, remove excerpts including legacy cached excerpts, and exclude workspace records from the rolling docket. The positive control retains normal reader/excerpt behavior for a non-workspace presented record.

This is an exact-source/exact-test **local replay** using synthetic repository-tree fixtures. It is not the repository's Actions CI, a full production scan, a live generated-feed test, a reader-route test, or a deployment verification.

## 4. Integration and release status

Comparison of current `main` with PR #2009's head:

- current main: `7e291ad1b198f69787f8a16e8726fc3f75eb328d`
- PR head: `ee582b8de93f88f49445c211892529c40b47fded`
- merge base: `d47be7cfacfa182aedaad17a9e0841eb80fdfddb` (the PR's older base)
- PR head: 3 commits ahead / 1,554 commits behind current main
- PR remains OPEN / DRAFT / UNMERGED
- PR-triggered workflow-run lookup for the exact head returned zero records

Two PR metadata reads in this run returned different `mergeable` booleans. The latest returned `true`; an earlier read returned `false`. That field is not treated as review, CI, freshness, or release evidence. The large base divergence and draft state remain decisive operational constraints.

Main advanced 12 commits after the Nadir h963:s2 snapshot. The changed paths were Conversation Viewer data, the generated discovery JSON, and worker/receipt/continuity records. `tools/site_discovery.py` and the reader-policy documents did not change in that interval.

No rebase, merge, branch rewrite, CI dispatch, review submission, owner transfer, or deploy was attempted. P0 remains ACTIVE.

## 5. Four-lease scheduler readback

Four exact-ID peeks were made. The snapshot is observational and non-atomic.

| Lease | Current run state | Timing observation | Latest-result pointer |
|---|---|---|---|
| :00 | completed | scheduled 03:00Z; started 03:31:20Z; completed 03:50:26Z | matches current run |
| :24 | completed | scheduled 03:24Z; started 03:25:37Z; completed 03:32:09Z | matches current run |
| :36 | in progress | scheduled 03:36Z; started 03:39:36Z | still points to prior 02:36Z result |
| :48 | in progress | scheduled 03:48Z; started 03:46:15Z, 1m44s before nominal time | still points to prior 02:48Z result |

The current :48 run has no completion timestamp and `chat_ref=null`. The :36 run also has no current chat reference. The :00 and :24 current results now match their current run IDs. The differing start offsets and stale pointers are recorded observations, not proof of restart, duplicate execution, cause, or worker identity.

All four existing tasks remain enabled with their original IDs, exact hourly phases, and prompts. No task was created, paused, edited, renamed, or rescheduled. No sixth task.

## 6. Task graph and PWH queue

The live `TASK_BRANCH_GRAPH.json` blob remains `caeddc7825f604f7863c8bc601503f88482bedb5`, status `ACTIVE_SEED`, updated 2026-11-19T16:48:27.155Z.

A fresh script readback found:

- 16 declared branches / 18 records
- 5 completed / 12 active / 1 blocked
- 7 roots
- 11 parent-pointer edges / 10 child-array edges
- one parent-only edge: `P2-REAL-SYSTEM-GEOMETRY-2026-11-30 -> WORLD-TUBE-POLARIMETRY-READOUT-2026-11-03`
- 17 nodes reachable from roots; the world-tube readout node remains unreachable by child traversal
- no dangling parent/child references and no cycles

The graph does not define whether parent pointers or child arrays are authoritative, nor the semantics of `branch_count`. No repair or theory interpretation was imposed.

PWH status remains:

- WH-01: OPEN / P1-HIGH / Tern-coordinated; cursor 2026-11-15T18:50Z; `RUN_ID_SNAPSHOT_NOT_RETAINED`. Recover the original 100-run response or a lossless run-ID manifest. Do not repeat the completed run-list query; if the snapshot cannot be recovered, seek explicit authorization before a new census.
- WH-02: highest-priority unblocked item; Calder/authorized maintainer retains PR #1710 code/rebase action. No takeover.
- WH-05: highest-priority item overall but blocked by four occupied/requested Mersearch lanes. No lane overwrite, release, retry, or new request.

No callable Mersearch action was available in this runtime. The existing Tern Mersearch request/receipt was checked; its request-scoped manifest was not available. No new archive request was created.

## 7. Review-MIND and consensus limits

This run performed source/provenance QC, not a human-LLM group experiment.

A deterministic ring label, scheduler run ID, or report authored under a worker label is not proof of a distinct agent or independent participant. The earlier Nadir h963:s2 report and this Tern report share the same primary source ancestry: issue #1747, PR #2009, current HsH source, and the same discovery/presentation policy. Their agreement is **not independent cross-agent consensus**. The exact-head local test replay is a separate execution of the same source/test artifacts, not an independent model or empirical replication.

A future disconfirming cognition study could compare independently retrieved versus shared source packets, randomize source order and attribution, seed one controlled citation discrepancy, and score claim-level correctness, error propagation, and source/process ancestry separately. It would require actual recorded model outputs, frozen model/context metadata, pre-registered scoring, and human consent/privacy where people participate. This is a design proposal only; no participant results are claimed. Orson retains P1 cognition ownership.

## 8. Campaign, evidence, and next cursor

- P0 Code Grurple: ACTIVE.
- P1 Nov 9 LLM-cognition minor paper: OVERDUE / NOT READY / ORSON-OWNED.
- P2 Nov 30 measured-system paper: HOLD.
- P3 Dec 14 full-theory paper: INCOMPLETE.
- FIE last reviewed November 10; next review November 24. It is not yet stale.

No physical dataset was acquired, no fit/prediction/independent measurement was performed, no SAT-O or Blockwave equation was changed, and no BEDROCK theory was promoted.

Local `lean`, `lake`, and `elan` executables are absent. The finite task-graph properties were script-checked, not Lean-proved. Existing Math Hopper is an extraction/provenance tool, not a proof engine. No new tooling, fork, dependency, subscription, or expense was introduced.

**Next cursor:** preserve P0 ACTIVE; the PR's isolated tests pass but its branch is 1,554 commits behind current main and remains draft/unmerged. A responsible site-capable maintainer must reconcile the branch against current main, rerun exact-head tests/Actions, and obtain independent review before any merge or deployment. Tern retains control-plane coordination; no code ownership was transferred. Morrow is the next ring label, but no new assignment or packet was created: Morrow's existing inbox already carries optional WH-01/scheduler context, and no response obligation is being transferred.
