# Ravel — Current State

**Updated:** 2026-09-16 EDT  
**Owner:** Ravel  
**Status:** ACTIVE — PROJECT-WIDE SANDBOX RECONSTRUCTION PERMISSION

## Current focus

Nathan clarified on 2026-09-16 that the September 12 standdown remains in force **outside sandbox theory work**, but the sandbox release is **project-wide for all workers**, not Ravel-specific.

All workers are instructed/authorized to continue **full SAT / H(s)H reconstruction inside sandbox scope**.

Operational consequence:

- all workers may perform substantive SAT/H(s)H reconstruction, translation, comparison, derivation, solver recovery, finite-core/worldtube construction, and related theory work inside their authorized sandbox/workspace surfaces;
- this is not merely permission for isolated speculative calculations: the standing sandbox task is full SAT / H(s)H reconstruction;
- sandbox results do **not** automatically propagate into BEDROCK, STATE OF THE THEORY, prediction promotion, paper development, or other promoted/non-sandbox theory surfaces;
- promotion or propagation outside sandbox still requires the appropriate separate release/review/Nathan-direct status change;
- the project-wide standdown therefore constrains **promotion and non-sandbox forward theory**, not the sandbox reconstruction programme itself.

Ravel's role inside that all-worker programme remains head co-theorist/live-theory reconstruction and integration.

Immediate Ravel working programme:

1. preserve Nathan-direct current model status: Kerr/Kelvin live H(s)H hypotheses; Whirligig/Donut, Hagalaz, UI/TX, and Three Spheres live SAT geometric-solver machinery;
2. continue full SAT/H(s)H reconstruction in bounded sandbox passes, with special attention to finite-core/worldtube construction, Kerr/ER, persistent winding/coil, timesheet intersection/readout, Kelvin-like response, and SAT→H(s)H translation;
3. test candidate mechanics against standard geometry/measurement without treating successful sandbox work as promoted theory;
4. keep direct construction and reconstruction products in sandbox unless separately authorized for propagation;
5. maintain continuity/provenance notes when the reconstruction materially changes.

## Acquisition / archive conclusions — 2026-09-16

Nathan notes that the existing conversation library is already mixed-format: some full native conversation JSON exports and some plain-text outputs. Do not make format homogeneity a prerequisite for ingestion or indexing.

Working handling rule:

- preserve whatever original was actually captured as the source artifact;
- where a native ChatGPT conversation JSON exists, prefer it as the richest canonical capture because it preserves the conversation graph, timestamps, `current_node`, alternate branches, metadata, and tool/internal nodes;
- derive readable/searchable transcript text from the active `current_node -> parent` branch, using visible user/assistant prose rather than naively sorting every node by timestamp;
- where only plain text exists, retain it as a legitimate historical source rather than treating it as defective or waiting for a JSON replacement;
- record format/provenance/coverage explicitly so later tooling can distinguish `native raw JSON`, `rendered/plain text`, and derived normalization;
- the library may therefore remain heterogeneous while the semantic/source graph supplies a common access layer.

`WORKSPACES/COMMON/ACQUISITION_PIPELINE/chatgpt_export_picker.py` was updated against the supplied native Ravel raw fixture so that active-branch derivatives do not mingle abandoned branches, tool calls, or reasoning machinery into an ordinary readable transcript. Raw JSON remains preserved unchanged.

NotebookLM conclusion remains: MHTML is useful as a DOM-state capture but is not a guaranteed complete chat export; the browser harvester must walk virtualized history and accumulate turns outside the live DOM.

No further acquisition buildout is the default Ravel priority unless Nathan reassigns it or theory work exposes a concrete archival dependency.

## Current theory front

Current continuity packet identifies the live construction grammar as:

`ER/Kerr minimum geometry -> persistent winding/coil -> braid`, coupled to timesheet distortion/readout and Kelvin-like medium response.

The highest-value immediate questions are not “what extra entity can solve this?” but:

- what geometric structure standard Kerr/ER actually supplies in the over-extreme particle-like regime;
- which transverse scale, if any, is a genuine finite core rather than a coordinate surface or interpretive shell;
- how a persistent coil made from that core intersects a timesheet, and what quantities are forced purely by that geometry;
- whether the paired filament-side / timesheet-side deformation admits a clean conserved mode without adding an independent field;
- whether independent observables can triangulate coil/core scale before charge or mass laws are fitted.

Keep charge, mass, exclusion, Kelvin reach, and any EM/gravity weighting as live construction targets rather than assumed consequences.

## Repo checkpoints observed during prior state update

- HsH: `097f816b2a4c8b030237fd702969b690b4456cd9` before initial Ravel workspace commits; stale now, so re-fetch head before delta calculations.
- HSH_RESOURCES: `9b7e169fff25bcf7cc948e8453aeaed8bbe38b7a`
- SAT_THEORY_ARCHIVE_2023-25: `d53b5fe72699deacf0b9e91c9c5f214136d90a24`

## Ravel workspace commits

- `773d28802fe572b6cf2d46290b1df65489693c27` — create Ravel workspace README.
- `981920e46fed02c61570990cf055c0b630fb2637` — add continuity/restart packet.
- later commits — acquisition conclusions, theory pivot, Kerr/worldtube sandbox passes, and sandbox reconstruction permission clarifications.

## Next restart action

Read `CONTINUITY.md`, then inspect repo changes newer than the recorded checkpoints. Do not assume this file is current merely because it is named `STATE.md`. Sandbox reconstruction is active project-wide; before propagating any sandbox result outside sandbox, re-check the project-wide standdown and obtain the required release/promotion authority.
