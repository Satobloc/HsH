# Meridian h888:s2 | P0 discovery snapshot and reader-policy revalidation

**Nominal slot:** 2026-11-17T00:24:00Z  
**Run key:** REVROT3-19-20261011:888:s2  
**Selection:** h=888; seq=4442; index 15, Meridian; next index 16, Mercer.  
**Identity:** deterministic ring label only. No authenticated current Meridian ChatGPT thread or direct-thread participation is claimed.

**Disposition:** P0_ACTIVE / READ_ONLY_DISCOVERY_AND_ROUTE_POLICY_REVALIDATION / LANE24_BACKSEAT_HOLD / CYCLE_08_OF_08_COMPLETE / NO_CYCLE_09 / NO_PHYSICAL_CALCULATION / NO_THEORY_PROMOTION.

## Authority, remit and current assignment

The current HsH main branch at the pre-write inspection was f87cdf49a7bd9c5c8ea69dbaeed7dd6c7ae697f7.

The live BEDROCK (blob 0253ace674bbc361464b7bbaac2c41aa3d8e8867), Primary Operational Guideline (a8e333b1d5b5aa1d9772366945dd88769d24153c), Steering Charter (be44c424674764c602b5f618dfce528c0f97b0ef), Three Paper Campaign (2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4), Phase Steering (0ddce5ac7fade329f491927b5cbeb53d325f2d7a), three-repository onboarding (fe40260cda5ce360909f2adfd64a3cc3e2c92a05), New Instance Start Here (43b577d42b8cced83f8836934598081685ea3ff3), Revival Rotation V3/V4, thread-first/routing rules, worker autonomy, duplicate-run guard, current task graph, PWH queue, current Meridian workspace and recent receipts were read.

Historical Meridian remit was recovered from two HsH raw exports:
- Meridian [HsH] Michelstein-on-Meinorly, conversation 6a9aa91b-11f4-83ea-80a1-4d502522e441, blob d21e251df093013903cc19789ded562f83b6e6ea. Direct user messages 054d1aea-cf67-4154-93c8-e302dc3ce1ea, 39299849-e2a4-4b63-88a0-5612c700cc1a and f6a2377c-8873-41ee-9107-41aeeb0d2589 establish the Graticule, geometric-solver, configurable calculation/comparison and solver-validation remit.
- Meridian Free Build, conversation 6ac45d1f-17b0-83ea-ad1f-fa524602378b, blob 7af1561b321f4d9364da5eb111df689efc652827. Direct user message 97d301cb-5174-4861-a273-ac4cc0b60d8b (2026-10-09T10:38:10.722Z) says Whirligig should preserve multiple valid answers and prefer the least-wild routes.

No standalone signed Nathan-authored Meridian specialist charter was recovered. These are historical direct-user sources, not an authenticated current thread. The current CODE_GRURPLE_ROSTER (blob cc96c0bfafc95c54e7960899c7306031e5abce17) controls the present assignment: Meridian supports Paper A accepted-R1 presentation repair; Mercer independently QA-checks both A and B routes; Tern retains P0/control-plane coordination. The solver/Graticule remit is preserved, not silently reassigned as this run's task.

The Lane 24 capsule (blob bcbbdf0d02ec0b0de4b0f633da84d6d287fb8814) explicitly pins P0-HOLD, Cycle 08/08 complete, and no new Lane 24 cycle until a positive P0 trigger or Code Grurple standdown. The Three Paper Campaign's P1 Nov 9 gate is overdue; P2 Nov 16 source/data gate is not met and the Nov 30 paper gate remains separate; P3 Dec 14 remains separate and incomplete.

## Discovery snapshot and source consistency

Latest PUBLIC_SITE/generated/discovery.json:
- Blob: 29bd379151303b396ee1f0b9c77f70cf0a4e9077
- Size: 26,773,105 bytes
- Updated: 2026-11-17T00:12:41Z
- Embedded HsH source commit: 2454a8f1f2434e67fa67213bab72f9bf653a91ba (complete)
- Embedded SAT archive source commit: 4b616b6113ecd33d216600e4fa5fd1e783d48653 (complete)

At inspection, HsH main f87cdf49a7bd9c5c8ea69dbaeed7dd6c7ae697f7 was one commit ahead of the embedded HsH source. The compare returned exactly one changed path, PUBLIC_SITE/generated/discovery.json. Thus the snapshot was source-consistent at generation; this is not an unobserved source-code change. The public discovery builder scans HsH and the SAT archive, not HSH_RESOURCES. HSH_RESOURCES root orientation was read; no private payload was opened.

Parsed snapshot counts:
- 15,431 total documents
- 8,500 WORKSPACES records
- 8,500 generic reader targets for those workspace records
- 8,287 workspace excerpts
- 48 rolling-docket entries
- 577 visuals
- 6 excerpt errors

Compared with the preceding snapshot blob f61e0a152a7665e757f56a9ea6a47733f033b12f (updated 2026-11-16T22:24:56Z; 15,402 documents, 8,471 workspace records, 8,259 workspace excerpts): 29 additions, 0 removals, 25 changed records, +29 workspace records, +29 generic reader targets and +28 excerpts. New additions include the h887 Nadir and Enheduanna receipts, Enheduanna's published artifact, the h888 Morrow report/receipt/published artifact, and other recent worker receipts and amendments. The new additions are not independent corroborations merely because they are separate files.

## Protected Paper A/B source and route revalidation

All eight protected source/control blobs were fetched individually at the current main snapshot and matched the pinned vector exactly (8/8). Canonical vector SHA-256 remains 833ad26d6082dbba7278f01be2bf896c588a3db5d7fe37e762cec7a7f1370161.

| Protected object | Current blob |
|---|---|
| Paper A accepted R1 | 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa |
| Paper B reviewed R1 | 0a1dca42cafd9a02faceff4ec0851659a317b2bb |
| Papers feed | e3552fdac0f187b066b59a9742563094efffe011 |
| Presentation Gate | 5f91020d0a71034ad6bed2de0a82ead1f1e48d98 |
| Reader Routing Registry | 277a94c553e2e17b61bb046a04781b4e44f2229f |
| Presentation Contract | b871249564a45278383e41eebd8aaa5d8c64aa3c |
| Generated papers index | 7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7 |
| Conversation Viewer / Whirligig Pages workflow | 6f3e843b6a327db76b21e8b0b61a26c210b600ac |

Both protected manuscripts still appear in discovery with generic reader.html?mode=browse targets. Paper A has no excerpt; Paper B has an excerpt. The snapshot does not convert these raw workspace sources into approved presentation derivatives.

The current builder tools/site_discovery.py is blob 97ff9c6d00544251c05bd6bb6053907805438f3e. Its eligible() accepts PDF, Markdown, text, TeX and JSON paths subject to prior-art/quarantine/generated/hidden-path exclusions, but has no WORKSPACES/** exclusion. Its route() function creates a generic browse reader target. The current test file is blob 4d646dba614f50b912391c13cd516616700d2ac3 and explicitly asserts that WORKSPACES/MERCER/2026-10-11_note.md is eligible.

That remains inconsistent with:
- PRESENTATION_GATE blob 5f91020d0a71034ad6bed2de0a82ead1f1e48d98, which requires a presentation derivative before ordinary reader display and forbids raw markup fallback;
- READER_ROUTING_REGISTRY blob 277a94c553e2e17b61bb046a04781b4e44f2229f, which default-denies WORKSPACES/** absent an explicit presentation derivative;
- PRESENTATION_CONTRACT blob b871249564a45278383e41eebd8aaa5d8c64aa3c.

This is a reproducible source/index-policy mismatch. It is not proof that either live visitor-facing route was exercised or exposed. No authenticated browser context, exact deployment identity, owner preview, or authorized live route probe was available. Both routes remain PRESENTATION_PENDING / NOT_OBSERVED. No positive P0 trigger or standdown condition was established.

## Publisher and workflow-health reconciliation

Existing publisher states were checked without retrying or duplicating submissions:
- Enheduanna issue #1863: publisher comment #6932934938 says PUBLISHED; the canonical artifact was fetched and matched the issue payload exactly.
- Morrow issue #1865: publisher comment #6933327250 says PUBLISHED; the canonical artifact was fetched and matched the issue payload exactly.
- Nadir issue #1864: publisher comment #6933132491 says REJECTED: SHA-256 mismatch; expected artifact remains 404.

The Enheduanna and Morrow receipts record their earlier SUBMITTED_NOT_VERIFIED states at receipt creation; those statuses are stale after the later publisher readbacks. Nadir remains rejected. This report records the reconciliation without editing another worker's receipt or claiming delivery to another thread.

The task graph blob 5994a3952fbb0a2bc23aa4b4388c70b979ef1227 remains 18 records against 16 declared branches: 12 active, 1 blocked, 5 completed. Its updated field is 2026-11-15T17:24Z; Tern retains graph/scheduler authority. The PWH queue remains unchanged: WH-05 is blocked by the four occupied Mersearch lanes; WH-02 is the highest-priority unblocked item and remains Calder/authorized-maintainer-owned.

All four canonical Mersearch request files remain status=requested:
- Lane 1: calder-angle-geometry-source-fidelity-20261102-1337
- Lane 2: archive-harvest-20261025-optics-01
- Lane 3: calder-iri-worldtube-geometry-fidelity-20261104t2230z-s0-001
- Lane 4: kestrel-finite-core-geometry-source-fidelity-20261102-2200

No request-scoped output directory was found for any of these four current IDs. A callable Mersearch action is not present in this runtime; the stable 1.0 release and bridge workflows are documented in the repo. No request was created, overwritten, released or retriggered. SciSpace is available but was not needed for this P0 source/index check. Existing Math Hopper #578 / PR #991 and Whirligig Kernel 0 / PR #1189 were checked through the latest source receipts; no new tooling, fork, dependency, paid service or subscription was introduced.

## Lane and paper boundaries

P0 Code Grurple remains ACTIVE. Meridian's current contribution is Paper A presentation repair support, not a site deployment or control-plane authority. Mercer owns independent QA of both routes; Tern retains coordination. No manuscript, feed, builder, test, presentation gate, reader registry, workflow, PDF or deployment change was made.

Lane 24 remains BACKSEAT / HOLD; Cycle 08/08 is complete and Cycle 09 is prohibited until a positive P0 trigger or standdown. No physical calculation, CODATA numerical comparison, new Lean run, P2 system selection, P2 paper advancement, P3 advancement, or BEDROCK theory promotion occurred. No SAT-O or Blockwave equation was changed. FIE rereview remains due 2026-11-24. The unrelated-reading cursor remains The Wind in the Willows, Chapter I, lines 25-220; next line 221. No new lateral-reading quantum is claimed.

## Automation integrity

The exact :24 task was read by ID and remains enabled:
- Task ID: 6abda4c8eda88191bf23a6f2849e9a17
- DTSTART: 2026-10-01 14:24 America/New_York
- Recurrence: hourly
- Prompt and phase: unchanged
- Current run ID: 1a67e290-7684-8333-a42b-61d5ce72b073
- scheduled_for: 2026-11-17T00:24:00Z
- recorded started_at at initial readback: 2026-11-17T00:23:11.723202Z
- initial status: IN_PROGRESS; completion and chat_ref null

The task-level cached latest result still points to h887 Nadir, not this h888 run. Task-level last/next timestamps are stale relative to the run-level record. No cause or worker liveness is inferred. No task, ID, prompt, phase, schedule, enabled state or cadence was changed; no sixth task was created.

## Return point

The next ring label is Mercer (index 16). This report is optional repository context, not a task assignment, authenticated-thread delivery, acknowledgment or ownership transfer. P0 issue #1747 remains the controlling shared issue. The immediate evidence cursor is the next discovery snapshot and any authorized positive P0 source/feed/renderer/derivative/deployment/owner-preview trigger. Until then, preserve the hold and do not start Lane 24 Cycle 09.


## Amendment 01 - exact task identity and final run-state readback

The initial report's task ID string 6abda4c8eda88191b8a91a30d2a155e0 was a stale/incorrect identifier and is superseded by the exact-ID task-list and private-peek readback:

- Correct task ID: 6abda4c8eda88191bf23a6f2849e9a17
- Title: Workshop Relay :24 | Geometry
- Enabled: true
- Exact schedule: BEGIN:VEVENT / DTSTART;TZID=America/New_York:20261001T142400 / RRULE:FREQ=HOURLY / END:VEVENT
- Default timezone: America/New_York
- Current run ID: 1a67e290-7684-8333-a42b-61d5ce72b073
- scheduled_for: 2026-11-17T00:24:00Z
- started_at: 2026-11-17T00:23:11.723202Z
- recorded_status: in_progress; completed_at null; chat_ref null
- latest_result is an older h887 Nadir run d416d605-b838-832a-a7ca-7d3327d003e7, completed 2026-11-17T00:00:45.833442Z, with a Nadir chat_ref. It is not this Meridian run.
- Task-level last_run_time remains 2026-11-17T00:00:48.049029Z and next_run_time remains 2026-11-16T19:24:00-05:00, both stale relative to the current run record. No cause or liveness inference.
- The publisher intake issue #1866 body contains the original incorrect ID because it was submitted before this correction and is already rejected. It was not edited, reopened or retried. The correction here and in the canonical receipt is authoritative for current internal continuity.

No task identity, prompt, phase, enabled state, schedule or cadence was changed. No sixth task was created.


## Amendment 02 - correction-comment pointers

- Publisher intake #1866 task-ID correction: comment #6933959914.
- Controlling P0 issue #1747 task-ID correction: comment #6933960487.
- The original publisher issue remains REJECTED and unchanged. The corrected internal report is the current working artifact; no re-publication attempt was made.


## Amendment 03 - post-snapshot continuity boundary

The discovery snapshot was generated at 2026-11-17T00:12:41Z, before the h888 report, canonical receipt and Meridian checkpoint writes. Those h888 continuity artifacts are therefore not indexed by that snapshot. The snapshot was source-consistent at generation; subsequent main-branch commits are post-snapshot report/receipt/checkpoint writes, not a newly observed change to the eight protected P0 source/control objects. No discovery rebuild was triggered. At the first h888 continuity checkpoint, main was 1a2df4e4250a9f78ccbc5c13d58ba11087791675; subsequent report/receipt/BOOT/CURRENT_WORK amendments advanced main further.
