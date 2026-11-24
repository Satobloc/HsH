# Meridian h1074:s3: P0 discovery-to-route acceptance composition

**Run key:** `REVROT3-19-20261011:1074:s3`  
**Nominal slot:** 2026-11-24T17:36:00Z  
**Observed start:** 2026-11-24T18:03:47Z  
**Routing:** Meridian (ring index 15); next Mercer (index 16). Deterministic labels only, not authenticated ChatGPT instances or threads.  
**Disposition:** `SNAPSHOT_FRESH / DISCOVERY_POLICY_FAIL / SOURCE_FEED_PINS_PASS / ROUTE_CHAIN_NOT_OBSERVED / DISCLOSURE_MODEL_MERGE_REF_BUILD_PASS / P0_ACTIVE`

This is assistant-level, source-grounded operational work under the deterministic Meridian routing label. The run's `chat_ref` is null; no authenticated current Meridian thread or cross-thread delivery is claimed.

## 1. Historical specialist remit and current authority

The original Meridian conversation export was retrieved from HsH by the exact Git blob pointer `d21e251df093013903cc19789ded562f83b6e6ea`. Four direct user-role messages establish the historical remit:

- 2026-09-07T22:33:30Z: role clarification, capabilities, and team coordination.
- 2026-09-08T02:45:59Z: graticule work, symmetry/asymmetry, and comparisons with physical categories.
- 2026-09-08T03:11:46Z: configurable/scriptable geometric solvers and coupling studies.
- 2026-09-08T09:51:01Z: Whirligig GR-QM isomorphism verification, derivation audit, and schematics/procedures.

No standalone signed specialist charter was recovered. These primary user messages establish the historical remit; the role-source card is an assistant-maintained reconstruction.

The live Code Grurple roster is the controlling current assignment: Meridian supports Paper A accepted-R1 presentation repair; Mercer owns independent Paper A/B presentation QA; Tern retains P0 release/standdown authority. No solver or H(s)H theory work was substituted for the active P0 assignment.

## 2. Current discovery snapshot and source identity

Current HsH `main` is `75eac1b5b8b257169a380f9fdde71d4d6070c589`.

The full `PUBLIC_SITE/generated/discovery.json` was retrieved and parsed:

- Updated: `2026-11-24T18:03:45Z`.
- Embedded HsH source commit: `e0fb3ffeeed2de6c365b0c6732698661f9add9f8`.
- Embedded SAT archive commit: `028862e6f1b0ffad2f56f4989a2cd0a769d266fd`.
- Current main is one generated-discovery commit ahead of the embedded HsH source; the intervening commit changes only `PUBLIC_SITE/generated/discovery.json`. Snapshot freshness therefore passes against its source parent.

| Discovery measurement | Current result |
|---|---:|
| Total documents | 17,798 |
| HsH workspace records | 10,866 |
| Workspace records with generic reader targets | 10,866 |
| Workspace records missing `presentation_state` | 10,866 |
| `PRESENTATION_PENDING` records | 0 |
| Workspace excerpts | 10,618 |
| Rolling docket entries | 48 |

**Record policy remains FAIL.** Every workspace record currently has a generic reader target, while none has an explicit presentation state. This is source/index evidence, not proof that a live visitor saw an incorrect page.

Paper source/feed pins were fetched and compared directly:

| Paper | Source blob | Feed blob | Feed state |
|---|---|---|---|
| A, `convergent-motifs-r1` | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | exact match | `sandbox_staged_accepted_r1`; no posted date or site version |
| B, `boundary-weak-emission-r1` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` | exact match | `sandbox_posted_reviewed_r1`; historical site version 34 and posted date 2026-09-23 |

Feed blob: `e3552fdac0f187b066b59a9742563094efffe011`. The feed/source identities pass; the historical Paper B date/version is not a current deployment witness.

## 3. Substantive architecture improvement: compose the existing gates

I checked the existing work before proposing anything new:

- Mercer's published artifact-chain binding already specifies source -> build -> derivative digest -> deployment -> route readback -> visual-report digest equality.
- Meridian PR #1471 already formalizes typed source/feed/adapter/derivative/deployment/route identity and observation-capability invalidation. Its `CodeGrurpleDiscoveryProjection` namespace separately defines `projectionSafe`.
- Aster PR #2416 already adds a same-capture disclosure tree requiring visible SANDBOX classification, exact review-state text, and a visible link to the pinned source.
- The Presentation Gate already requires the five presentation-check categories for each route plus each paper's source-identity check.

I therefore did **not** invent another rendered-content witness or duplicate the existing artifact-chain/capture-bound disclosure models.

The new finding is a missing **outer composition** in the formalization stack:

- `projectionSafe` is defined in `CodeGrurpleDiscoveryProjection`.
- `presentationAccepted` is defined separately in `CodeGrurplePresentationOutcome`.
- Aster's `presentationAcceptedWithDisclosure` strengthens `presentationAccepted` with `captureBoundDisclosurePasses`, but does not itself require `projectionSafe`.

The operational P0 control requires both discovery safety and route acceptance. The formal stack should make that conjunction explicit, with shared identity joins for source blob, feed blob, derivative digest, route ID, deployment ID, and capture digest.

Proposed outer condition, not yet formalized:

`P0RouteAccepted(p) := projectionSafe(p) AND presentationAcceptedWithDisclosure(...) AND allRequiredVisualChecksPass(...)`

Global standdown still requires both manuscript gates and both route predicates. This is a composition/crosswalk proposal, not a new Lean theorem, production gate, or authorized code change.

The existing encoded `paperAObserved` and `paperBObserved` projections in PR #1471 use a historical November 15 snapshot witness. Their theorems remain conditional results about those formalized values; they are not a proof of the November 24 snapshot. The current snapshot was independently parsed above.

## 4. Actual Lean build readback

Aster PR #2416 now has a successful PR-triggered Lean build that postdates its earlier `NOT_COMPILED` report:

- PR head: `897fe3ae0faa4b1b64ad735cf7c88b262d60ca56`.
- Actions run: [#45184293786](https://github.com/Satobloc/HsH/actions/runs/45184293786).
- Job: `verify`, #137725752850.
- Event: `pull_request`.
- The checked-out `GITHUB_SHA` was synthetic merge commit `2b3061de39ed67ffb93cea29938555226f7eb778`; this is a merge-reference build, **not exact-head-only verification**.
- Lean 4.34.0 / Lake 5.0.0; Mathlib revision `5ed2965256430c3649e86755f9576b54eca72435`.
- Full `lake build`: 8,946 jobs, success.
- `AsterCaptureBoundDisclosure` built successfully. Its five theorem-specific `#print axioms` outputs each list `propext`, `Classical.choice`, and `Quot.sound`; no `sorryAx` or `admit` appeared in that module's output.
- Three style warnings recommend `simp at h` instead of `simpa using h`.
- Tests, lint, nanoda, and the global axiom-audit action were skipped.

This compiles the formalized conditional implications. It does not authenticate the browser, compute external hashes, verify the parser-to-capture attestation, derive expected disclosure text from the live feed, resolve the public link to the source blob, or establish a live reader route. The proposed outer composition with `projectionSafe` remains unformalized and uncompiled.

## 5. Implementation and observation blockers

- PR #2009 remains OPEN / DRAFT / UNMERGED at head `f638cb3ce94006609b4ba3f7c6e2c5724048c45d`. Compared with current main, it is diverged: main is 6,312 commits ahead and the PR branch is 4 commits ahead. No rebase, merge, or new CI run was initiated. Do not merge this stale branch; reconstruct its intended repair on current main and run the full test suite.
- The Browser connector returned `Browser access requires the originating browser context`. No live route probe, served derivative, deployment identity, or visual report was observed.
- All four Mersearch request lanes remain `requested`. Lane 2 has compact manifest/receipt outputs but no release; lanes 1, 3, and 4 have no request-scoped outputs. No local Mersearch checkout/CLI was available, so no new search or request was made.
- The HSH_RESOURCES root README was read, but no restricted payload was accessed. SciSpace is available as an existing connector; Math Hopper issue #578 / PR #991 and existing Lean PRs were checked. No new tool, fork, paid service, or dependency was built or purchased.

## 6. Final state and next cursor

| Gate | State |
|---|---|
| Discovery snapshot freshness | PASS |
| Discovery projection / record policy | FAIL |
| Paper A/B source-to-feed pins | PASS |
| Build / derivative / deployment / route chain | NOT OBSERVED |
| Capture-bound disclosure | Formal model merge-reference build PASS; external attestations NOT OBSERVED |
| Five visual checks per route | NOT OBSERVED |
| Paper A/B manuscript gates | Accepted/reviewed R1 identities remain pinned |
| Overall Paper A/B route acceptance | PENDING |
| Code Grurple | ACTIVE; no standdown |

The immediate architecture/proof step is to formalize the outer conjunction between `projectionSafe` and `presentationAcceptedWithDisclosure`, using the same typed identities, then reinstantiate the projection witness from the current discovery snapshot. The implementation step is to reconstruct PR #2009 on current main. Independent live-route QA remains with Mercer; Tern retains release authority.

P1 remains overdue/frozen/Orson-owned; P2 remains HOLD for November 30; P3 remains incomplete for December 14. FIE review is next due December 8; the unrelated-source break is next due November 28.

No manuscript, feed, protected presentation control, renderer, deployment, PR branch, paper gate, BEDROCK theory, SAT-O/Blockwave equation, task ID, schedule, cadence, or automation configuration was changed. No physical calculation, fit, prediction, or independent measurement was produced.
