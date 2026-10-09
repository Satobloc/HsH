# Mersearch public deployment gate | 2026-10-08

**Current state: staged in draft PR #10, NOT publicly deployed from this branch.**
Release identity: `mersearch-chronology-20261007`.
Public URL after a successful Pages rollout (subject to repository Pages settings):
https://satobloc.github.io/HsH/mersearch/

## Deployment model

**Release 0: public Conversation Viewer catalog search.** The Pages workflow:
1. Checks out public HsH.
2. Rebuilds its curated Conversation Viewer manifest.
3. Builds `CONVERSATION_VIEWER/mersearch/data/catalog.json` from that curated manifest only.
4. Rejects non-public repository links, encoded quarantine paths, uncurated/no-link entries, duplicate IDs and oversized catalog payloads.
5. Uploads and deploys the existing Viewer Pages artifact, now including `/mersearch/`.

This is a real static search of **conversation titles, source paths and dates**. It does not imply that any message body is indexed. It requires no search API, account, third-party service, network token, cookie or private repository checkout. The site labels it "Public catalog" and "partial". If a separately deployed full research API is available to an authorized local user, the UI can use the full engine instead. The development loopback server must NOT be internet-exposed.

The catalog can contain publicly listed conversations from `Satobloc/HsH` and `Satobloc/SAT_THEORY_ARCHIVE_2023-25` after Viewer curation. It **must not** include `HSH_RESOURCES`, `PRIOR_ART`, `QUARANTINE`, hidden/unpublished Viewer conversations or non-allowlisted GitHub repositories. Public repo exposure alone is not editorial approval of confidential content: owner review remains a gate.

## Automated release gates

- [x] Existing historical Mersearch Boolean regression (in PR workflows).
- [x] Chronology synthetic regression and capability manifest (in PR workflows).
- [x] Local read-only HTTP/API, public allowlist, origin check and private-source exclusion tests.
- [x] Static catalog builder unit tests, including URL-encoded quarantine bypass attempts.
- [x] Static catalog build from a real curated Viewer manifest.
- [x] Headless desktop and mobile screenshot/browser interaction QA; GitHub Actions run 37865627374, with screenshots archived in artifact mersearch-desktop-mobile-review.
- [x] Non-deploying Pages artifact preflight against the resolved public Viewer manifest: 780/780 eligible entries, approximately 1.22 MB catalog, no rejections; run 37865627374. The older lossy catalog rebuild was removed from the deployment workflow.
- [ ] Actual GitHub Pages deployment and post-merge workflow outcome; release has not been published.
- [ ] Owner review of publicly listed titles and curation scope; confirm nothing needs withdrawal. An automated pass over 780 current public Viewer titles found zero obvious email addresses, phone numbers, common credential prefixes, or high-confidence sensitive-title phrases; this is not a complete privacy audit.
- [ ] Owner approval to merge PR #10 and run the public Pages deployment.
- [ ] Post-deployment URL and sample-query checks, plus rollback drill.

**Do not check a box because a workflow was launched. Only mark it when the result is green and the exact checked commit matches the release candidate.**

## Public-site smoke test

After deployment:
1. Open `/HsH/mersearch/`; no uncaught JavaScript errors, CSS and fonts load without third-party tracking.
2. Search `SAT`; get source-backed conversation titles. Search `Chronophysical`; empty is allowed if no catalog title has that word.
3. Ensure the status says **Public catalog search** and the banner says **titles/paths only**. It must not claim full-text, all archives, or original mathematical derivation verification.
4. Confirm date-sort, origin-sort, title filter, evidence drawer, chronology (current results only), keyboard `/`, mobile layout, links to original GitHub sources and the Conversation Viewer.
5. Verify math and advanced text controls are disabled in catalog-only mode, not silently faked.
6. Inspect `mersearch/data/catalog.json` and confirm there is no `HSH_RESOURCES`, `PRIOR_ART`, or `QUARANTINE` source path, including URL-encoded variants.
7. Confirm the page works without a backend. If catalog fetch fails, it must honestly fall back to import-only mode.

## Rollback and incident response

A regression in UI or curation: revert PR or deploy a known-good preceding commit with `.github/workflows/deploy-conversation-viewer-pages.yml`. Remove the Mersearch navigation link if necessary, and redeploy the Viewer artifact. If material should not be public, fix the *source repository* and Viewer curation first; removing a search result does not make already-public raw source private. Static Pages/edge/browser caches may take time to expire. Avoid publishing private indexes to GitHub artifacts/logs.

## Next release (separate from the public catalog)

Full-text public archive search should use the Mersearch Core with a **reviewed, explicitly public immutable index**, server-side authorization/scoping, bounded query execution, size and coverage telemetry, and a real production hosting plan. Do not advertise "search all three repositories" publicly: `HSH_RESOURCES` remains restricted. Local research workers continue to use three-archive defaults with complete provenance and honest partial-corpus warnings.

Release 0 is valuable but must remain clearly labeled as catalog discovery rather than the complete historical search engine.
