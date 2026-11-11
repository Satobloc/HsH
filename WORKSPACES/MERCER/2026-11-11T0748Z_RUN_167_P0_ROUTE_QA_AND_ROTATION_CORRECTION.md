# Mercer h751:s4 | P0 route QA and deterministic-rotation correction

**Nominal occurrence:** 2026-11-11T07:48:00Z  
**Run key:** REVROT3-19-20261011:751:s4  
**Selected label:** Mercer, ring index 16  
**Successor:** Ravel, ring index 17; next key h752:s0  
**Disposition:** P0_READ_ONLY_REVALIDATION_COMPLETE / 37_OF_37 / EIGHT_BLOBS_MATCH / NO_ROUTE_TRIGGER / ROUTES_PENDING_NOT_OBSERVED / PRIOR_SLOT_MISATTRIBUTION_CORRECTED / AUTOMATION_UNCHANGED.

## 1. Rotation and source authority

The fixed zero-indexed ring calculation is:

- h=751
- seq=5*751+4=3759
- 3759 mod 19=16, Mercer
- next index 17, Ravel

Historical Mercer authority was recovered from a direct Nathan user-role message in the raw HsH export:
- conversation: 6a3a2037-3698-83ea-924d-2cb8c4ac7701
- raw export blob: d828fef5352045cb4d9486fdbeabd04043c4c119
- direct user message: bb8ecf64-8863-4ee7-a078-ca8cc4104974
- source timestamp: 2026-10-01T20:56:07.264Z

The historical :48 assignment covers equations, dimensional analysis, constitutive physics, coarse-graining, forces and quantitative consequences. The current live Code Grurple roster supersedes ordinary theory work while P0 remains active: Mercer is restricted to Paper A and Paper B presentation QA only. No manuscript content, scientific claim, or paper gate was reopened.

No authenticated current Mercer historical thread was found. The current :48 run has chat_ref=null. This is source-grounded work in the scheduled execution, not authenticated historical Mercer-instance participation.

The Steering Charter's one-time clone-footprint check-in already contains a Mercer entry. No duplicate check-in was added.

## 2. Incoming handoff and routing correction

No valid h751:s3 predecessor handoff was available.

The h751:s2 :24 run ID 186cb278-1b28-8320-aeb3-2181b8c2ce21 completed at 07:39:19.721190Z. Its report and receipt incorrectly identify Meridian as selected index 14 and Mercer as successor index 15.

Correct calculation:
- h751:s2: 5*751+2=3757; 3757 mod 19=14, Kestrel.
- next index 15 is Meridian.
- h751:s3 should therefore be Meridian, not Mercer.

A later exact-ID scheduler read shows a run-level chat_ref for the :24 run, 6af0cffc-7e10-83e9-9385-22e7347fef4b. The earlier receipt had chat_ref=null. The later pointer does not authenticate a Kestrel or Meridian worker identity, historical thread, or consumption.

The existing packet addressed to Mercer from h751:s2 is misrouted and is not consumed as predecessor context. Its P0 read-only observations are retained only as an assistant-generated scheduled-run artifact, not attributed to Meridian or Kestrel as historical agents. Additive corrections are filed at:
- WORKSPACES/MERIDIAN/2026-11-11T0724Z_P0_ROUTE_NO_TRIGGER_AND_PROOF_TRIAGE_AMENDMENT_02.md
- WORKSPACES/COMMON/REVIVAL_ROTATION_RECEIPTS/2026-11-11T0724Z_s2_meridian_AMENDMENT_02.md
- WORKSPACES/COMMON/REVIVAL_ROTATION_HANDOFFS/2026-11-11T0724Z_from_s2_to_s3_mercer_AMENDMENT_01.md

The expected h751:s3 Meridian occurrence has not been observed. The :36 task's latest last_run still belongs to h750:s3 Nadir Voss:
- run ID a7258540-60a0-8331-9ba4-4d6602c22b33
- scheduled_for 2026-11-11T06:36:00Z
- latest started_at 07:51:17.308777Z
- status IN_PROGRESS, completed_at=null, chat_ref=null
- cached latest_result remains the older h749:s3 Mira run 9fed0ab4-3014-8326-a5a0-4660f6d065ba

Tern's inbox already preserves earlier FAILED and IN_PROGRESS snapshots for this same h750:s3 run. This report adds the later start-time mutation only; no retry, restart, duplicate execution, attempt relation or cause is inferred.

## 3. P0 presentation QA: 37/37 read-only assertions

Prewrite HsH main head: f5674d41013e8d59a692b6957c0857a2e05d7cb3, created 2026-11-11T08:00:50Z. Its only changed file is PUBLIC_SITE/generated/discovery.json.

The prior h740 main comparison to 33e898afe3b44be08d9c290e5357e02e18e939fc returned 686 commits and 246 changed paths, with no protected P0 path and no route-renderer/presentation path in the changed-path set. The intervening main commits to 532345b4de1e52a67668a3957e23797c363402fe and f5674d41013e8d59a692b6957c0857a2e05d7cb3 changed only a Nadir report and generated discovery metadata, respectively.

All eight protected P0 source/control blobs exactly match the expected identity vector:

1. Paper A R1 TeX: 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa
2. Paper B R1 Markdown: 0a1dca42cafd9a02faceff4ec0851659a317b2bb
3. PUBLIC_SITE/PAPERS_FEED.json: e3552fdac0f187b066b59a9742563094efffe011
4. PUBLIC_SITE/PRESENTATION_GATE.md: 5f91020d0a71034ad6bed2de0a82ead1f1e48d98
5. PUBLIC_SITE/READER_ROUTING_REGISTRY.md: 277a94c553e2e17b61bb046a04781b4e44f2229f
6. PUBLIC_SITE/PRESENTATION_CONTRACT.md: b871249564a45278383e41eebd8aaa5d8c64aa3c
7. PUBLIC_SITE/generated/papers.json: 7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7
8. .github/workflows/deploy-conversation-viewer-pages.yml: 6f3e843b6a327db76b21e8b0b61a26c210b600ac

The 37 scripted read-only assertions all passed:
- exact eight-file identity vector;
- unique Paper A and Paper B feed entries;
- exact feed-to-manuscript blob bindings;
- accepted/reviewed R1 status and existing version/date fields;
- both entries remain sandbox_manuscript;
- generated PDF index contains Cruller-Rubin only, not Paper A or B;
- presentation gate requires the compiled-PDF reader chain and keeps raw source secondary;
- reader routing remains default-deny with unknown routes pending and raw Markdown/TeX/JSON excluded from ordinary reader presentation;
- presentation contract requires a plain-English preface and source/dependency provenance;
- Pages workflow does not include either Paper A/B manuscript path;
- Code Grurple remains active, Mercer remains assigned A/B presentation QA, both route IDs remain registered, and both A/B task-graph branches remain active.

Feed state:
- Paper A: sandbox_staged_accepted_r1; posted_date=null; source blob unchanged.
- Paper B: sandbox_posted_reviewed_r1; version R1; posted_date 2026-09-23; source blob unchanged.

The generated PDF index contains Cruller-Rubin R0 only. The Pages workflow deploys the Conversation Viewer and Whirligig, not the A/B paper routes. The active-edge signal remains ACTIVE_OVERRIDE_BOTH_PAPER_ROUTES_PRESENTATION_PENDING. The task graph remains ACTIVE_SEED, 16 declared branches versus 18 records, last updated 2026-11-10T17:06Z. Tern retains task-graph and cross-repository reconciliation authority.

## 4. Route capability and acceptance

Both actual reader routes remain PRESENTATION_PENDING / NOT_OBSERVED, not PASS and not FAIL.

The Browser tab-list action failed because this runtime lacks the originating browser context. No authenticated Sites editor/deployer, owner preview, deployment identity, or derivative digest was available. No route probe was attempted, no manuscript/feed/site write occurred, and no standdown trigger was established.

The Site Development Work Log's latest relevant deployment/rollback entries remain dated 2026-11-02. A successful GitHub Pages deployment is not live reader-route acceptance.

## 5. Mersearch, tools and source reading

The documented Mersearch shared request file is occupied by Calder's lane-1 request calder-angle-geometry-source-fidelity-20261102-1337. No request was overwritten or submitted. No local repository checkout was present; git exists, but gh, Lean, Lake and Elan are not installed. No Mersearch connector action was exposed in this runtime. GitHub file reads were a bounded fallback, not a Mersearch sweep.

The HsH, SAT archive and HSH_RESOURCES repository front doors were read. HSH_RESOURCES was treated as an internal reference boundary; no PRIOR_ART or other restricted subtree was opened.

Historical Mercer instruction to read one old-archive and one HsH source per run was met. Unrelated old-archive reading:
- SAT archive file SAT Mark V/TheTANGLE.txt
- lines 1561-1600
- blob 3181b6cad85bbd76bd1017938e0dbf67baf03752
- next cursor 1601

FIE was last rereviewed 2026-11-10; next review due 2026-11-24. No physical break is claimed.

## 6. Campaign, upkeep and epistemic limits

- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition paper: OVERDUE / NOT READY; Orson-owned.
- P2 November 30 measured geometry: HOLD.
- P3 December 14 full theory: INCOMPLETE.
- No human-subject experiment, LLM cognition trial, physical calculation, fit, prediction, Lean build, manuscript edit, paper-gate advancement or theory promotion occurred.
- No public issue was opened because this is an internal routing correction and read-only presentation audit, not a new public scientific result.

## 7. Durable records and successor

The deterministic successor is Ravel h752:s0, index 17; next label Orson Vay, index 18. Ravel's historical thread is exhausted and no authenticated current Ravel thread was established. The successor packet is repository-only optional context. The h752:s0 run had already started by the later read, so this is POST_START_OPTIONAL_CONTEXT; no ChatGPT-thread delivery, consumption or acknowledgment is claimed.

The local checkout/approved internal Actions write route was unavailable in this runtime. The GitHub Contents API fallback was used with fresh blob SHA compare-and-swap updates and exact independent readbacks. No force push or direct public artifact write was used.

No task ID, schedule, phase, prompt, cadence, enabled state, ownership, task graph, branch, paper gate, signet or chat title was changed. No sixth task was created.


## 8. Exact current :48 run snapshot

The protected :48 automation task ID is 6aa6c3bc02b48191b8a91a30d2a155e0, still enabled with its original hourly America/New_York :48 VEVENT. Current run ID ebdaa072-4264-8325-b42f-3bad6f1d025a is scheduled_for 2026-11-11T07:48:00Z, started_at 07:47:37.530494Z, recorded IN_PROGRESS, completed_at=null and chat_ref=null. The run started 22.469506 seconds before nominal. Its cached latest_result remains the prior h750:s4 Enheduanna run e16f0d12-dbd0-832e-aca8-d56a5e407749, completed at 07:08:48.773188Z; that result is not attributed to this Mercer occurrence.
