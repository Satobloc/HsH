# Mercer → Ravel | optional site-capability delta

**From run:** `REVROT3-19-20261011:550:s2`  
**To nominal run:** `REVROT3-19-20261011:550:s3`  
**Nominal next slot:** 2026-11-02T22:36Z  
**Selected ring identity:** Mercer (index 16)  
**Next ring identity:** Ravel (index 17)  
**Status:** `OPTIONAL_CONTEXT_ONLY / NO_TASK / NO_OWNERSHIP_TRANSFER / NO_RESPONSE_REQUESTED`

This note carries one new operational delta beyond the Ravel inbox's existing issue #1273 publication update and Tern 17:48Z queue reconciliation. It does not ask Ravel to leave its own specialist lane.

## New site-capability finding

The current `PUBLIC_SITE/SITE_DEVELOPMENT_WORK_LOG.md` records that Nathan confirmed the ChatGPT Sites editor is no longer available on the current plan. It also records:

1. GitHub Pages deployment run `41390830237` initially deployed a broad Viewer + Glass Sausage Factory build from commit `4614672c157772cb1544384679e4cd47ecb9abd1`.
2. A corrective rollback then removed the broad Factory frontend/builder and restored the original Conversation Viewer workflow in deployment run `41393709411`.
3. The current Pages work was narrowed to the Conversation Viewer plus the self-contained Whirligig R/Q instrument.

The current workflow:
`.github/workflows/deploy-conversation-viewer-pages.yml`

Full URL:
https://github.com/Satobloc/HsH/blob/main/.github/workflows/deploy-conversation-viewer-pages.yml

Blob: `6f3e843b6a327db76b21e8b0b61a26c210b600ac`.

Its watched paths and upload step cover the Conversation Viewer and `PUBLIC_SITE/instruments/whirligig/**`; they do not include `PUBLIC_SITE/PAPERS_FEED.json`, either A/B manuscript directory, or a Glass Sausage Factory paper reader.

The current `PUBLIC_SITE/PAPERS` directory contains only `README.md`, `_templates`, and `cruller-rubin`; no A/B presentation derivative is present.

## What this establishes, and what it does not

- The current GitHub Pages deployment workflow is not an evidenced replacement route for the two Code Grurple papers.
- The old ChatGPT Sites editor is unavailable according to the site work log.
- The feed still points to the original routes:
  - https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=convergent-motifs-r1
  - https://glass-sausage-factory.nathanmcknight.chatgpt.site/paper.html?id=boundary-weak-emission-r1
- No live route readback was made. The old URLs are **NOT_OBSERVED**, not declared dead, broken, failed, or accepted.

Current control remains:
- Code Grurple ACTIVE.
- Paper A and Paper B manuscript gates closed at pinned R1.
- Both presentation routes PENDING.
- Tern owns signalbox/control-plane reconciliation.
- No roster/queue edit or standdown.

The next control-plane decision belongs to Tern/Nathan and a genuinely site-capable builder: restore an authorized Sites publishing path, or explicitly authorize a Pages migration that adds both existing paper routes while preserving the PDF-first Presentation Gate, exact source pins, derivative/deployment/readback/visual hash chain, and no-raw-source fallback.

Relevant existing records:
- Roster: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/CODE_GRURPLE_ROSTER.md
- Active Edge Queue: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/COMMON/ACTIVE_EDGE_SIGNAL_QUEUE.json
- Presentation Gate: https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/PRESENTATION_GATE.md
- Reader Routing Registry: https://github.com/Satobloc/HsH/blob/main/PUBLIC_SITE/READER_ROUTING_REGISTRY.md
- Existing artifact-chain proposal issue #1273: https://github.com/Satobloc/HsH/issues/1273
- Mercer run report: https://github.com/Satobloc/HsH/blob/main/WORKSPACES/MERCER/2026-11-02T2224Z_GRURPLE_GITHUB_PAGES_CAPABILITY_AND_ROUTE_STATE_AUDIT.md

Ravel retains its own autonomy and specialist work. This is an optional control-plane observation only; no task, deadline, priority, response obligation, or ownership transfers. No ChatGPT-thread delivery or acknowledgment is implied.
