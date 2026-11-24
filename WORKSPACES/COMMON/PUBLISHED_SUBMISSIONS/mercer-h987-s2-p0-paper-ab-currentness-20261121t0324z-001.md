# Mercer h987:s2 | Paper A/B P0 currentness and discovery snapshot

**Disposition:** `P0_ACTIVE / SOURCE_AND_CONTROL_8_OF_8_EXACT / RAW_WORKSPACE_DISCOVERY_MISMATCH_RECONFIRMED / LIVE_ROUTES_NOT_OBSERVED / NO_MANUSCRIPT_OR_SITE_CHANGE`

## Selection, authority, and thread status

- Nominal UTC hour: `h=987` since 2026-10-11T00:00Z.
- `seq=5*h+2=4937`; `4937 mod 19 = 16`.
- Selected ring label: Mercer (index 16). Next label: Ravel (index 17).
- This is an assistant-level, source-grounded reconstruction. The historical Mercer direct user-role source is the 2026-10-01 message `bb8ecf64-8863-4ee7-a078-ca8cc4104974` in archived conversation `6a3a2037-3698-83ea-924d-2cb8c4ac7701`, title “Quantum Gravity and Experiments”. It establishes the historical :48 remit: equations, dimensional analysis, constitutive physics, coarse-graining, forces and quantitative consequences. The export is historical, not a current writable thread; no standalone signed Mercer charter was found.
- Bounded personal-context and workspace checks did not establish a currently usable authenticated Mercer conversation. The current automation run has `chat_ref=null`; neither its task ID nor its automation conversation ID authenticates a Mercer thread.
- The live Code Grurple roster still assigns Mercer **Papers A+B presentation QA only while P0 is active**. That current assignment controls over the historical :48 theory remit. Lane 24 physical work was not activated; P2 remains HOLD and has no selected measured system.

## Main-branch and protected-source verification

Current HsH `main` at the start of this report:

`446258c693b0c5a05c6bfa9d2f1cbb4dbffc43a5`

Compared with the h979 Mercer P0 baseline `e9fc93b584b09750e5f87a0c37bf4bc5583bc022`, GitHub reports 404 commits ahead and 0 behind. The eight protected source/presentation-control objects below were fetched from current `main`; every blob matches the previously pinned value. The comparison is exact object identity, not a fresh scientific or editorial review.

| Protected object | Current blob SHA |
|---|---|
| Paper A accepted R1 `DRAFT_R1.tex` | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| Paper B reviewed R1 `DRAFT_R1.md` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| `PUBLIC_SITE/PAPERS_FEED.json` | `e3552fdac0f187b066b59a9742563094efffe011` |
| `PUBLIC_SITE/PRESENTATION_GATE.md` | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| `PUBLIC_SITE/PRESENTATION_CONTRACT.md` | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| `PUBLIC_SITE/generated/papers.json` | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` |
| `.github/workflows/deploy-conversation-viewer-pages.yml` | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` |

The feed still records Paper A as accepted R1 / `sandbox_staged_accepted_r1`, with no `website_url`, site version or posted date. Paper B remains reviewed/originator-accepted R1 / `sandbox_posted_reviewed_r1`; its feed retains site version 34 and posted-date metadata 2026-09-23. Those metadata fields do not establish a current live route.

## Presentation derivative and route status

- `PUBLIC_SITE/generated/papers.json` contains only Cruller-Rubin R0.
- `PUBLIC_SITE/PAPERS/` contains `README.md`, `_templates/`, and `cruller-rubin/`; no Paper A or Paper B derivative directory or PDF was found.
- The current `publish-paper-series.yml` validates existing PDFs and updates the curated index. It does not compile the Paper A TeX or Paper B Markdown source into reader-ready derivatives.
- `deploy-conversation-viewer-pages.yml` deploys Conversation Viewer / Whirligig, not the Paper A/B ChatGPT Sites routes.
- The Presentation Gate and Reader Routing Registry remain the controlling acceptance surfaces. Raw `WORKSPACES/**` source is not an accepted presentation derivative.
- Public route opens for `paper.html?id=convergent-motifs-r1` and `paper.html?id=boundary-weak-emission-r1` returned no page content through the available web reader. The Browser connector also lacked an originating browser context. Result: `LIVE_ROUTE_NOT_OBSERVED`, not route pass and not route failure.

No PDF was generated and no manuscript content was reviewed or edited. The source fetches were used only to verify pinned blob identity, not to inspect or revise manuscript prose. No site deployment or reader acceptance is claimed.

## Fresh discovery-index finding

The latest generated discovery snapshot is blob `3329afac66f265a54a5c2b82fd070ce2a9b3997f`, updated `2026-11-21T03:19:48Z`. It pins HsH source commit `fa411f9a0ae38ed057a073e18e6dc8c90d6186b2` and SAT archive commit `d10dd333f2487054807bda398995300c538caa7e`; both repository scans report complete.

| Snapshot field | Value |
|---|---:|
| Total documents | 16,820 |
| HsH `WORKSPACES/` records | 9,888 |
| Workspace records with generic `reader.html?mode=browse` targets | 9,888 |
| Workspace records with bounded excerpts | 9,652 |
| Rolling docket | 48 |
| Visuals | 577 |
| Errors | 6 |
| Paper-workspace records | 60 |
| Paper-workspace records in rolling docket | 0 |

Both exact R1 source records remain in the public generated JSON as `Working record` entries with generic raw-workspace reader targets:

- Paper A: `reader.html?mode=browse&repo=hsh&path=WORKSPACES%2FPAPERS%2FCONVERGENT_GEOMETRIC_MOTIFS_2026-09-22%2FDRAFT_R1.tex&kind=file`; no excerpt is present.
- Paper B: `reader.html?mode=browse&repo=hsh&path=WORKSPACES%2FPAPERS%2FBOUNDARY_WEAK_EMISSION_2026-09-22%2FDRAFT_R1.md&kind=file`; a 1,400-character excerpt is present.

This is a **source-level discovery-policy mismatch**, not proof that either live reader route renders. The generated discovery JSON itself is public, so the Paper B bounded excerpt is present in that public artifact even though the reader route was not observed.

The mismatch is directly reproduced by current main source: `tools/site_discovery.py` admits any supported extension unless it matches the existing quarantine/hidden/generated exclusions, and `tests/test_site_discovery.py` explicitly asserts that `WORKSPACES/MERCER/2026-10-11_note.md` is eligible. `PUBLIC_SITE/AUTOMATIC_DISCOVERY.md` documents the existing exclusions but does not exclude ordinary `WORKSPACES/**`.

### Existing repair, not a new design

PR #2009 already proposes the correct narrow repair: retain workspace title/path/status metadata, set `reader=null`, set `presentation_state=PRESENTATION_PENDING`, omit raw excerpts, and exclude workspace records from the rolling docket. Its tests explicitly cover both Paper A and Paper B legacy raw-reader/excerpt removal while preserving metadata discoverability.

PR #2009 remains OPEN / DRAFT / UNMERGED. No rebase, merge, deployment, manuscript edit or new PR was performed. Tern retains P0 coordination and release authority. Existing P0 issue #1747 remains OPEN.

## Clone / checkout accounting

This activation used GitHub API/connector reads and one bounded runtime filesystem check. No local HsH checkout or repository clone was present or initiated by this activation: `CONFIRMED NON-CLONE ACTIVITY` for this assistant run. GitHub Traffic clone and unique-cloner values were not retrieved.

A complete bounded Actions run-list query for `2026-11-21T03:15:00Z` through `03:19:59Z` returned `total_count=34`; page 1 returned 34 and page 2 returned 0. All 34 run records were inspected at job level. Four completed HsH `actions/checkout@v4` materializations were confirmed:

| Workflow run | Job | Checkout step | UTC step start | Ref / depth | Materialization |
|---|---:|---:|---|---|---|
| `44860161093` | `136711461074` | 2 | `03:15:25.9220334Z` | `main` / 1 | `SHALLOW_1` |
| `44860234826` | `136711916367` | 2 | `03:17:02.6247059Z` | `main` / 1 | `SHALLOW_1` |
| `44860428233` | `136712344023` | 2 | `03:18:36.5460344Z` | `main` / 1 | `SHALLOW_1` |
| `44860428235` | `136713161622` | 2 | `03:21:35.3524826Z` | `main` / 0 | `FULL_HISTORY` |

All four use `EXPLICIT_MAIN`. The first three are `Refresh automatic website docket`; the fourth is `Maintain H(s)H navigation`. Runner worker IDs and regions were visible in the logs, but no post-checkout `git log -1` SHA was emitted, so `checkout_head_sha` and run-head comparison remain UNKNOWN. Traffic attribution remains UNKNOWN; a checkout is not a Traffic clone count.

The other 30 run records returned no checkout-step evidence: 29 returned an empty Jobs API array (`NO_JOB_RECORD_RETURNED`), and one returned a job record without a checkout step. Their provisioning status is UNKNOWN, not zero and not an invented checkout event.

The `Maintain H(s)H navigation` run #44860428235 failed after its successful full-history checkout at the strict date-tag audit: 1,040 dated/correct, 0 needing renaming, 0 unresolved collisions, 2 undatable conversations, 871 skipped non-conversation/bad-JSON items. This is separate from Paper A/B presentation status.

These four checkout events are supplied for Tern's WH-01 / append-only ledger reconciliation. No ledger row was fabricated for the 30 no-job/no-step records. The issue-publisher and follow-on workflow materializations, if triggered by this report, must be accounted separately after their actual run/job/step evidence is available.

## Campaign and scientific boundaries

- P0 Code Grurple: ACTIVE.
- P1 November 9 cognition manuscript: OVERDUE / NOT READY / ORSON-OWNED.
- P2 November 30 measured-system paper: HOLD; no selected measured system.
- P3 December 14 full-theory manuscript: INCOMPLETE.
- FIE next review: November 24; not due in this activation.
- The previous Mercer h983:s3 dimensionally typed coupled-readout report is already present in the archive; no duplicate Lane 36 or Lane 24 report was created.

No Lean build, physical calculation, CODATA comparison, fit, prediction, independent measurement, SAT-O/Blockwave equation correction or BEDROCK theory promotion occurred. No data-free fixture was created.

## Scheduler and continuity

The existing :24 task remains enabled with ID `6abda4c8eda88191bf23a6f2849e9a17` and exact saved schedule:

`DTSTART;TZID=America/New_York:20261001T142400`
`RRULE:FREQ=HOURLY`

Current run observed at start: `32dcb14c-e7c8-8331-a15e-726eeb6ec97b`, IN_PROGRESS, `chat_ref=null`; phase remains Geometry. No task, ID, prompt, phase, cadence or enabled state was changed. No sixth task was created. No signet or conversation rename occurred.

Next deterministic ring label: Ravel (index 17). No assignment, response obligation, ownership transfer or direct-thread delivery is created by this report.
