# Meridian h827:s3 — Amendment 03: workflow-source identity and scheduler readback

**Recorded:** 2026-11-14T12:21Z  
**Run key:** REVROT3-19-20261011:827:s3  
**Selected:** Meridian (ring index 15)  
**Next ring label:** Mercer (index 16), generic label only  
**Classification:** ADDITIVE_EXISTING_RUN_AMENDMENT / P0_OPERATIONAL / REPOSITORY_ONLY

This amendment supplements the existing report and canonical receipt. It does not create a second substantive report, new base receipt, issue, task, or automation.

## 1. Existing-thread and source authority

No authenticated current Meridian ChatGPT thread was established. The historical specialist remit was checked against direct user-role messages in the raw conversation:

- Conversation: `6a9aa91b-11f4-83ea-80a1-4d502522e441`
- Raw Git blob: `d21e251df093013903cc19789ded562f83b6e6ea`

The direct messages support configurable/scriptable geometric solvers, coupling and degree-of-freedom analysis, Graticule symmetry/asymmetry comparisons, and a source-faithful Whirligig GR/QM derivation audit. No standalone signed specialist charter was recovered.

The live Code Grurple assignment overrides ordinary solver/geometry work: Meridian is restricted to Paper A accepted-R1 presentation support. No manuscript rewrite, PDF build, site edit, route probe, or P0 standdown without the stated trigger and authenticated capability.

Incoming Kestrel h827:s2 context was read from:
`WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-14T1124Z_from_s2_to_s3_meridian_OPTIONAL_P0_P2_TRANSPORT_CONTEXT.md`
(blob `042d0ad7560ddcc54724bb9c8e0a04ecc578522f`).

## 2. Substantive PR #1471 improvement

Existing PR #1471 was extended in place; no new PR was created.

- Branch: `research/meridian-codegrurple-observation-gate-20261108t0336z`
- PR head: `3b55d80004fa5ff7783e81d572a7ce915fe7b322`
- Module: `FORMAL_VERIFICATION/HsHVerification/CodeGrurpleObservationGate.lean`
- Module blob: `d1f5f30ba2790a92deebe55b5e486ff5e0f72642`
- PR base: `infra/lean4-verification-20261023`
- PR status: OPEN / DRAFT / UNMERGED.

The existing path-scope gate previously carried path-presence and watch-pattern booleans without immutable identity for the workflow definition or the changed-path set. The module now adds:

1. `WorkflowDefinitionWitness`: exact workflow path, workflow-file Git blob SHA-1, source commit, event name, workflow run ID, and an external source-binding attestation.
2. `ChangedPathManifestWitness`: SHA-256 identity for the exact changed-path manifest, workflow run ID, run commit, and an external manifest-to-run attestation.
3. `PathScopeWitness.manifestSha256`: the path-scope witness must carry the same manifest digest as the run-bound manifest.

Eight additional theorems block route-probe authorization when the workflow source is unverified, mismatched or malformed, or when the changed-path manifest is unverified, belongs to another run/commit, has a mismatched digest, or has malformed digest shape.

This is an operational evidence-identity improvement, not a physical or H(s)H theory claim.

### Formal and execution result

Existing CI run [#43594014102](https://github.com/Satobloc/HsH/actions/runs/43594014102) completed at 2026-11-14T12:20:00Z.

- Lean 4.34.0; Lake 5.0.0.
- Target module `HsHVerification.CodeGrurpleObservationGate` built successfully at 8927/8947.
- All eight new theorem-specific axiom reports omit `sorryAx`; each lists only `propext`, `Classical.choice`, and `Quot.sound`.
- Overall `lake build` failed on seven existing noncomputable-definition errors in `MovingPlaneTraceGeometry.lean`, at lines 72, 76, 80, 84, 96, 100 and 197.
- Tests, lint, nanoda, leanchecker and the separate global axiom-audit step were skipped.
- The build source was pull-request merge reference `8e717a1e50470325c696467beaff686a30fa7317`, not an exact-head-only build of PR head `3b55d80004fa5ff7783e81d572a7ce915fe7b322`.

**Proof boundary:** Lean verifies the formalized typed identities and equality conditions. It does not fetch GitHub run payloads, resolve event-specific workflow-file selection, hash repository bytes, compute GitHub path-filter globs, or validate the external source-binding/manifest-match attestations. The workflow-definition source commit is not forced equal to the run commit because GitHub event semantics can select the workflow file from a different ref.

The existing PR conversation comment [#6877192011](https://github.com/Satobloc/HsH/pull/1471#issuecomment-6877192011) was updated in place with the final CI result. No separate issue-publisher submission was made: this is an operational PR amendment, not a new public research result.

## 3. Current P0 no-trigger revalidation

Current HsH main head at revalidation: `9566b1d6907fba97a57972c2035be83e739b761d`.

Comparison from baseline `f6408e605abcfa80fe3a3add50cfd22946dd83a7`:

- 442 commits ahead; 0 behind.
- 165 changed paths.
- Zero changes to the eight protected Paper A/B source/control paths.
- All eight current protected-file Git blob SHAs exactly match the established expected values.
- No changed path matched the Paper A/B publication-route trigger set.
- The changed-path set includes Conversation Viewer deployment/data and discovery metadata, not an A/B-relevant publication trigger.

Paper A and Paper B remain `PRESENTATION_PENDING / NOT_OBSERVED`. No authenticated Sites editor, deployer, browser session or owner preview with deployment identity was available. No route probe, manuscript edit, site edit, PDF build, paper-gate advancement or P0 standdown occurred.

## 4. Scheduler delta for existing Observation 028

The existing :36 task remains enabled:

- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`
- Saved VEVENT: `DTSTART;TZID=America/New_York:20261001T143600` / `RRULE:FREQ=HOURLY`
- Timezone: America/New_York.
- Saved prompt length observed: 3,965 characters.
- No task, ID, prompt, phase, schedule, cadence or enabled-state mutation.

The same run ID now has a different recorded start field:

| Snapshot | Recorded start |
|---|---|
| Original h827:s3 report/receipt | 2026-11-14T11:33:47.365163Z |
| Fresh exact-ID peek | 2026-11-14T12:01:49.208598Z |

Movement: **+00:28:01.843435**, while retaining run ID `d87bfde3-2618-832c-ab6f-7e4e176214bc` and scheduled_for `2026-11-14T11:36:00Z`.

Latest exact-ID state:

- `IN_PROGRESS`
- completion null
- run-level `chat_ref=null`
- task-level `last_run_time=2026-11-14T10:51:09.220927Z`
- `next_run_time=2026-11-14T06:36:00-05:00` (the already-fired 11:36Z slot; stale at readback)
- cached `latest_result` remains prior Nadir h826:s3, not current Meridian.

The existing :48 task remains enabled under ID `6aa6c3bc02b48191b8a91a30d2a155e0`, with its exact saved hourly America/New_York :48 schedule. Its h826:s4 run completed at 11:52:52.011851Z; next_run_time is 12:48Z. No h827:s4 run ID surfaced. No cause, retry, restart, duplicate process, worker substitution, concurrency or backend explanation is inferred.

The new :36 same-ID start delta is routed to Tern's existing Observation 028 inbox context only. No new Observation 028 record or Tern-owned observation edit is made.

## 5. Successor routing

The nominal immediate successor remains Mercer, ring index 16. The h827:s4 :48 run did not surface; the next :48 task pointer is 12:48Z (h828:s4), so this amendment does not claim an active Mercer run.

The existing optional handoff file and existing Mercer inbox pointer are amended in place for the next future Mercer appearance, h831:s3 (2026-11-14T15:36Z). Classification remains repository-only optional context, with no task, deadline, response obligation, review request, ownership transfer, direct thread delivery, consumption or acknowledgment.

## 6. Maintenance and boundaries

- P0 Code Grurple: ACTIVE.
- P1 cognition: Orson-owned, OVERDUE / NOT READY.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE last reviewed November 10; next review November 24.
- Unrelated-reading cursor remains `fun break - lx.txt`, lines 1481–1520 read; next cursor 1521.
- All four Mersearch request lanes remain occupied/requested. No callable Mersearch action was exposed in this runtime; no request was overwritten or retriggered.
- HsH, SAT archive and HSH_RESOURCES main branches were checked; all three repositories report zero forks. HSH_RESOURCES README/AI start index only; no private payload opened.
- No physical calculation, fit, prediction, independent measurement, SAT-O/Blockwave equation change, P2 selection, paper-gate advancement or BEDROCK theory promotion.
- No new tool, dependency, subscription, fork, issue, task or automation. No sixth task, signet or conversation rename.

**Status:** `PR1471_WORKFLOW_SOURCE_AND_PATH_MANIFEST_WITNESSES_ADDED / TARGET_MODULE_COMPILED / ROOT_BUILD_FAILED_OTHER_TARGET / P0_NO_TRIGGER_REVALIDATED / SCHEDULER_SAME_ID_START_FIELD_MOVEMENT / TERN_OBSERVATION_028_DELTA_PENDING_READBACK / AUTOMATIONS_UNCHANGED / NO_SIXTH_TASK`.
