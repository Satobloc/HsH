# Glass Sausage Factory: static site build

**Status:** repository build source; GitHub Pages deployment must be verified independently.  
**Purpose:** provide a durable public website without requiring the ChatGPT Sites editor.

## Architecture

- The existing Conversation Viewer remains at the project root (/HsH/), and its existing /mersearch/ route is preserved.
- The new Glass Sausage Factory site is built at /HsH/glass-sausage-factory/.
- Geometry Laboratory instruments retain their registered root routes:
  - /HsH/laboratory/whirligig/
  - /HsH/laboratory/universal-indicatrix/
- /HsH/conversations/ and /HsH/research/search/ are friendly aliases to the preserved Viewer and public Mersearch reader.

The build is static HTML, CSS and JavaScript. GitHub Actions assembles the Pages artifact from the HsH repository. No ChatGPT Sites editor session or paid Sites feature is required.

## Build locally

From the repository root:

    python PUBLIC_SITE/site/build.py --root . --output _site --base-path /HsH/
    python -m unittest discover -s PUBLIC_SITE/site -p 'test_*.py'
    node --input-type=module --check < PUBLIC_SITE/site/site.js

The script preserves the Viewer, builds the Glass Sausage Factory route, copies registered instruments, creates public-safe JSON projections, copies only locally available approved Visual Atlas assets, and copies published PDFs only after checking their PDF signature and pinned SHA-256.

## Public sections

- Start / two ways in
- Visual Atlas
- Current Work
- Papers and manuscripts
- Reading Room
- Geometry Laboratory
- In the News
- Quotable Nathan / Quotable LLM
- About / project orientation

Every ordinary public page has the shared Listen control. It uses the repository page-listen.js and math-speech.js runtime and the browser Web Speech API.

## Presentation and authority boundaries

- Current Work carries the snapshot date from its source feed. A dated snapshot is not represented as a live status query.
- Papers with a published PDF use the registered presentation derivative. Manuscripts without one are labeled PRESENTATION PENDING and expose source/review records only as secondary links.
- The site does not render arbitrary repository paths as reader pages.
- Public Mersearch remains a candidate search over the existing public conversation index, not the protected three-repository research engine.
- Owner curation is read-only. OWNER_CURATION_PUBLIC.json is a public projection, not an authenticated write endpoint. Private notes and owner-only controls are not implemented in this static site.
- Eight legacy approved illustration entries still point to the previous ChatGPT Sites asset host. They are not hotlinked. The build admits only approved local assets with repository-backed paths; the older images can be mirrored after source retrieval and provenance verification.

## Deployment

The deploy-conversation-viewer-pages workflow assembles a combined artifact and deploys it through GitHub Pages. A successful GitHub commit is not itself deployment proof. Verify the Actions run, Pages URL, each route, PDF downloads, Viewer search, and instrument controls before calling the public site deployed.

The project Pages root remains the Conversation Viewer for backward compatibility. The Glass Sausage Factory is added alongside it at /glass-sausage-factory/, avoiding a destructive replacement of the existing root route.

## Deployment status — 2026-11-02

The initial GitHub Pages deployment succeeded (Actions run 41390830237; source commit 4614672c157772cb1544384679e4cd47ecb9abd1). The new Factory route is https://satobloc.github.io/HsH/glass-sausage-factory/. The existing Viewer root is preserved. A subsequent confirmation deploy is running against the latest workflow revision. Deployment action success is verified; a separate visual browser smoke-test is still pending.
