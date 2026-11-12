# Mercer Run 171 | P0 route namespace and deployment-chain audit

**Report created:** 2026-11-12T06:51:26.716Z  
**Nominal relay event:** 2026-11-12T06:36Z  
**Run key:** `REVROT3-19-20261011:774:s3`  
**Deterministic label:** Mercer (ring index 16) → Ravel (ring index 17)  
**Participation:** SOURCE_GROUNDED_REVIVAL_IN_CURRENT_RUN / NO_AUTHENTICATED_CURRENT_MERCER_THREAD  
**Report status:** FILED / AUDIT COMPLETE / P0 STILL PRESENTATION_PENDING  
**Authority class:** assistant-authored operational QA; not Nathan Direct and not theory authority.

## 1. Authority and scope

The historical Mercer source was recovered from the raw HsH export:

- Conversation: `6a3a2037-3698-83ea-924d-2cb8c4ac7701`.
- Raw export Git blob: `d828fef5352045cb4d9486fdbeabd04043c4c119`.
- Direct user-role message: `bb8ecf64-8863-4ee7-a078-ca8cc4104974`, timestamp 2026-10-01T20:56:07.264Z.

That message establishes the historical :48 remit of equations, dimensional analysis, constitutive physics, coarse-graining, forces and quantitative consequences, plus source/invention separation and no target-fitting. It is a direct historical assignment, not a standalone signed specialist charter. The current Code Grurple roster supersedes that broad playground authorization for this execution: **Mercer is assigned Paper A+B presentation QA only** while the P0 interlock remains active. No manuscript content, scientific review, theory-bearing synthesis, renderer implementation or site edit was undertaken.

The current automation run object was IN_PROGRESS at final inspection, with no run-level conversation reference. Its cached result belonged to the preceding h773:s3 execution and was not attributed to this run. The deterministic Mercer label does not authenticate a historical Mercer instance or current thread.

## 2. Fresh P0 identity and branch check

Pre-write HsH main head: `e39496ae388b79679e40452672cc3d1357c31b03`.

Comparison from the Run 170 baseline `4c459a7e1898d337039e375ab2d6d4044283fa5d` to that head:

- 181 commits ahead, 0 behind.
- 90 changed paths.
- The only `PUBLIC_SITE/` path in the returned changed-file list was `PUBLIC_SITE/generated/discovery.json`.
- None of the eight protected P0 source/control paths changed.

All eight protected blobs were fetched again from the current main head and matched exactly:

| Protected item | Exact Git blob |
|---|---|
| Paper A accepted R1 | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| Paper B reviewed R1 | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Papers feed | `e3552fdac0f187b066b59a9742563094efffe011` |
| Presentation gate | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| Reader routing registry | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| Presentation contract | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| Generated PDF-series index | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` |
| GitHub Pages workflow | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` |

This is a fresh source-identity and path-delta check, not a live deployment or route acceptance test.

## 3. New architecture result: three route namespaces, no verified join

The repository contains three distinct publication/deployment paths. They must be represented separately; success in one namespace cannot satisfy another namespace's acceptance gate.

### A. Code Grurple legacy paper routes

`WORKSPACES/PAPERS/.../DRAFT_R1` → `PUBLIC_SITE/PAPERS_FEED.json` → legacy `paper.html?id=...` URL on the external Glass Sausage Factory host.

The feed still nominates:

- Paper A `convergent-motifs-r1`, status `sandbox_staged_accepted_r1`.
- Paper B `boundary-weak-emission-r1`, status `sandbox_posted_reviewed_r1`, with historical `site_version=34` and `posted_date=2026-09-23`.

The feed is a backend nomination/control object, not proof that the named reader route is deployed or current. The Code Grurple roster's acceptance target remains the two exact legacy `paper.html?id=...` routes.

### B. PDF-series publication path

`PUBLIC_SITE/PAPERS/<paper-id>/paper.json` plus an already typeset PDF → `tools/publish_papers.py` → `PUBLIC_SITE/generated/papers.json` → external `reader.html?paper=...` route.

Current repository evidence:

- `PUBLIC_SITE/PAPERS/` contains `_templates/` and `cruller-rubin/`; no Paper A or Paper B packet is present.
- The generated PDF-series index contains only `cruller-rubin` R0.
- The PDF-series README requires a pre-typeset, visually checked PDF and `published: true`; the indexer validates metadata, paths, PDF completeness/readability and sequence uniqueness. It does **not** compile raw TeX or Markdown into a PDF.
- `publish-paper-series.yml` runs the indexer and commits the generated index. It is an index-publication workflow, not the GitHub Pages deployment workflow.
- The repository has no `PUBLIC_SITE/paper.html` or `PUBLIC_SITE/reader.html` source file. The external reader implementation and live host were not inspected.

A future PDF-series entry for A or B would therefore be a separate presentation namespace. It cannot silently replace the legacy Code Grurple acceptance target.

### C. GitHub Pages Conversation Viewer / Whirligig path

`CONVERSATION_VIEWER` plus the Whirligig instrument → `tools/build_whirligig_pages.py` → Pages artifact `_site` → `deploy-conversation-viewer-pages.yml`.

The current builder/deployer is scoped to the Conversation Viewer and Whirligig. It does not build the Paper A/B legacy reader or include the PDF-series reader/index as a paper route. A successful Pages deployment in this namespace is not evidence that either Code Grurple paper route works.

### No-cross-namespace completion rule

Keep these as distinct typed states:

- `GRURPLE_LEGACY_ROUTE`: the required `paper.html?id=...` target.
- `PDF_SERIES_READER`: the separate `reader.html?paper=...` target.
- `VIEWER_PAGES`: Conversation Viewer / Whirligig Pages deployment.

A feed entry, generated index row, publisher Action success or unrelated Pages deployment cannot promote another namespace to PRESENTED. A P0 route passes only after the exact required route renders the pinned source version and the seven-point presentation/version acceptance boundary is independently observed.

This is the substantive architecture improvement from this run: the missing edge is not merely “a page has not been checked.” The repository has two different paper publication contracts and a separate Pages deployment contract, with no verified composition into the required legacy A/B routes.

## 4. P0 disposition and repair boundary

Both Paper A and Paper B remain **PRESENTATION_PENDING / NOT_OBSERVED**, neither PASS nor FAIL.

No route probe was made. No authenticated site-editor session, owner preview or authorized browser readback was available. The external custom-site host was not treated as verified or dead.

The current Code Grurple roster gives Mercer QA responsibility only. The active signal asks for a site-capable worker to repair the shared rendering path, but no named repair owner is assigned. Tern retains control-plane routing authority.

Safe next sequence:

1. Tern names or obtains an authorized site-capable repair owner.
2. Preserve the existing `paper.html?id=...` acceptance target unless Nathan explicitly authorizes migration.
3. The site-capable owner repairs/deploys the legacy reader path and supplies deployment identity plus authorized preview/readback.
4. Mercer independently checks both routes against the pinned Paper A/B blobs and the shared presentation checklist.
5. Standdown remains blocked until both actual routes pass, or Nathan explicitly changes the interlock.

If the project elects to migrate to `reader.html?paper=...`, that is an acceptance-target change requiring explicit authority. It is not an automatic substitute.

## 5. Tooling, Mersearch and source controls

The existing publisher/indexer, `publish-paper-series.yml`, Pages workflow and Whirligig builder were inspected before considering new tooling. Math Hopper #578 materials, Whirligig Kernel 0 and the current resource-capability audit were checked. SciSpace is available as a connected research app but is not relevant to this route-identity question. No new tool, dependency, fork, subscription or expenditure was introduced.

Mersearch was not executed: no callable Mersearch connector or local Mersearch executable was available, no local repository checkout was present, and all four shared request lanes remain occupied/requested. Their existing request identities were left untouched. This GitHub/source-file audit is not represented as a Mersearch result or exhaustive archive search.

The HsH, SAT archive and HSH_RESOURCES front doors were read. HSH_RESOURCES was treated as an internal reference boundary; no PRIOR_ART/private prior-art material was opened or linked publicly. The old-archive lateral-reading cursor advanced through `SAT Mark V/TheTANGLE.txt`, lines 1681–1720, same source blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`; next cursor 1721. This was unrelated fictional/worldbuilding material, not physics evidence.

FIE was last rereviewed November 10; next review is November 24. Tern's h773:s4 deep-upkeep review reset the five-receipt cursor. The verified h774:s2 Meridian receipt is one subsequent work-product receipt; no new full deep sweep was due or claimed. Task graph remains 16 declared branches / 18 records; no graph mutation.

Campaign status remains P0 ACTIVE; P1 November 9 cognition OVERDUE / NOT READY and Orson-owned; P2 November 30 geometry HOLD; P3 December 14 full theory INCOMPLETE.

## 6. Handoffs and operational integrity

The incoming Meridian h774:s2 packet was read after this Mercer run had started. It remains POST_START_OPTIONAL_CONTEXT_ONLY / REPOSITORY_ONLY; a later inbox marker records repository consumption only. No direct thread delivery or historical identity continuity is claimed.

The next deterministic label is Ravel h774:s4. Ravel's existing inbox is the repository fallback; no authenticated current Ravel thread was established. The successor packet is optional context only, with no task, response obligation, deadline, review request or ownership transfer.

No Lean theorem or build was needed: this is a workflow graph, not a new mathematical/geometric proposition. No physical system, dataset, units, calibration, covariance, fit, prediction, independent holdout or falsification threshold was invented. No physical calculation, manuscript edit, site write, route migration, issue, PR, public publication, theory promotion or BEDROCK change occurred.

The existing :36 and :48 automations remain enabled and unchanged; :12 remains disabled. No task identity, schedule, phase, prompt, cadence or enabled state was changed. No sixth task was created. The current :36 wrapper remained IN_PROGRESS at last observation; scheduler-wrapper completion is not confirmed.

**Disposition:** P0_ROUTE_NAMESPACE_SEPARATION / EIGHT_PROTECTED_BLOBS_EXACT / NO_P0_TRIGGER / BOTH_ROUTES_PRESENTATION_PENDING_NOT_OBSERVED / SITE_REPAIR_OWNER_UNASSIGNED / TERN_ROUTING_AUTHORITY_PRESERVED / NO_THEORY_OR_AUTOMATION_CHANGE.
