# Visual archaeology — first-run recon

**Status:** CURRENT working recon  
**Launch anchor:** 2026-09-30 19:48 EDT  
**Scope:** image-role archaeology / classification tooling only; no theory promotion

## 1. What the first run actually did

The authoritative v1 report (`derived/latest_report.md`) records **18 images evaluated**, not 13. The earlier conversational summary saying 13 was stale/incorrect and is superseded by the durable report.

Run 1 produced:

- 18 images evaluated;
- 0 explicit validation updates;
- 0 bounded pseudo-correlation signals;
- 0 prior-run guess changes (there was no prior state);
- 0 stable repeated guesses;
- one uncertain-margin case;
- six square/technical adversarial cases;
- zero metadata-positive podcast cases.

The dominant result was `technical_figure`, including both finite-core Matplotlib images at p≈0.881 and the NotebookLM mind map at p≈0.786. The Sep-28 generated worldtube/notebook derivative sat near the decision boundary (technical-figure p≈0.475), which exposed a missing conceptual-illustration branch rather than supplying evidence that the image is technical.

**Interpretation:** the first pass executed correctly but could not learn empirical thumbnail accuracy because its cohort contained no explicit positive podcast/style controls. Its useful result was diagnostic: “square” alone is weak and technical metadata successfully creates an adversarial negative set.

## 2. Source controls added after recon

Nathan supplied a closed, source-identified stylesheet family:

- `SAT_VISUALS/STYLEsheets/IMG_8875.jpeg`
- `SAT_VISUALS/STYLEsheets/IMG_8877.jpeg`
- `SAT_VISUALS/STYLEsheets/IMG_8878.jpeg`
- `SAT_VISUALS/STYLEsheets/IMG_8883.jpeg`
- `SAT_VISUALS/STYLEsheets/Image.jpeg`

These are now explicit `podcast_stylesheet` validation controls, `never_display`, and may be used for palette/layout/style-history statistics. Exact copies elsewhere inherit the role only after source/hash identity is established.

The v2 corrected run evaluates **26 images** and identifies all five stylesheets as `podcast_stylesheet` at p≈0.999 with three independent evidence families and `NO_DISPLAY`. Ten positive validation updates occur per corrected run (two matched positive stylesheet rules × five source controls). Negative-weight rule validation now uses signed semantics; legacy negative-rule reliability was reset once before the corrected run.

## 3. New image roles

### Unused background / general flavor candidate

`DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/ChatGPT Image Sep 12, 2026, 08_46_02 AM.png`

Nathan-direct role: potential unused podcast-thumbnail background and reusable conceptual/site flavor graphic. Current v2 best guess is `general_flavor_graphic` at p≈0.731. Resource gate: `STAGING_CANDIDATE`, not automatic publication.

### Klein-fabric wrapping candidates

- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/ChatGPT Image Sep 27, 2026, 08_59_15 PM.png`
- `DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/ChatGPT Image Sep 27, 2026, 09_07_50 PM.png`

Nathan-direct role: tentative Klein-fabric cosmological wrapping/calculation illustrations; first-guess wrapping-angle / universal viability-productivity-consistency-complexity exploration. Current v2 best guess for both is `cosmology_concept` (p≈0.74 / 0.73). They remain theory candidates, not metrological confirmation. Their website-resource gate is currently `REVIEW_HOLD` because the deliberately conservative palette-risk proxy flags them as photograph-like; this does **not** alter their theory/archive classification.

## 4. Resource admission backstop

The classifier may propose a website-resource staging candidate but does not publish anything.

Current guard:

1. source says `never_display` → `NO_DISPLAY`;
2. skin-tone-like pixel fraction ≥ 5% → review hold unless a source label explicitly establishes a notebook-photo exception;
3. strong photographic-palette risk → review hold unless the notebook-photo exception applies;
4. otherwise a Nathan-designated resource candidate may enter `STAGING_CANDIDATE`;
5. `AUTO_CANDIDATE` additionally requires high role confidence, multiple independent evidence families, and cross-run stability.

“Skin-tone-like” is only a conservative color-risk proxy. It does not assert that a human is present.

## 5. Screenshot / stylesheet hypothesis branches

Working rules now distinguish:

- source-identified podcast stylesheet;
- ordinary Spotify screenshot;
- Spotify Creators episode-list screenshot;
- actual podcast thumbnail;
- SAT-era thumbnail palette lineage;
- H(s)H-era near-monochrome thumbnail lineage;
- unused thumbnail background/general flavor graphic.

The text lane consumes existing sidecar text or explicit manifest text evidence when available. It does **not** add a heavyweight OCR dependency. Candidate screenshot evidence includes dark/gray UI + podcast terms + Spotify-green occupancy, or light UI + episode-list text + left-third banding + Creators-like purple. These remain testable hypotheses until source-validated screenshot examples are added.

## 6. Scheduling correction

The ChatGPT hourly automation was disabled. The classifier itself is repo-local:

- GitHub Actions hard-coded hourly at `:48`;
- immediate rerun on relevant image-source or visual-classifier/config changes;
- derived-state commits are excluded from trigger paths, preventing a self-trigger loop.

This makes the Python recurrence part of repository infrastructure rather than a conversational recurring task.

## 7. Preliminary Klein provenance check — do not infer influence yet

Repository search finds multiple internal `Klein fabric` records in the historical SAT archive. In particular, `SAT PRE-H(s)H TIGHTENING.txt` contains Nathan's explicit question: “How does one turn a Klein bottle into a pervasive ‘Klein fabric’ made entirely of wormholes with Möbius connections”. The file itself was first added to the public archive on 2026-09-04, which is an **upload bound**, not the date the underlying conversation occurred.

The archive also contains later provenance/convergence text:

- `SAT TIMESTAMPS.txt` records a **2026-05-11** convergence entry for non-orientable/Klein topology and names Janna Levin;
- `PARADIGM FOR & AGAINST CONVO.txt` states that on **2026-05-11** Janna Levin discussed hidden-dimension geometry with Brian Greene;
- other archive text asserts a Levin/Greene co-authored work titled *Klein Bottle Cosmology*.

Those last attribution/publication claims are **not externally verified here**. Current HSH_RESOURCES code search does not return a Levin/Klein match, and live web search is unavailable in this session. Therefore no priority/influence/convergence conclusion should be drawn from them yet. Required follow-up is: identify the actual cited paper/broadcast, verify authors/title/publication or broadcast date from an external primary source, then compare that timestamp to the earliest dated internal Nathan-origin Klein-fabric occurrence—not merely the later repository upload date.

## 8. Current readout

The experiment has moved from an unvalidated 18-image heuristic pass to a 26-image loop with its first source-validated family. The immediate useful test is whether additional known Spotify/Creators screenshots and known episode thumbnails cause rule reliability to separate the classes rather than merely making the existing guesses more stable.
