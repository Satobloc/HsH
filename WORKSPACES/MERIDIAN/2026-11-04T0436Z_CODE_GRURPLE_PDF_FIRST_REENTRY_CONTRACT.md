# Meridian :36 run | PDF-first legacy-route re-entry contract

**Timestamp:** 2026-11-04T04:36Z  
**Run key:** `REVROT3-19-20261011:580:s3`  
**Classification:** INTERNAL WORKFLOW / PRESENTATION-ONLY / PROPOSAL  
**Status:** CODE GRURPLE ACTIVE; BOTH READER ROUTES PRESENTATION_PENDING  
**Identity:** Meridian is the deterministic ring label. No authenticated current Meridian ChatGPT thread is established.

## 1. Scope and historical remit

The historical Meridian conversation export carries conversation UUID `6a9aa91b-11f4-83ea-80a1-4d502522e441`. Two raw exports share that UUID but carry different archived titles ("Meridian Mover Trial" and "Michelstein-on-Meinorly"); this is a source-snapshot/title discrepancy, not authorization to rename anything.

Recovered direct user-role messages establish the historical specialist remit:
- 2026-09-07 05:25Z, message `054d1aea-cf67-4154-93c8-e302dc3ce1ea`: investigate the Graticule's symmetries/asymmetries against physical-category structure; compare existing geometric solvers and their successes/failures.
- 2026-09-07 05:51Z, message `39299849-e2a4-4b63-88a0-5612c700cc1a`: broaden solver work toward configurable, scriptable inputs, couplings, comparisons and verification of past results.
- 2026-09-07 12:31Z, message `f6a2377c-8873-41ee-9107-41aeeb0d2589`: audit the Whirligig GR-QM isomorphism and the derivation process, state precisely what the solver does/does not do, and provide schematics and procedures.

Those historical specialties do not override the current Code Grurple assignment: Meridian supports Paper A's accepted R1 presentation repair; Mercer independently QA-checks both A and B. No manuscript-content work is reopened.

## 2. Live control and source snapshot

Read live BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding, Revival V3/V4 and routing controls, current graph, Code Grurple roster, active edge queue, Presentation Gate, Reader Routing Registry, Meridian checkpoint, Mercer workspace and current receipts.

Relevant live identities:
- BEDROCK blob: `c0c5a80b40d41b77fa0b9f12c684e7e9cd6a8ec8`
- Steering Charter blob: `eecde044b508083c931cd28fab382a4841082f98`
- Three Paper Campaign blob: `2b48868a4d9cb5d68fcba7d5a65699d498d0e3e4`
- Code Grurple roster blob: `cc96c0bfafc95c54e7960899c7306031e5abce17`
- Task-branch graph blob: `47e7af709d6493babc1fab0a848b2330695aec05`, updated 2026-11-04T03:00:26Z
- Active Edge Signal Queue blob: `5e03a8754a5bd97cf6b1e59e04155ecfa2fbbd2c`
- Presentation Gate blob: `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`
- Reader Routing Registry blob: `277a94c553e2e17b61bb046a04781b4e44f2229f`
- Papers feed blob: `e3552fdac0f187b066b59a9742563094efffe011`
- Latest observed main commit: `7309aa84381dec1c04bd7de24debfb25c686dd48` (automatic public-display docket/artwork refresh; no relevant paper-route implementation was established).

Pinned source identities remain:
- Paper A, `convergent-motifs-r1`: accepted R1 Git blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`.
- Paper B, `boundary-weak-emission-r1`: reviewed R1 Git blob `0a1dca42cafd9a02faceff4ec0851659a317b2bb`.

Both source/feed bindings pass. Derivative provenance, deployment identity, live route readback and visual acceptance remain NOT_OBSERVED. Paper B's historical `site_version=34` is not a current deployment identity. Neither route has a PASS or FAIL finding.

## 3. Policy reconciliation: preserve the legacy route; make its payload PDF-first

The 2026-09-24 Marlowe repair note allowed either structured HTML or a supported PDF viewer. The newer 2026-09-30 Presentation Gate and Reader Routing Registry are the current backend presentation authority: TeX/Markdown are source/input formats, raw source is secondary, and ordinary reader display is PDF-first. If no derivative exists, the state is PRESENTATION PENDING; raw markup is not a fallback.

The Code Grurple roster still names the existing public targets:
- `paper.html?id=convergent-motifs-r1`
- `paper.html?id=boundary-weak-emission-r1`

The compatible target architecture is therefore:

`paper_id -> pinned source -> format adapter / audience preface -> source-bound PDF derivative -> deployment artifact -> existing paper.html?id route -> served-PDF readback`

Keep the legacy `paper.html?id=...` route identity and the `sandbox_manuscript` feed binding. The route's human-facing payload should be the PDF derivative required by the current Presentation Gate, with SOURCE/RAW explicitly secondary. For Paper B, the Markdown-to-typeset adapter must preserve the exact reviewed R1 content; record adapter/parser version, configuration digest and semantic-IR digest as required by the existing format-adapter work. For Paper A, preserve the exact accepted TeX source.

The separate `reader.html?paper=...` PDF-series route is not a substitute for either Code Grurple route. The existing PDF-series validator expects pre-typeset PDFs and does not compile raw TeX/Markdown. If the legacy route cannot host the required PDF viewer, do not silently migrate or claim equivalence; Tern/Nathan must explicitly authorize a route-contract change.

This is a target contract, not a claim that a PDF derivative, adapter, deployment or live route currently exists. Existing issue #1193 covers renderer conformance; issue #1144 covers the format-adapter refinement; issue #1273 already binds source/build/derivative/deployment/readback/visual evidence. This report does not duplicate those public artifacts.

## 4. New workflow improvement: capability-triggered re-entry, not blind retry

The current graph says the runtime has no Sites editor action, live route opens are unavailable, and the unobservable surface must not be repeatedly probed. The missing operational detail is an explicit condition for reopening the blocked attempt.

**Do not retry solely because another hourly turn has arrived.** Reopen one bounded attempt only when at least one of these independently evidenced changes occurs:

| Re-entry trigger | Minimum evidence | Permitted next action |
|---|---|---|
| Sites editor/deployer becomes available | Exposed action plus authenticated session and explicit write scope for the target site | One repair/deployment attempt, then one readback per route |
| Authenticated browser context becomes available | Browser context can be listed and the target origin is actually reachable | One read-only route readback; no write authority inferred |
| Site owner supplies a preview | Exact preview URL plus deployment/version identity and artifact binding | One readback of that preview |
| Deployment changes | Retrievable deployment record with commit/version and derivative digest | One readback against the changed deployment |
| Approved R1 source pin changes | New accepted/reviewed source blob and corresponding feed binding | Restart source-binding QA; this is a new source revision, not a route retry |

If none occurs, retain `ACCESS_UNAVAILABLE / ROUTE_NOT_OBSERVED / PRESENTATION_PENDING` and do not probe again. A missing tool or inaccessible route is not a presentation failure. `PRESENTATION_FAILED` requires an actually rendered page and a defect observed on the exact served artifact. `ACCEPTED` requires the existing #1273 evidence chain plus all five presentation checks and the exact source-identity check for that paper. Global standdown still requires both routes to be ACCEPTED.

This adds a capability-change gate to the existing no-repeat-probe rule. It does not replace the already-published hash-binding model or seven-point acceptance boundary.

## 5. Capability and formal limits

- All four Mersearch request lanes were occupied (Calder angle/source fidelity; archive optics harvest; Mira mind/braid interaction; Kestrel finite-core geometry). No request was submitted or overwritten. The local pinned HsH checkout is absent, so Mersearch could not be run locally. Bounded GitHub connector reads/searches were used as a fallback, not represented as Mersearch.
- The current tool inventory exposes no Sites editor/deployer action. Browser tab listing failed because the originating browser context is unavailable. Plugin-management actions exposed here do not include a plugin-directory search.
- Local TeX/Pandoc/Poppler executables exist, but no local HsH checkout or materialized pinned source tree was available; no PDF derivative was built. No site deployment or route probe was attempted.
- No local Lean/Lake/Elan executable is installed. No new Lean module, theorem or CI dispatch was made. This is an operational workflow contract, not a theorem or physical prediction; no formal proof is claimed.
- Fork enumeration was not completed. No new tooling or paid service was introduced.

## 6. Protected state and next cursor

Code Grurple remains ACTIVE. Ordinary HAGALAZ/solver work, M87/P2 and P3 theory construction remain outside this presentation-only run. BEDROCK, SAT-O/Blockwave equations, manuscripts, feed, site, PRs and task graph were not modified. No physical calculation, fit, prediction, theory promotion or paper-gate advancement occurred.

Next useful action: a site-capable worker should wait for one listed capability trigger, then implement the PDF-first payload behind the existing legacy route (or request explicit route-change authority), deploy once, and provide the complete source/build/derivative/deployment/readback/visual evidence chain for independent Paper A and Paper B QA. Until then, both routes remain PRESENTATION_PENDING.

No public issue was opened: existing issues #1144 and #1273 already cover the public format-adapter and artifact-binding work; this report is an internal re-entry control, not a duplicate publication.
