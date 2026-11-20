# Mercer h964:s3 | Pair-release coherence witness for Code Grurple A/B

**Nominal occurrence:** 2026-11-20T04:36:00Z  
**Run key:** `REVROT3-19-20261011:964:s3`  
**Disposition:** `P0_ACTIVE / 8_OF_8_PROTECTED_BLOBS_EXACT / ROUTES_NOT_OBSERVED / PAIR_COHERENCE_GAP_SPECIFIED / NO_GATE_CHANGE`

## 1. Selection, identity, and controlling remit

- `h=964`; `seq=5h+3=4823`; `4823 mod 19=16`.
- Selected ring label: **Mercer**, index 16.
- Next ring label: **Ravel**, index 17.

This is assistant reconstruction under a deterministic ring label, not authenticated participation by a historical Mercer instance or current Mercer thread. Personal-context retrieval found no verified usable Mercer conversation title/ID, last worker-authored message, or continuity pointer. The task's configured conversation target is not proof of current-run thread binding.

The historical direct source is raw HsH export blob `d828fef5352045cb4d9486fdbeabd04043c4c119`, conversation `6a3a2037-3698-83ea-924d-2cb8c4ac7701`, Nathan Direct user message `bb8ecf64-8863-4ee7-a078-ca8cc4104974`, timestamp 2026-10-01T20:56:07.264Z. It sets Mercer's ordinary historical :48 remit: equations, dimensional analysis, constitutive physics, coarse-graining, forces and quantitative consequences; each worker should read an old-archive file plus an HsH file, preserve source/invention boundaries, and avoid target-fitting old magic numbers or particle labels. No standalone signed Mercer specialist charter was recovered. The current Code Grurple override supersedes that ordinary remit for this activation. Lane 36 is a one-run architecture/verification overlay, not a permanent role reassignment.

The live Code Grurple roster blob `cc96c0bfafc95c54e7960899c7306031e5abce17` controls this activation: **Paper A+B presentation QA only** while P0 is active. It directs independent QA of both repaired public routes against pinned manuscript identities and the shared acceptance checklist, and explicitly prohibits reopening manuscript content. Tern retains P0 reconciliation/release authority. Manuscript content, scientific review, source hardening, route repair, site editing and deployment are outside this execution's authority.

## 2. Current P0 evidence

Pre-write HsH `main` was observed at `6c78f8379ee8ad13e2715b4757896193c36f401d` (2026-11-20T04:43:36Z). The eight protected P0 objects were independently fetched from `main`; all eight exact blob identities match the established vector:

| Protected object | Current blob | Result |
|---|---|---|
| Paper A accepted R1 source | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | MATCH |
| Paper B reviewed R1 source | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` | MATCH |
| Papers feed | `e3552fdac0f187b066b59a9742563094efffe011` | MATCH |
| Presentation Gate | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` | MATCH |
| Reader Routing Registry | `277a94c553e2e17b61bb046a04781b4e44f2229f` | MATCH |
| Presentation Contract | `b871249564a45278383e41eebd8aaa5d8c64aa3c` | MATCH |
| Generated PDF-series index | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` | MATCH |
| Viewer/Whirligig Pages workflow | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` | MATCH |

The feed still maps Paper A to accepted R1 blob `13d166...` and Paper B to reviewed R1 blob `0a1dca...`. A remains `sandbox_staged_accepted_r1` with no site version or posted date. B remains `sandbox_posted_reviewed_r1`, with historical `site_version=34` and `posted_date=2026-09-23`. The feed's `updated` field is 2026-10-21. These are source/editorial/feed facts, not current deployment or reader acceptance.

`PUBLIC_SITE/generated/papers.json` contains only Cruller-Rubin R0. Its PDF-series `reader.html?paper=` route is distinct from, and not an authorized substitute for, the two legacy Code Grurple routes:
- A: `paper.html?id=convergent-motifs-r1`
- B: `paper.html?id=boundary-weak-emission-r1`

Both remain `PRESENTATION_PENDING / LIVE_ROUTE_NOT_OBSERVED`. No route probe was made: no new authenticated browser context, owner preview, deployment identity, Sites editor/deployer, or new deployment trigger was found. P0 remains ACTIVE. No manuscript, feed, reader, renderer, route, site or deployment file was changed.

The existing PR #2009 remains OPEN / DRAFT / UNMERGED. Its head is `ee582b8de93f88f49445c211892529c40b47fded`; merge base is `d47be7cfacfa182aedaad17a9e0841eb80fdfddb`. A fresh comparison against pre-write main `6c78f8379ee8ad13e2715b4757896193c36f401d` is DIVERGED, 3 ahead / 1,614 behind. Each of the three changed paths (`PUBLIC_SITE/AUTOMATIC_DISCOVERY.md`, `tests/test_site_discovery.py`, `tools/site_discovery.py`) is byte-identical between current main and the merge base, while each PR-head blob differs. This supports a path-local clean rebase but does not prove a full rebase or authorize one. The PR body records local 4/4 unit tests and py_compile on the exact committed blobs; no exact-head Actions run was independently verified. No rebase, CI dispatch, merge or deployment occurred. The patch is default-deny discovery containment, not PDF production or legacy route repair. Tern retains authority.

Meridian's existing publisher issue #2160 is now `PUBLISHED_VERIFIED`: comment #7030575690, artifact blob `ce05c1d4dc863a73f2dc8d8ea1690f40c37404e3`, SHA-256 `83f586c94df41a5d2fd4d32e5789398d35c70f510776a25a747386ac69f53e2a`. The fetched workspace report and canonical artifact have identical Git blob SHA and exact content. This supersedes the earlier pending status in the optional packet; no retry or duplicate was made.

## 3. New architecture improvement: pair-level release coherence

The existing per-route `RouteObservationWitness` model binds each observation to its own route, deployment, source, derivative, capture, browser context and acceptance checks. Its status distinction is useful: `notObserved`, `unbound`, `observedFail`, and `observedPass`. The existing route-state crosswalk defines standdown as both manuscript gates plus `ROUTE_A_PASS` and `ROUTE_B_PASS`.

A remaining composition gap is that two individually passing route witnesses could, in principle, refer to different immutable deployments. The conjunction of two per-route passes does not itself assert that A and B were read from the same release snapshot. This is a workflow-integrity gap, not evidence that such a split deployment currently exists.

I specify a proposed **`PairReleaseWitness`** as an additional, non-authoritative composition layer:

- `paperA_witness` and `paperB_witness`, each retaining its full existing per-route evidence;
- exact expected A/B route IDs and pinned source blob identities;
- a common immutable `deployment_id`;
- a common deployment/release-manifest digest and build/source revision;
- provider attestation that this deployment is the current release at the acceptance snapshot;
- both route observation timestamps, browser versions, viewport profiles and capture digests;
- the existing per-route acceptance outcomes, without collapsing them into one undocumented Boolean.

Proposed pair states:

| Pair state | Condition |
|---|---|
| `pairNotObserved` | Either required route lacks an observation witness |
| `pairUnbound` | A witness is missing/malformed, source or derivative identity is stale, or deployment ID/manifest differs between A and B |
| `pairObservedFail` | Both witnesses bind to the same identified current deployment, but either route has an explicit observed failure |
| `pairObservedPass` | Both routes individually pass, both bind to the same immutable current deployment and manifest, and both source pins match the accepted R1 identities |

The pair predicate is therefore:

`PAIR_PASS = ROUTE_A_PASS AND ROUTE_B_PASS AND A.deployment_id = B.deployment_id AND A.release_manifest_sha256 = B.release_manifest_sha256 AND A.source_blob = PINNED_A AND B.source_blob = PINNED_B AND DEPLOYMENT_CURRENTNESS_ATTESTED`.

If the host uses per-route deployments rather than a site-wide deployment, the shared identity must be the provider's immutable release bundle/manifest that actually governs both routes; do not invent a common version label. Both observation timestamps must be retained. No numeric maximum observation skew is set here; that policy value belongs to Tern/site owner and must not be guessed.

### Operational test matrix

| Hypothesis | Shared parameters | Calibration/reference | Holdout | Observable | Standard comparator | Failure condition |
|---|---|---|---|---|---|---|
| A and B are accepted together from one current release | deployment ID, manifest digest, build/source revision, renderer/config identity | pinned A/B source blobs and existing per-route witness contract | two live legacy-route observations from the same release | route resolution, source binding, derivative digest, capture and twelve acceptance checks | existing per-route `RouteObservationWitness` / `STANDDOWN` conjunction | different/missing deployment binding => `pairUnbound`; explicit route failure => `pairObservedFail`; missing route => `pairNotObserved` |

This is an optional coherence witness, not a change to the controlling Presentation Gate, Code Grurple roster, or current standdown rule. Tern/Nathan must decide whether to adopt it. It does not authorize a route probe, site edit, renderer change, deployment, rebase or standdown.

## 4. Formalization and empirical limits

The pair predicate is logically formalizable, but a data-free Lean state-machine proof would require Nathan's explicit prior permission under BEDROCK. Existing PR #1471 is Tern-owned and already formalizes the per-route observation gate; it was inspected but not modified. No new Lean module, PR, build or proof is claimed.

Lean would verify only the encoded composition rule, not external deployment attestations, source/digest binding, live route truth or visual quality. No physical calculation, fit, prediction, independent measurement, H(s)H geometry-to-reader mechanism, SAT-O/Blockwave equation change or theory promotion was performed.

## 5. Archive reading, Mersearch and workflow health

Historical source reading: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/SRENA SAT2.txt`, blob `fe01fc85b1874c1573843724f035ee292fd48961`, lines 919–947. Nathan Direct's source text asks for a 4D Coulomb-repulsion map with two worldlines curving apart without contact and asks what distortion could produce attraction versus repulsion. The immediately following Kelvin-vortex/chirality/pressure-suction mechanism is assistant-generated continuation, not Nathan Direct. This is retained as an authorship boundary, not imported into the P0 presentation task. Next source cursor: line 948.

Mersearch was not callable in this runtime; GitHub code search was used only as a bounded fallback, not represented as a Mersearch run. All four canonical request lanes remain `requested`:
1. `calder-angle-geometry-source-fidelity-20261102-1337`
2. `archive-harvest-20261025-optics-01`
3. `calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001`
4. `kestrel-finite-core-geometry-source-fidelity-20261102-2200`

All twelve expected request-scoped outputs under `indexes/mersearch_requests/<request_id>/` (manifest plus two compact receipts per lane) returned 404. No lane was overwritten, retriggered, released or newly submitted. No local pinned Mersearch checkout was available. HSH_RESOURCES root README only; no private payload was opened or used. GitHub code search was only a bounded fallback, not a verified Mersearch execution.

Existing tools checked: Math Hopper #578 and PR #991 (extraction/coverage QA, not physical calculation); Whirligig Kernel 0 (sandbox-only restricted two-plane encoder); existing Lean PRs #1471/#2009 and the paper-series publisher. SciSpace is connected. The latest located three-repository fork census (Tern h857, November 15) reported zero forks for HsH, SAT_THEORY_ARCHIVE_2023-25 and HSH_RESOURCES; no fresh fork-count API was available in this run. No new tool, dependency, fork, subscription, paid service or expense was created.

Task graph: 18 records versus 16 declared branches; 5 completed, 12 active, 1 blocked. Across all records: P0=3, P1=2, P2=3, P3=1, P4=1, unclassified=8. WH-05 remains Mersearch-blocked; WH-02 remains Calder-owned/P1-HIGH. P0 is ACTIVE; P1 Orson cognition remains OVERDUE / NOT READY / Orson-owned; P2 geometry remains HOLD; P3 full theory remains INCOMPLETE. The campaign gates remain separate: November 9 minor gate missed; November 30 major geometry paper remains HOLD; December 14 full-theory paper remains INCOMPLETE. No paper gate advanced. FIE next review is November 24; no premature re-review was performed. The recent unrelated-reading break remains the Ravel h961:s0 record; no duplicate lateral break was performed.

## 6. Incoming handoff and successor

The Meridian h964:s2 packet `WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-20T0424Z_from_s2_to_s3_mercer.md` (blob `48a90d01721424d758f367db0575b3532f360d14`) was read at run start. Its Amendment 01 (blob `daccb48c63b5322cf7bd099daa226ae1277d06d9`) supersedes the packet's initial pending status: issue #2160 is now PUBLISHED_VERIFIED. The packet remains optional repository context, with no task or response obligation. Mercer INBOX consumption is recorded separately.

## 7. Successor and automation

Next ring label: Ravel, index 17. The historical Ravel Free Build export `6acb1336-f250-83ea-b330-ab3e2ff30f3e` has 814 nodes and an active branch ending 2026-10-17T08:01:31Z, but the Ravel README and INBOX explicitly say no authenticated current writable thread is established. The packet is therefore repository-only optional context, not direct ChatGPT-thread delivery, consumption, acknowledgment, assignment, response obligation or ownership transfer.

The existing :36 task remains enabled and unchanged:
- ID `6a9f52b69ec08191b0a2ba24a074f781`
- exact DTSTART `20261001T143600`, America/New_York
- hourly recurrence
- prompt and phase unchanged
- current run `a15de2f2-2870-832a-aa6a-64daad7f0ace`, scheduled 04:36Z, started 04:38:05.688475Z, recorded IN_PROGRESS, completion null, `chat_ref=null`
- cached `latest_result` belongs to prior h963:s3 run `ac6992a5-d2b0-8333-8116-7766e32ddf0b`, completed 04:14:22Z; it is not the current run's result
- inventory `last_run_time=04:14:28.486010Z` is older than the current `last_run` record and is not a completion signal

The existing :48 task ID `6aa6c3bc02b48191b0a2ba24a074f781` remains enabled with its exact original hourly :48 schedule. Its per-ID peek was inaccessible, but the global inventory confirmed the task and schedule. The :00 and :24 tasks remain enabled; :12 remains disabled. Four Workshop Relay tasks are enabled, five exist including the disabled :12 task. No sixth task, task mutation, prompt/phase change, signet or conversation rename.

**Return pin:** `H964:S3 / MERCER-RING-LABEL-ASSISTANT-RECONSTRUCTION / P0-PAIR-RELEASE-COHERENCE-WITNESS-PROPOSED / 8-OF-8-PROTECTED-BLOBS-EXACT / ROUTES-NOT-OBSERVED / ISSUE2160-VERIFIED / MERSEARCH-4-LANES-OCCUPIED-12-OUTPUTS-MISSING / TERN-RELEASE-AUTHORITY / RAVEL-OPTIONAL-PRESTART / TASKS-UNCHANGED / NO-SIXTH-TASK`
