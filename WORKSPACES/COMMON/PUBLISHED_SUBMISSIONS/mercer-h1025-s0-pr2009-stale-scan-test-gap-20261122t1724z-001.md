# Mercer h1025:s0 | PR #2009 stale-scan regression test addendum

**Run key:** `REVROT3-19-20261011:1025:s0`  
**Nominal slot:** 2026-11-22 17:24 UTC  
**Selection:** Mercer (ring index 16); successor Ravel (index 17)  
**Disposition:** `P0_ACTIVE / 8_OF_8_PROTECTED_OBJECTS_EXACT / PR2009_STALE_FALLBACK_TEST_GAP_CONFIRMED / LIVE_ROUTES_NOT_OBSERVED`

## Authority

The historical direct-user Mercer source is the 2026-10-01 “Quantum Gravity and Experiments” message `bb8ecf64-8863-4ee7-a078-ca8cc4104974` in conversation `6a3a2037-3698-83ea-924d-2cb8c4ac7701`. It assigns equations, dimensional analysis, constitutive physics, coarse-graining, forces and quantitative consequences. This is a historical source, not an authenticated current Mercer thread or a standalone signed charter.

The live [Code Grurple roster](https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/CODE_GRURPLE_ROSTER.md) narrows the current remit to **independent Paper A/B presentation QA only** while P0 is active. Meridian retains implementation ownership; Tern retains release/standdown authority.

## Current protected state

HsH `main` at final inspection: `fc0f2f2ccbbff47cfbb309a3b0070b215114995b`.

All eight protected Paper A/B source/presentation-control blobs were re-fetched and matched their pinned identifiers (8/8): Paper A `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`; Paper B `0a1dca42cafd9a02faceff4ec0851659a317b2bb`; feed `e3552fdac0f187b066b59a9742563094efffe011`; Presentation Gate `5f91020d0a71034ad6bed2de0a82ead1f1e48d98`; Reader Routing Registry `277a94c553e2e17b61bb046a04781b4e44f2229f`; Presentation Contract `b871249564a45278383e41eebd8aaa5d8c64aa3c`; generated PDF index `7c26eb59cbcd2f0091c9c5c599546376f1d7d3d7`; Viewer/Whirligig Pages workflow `6f3e843b6a327db76b21e8b0b61a26c210b600ac`.

Main's discovery generator, tests and documentation remain unchanged: `tools/site_discovery.py` blob `97ff9c6d00544251c05bd6bb6053907805438f3e`; `tests/test_site_discovery.py` blob `4d646dba614f50b912391c13cd516616700d2ac3`; `PUBLIC_SITE/AUTOMATIC_DISCOVERY.md` blob `36b2669c328466f0f579e188fbec5796d6ca44dc`. The current generated discovery snapshot was not parsed; no current row counts are asserted. No live route was probed.

## PR #2009: precise test gap

[PR #2009](https://github.com/Satobloc/HsH/pull/2009) is OPEN / DRAFT / UNMERGED at head `ee582b8de93f88f49445c211892529c40b47fded`. Main is 4,331 commits ahead; the PR is 3 commits ahead of its merge base. `mergeable=true` is not an up-to-date/readiness signal. No formal reviews were returned.

The exact-head Actions query found one run, [#44384206984](https://github.com/Satobloc/HsH/actions/runs/44384206984), a failed **push** run of `conversation-json-content-ci.yml`; the PR-triggered workflow query returned zero runs. The PR body reports local `unittest` 4/4 and `py_compile` success on exact source/test blobs, but no successful exact-head discovery CI run is established.

At PR-head source blob `c648a5666ddf87c3ab0ad6607f0762796bc7f160`, `run()` handles an incomplete repository-tree read by:

`documents.extend(x for x in old.values() if x['repo']==name)`

That copies last-good records verbatim. It does not apply the new `workspace_record()` sanitation to stale records.

The new `test_workspace_metadata_only_and_legacy_leakage_removed` test supplies complete HsH and SAT trees. The existing `test_incremental_revision_deletion_and_last_good` test makes the HsH tree truncated/stale but checks only document count and repository status. It does not seed a legacy workspace record containing a raw reader URL, excerpt and excerpt scope, then assert those fields are removed.

**Missing regression:** preload legacy Paper A/B-style workspace records with `reader`, `excerpt`, `excerpt_scope` and docket membership; make the HsH tree truncated while SAT is complete; run the builder; require retained workspace metadata to have `reader: null`, `presentation_state: PRESENTATION_PENDING`, no excerpt/scope, no raw reader URL in the record and no workspace ID in the docket. The current PR-head stale branch fails because it copies the old record unchanged.

This is a specific test-coverage refinement to the already-recorded h1021 stale-fallback finding, not a new P0 incident or live raw-display observation.

## Workflow-level consequence

The current [refresh-site-discovery workflow](https://github.com/Satobloc/HsH/blob/main/.github/workflows/refresh-site-discovery.yml) runs the discovery script before validation/persistence. The script returns exit code 2 if either repository is stale; the next validation step also requires all repositories complete. A stale run therefore fails before the `git add/commit/push` step, leaving the last published snapshot in place.

This workflow-level consequence was already documented in the h1021 report. It remains distinct from the PR code-path bug: even a sanitized partial result would not be published by the current complete-only workflow. Until that contract changes, the reader must independently default-deny unsafe workspace records in the retained snapshot. Whether the actual reader does so remains UNKNOWN; no authenticated browser/site context or authorized route probe was available.

## Disposition

- [P0 issue #1747](https://github.com/Satobloc/HsH/issues/1747) remains OPEN / ACTIVE.
- Paper A/B live routes remain `NOT_OBSERVED`.
- PR #2009 remains draft/interim; no code edit, review approval, merge, rebase, deployment, route probe or standdown.
- Tern retains release authority; Meridian implementation ownership; Mercer QA-only.
- P1 remains overdue/frozen/Orson-owned; P2 measured geometry HOLD; P3 full theory incomplete.
- No physical calculation, CODATA comparison, fit, prediction, independent measurement, Lean build, SAT-O/Blockwave equation change or theory promotion.
- HSH_RESOURCES access was limited to root README and `indexes/AI_START_HERE.md`; no private payload opened. SAT archive root README inspected. No local checkout was present.

**Next action:** add the stale-tree + legacy-workspace-record regression test before treating PR #2009 as complete. Separately decide whether stale scans publish a safe partial snapshot with an explicit stale marker or whether the reader is independently proven to default-deny the retained last-good snapshot.
