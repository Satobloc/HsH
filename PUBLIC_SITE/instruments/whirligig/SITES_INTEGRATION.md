# Whirligig | Glass Sausage Factory integration

**Status:** REPOSITORY-PUBLISHED / SITES FRONTEND NOT VERIFIED
**Date:** 2026-10-16
**Presentation class:** interactive geometry instrument (executable HTML), not a reader document or machine/control dump.

## Visitor object
- Public title: **Whirligig — Interactive Geometry Laboratory**
- Subtitle: **Two rotations, one evolving trace**
- Recommended Sites route: `/laboratory/whirligig/`
- Canonical source: `PUBLIC_SITE/instruments/whirligig/index.html`
- Primary experience: 3D sphere / torus mapping; 4D Indicatrix rotation mode
- Interactions: independent rotor rates, phase, amplitude, coupling, radius, scrubbable observation parameter, orbit camera, pause/play, SVG export.
- Position within site: Geometry / solvers and Visual Atlas, with a homepage laboratory teaser where editorially appropriate.
- Accessibility: responsive layout, labeled sliders and buttons, text explanation; native canvas needs supplementary explanatory text and alternative presentation for non-visual use.

## Relationship to research engine
The existing `tools/whirligig_rq/` research reconstruction is **not replaced**. Its actual rolling sphere, orthogonal internal gimbals, R–Q connector, Bishop frame and torus quartic ray intersection tests are numerically developed and documented in `tools/whirligig_rq/README.md` and `RESULTS.md`. The browser instrument is a separate simpler visualization. It must NOT be presented as implementing that entire research solver.

## Sites publication contract
The browser instrument is a static self-contained HTML document. A Sites frontend can embed the instrument using an approved same-origin route or iframe only if the actual Sites runtime allows executing HTML/JavaScript in that context. A repository HTML file being discovered is not sufficient for visitor execution. Do not route visitors to the GitHub raw-source viewer as if it were the interactive lab. If Sites cannot serve/embed executable content, it should show a presentation-pending card and the static source pointer for development.

Frontend acceptance:
1. Confirm deployed route renders HTML with JavaScript actually running on phone and desktop.
2. Verify 3D mode and SO(4) mode toggle, slider changes, scrubbing, orbit drag, SVG export.
3. Verify mobile controls remain usable and no script permissions/CSP restrictions break drawing.
4. Independently read back the served page and record the Sites version and URL.
5. Only then mark `SITES_PUBLISHED_VERIFIED`.

## Source routing and integrity
- Existing public-site presentation gate applies to papers and reader documents. This artifact is a deliberately executable *instrument*, not a paper and not a generic markdown/JSON fallback.
- Maintain source identity and status; derived geometric visual traces are Class P for the explicit model formulas only, without claiming physical validation.
- Avoid duplicating or reimplementing `tools/whirligig_rq` equations as if the browser version supplied source-equation equivalences.
- This repository file triggers ordinary discovery on source push as documented by `PUBLIC_SITE/AUTOMATIC_DISCOVERY.md`; discovery != live site publication.

## Publication receipt
2026-10-16: GitHub connector fallback used because the execution environment's `git ls-remote https://github.com/Satobloc/HsH.git HEAD` failed DNS resolution. Created `PUBLIC_SITE/instruments/whirligig/index.html` in commit `16d355ee3ec9e4f3472911c721a6b7ade70bc08a`. Independent `fetch_file` readback returned 9,140 characters, blob `397aac15d50750e3b01f9d891759f2dc3066dddc`. No ChatGPT Sites deployment action was available or verified.
