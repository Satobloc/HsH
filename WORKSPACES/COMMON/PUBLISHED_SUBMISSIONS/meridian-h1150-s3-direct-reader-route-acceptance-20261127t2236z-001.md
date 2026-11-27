# Meridian h1150:s3 | Direct-reader route authorization and Code Grurple acceptance matrix

**Nominal slot:** 2026-11-27T22:36:00Z  
**Run key:** `REVROT3-19-20261011:1150:s3`  
**Selected / next deterministic label:** Meridian (ring index 15) / Mercer (ring index 16)  
**Disposition:** `DISCOVERY_INDEX_REPAIR ≠ DIRECT_ROUTE_AUTHORIZATION / PAPER_A_B_ROUTES_NOT_OBSERVED / P0_ACTIVE`

Assistant-level, source-grounded execution under a deterministic routing label. No authenticated current Meridian conversation was established; this is not historical Meridian participation.

## 1. Authority and source continuity

The live Meridian role source card identifies three historical source conversations, including the September 8 *Meridian Free Build* conversation `6ac45d1f-17b0-83ea-ad1f-fa524602378b` and the October 21 *Meridian Minkowski Ring Analysis* conversation `6ad7e9c0-e8a0-83e9-984e-94d020de3abf`. Direct user messages support a historical solver-analysis, configurability, reproducibility and cross-formalism source-fidelity remit. No standalone signed Meridian specialist charter was recovered.

The live Code Grurple roster supersedes that broader historical remit for this activation: Meridian supports Paper A accepted-R1 presentation repair only; no manuscript rewrite absent a concrete regression or explicit request. Mercer retains independent Paper A/B presentation QA; Tern retains release/standdown authority. The current Meridian `CURRENT_WORK.md` pointer remains stale at h1074; no worker-local pointer or checkpoint was changed.

The existing-thread-first continuity lookup and prior records found no authenticated usable current Meridian thread or manually regenerated successor. Historical exports and cached automation results are not current-thread evidence.

## 2. Live source state

Current HsH `main` at final source read: `2d5982068b9c60493a6dafd56d3aeebbf5d9c6e3`.

The current protected Paper A/B source and control objects remain:

| Object | Current blob |
|---|---|
| Paper A accepted R1 `DRAFT_R1.tex` | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` |
| Paper B reviewed R1 `DRAFT_R1.md` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| `PUBLIC_SITE/PAPERS_FEED.json` | `e3552fdac0f187b066b59a9742563094efffe011` |
| `PUBLIC_SITE/generated/papers.json` | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` |
| `PUBLIC_SITE/PRESENTATION_GATE.md` | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` |
| `PUBLIC_SITE/PRESENTATION_CONTRACT.md` | `b871249564a45278383e41eebd8aaa5d8c64aa3c` |
| `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` | `277a94c553e2e17b61bb046a04781b4e44f2229f` |
| `tools/site_discovery.py` | `97ff9c6d00544251c05bd6bb6053907805438f3e` |
| `tools/publish_papers.py` | `d2cc622d1bdf79788e4e058494ab3d7d8636ad3f` |

The feed is dated 2026-10-21. Paper A is `sandbox_staged_accepted_r1`; Paper B is `sandbox_posted_reviewed_r1` with historical site version 34 and posted date 2026-09-23. Those fields establish source/feed identity, not current deployment or reader acceptance.

The generated PDF-series index contains only the Cruller-Rubin R0 artifact. `PUBLIC_SITE/PAPERS/` contains the templates and `cruller-rubin/`; it contains no Paper A or Paper B presentation derivative. The existing `publish_papers.py` validates and indexes an already typeset PDF; it does not compile the Paper A TeX or Paper B Markdown source.

## 3. Four distinct presentation surfaces

The source records and route namespaces must not be collapsed under the generic word “reader.”

| Surface | Route / object | Required behavior | Current evidence |
|---|---|---|---|
| Discovery catalog | `reader.html?mode=browse&repo=hsh&path=WORKSPACES/...` | Workspace/control paths remain metadata-only and default-denied as reading targets | Main generator still emits generic reader targets; PR #2009 proposes index repair |
| Direct reader request | A manually constructed `reader.html?mode=browse...` URL, not obtained from the discovery index | Resolve the requested path through the Reader Routing Registry on every request; unknown/workspace raw paths return `PRESENTATION PENDING` or remain absent, never raw bytes/markup | No reader-side resolver implementation or live route observation available |
| Legacy Code Grurple paper routes | `paper.html?id=convergent-motifs-r1` and `paper.html?id=boundary-weak-emission-r1` | Render the intended curated derivative matching the pinned R1 source, with SANDBOX/review/provenance affordances | Feed URLs exist; both live routes remain NOT_OBSERVED |
| PDF-series reader | `reader.html?paper=...` | Serve only a registered, verified PDF-series artifact | Generated index currently contains Cruller-Rubin only; it is not the legacy A/B route |

The GitHub Pages Viewer/Whirligig deployment is a separate application and is not evidence that any of these external Sites routes works.

The Reader Routing Registry explicitly says `WORKSPACES/**` is excluded unless an explicit presentation derivative nominates a particular artifact, and that a manually constructed URL must not bypass the rule. The Presentation Gate separately prohibits raw-source fallback.

## 4. New acceptance requirement: test the resolver, not only the index

The current P0 acceptance record already names the manual-URL rule. The missing operational test is a separately recorded direct-request negative control. A safe discovery record does not establish that the reader server rejects a request that bypasses discovery.

Define the independent predicates:

- `I`: discovery projection is safe (metadata may remain; workspace `reader` is null; state is `PRESENTATION_PENDING`; no excerpt; no rolling-docket inclusion).
- `R`: direct reader requests for raw workspace paths are denied or return `PRESENTATION_PENDING`, even when the URL is manually constructed or is an old cached URL.
- `A`: the legacy Paper A route renders a presentation derivative bound to Paper A blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`.
- `B`: the legacy Paper B route renders a presentation derivative bound to Paper B blob `0a1dca42cafd9a02faceff4ec0851659a317b2bb`.

The source/presentation acceptance condition is `I ∧ R ∧ A ∧ B`, followed by the required independent QA and Tern release/standdown decision. `I` does not imply `R`, `A`, or `B`.

### Required route test matrix

| Test | Request | Pass condition | Falsification condition |
|---|---|---|---|
| Discovery negative | Open/search a `WORKSPACES/PAPERS/**` catalog record | Metadata only; no default reader target, excerpt or docket inclusion; pending state explicit | Any raw target/excerpt or raw document presentation |
| Direct negative | Manually construct a generic reader URL for Paper A's `.tex` path and Paper B's `.md` path without following a catalog link | `PRESENTATION PENDING` or absent; no source bytes or markup | Raw TeX/Markdown or an unregistered workspace document is rendered |
| Stale-link negative | Reuse a previously generated raw workspace reader URL after the index repair | The resolver still denies/pends; cached index state cannot authorize raw content | An old URL continues to render raw source |
| Legacy positive | Open each `paper.html?id=...` route | Correct pinned R1 derivative, readable typography/math/references, visible SANDBOX and review/provenance state | Wrong source version, raw markup, missing provenance/status or broken rendering |
| PDF-series control | Open the registered Cruller-Rubin `reader.html?paper=...` route | Existing approved PDF remains readable | PDF route fails or is silently substituted for an A/B route |
| Exclusion controls | Request a `PRIOR_ART`, `QUARANTINE`, feed, manifest or control path | Denied/pending/absent | Any ordinary raw reader fallback |

For each live test, retain the exact requested and final URLs, timestamp, browser/site build identity, visible result, source and derivative digests, and screenshot or equivalent reader evidence. A discovery-index test and a browser-route test are different evidence objects.

## 5. Existing formalization reused; direct route remains outside it

Existing [PR #1471 — Code Grurple observation-gate invalidation invariants](https://github.com/Satobloc/HsH/pull/1471) already contains the theorem `docket_exclusion_does_not_imply_reader_denial`. At PR head `60df9a77d938689910a96640cb649eb9f462fa58`, module blob `82e38343f307f32e846d9758fbd4d65f6a73c812`, the theorem exhibits the Paper B discovery projection with `docketIncluded = false` and `readerTargetVisible = true`.

Its recorded exact-head Lean 4.34.0 / Lake 5.0.0 build is [Actions run #45008989924](https://github.com/Satobloc/HsH/actions/runs/45008989924), with 8,945 successful build jobs. The theorem-specific report has no axiom dependencies. Tests, lint, leanchecker, nanoda and the separate global axiom audit were skipped. PR #1471 remains OPEN / DRAFT / UNMERGED.

That theorem is useful but limited: it proves a distinction between discovery-projection fields, not the behavior of a live URL resolver. The module contains no reader `requestPath`, content-path class, resolver function or manual-URL authorization decision. Its `PathScopeWitness` is a workflow changed-path/watch-pattern witness, not a user-requested reader path. The PR's own epistemic boundary says it does not establish browser access or live rendering.

No new Lean module was created. An additional abstract theorem without the reader resolver would be another disconnected specification, not verification of the missing implementation. The existing compiled theorem is reused; direct route authorization remains `NOT_FORMALIZED / NOT_OBSERVED`.

## 6. Implementation branch and currentness

Current main's `tools/site_discovery.py` still defines `eligible(path)` by extension/exclusion/generated-directory checks without a `WORKSPACES/**` default-deny. Its `route(repo,path)` creates a generic `reader.html?mode=browse` URL, and the excerpt path can extract Markdown/text. The current main source therefore remains unsafe for workspace records.

Existing [PR #2009](https://github.com/Satobloc/HsH/pull/2009) is OPEN / DRAFT / UNMERGED at head `039f90a61e337ff324d12f138ec2d3a56dc9416f`. Against current main `2d5982068b9c60493a6dafd56d3aeebbf5d9c6e3`, GitHub compare reports 14 commits ahead / 1,437 behind, merge base `bb65b9a128589096004cda0096c7aa3169df5431`, status DIVERGED. Its three changed files are `tools/site_discovery.py`, `tests/test_site_discovery.py`, and `PUBLIC_SITE/AUTOMATIC_DISCOVERY.md`. The tests cover metadata-only projection and stale-record sanitization; they do not exercise a direct reader request. The PR does not change a reader resolver or either legacy Paper A/B route.

The current HsH tree contains no tracked Code Grurple `reader.html` or `paper.html` resolver. The only tracked `reader.js` found is `CONVERSATION_VIEWER/mersearch/reader.js`, a different application. No originating browser context was available for a live route probe. Therefore no direct URL or Paper A/B live route was probed.

Discovery currentness: Actions run [#46077661170](https://github.com/Satobloc/HsH/actions/runs/46077661170) completed SUCCESS on event head `b65297f3cf4897f9cf47f2f0ed4a2505c9e76c8d`; generated commit `5c133618ae669422b2b096d6c340536fe9692c62` is a direct child and changes only `PUBLIC_SITE/generated/discovery.json`. A later generated-only commit `2d5982068b9c60493a6dafd56d3aeebbf5d9c6e3` is a direct child of `5c133618`; I did not independently associate that second commit with a workflow run. Navigation run [#46077661202](https://github.com/Satobloc/HsH/actions/runs/46077661202) was still IN_PROGRESS at the last read. Current-main navigation acceptance is therefore unverified.

**P0 disposition remains:** presentation safety FAIL; Paper A/B live-route acceptance NOT_OBSERVED; deployment NOT_VERIFIED; release/standdown NOT_AUTHORIZED.

## 7. Governance and limits

- Meridian's current Code Grurple remit remains Paper A accepted-R1 presentation support only; Mercer remains independent A/B QA; Tern retains P0 release/standdown.
- P1 cognition remains overdue/frozen/Orson-owned; P2 November 30 remains HOLD; P3 December 14 remains incomplete.
- PWH and the task graph remain Tern-owned. The graph is `ACTIVE_SEED`, 18 records against 16 declared branches; no queue or graph mutation occurred.
- The canonical Mersearch lane-1 request is `WORKSPACES/COMMON/MERSEARCH_REQUEST.json` (Calder, `requested`); lanes 2–4 also have `requested` records. `MERSEARCH_REQUEST_LANE_1.json` is a separate older June-2025 request artifact without a live lane/status field and was not treated as the canonical lane-1 slot. No callable Mersearch action was available; no query ran and no lane was overwritten, released or retriggered.
- No new tool, dependency, fork, subscription or expense was introduced. Existing HsH source, PR #2009 and formalization PR #1471 were reused.
- No physical system or measured dataset was selected; no calculation, fit, prediction, uncertainty propagation, holdout or independent measurement was produced.
- No SAT-O or Blockwave equation was retrieved or changed. No manuscript gate or BEDROCK theory status was advanced.
- Existing Workshop Relay :36 task `6a9f52b69ec08191b0a2ba24a074f781` remains the configured hourly :36 Worldtube task; no scheduler write, ID/schedule/phase/prompt change or sixth task occurred.
- No code, site, PDF, deployment, worker inbox, or checkpoint was changed. No successor handoff or response obligation was created.

## 8. Return cursor

The next useful implementation step is not another discovery-index assertion. It is to obtain the owner-controlled reader resolver or an authenticated site-capable browser context and execute the direct-request negative controls above, separately from the legacy Paper A/B positive routes. Do not treat PR #2009 merge, a fresh discovery JSON, or a GitHub Pages Viewer build as P0 standdown. Preserve the pinned R1 sources and keep the P0 gate open until both intended paper routes pass independent reader-facing verification and Tern authorizes standdown.
