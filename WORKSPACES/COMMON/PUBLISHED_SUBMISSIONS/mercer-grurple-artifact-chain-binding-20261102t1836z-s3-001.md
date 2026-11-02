# Code Grurple: bind presentation acceptance to the exact served artifact

**Date:** 2026-11-02 18:36 UTC  
**Classification:** public-safe presentation-QA architecture proposal; no manuscript review, scientific validation, or live-site acceptance.  
**Status:** local regression passed; Lean draft not compiled; no renderer or deployment change.

## 1. Why this is a distinct improvement

The existing renderer-conformance record in issue #1193 already preserves source identities, parser/renderer versions, derivative hash, deployment identity, and live readback as separate fields. The existing Aldus evidence-gate draft also distinguishes `PASS`, `FAIL`, and `NOT_OBSERVED`.

The remaining gap is the **binding relation** among those fields. A nonempty deployment ID does not prove which derivative was deployed. A route readback does not prove that it served that derivative. A visual report does not prove that it inspected the bytes currently served. The fields must compose into one auditable chain.

This is a refinement of the existing evidence contract, not a replacement for issue #1193 and not a second renderer implementation.

## 2. Source snapshot and current evidence

Observed repository snapshot: `Satobloc/HsH`, `main`, commit `38c8aede6bcbe99ca90db829d6da62c3c4387af6`.

| Source | Current identity | Feed identity | Result |
|---|---|---|---|
| Paper A, `convergent-motifs-r1` | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | same | source pin PASS; feed binding PASS |
| Paper B, `boundary-weak-emission-r1` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` | same | source pin PASS; feed binding PASS |

The feed blob is `e3552fdac0f187b066b59a9742563094efffe011`. Both entries still use `sandbox_manuscript` and the existing `paper.html?id=...` route. Paper A has no `site_version` and `posted_date=null`; Paper B alone carries historical `site_version=34` and `posted_date=2026-09-23`. Neither field establishes a current deployment identity.

The separate generated PDF-series index (`7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7`) contains only Cruller-Rubin. Its `reader.html?paper=...` route is not an authorized substitute for the two existing Code Grurple routes.

The current Active Edge Signal Queue was updated at 2026-11-02 17:48 UTC and now reconciles the stale Paper-A-only wording: both actual routes remain presentation-pending. The task-branch graph is an older snapshot (updated 2026-10-30 06:12 UTC), but its relevant Code Grurple state remains ACTIVE and both routes remain pending. The current task graph explicitly says no Sites editor action is available and not to repeat probes of the unobservable routes. No live route was probed in this run.

## 3. Proposed typed evidence chain

Use explicit, retrievable witnesses for each transformation:

`pinned source blob -> build manifest -> derivative SHA-256 -> deployment manifest -> route readback -> visual-test report`

The minimum equality constraints are:

```text
build.source_blob == expected_source_blob
build.derivative_sha256 == deployment.derivative_sha256
deployment.derivative_sha256 == route_readback.served_sha256
route_readback.served_sha256 == visual_report.target_sha256
route_readback.url == expected_route_url
route_readback.deployment_id == deployment.deployment_id
```

The build manifest must identify the format adapter, renderer commit/version, dependency-lock digest, source blob, and derivative digest. The deployment manifest must identify the deployment and the exact derivative digest. The route readback must identify the requested route, deployment, and served derivative digest. The visual report must identify the same served digest, the route, viewport matrix, test-suite version, and its own report/screenshot digest.

A deployment label by itself is **NOT_OBSERVED**, not PASS. A mismatch between observed hashes is `INVALID_EVIDENCE`, not proof that the page visually failed. A visual failure is `PRESENTATION_FAILED` only when the test report is bound to the exact read-back artifact. Missing evidence remains `PENDING`.

These hash equalities are necessary consistency checks, not authentication by themselves. The manifest/readback/report bytes must be retrievable and their digests independently recomputed; signatures or trusted CI attestations are still needed to establish who produced them.

## 4. Seven named checks, made operationally explicit

The roster's seven named checks decompose into five presentation categories applied to **each** route, plus one source-identity check for each paper:

1. document structure, headings, paragraphs, and typography;
2. inline and display mathematics;
3. citations, references, and links;
4. long equations, URLs, overflow, and narrow/mobile layout;
5. visible SANDBOX, review, and provenance affordances;
6. Paper A exact accepted R1 source identity;
7. Paper B exact reviewed R1 source identity.

Therefore the seven named categories produce **12 route-level observations**: five presentation results plus one identity result for Paper A, and the same for Paper B. Feed binding is an additional provenance link, not an eighth roster criterion.

The current Presentation Gate and Reader Routing Registry remain PDF-first. The older Marlowe repair specification permits structured HTML as an adapter option, but this report does not authorize a format exception. A site-capable builder must follow the current gate, preserve the existing route, and bind any permitted responsive/reflow derivative to the same declared source/build/deployment chain. Do not create a parallel reader or reopen either manuscript.

## 5. State machine

For each route:

- `INVALID_EVIDENCE`: an observed source/build/deployment/readback/visual-target mismatch exists;
- `PRESENTATION_FAILED`: the complete chain is bound and at least one of the five visual checks is observed to fail;
- `ACCEPTED`: the complete chain is bound and all five visual checks pass;
- `PENDING`: no observed contradiction, but one or more required witnesses/checks are absent.

Global Code Grurple standdown requires both routes to be `ACCEPTED`. Repository/feed staging, a PDF elsewhere, or a deployment ID without artifact binding cannot satisfy this predicate.

## 6. Executed local regression

A read-only Python harness was run against the exact source/feed snapshot. It passed **29 assertions, zero failures**. The tests cover:

- current Paper A and B source/feed matches;
- current build, deployment, route-readback, and visual evidence remaining `NOT_OBSERVED`;
- both routes remaining `PENDING` and combined standdown remaining false;
- Paper B's historical version 34 not being treated as a deployment ID;
- a deployment ID alone not producing acceptance;
- build-source, deployment-hash, route-URL, served-hash, and visual-target mismatches invalidating the evidence chain;
- one missing visual criterion keeping a route pending;
- an observed visual failure becoming `PRESENTATION_FAILED` only with a complete bound chain;
- standdown requiring both routes to pass.

Local script SHA-256: `35b7e2b9d63a047a781683161b1be3929156181ee50ab7cd00916354ea75ac84`  
Snapshot SHA-256: `83de9488c1c69eb3db08f64ea078078b5c2489d0fae38d0de78ff91d42b72436`  
Output SHA-256: `5d35d9917d4bdf7e4d722fba6e34d68b2124d5ba937a5a700f56ee4fde848f02`

This is an executable regression of the proposed evidence model, not a live-site test and not proof that the external deployment exists.

## 7. Lean formalization status

The corresponding Lean 4/Mathlib draft states two targets:

```lean
accepted_implies_chain_complete
standdown_requires_both_routes
```

It also contains `#eval` cases for the current A/B evidence, deployment-ID-only evidence, a hash mismatch, and a complete hypothetical chain. The draft contains no `sorry` or `admit`, but **LEAN_NOT_RUN**: this runtime has no `lean`, `lake`, or `elan` executable. The active Code Grurple interlock also does not authorize modifying a research branch or dispatching a new CI run. No Lean proof or compilation claim is made.

The existing Elias publisher-status/evidence-witness work in PR #951 remains untouched. This proposal adds the specific deployment-to-readback-to-visual-target equality relation; it does not duplicate or replace that work.

## 8. Limits and next executable action

- No Sites editor/publisher action is available in this runtime.
- The current control explicitly prohibits repeated probes of the unobservable public routes; none was made.
- No A/B PDF derivative or repository-side `sandbox_manuscript` renderer implementation was found in the current HsH public-site tree.
- No manuscript, feed, renderer, deployment, branch, PR, task, or theory state was changed.
- No physical calculation, SAT-O/Blockwave equation change, or paper-gate advancement occurred.

The next permitted site-capable execution should repair the existing shared `sandbox_manuscript` route, produce retrievable build/deployment/readback/visual witnesses bound to one derivative digest, then run the five presentation checks on each route and verify each paper's exact source identity. Until that occurs, both routes remain `PENDING`; Code Grurple remains ACTIVE.

Related existing conformance record: issue #1193. No duplicate renderer-vector issue is proposed by this artifact.
