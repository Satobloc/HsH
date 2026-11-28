# Mercer h1166:s0 — Current-main P0 route-status refresh

**Disposition:** DISCOVERY_CURRENT_MAIN_SUCCESS / SOURCE_LEVEL_READER_POLICY_FAIL / NAVIGATION_STRICT_DATE_GATE_FAILURE / PAPER_A_B_LIVE_ROUTES_NOT_OBSERVED / NO_RELEASE.

## 1. Scope and authority

This is assistant-level work under the deterministic Mercer routing label, not authenticated participation by a historical Mercer instance or a current Mercer ChatGPT thread.

The historical direct-user appointment is the 2026-10-01 message `bb8ecf64-8863-4ee7-a078-ca8cc4104974` in conversation `6a3a2037-3698-83ea-924d-2cb8c4ac7701` (raw export blob `d828fef5352045cb4d9486fdbeabd04043c4c119`). It supplies a broad equations/dimensional-analysis/constitutive-physics/coarse-graining orientation, but is not a standalone signed specialist charter.

The current Code Grurple roster narrows Mercer to **independent Paper A/B presentation QA only**. Meridian retains shared presentation implementation; Tern retains P0 release/standdown authority. Paper A/B manuscript content is closed. Accordingly, the requested Lane 00 physical-geometry comparison was not performed in this activation. This report audits the geometry of source-to-presentation routing only; it does not reopen manuscript mathematics or theory.

## 2. Current branch and workflow readback

Prewrite HsH main was `6d50944990a3b88ed45a6cf5bb713b367a8554ae`.

**Discovery refresh:** [run #46152295327](https://github.com/Satobloc/HsH/actions/runs/46152295327) completed SUCCESS. Its job checked out main and logged the exact HsH source cut `6d50944990a3b88ed45a6cf5bb713b367a8554ae` and SAT source `4b3961a6b8b38e58f103a9b224665d53d385f1a8`; both repositories reported `complete`. The generator reported 18,449 documents, 48 docket entries, 417 square visuals, and six extraction errors. It created generated-only main commit `15e8c9e99b7a3ff68115c0dccf8d4977b0f7336e`, whose only changed path is `PUBLIC_SITE/generated/discovery.json`.

This resolves the earlier pending-currentness question: the latest discovery snapshot was regenerated from the exact prewrite main source cut. The generated JSON is approximately 69.7 MB; the available GitHub content reader rejected the decoded payload because it exceeds its 64 MiB response limit. The current file blob locator is `a91102ab7c967f07ead65dfa192d8fddde4c4c02`. Therefore the workflow's schema/completeness validation is verified from its log, but the full record-level JSON was not independently parsed in this runtime.

**Navigation:** [run #46152295632](https://github.com/Satobloc/HsH/actions/runs/46152295632) completed FAILURE on the same source head. Strict date-tag audit reported 1,040 dated-and-correct captures, zero needing renaming, zero unresolved collisions, two undatable conversations, and 894 skipped non-conversation/bad-JSON records. The strict step exited 1. Viewer build, chronology/index generation, tests, validation, artifact upload and GitHub Pages deployment were skipped. No deployment is claimed.

The discovery success and navigation failure are different workflow results. A successful discovery generation is not reader-route acceptance or deployment.

## 3. Paper A/B source identity and route topology

Eleven current source/control pins were independently fetched. All match the current roster/feed identities:

| Object | Current blob |
|---|---|
| Paper A R1 source | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| Paper B R1 source | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Paper A post-recovery acceptance rerun | `99da88416f1207abcf8359a60649bebd3898af17` |
| Paper A posting handoff | `b9c065a8b452d64fb7d55fdc996766e6d1c2279f` |
| Paper B first-pass review | `a057da2e700dd49a7f7a35c88ce60f15b786674c` |
| Paper B originator acceptance | `9c14cfa3372b70b60b5ae6309b8581477858d7d3` |
| `PUBLIC_SITE/PAPERS_FEED.json` | `d395b4ff5b551ebc208d4c5247fe3e1056218ac2` |
| `PRESENTATION_GATE.md` | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| `READER_ROUTING_REGISTRY.md` | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| `PRESENTATION_CONTRACT.md` | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| `tools/site_discovery.py` | `97ff9c6d00544251c05bd6bb6053907805438f3e` |

The current feed preserves two separate sandbox-manuscript routes:

- Paper A: `paper.html?id=convergent-motifs-r1`; status `sandbox_staged_accepted_r1`; `posted_date` remains null.
- Paper B: `paper.html?id=boundary-weak-emission-r1`; status `sandbox_posted_reviewed_r1`; historical `site_version` 34 and `posted_date` 2026-09-23.

The feed's source blobs match both fetched manuscript files. These are source-identity checks, not live rendering checks.

Three route families must not be conflated:

```text
Paper A source blob ──> PAPERS_FEED entry ──> paper.html?id=convergent-motifs-r1
Paper B source blob ──> PAPERS_FEED entry ──> paper.html?id=boundary-weak-emission-r1

Eligible repository files ──> generated/discovery.json
                           └─> reader.html?mode=browse&repo=...&path=...

Curated PDF series ──> generated/papers.json
                   └─> reader.html?paper=<reader_id>
```

The current `generated/papers.json` is a distinct PDF-series index: nine entries, updated 2026-11-28T09:04:30Z. It contains historical source compilations and Cruller-Rubin, but neither Paper A nor Paper B. The current `PUBLIC_SITE/PAPERS/` directory likewise has no A/B derivative. This is not by itself a route failure: A/B are designated sandbox-manuscript routes, not members of that PDF-series index. It does mean the PDF index cannot be cited as evidence that either sandbox route is rendered.

The earlier h1139 statement that the PDF directory held only README/templates/Cruller is superseded: additional historical source-compilation directories are now present. The A/B absence remains unchanged.

## 4. Source-level routing discrepancy

The current `tools/site_discovery.py` still has the previously identified behavior:

- `eligible(path)` admits supported file extensions without a `WORKSPACES/**` default-deny.
- `route(repo,path)` returns a generic `reader.html?mode=browse&repo=...&path=...&kind=file` target.
- The excerpt path can create bounded Markdown/text excerpts for eligible files.

That conflicts with the current Presentation Gate, Reader Routing Registry and Presentation Contract. The registry expressly places `WORKSPACES/**` behind an explicit presentation derivative and requires unknown/machine/control paths to return `PRESENTATION PENDING` or remain absent; raw markup must not be the default fallback.

Because the latest discovery run executed this unchanged source on the current main cut, the **source-level reader-policy defect remains current**. The full generated JSON could not be parsed here, so this report does not reuse the earlier snapshot's 11,462 workspace-record count as a current count and does not claim a fresh record-by-record count.

## 5. Existing repair and proof boundary

Existing [PR #2009](https://github.com/Satobloc/HsH/pull/2009) remains OPEN / DRAFT / UNMERGED at head `039f90a61e337ff324d12f138ec2d3a56dc9416f`, 14 commits ahead and 1,787 behind current main. Its proposed patch introduces metadata-only workspace records, `PRESENTATION_PENDING`, null reader targets, no raw excerpts or docket inclusion, and sanitization of legacy workspace records in stale fallback. Its test diff covers those conditions, but no exact-head CI result was found. This is a candidate repair, not a deployed fix.

Existing [PR #2757](https://github.com/Satobloc/HsH/pull/2757) has exact-head Lean build [#46150982969](https://github.com/Satobloc/HsH/actions/runs/46150982969) SUCCESS on head `bd1b631ea03dc259140962b56b732641daddd00d`. It formalizes an abstract source-cut/PublishedKey/rebase contract. It does not modify `site_discovery.py`, implement the workspace presentation gate, or establish either live Paper A/B route. No new Lean module or local Lean execution was needed for this presentation QA.

## 6. Live route and release boundary

A direct web-open attempt did not yield an inspectable page, and the connected Browser surface had no active originating browser context. Therefore:

- Paper A live route: **NOT_OBSERVED**.
- Paper B live route: **NOT_OBSERVED**.
- Visitor-visible layout, mathematics, citations, narrow-width behavior and source affordances: **NOT_OBSERVED**.
- GitHub Pages viewer deployment from the latest navigation run: **NOT_DEPLOYED by that run**.
- External sandbox-manuscript deployment identity: **NOT_VERIFIED**.

These are not claims that either external route is down. No live route failure or acceptance is inferred from unavailable browser access.

**P0 disposition remains:** source-level presentation safety **FAIL**; Paper A/B live-route acceptance **NOT_OBSERVED**; deployment **NOT_VERIFIED**; release/standdown **NOT_AUTHORIZED**. Tern retains release authority.

## 7. Limits and next cursor

No manuscript content was reviewed or changed. No renderer, feed, route, discovery script, PR, workflow, deployment, paper gate, task graph or worker checkpoint was modified. No physical calculation, fit, prediction, independent measurement, CODATA scoring, SAT-O/Blockwave equation change or theory promotion occurred.

Next authorized sequence:

1. Meridian or the authorized site implementation owner resolves the workspace default-deny/presentation-pending defect in the production discovery path.
2. Run the repair's full tests and exact-head CI on a current-main-based candidate; preserve stale-fallback and thumbnail integrity tests.
3. Rebuild discovery and confirm workspace records have no default reader, no excerpt and no docket membership unless an explicit derivative is registered.
4. Verify the current-main generated snapshot and navigation/deployment workflow separately.
5. Mercer independently checks both designated `paper.html?id=...` routes in a site-capable browser against the exact feed-pinned source blobs and the seven-item acceptance checklist.
6. Tern alone decides release/standdown after the required evidence is complete.

## 8. Continuity and cadence

No authenticated current Mercer thread was established. The latest Mercer README pointer is h1082 and the trial checkpoint is older; newer shared P0 reports exist through h1139. These worker-local pointers were not rewritten because they are owner-controlled and the current assignment is limited to independent QA.

No incoming h1165:s4 Meridian receipt or handoff was found; the preceding Kestrel packet is addressed to Meridian, not Mercer. No predecessor response or delivery is inferred. The next ring label is Ravel. Any repository inbox context is optional only and creates no assignment, response obligation or ownership transfer.

The FIE rereview remains next due December 8 (last full review November 24). The unrelated-source break was completed earlier on November 28; it was not repeated. P1 remains overdue/frozen/NOT READY and Orson-owned; P2 remains HOLD for November 30; P3 remains incomplete for December 14. No paper gate advanced.

**Final:** current-main discovery freshness is now verified, but the generated reader policy remains unsafe at source level and the navigation deployment gate still fails. The two actual Paper A/B routes remain unobserved. No release is authorized.