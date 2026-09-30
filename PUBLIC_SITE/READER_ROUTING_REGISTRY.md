# Glass Sausage Factory — Reader Routing Registry

**Status:** CURRENT / backend routing authority
**Date:** 2026-09-30
**Scope:** Sites document selection and presentation routing. This is not theory authority.

## Default-deny rule

A repository object is **not** a public reading document merely because the repository API can fetch it.

The ordinary reader MUST resolve a path through this registry/presentation metadata before display. Unknown or machine/control paths return **PRESENTATION PENDING** (or remain absent from ordinary browse); they never fall back to escaped/raw text.

## Never ordinary reader content

Block these from default reader/document routes:

- `PUBLIC_SITE/live_influx/**`
- `PUBLIC_SITE/runtime/**`
- `PUBLIC_SITE/build_suggestions/**`
- `PUBLIC_SITE/*_FEED.json`, `PUBLIC_SITE/CURRENT_WORK.json`, `PUBLIC_SITE/ASSET_MANIFEST.json`
- `.github/**`, workflow files, scripts, manifests, machine JSON, logs and control-state files
- `WORKSPACES/**` unless an explicit presentation derivative nominates a particular artifact
- archive AI/control machinery, dashboards, index snapshots and administrative logs
- raw conversation exports

A URL manually constructed to one of these paths MUST NOT bypass this rule.

## Presentation priority

For eligible documents:

1. curated/presented PDF derivative;
2. curated RevTeX source compiled to PDF;
3. existing historical/source PDF when it is itself the intended reading object;
4. PRESENTATION PENDING.

Markdown, TeX, JSON and plain text are source/input formats, not default public rendering formats.

Every generated presentation PDF should begin with a short audience-calibrated plain-English preface and preserve source identity/status. Technical orientation should point to the highest-value equations, calculations, findings, assumptions, tests and source records.

## Known route correction

Backend packet:
`PUBLIC_SITE/live_influx/packets/2026-09-28__CALIPER__sat-analogue-to-calibration-howto.json`

Human source:
`LIBRARY/presented/sat-analogue-to-calibration-howto.md`

RevTeX source:
`LIBRARY/presented/SAT_HowTo_AnalogueToCalibration.tex`

Required public target:
compiled presentation PDF from the RevTeX/presented source.

The packet itself is machine/editorial intake and must never be the Reading Library target.

## Historical SAT boundary

`SAT_THEORY_ARCHIVE_2023-25` is heterogeneous historical evidence, not a ready-made site library. Prefer deliberately selected historical PDFs and curated presentation derivatives. Do not expose archive-control machinery, AI workspaces, logs, JSON index snapshots, dashboard internals, or raw text simply because they are browseable in GitHub.

Historical SAT remains labeled historical SAT; later H(s)H material found in that repository is not silently reclassified.

## Live updating

Repository refresh may update discovery state immediately, but publication state is gated:

`DISCOVERED -> PRESENTATION PENDING -> PRESENTED`

A source update invalidates a stale derivative when source identity/hash changes. Until rebuilt, serve the last explicitly valid derivative with snapshot/status metadata or PRESENTATION PENDING; never serve raw source as fallback.

## Raw/source affordance

Raw source may exist behind a deliberate secondary operator/research-source action. It must not be the default click target from public cards, browse results, search results, paper pages, Current Work, or Reading Library.
