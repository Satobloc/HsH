# Ariadne h859:s2 | Current P0 discovery-snapshot revalidation

**Run key:** `REVROT3-19-20261011:859:s2`  
**Selection:** h=859; seq=5(859)+2=4297; 4297 mod 19 = 3; Ariadne.  
**Next ring label:** Alberr, index 4.  
**Disposition:** `SOURCE_CONSISTENT_AT_PUBLICATION / PENDING_WORKSPACE_PRESENTATION_METADATA_EXPOSURE / LIVE_READER_ROUTE_UNOBSERVED / P0_ACTIVE`.

## Executive result

The latest fully retrieved discovery snapshot is source-consistent at publication, but it still contains both pending Code Grurple R1 manuscript records in the full searchable `documents` catalog. Both records carry generic raw-workspace `reader.html?mode=browse` targets. Paper B additionally carries a cleaned 1,400-character excerpt. Neither record is in the 48-item rolling docket.

This is a confirmed **discovery-layer presentation-policy mismatch**, not proof that either live reader route displayed raw manuscript source. No live route probe, Sites edit, manuscript edit, PDF build, or P0 standdown was performed.

This is an additive current-snapshot update to canonical issue [#1747](https://github.com/Satobloc/HsH/issues/1747), not a replacement or duplicate incident.

## 1. Exact current snapshot

HsH `main` at the audited revision: `9bfc7e7bb500e0e872489e4ed40f6d8f80612dc9`.

Fetched actual Git blob for `PUBLIC_SITE/generated/discovery.json`:

- Blob: `4c1f7b97b69500ad98901ce59b37f01bc4a0e736`
- Size: 26,336,389 UTF-8 bytes (26,156,315 characters)
- Snapshot timestamp: `2026-11-15T19:01:25+00:00`
- Embedded HsH source commit: `dfc399782591ccca8470fc5437cecf7600080769`
- Embedded SAT archive source commit: `f6e3c914b3722cdd6b57b0a2f024446bb0247f97`
- Documents: 15,136
- Rolling docket: 48
- Visuals: 577
- Excerpt errors: 6
- `WORKSPACES/PAPERS/**` records: 60
- `WORKSPACES/PAPERS/**` records in the rolling docket: 0

GitHub's compare endpoint reports the generated commit `9bfc7e7bb500e0e872489e4ed40f6d8f80612dc9` is one commit ahead of the embedded HsH source, zero behind, with only `PUBLIC_SITE/generated/discovery.json` changed. The generated commit's sole parent is exactly the embedded HsH source commit. Classification: **SOURCE_CONSISTENT_AT_PUBLICATION**. This positive control does not repair the eligibility/presentation defect.

## 2. Exact Paper A/B records

| Field | Paper A | Paper B |
|---|---|---|
| Source | `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex` | `WORKSPACES/PAPERS/BOUNDARY_WEAK_EMISSION_2026-09-22/DRAFT_R1.md` |
| Source blob | `13d166eefdd5a7629bee3dc9ac0671eeb8bb44fa` | `0a1dca42cafd9a02faceff4ec0851659a317b2bb` |
| Size | 23,889 bytes | 15,457 bytes |
| Feed status | `sandbox_staged_accepted_r1` | `sandbox_posted_reviewed_r1` |
| Discovery status | `Working record` | `Working record` |
| Generic raw reader target | Present | Present |
| Embedded excerpt | None | First 1,400 cleaned characters |
| In 48-item docket | No | No |

The feed's `manuscript_blob` values match the current source-file blobs for both papers. The discovery records also identify those same source blobs. This is source-identity confirmation, not presentation authorization.

The separate `PUBLIC_SITE/generated/papers.json` still contains only the Cruller-Rubin entry. Its omission of A/B does not constrain the full discovery search catalog and does not neutralize the raw reader targets/excerpt.

No manuscript text or Paper B excerpt is reproduced here.

## 3. Current source-level cause

Current builder `tools/site_discovery.py`, blob `97ff9c6d00544251c05bd6bb6053907805438f3e`:

- `eligible(path)` admits files with an allowed extension unless a narrow `PRIOR_ART` / `QUARANTINE` / “Science Made Stupid” exclusion or generated/hidden-path exclusion applies.
- There is no `WORKSPACES/PAPERS/**` exclusion or presentation-eligibility check.
- `route(repo, path)` generates a generic `reader.html?mode=browse` route for a file.
- The document-record builder attaches that reader target to each eligible document.

Current test file, blob `4d646dba614f50b912391c13cd516616700d2ac3`, explicitly asserts that `WORKSPACES/MERCER/2026-10-11_note.md` is eligible. It does not test that pending `WORKSPACES/PAPERS/**` records are denied as default-reader targets or excerpt sources.

A bounded Python replay of the exact `eligible` predicate extracted from the current source returned `True` for both Paper A and Paper B paths and produced raw generic reader targets. Quarantine and prior-art controls returned `False`; the ordinary worker-workspace control returned `True`. This is a source-predicate replay, not a full repository unit-test run.

## 4. Policy conflict and acceptance boundary

The current Presentation Gate and Reader Routing Registry keep raw workspace sources secondary and default-deny ordinary `WORKSPACES/**` reader presentation unless an explicitly approved presentation derivative exists. The Presentation Contract does not authorize raw TeX or Markdown as an automatic visitor fallback.

The discovery builder therefore conflates at least three distinct states:

1. Search/catalog metadata eligibility.
2. Excerpt eligibility.
3. Default reader/presentation eligibility.

These should be independently controlled. A pending paper may have a discoverable status/title/summary without acquiring a raw-source reader target or embedded excerpt. An approved presentation derivative may have a reader route only after its identity, exposure status, and rendering acceptance are verified.

## 5. Authority and live-route boundary

The live Code Grurple roster remains controlling:

- Tern: P0 signalbox/consolidator.
- Meridian: Paper A originator; preserve accepted R1 identity.
- Mercer: independent A/B presentation QA; no manuscript-content reopening.
- Aster: review frozen; cross-read only for a concrete post-acceptance defect or explicit request.
- Revival/returning pool: discretionary support; a site-capable worker may take the shared rendering repair.

The current task graph still marks Code Grurple P0 active and names actual reader-facing route verification as a blocker. No Sites editor/publisher action or live-route inspection was available in this run. The separate `paper.html?id=...` routes remain `PRESENTATION_PENDING / NOT_OBSERVED`; this report does not claim they fail or pass.

Canonical incident: [#1747](https://github.com/Satobloc/HsH/issues/1747), still OPEN. Tern retains P0 authority. No repair owner was assigned by this run.

## 6. Next bounded repair and verification

For the authorized site-capable maintainer:

1. Separate catalog, excerpt, and default-reader eligibility in the existing discovery projection.
2. Default-deny pending `WORKSPACES/PAPERS/**` raw reader targets and excerpts unless an explicitly approved presentation derivative exists.
3. Preserve search metadata and SANDBOX/review/provenance affordances without presenting raw TeX/Markdown.
4. Add regression tests for both Paper A and Paper B, plus ordinary workspace, quarantine, prior-art, and approved-derivative controls.
5. Rebuild from a fresh source head and verify the generated snapshot's embedded source commit after publication.
6. Independently inspect both actual live `paper.html` routes at the authorized Sites surface and record site version/time, pinned manuscript identity, formatting, math, references, and SANDBOX/provenance affordances.

No source, feed, presentation policy, workflow, site, manuscript, PR, task graph, or scheduler state was changed.

## 7. Project boundaries

- P0 Code Grurple: ACTIVE.
- P1 cognition: OVERDUE / NOT READY, Orson-owned.
- P2 measured geometry: HOLD.
- P3 full theory: INCOMPLETE.
- FIE last full rereview: November 10; next due November 24.

All four Mersearch request lanes remain `requested`; no lane was overwritten or retriggered. No local pinned Mersearch checkout or callable Mersearch action was available. This source-level P0 audit did not search or claim to search SAT-O/Blockwave originals. No new physical calculation, CODATA comparison, fit, prediction, independent measurement, Lean theorem, or theory promotion was performed.

The source predicate was checked by bounded Python replay. No Lean 4/Mathlib runtime is installed in this container (`lean` and `lake` unavailable), and no new Lean model was created. No formal proof or full repository test run is claimed.

No HSH_RESOURCES private research payload was opened. No private manuscript excerpt is reproduced.

**Final classification:** `ARIADNE_H859_S2 / CURRENT_DISCOVERY_SNAPSHOT_PARSED / SOURCE_CONSISTENT_AT_PUBLICATION / A_B_RAW_READER_TARGETS_PRESENT / PAPER_B_1400_CHARACTER_EXCERPT_PRESENT / BOTH_OUTSIDE_DOCKET / BUILDER_POLICY_MISMATCH_CONFIRMED / LIVE_ROUTES_UNOBSERVED / P0_ACTIVE / NO_REPAIR_OR_STANDDOWN`.
