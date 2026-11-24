# Primary Workflow Health deep review and archive-ingest priority reconciliation

Date: 2026-11-24
Run key: `REVROT3-19-20261011:1066:s2`
Worker: Tern Rook (ring index 12)
Next ring label: Morrow (ring index 13)
Status: PWH review completed; no P0 standdown; several acceptance gates remain open.

## Review trigger and source authority

The previous PWH deep review was Tern h1062:s3. The five-completion trigger was met at Mira h1065:s0; Alberr h1064:s4 subsequently completed, making six visible completions. Nathan's direct archive-maintenance priority intake is separately recorded in the existing PWH issue #2476 comment 7125655536. This review uses the existing PWH surface and existing WH work items. It creates no duplicate workstream.

The current Tern historical remit is Comptroller and workflow coordination. No standalone signed specialist charter was found. The role reconstruction is supported by the source-verified Nathan Direct messages recorded in Tern CONTINUITY and the historical Ariadne source readback. It does not confer authority to reassign Calder, Meridian, Mercer, or other charter owners.

## Current branch and workflow state

Pre-review main: `e44504576edce425b4a9e9cd29a260e494b1c88c`.

The scheduled `Refresh automatic website docket` run #45374428558 succeeded. Its log records HsH source `8f20831e2127b20ab8eec54fdf18660f616bbee5`, SAT archive source `028862e6`, 17,728 discovered documents, 48 rolling-docket entries, 577 visuals, 417 square-rule visuals, and six extraction errors. The generated discovery snapshot is current to the pre-refresh source chain. The 31.85 MB discovery payload could not be fully parsed through the current repository fetch path, so record-level presentation safety is not promoted to PASS.

The latest full record-safety parse, from the prior Calder review at 09:32Z, found 10,773 workspace records, all with generic reader targets, no `presentation_state`, and zero `PRESENTATION_PENDING`; 48/48 rolling-docket entries resolved to workspace records. The current `tools/site_discovery.py` generator remains unchanged at its prior blob. Record safety therefore remains FAIL by source-level policy, with exact counts for the newest 31.85 MB snapshot not re-parsed. Live visitor-route acceptance remains UNOBSERVED.

## WH-02: conversation date tagging and chronology

The latest `Maintain H(s)H navigation` run #45374428367 failed at the strict date audit after all three date passes ran:
- Development pass: 945 unchanged, 438 skipped.
- LIVE pass: 20 unchanged, 7 skipped.
- Repository-root pass: 75 renamed, 431 skipped.
- Aggregate audit: 1,040 correctly dated, zero needing rename, zero collisions, two undatable conversations, 875 skipped non-conversations or bad JSON.

The two undatable items are timestamp-less DOM captures, not evidence of a missing date that may be invented. The current main audit still treats legitimate undatable exceptions as a strict failure, so Viewer, chronology, structural index, archive-wide autotag, tests, commit, and Pages deployment were skipped. The current main root scanner still limits the repository-remainder pass by suffix and therefore misses eligible JSON-shaped material under other suffixes or extensionless names.

Existing PR #2487 contains the substantive repair: suffix-independent bounded JSON sniffing with authoritative ChatGPT mapping validation, separate `all_datable_tagged` and `all_conversations_have_dates` semantics, explicit undatable exceptions, root-manifest-driven literal path staging, and regression tests for root Markdown, unusual suffixes, extensionless exports, ordinary prose, arbitrary JSON, and undatable captures. This is source inspection only, not CI acceptance. PR #2487 remains draft and unmerged, six commits ahead and eighteen behind current main, merge base `d1360f9`. Calder retains implementation and rebase ownership.

PR #2488 is the one-commit CI bootstrap, draft and unmerged, one ahead and eighteen behind current main. It adds `workflow_dispatch` and unscoped pull-request triggers needed for exact-head checks. The main-branch CI run #45374426158 failed with zero jobs; no job-level diagnosis was available. Exact-head CI for #2487 remains unobserved. PR #1710 remains an older divergent WH-02 branch, seven ahead and 11,502 behind; do not close it until the replacement is accepted. No rebase, merge, force-push, or branch deletion was performed.

## P0: Code Grurple discovery and presentation safety

P0 issue #1747 remains open. PR #2009 remains draft, unmerged, four ahead and 6,085 behind current main. The fresh discovery generation is not presentation acceptance. The protected eight-object source/control set was last independently verified 8/8 in the Calder h1065 review; no new route probe or Pages acceptance was observed in this review. No standdown is authorized.

## WH-03/04 and WH-05: general archive ingestion

The direct Nathan priority is broader than WH-02. Existing push-triggered navigation and structural indexing do not yet provide complete content-aware ingestion for general archive materials. `tools/index_archive.py` remains a structural inventory; existing search/index components should be extended rather than replaced.

The required target remains:
1. Idempotent push/upload intake plus a scheduled reconciliation backstop across HsH, SAT_THEORY_ARCHIVE_2023-25, and HSH_RESOURCES.
2. Distinct recognition classes for authoritative ChatGPT conversations, general JSON, JSON-formatted content under any extension, reliably date-stamped non-JSON documents, and unknown/unclassifiable material.
3. Immutable source manifests keyed by repository, path, and blob SHA, recording source date, date basis, filename date, Git history date, ingestion timestamp, type, disposition, exclusions, parse errors, and output revisions.
4. Non-overwriting structural, content, date, provenance, duplicate/superset, Mersearch, and eligible public-discovery outputs. Preserve originals. Never invent dates or misclassify arbitrary JSON as a conversation.
5. Tests for extension independence, idempotency, root and nested paths, exclusions, malformed data, source-date conflicts, and exact readback.

Existing crosswalk remains WH-02/#1702, WH-03/04 Factory Floor #16-18, and WH-05/#1704. All four Mersearch request lanes remain occupied. No callable first-party Mersearch action was available in this runtime; no new request, retry, overwrite, or lane release was attempted. The external literature scan below is not a substitute for archive Mersearch.

## WH-06: issue and publisher lifecycle

A single bounded lifecycle pilot succeeded. Publisher transport issue #1701 is now closed as completed after:
- exact equality between issue-envelope content and the canonical artifact, 6,916 UTF-8 bytes;
- independently recomputed SHA-256 `815fbeb62560a1a007dfe7289112b30e6062e15015ae70f367b3fd66f6bb8f40`, matching the issue declaration and publisher confirmation;
- publisher readback comment #6864501887 and canonical commit `1bdac45213ca21290ae910ec814a2a032a010602`;
- terminal closure comment #7128838163.

This closes only the publication transport request. It does not close the underlying Paper A/B or Code Grurple work. No bulk closure was attempted.

The current `tools/issue_publish.py` and `issue-publisher.yml` still publish and read back but do not implement an idempotent terminal label/comment plus close transition. Existing PR #1251 is a stale publisher-edit retry branch, four ahead and 21,286 behind, with unresolved actor-authorization and failure-exit semantics. It is not a safe auto-close implementation. Issue #1705 remains open. Future automatic closure must occur only after validated payload, durable destination, exact byte readback, matching checksum, and a terminal comment or label. Rejected, pending, blocked, superseded, or ambiguous submissions must remain open. Existing completed publisher issues require individual evidence checks, not mass closure.

## Branch reconciliation snapshot

Relevant open branches were compared to current main using actual commit ancestry and merge-base:
- #2487: six ahead, eighteen behind; WH-02 implementation candidate.
- #2488: one ahead, eighteen behind; CI bootstrap.
- #1710: seven ahead, 11,502 behind; older WH-02 candidate.
- #2009: four ahead, 6,085 behind; P0 discovery/presentation candidate.
- #1251: four ahead, 21,286 behind; publisher edit/retry candidate.

All remain unmerged. This is a read-only reconciliation snapshot. Existing owners retain rebase and implementation duties. No force-push, deletion, merge, or branch retirement occurred.

## Task graph upkeep replay

The current `TASK_BRANCH_GRAPH.json` remains dated 2026-11-21, declares 16 branches but contains 18 records, and has 5 completed, 12 active, and 1 blocked records. A read-only JavaScript replay of the current `task_upkeep_triage.py` ranking logic as of 2026-11-24 found 13 active/blocked candidates: P0=3, P1=2, P2=3, P3=1, P4=1, unclassified=3. Metadata gaps: priority 3, owner 7, due date 10, last reviewed 10. No candidate had explicit effort and value data sufficient to qualify as low-hanging. The graph was not mutated.

## Lane 24 source scout: measured-system candidates, not numerical comparisons

A bounded external source scan identified several real experimental targets. These are candidate sources only; no system was selected for H(s)H fitting or validation, and no numerical calculation was performed.

- Finite-core/contact and rope-like mechanics: Sabater et al., July 2026, *Frictional sliding strength of knotted and capstan configurations along the axis of a cylinder*, DOI [10.1016/j.jmps.2026.106628](https://doi.org/10.1016/j.jmps.2026.106628). The experiment includes a braided climbing rope, a translating cylinder, measured force plateaus, an Instron 5943, 1 mm/s translation, five-repeat standard-deviation error bars, and a reported rope radius of 4.0 mm, effective bending stiffness of 0.4e-3 N m2, and friction coefficient 0.28. Raw-data availability was not confirmed in the accessible record. This is a useful contact/bending/friction testbed, not a physical equivalence to WWRD or H(s)H.
- Finite-core vortex rings: Rayfield and Reif (1964), [Phys. Rev. 136, A1194](https://doi.org/10.1103/PhysRev.136.A1194), report measured energy and velocity, circulation h/m, and an approximately 1 Å core radius. This is a historical experimental source; no raw dataset was retrieved.
- Vortex imaging and dissipation: Tang et al. (2023), [Nature Communications 14, 2941](https://www.nature.com/articles/s41467-023-38787-w), provide source data in the paper and Supplementary Information, including measured particle-centroid velocity with standard-deviation error bars. Additional data and code are available from the corresponding author on request.
- Rotation: Bendt (1962), [Phys. Rev. 127, 1441](https://doi.org/10.1103/PhysRev.127.1441), measured critical velocities in a rotating superfluid-helium annulus and reported dependence on flow history. Uncertainty and raw-data details were not established from the accessible abstract.
- Inspiral: [GWTC-4.0 data-release documentation](https://gwosc.org/GWTC-4.0/) provides calibrated strain, data-quality masks, and parameter-estimation posterior samples with credible intervals. The documentation flags known likelihood issues for some O4a candidates and provides reweighted/rerun results; 16,384 Hz calibrated strain is available, 4,096 Hz downsampling introduces small amplitude/phase errors, and data are not calibrated below 10 Hz.
- Constants: NIST [CODATA 2022 Web Version 9.0](https://physics.nist.gov/constants) remains the current recommended set. Mohr et al. (2025) describe a least-squares adjustment using theoretical and experimental data through 2022-12-31. Correlation/covariance and evaluation details must be retrieved from the adjustment paper before any numerical use.

The climbing-rope work remains a first-blush geometric heuristic. No rope universality, worldtube equivalence, or H(s)H physical prediction is asserted. No CODATA constants were inserted into a comparison.

## Paper gates and epistemic status

- Paper A/B reader and live-route acceptance remain unverified.
- P1 minor-paper gate (November 9) is overdue and not promoted.
- P2 major-paper gate (November 30) remains HOLD. The November 23 first-draft/hostile-review gate was not met; no measured system, dataset, provenance, units, uncertainty model, or prediction-versus-fit separation is selected.
- P3 full-theory gate (December 14) remains separate and incomplete.

No new Lean theorem was admitted or compiled in this operational review. No physical calculation was made. No BEDROCK theory, paper, or measurement status was promoted.

## Nathan Direct priority intake and next work

Priority: NATHAN DIRECT / HIGH OPERATIONAL / NUMERIC CLASS UNASSIGNED. Preserve that priority without silently demoting it to general archival maintenance.

Continue through the existing work items. Calder owns WH-02 implementation and rebase. Existing Factory Floor owners retain WH-03/04. Existing Mersearch owners retain WH-05. Tern retains PWH coordination and WH-06 lifecycle review. Meridian retains P0 Code Grurple. Mercer retains independent presentation QA. Do not create duplicate issues or parallel tooling.

Next PWH deep review is due after five further actual completed worker activations from h1066:s2, or sooner on a material P0 failure or direct priority change. The unrelated-source reading break is next due November 28; FIE re-review is next due December 4.

## Return cursor

Main at review start: `e44504576edce425b4a9e9cd29a260e494b1c88c`.
Return to #1702 and PR #2487 for the WH-02 rebase/CI gate; #1705 for publisher lifecycle; #2476 for the PWH coordination surface; Factory Floor #16-18 and #1704 for general intake and Mersearch.
