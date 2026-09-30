# Presentation review — 2026-09-30

ᚼ Requested by Nathan for glass-sausage-factory. Repository review and staging only; no new Sites publication or PDF build was performed.

## Evidence and scope

Reviewed HsH orientation, WORKSPACES/COMMON onboarding, current workflow orientation, shared-state write safety, September 30 intake routing, PUBLIC_SITE documentation/work log/current-work/asset feeds, live-influx runtime and packet guidance, CALIPER's September 28 packet, its presented Markdown and RevTeX source, and STORYO's image ledger. Reviewed the original SAT archive README, root structure and September 24–30 commit comparison (12 commits, 12 changed files, no image changes). This is a bounded repository review, not a complete visual audit of every published page.

Sites reports current version 36. Browser inspection, source checkout, PDF compilation and deployment were unavailable in this session. Reader/runtime findings below combine the previously reviewed version-36 implementation with newly fetched repository evidence; they require verification against the current source before deployment.

## Priority repairs

1. The supplied CALIPER URL targets publication-packet JSON, rather than its presentation. The packet identifies LIBRARY/presented/sat-analogue-to-calibration-howto.md and explicitly requests attaching/regenerating its RevTeX PDF. Resolve packet semantics before choosing a renderer. Show the title, plain-English introduction and publication readiness; never fall back to raw JSON.
2. Version-36 generic JSON and unsupported-source fallbacks can display raw content; explicit source views and links also expose it. Centralize all repository navigation through a presentation resolver, including relative links, GitHub blob/tree/raw links and links discovered within documents. An unsupported document should show a readable preparation state, not source dumps.
3. LIBRARY/presented/SAT_HowTo_AnalogueToCalibration.tex requires fontspec and DejaVu fonts plus images/01_original_sketch.jpeg, 02_clean_line.png, 03_dense_single.png, 04_dual_path.png and 05_ratio_sweep.jpeg. These exact companion paths are absent in the inspected tree. The image ledger provides some candidate original names, but several generated assets are unresolved. Do not substitute visually similar images. Compile with a compatible engine only after resolving dependencies; inspect boxes, tables and equations for overflow.
4. PUBLIC_SITE/CURRENT_WORK.json has snapshot_date 2026-09-20. A fresh network response is not fresh editorial state. Show feed publication time separately from retrieval time. The active queue status is ACTIVE_OVERRIDE_PAPER_A_ACCEPTED_R1_POSTING_VERIFICATION; the prior exact ACTIVE_OVERRIDE comparison misses it. Respect accepted manuscript state and avoid restarting review.
5. The packet runtime caches for five minutes, fetches packets sequentially and silently skips malformed packets. Add explicit validation/observable failures and concurrent bounded retrieval, retaining last known good content with an honest timestamp.
6. Preserve source-specific presentation for reconstructed conversation material. Verify listen-along highlighting, pause/resume and scrolling with a real conversation; do not convert conversation JSON into a generic article.
7. Complete earlier layout requests: a side column of scrollers; one or two long panels randomly selected per page load for gentle auto-scroll; pause on user interaction and respect reduced motion. New badges must use trustworthy content dates, apply wherever that item appears, and expire after five days without relying on feed snapshot dates.
8. URLs without meaningful linked text should become accessible icon click-throughs. Preserve descriptive index labels. Mathematics must retain semantic grouping and use actual typesetting, never character-by-character wrapping.

## Rendering and release acceptance

Apply PRESENTATION_CONTRACT.md. Start with the supplied packet and scan all navigation surfaces: home/current work, workspaces/Common, archive indexes, cards, search, galleries, document citations and in-reader links. Record source path, intended audience, presentation artifact and verification status for each target. Compile documents, reject unresolved references/missing assets/overflow, inspect every PDF page, and check phone widths and 200% zoom. A PDF cannot itself offer semantic browser reflow; provide a corresponding rendered readable view where needed rather than squeezing or splitting symbols.

Restore conversation listen-along and test badge expiry, reduced-motion scrolling, packet resolution and relative links before pushing a matching Sites artifact. Repository edits alone do not change the live site.

## Image intake

Created PUBLIC_SITE/STAGING with 89 distinct image blobs copied from 91 September 30 intake paths. Original files remain intact. The manifest records identical blobs elsewhere and source paths. All assets await visual inspection, provenance/credit/alt text and gallery/thumbnail selection. Filename labels are not authoritative classification. No thumbnails generated or galleries promoted.

— Mercer Calder
