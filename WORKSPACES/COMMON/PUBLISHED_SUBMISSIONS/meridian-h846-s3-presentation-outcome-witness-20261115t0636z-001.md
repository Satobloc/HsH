# Reader-route observation and acceptance: a typed witness layer

**Status:** Formalization added to existing draft PR #1471; final-head Lean verification pending at report time. No production route probe, site change, manuscript edit, PDF build, or P0 standdown.

## Executive result

The existing `CodeGrurpleObservationGate` formalizes when a reader-route probe may be authorized. Authorization is not an observation, and an observation is not acceptance. This addition supplies the missing typed evidence layer:

`PROBE_AUTHORIZED -> OBSERVATION_BOUND -> OBSERVED_PASS | OBSERVED_FAIL`

It also preserves two non-success states that must not be collapsed into failure or success:

- `notObserved`: no observation witness exists.
- `unbound`: a witness exists but does not match the current trigger, route, deployment, source, derivative, or capture evidence.

Only `observedPass` satisfies presentation acceptance.

## 1. Source-aligned acceptance contract

The proposed `ReaderAcceptanceChecks` records twelve observed outcomes:

**Eight PDF acceptance checks from `PUBLIC_SITE/PRESENTATION_GATE.md`:**

1. Section hierarchy is rendered rather than exposed as markup.
2. Inline and display mathematics are typeset.
3. Tables, figures, boxes, references, URLs, and equations respect page boundaries.
4. Long equations and URLs wrap or break safely.
5. No text or box crosses printable/viewer bounds.
6. Narrow-screen viewer reflow/zoom is usable.
7. An audience-calibrated preface identifies the document, audience, historical/current status, and place in SAT/H(s)H.
8. Technical readers receive direct pointers to high-value equations, calculations, findings, assumptions, tests, and source records.

**Four additional routing/provenance checks from `PRESENTATION_CONTRACT.md` and `READER_ROUTING_REGISTRY.md`:**

9. Raw source is not the default visitor route.
10. Relative links and visitor-facing targets are verified.
11. Artifact provenance is pinned to source/dependency identity.
12. Figures and references are resolved; missing figures, undefined references, and overflow block release.

These are proposed machine-carried observation fields. They do not assert that any live route has passed.

## 2. RouteObservationWitness

The new witness binds an observation to:

- the workflow run that supplied trigger authorization;
- a separate, nonempty observation-run identifier;
- exact route and deployment identities;
- current source Git blob and derivative SHA-256;
- observation time;
- browser-context and capture digests;
- external source, derivative, route, and capture binding attestations;
- whether the route actually resolved;
- the twelve acceptance outcomes.

The separate trigger and observation run identifiers prevent a workflow trigger from being mistaken for the browser observation itself.

The binding flags are external attestations. Lean does not inspect a browser, verify a deployment, recompute file/capture hashes, or establish that the external observations are truthful.

## 3. Formal state and proved implications

The new `PresentationStatus` distinguishes:

| Status | Meaning |
|---|---|
| `notObserved` | No route observation was supplied |
| `unbound` | A supplied observation does not bind to the current authorized route/source/deployment |
| `observedFail` | A current observation exists, but the route did not resolve or at least one acceptance check failed |
| `observedPass` | A current observation exists, the route resolved, and all twelve checks passed |

The formalized theorems establish:

- no observation remains `notObserved` and cannot be accepted;
- an authorized probe without an observation does not imply acceptance;
- an unbound observation cannot be accepted;
- unresolved routes cannot be accepted;
- any failed aggregate acceptance check blocks acceptance;
- acceptance requires a current, identity-bound observation;
- an unauthorized probe state makes a supplied observation unbound;
- changing the source makes a prior observation unbound.

The source-change result is particularly important: a screenshot or reader result from an older source/derivative chain cannot be reused after the source changes.

## 4. Existing PR and Lean verification

The addition was made to the existing draft [PR #1471](https://github.com/Satobloc/HsH/pull/1471), in `FORMAL_VERIFICATION/HsHVerification/CodeGrurpleObservationGate.lean`. No new branch or PR was created.

- Final branch head at submission: `eb6bc37a80d35590e534cdf14e35df4f0abc5eac`.
- PR remains OPEN / DRAFT / UNMERGED.
- PR base remains `infra/lean4-verification-20261023`; the branch is diverged from current main and is not a current-main integration.
- Final-head Lean workflow run `43687408758` was still pending/in progress at report time.
- An earlier version of the new outcome layer built as part of the target module in run `43686546291`, but that version preceded the final source-contract alignment and source-change theorem.
- The earlier full root build failed in the existing `MovingPlaneTraceGeometry.lean` module at lines 72, 76, 80, 84, 96, 100, and 197. Tests, lint, nanoda, leanchecker, and the separate global axiom audit were skipped.

The final twelve-check version must not be called compiled until run `43687408758` completes and its logs show the target module and theorem reports. Even a successful Lean build proves only the formalized state machine. It does not prove the soundness of translating the site contract into Boolean fields or the truth of the external binding attestations.

This is assistant-authored workflow formalization, not Nathan Direct mathematics and not a BEDROCK theory change.

## 5. P0 source and trigger revalidation

Compared the protected P0 source/control objects from baseline `f6408e605abcfa80fe3a3add50cfd22946dd83a7` with current main `1381f019c7bd8a9f1283f3a35a901e11971295b1`.

All eight protected objects match their established blob identities:

| Protected object | Current blob | Result |
|---|---|---|
| Paper A accepted R1 source | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | Exact |
| Paper B reviewed R1 source | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` | Exact |
| Papers feed | `e3552fdac0f187b066b59a9742563094efffe011` | Exact |
| Presentation gate | `5f91020d0a71034ad6bed2de0a82ead1f1e48d98` | Exact |
| Reader routing registry | `277a94c553e2e17b61bb046a04781b4e44f2229f` | Exact |
| Presentation contract | `b871249564a45278383e41eebd8aaa5d8c64aa3c` | Exact |
| Generated papers index | `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7` | Exact |
| Viewer/Pages deployment workflow | `6f3e843b6a327db76b21e8b0b61a26c210b600ac` | Exact |

The `PUBLIC_SITE/PAPERS` and `SAT_VISUALS` tree identities are unchanged. `tools/publish_papers.py`, `publish-paper-series.yml`, and `tools/site_discovery.py` are unchanged. The only public-site path changed since the baseline is `PUBLIC_SITE/generated/discovery.json`.

**Disposition:** no new A/B-relevant trigger. The existing Paper A/B routes remain `PRESENTATION_PENDING / NOT_OBSERVED`. No route probe was performed because there is no new trigger and no authenticated site-owner/editor/preview capability. The formalization does not authorize a probe.

Canonical P0 incident: [issue #1747](https://github.com/Satobloc/HsH/issues/1747). No duplicate issue was created for the existing discovery-policy defect.

## 6. Portfolio boundaries

- P0 Code Grurple: ACTIVE.
- P1 Orson-owned cognition: OVERDUE / NOT READY.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE rereview: November 24.

The task graph remains 18 records against 16 declared branches; Tern retains graph and scheduler authority. WH-01 through WH-09 remain P1/HIGH. WH-05 is the highest-priority blocked item because all four Mersearch lanes remain occupied; WH-02 remains the highest-priority unblocked item with Calder/authorized-maintainer ownership. No ownership or graph mutation occurred.

No callable Mersearch action was available. All four existing request lanes remain `requested`; none was overwritten, retriggered, or released. HsH, SAT archive, and HSH_RESOURCES front doors were checked; no private HSH_RESOURCES payload was opened. Existing Math Hopper, Whirligig/HAGALAZ, and Lean infrastructure were reviewed; SciSpace is available but was not needed. No new tool, fork, dependency, subscription, or expenditure.

Unrelated reading: SAT archive `fun break - lx.txt`, lines 1641–1680; next cursor 1681. No physical break is claimed. FIE rereview is not yet due.

No physical calculation, fit, H(s)H prediction, independent measurement, P2 selection, paper-gate advancement, SAT-O/Blockwave equation modification, or theory promotion occurred.

## Disposition

`OBSERVATION_LAYER_ADDED_TO_EXISTING_PR / FINAL_HEAD_LEAN_PENDING / P0_NO_TRIGGER / ROUTES_NOT_OBSERVED / NO_SITE_OR_MANUSCRIPT_CHANGE / NO_THEORY_PROMOTION`
