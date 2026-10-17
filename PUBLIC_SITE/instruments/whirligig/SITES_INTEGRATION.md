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

## 2026-10-17 browser mechanical rebuild

Nathan Direct correction: torus tube minor diameter equals sphere diameter (a=b). Two source equations R and Q occupy opposing hemispheres/polar regions, and the mechanically coupled apparatus, not an unrelated decorative torus, must generate a composite Curvy Lisa curve. The previous browser visualization was structurally incorrect and is superseded by the replacement index.html in commit `937b02e0d410d635a364aa842c2802f437ecd66e`.

Current browser implementation: equal-radius sphere inside torus; selected-point analytic roll frame Q=W B^T; separate inverse-tanh latitude representations for R/Q; independent body-frame Ry/Rx gimbals; world-space R/Q endpoints and connector midpoint; local connector-normal pen basis; torus implicit surface forward crossing via numerical root bracketing and bisection; SVG export; live diagnostics including contact gear, closure gear mismatch, hit counts, and reversed-ray fallback counts.

**Scope limitations:** This browser construction does not yet reproduce the full Python solver's rotation-minimizing Bishop frame, strict quartic-root solver, optional source-anchor alignment, or validated holonomy compensation. The pen uses a documented 0.38 outward radial aiming bias, and may fall back to the opposite ray. The equal-radius tube/sphere contact is nonisolated, so unique-point rolling is not certified. A visible composite curve is an output of this chosen procedure, not a proved equation isomorphism. The current implementation has repository readback verification, **not browser runtime regression testing** or verified ChatGPT Sites deployment. Test independently before advertising as validated.
