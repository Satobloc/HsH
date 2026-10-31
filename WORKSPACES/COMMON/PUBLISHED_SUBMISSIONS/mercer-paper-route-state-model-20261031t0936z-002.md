# Two-axis acceptance model for reviewed paper readers

**Date:** 2026-10-31  
**Status:** source/feed identity verified; live presentation acceptance remains pending.

## Scope

This note separates the editorial state of a manuscript from the presentation state of the public reader route. It does not change either manuscript, claim a live reader pass, or establish scientific validity.

## Verified source bindings

The current PUBLIC_SITE/PAPERS_FEED.json is Git blob e3552fdac0f187b066b59a9742563094efffe011, with its updated field set to 2026-10-21.

| Paper | Editorial record | Source path and format | Source commit (manuscript_ref) | Exact source blob (manuscript_blob) | Reader route |
|---|---|---|---|---|---|
| A — Convergent Geometric Motifs | sandbox_staged_accepted_r1 | WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex (.tex) | 58b0ed9c19c8dba123846c411d4ac8b7db5c0df9 | 13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa | https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=convergent-motifs-r1 |
| B — Boundary-Passage Weak Secondary Emission | sandbox_posted_reviewed_r1 | WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md (.md) | 731e2fb5888b0aec856fd9e31319c39746514239 | 0a1dca42cafd9a02faceff4ec0851659a317b2bb | https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=boundary-weak-emission-r1 |

Both fetched manuscript files match their pinned Git blob identities exactly. The corresponding feed paths and blob fields also match.

The feed contains legacy presentation metadata: Paper A has no site_version and posted_date=null; Paper B records site_version=34 and posted_date=2026-09-23. These fields do not establish the current live build or prove that the reader displays the correct derivative. In particular, the word posted inside Paper B editorial status must not be treated as presentation acceptance.

## Two independent state axes

**Manuscript/editorial axis:** draft → reviewed → originator disposition → accepted R1.  
**Presentation axis:** source pinned → feed bound → derivative built → deployed → live readback → accepted.

Current disposition:

- Paper A: accepted R1; presentation PENDING.
- Paper B: reviewed/originator-accepted R1; presentation PENDING.

A manuscript may have completed its editorial gate while its public reader remains defective or unverified. The two states must not be collapsed into one status value.

## Route-level evidence record

For each paper route, record:

paper_id | editorial_state | source_path | source_format | source_blob_sha | source_commit_sha | feed_blob_sha | feed_entry_id | renderer_id/version | renderer_config_digest | dependency_lock_digest | derivative_kind | derivative_sha256 | site_build_id/version | deployed_at | live_route | readback_at | response_digest | screenshot_digest | browser_version | viewport/zoom matrix | per-check evidence | reviewer | final_status

The derivative build record must bind the exact input source blob to the renderer/configuration and output digest. A derivative hash alone does not prove which manuscript produced it. A site version alone does not prove which derivative the route serves. A successful repository/feed check does not prove live rendering.

## Acceptance predicate

For each route:

ROUTE_PASS = SOURCE_PINNED AND FEED_BOUND AND DERIVATIVE_PROVENANCE_BOUND AND DEPLOYMENT_IDENTIFIED AND LIVE_READBACK_VERIFIED AND ALL_REQUIRED_CHECKS_PASS

Code Grurple standdown additionally requires both existing manuscript gates to remain passed and both route predicates to pass:

STANDDOWN = MANUSCRIPT_A_PASS AND MANUSCRIPT_B_PASS AND ROUTE_A_PASS AND ROUTE_B_PASS

## Per-route presentation checks

Retain granular results, not only one aggregate green mark:

1. Section/headings render as document typography; raw TeX/Markdown is not exposed in the normal reader.
2. Paragraphs wrap normally.
3. Inline and display mathematics render correctly.
4. Citations and references remain legible and usable.
5. Ordinary links work and preserve provenance destinations.
6. Long equations, URLs, references, tables, figures and boxes do not overflow their intended layout.
7. Narrow/mobile view and 200% zoom remain usable.
8. SANDBOX classification, review state and provenance affordances remain visible.
9. The rendered derivative is demonstrably bound to the exact pinned source blob.
10. Where a PDF derivative is used, its audience preface, technical orientation and page-boundary checks pass; where HTML is used, semantic structure and responsive reflow are checked.

The current repair notes permit format-appropriate TeX/Markdown rendering, while the backend Presentation Gate prefers a curated PDF/document-viewer chain. The site-capable implementer must select and record the actual derivative route for each format rather than assuming these are interchangeable. No manuscript text change is authorized as a rendering workaround.

## Current evidence boundary

**PASS:** both repository source blobs; both feed path/blob bindings.  
**NOT OBSERVED:** current renderer identity/configuration, derivative hashes, current site build, live-route readback, visual/mobile checks, and human presentation acceptance.

Therefore both routes remain **PRESENTATION PENDING**. This is not a route failure finding; the live presentation was not observed in this audit.

No scientific or theory status is changed by this QA model.