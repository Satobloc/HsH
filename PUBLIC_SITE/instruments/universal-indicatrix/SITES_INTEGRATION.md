# Universal Indicatrix: Sites integration and cross-worker editor contract
**Date:** 2026-10-26
**Status:** REPOSITORY SOURCE COMMITTED; LIVE SITES READBACK PENDING
**Requested public route:** `/laboratory/universal-indicatrix/`
**Adjacent established instrument:** `/laboratory/whirligig/`

## Controlling files
- Canonical site HTML: `PUBLIC_SITE/instruments/universal-indicatrix/index.html`.
- Frozen scientific HTML (no site navigation wrapper): `tools/ui_blind_lab/index.html`.
- Reproducibility/test assets: `tools/ui_blind_lab/ui_kernel.py`, `test_ui.py`, `ui_browser.js`, `FREEZE_MANIFEST.json`, `BLIND_FREEZE_GEOMETRY.json`.
- Full mathematics, sources, limitations, command line: `tools/ui_blind_lab/README.md`.
- Mandatory extended worker release notes: `tools/ui_blind_lab/HANDOFF_AUDIT_AND_RECOMMENDATIONS_20261026.md`.
- Post-freeze detailed comparator: `tools/ui_blind_lab/POSTFREEZE_COMPARISON_20261026.md` (the site should label this as a **subsequent comparison**, NOT a blind prediction).
- Whirligig canonical source: `PUBLIC_SITE/instruments/whirligig/index.html` and current `SITES_INTEGRATION.md`. Do not remove or rewrite the Whirligig mechanism.

## What the website should expose
1. A **Geometry Laboratory** hub with equal prominence for two separate instruments: **Whirligig R/Q** (constrained equation-to-equation composition) and **Universal Indicatrix** (relative 4D frames, scaling/rotation, inverse map, independent unweighted action-factor measurement).
2. Open the new UI at `/laboratory/universal-indicatrix/` with all original controls, six rotation-plane inputs, 4D path projections, numerical residuals, inverse CSV input and all working file exports. Preserve navigation between both instruments.
3. Below/next to the interactive lab, expose **Read mathematical specification**, **Source code & Python tests**, **Release freeze manifest**, **Independent review requests**, and **Post-freeze comparison**. Display the actual scientific status: executable dimensionless geometry; no independently validated semiconductor spectral bridge or transport prediction.
4. Keep long documentation outside cramped lab controls. Provide responsive layout, keyboard navigation, accessible labels and prose explaining canvas content. Make the controls legible on mobile.
5. Show source commit/hash, version `SAT-UI-BLIND-20261026-001`, and **last verified live deployment** separately.
6. The browser exports are downloads only; they do not silently write to GitHub. Document a real owner/worker edit loop: modify on a branch/authorized API, PR/merge, run tests, update source/version, release site mirror, verify actual live route. If the Sites builder can edit the GitHub-linked files directly, demonstrate a reversible source-level change and read it back from GitHub; otherwise make the import/export/commit workflow visible.
7. Do NOT fetch/ship private HSH_RESOURCES content or sensitive worker notes to the public site. Do not copy holdout numerical targets or held-out PDF into the actual blind engine. The fully documented comparator link is an explicit post-freeze artifact.

## Site acceptance checks
- On mobile and desktop, the menu shows both instruments; each route loads without dead links or script errors.
- UI's default curve produces the previously frozen dimensionless identity and nonzero scale/rotation diagnostics. Test changed radial function and two rotation planes; verify the output changes and the residual remains appropriately small under step refinement.
- CSV, controls JSON, frozen JSON/digest downloads work; invalid expressions produce intelligible errors.
- Existing Whirligig still has its latest Analemma and locked elbow, equation presets, pair iteration, and output-discrimination plots; its own acceptance protocol remains mandatory.
- Live site HTML actually reflects the current **site** GitHub source; if the site app is separately hosted, report the deployed version after readback rather than inferring from a GitHub commit.
- Any modified physical mathematics is a versioned follow-up, not a rewrite of the existing frozen baseline.

## Audit requests created 2026-10-26
- Meridian: https://github.com/Satobloc/HsH/issues/615
- Mercer: https://github.com/Satobloc/HsH/issues/616
- Ravel: https://github.com/Satobloc/HsH/issues/617
- Kestrel: https://github.com/Satobloc/HsH/issues/618
- Sites editor: https://github.com/Satobloc/HsH/issues/619

## Binary/source packaging limitations at handoff
The executable HTML, source code, JSON freeze, metadata, comparison Markdown AND **binary comparison PDF, complete source ZIP and screenshot** are now GitHub committed under `PUBLIC_SITE/instruments/universal-indicatrix/assets/` (commit `099025868144b19d926e3710a6e42e713a93f2d5`). Git tree returned matching blob SHAs and byte sizes. The independent original-paper **holdout ZIP remains separate and NOT GitHub committed** to preserve the computational holdout boundary. See `ASSET_MANIFEST.json`. These source artifacts remain separately downloadable from the original turn while available:
- `SAT_UI_BLIND_LAB_20261026.zip` SHA256 `147643193d32a2924344c064a550d3803ef5cbf2d6f84fc991a0224c4e99d67f`.
- `SAT_POSTFREEZE_COMPARISON_20261026.pdf` SHA256 `4727cd57870a729897853693a968024706f918f4b772ec5e0fc2ce640b571986`.
- `SAT_3C_SiC_HOLDOUT_20261026.zip` SHA256 `c84b66dd9cfc43e2a7567395c7cf1d6c26e0f2d0919c9a588cf32983a66bc8f8`.
- `screenshot.png` SHA256 `c1c3b729849d1657183727d2bca7e4a7e8deafaa6c9613b6269f0b38025dea1e`.
For long-term portability, build new distributable ZIP/PDFs **from GitHub-verified source**, attach to a repository release or documented asset storage, and record exact digest. Never present an unverified binary URL as live.
