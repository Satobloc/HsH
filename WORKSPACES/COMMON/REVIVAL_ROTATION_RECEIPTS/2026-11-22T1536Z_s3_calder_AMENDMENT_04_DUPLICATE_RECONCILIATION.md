# Amendment 04 | Calder h1023:s3 duplicate-run reconciliation and state corrections

**Amends:** `WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-22T1536Z_s3_calder.md` and the h1023:s3 report's operational-status statements.  
**Run key:** `REVROT3-19-20261011:1023:s3`  
**Disposition:** append-only reconciliation. The original receipt, report, publisher artifact, issue #2353, PR #2167 and Lean run are not rewritten. This invocation is a duplicate of the already-completed nominal slot, not a second research execution.

## 1. Existing work and duplicate guard

The unique h1023:s3 receipt, report and publisher artifact were read from current main. The exact run-key search returned the report and canonical published artifact; no second canonical receipt or competing run-key artifact was found.

Existing completion evidence remains:
- Publisher issue [#2353](https://github.com/Satobloc/HsH/issues/2353), PUBLISHED_VERIFIED; SHA-256 `a0409909c776772fe4f1b1763086369e8fa6b471cdfd746996cc5207b4a916de`; publisher comment #7081155959.
- Existing PR [#2167](https://github.com/Satobloc/HsH/pull/2167), branch `research/calder-versioned-product-coverage-20261120t0636z`, head `ed0f3da9c621fd1353b7c66d28656908ce5615a2`, OPEN / DRAFT / UNMERGED.
- Exact-head Lean run [#45036936408](https://github.com/Satobloc/HsH/actions/runs/45036936408): SUCCESS, 8,959 jobs, exact checkout identity asserted; changed module blob `b5285404f7ebd81220cf7be381cbb34e82918789`.
- Existing successor packet and Hale INBOX pointer were read back. They remain optional repository-only context; no ChatGPT-thread delivery, consumption or acknowledgment is claimed.

No second report, receipt, PR, issue, build, calculation, publication or handoff was created.

## 2. Mersearch status correction

The h1023 report's section 5 stated that no request-scoped manifests or receipts were found. That statement is superseded by this fresh readback.

All four request files still have `status=requested`:
- Lane 1: `calder-angle-geometry-source-fidelity-20261102-1337`.
- Lane 2: `perceptual-nexus-early-archive-20261120-01`.
- Lane 3: `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`.
- Lane 4: `kestrel-finite-core-geometry-source-fidelity-20261102-2200`.

Lane 2 has an existing manifest and compact receipt:
- Manifest blob: `42003e19e2027c8c0cecdbcbf4528679a005e439`.
- JSON receipt blob: `8b8d798adb65cdcdb2885107a7b014df616215b5`.
- Human receipt blob: `bfab82de4a88c791b04cad2e8ed660064d77ebb6`.
- Stable tool: Mercer_Searcher_1.0, ref `mersearch-stable-1.0`, commit `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`.
- The manifest records all three repositories at pinned source commits: SAT archive `d10dd333f2487054807bda398995300c538caa7e`, HsH `2c0df511907dfbf45756a1971c7dc654c8aac257`, HSH_RESOURCES `f39742b5a7d34578cea9218202b8641978038aef`.
- Coverage: 22,755 files, 22,827,574 records, 6,850 hits, 1,181 distinct sources; root counts archive 2,731, HsH 3,740, resources 379.
- The query concerns perceptual-nexus terminology, not this Calder GWOSC evidence-binding work.
- The compact receipt explicitly derives from withheld raw results and is not an exhaustive result listing. No source excerpts or detailed HSH_RESOURCES paths are published. The manifest records `mersearch_requests` exclusion and a runtime-only TOOL_NAME/TOOL_VERSION hotfix; the pinned stable branch itself was unchanged.

Lane 1, Lane 3 and Lane 4 manifest/receipt paths returned 404. Lane 2's request field remains `requested`; the bridge does not mutate that field. **No lane is declared released or idle.** No request was overwritten, retriggered or submitted. The earlier claim that all request-scoped outputs were absent is superseded; the claim that all four requests remain requested is still correct.

## 3. Live automation snapshot

A private exact-ID readback confirmed:
- Task ID: `6a9f52b69ec08191b0a2ba24a074f781`.
- Enabled: `true`.
- Title: Workshop Relay :36 | Worldtube.
- Exact saved schedule: `DTSTART;TZID=America/New_York:20261001T143600` with `RRULE:FREQ=HOURLY`.
- Saved prompt matches the current Lane Charter 36 instruction; no task field was changed.

At the readback during this invocation, the scheduler reported:
- `last_run.id`: `37d67a90-cb78-8325-bc42-641105d8a143`.
- `scheduled_for`: `2026-11-22T15:36:00Z`.
- `started_at`: `2026-11-22T15:33:52.062393Z`.
- `recorded_status`: `in_progress`; `completed_at=null`; `chat_ref=null`.

The separate cached `latest_result` was:
- `run_id`: `5d2eec8c-c640-832e-8d66-999865be764b`, not the current `last_run.id`.
- `scheduled_for`: `2026-11-22T14:36:00Z`, not the current 15:36Z slot.
- `created_at`: `2026-11-22T15:18:34.435599Z`, before the current run started.
- Its content text names h1023:s3 even though its scheduler slot is 14:36Z (h1022).

Therefore the cached result is not attributable to the current run. Its content/slot mismatch and the stale `last_run_time` summary (15:18:37.162373Z) are scheduler-observability anomalies. Cause and attempt ordinal are not exposed. Do not infer another worker, a second run key, or current-thread identity from them. The current run remained IN_PROGRESS at readback.

## 4. Historical identity and scope

The best available empirical/null-design Calder role witness remains the 2026-09-12 self-report in `WORKSPACES/COMMON/CHECKINS.md`, blob `886069e71d4aec7a3f8d199d6d889b930a05c17e`, lines 55–106. It supports angle-clustering, adversarial null design, independent observational units, source/method pseudo-clustering controls and statistical calibration. It is not a signed Nathan Direct specialist charter.

The separate `⚗️ CALDER [Construction Story Retelling]` conversation ID `6a8eacca-c470-83ea-af92-8fb8df194de9` is the Foundational Covariance / Global Architecture Calder identity, not the empirical/null-design Calder. The empirical Calder conversation ID remains UNKNOWN; no authenticated current Calder thread or historical-instance participation is claimed. The h1023 work remains assistant reconstruction under the deterministic ring label.

## 5. Project and successor boundaries

- P0 Code Grurple: ACTIVE / Tern-controlled.
- P1 Orson cognition: OVERDUE / NOT READY / ORSON-OWNED.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- Latest full FIE review: November 20; next review December 4.
- Latest unrelated-reading break: November 21; no new break was due.

No raw GWOSC bytes or calibration/PSD/DQ/covariance package was acquired. No physical calculation, fit, H(s)H prediction, calibration/holdout result, independent measurement or falsification threshold was produced. No SAT-O/Blockwave equation change or BEDROCK promotion occurred.

Next deterministic label remains Hale. The existing optional packet and Hale INBOX pointer are already present; no duplicate packet or assignment was created. Chat delivery remains unavailable and recipient consumption/acknowledgment unverified.

## 6. Write and mutation boundary

No local HsH checkout was present in the runtime, and no existing Actions workflow suitable for an internal append-only receipt amendment was identified; the issue publisher is the public-submission path, not an internal receipt writer. The bounded GitHub Contents API fallback was used for this internal correction with fresh blob-SHA compare-and-swap on replacements, followed by independent readback.

No automation task, task ID, enabled state, schedule, prompt, phase, branch ownership, Mersearch request or lane was changed. No sixth task, new branch, PR, public issue or duplicate publication was created.
