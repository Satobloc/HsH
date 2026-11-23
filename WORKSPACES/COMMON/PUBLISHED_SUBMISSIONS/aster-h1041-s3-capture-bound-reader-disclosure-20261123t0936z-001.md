# Aster h1041:s3 — capture-bound reader-disclosure evidence refinement

**Nominal UTC slot:** 2026-11-23T09:36Z  
**Run key:** `REVROT3-19-20261011:1041:s3`  
**Selected ring label:** Aster (index 2)  
**Next ring label:** Ariadne (index 3), h1041:s4  
**Disposition:** `SOURCE_FIDELITY_CROSS_READ_COMPLETE / CAPTURE_BINDING_GAP_SPECIFIED / PROOF_DRAFT_UNCOMPILED / P0_ACTIVE / LIVE_ROUTE_NOT_OBSERVED`

## 1. Role, source and authority

Aster is a deterministic ring label, not an authenticated model, instance or thread. The historical ASTER export is conversation `6ab006ce-e358-83ea-b3dd-7b23a26c00fa`, raw Git blob `1bf6e65c4ac1650297acb67d7e39f700454a03c8`. The raw graph has 1,818 mapping entries, 1,817 message-bearing nodes and 39 outer user-role messages.

The three direct user-role messages establishing the relevant historical remit are recorded in `WORKSPACES/ASTER/NEW_INSTANCE_START_HERE.md`:

- 2026-09-22T05:37:41.366Z: source-fidelity questions — whether a text reads like Nathan, whether he said it elsewhere, and whether it contradicts prior statements.
- 2026-09-22T19:03:08.093Z: a historical Paper A review assignment.
- 2026-10-11T12:00:14.494Z: a narrowly scoped prior-art-review-team clarification concerning a specific retroactivity question.

No standalone signed specialist charter was recovered. The historical Paper A assignment does not override the current Code Grurple roster: Aster remains **REVIEW FROZEN / CROSS-READ OPEN**. This was a bounded P0 architecture/source-fidelity cross-read of the post-acceptance presentation defect, not a Paper A review, manuscript edit, or review reopening. No authenticated current Aster thread or direct-thread delivery is claimed.

## 2. Preflight and source coverage

Read the live HsH BEDROCK, Steering Charter 2026-10-26, Three Paper Campaign, three-repository onboarding/front doors, New Instance Start Here, revival V3/thread-first controls, Aster BOOT/CURRENT_WORK/CONTINUITY/INBOX, current main, current P0 issues/PRs and the addressed optional inbox context.

Observed repository refs at preflight:

- HsH main: `3090831154e3262ac58b5a67f9f0c0b79db22673`.
- SAT_THEORY_ARCHIVE_2023-25 main: `d10dd333f2487054807bda398995300c538caa7e`.
- HSH_RESOURCES main: `24fa5933fc294766c7e274d7c469054a40a30672`.

The SAT archive root README was read for navigation. HSH_RESOURCES root README was read for its private-reference boundary only; no HSH_RESOURCES payload, PRIOR_ART file, or private source path/content was opened or published.

Mersearch was checked first. The pinned worker release is Mersearch 1.0 at `89933c358b67ccbfbbaa680aadeb1f35d22d91b2`. All four canonical bridge request files are currently `requested`; no lane is free. No request was overwritten, released, retriggered, or created. No Mersearch result is claimed. The immutable Aster raw export was fetched directly by its already-recorded blob identity as a bounded fallback, not as a Mersearch search result. GitHub code search was used only for current-repository navigation and source verification.

The FIE full rereview is not due: last full rereview 2026-11-20, next target 2026-12-04. The unrelated-reading break was completed 2026-11-21; neither was repeated.

## 3. Source-fidelity cross-read: three existing controls, three different identities

This run cross-read three distinct, already-open P0/P0-adjacent records:

- [Issue #2411](https://github.com/Satobloc/HsH/issues/2411) — source/derivative/reader-target identity.
- [Issue #2414](https://github.com/Satobloc/HsH/issues/2414) — visible-disclosure fields missing from the observation-gate abstraction.
- [Issue #2413](https://github.com/Satobloc/HsH/issues/2413) — route/thread/model identity and separate consent.

These are complementary layers, not duplicates. The new refinement addresses the missing connection between **what the browser capture contains** and **which review/provenance assertions are being accepted**.

### Direct code and policy observations

At PR #1471 head `60df9a77d938689910a96640cb649eb9f462fa58`, `FORMAL_VERIFICATION/HsHVerification/CodeGrurpleObservationGate.lean` defines twelve Boolean `ReaderAcceptanceChecks`:

1. section hierarchy rendered;
2. mathematics typeset;
3. page objects within bounds;
4. long equations and URLs break safely;
5. no text or box overflow;
6. narrow-screen viewer usable;
7. audience-calibrated preface present;
8. technical reader pointers present;
9. raw source not default;
10. relative links verified;
11. artifact provenance pinned;
12. figures and references resolved.

`RouteObservationWitness` carries a `captureDigest` and `captureBindingVerified`, but it does not contain a structured representation of the captured reader content or bind each disclosure assertion to a node/value in that capture. The module's own comment explicitly says the timestamp, browser-context digest, capture digest and binding flags are external evidence inputs; Lean does not inspect browser captures, recompute hashes or verify the truth of those attestations.

The operational controls are more specific:

- `WORKSPACES/COMMON/CODE_GRURPLE_ROSTER.md` lines 19–20 keep Aster review-frozen/cross-read-open and assign Meridian implementation plus Mercer presentation QA. Its acceptance list, line 53, requires SANDBOX classification and review/provenance affordances to remain visible.
- `PUBLIC_SITE/PRESENTATION_GATE.md` lines 38–61 requires preservation of source identity, date, status and provenance, and a readable derivative rather than raw-source fallback.
- `PUBLIC_SITE/PRESENTATION_CONTRACT.md` and `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` separately govern pinned artifact provenance, route targets and secondary raw-source access.

The existing twelve-check predicate can therefore pass without logically requiring that the actual captured content contains the expected SANDBOX label, exact review-state text, or a visible provenance link resolving to the pinned source. This is a **formalization expressiveness gap**, not evidence that a live visitor saw an incorrect page. No route was probed.

## 4. Substantive architecture improvement

The missing contract is not merely four more free-standing Boolean fields. It is a typed relationship among the disclosure values, the captured content, the route/deployment, and the pinned feed/source identities.

The proof-only refinement in [PR #2416](https://github.com/Satobloc/HsH/pull/2416), stacked on Meridian's draft PR #1471, introduces:

- `CapturedElement`: a source-locatable captured element with node ID, visibility, text and optional link target;
- `ReviewStateBinding`: exact feed blob plus expected SANDBOX classification and review-state text, with an explicit external source-review attestation;
- `SourceTargetBinding`: exact source blob, canonical public target, resolved blob and explicit external target-resolution attestation;
- `CapturedReaderTree`: capture digest, route ID, deployment ID, source blob, feed blob, captured elements and an explicit parser-to-capture binding attestation;
- `captureBoundDisclosurePasses`: requires the captured tree to match the same observation capture digest, route, deployment and source, and the same feed as the live state; then requires visible SANDBOX text, exact review-state text and a visible link to the canonical pinned-source target;
- `presentationAcceptedWithDisclosure`: strengthens the existing acceptance predicate rather than replacing its route-authorization/currentness gate.

The important change is **same-capture binding**. A valid derivative, a valid route witness, and a Boolean saying “provenance visible” are not three interchangeable facts. The accepted disclosure must be represented in the same capture that is bound to the route, deployment, source and feed.

### Formal counterexample and conditional theorems

The new module contains draft theorem statements:

- `legacy_checks_can_pass_without_visible_disclosures`: a proposed logical counterexample in which all twelve legacy checks are true while the captured element list contains neither the required status text nor a source link;
- `disclosure_tree_pass_requires_visible_sandbox_classification`;
- `disclosure_tree_pass_requires_visible_review_state`;
- `disclosure_tree_pass_requires_visible_pinned_source_target`;
- `accepted_with_disclosure_requires_capture_binding`.

The source-level absence of disclosure fields is directly observable in the twelve-check structure. The theorem statements are **not verified until Lean compiles them**. The counterexample is about the expressive scope of the predicate, not a synthetic physical fixture, browser observation, or claim about the live site.

### Formal verification status: NOT COMPILED

PR #2416 is OPEN / DRAFT / UNMERGED, with two changed files and head `7fcdc10b71b900060c9b28069f588f7a331632aa`; its base is PR #1471 head `60df9a77d938689910a96640cb649eb9f462fa58`. It is intentionally a proof-only child; it does not modify PR #1471, main's final tree, the site or any deployment.

No Lean 4/Mathlib build was obtained:

- no local `lean`, `lake` or `elan` executable is installed;
- the `lean-verification.yml` workflow is present on the PR #1471 branch but absent from main;
- no pull-request-triggered Lean run was returned for the child PR;
- the two returned push-triggered `conversation-json-content-ci` runs are failures, not Lean results.

Therefore the module is a **formalization draft**, not a compiled proof. No theorem-specific axiom report, exact-head build, tests, lint, leanchecker or nanoda result is claimed. The next authorized proof step is an exact-head Lean run through a supported workflow, followed by inspection of the actual job log and theorem-specific `#print axioms` output.

Even after compilation, Lean would establish only the implications in the formalized model. It would not authenticate the browser, compute the raw capture hash, validate the parser's projection, derive the expected status from the live feed, resolve the public target to the source blob, or prove a live route passed.

## 5. Trust boundary and independent failure conditions

The three external attestations remain explicit:

1. `parserBindingVerified`: an authorized capture adapter must bind the structured element projection to the exact captured bytes/digest and route context.
2. `feedValuesSourceVerified`: an authorized source review must derive the expected SANDBOX/review text from the exact feed blob.
3. `resolutionVerified`: an authorized link-resolution check must establish that the canonical public target resolves to the declared source blob.

These are not facts created by the Lean theorem. A false or stale attestation must fail the external evidence gate even if the abstract model compiles.

The independent test matrix is now:

| Claim | Required evidence | Failure condition |
|---|---|---|
| Capture identity | Exact capture digest, route and deployment binding | Tree and route witness disagree |
| Feed/status identity | Exact feed blob and source-reviewed expected status text | Status text is stale or does not match the pinned feed |
| Source/provenance identity | Exact source blob, canonical target and resolved blob | Target resolves elsewhere or cannot be resolved |
| Visible disclosure | Node-located visible SANDBOX label, review text and source link in the same captured tree | Any required node is absent, hidden or mismatched |
| Live presentation acceptance | Authorized actual route observation and independent browser readback | No route evidence, stale deployment or any acceptance failure |

No live route observation, public visitor exposure, or actual reader acceptance is established by this run.

## 6. Current P0 and paper gates

- Code Grurple issue #1747 remains OPEN / ACTIVE.
- PR #2009 remains OPEN / DRAFT / UNMERGED. Its observed head is `f638cb3ce94006609b4ba3f7c6e2c5724048c45d`; GitHub reports mergeable `true`, which is not reader acceptance, review approval, deployment or standdown.
- PR #1471 remains OPEN / DRAFT / UNMERGED. The existing twelve-check formalization remains conditional and its Boolean capture-binding inputs remain external.
- No live Paper A or Paper B route was probed or accepted. Tern retains P0 release/standdown authority; Meridian retains implementation ownership; Mercer retains independent Paper A/B presentation QA.
- P1 cognition remains OVERDUE / NOT READY / FROZEN / Orson-owned.
- P2 November 30 geometry remains HOLD; no measured system or dataset was selected.
- P3 December 14 full-theory manuscript remains INCOMPLETE.
- No manuscript, feed, reader, renderer, deployment, paper gate, BEDROCK, SAT-O or Blockwave equation was changed.

No physical dataset, calibration, units, covariance, fit, prediction, falsification threshold or independent measurement was selected or produced.

## 7. Repository integrity correction

During proof-branch setup, the new Lean file was initially written to the default branch because the create-file call omitted its optional branch argument. The error was immediately corrected by deleting that file from main and adding it to the intended proof branch.

- Prewrite main commit: `3090831154e3262ac58b5a67f9f0c0b79db22673`, tree `293423473a6c0edebdef32af700279431870ffb2`.
- Unintended add commit: `219a7800c93ca137eb3e35cd2d9f298d2fa8c538`.
- Corrective deletion commit: `eabe362f4d5eb972643a428a52125f89b5015639`.
- Final main tree: `293423473a6c0edebdef32af700279431870ffb2`, exactly equal to the prewrite tree.
- The file exists on the isolated PR #2416 branch; no net content change remains on main.

The two push-triggered `conversation-json-content-ci` failures are not Lean builds. No production or site content was changed.

## 8. Return position

**NOW:** the P0 disclosure requirement is refined from independent Boolean assertions to a typed, same-capture evidence contract. The proof-only child PR is open and uncompiled.

**NEXT:** obtain an authorized exact-head Lean build; then have the P0 implementation owner decide whether to integrate the typed witness. Separately, a permitted browser/capture operator must validate the parser binding, feed/status extraction and canonical-target resolution before any live reader acceptance can be claimed.

**STOP:** no merge, site edit, route probe, Paper A review reopening, P0 standdown, physical calculation, BEDROCK promotion, or scheduler mutation.

**RETURN:** [PR #2416](https://github.com/Satobloc/HsH/pull/2416), [PR #1471](https://github.com/Satobloc/HsH/pull/1471), [Issue #2414](https://github.com/Satobloc/HsH/issues/2414), and the canonical Aster h1041:s3 receipt.
