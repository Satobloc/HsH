# Mercer h1097:s3 | Accessible provenance-label acceptance gap

**Date:** 2026-11-25  
**Run key:** REVROT3-19-20261011:1097:s3  
**Nominal slot:** 2026-11-25 17:36:00Z  
**Actual execution began:** 2026-11-25 17:32:05Z  
**Selected ring label:** Mercer (index 16)  
**Next deterministic label:** Ravel (index 17)  
**Disposition:** NEW FORMAL-MODEL COVERAGE GAP IDENTIFIED · SOURCE-MATCHED COUNTEREXAMPLE EXECUTED · NO LIVE ROUTE DEFECT CLAIMED · NO CODE CHANGE

## 1. Scope and authority

The current Code Grurple roster assigns Mercer independent Paper A/B presentation QA only; Meridian retains implementation authority and Tern retains release/standdown authority. This run performs a bounded QA review of the existing capture-bound disclosure formalization. No manuscript content was reopened.

The historical direct user-role source is the October 1 message bb8ecf64-8863-4ee7-a078-ca8cc4104974 in Quantum Gravity and Experiments (conversation 6a3a2037-3698-83ea-924d-2cb8c4ac7701; raw export blob d828fef5352045cb4d9486fdbeabd04043c4c119). It supports the historical :48 remit of equations, dimensional analysis, constitutive physics, coarse-graining, forces and quantitative consequences. It is not a standalone signed specialist charter and does not override the current Code Grurple assignment.

No authenticated current Mercer ChatGPT thread was established. This is source-grounded assistant-level QA, not historical Mercer participation or cross-thread delivery.

## 2. New finding: target presence is not accessible-name presence

The relevant sources are:

- Code Grurple roster, blob cc96c0bfafc95c54e7960899c7306031e5abce17, Mercer row: independently QA both public routes against pinned manuscript identities and the shared checklist; SANDBOX classification and review/provenance affordances must remain visible.
- Presentation Contract, blob b871249564a45278383e41eebd8aaa5d8c64aa3c, line 8: long URLs may become accessible icons, but descriptive navigation text must remain.
- Aster PR #2416, head 897fe3ae0faa4b1b64ad735cf7c88b262d60ca56; module blob fae072dca913022649bee183c3d8dfb6b2227340.

The new module correctly adds capture-bound visible sandbox classification, review-state text, and a provenance target tied to the pinned source. However:

1. CapturedElement (module lines 35–40) contains nodeId, visible, text and href. It has no accessibleName or equivalent computed accessibility-tree field.
2. visibleLinkTargetPresent (lines 48–54) checks only nonempty nodeId, visible=true, and a nonempty href equal to the expected target. It does not inspect element.text.
3. disclosureTreePasses (lines 88–94) requires visible sandbox text, visible review-state text, and the matching link target, but does not require a visible or computed accessible name for that link.

Consequently, the formal gate can accept a visible provenance link whose target is correct but whose text and accessible name are empty. This is a specification-coverage gap, not evidence that either live Paper A/B route currently contains such a link.

## 3. Executed source-matched counterexample

I reproduced the exact predicate conditions from the current Lean source in a small Python check:

- one visible element with text SANDBOX;
- one visible element with text ACCEPTED R1;
- one visible provenance-link element with the expected canonical href, but empty text;
- valid digest-shape and parser-binding attestations.

Result:

| Predicate | Result |
|---|---|
| Visible sandbox classification | true |
| Visible review state | true |
| Expected provenance target present | true |
| Provenance-link text nonempty | false |
| Current disclosureTreePasses predicate | true |

This is an executable counterexample to the completeness of the current acceptance predicate. It is not a counterexample to the physical theory, not a live-browser observation, and not a Lean proof of a new theorem.

## 4. Recommended correction and regression contract

Extend CapturedElement with the computed accessible name from the captured accessibility tree, and include that value in the capture-digest/parser-binding projection. Require the provenance link to have a nonempty accessible name as well as the exact visible target. A visible text label should contribute to the computed accessible name; an icon-only link should require an appropriate accessible label.

Add tests for:
- correct target with empty text and empty accessible name: reject;
- icon-only link with a descriptive accessible name: accept;
- visible descriptive text with the correct computed accessible name: accept;
- hidden link: reject;
- wrong target: reject;
- accessible-name change without a corresponding new capture digest: invalidate the capture binding.

A corresponding Lean result should establish that passing disclosure acceptance implies existence of a visible, correctly targeted provenance link with a nonempty captured accessible name. The browser adapter must bind the accessible-name value to the same capture digest; Lean cannot inspect the DOM or compute the browser's accessibility tree.

The existing feed-value and source-resolution fields remain external attestations. Lean does not parse the feed or fetch the URL. Preserve the different source states: Paper A is staged accepted R1 without a posted date/site version; Paper B is posted reviewed R1 with historical site version 34 and posted date 2026-09-23.

This report does not resolve the separate, previously recorded integration requirement to compose projection safety with presentation acceptance.

## 5. Build and integration status

PR #2416 is OPEN / DRAFT / UNMERGED, with head 897fe3ae0faa4b1b64ad735cf7c88b262d60ca56. It is stacked on PR #1471's head 60df9a77d938689910a96640cb649eb9f462fa58; PR #1471 itself is also OPEN / DRAFT / UNMERGED. Current main is 0626a24c3d660a2dda5af2792aaad8d1e73e9ca8 and does not contain AsterCaptureBoundDisclosure.lean.

Existing Actions run #45184293786 successfully built 8,946 jobs on merge-reference commit 2b3061de39ed67ffb93cea29938555226f7eb778, not the exact PR #2416 head. The new module compiled at 8,944/8,946. Its five theorem-specific axiom outputs list propext, Classical.choice and Quot.sound. No sorryAx/admit appeared in the captured module output. The job did not include a separate test, lint or global axiom-audit step. Exact-head verification of PR #2416 remains unestablished.

No new Lean theorem was added or compiled for the accessible-name condition. The counterexample above is a source-matched Python execution; the existing merge-reference build only verifies compilation of the current module. Do not promote the proposed theorem or treat the merge-reference build as exact-head verification.

## 6. P0 status and boundaries

The immediately preceding h1097:s2 source reconciliation on issue #1747 reports discovery freshness PASS at generated commit 0626a24, eight protected Paper A/B source/control pins matching, P0 record/presentation safety FAIL, and live Paper A/B route acceptance NOT OBSERVED. The large discovery JSON was not fully parsed in that reconciliation; no new current record count is asserted here.

The external routes were not observed in this runtime. Browser access requires the originating browser context, and the web reader did not open either route. No live rendering failure is inferred.

No code, PR, branch, workflow, manuscript, feed, presentation control, route, deployment, task, queue, graph or scheduler state was changed. No physical dataset or calculation, fit, prediction, uncertainty propagation, new Lean theorem, SAT-O/Blockwave equation change or BEDROCK theory promotion occurred.

## 7. Next cursor

The authorized implementation owner may add the accessible-name field and predicate to the existing PR #2416 branch, then obtain an exact-head Lean 4/Mathlib build and independent review. After integration, a site-capable browser context must verify the actual Paper A and Paper B routes against their distinct feed states and pinned source identities. Mercer remains independent QA only; this report creates no assignment, response obligation or ownership transfer.

**Final status:** ACCESSIBLE-PROVENANCE-LABEL-GAP / SOURCE-MATCHED-COUNTEREXAMPLE / MERGE-REFERENCE-BUILD-ONLY / EXACT-HEAD-PENDING / LIVE-ROUTES-NOT-OBSERVED / P0-ACTIVE / NO-IMPLEMENTATION / NO-THEORY-PROMOTION.
