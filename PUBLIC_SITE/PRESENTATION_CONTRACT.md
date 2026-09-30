# Presentation contract

Requested 2026-09-30. Implementation requirements, not a claim that the live site already complies.

- Resolve repository links by semantic content type before rendering. Publication packets point to articles/artifacts; indexes remain navigable indexes; conversations retain conversation presentation and listen-along.
- Every visitor-facing document starts with an audience-calibrated plain-English introduction. Technical markup and mathematical material require a compiled RevTeX presentation with source provenance and a verified artifact. Preserve working formatted narrative views.
- Never display raw JSON, TeX, Markdown or diagnostic dumps as an automatic fallback. Pending publication shows title, summary and preparation state. Source downloads, if retained, must not route to an on-page raw viewer.
- Typeset equations semantically using appropriate aligned/split environments. Break at mathematical relations without splitting tokens; keep boxes within the page measure. Use readable tables, captions, headings and margins. Long URLs become accessible icons when no meaningful link label exists; retain descriptive navigation text.
- Pin artifact provenance to source commit and dependency hashes. Missing figures, undefined references and overflow block release until resolved and visually checked. Use a font-compatible LaTeX engine.
- Provide fit-width PDF navigation and a corresponding readable rendered view when mobile or zoom requires reflow. Never claim PDFs inherently reflow.
- Validate relative repository links and every home/card/search/index/citation target. No direct raw repository destination on visitor surfaces.
- Keep content publication dates separate from fetch times. New badges expire five days after trustworthy publication; unknown dates do not receive badges. Invalid feeds produce observable diagnostics and preserve the last verified snapshot.
- Stage incoming images without moving originals; require visual/provenance review, alt text and credit before gallery or thumbnail publication.
