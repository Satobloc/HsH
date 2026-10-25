# SITES EDITOR: Implement the original Mercer Viewer, Mersearch and owner-only cross-repo curation
Date: 2026-10-25. **Priority: immediate.** This is a ready-to-execute website implementation request from Nathan. Preserve the existing site brand and other working routes. Do not replace working UI with static screenshots or generic document renderers.

## Before editing
Read `PUBLIC_SITE/SITE_DEVELOPMENT_WORK_LOG.md`, `PUBLIC_SITE/READER_ROUTING_REGISTRY.md`, `PUBLIC_SITE/PRESENTATION_GATE.md`, `CONVERSATION_VIEWER/README.md`, `WORKSPACES/COMMON/MERSEARCH_WORKER_START_HERE.md` and `PUBLIC_SITE/WEBSITE_INTEGRATION_ROUTES.json` from `Satobloc/HsH`. The repo's publisher and the separate chatgpt.site frontend are different deployment surfaces. Do not claim the live website is updated without an actual Sites publish and verification. Do not expose raw machine packets as reader documents.

## 1. Restore the **original Mercer Conversation Viewer**, not a replacement
The original UI is maintained at `HsH/CONVERSATION_VIEWER/index.html` and distributed via **https://satobloc.github.io/HsH/**. It is the authoritative viewer front end, with its original stylesheet, speaker colors, controls, timeline, searchable raw conversation source, version sets and replay. The backend viewer was just updated with:
- default full conversation-body search from the global sidebar input;
- explicit modes: message bodies, message bodies+titles+dates, titles only and dates only;
- assistant typealong speed now independent, default **0.5x** rather than the previous hidden tenfold acceleration;
- a query preservation fix for global-result deep links.

**On https://glass-sausage-factory.nathanmcknight.chatgpt.site**: map the main **Conversations** navigation to `/conversations/`. Render that **original** Viewer in a responsive framed embed using its canonical GitHub Pages URL, full available viewport, unobstructed controls. Do not clone or reimplement the viewer markup and do not route the user into a generic JSON reader. On browsers where an iframe is blocked by cross-origin framing/CSP, show a prominent **Open original Viewer** hyperlink to the canonical URL (new tab). Preserve query parameters `c`, `m`, and `q` and browser Back navigation; avoid iframe-origin assumptions. Add an unmistakable "Original Mercer Viewer" provenance label without changing the brand styling inside the iframe.

**Acceptance tests:** open a dated conversation; use the original timeline and speaker colors; search *message bodies* across the entire catalog from the sidebar with a term absent from the filename; switch to title-only and verify different results; open a global hit and see the query in that conversation's internal search; Typealong 1x has assistant typing at 0.5 of the human-turn typing speed and can be changed. Check desktop and mobile. Do not mark done by simply rendering the GitHub source code or a screenshot.

## 2. Make human Mersearch + Mersearch Math a first-class site instrument
**Immediate public reader:** `https://satobloc.github.io/HsH/mersearch/` (source `CONVERSATION_VIEWER/mersearch/index.html`). This is a *working public conversation-level candidate search interface* already committed to HsH and carried by the GitHub Pages deploy workflow. It supports words, AND/OR/NOT, parens and approximate mathematical-symbol terms using the existing public approved inverted index. Embed/link it at `/research/search/` immediately and prominently from the main website navigation and the Conversations page. Tell visitors explicitly that it is a **public conversation preview** and not the complete pinned Mersearch research engine.

**Full research experience required next:** integrate the pinned stable Mersearch engine from HsH `tools/search_archive_content.py` via a protected, resource-limited server endpoint running over checked-out permitted repositories. Never ship private `HSH_RESOURCES` indexing data to a public client. Enforce **server-side scope** for public visitors to allowlisted public content/curated Viewer bodies; if the owner logs in, optionally unlock the third research repository on the server with verified owner permission. Do not expose repository tokens. Implement input limits, stable query IDs, reasonable timeouts, escaping, pagination, caching, and source provenance. On the frontend support:
- full text vs titles/path; exact phrases vs token search; Boolean `AND OR NOT`, parentheses, quoted phrases, `NEAR/n`;
- mathematically normalized search `math:`, compatible Greek/LaTeX variants, formula history, fielded filters `author:user|assistant`, date ranges, source repository, extension, status/history;
- results with **actual source path, date, speaker identity if verified, message ID or page/line locator, excerpt containing matched terms, duplicate/superset grouping, query version and crawl coverage**;
- click through to original conversation and relevant message, not generic Github file HTML as default;
- explicit "public subset" vs "owner research scope" badges in UI, errors indicating unsupported fields instead of silently broadening search;
- no false completeness / first-mention claims; math equivalence and NEAR hits must be verified by the real engine.

**Deployment acceptance:** a query in 2023 messages and a source-linked equation query return independently checkable raw-message/source anchors. Public requests must never return private reference text, paths, excerpts, or even autocomplete hints from private sources. The frontend must remain functional with public preview even if the protected engine is offline.

## 3. Build OWNER-ONLY curation controls on any file, section, or featured object
The owner must be able to curate **any source or source subsection across the three repositories**, in a secure owner-only admin file tree, as well as every public website page, reading object, conversation, message, diagram, podcast, citation/section, card, and search result.

**Authentication/security:**
- Check the current logged-in **Sites account identity on the trusted server**. Only Nathan's actual authenticated owner account may write; never rely on comparing usernames in public JavaScript, a hidden button, a query-token, `localStorage`, or a public GitHub access token.
- Authorize **every** mutation server-side against the owner user ID, allowed repository/visibility, target ID, and action. CSRF protection, rate limiting, reviewable mutation receipts, optimistic concurrency/CAS and a durable undo/history trail.
- The raw owner notes and all private references live in authenticated private storage. **Never** publish private annotations, `HSH_RESOURCES` locators, unreleased content, GitHub tokens or account identifiers to public GitHub JSON, public URL query strings, analytics, or static assets.
- GitHub API currently reports the HSH_RESOURCES repository as `visibility:public` despite its documented private-information boundary. Treat it as **never public-consumable** until Nathan deliberately resolves that discrepancy. Do not silently import it.

**Admin interaction:** owner-visible inline toolbar on hover/click plus equivalent keyboard/accessible "Edit visibility & prominence" menu. Stable target identity `(repo,path,source SHA,section anchor/id)`. Provide options:
- **Hide from public**, **Show**, **Source only**; hide does not delete originals or imply the raw GitHub URL is private.
- **Promote / demote**, priority 0..100, search weighting, supporting/core roles, editorial status current/historical/tentative/retired/superseded/needs review.
- **Promote to front page**, choose exact ordered slot **first/second/third/etc**, placement (hero/featured/reading/visuals/podcast/general), section sort index; allow drag reorder with server-side position validation. Fixed slots must remain fixed even while rotating other items.
- **Retire from front-page rotation** without deleting or losing history; **restore to rotation**.
- **Comment** (private by default; explicit publish switch with preview). Attach exact source path/section and revision, resolve/reopen comment threads.
- **See also**, **corrected by**, **superseded by**, **continues**, **relates to** as typed cross-repo links to sources, documents and sections, with link integrity checks and broken-link flags.
- Status and prominence are **independent**: historic source may be prominent; a retired front-page card is not a deleted scientific statement; old facts retain dated source context.
- Bulk editing optional, but individual clickability across cards/files/sections is required.

**Backend already prepared in HsH:** `PUBLIC_SITE/OWNER_CURATION_PUBLIC_SCHEMA.json` and `PUBLIC_SITE/OWNER_CURATION_PUBLIC.json`. Public Sites reads only the public-safe projection from an absolute origin URL. The schema captures visibility, prominence, priority, slot, rotation, section order, typed links and optional expressly public comments. The source state is intentionally empty until authenticated owner actions are verified. The site must never allow the browser to write this repository file directly unauthenticated.

**Implementation:** build a secure owner-only server store and mutation API first; expose a sanitized, source-verified **public-safe projection** through the documented JSON schema. Use GitHub commits with current blob-SHA conflict checks or a trusted server database + verifiable projection publication; do not replace a newer file from stale state. Each mutation must record actor, source identity/revision, action, prior/current values, reason (optional), timestamp, status, and undo receipt. A server-held GitHub credential may be used only for permitted projection updates. Public visitors see the published outcome, never admin controls, drafts, or comments marked private.

**Acceptance tests:**
1. Owner can click a public card, set slot 1, reload and see it first without re-entering it; set slot 2 for another card, preserve deterministic order.
2. Owner can select a paragraph/section, add a private note and a "see also" relationship to a different repository's source; only owner can read private note.
3. Owner can retire from rotation and restore without touching the canonical source.
4. Nonowner and logged-out clients cannot write by direct API calls, even with a crafted hidden toolbar request.
5. Private-source results are absent from public API payloads, cached content, site search, and error messages.
6. Two concurrent edits cannot silently overwrite one another; undo works and is logged.
7. All ordinary reading follows `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` and never falls back to raw machine JSON.

## 4. Deployment and reporting
First publish the corrected original Viewer embedding and Mersearch preview; then owner curation backend and UI; then server-backed full Mersearch. These may release independently, but their public/owner/private boundaries must remain consistent.

Read `PUBLIC_SITE/WEBSITE_INTEGRATION_ROUTES.json` for canonical route URLs and public projection URLs. Preserve existing UI instruments, FLC story feed, audio/listen features, paper reader, and site aesthetic. Write a brief change log to `PUBLIC_SITE/SITE_DEVELOPMENT_WORK_LOG.md` with exact pages/routes changed, date, deployed site version, screenshots/QA, API security checks, what remains unsupported and why. Do not close research issues or retire branches as part of a site rebuild.

**Definition of done:** demonstrably live on chatgpt.site with real source-linked UI, true owner authorization tested on the backend, and no false claims that the public preview searched all three repositories.
