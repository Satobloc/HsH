# 30 SEP 2026 — Sausage Factory Backend Presentation Audit

**Scope:** HsH Workspaces/Common, current HsH public-site backend, and bounded SAT_THEORY_ARCHIVE_2023-25 structure review.

## Confirmed defects / risks

1. The live generic reader can be manually routed to machine JSON such as the CALIPER live-influx packet. This violates the current Presentation Gate.
2. Reviewed-paper presentation has an already-documented shared defect: Markdown and TeX manuscript sources have been exposed as raw/unformatted markup through the `sandbox_manuscript` route.
3. The archive/repository universe is heterogeneous enough that extension-based or generic repository browsing cannot safely define a public Reading Library.
4. Newly uploaded images are mixed provenance: exact/script-drawn figures, solver-run plots, provenance scans, metrics screenshots, generated illustrations, duplicates and unclassified images. Direct auto-gallery admission is unsafe.

## Backend correction

Use `PUBLIC_SITE/READER_ROUTING_REGISTRY.md` as the default-deny route contract together with `PRESENTATION_GATE.md`.

Public document route:
`source -> plain-English audience preface -> RevTeX -> PDF acceptance -> public viewer`.

No derivative:
`PRESENTATION PENDING`, never raw fallback.

## Navigability

Public browse/search should organize *presented objects*, not repository serialization. Repository location remains provenance metadata.

Recommended primary facets:
- Start Here / orientation
- Current H(s)H
- Historical SAT
- Papers
- Methods / calculations
- Geometry / solvers
- Visual atlas
- Podcast / talks
- Archive / provenance
- Glossary

A technical reader can drill to source provenance from any presented object without making source markup the public reading experience.

## Live-update contract

Discovery may be live. Presentation is versioned/gated.

Each public object should expose:
- presentation state;
- source repo/path + source identity/hash;
- derivative identity/hash/build timestamp;
- theory/history/status label;
- last successful refresh.

Do not leave indefinite Loading states. Use LIVE, CACHED, PRESENTATION PENDING, OFFLINE, or SOURCE ONLY.

## Existing controls to preserve

- `PUBLIC_SITE/PRESENTATION_GATE.md`
- `WORKSPACES/COMMON/READER_STATE_COMPOSITION_STANDARD.md`
- paper-rendering defect handoff under `PUBLIC_SITE/build_suggestions/`
- current source-linked feeds and packet machinery as backend/editorial inputs, not reading documents.

## Images

New visual intake now has a dedicated pointer-based staging surface:
`PUBLIC_SITE/assets/STAGING/README.md`.

This avoids copying archive binaries while preventing fresh uploads from silently entering galleries.
