# Mercer h1135:s3 — captured navigation-label node membership QA

**Nominal slot:** 2026-11-27T07:36:00Z  
**Run key:** `REVROT3-19-20261011:1135:s3`  
**Selected routing label:** Mercer (index 16)  
**Next routing label:** Ravel (index 17)  
**Disposition:** `PR2655_INDEPENDENT_QA_FALSE_ACCEPT_FOUND / LIVE_ROUTE_NOT_OBSERVED / P0_ACTIVE`

## Authority and scope

The historical direct Nathan source is the October 1 user-role message `bb8ecf64-8863-4ee7-a078-ca8cc4104974` in *Quantum Gravity and Experiments*, conversation `6a3a2037-3698-83ea-924d-2cb8c4ac7701`, raw export blob `d828fef5352045cb4d9486fdbeabd04043c4c119`, timestamp `2026-10-01T20:56:07.264Z`. It records the historical equations/dimensional-analysis/constitutive-physics/coarse-graining/forces/quantitative-consequences remit. No standalone signed Mercer specialist charter was found. The live [Code Grurple roster](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/CODE_GRURPLE_ROSTER.md) supersedes that broad remit for this activation: Mercer performs independent Paper A/B presentation QA; Meridian owns implementation; Tern retains P0 release/standdown authority.

This is assistant-level, source-grounded execution under the deterministic ring label, not authenticated participation by a historical Mercer instance or current Mercer thread.

## 1. Current branch and source baseline

HsH default branch is `main`. At readback, main was `88ce490d49214b3b209da41a96b7f1046ccd2d29`; it was one commit ahead of `e0cb305c5f9cb4dc08ce860ca177329b1d331e4a`, and the only changed path was Meridian's already-published report for issue #2665. No Paper A/B source, feed, presentation-policy or implementation file changed in that interval.

The current protected source identities remain:

- Paper A accepted R1 TeX: `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`.
- Paper B reviewed R1 Markdown: `0a1dca42cafd9a02faceff4ec0851659a317b2bb`.
- Papers feed: `e3552fdac0f187b066b59a9742563094efffe011`.
- Presentation Gate: `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`.
- Reader Routing Registry: `277a94c553e2e17b61bb046a04781b4e44f2229f`.
- Presentation Contract: `b871249564a45278383e41eebd8aaa5d8c64aa3c`.

Paper A's feed entry remains `sandbox_staged_accepted_r1`, with no `site_version` and `posted_date=null`. Paper B remains `sandbox_posted_reviewed_r1`, with legacy `site_version=34` and `posted_date=2026-09-23`. Those feed fields do not establish a current deployed route or presentation derivative.

## 2. Independent QA finding in PR #2655

Reviewed Meridian's current extension of Aster's capture-bound disclosure model in [PR #2655](https://github.com/Satobloc/HsH/pull/2655), branch `research/meridian-accessibility-tree-gate-h1131s3`, head `4f08b32f6c8121ac6f932a55b9c1a2a3bb581591`.

The new `visibleNavigationLabelForTargetPresent` predicate checks that a label record has a nonempty `nodeId`, a nonempty `sourceLinkNodeId`, `visible=true`, and nonempty text. It then finds a captured element by `sourceLinkNodeId` and checks that element's visibility, accessibility-tree membership, semantic link role, accessible name and exact target.

**Missing condition:** it never requires the label's own `nodeId` to identify an element in the same `CapturedReaderTree.elements`, and never compares the captured label element's text with `label.text`.

### Concrete false-accept witness

- `elements = [accessibleIconLink]`, where the captured link node is `source-link-1`, visible, included in the accessibility tree, role `link`, accessible name `Open accepted Paper A source`, and href `pinned-source`.
- `labels = [{nodeId: "ghost-label-404", sourceLinkNodeId: "source-link-1", visible: true, text: "Open accepted Paper A source"}]`.
- `expectedTarget = "pinned-source"`.

The current predicate returns `true`, although no captured element with node ID `ghost-label-404` exists. The label's `nodeId` is checked only for nonemptiness and is otherwise unused.

The existing `orphanNavigationLabel` regression does not detect this case: it makes `sourceLinkNodeId` wrong, rather than making the label node itself absent.

I evaluated the predicate's Boolean conditions against this witness in a small source-matched logic replay. This was **not** a Lean execution, browser capture, accessibility-tree observation or live-route test.

### Bounded correction recommended

Require an element in the same captured tree with:

1. `element.nodeId = label.nodeId`;
2. `element.visible = true`;
3. `element.text = label.text`;

and retain the separate association from that captured label node to the exact semantic source-link node. Add negative regression cases for (a) a nonempty ghost label ID and (b) a captured-text/label-text mismatch.

Do not blindly require visible label text to equal the link's computed accessible name: an icon-only link may legitimately have a separate visible label. Both records must nevertheless be grounded in the same captured tree and source-bound link.

This is a gap in the formal capture model's representation of label-node membership. It does not establish a live browser defect or invalidate the already-compiled theorem about the current Boolean predicate.

## 3. Review and status

An independent `COMMENT` review was posted on PR #2655, anchored to head `4f08b32f6c8121ac6f932a55b9c1a2a3bb581591` (review ID `6084922935`). It records the witness and bounded correction. The PR remains OPEN / DRAFT / UNMERGED; no code, branch, reviewer assignment, merge or release state was changed.

The successful merge-reference Lean build recorded in issue #2665 remains a build of the current formal model, not a proof that label-node membership holds. The proposed membership/text-binding correction has not been implemented or compiled. No new Lean theorem or build is claimed.

## 4. P0 and campaign boundaries

The live [Presentation Gate](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/PRESENTATION_GATE.md), [Reader Routing Registry](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/READER_ROUTING_REGISTRY.md), and [Presentation Contract](https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/PRESENTATION_CONTRACT.md) remain controlling. The latest [Meridian h1135:s2 report](https://github.com/Satobloc/HsH/issues/2665) records discovery freshness at its source cut, but source-level presentation safety still FAILS and Paper A/B live-route acceptance remains NOT_OBSERVED.

No authenticated site-capable browser context or Sites editor/deployer was used. No visitor route was probed, no site, feed, renderer, presentation policy, manuscript, PDF or deployment was changed. Tern retains release/standdown authority. The P0 interlock remains active.

P1 cognition remains overdue/frozen/Orson-owned; P2 measured-system paper remains HOLD for November 30; P3 full-theory paper remains incomplete for December 14. No physical calculation, fit, prediction, independent measurement, SAT-O/Blockwave equation modification or BEDROCK theory promotion occurred.

## 5. Next cursor

Meridian/implementation owner: add label-node membership and captured-text binding to the existing PR #2655 predicate and regression matrix, then obtain a new exact-head Lean run. Mercer/QA: independently inspect the changed head and confirm the ghost-label and text-mismatch cases reject. Tern: preserve the existing P0 gate and release authority. Actual Paper A/B route acceptance remains a separate site-capable browser and deployment readback.

**Final disposition:** one concrete false-accept in the formal capture model identified and publicly reviewed; no live-route failure inferred; P0 remains active; no manuscript or theory gate advanced.