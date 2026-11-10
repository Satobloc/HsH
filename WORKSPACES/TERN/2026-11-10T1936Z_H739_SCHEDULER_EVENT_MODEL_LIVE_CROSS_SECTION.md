# Tern Rook h739:s3 | Live scheduler event-model validation

**Nominal slot:** 2026-11-10T19:36:00Z  
**Actual automation run:** `a76717f9-ca88-8330-8ec5-4fa85d5d2eed`  
**Run started:** 2026-11-10T19:32:23.918795Z  
**Status at captured readback:** IN_PROGRESS / no completion / `chat_ref=null`  
**Run key:** `REVROT3-19-20261011:739:s3`  
**Evidence class:** live read-only scheduler snapshots + source-grounded role recovery + Lean formalization submitted to an existing draft PR.  
**Disposition:** NEW SUBSTANTIVE CONTROL-PLANE VALIDATION / LEAN CI PENDING / NO SCHEDULER MUTATION.

## 1. Deterministic selection and authority

```
h = 739
seq = 5*739 + 3 = 3698
3698 mod 19 = 12
selected = Tern Rook (index 12)
next = Morrow (index 13)
```

The next :48 nominal occurrence is h739:s4, Morrow. The fixed ring and calculation are formalized in the new Lean module referenced below.

No standalone Nathan-authored Tern charter was recovered. The source-grounded Comptroller remit is supported by direct user-role messages in the Ariadne raw export:
- `c4f0aae9-3290-42c6-a5d0-b42c19a88255`: Comptroller controls scheduled tasks.
- `e689eb6e-5814-4a27-a366-796605bd5f4d`: hourly workflow/state inspection, discretionary allocation, and scripted/Python offload study target.

The archived `Space Shuttle Roderick — Tern` source (blob `27932a0ca8045c8d53bf01863e1a54e9dc809ae4`) contains 34 user-role messages reviewed for context; it is not a separate standalone charter. The current automation has no authenticated Tern thread reference. This is source-grounded execution, not authenticated historical Tern participation.

Existing-thread-first lookup for Morrow did not establish an authenticated current Morrow thread. The archived Morrow conversation `6a9ee7ca-d340-83ea-b99d-6a3097429f36` and prior repository handoffs are historical continuity evidence only. Any Morrow pointer below is repository-only optional context.

## 2. Live scheduler cross-section

Read-only peeks were taken for all four enabled Workshop Relay leases. The connector does not expose a per-peek `observed_at`, attempt identifier, or complete run history. The exact scheduler fields are preserved; no collector timestamp is invented.

| Lease | Task ID | Exposed `last_run` ID | `scheduled_for` | `started_at` | Status | `last_run_time` | `updated_at` |
|---|---|---|---|---|---|---|---|
| :00 | `6aa1fe0de5e48191b886496095b1343f` | `6e050ef5-e164-8321-ba3b-7cc1503faad7` | 19:00:00Z | 19:28:33.380978Z | IN_PROGRESS | 18:14:18.883413Z | 18:14:42.847694Z |
| :24 | `6abda4c8eda88191b0a2ba24a074f781` | `cbbfaafc-101c-8328-b313-0b157e6ff80d` | 19:24:00Z | 19:28:32.211062Z | IN_PROGRESS | 19:00:01.108166Z | 19:00:29.918349Z |
| :36 | `6a9f52b69ec08191b0a2ba24a074f781` | `a76717f9-ca88-8330-8ec5-4fa85d5d2eed` | 19:36:00Z | 19:32:23.918795Z | IN_PROGRESS | 18:45:29.498981Z | 18:45:52.132103Z |
| :48 | `6aa6c3bc02b48191b8a91a30d2a155e0` | `42528615-b27c-832b-8240-31250c2deac3` | 17:48:00Z | 18:52:18.567179Z | FAILED | 19:17:22.567149Z | 19:17:44.244551Z |

All four exposed `chat_ref` values are null.

### Result-pointer separation

| Lease | `latest_result` | Match to exposed `last_run`? | Interpretation |
|---|---|---|---|
| :00 | null | N/A | No cached result exposed |
| :24 | `db03de04-5428-8326-9452-9c5835bda6a3`, scheduled 17:24Z, completed 18:59:58.404598Z | No | Older h737:s2 Loom result |
| :36 | `49d2c5d9-dcfc-832e-bdc5-1af4b7a4327f`, scheduled 17:36Z, completed 18:45:25.520432Z | No | Older h737:s3 Aster result |
| :48 | `42528615-b27c-832b-8240-31250c2deac3`, completed 19:17:20.573240Z | Yes | Same exposed run, but its recorded status is FAILED |

A matching result ID is not a success flag. A nonmatching result is not current-run output.

### Exact arithmetic from the observed timestamps

All values below are arithmetic over the transcribed UTC timestamps, not claims about scheduler internals.

| Lease | `started_at - scheduled_for` | `started_at - task.last_run_time` |
|---|---:|---:|
| :00 | +1,713.380978 s | +4,454.497565 s |
| :24 | +272.211062 s | +1,711.102896 s |
| :36 | −216.081205 s | +2,814.419814 s |
| :48 exposed h737 record | +3,858.567179 s | −1,503.999970 s |

The :24 run started **1.169916 seconds before** the :00 run even though its nominal slot is 24 minutes later. The :36 run started 3m36.081205s before its own nominal time. The :00 and :24 starts are therefore nearly simultaneous and out of nominal order.

The task-level `last_run_time` precedes the exposed `started_at` on :00/:24/:36, but follows it on :48 by 25m03.999970s. It is not a substitute for `last_run.started_at`. `updated_at` is likewise retained as a separate raw task-level field.

### Rotation attribution and stored VEVENT

The stored America/New_York hourly VEVENTs remain:
- :00 `DTSTART;TZID=America/New_York:20261001T140000`
- :12 `DTSTART;TZID=America/New_York:20261001T141200` (disabled)
- :24 `DTSTART;TZID=America/New_York:20261001T142400`
- :36 `DTSTART;TZID=America/New_York:20261001T143600`
- :48 `DTSTART;TZID=America/New_York:20261001T144800`

On November 10, the current :00/:24/:36 `scheduled_for` values (19:00/19:24/19:36Z) match their stored local-time conversions. The :48 exposed `last_run` still points to 17:48Z, which is h737:s4 and selects Ariadne, not the upcoming h739:s4 Morrow. The latest peek does not expose a current h739:s4 record. This is not evidence that an intervening occurrence was skipped or never ran; the API exposes only a latest pointer, not full history.

The earlier two-hour :24/:36 discrepancy recorded in Tern inbox is not reproduced by these newer current-slot :24/:36 records. The :48 current-slot mapping remains unobserved because its exposed record is still the older h737 occurrence. No global timezone repair or resolution is claimed.

## 3. Architecture improvement: separate lease metadata from run observations

The existing Enheduanna scheduler event-model proposal (2026-11-07, blob `c37afad6f9e0fdb38b143c02d624cc74999d2701`) already separates nominal occurrence, run-record, observation, attempt, result, and delivery identities. This live four-lease cross-section validates that model and adds a sharper schema boundary.

Recommended record separation:

```
LeaseMetadataSnapshot {
  automation_id, raw_ical, enabled, task_last_run_time, task_updated_at
}

RunRecordObservation {
  automation_id, run_id, scheduled_for, started_at,
  recorded_status, completed_at, chat_ref
}

LatestResultPointer {
  automation_id, result_run_id, scheduled_for, created_at, completed_at
}

CollectorObservation {
  collector_observed_at, source_action, raw_snapshot_digest
}

AttemptIdentity {
  backend_attempt_id | UNKNOWN
}
```

Keep the existing keys:
- `NominalOccurrenceKey = (automation_id, scheduled_for)`
- `RunRecordKey = (automation_id, run_id)`
- `ObservationKey = (automation_id, run_id, collector_observed_at)`
- `ResultKey = latest_result.run_id`

The new refinement is to keep `task_last_run_time` and `task_updated_at` in a distinct lease-metadata record rather than treating them as fields of the current run observation. The :48 sample would violate any naive equality/order assumption: its task-level `last_run_time` is later than the exposed run's `started_at`, while the other three are earlier. Their semantics remain undocumented.

Attribution rules:
1. Select the ring identity from the run's `scheduled_for`, never `started_at`, `last_run_time`, completion order, or result creation time.
2. Attribute cached result content only when both `run_id` and nominal slot match.
3. Preserve every observation of a changing record; do not synthesize attempt IDs from timestamp changes.
4. A matching result pointer can describe a FAILED run; status and result identity remain separate.
5. A null `chat_ref` does not authenticate absence of a thread, refusal, or failed delivery.
6. Do not infer retries, restarts, skipped slots, or backend cause from these snapshots.

This is a source-backed workflow/schema recommendation, not a deployed scheduler change. Tern retains Comptroller authority.

## 4. Lean 4 / Mathlib formalization

Existing tooling was checked first:
- Current Tern PR #824 is the existing formalization branch; no new branch or PR was created.
- Existing Math Hopper issue #578 / PR #991, Whirligig Kernel 0, and connected SciSpace were checked as reuse routes.
- No local `lean`, `lake`, or `elan` executable exists in this runtime.
- The pinned Lean 4.34.0 workflow on the existing PR branch is the available actual-build route.

Added to the existing PR #824 branch `research/tern-dim-provenance-signloss-20261028t01z`:
- New module: `FORMAL_VERIFICATION/HsHVerification/TernH739SchedulerSnapshotEvidence.lean`
- Module blob: `4c999f844abddcebc65021699887b8ffbe2136c6`
- Module commit: `8b8e96a1b0416286dac2e575368dd9eba7f31482`
- Root aggregator update: blob `83c6e4112bb48fb57a460390ae45084ea4fae665`
- Aggregator commit / current PR head at submission: `18877e99a89b76a155efab834762c2a837fa0e14`

The module formalizes:
- h739 selection for :00 Elias Kern, :24 Enheduanna, :36 Tern, :48 Morrow;
- the older exposed :48 h737:s4 record selecting Ariadne;
- exact start offsets for the four exposed records;
- the differing ordering of task-level `last_run_time` relative to `started_at`;
- absent/stale/matching `latest_result` cases, including a matching result on a FAILED run.

No `sorry` or `admit` text appears in the new module. That source inspection is not compilation evidence.

**Actual CI state at last check:** Lean workflow run #42887967468, job #130081258780, was IN_PROGRESS at “Generate Lake dependency manifest”; compilation had not yet started. Status is `SUBMITTED_NOT_VERIFIED`, not LEAN_VERIFIED. The current PR #824 remains OPEN/DRAFT/UNMERGED, 40 commits / 16 changed files, with no independent review. Its title/body still describe a narrower unsigned-incidence proof, so the PR is not merge-ready; do not merge or promote this operational module as physics.

A separate push-triggered `conversation-json-content-ci.yml` run #42887955864 failed with zero jobs exposed. It is not the Lean run; no diagnostic or causal relation to the Lean module is established.

The module proves only arithmetic and finite equality propositions over the transcribed scheduler observations and supplied ring. It does not authenticate the scheduler API, prove the transcription sound, explain backend behavior, establish attempt identity, worker/thread identity, delivery, or any physical H(s)H proposition. No Factory Floor scientific intake or theory promotion is claimed while CI is pending.

## 5. Three-repository/tool and freshness checks

- HsH onboarding, BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, Revival Rotation V3, thread-first routing, scheduler authority, duplicate-run-key guard, Tern continuity/inbox, current task graph, current automation roster, and current receipts were read.
- SAT archive README and historical navigation were read; original notation/provenance remain separate from current HsH reconstruction.
- HSH_RESOURCES README and `HQ/TOOL_CHEST.md` were read; its private-reference boundary was respected.
- No Mersearch connector or local pinned checkout is exposed. All four actual request lanes remain `requested`: Lane 1 Calder (`MERSEARCH_REQUEST.json`), Lane 2 optics, Lane 3 Calder IRI/worldtube, Lane 4 Kestrel finite-core. `MERSEARCH_REQUEST_LANE_1.json` is unwired/orphan and not a fifth lane. No request was overwritten, retriggered, or created. Bounded GitHub reads/search were fallback, not a Mersearch run.
- No new tool, dependency, fork, subscription, paid service, API spend, or cost.
- FIE full rereview was completed 2026-11-10 00:17Z by the existing review record; next due 2026-11-24. No duplicate rereview.
- Deliberate unrelated reading: Charles Babbage, *Reflections on the Decline of Science in England*, HSH_RESOURCES blob `fa52e41ab73566a13109a0a7aeaed3e895b41163`, lines 1861–1900. The passage concerns Royal Society/Admiralty appointments and institutional dependence of scientific advisers. Next cursor: line 1901. This is lateral reading, not H(s)H evidence. No physical break is claimed.

## 6. Project gates and boundaries

- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition: OVERDUE / NOT READY; Orson-owned and protected.
- P2 November 30 geometry: HOLD; no selected measured system with complete provenance, units, calibration, covariance and uncertainty.
- P3 December 14 full-theory manuscript: INCOMPLETE.
- Task graph: `branch_count=16` versus 18 actual branch records; unchanged and unresolved.
- No physical system or dataset selected; no physical calculation, fit, prediction, observational validation, or data-free physical fixture.
- No SAT-O/Blockwave equation edit, BEDROCK change, or theory promotion.
- No task, automation, ID, prompt, schedule, phase, cadence, enabled-state, or task-count change; :12 remains disabled; no sixth task.
- No public issue/publisher submission: this is internal scheduler-control-plane evidence, not public scientific content.

## 7. Next cursor

1. Check Lean workflow #42887967468 to terminal state; inspect full job log, toolchain, build result and theorem-specific `#print axioms` output. If successful, follow the existing formal-verification/Factory Floor routing rule only to the extent the artifact is eligible; do not call it physics validation. If failed, repair only the specific Lean error on the existing branch and rerun.
2. Preserve the scheduler snapshot model; do not infer skipped runs or retries from latest-only peeks.
3. Tern retains scheduler/task-graph reconciliation. The next deterministic ring label is Morrow at h739:s4; repository pointer is optional context only.
4. Keep PR #824 draft/unmerged until its accumulated 16-file scope, current-base status, CI and independent review are reconciled.

No task or response obligation is assigned to Morrow.


## Amendment 01 — Lean CI terminal readback | 2026-11-10T19:47:42Z

The existing PR workflow completed successfully:
- Actions run #42887967468: `success`; job #130081258780 (`verify`): `success`.
- PR head: `18877e99a89b76a155efab834762c2a837fa0e14`.
- Actual checked-out merge-ref commit printed by the job: `143d6326ecd00da980463bba3e9ffe6195d21180`.
- Lean 4.34.0 (commit `293d5d0c0c3f3dded4688b3ccd6a33939ac5102b`); Lake 5.0.0.
- Full formal library: 8,959 build jobs; `TernH739SchedulerSnapshotEvidence` and root `HsHVerification` built; build completed successfully.
- The new module blob is identical at PR head and merge ref: `4c999f844abddcebc65021699887b8ffbe2136c6`. The merge-ref aggregator blob is `421456bd81a24bde6a4b0b72ee838c463355f307`, differs from the branch aggregator because the base contributes other imports, and was independently checked to contain the new module import. Thus: `MERGE_REF_BUILD_SUCCESS / EXACT_PR_HEAD_NOT_STANDALONE_BUILT`.
- The 17 theorem-specific `#print axioms` outputs show five ring-name/list-lookup theorems depend on standard `propext`; the other 12 numeric, status and result-pointer theorems report no axioms. No `sorryAx`, `admit`, or compiler errors were found in the decoded job log.
- Automatic axiom-audit, tests and lint steps were skipped by workflow configuration. The `#print axioms` commands in the module did execute. No separate automated axiom audit or test/lint run is claimed.

This upgrades the module from `SUBMITTED_NOT_VERIFIED` to `LEAN_VERIFIED_ON_MERGE_REF`, with the exact-PR-head limitation preserved. It proves only the formalized finite arithmetic/equality statements over the transcribed scheduler records and supplied ring; it does not prove scheduler API truth, source transcription, backend semantics, attempt identity, thread identity, delivery, or any physical proposition.

The Factory Floor geometry-first admission gate requires an object-specific precise geometric plot and independent hostile fidelity review. This module is an operational scheduler-control proof, not a geometric/physical object model; it is not eligible for scientific Factory Floor intake. No Factory handoff or theory promotion is made.

PR #824 remains OPEN/DRAFT/UNMERGED (40 commits, 16 files), with no independent review. Its title/body scope mismatch remains a blocker to merge. A separate push-triggered `conversation-json-content-ci.yml` run #42887955864 failed with zero jobs exposed; it is not the Lean workflow and no causal relation is established.
