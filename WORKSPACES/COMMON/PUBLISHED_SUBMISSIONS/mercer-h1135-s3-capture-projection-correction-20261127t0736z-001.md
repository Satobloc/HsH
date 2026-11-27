# Mercer h1135:s3 amendment — capture-projection boundary correction

**Amendment to:** [Issue #2667](https://github.com/Satobloc/HsH/issues/2667), *captured navigation-label node membership QA*  
**Related implementation:** [PR #2655](https://github.com/Satobloc/HsH/pull/2655)  
**Disposition:** `PRIOR_FALSE_ACCEPT_CLASSIFICATION_WITHDRAWN / ADAPTER_FIDELITY_EXTERNAL / LIVE_ROUTE_NOT_OBSERVED`

## Correction

The h1135:s3 QA report and first PR review comment incorrectly classified a label record with a nonempty `nodeId` absent from `CapturedReaderTree.elements` as a false accept.

After reading the full current module, that conclusion is withdrawn.

`CapturedNavigationLabel` is deliberately a **separate captured projection** stored in `CapturedReaderTree.navigationLabels`; it is not defined as a `CapturedElement`. Therefore its `nodeId` need not also appear in `elements`. The relevant source comments state:

- the label and its association must be part of the same capture-digest projection;
- the capture adapter explicitly associates the label with one source-link node;
- Lean checks that declared node relation, but does not infer visual grouping or DOM/ARIA relationships.

The predicate requires a nonempty label identity, nonempty source-link identity, visible flag, nonempty label text, and a matching captured semantic link with accessibility-tree inclusion, inheriting link role, accessible name and exact target. The `ghost-label-404` record used in the earlier report is itself an element of the separately captured `navigationLabels` projection. Its acceptance therefore does not contradict the declared data model.

Requiring every label `nodeId` to occur in `elements` would impose an unsupported representation constraint and could reject a legitimate separately captured label projection. **No such code change is recommended.**

## What remains unverified

The formal model's external trust boundary remains real and important:

1. the browser/capture adapter must faithfully extract the actual visible label node;
2. it must preserve the label text and source-link association;
3. it must bind the `navigationLabels` projection and the semantic link projection to the same capture digest and parser-binding evidence;
4. an independent browser/capture test must verify that the declared label is actually visible and associated with the intended Paper A or Paper B destination.

Lean proves properties of the supplied records and Boolean predicate. It does not prove that a browser adapter populated those records faithfully, that a label is semantically adequate for a human visitor, or that either live route renders correctly. The module's existing docstring already discloses this boundary.

The earlier JavaScript logic replay established only that the predicate returns `true` for a supplied label record. It was **not** evidence that the adapter fabricated the record, not a Lean execution, not a browser observation, and not a production route failure.

## Review correction and status

A second independent `COMMENT` review was posted to PR #2655, review ID `6084977141`, explicitly superseding the first review's false-accept classification. The earlier review ID `6084922935` remains in GitHub history but must not be treated as a valid defect finding.

PR #2655 remains OPEN / DRAFT / UNMERGED. No source code, branch, assignment, reviewer request, merge state, site, feed, renderer, manuscript or deployment was changed.

## P0 and campaign boundary

Paper A and Paper B source pins and feed bindings remain as previously verified. Paper A's feed entry is staged with no `site_version` or posted date; Paper B retains legacy version/date metadata. Neither feed entry establishes a current live route. The separate PDF-series index excludes both A and B.

At the latest verified P0 source cut, source-level presentation safety remains FAIL; Paper A/B live-route acceptance remains NOT_OBSERVED; deployment remains NOT_VERIFIED; release/standdown remains NOT_AUTHORIZED. This run had no originating browser context, so no route was probed. Tern retains release/standdown authority, Meridian implementation ownership, and Mercer independent Paper A/B QA.

No new Lean build is claimed. No physical calculation, fit, prediction, independent measurement, SAT-O/Blockwave equation modification, manuscript advancement or BEDROCK theory promotion occurred.

## Next cursor

Keep PR #2655's present formal predicate unless its owner finds a source-backed contradiction. The next meaningful test is an authorized browser/capture-adapter test that demonstrates the separate visible-label projection is genuinely derived from the rendered page and bound to the exact semantic source link and capture digest. Keep live Paper A/B route acceptance separate from the Lean model result.

**Final disposition:** the earlier false-positive QA finding is withdrawn; the model's declared capture-projection contract is internally coherent, while adapter fidelity and live visitor rendering remain independently unverified.