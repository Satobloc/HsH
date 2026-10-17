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

## 2026-10-17 Nathan Direct: east/west and gimbal-elbow correction

**Supersedes the older north/south mapping and the gimbal-rotated endpoint construction.** Nathan specified that the two equation curves have points on opposite **E/W** hemispheres of the sphere, placing the variable-length connector's midpoint approximately through the sphere center. The constrained ninety-degree relationship is at the **gimbal elbow relative to the connector**, not a requirement to rotate/pin the entire connector rigidly onto the curves.

The browser instrument now constructs body-frame equation points with `R.x>0`, `Q.x<0`, using near-antipodal closed loops; rotates those points into world coordinates with the rolling sphere frame, and joins them with a variable-length connector. Gimbal controls no longer displace the equation points off their source curves. The local `W_obble` midpoint defines a perpendicular `W_iggle` plane; a displayed elbow arm and the pen direction are both constrained to that plane. The exact source geometry still needs confirmation of the gimbal elbow's mechanical mounting and the detailed two-hinge actuation: **the browser currently places its visible arm at the connector midpoint as a visualization choice**, not a claimed archival certainty. The pen-angle modulation is likewise a declared adapter pending a strict reconstruction of the two hinge planes.

Browser mathematical smoke test executed in a stubbed JS canvas/document runtime after commit: 241 sampled points; 0 E/W violations; maximum normalized midpoint displacement 0.0928663 sphere radii; maximum `|connector·elbow|` and `|connector·pen|` each below `2.5e-16`; torus ray hits 241/241 and no reversed-ray fallbacks in the default configuration. Changing R amplitude and Q amplitude separately moved the composite trace (nonzero aggregated changes 1.86608 and 1.82962, respectively). These are **executed numerical geometric checks** of the scripted sample, not live-browser UI verification or proof of the underlying equation-comparison claim.

**Browser file commit:** `4d4aeeee0f1361182e02afd2d0ad356ba86ea5fa`.

**Builder action:** Replace existing deployed `/laboratory/whirligig/` with this corrected repo instrument, revise homepage heading and copy to 'Whirligig R/Q: Two Equations, One Machine', and verify live behavior on mobile and desktop. Do not keep the old 'north/south' or free-floating decorative torus animation, and do not claim the site deployment happened from a repository write.


## 2026-10-17 | Sliding followers and single projecting elbow (superseding prior browser mechanics)

Nathan Direct correction: The crossbar is **not fastened to fixed points** on two source curves. Two contacts traverse the R and Q loops simultaneously as the ball rolls. Their moving positions determine the variable-length crossbar and its midpoint W_obble. The **gimbal elbow itself is the only projector**; it remains perpendicular to the instantaneous crossbar in W_iggle and reaches the torus wall to draw Curvy Lisa. There must be no second independently aimed pen or projector. Physical roll, ball orientation, input followers and elbow rotation use one minimum-return clock.

Browser implementation from commit 8e0be905a7a95fd7d1c6e9fdba5f8e7e06d8c8a7:
- Independent closed equation loops on east/west body hemispheres, with each loop parameterized by its own arc length but both followers driven by one common normalized phase and lap count.
- Sphere rolling gear (major+minor)/minor, with sphere radius equal to tube radius and its ball-center path inside the torus.
- Telescopic crossbar spanning the two *traveling* contacts, not permanently attached to either curve sample.
- Projecting gimbal elbow constrained perpendicular to the connector. Its angle is modulated by the difference of two local signed-turning/curvature surrogates; this modulation is an explicit browser-model choice, not a deduced torque law.
- First forward torus-wall intersection of the gimbal elbow is the one and only output Curvy Lisa. No separate pen and no reverse-ray fallback.
- Reduced rational rolling gearing on the controls' 0.05-unit radius grid sets the minimum common torus-circuit return, assuming the source followers and elbow turn whole-number revolutions per torus circuit.

Executed numerical checks in a JavaScript stub DOM/canvas runtime, not actual browser deployment:
- Default major 1.65, minor=ball 0.55: 1,651/1,651 elbow-wall intersections; E/W violations 0; maximum unit connector/elbow dot product 3.2e-16; maximum connector-midpoint offset 0.0934 sphere radii; changing R or Q independently changed the traced geometry. The default selected-contact rolling ratio is 4, satisfying the historical even gear condition.
- Alternate major 1.60, minor=ball 0.55: reduced rolling ratio 43/11 and minimal common return 11 torus circuits; 1,651/1,651 hits; max perpendicularity residual below 2.8e-16; midpoint offset below 0.094 sphere radii; start-end torus trace seam below 3e-14. This alternate ratio does *not* satisfy even gear per individual torus circuit.

Boundaries: equal-radii contact is nonisolated, so selected-point rolling does not establish global no-slip. The gimbal mount, force law and curvature-to-elbow transfer coefficient are engineering choices still to be derived. Minimum common return applies to this rational-gear / integer-lap configuration, not arbitrary nonperiodic equations; a closed output does not prove equation equivalence.

Sites builder: update the EXISTING /laboratory/whirligig/ route and navigation with the latest file, remove old two-member projector drawings, show both moving contact traces and common-return diagnostics, and verify executable behavior on the published site. Repository publication does not prove live Sites publication.


## 2026-10-17 | R/Q input equation library

**Supersedes the older three-harmonic-demo-only input interface.**

The visitor instrument now includes 14 independently selectable R/Q scalar input adapters: two demonstration profiles; U(1) relative phase, SU(2) and SU(3) group characters; two linearized GR wave polarizations, Schwarzschild circular-orbit coordinate, Schwarzschild lapse radial scan, Kerr equatorial frame-dragging radial scan; ideal QM Rabi contrast, spin-½ precession, coherent-oscillator quadrature and two-state interference contrast. The interface presents **10 comparison presets**, independent R and Q selectors, the mathematical expression being sampled, its meaning and its scope restrictions, and a scalar RMS-profile comparison that explicitly disclaims any equation-isomorphism inference.

See [EQUATION_LIBRARY.md](EQUATION_LIBRARY.md) for precise formulas, chosen units/parameters, epistemic restrictions, and the executed test matrix. The labels denote **chosen representatives**, not arbitrary numerical solutions of Yang–Mills/Einstein/Schrödinger systems. The Whirligig sphere/torus, common-clock rolling, sliding crossbar, and one-elbow tracer should remain unchanged when changing the inputs.

Source committed to HsH in `0cf005a95051ce046be71a04f01c60a3a166ad1e`. Confirmed via independent GitHub readback. JavaScript numerical checks executed for every choice on R and Q, and for all ten pair presets, checking hemisphere signs, elbow/bar orthogonality and torus intersections. Live browser QA and live ChatGPT Sites publication remain **not verified**.

**Sites builder instruction:** Replace the live application at the EXISTING `/laboratory/whirligig/` route, keeping the homepage links and editorial design. Expose the R/Q selectors and scope descriptions and preserve functional SVG export. Do not mistake the updated GitHub document for an actual Sites deployment. After loading the served HTML, verify default selection, a gauge/GR cross-sector pair, a QM pair, manual equation choice, swap, R/Q display gains, Q phase, and mobile controls. Report the confirmed Sites URL/version and exact failures.


## 2026-10-17 | Mechanical correction: bar sweep first, curve intersections second

**Nathan Direct, superseding the earlier synchronized-arc-length endpoint adapter:** Advancing two selected curve parameters and connecting their positions is not sufficient. This visually and kinematically locks the bar to a prescribed pair of curve points. Instead, the rotating crossbar/sweep-bearing motion must establish the shared scanning constraint, and the two curve contacts must be found **as intersections** of that constraint with R and Q. These two contacts slide along their separate E/W input curves on the moving sphere; their positions and curvature response define the moving bar and its perpendicular **single gimbal elbow**, which alone traces Curvy Lisa on the torus.

**Updated browser code:** commit `635f12b0e80117acd47072064a55d4e60404cea7`. The algorithm now:

1. Builds full closed E/W body-sphere curve geometries for R and Q.
2. Advances **one sweep plane** through a prescribed whole-number angular cycle, locked to the master physical rolling parameter `psi` and the previously established minimum common return.
3. Solves each loop's crossing with its own corresponding meridian of that plane by **bracketed bisection on the loop's monotone azimuth coordinate**; the two loop-local position parameters `tR` and `tQ` are **computed outputs**, and can differ.
4. Calculates the variable-length crossbar from those solved contacts, then a perpendicular elbow direction at its midpoint with input-curve signed-turning modulation.
5. Intersects the same elbow ray with the torus wall. It does **not** append a separate pen or prescribe a pair of input contact indices.
6. Renders the complete source loops as subdued tracks and the already traversed portions as distinct bright R/Q track segments, demonstrating follower motion in the ball's own coordinates. Readout shows the current sweep parameter and the separately solved local R/Q parameters.

The explicit scalar-to-sphere *azimuth adapter* uses a small bounded periodic phase warp plus a weak equation-dependent term. This is an admitted **representation choice**, not a source-derived physical contact law. The moving meridian-plane sweep is an **engineering reconstruction** of the bar follower, not yet a demonstrated full mechanical roller/cam/linkage solution. No bearing-force equations, physical minimization law or proven GR/QM/gauge isomorphism is asserted.

**Executed tests, in a stubbed JavaScript DOM/canvas, not a real browser:**

- 8 configurations (harmonic default; U(1)/SU(2), SU(2)/SU(3), GR waves, GR metric examples, QM, and GR/QM/SU(3) cross-sector examples), each with 1,651 samples: 100% torus-wall intersections, zero east/west violations, maximum normalized connector/elbow perpendicularity error below `4.2e-16`, maximum meridional-sweep intersection residual below `2e-12`.
- Both contacts advance through all 1,650 successive discrete intervals; their computed input-local curve parameters differ during the cycle, demonstrating separate solved intersections rather than copied fixed point samples.
- Maximum crossbar-midpoint offset among tested cases below 0.104 sphere radii. Composite response to changing the Q equation is nonzero. Endpoint seam discrepancy around `6e-16` to `1.6e-15` in test coordinate units.
- The historical equal sphere/tube diameter is preserved; only the **selected-point** rolling condition is modeled due to the nonisolated contact set at equal radii.

**Site action:** Replace the current implementation at the existing `/laboratory/whirligig/` route with the latest GitHub `index.html`. Keep the 14-equation selection library and existing links. Verify in a live browser that a visibly advancing colored path appears **on the sphere** behind each sliding follower while the bar sweeps, without a second projector. Confirm the new readout exposes distinct `R` and `Q` loop-local contact parameters. Report the deployed Sites version and live URL only after successful readback; no live deployment is established by this GitHub commit.


## 2026-10-17 | Visible-motion and playback repair

Nathan reported that the laboratory appeared not to be doing anything after the new sweep-plane contact algorithm. The actual repository script was fetched and its animation callback executed repeatedly in a stubbed JavaScript canvas/DOM. Before this patch it already advanced the sweep and the independently solved input-local R/Q contact parameters, but movement in the torus-wide camera was relatively hard to discern and animation status was not clear. **The live Sites page could not be accessed with available browsing tools, so whether that deployment was stale or blocked remains unresolved.**

The browser code was updated in commit `9125ad38fc1194f724c68065aff5516077c3a848`:

- Added a prominent fixed **sphere BODY-frame close-up**, with both complete stationary R/Q tracks and independently moving selected contacts; the moving telescoping crossbar and its perpendicular elbow direction are drawn there separately from the torus-wide view.
- Added high-contrast contact markers and per-frame R and Q curve parameter readouts, plus live sweep angle.
- Added explicit play/pause/scrub status and a playback speed control (0.25×–4×, default 1.5×).
- The browser output continues to use a **single** gimbal elbow ray for the torus-wall intersection, preserving the R/Q input selectors and their declared representations. The close-up elbow arm length is **schematic**: the torus-reaching actual ray is shown in the whole-mechanism view.
- Geometry and rolling constraints were not changed in this patch.

**Executed checks:** After a GitHub fresh-file read, the modified script passed JavaScript syntax and ran in a stubbed DOM/canvas. Across 20 requestAnimationFrame callbacks, both R and Q input-local curve positions advanced, readouts changed, and canvases drew. After pause, the phase did not advance. Scrubbing to 0.5 set the correct phase and the speed control displayed its chosen value. These are **not** full browser visual or deployed-site checks.

**Builder handoff:** Load the updated HsH file at the **existing** `/laboratory/whirligig/` website route; confirm the new fixed-body close-up, live readout and speed control appear. If absent, the website is still serving an older build. Test real browser animation, drag camera, pause, scrubbing and mobile frame rate before marking published. Report served asset revision and verified URL; do not infer Sites deployment from GitHub publication.
