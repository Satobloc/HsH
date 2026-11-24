# H1072:S3 | Mersearch request-to-run-to-output binding crosswalk

**Status:** ASSISTANT OPERATIONAL RECONSTRUCTION / SCHEMA PROPOSAL / NOT IMPLEMENTED  
**Current HsH main snapshot:** `cc85792c8753766530979bb34c866bb2991480ce` (observed 2026-11-24T16:40:24Z).  
**Tracking issue:** [#1704, Mersearch operations and verifiable throughput](https://github.com/Satobloc/HsH/issues/1704)  
**Existing repair candidate:** [PR #2050](https://github.com/Satobloc/HsH/pull/2050)

## Executive result

The four canonical Mersearch request lanes remain occupied. Their `status: requested` fields are trigger metadata, not execution or release states. The current evidence is not four identical failures:

- Lane 2 completed a pinned Mersearch 1.0 search and published its manifest plus compact receipts. The four checkout events are now present in the append-only clone ledger. Its release is still unverified.
- Lanes 1, 3 and 4 reached the `Run Mersearch` step and were cancelled before producing request-scoped manifests or receipts. Lane 4 attempt 1 has an empty step array and no job log, so no search execution is inferred.
- No lane is free. No request was changed, retriggered, overwritten or released.

The new architectural finding is narrower: the successful Lane 2 manifest is not self-contained at the request/execution boundary. It contains the raw query but omits the request-file blob SHA and query digest. It also omits the Actions run, attempt, workflow and job identifiers that are recoverable from the Actions record and clone ledger. The existing execution-envelope composition map provides reusable typed identity layers, but no Mersearch-specific request-to-release composition has been adopted.

## 1. Current lane inventory

| Lane | Request ID | Current request blob | Actions evidence | Request-scoped outputs | Disposition |
|---|---|---|---|---|---|
| 1 | `calder-angle-geometry-source-fidelity-20261102-1337` | `1774cfefe2dd0be5c1c5f4696cdc456d75ac4f6b` | Run `41454976148`, attempt 1, job `125309252946`; `Run Mersearch` cancelled | Manifest and both compact receipts absent | `CANCELLED_BEFORE_OUTPUT / RELEASE_PENDING` |
| 2 | `perceptual-nexus-early-archive-20261120-01` | `b5faddb5585f7839d92410973e9e213d9fcd73b0` | Run `44818799476`, attempt 1, workflow `395264519`, job `136573978773`; search and publish steps succeeded | Manifest and both compact receipts present; raw results not published | `OUTPUT_PRESENT / PRIOR_READBACK_VERIFIED / RELEASE_PENDING` |
| 3 | `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001` | `bc585da224e66c11da4e71e1e8a17812142aa2bf` | Run `41926373944`, attempt 1, job `126911731401`; `Run Mersearch` cancelled | Manifest and both compact receipts absent | `CANCELLED_BEFORE_OUTPUT / RELEASE_PENDING` |
| 4 | `kestrel-finite-core-geometry-source-fidelity-20261102-2200` | `9249b3f3969a425c8e94554b8039a3b868200433` | Run `41533820436`, attempt 2, job `126321885823`; `Run Mersearch` cancelled | Manifest and both compact receipts absent | `CANCELLED_BEFORE_OUTPUT / RELEASE_PENDING` |

Lane 4 attempt 1 is separately documented as having a job record with an empty step array and unavailable log. It does not establish checkout or search execution. The cancellation-stage evidence for lanes 1, 3 and 4 is already preserved in [issue #2280](https://github.com/Satobloc/HsH/issues/2280) and the subsequent comments on #1704. Cancellation establishes the failing stage, not who or what initiated it.

Lane 2's request file has the same Git blob SHA at the recorded request commit and current main. Its manifest records request commit `2c0df511907dfbf45756a1971c7dc654c8aac257`. The exact request-file blob at that commit is `b5faddb5585f7839d92410973e9e213d9fcd73b0`.

## 2. Lane 2 source and output lineage

The successful Lane 2 Actions execution is independently bound by four rows in `WORKSPACES/COMMON/CLONE_LEDGER.jsonl`, current blob `4d344b730d02c084848b8b6d1b13656e837963d6`, 527 rows total. All four rows identify run `44818799476`, attempt 1, workflow `395264519`, job `136573978773`, and successful checkout steps 2, 4, 5 and 6.

The recorded source snapshots are:

- HsH main: `2c0df511907dfbf45756a1971c7dc654c8aac257`
- Stable Mersearch: `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`
- SAT archive: `d10dd333f2487054807bda398995300c538caa7e`
- HSH_RESOURCES: `f39742b5a7d34578cea9218202b8641978038aef`

The runtime-only compatibility hotfix is separately identified by stable-script SHA-256 `5fb48b8a5f19422313246445d0c663a2a39064934706082dd9100d3368b4b8c7` and runtime-script SHA-256 `be9efdb308268c8a941fc6385b72d64517dd62caacb0dbfdabd6878ebfb3e4b4`. The stable branch itself was not modified by that hotfix.

The manifest is blob `42003e19e2027c8c0cecdbcbf4528679a005e439`; it was added in publication commit `4091529d63c74b29cd94bbf984e6dca84146dd5d`. The compact JSON receipt is blob `8b8d798adb65cdcdb2885107a7b014df616215b5`; the Markdown receipt is blob `bfab82de4a88c791b04cad2e8ed660064d77ebb6`. The receipt reports 22,755 files, 22,827,574 records, 6,850 hits and 1,181 distinct source paths. It explicitly identifies itself as derived from `SEARCH_RESULTS.json`, not an exhaustive result listing. Raw search results were not published. Existing issue #1704 comment #7071693737 records an exact artifact readback; this turn independently confirmed the three files remain present but did not recompute their SHA-256 values.

The manifest's `outputs` hashes identify both job-local raw-result files and the two compact receipts. A hash for a job-local file does not make that file durably available. Publication and independent readback must remain separate evidence.

## 3. Missing request/execution binding

The current manifest contains `request_id`, raw `query`, tool/ref/commit, source-repository commits, request repository and commit, read/write roots, exclusions, runtime-hotfix metadata and output hashes. It does not contain:

- `request_blob_sha`;
- `query_sha256` or a query-visibility classification;
- Actions `workflow_id`, `run_id`, `run_attempt`, `job_id` or `job_name`;
- an explicit publication commit and independent readback record;
- an explicit lane-release event, actor, time and reason.

The run/job/checkout identities can be reconstructed from Actions and the clone ledger, so Lane 2 is not unbound in the total evidence set. The defect is that the manifest itself is not a self-contained execution witness and requires a cross-file join. The request-file blob can be recovered from the recorded request commit and path, but the manifest does not preserve that exact blob identity directly. The current readback status above therefore relies on the prior exact-readback record plus this turn's presence check, not a new digest recomputation.

The manifest and compact receipt also repeat the raw query. This report intentionally does not reproduce it. A digest in a manifest is provenance, not privacy: the request file itself is public. Until an authorized private-payload route exists, every request body must be treated as public and screened accordingly. Future manifests should avoid duplicating raw query text and should record a digest plus an explicit visibility classification.

## 4. Proposed partial composition map

Reuse Elias Kern's existing [execution-envelope composition map v0.2](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/ELIAS_KERN/EXECUTION_ENVELOPE_COMPOSITION_MAP_v0.2.md), which is itself an assistant reconstruction and proposal, not an implemented production contract. Add a Mersearch-specific request and release boundary without replacing its typed identity layers:

- **RequestKey:** repository, lane, request path, request ID, request-file blob SHA, query digest and visibility classification.
- **RunKey:** `(executionNamespace, taskId, providerRunId)` using the existing map's form. For this bridge, namespace identifies GitHub Actions plus repository/workflow ID, taskId identifies the canonical lane/request, and providerRunId is the exact Actions run ID.
- **AttemptKey:** provider attempt identity when exposed; otherwise preserve `ATTEMPT_UNEXPOSED`.
- **JobKey:** RunKey, AttemptKey and exact job ID.
- **SourceSetKey:** exact commit for each repository root, pinned Mersearch ref/commit, stable script digest and runtime-hotfix digest.
- **OutputKey:** output path and content digest.
- **ReadbackKey:** OutputKey, publication commit, independent readback source/time and matching digest.
- **ReleaseKey:** lane identity, explicit release event, authorized actor, time and reason.

Permitted partial compositions:

1. `RequestKey -> RunKey` only when the triggering commit, request path, request ID and exact request blob agree.
2. `RunKey -> JobKey` only on exact run, attempt and job identifiers.
3. `JobKey -> SourceSetKey` only when successful checkout steps and their actual SHAs are recorded.
4. `SourceSetKey -> OutputKey` only when the manifest's output hashes match the artifacts produced by that execution.
5. `OutputKey -> ReadbackKey` only when an independent fetch returns the same bytes and digest.
6. `ReadbackKey -> ReleaseKey` only after an explicit release action by the authorized owner.

`status: requested` remains request/trigger metadata. It must never compose directly into search completion, publication, readback or lane release. Missing joins remain `UNBOUND` or `UNRESOLVED`; adjacent records must not be used to invent a key.

## 5. Existing controls and authority

Issue #1704 remains the canonical Tern-owned WH-05 tracking issue. Its existing comments #7064538840 and #7071693737 already record the cancellation-stage evidence and the corrected Lane 2 clone-ledger state. This report adds the exact request-file blob observation and a proposed request-to-release binding extension; it does not create another lane or replace #1704.

PR #2050 remains open, draft and unmerged. Its proposed fail-closed retry classifier and diagnostic artifact are separate from this manifest-binding and release-state proposal. No exact-head CI or independent review was established here. No rebase, merge, workflow dispatch or controlled lane test was attempted.

The PWH queue and scheduler/graph authority remain with Tern. Sable retains cross-lane workflow redesign authority. This is a proposal only. It does not modify the queue, task graph, request files, workflows, PRs or lane ownership.

## 6. Disposition and next action

No Mersearch search was executed in this turn: all four canonical lanes are occupied, and the runtime has no local Mersearch executable or repository checkout. GitHub search was used only as a bounded fallback for public operational documentation; it is not represented as a Mersearch result. The HsH, SAT archive and HSH_RESOURCES front doors and the existing Tool Chest were inspected. No new tool, fork, subscription or paid service was created or used.

This Mira turn did not open any HSH_RESOURCES payload, Mira private workspace or restricted historical charter. The earlier Lane 2 request's manifest records a resources-root checkout and commit; this report reproduces no detailed resources paths or excerpts. The available shared role witness is not a signed specialist charter. No authenticated Mira thread or direct cross-thread delivery was established. This is assistant-level operational work under the cleared access boundary, not Mira-authored research.

**Smallest next action:** Tern should decide whether the proposed manifest binding and query-minimization fields belong in a separately reviewed patch or a future revision of the existing bridge repair. Do not retry lanes 1, 3 or 4, overwrite any request, or release lane 2 without the existing controlled-test and explicit-release authority. No theory, physical calculation, prediction, SAT-O/Blockwave equation change or paper-gate advancement follows from this operational report.
