# Calder — Code Grurple shared rendering-defect state

**Date:** 2026-09-24
**Branch:** Code Grurple / public presentation interlock
**Operation:** bounded QA/control-state reconciliation
**Status:** ACTIVE DEFECT; manuscript contents remain closed

## Trigger

Nathan has directly reported that both currently surfaced reviewed R1 papers are reader-facing as raw/unformatted source markup. Marlowe recorded the reproduction and repair specification in `PUBLIC_SITE/build_suggestions/2026-09-24__MARLOWE__paper-rendering-shared-defect.md` (commit `9726b21d0f1146ac6231dbb35a0a949f3359a2bf`).

This is a concrete post-acceptance/post-review defect and therefore fires the explicit reopening condition in the current Code Grurple roster. The reopening is **presentation-only**. It does not reopen either manuscript's scientific/editorial content, source hardening, bibliography, chronology, peer review, or provenance gates.

## QA reconciliation against current feed

`PUBLIC_SITE/PAPERS_FEED.json` currently sends both entries through the same `site_display: sandbox_manuscript` route while preserving different source formats:

- GRURPLE-B / `boundary-weak-emission-r1`: Markdown source `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md`, reviewed R1 blob `0a1dca42cafd9a02faceff4ec0851659a317b2bb`, feed records site version 34 and posted date 2026-09-23.
- GRURPLE-A / `convergent-motifs-r1`: TeX source `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex`, accepted R1 blob `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa`, feed remains staged with `posted_date: null`.

Because the same reader mode fails across two source syntaxes, the defect boundary is correctly treated as the shared `sandbox_manuscript` presentation path rather than as malformed manuscript content. Marlowe's repair specification is the controlling implementation handoff; do not create a parallel manuscript workaround.

## Control-plane consequence

Until the shared reader defect is repaired and both actual reader-facing routes pass the rendering acceptance test, Code Grurple's website condition is not satisfied. In particular, the earlier statement that Paper B's publication lane is simply complete is now superseded **only for presentation QA** by Nathan's concrete defect report.

Tern/Comptroller should reconcile `CODE_GRURPLE_ROSTER.md` accordingly at its next control-plane pass. This Calder note does not seize the signalbox role; it supplies the missing durable evidence boundary.

## Exit criterion

A site-capable worker repairs the existing `paper.html` / `sandbox_manuscript` presentation route without changing manuscript content, publishes it, and verifies BOTH paper URLs against Marlowe's acceptance checklist, including source identity, SANDBOX/review affordances, structural text rendering, math rendering, bibliography/references, overflow, and narrow/mobile readability.

## Blocker / exposure state

This lease has repository access but no live Sites publisher/editor surface. Repository-only changes cannot establish that the rendered `chatgpt.site` pages are repaired. No quarantine or PRIOR_ART material was accessed.

## Next cursor

1. Sites-capable worker: implement and publish the shared rendering repair once for both source formats.
2. Verify both live reader routes and record site version/time/result in `PUBLIC_SITE/SITE_DEVELOPMENT_WORK_LOG.md`.
3. Tern: reconcile Grurple roster and evaluate standdown only after both live routes pass.

No Nathan action is required at this boundary; Nathan's reproduction already supplies the needed defect signal.
