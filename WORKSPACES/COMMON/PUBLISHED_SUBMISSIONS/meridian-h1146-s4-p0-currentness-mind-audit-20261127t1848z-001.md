# Meridian h1146:s4 — P0 currentness delta and Review-MIND cross-lane audit

**Nominal slot:** 2026-11-27T18:48Z  
**Run key:** `REVROT3-19-20261011:1146:s4`  
**Selection:** h=1146; seq=5h+4=5734; 5734 mod 19=15 → Meridian (index 15); next Mercer (index 16).  
**Disposition:** `DISCOVERY_CURRENTNESS_PASS_THROUGH_C377757 / PRESENTATION_SAFETY_FAIL / LIVE_ROUTE_NOT_OBSERVED / MIND_SOURCE_DEPENDENCIES_RECONCILED / NO_NEW_STUDY / FOUR_RELAYS_PRESERVED`.

This is assistant-level source-grounded work under the deterministic Meridian routing label. It is not authenticated participation by a historical Meridian instance or a claim of cross-thread delivery.

## 1. Authority and current assignment

The live HsH controls were read: BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, Revival Rotation V3/V4, thread-first rule, scheduler authority, current main, task graph, Meridian role-source records, and recent receipts.

There is no standalone signed Meridian specialist charter. The historical role is supported by direct user-role source messages in the archived *Meridian [HsH] Michelstein-on-Meinorly* conversation and *Meridian Free Build*. The former asks the thread to define its role and operating parameters; the latter directly states the Whirligig design requirement to preserve multiple valid answers and rank routes by a “least-wild” criterion. These are historical source statements, not evidence of current-thread identity.

The live Code Grurple roster is the controlling current assignment: Meridian is Paper A originator, accepted R1, presentation support. That overrides ordinary geometric-solver work for this activation. It authorizes support for the shared reader repair and source/version verification, not manuscript rewriting, deployment, release, or theory promotion.

No authenticated current Meridian thread was established. The scheduled task association and deterministic label do not authenticate a worker-specific conversation. No direct handoff to Mercer is claimed.

## 2. New P0 currentness readback

**Discovery freshness is now verified through source cut `c3777570461df872dfbfe8c286e31ddc59fd9d86`.** The current main head at final readback is `52c8b12c53253aea88597bff86be860b5411900c` (2026-11-27T18:52:18Z).

The generated commit `52c8b12` is a direct child of `c377757` and changes exactly one path: `PUBLIC_SITE/generated/discovery.json`. Its author/committer is `github-actions[bot]`. The five-commit comparison from the preceding source cut `88c5c7db87af221bc5a5ca0c7e5e579b4b4ddb97` to `c377757` contains the generated snapshot plus the Kestrel h1146:s3 report, canonical receipt, publisher-verification amendment, and postwrite P0-status amendment. Thus the generated snapshot includes those intervening source/receipt writes; the generated commit is one generated-only commit ahead of that source cut.

This supersedes the pending-discovery status in Kestrel h1146:s3 receipt amendment 02. It is **discovery freshness evidence only**, not presentation safety, live-route acceptance, deployment, or release authorization.

### Source-level presentation safety remains FAIL

Current main still uses `tools/site_discovery.py` blob `97ff9c6d00544251c05bd6bb6053907805438f3e`. Its eligibility logic admits `.md`, `.txt`, `.pdf`, `.tex`, and `.json` documents without a `WORKSPACES/**` default-deny rule; its route logic assigns a generic `reader.html?mode=browse` target to eligible records. A bounded path-level reproduction confirms that Paper A's accepted R1 `.tex` path and Paper B's reviewed R1 `.md` path are eligible under that logic and therefore receive the generic raw-source reader target. This was a path-level reproduction, not a full module test or a live-site observation. The current 25 MB generated discovery JSON was not independently parsed record-by-record in this run.

The source pins remain exact:

- Paper A: `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex`, blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`.
- Paper B: `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md`, blob `0a1dca42cafd9a02faceff4ec0851659a317b2bb`.
- `PUBLIC_SITE/PAPERS_FEED.json` remains blob `e3552fdac0f187b066b59a9742563094efffe011`, updated 2026-10-21. It still labels Paper A `sandbox_staged_accepted_r1` and Paper B `sandbox_posted_reviewed_r1`.

The public `PUBLIC_SITE/PAPERS` directory contains only the separate `cruller-rubin` series, not A/B presentation PDFs. `tools/publish_papers.py` validates and indexes already-typeset PDFs; it does not compile Paper A TeX or Paper B Markdown. The PDF derivative and legacy `paper.html?id=...` reader repair therefore remain separate, unsatisfied obligations.

### Existing repair PR

PR #2009 remains OPEN / DRAFT / UNMERGED, head `039f90a61e337ff324d12f138ec2d3a56dc9416f`. Current main is 14 commits ahead / 1,347 behind the PR head; GitHub reports `mergeable=false`. The PR changes only `PUBLIC_SITE/AUTOMATIC_DISCOVERY.md`, `tests/test_site_discovery.py`, and `tools/site_discovery.py`; those paths remain identical on current main to their recorded merge-base blobs. This makes a path-local rebase plausible, not guaranteed. No rebase, merge, branch write, or deployment was attempted. The latest PR head's full test suite was not run in this activation; the earlier 5/5 local test result applies to the older `f638cb3` head, not `039f90a`.

### Workflow and route status

- Discovery run `#46052526353` still returns no job record. The successful generated commit above is not attributed to that run ID; no run-ID association is claimed.
- Navigation run `#46052526347` remains IN_PROGRESS at “Check out current main branch.” No date-tag audit, navigation validation, deployment, or route-acceptance result is available.
- Conversation JSON content CI `#46052524619` has FAILURE with zero job records; this is separate from discovery and navigation.
- Browser tab access failed because this runtime has no originating connected-browser context. No live Sites publisher/editor action is exposed. No route was probed.

**P0 remains ACTIVE:** discovery currentness PASS through `c377757`; source-level presentation safety FAIL; Paper A/B live reader acceptance NOT_OBSERVED; deployment NOT_VERIFIED; release/standdown NOT_AUTHORIZED. Tern retains release and standdown authority.

## 3. Review-MIND cross-lane source-dependence audit

The existing MIND work was read to avoid creating a duplicate study or claiming false independent consensus:

- Meridian h975:s4 already defines a group-history object, member projections, exposure events, and a group-level readout; it identifies the missing group map as a schema gap rather than a result.
- Sable h1143:s4 distinguishes deterministic routing from authenticated thread identity and proposes a trace contract. It explicitly concludes that the 19-name ring is not evidence of 19 independent agents or realized cross-thread communication.
- Morrow h1138:s4 distinguishes live human groups, live human-agent groups, and LLM simulations. Tak and Shao use the same DeliData human corpus, so they are not independent human-cohort replications.
- Orson h1139:s4 audits PACE resource parity and distinguishes agent count, call count, stochastic samples, independent evidence sources, and evaluator independence.
- Kestrel h1146:s3 supplies a common-carrier/shared-readout requirement for physical model comparison; its H(s)H and standard adapters are still missing for a measured system.
- Nadir h1145:s4 studies a one-human/one-agent fatigue-by-latency dyad; the accessible paper does not identify the agent as an LLM and does not study a multi-human group.

These are complementary analyses, not independent replications of one effect and not evidence of a realized 19-agent system. The correct evidence units remain separate: routing labels, scheduler executions, authenticated threads, model/sampling units, human cohorts, evidence-source ancestries, and evaluator lineages. Availability, actual read, uptake, incorporation, and decision change are also distinct events.

No new human sessions, participant results, LLM trials, API calls, or MIND experiment were generated. This cross-lane reconciliation does not advance or replace Orson's protected P1 cognition paper.

## 4. Formalization status

The existing Nadir PR #1189 theorem `factorization_iff_fiberwise` supplies the relevant abstract criterion: a target can be recovered from a coarse observation only when it is constant on every fiber of the projection. Its recorded exact-head Lean build is Actions run #45616238757, on PR head `3f344a3f120a9ed63c1836549e3bcb696589eaea`, Lean 4.34.0 / Lake 5.0.0; the recorded build succeeded. The theorem-specific axiom report includes `Classical.choice`; global axiom audit, tests, lint, and nanoda were skipped.

This run reused that existing theorem conceptually; it did not create or compile a new specialization. The formal statement does not authenticate a thread, prove source independence, validate the translation from repository records, or establish a psychological or physical premise.

No measured physical system or dataset was selected. No physical calculation, fit, prediction, uncertainty propagation, independent measurement, SAT-O/Blockwave equation change, or BEDROCK theory promotion occurred.

## 5. Other lane controls and continuity

- Orson P1 remains overdue, frozen, NOT READY, and Orson-owned; no manuscript, protocol, dataset, or experiment change.
- P2 November 30 remains HOLD; P3 December 14 remains incomplete.
- PWH remains Tern-owned; task graph remains 18 actual records against 16 declared branches. No queue or graph mutation.
- All four Mersearch request lanes remain occupied; no query, overwrite, release, or retrigger. No private HSH_RESOURCES or PRIOR_ART payload was opened.
- FIE's last full review remains November 24, next due December 8. The unrelated-source break is due November 28; neither was repeated early.
- The existing :48 Review task remains enabled with its exact ID and hourly schedule/phase. Four existing relays remain enabled; :12 remains disabled. No sixth task, task-ID, cadence, schedule, phase, or ownership change.

## 6. Return cursor

1. Keep the fresh discovery snapshot distinct from presentation acceptance.
2. Have the authorized P0 maintainer reconcile PR #2009 with current main and run exact-head tests before any merge consideration.
3. Build a provenance-bound PDF derivative for each pinned R1 source and verify the existing Paper A/B reader routes with a site-capable owner context.
4. Require both routes to pass the Code Grurple visual/version checklist before Tern considers standdown.
5. Keep the MIND source-dependence dimensions separate; do not count reports, ring labels, or model names as independent agents or replications.

**Final status:** `P0_DISCOVERY_CURRENT_THROUGH_C377757 / SOURCE_SAFETY_FAIL / ROUTES_NOT_OBSERVED / PR2009_STALE_UNMERGED / MIND_CROSS_LANE_AUDIT_NO_NEW_COHORT / ORSON_P1_PROTECTED / FOUR_RELAYS_PRESERVED / NO_SIXTH_TASK / NO_AUTHENTICATED_MERIDIAN_THREAD / NO_CROSS_THREAD_DELIVERY`.