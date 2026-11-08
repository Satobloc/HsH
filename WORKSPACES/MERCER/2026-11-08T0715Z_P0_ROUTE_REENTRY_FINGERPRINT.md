# Mercer :36 | Code Grurple P0 route re-entry fingerprint

**Date:** 2026-11-08  
**Actual invocation:** 2026-11-08T07:15:08Z  
**Nominal scheduled slot:** 2026-11-08T07:36:00Z (invocation began 20m52s early)  
**Run key:** `REVROT3-19-20261011:679:s3`  
**Deterministic selection:** h=679; seq=5h+3=3398; 3398 mod 19=16; Mercer (index 16).  
**Successor:** Ravel (index 17), next ring step `REVROT3-19-20261011:679:s4`, nominal 07:48Z.  
**Automation:** existing `Workshop Relay :36 | Worldtube`, task ID `6a9f52b69ec08191b0a2ba24a074f781`; DTSTART `2026-10-01T14:36 America/New_York`; hourly RRULE. No task, ID, schedule, phase, or title mutation. No sixth task.

**Disposition:** `P0_REENTRY_FINGERPRINT_ESTABLISHED / NO_REENTRY_TRIGGER / CODE_GRURPLE_ACTIVE`. This is a source-grounded assistant reconstruction under a deterministic worker label, not an authenticated Mercer ChatGPT instance.

## 1. Authority and assignment boundary

The current :36 lane charter is Nathan's architecture/workflow/prediction remit. The historical Mercer specialist remit is separately preserved from a direct user message in raw HsH conversation `6a3a2037-3698-83ea-924d-2cb8c4ac7701`, message `bb8ecf64-8863-4ee7-a078-ca8cc4104974`, raw blob `d21e251df093013903cc19789ded562f83b6e6ea`. That historical :48 remit covers equations, dimensional analysis, constitutive physics, coarse-graining, forces, and quantitative consequences, with source/invention separation and no target-fitting. It is not the present :36 assignment.

The live Code Grurple roster remains controlling: Mercer is restricted to **Paper A/B presentation QA**. Do not reopen manuscript content, scientific/editorial review, PRIOR_ART, or general theory work. The P0 interlock therefore takes precedence over ordinary theory/prediction work in this run.

No authenticated usable Mercer thread was recovered. Personal-context search found historical Mercer Free Build material and repository continuity, but no current exact conversation ID/usability. No new ChatGPT thread was created, renamed, or treated as the historical Mercer instance.

## 2. Preflight actually read

Live HsH sources:
- `BEDROCK.md`, blob `527924246cc25caf7fac02dce4b20f024013cd19` (97,935 bytes; 627 lines read in ranges).
- Steering Charter 2026-10-26, blob `04822f3e48f746e9e464d893636ed4a670d68683`.
- Three Paper Campaign 2026-10-26, blob `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`.
- Three-repository onboarding, blob `fe40260cda5ce360909f2adfd64a3cc3e2c92a05`.
- Revival Rotation V3 `7373ece95ead0f2f9e57d7e5ed3bc5c77fa76c14`; V4 not-found revival `6761337dfcd0847226ee7baad84db0a9c496760a`; thread routing `d9ea7c3a04e03822c65ee231d0b9545bf37907bd`; duplicate-run guard `14531964363c1fa3e6bf1e493a6d744d8a02d4da); navigation preflight `ce8d8be6e07340eff1f0e06d66b762e8ae8da358); workflow orientation V2 `2bb6d996ca61f41b2b3fb34480cab1acf906bd4f`.
- Current Code Grurple roster, blob `cc96c0bfafc95c54e7960899c7306031e5abce17`.
- Mercer README `1b888e028f0c337828472fde1d3726c111fda6c8`; Trial Checkpoint `dbbe803e6c9f4cdaede79cf93c625ddfc208df90`, whose header said Run 159 despite appended Runs 160 and 161.
- Recent receipts read: Mercer h675:s4 at 03:48Z; Aldus h677:s3 at 05:36Z; Nadir h678:s2 at 06:24Z and its late-status/correction amendments through 06:50Z. The h678:s3 Enheduanna recipient failure is recorded in the Nadir amendment chain; it is not a Mercer receipt or an authenticated Enheduanna thread delivery.
- Main branch current head: `8c7612d246794da05492ad25c773ce92cb8289d5`, committed 07:14:51Z. No active Mercer-specific research branch was identified.
- HsH, SAT archive, and HSH_RESOURCES front doors were consulted. HSH_RESOURCES Tool Chest and AI start page were checked. No quarantined PRIOR_ART material was opened.

Mersearch-first constraint: no Mersearch connector or local pinned checkout/runtime was available, and all four shared request lanes were occupied. No request was submitted, overwritten, or reset. The Mercer historical charter was recovered from the exact raw conversation export already stored in HsH; this is source recovery, not a claim that Mersearch ran.

## 3. New workflow improvement: P0 re-entry fingerprint v1

The prior Mercer QA record used a broad commit comparison and a list of event triggers. This run adds a compact, deterministic eight-file identity vector so a future QA pass can detect whether the actual A/B source-to-reader control surface changed before repeating a broad diff.

Canonical fingerprint input is the UTF-8 sequence of `path<TAB>Git-blob-SHA1\n` records in the order below, with a final newline. The resulting manifest SHA-256 is:

`833ad26d6082dbba7278f01be2bf896c588a3db5d7fe37e762cec7a7f1370161`

| Source/control file | Current Git blob SHA-1 |
|---|---|
| `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex` | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| `PUBLIC_SITE/PAPERS_FEED.json` | `e3552fdac0f187b066b59a9742563094efffe011` |
| `PUBLIC_SITE/PRESENTATION_GATE.md` | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| `PUBLIC_SITE/PRESENTATION_CONTRACT.md` | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| `PUBLIC_SITE/generated/papers.json` | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` |
| `.github/workflows/deploy-conversation-viewer-pages.yml` | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` |

This fingerprint is repository-state detection only. It is not a proof of deployment identity, route availability, rendering correctness, or physical H(s)H behavior. It also does not hash an external ChatGPT Sites deployment.

### Re-entry event/action matrix

| New event | Required bounded action |
|---|---|
| Paper A or B source blob changes | Rebind the exact feed pin; invalidate any prior derivative evidence for that source. |
| `PAPERS_FEED.json` changes | Recheck both IDs, source pins, route IDs, and status metadata. |
| Presentation gate, registry, or contract changes | Re-evaluate the format and default-deny acceptance boundary. |
| A/B derivative or derivative manifest appears/changes | Verify source → adapter/parser → semantic representation → renderer/config → derivative digest. |
| Deployment workflow or deployment manifest gains A/B scope | Verify the exact build/deployment identity and its source/derivative inputs. |
| A real deployment ID, owner preview, or authenticated browser context becomes available | Perform one bounded readback per affected route, with version identity and all visual checks. |
| No listed event | Do not repeat route probes merely because another hourly slot elapsed. Preserve PRESENTATION_PENDING / NOT_OBSERVED. |

This is a reusable sentinel, not a new tool or a replacement for issue #1273's artifact-chain acceptance proposal.

## 4. Current read-only verification

A scripted 15-assertion audit against freshly fetched repository files passed **15/15**:

1. Paper A feed pin equals the current source blob.
2. Paper B feed pin equals the current source blob.
3. Both entries remain `sandbox_manuscript`.
4. Paper A remains staged accepted R1 with no posted date.
5. Paper B remains reviewed R1 with posted date 2026-09-23.
6. The generated PDF index excludes A and B.
7. The generated PDF index currently contains only Cruller.
8. Presentation Gate requires a derivative before ordinary display and provides PRESENTATION PENDING.
9. Presentation Gate forbids raw source as the default.
10. Reader Routing Registry is default-deny.
11. Reader Routing Registry does not permit Markdown/TeX as default public formats.
12. Presentation Contract retains the PDF/format-specific source boundary.
13. The current Pages deployment workflow omits both A/B route IDs.
14. The live roster confines Mercer to A/B presentation QA and forbids reopening manuscript content.
15. The live roster requires both actual reader-facing routes to pass.

A separate main-branch comparison from the previous Mercer QA baseline `7457d0441bc2c549c75d0ea37ee8c0f8342d5463` to current main `8c7612d246794da05492ad25c773ce92cb8289d5` contains **113 commits / 65 changed paths / zero A/B route-trigger paths**. The newest commit publishes Orson-owned VEY-034 from issue #1481; it does not alter either A/B source, feed, presentation controls, generated paper index, or Pages workflow. Orson's P1 ownership is untouched.

The current feed still maps:
- Paper A `convergent-motifs-r1` to accepted source blob `13d166...`, status `sandbox_staged_accepted_r1`, `posted_date=null`.
- Paper B `boundary-weak-emission-r1` to reviewed source blob `0a1dca...`, status `sandbox_posted_reviewed_r1`, `site_version=34`, `posted_date=2026-09-23`.

Both feed entries retain `site_display=sandbox_manuscript` and their legacy `paper.html?id=` route IDs. The generated PDF index contains only `cruller-rubin`. Exact repository fetches of `PUBLIC_SITE/paper.html` and the A/B `paper.json` paths returned NOT_FOUND. These are repository findings only; they do not establish that the external Sites URLs are dead.

**Route status remains:** source pin PASS; feed binding PASS; derivative provenance NOT OBSERVED; deployment identity NOT OBSERVED; live readback NOT OBSERVED; visual acceptance NOT OBSERVED. Both routes remain `PRESENTATION_PENDING / NOT_OBSERVED`. The earlier one-bounded-attempt rule remains in force. No route probe was repeated because no new access/deployment trigger occurred.

## 5. Existing proposal and formal-proof boundary

Existing issues #1193, #1144, and #1273 remain the relevant public proposals for renderer conformance vectors, format-adapter requirements, and artifact-chain binding. Issue #1273 remains the single published artifact-chain proposal; no duplicate issue, comment, PR, or publisher submission was created.

The previously recorded `MercerArtifactChainAcceptance.lean` draft is known only by SHA-256 `6bbd51c2d2c6da4efb3b5fc9f0cbbef588f26137f50e29f3e169834c086d1bc4`; its source bytes are not present in the current repository search/readback. The local runtime has no `lean`, `lake`, or `elan`, no local HsH checkout, and no `gh` CLI. Existing PR #951 is Elias's separate publisher/receipt formalization and was not repurposed. The current P0 scope does not authorize a new branch or CI dispatch.

Therefore: `LEAN_NOT_RUN / SOURCE_BYTES_UNAVAILABLE / NO_CI_AUTHORIZATION`. The 15/15 script assertions are not Lean proofs. No source-to-formalization equivalence, GitHub authenticity, live route behavior, or physical claim is inferred.

No measured physical system/dataset, units, covariance, calibration, fit, prediction, or independent measurement was used. No SAT-O or Blockwave equation was changed. No BEDROCK promotion, theory promotion, new Lean theorem, PDF derivative, renderer, deployment, paper-gate advancement, or public publication occurred.

## 6. Continuity and freshness

- Unrelated archive reading completed: `SAT Mark V/TheTANGLE.txt`, lines 1401–1440, blob `3181b6cad85bbd76bd1017938e0dbf67baf03752`. Next cursor: line 1441. This was an actual reading interval, not a claimed physical break.
- FIE last full review remains 2026-10-27; the 14-day review point is 2026-11-10. Not yet due.
- Campaign gates remain separate: P1 Orson November 9 (NOT READY); P2 November 30 (HOLD, no selected measured system); P3 December 14 (full-theory paper incomplete).
- Four Mersearch request lanes remain occupied. No request was touched.
- No new tool, fork, dependency, subscription, or paid service was created.

## 7. Next worker and delivery

Next deterministic worker label is Ravel, ring index 17, for `REVROT3-19-20261011:679:s4`. Ravel's remit remains finite cores, worldtubes, particle geometry, intersections, deformation/nesting, and observable triangulation. The current P0 QA note is optional context only; it does not assign Ravel a Code Grurple task or transfer ownership.

No authenticated current Ravel thread was recovered. The older raw ID in Ravel continuity is historical/exhausted; no ChatGPT-thread post, consumption, or acknowledgment is claimed. A Common handoff and Ravel inbox append are repository-only delivery.

## 8. Scheduler honesty

The active roster and automation run context identify the existing :36 task and its original hourly schedule. A read-only Automations peek returned `Action not found`, so an independent live scheduler snapshot/run-completion readback is unavailable in this invocation. No scheduler mutation was attempted. Because this invocation began before the nominal 07:36Z slot, a later invocation must honor the same run key and this receipt rather than create a duplicate research record.

**Final:** `WORKFLOW_IMPROVEMENT_COMPLETE / P0_NO_REENTRY / ROUTES_PENDING / LEAN_NOT_RUN / NO_THEORY_PROMOTION / SCHEDULER_COMPLETION_UNVERIFIED`.
