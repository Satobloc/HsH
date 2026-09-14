# Mercer — Prototype Tri(or Quin)ary Mover Trial Checkpoint

**Status:** ACTIVE recurring trial worker  
**Enrollment:** direct Nathan invitation/authorization, 2026-09-13 11:33 EDT  
**Role:** index/retrieval QA + Nathan Direct methodology/source reconstruction + documentation/navigation reconciliation  
**Workspace:** `WORKSPACES/MERCER/`

## Role boundary

Mercer owns the reliability layer between raw/tagged material and project navigation/retrieval: index quality, source-path/catalog reconciliation, retrieval selectivity, durable documentation conventions, direct-source methodology mapping, and bounded source-integrity QA. This complements rather than duplicates Morrow's conversation-family identity/continuity/context recovery and the active Nathan-words extraction/tagging lane.

## Startup rule

Every run: read `WORKSPACES/COMMON/AUTOMATION_WORKFLOW_CONTROL.md`, current Common coordination surfaces, newer Nathan directives, ownership/duplication state, then take the highest-value eligible nonduplicative operation.

## Epistemic boundaries

Keep distinct: Nathan-authored direct material; Nathan's present recollection/testimony; archive-corroborated history; established/tentative SAT/H(s)H status supported by controlling sources; historical/displaced material; assistant interpretation; Mercer reconstruction; Workshop/Clearinghouse speculation. Do not promote worker consensus, recollection, quarantined material, repository upload identity, catalog proximity, thematic similarity, clean formatting, directory adjacency, or generated interpretation into content authority without provenance.

## Current controlling state

- Project-wide theory-bearing standdown remains active.
- Mercer individual training is complete.
- Bounded archive/navigation/source-integrity/provenance maintenance is permitted when handed off or directly within lane.
- No current issue genuinely requires Nathan attention.

## Current frontier — after Run 25

### A. Historical glossary / standard-crosswalk provenance

**Status:** source inventory + repository-custody layer complete; raw-message/content ancestry unresolved. Viewer catalog candidate triage and intrinsic glossary fingerprinting both reached bounded stopping points without a defensible direct ancestry anchor.

Durable sources:

- `WORKSPACES/MERCER/GLOSSARY_CROSSWALK_SOURCE_INVENTORY_2026-09-14.md`
- `WORKSPACES/MERCER/GLOSSARY_INTRINSIC_PROVENANCE_FINGERPRINT_2026-09-14.md`

Verified source classes remain:

1. `SAT_THEORY_ARCHIVE_2023-25/README.md` — Nathan-authored editorial/front-door source.
2. `2026/Early SAT/GLOSSARY (LIVE).txt` — historical theory-bearing glossary candidate; content authorship/currentness unresolved.
3. `2023-24 FRAMEWORK DEVELOPMENT/SATv  TO STANDARD MAP.txt` — historical standard-crosswalk candidate; content authorship/currentness unresolved.
4. `10-31-2025 SAT FULL THEORY/10-20-25 definitions.txt` — visible AI/Notebook-mediated compilation layer; not Nathan Direct by default.

Repository custody remains distinct from content authorship:

- glossary first seen in bulk upload `f25c2b8a63eca815cce863bbe859f104983fedd5` (2026-06-01);
- standard map first seen in bulk upload `bd1b2a6d25d8133c21a1901777ebdc137dc925e5` (2025-10-29).

Run 16 exhausted the available GitHub indexed phrase-search route for exact/distinctive standard-map phrases. Do not repeat unless searchable corpus/index changes.

Run 17 verified bounded raw-message recovery infrastructure:

- `.github/workflows/extract-raw-window.yml`
- `WORKSPACES/COMMON/scripts/extract_raw_window.py`
- `WORKSPACES/COMMON/extraction_requests/*.json`
- outputs under `WORKSPACES/COMMON/extraction_outputs/`

Viewer catalog candidate-selection bridge is **`CONVERSATION_VIEWER/data/conversations.json`**. Earlier Mercer references to `CONVERSATION_VIEWER/catalog/conversations.json` are stale and should not be reused. Catalog proximity is retrieval metadata only, not authorship evidence.

Bounded candidate results through Run 21:

- `SAT theory overview`, catalog ID `fa2cc1b6a832`, 2025-10-29, 10 messages — no direct ancestry signal.
- `Vetting document review`, raw conversation ID `69023bdb-63f0-832b-8821-56362ed2493c`, 2025-10-29 — journal-submission vetting; no direct ancestry signal.
- `SAT Theory Archive Review`, raw conversation ID `6a1df035-25d4-83ea-943d-e0db20433533`, 2026-06-01 — archive-review context; no glossary match.
- `SATO-BLOC FULL LEANCHECK`, raw conversation ID `6902429e-f6b8-8326-b681-3e74e3119378`, 2025-10-29 — same-day SAT-to-standard mapping context but no direct target identifiers/distinctive phrases.
- `Assignment queue creation`, Viewer ID `6ecbc7ec20e7`, raw conversation ID `68c0c03c-ffc4-8331-8b66-49d0993c5830` — generic `Glossary` assignment-template false positives only.
- `SATNet and Neural Networks`, Viewer ID `3c14bc5a00c7`, raw conversation ID `6a1df069-b5e0-83ea-943d-e0db20433533`, 2026-06-01 start — no glossary signal.

Run 22 intrinsic fingerprint of `GLOSSARY (LIVE).txt` found a prepared standalone LaTeX fragment with no author/date/source IDs/citations/speaker labels/UI residue or other discriminating origin metadata. Neighboring files and the June-1 upload cohort are heterogeneous. Close speculative ancestry expansion unless a stronger anchor appears: exact artifact paste, explicit generation instruction, matching distinctive body text in raw conversation, original file metadata, or another independently attributable source relation.

Retrieval-selectivity rules retained:

1. for artifact ancestry ranking, prefer exact/near `start_local` date match;
2. then archive/document/glossary/definition title signal;
3. then small bounded message count;
4. only then end-date proximity;
5. GitHub code-search misses are retrieval negatives only;
6. do not infer repository emptiness from one empty connector response when another direct repository route returns populated content.

### B. Viewer/catalog path and generated state

**Status:** Viewer publication repair green; canonical navigation workflow reconciled; tracked owner run terminal/cancelled; durable QA restart guidance now reconciled to terminal state.

Established repair chain remains in `WORKSPACES/MERCER/VIEWER_PATH_QA_2026-09-13.md`.

Current Viewer catalog path is `CONVERSATION_VIEWER/data/conversations.json`; its last observed `source_state_at_utc` is `2026-09-13T12:30:33.868040+00:00`, with 374 conversations (365 development / 9 live). Development input still points to manifest generated `2026-09-13T12:30:33.434526+00:00`.

Canonical `Maintain H(s)H navigation` run `34814002515` is cancelled and must not be polled again. Revisit only when a newer successful canonical run or landed manifest regeneration appears. Until then stale generated state remains an owner-execution/generation-lag dependency, not a demonstrated generator defect.

Run 23 searched the indexed repository for both `CONVERSATION_VIEWER/catalog/conversations.json` and `catalog/conversations`; neither returned a match. Because search coverage can lag, this is not absence evidence, but there is no basis for speculative bulk editing. Mercer front-door documents now explicitly route to `CONVERSATION_VIEWER/data/conversations.json` and warn against the superseded route.

Run 24 inspected the durable Viewer QA record and found stale restart wording that still told a future run to keep checking the same owner dependency. `WORKSPACES/MERCER/VIEWER_PATH_QA_2026-09-13.md` now explicitly records run `34814002515` as terminal cancelled, forbids repeat polling, and gates reopening on genuinely new owner evidence. Commit: `9c0b70715878b3adeadf8deef0afbfae9aed283b`.

### C. Mercer documentation/navigation reconciliation

Run 23 brought the two Mercer front-door documents into alignment with the current trial:

- `WORKSPACES/MERCER/README.md` now states the active role, startup surfaces, role separation, standdown/provenance boundaries, durable Mercer records, and verified Viewer catalog path.
- `WORKSPACES/MERCER/CONTINUITY.md` now defers to this checkpoint, removes obsolete autotag/SATity-audit restart instructions, and preserves current retrieval/provenance rules and blockers.
- `WORKSPACES/MERCER/RUN_023_2026-09-14.md` records exact coverage and edits.

Run 24 extended that reconciliation into `VIEWER_PATH_QA_2026-09-13.md`; `WORKSPACES/MERCER/RUN_024_2026-09-14.md` records exact source coverage and changes. No Common handoff was warranted because this was internal Mercer documentation drift with no new cross-lane dependency.

Run 25 extended the same bounded reconciliation into `WORKSPACES/MERCER/NATHAN_LIVE_THEORY_DEVELOPMENT_LOG.md`. The durable phrase `current Mercer live conversation` was ambiguous once detached from its capture moment. Entries now identify the **Mercer live conversation captured on 2026-09-13** while retaining `PENDING RAW-ID BACKFILL` until an attributable export/provenance surface supplies exact conversation/message IDs. All quoted Nathan wording was preserved verbatim; no historical claim was promoted. Final corrective commit: `a9580ffbfda0236bd5cd379c4200a43ca98b2b98`. `WORKSPACES/MERCER/RUN_025_2026-09-14.md` records the exact coverage and change.

### D. Durable documentation convention

Established in Run 13: `WORKSPACES/COMMON/DURABLE_PROJECT_DOCUMENTATION_CONVENTION.md`, linked/routed through Common.

### E. `MORROW-SOURCE-001`

**Code-side resolved / output-side pending.** Superset comparator/payload policy/regression case/tests are fixed. No committed historical candidate-report path has been identified; any pre-patch external/manual report remains stale until its owning path is found. Preserve the earlier Janus export.

## Other queued Mercer work

- bounded retrieval/index-integrity QA with measurable repository evidence;
- layered-autotag selectivity validation after standdown release;
- source-grounded methodology reconstruction from verified Nathan-authored material;
- raw UUID/timestamp backfill for live Nathan testimony when exports land;
- historical/manual scanner candidate-report owner/path recovery if a source surface emerges.

## Dependencies / blockers

- `DEPENDENCY / AMBIGUOUS_PROVENANCE`: direct raw-message ancestry for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt` remains unidentified; current search/fingerprint routes are exhausted pending a stronger source anchor.
- `DEPENDENCY`: repository first-seen dates are bulk-upload custody dates and may substantially postdate artifact creation.
- `DEPENDENCY`: canonical navigation run `34814002515` finished cancelled; a newer successful owner regeneration is still needed to close generated-state freshness.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `DEPENDENCY`: exact raw conversation/message IDs for the 2026-09-13 Mercer live-source statements await an attributable export/provenance surface.
- No current issue genuinely requires Nathan attention.

## Run history

- Runs 1–4: training, shared live-development testimony surface, integrity/discoverability check, initial superset-scanner defect isolation/patch.
- Runs 5–7: scanner invocation/report tracing, regression spot-checks, committed regression tests, logic revalidation.
- Runs 8–12: Viewer LIVE-path drift diagnosis and repair; publication race hardening; canonical owner tracing; privacy-deletion timing reconstruction; canonical navigation workflow reconciliation; bounded owner-state verification.
- Run 13: established repo-wide durable documentation convention and Common routing.
- Runs 14–17: source-first glossary/crosswalk inventory, custody provenance, indexed phrase testing, and bounded raw-extraction route verification.
- Runs 18–21: Viewer-catalog candidate selection, bounded candidate eliminations, path correction, generic-glossary false-positive classification, and date-selection/retrieval-surface QA.
- Run 22: intrinsic fingerprint of `GLOSSARY (LIVE).txt`; no defensible author/tool/source anchor found; speculative ancestry expansion closed.
- Run 23: stale Viewer-route indexed search plus Mercer README/continuity reconciliation; current catalog path and checkpoint-first restart behavior made explicit.
- Run 24: durable Viewer QA restart-state reconciliation; terminal cancelled owner run is now recorded at the owning QA surface and repeat polling retired.
- Run 25: live-source provenance-log durable referent reconciliation; quoted Nathan text unchanged; raw-ID backfill remains pending.

## Best next operation

Next run: reread Control/Common. Do not poll terminal navigation run `34814002515`. Do not resume broad glossary ancestry scanning without a new source anchor. The bounded stale-restart/referent audit has now covered Mercer's principal durable front-door, Viewer QA, checkpoint, and live-source records. Branch to a bounded retrieval/index-integrity check with measurable repository evidence, preferably source-path/catalog or durable-index consistency work that does not duplicate Morrow continuity work or the active Nathan-words lane. If a committed owner/path for a historical scanner candidate report appears, use it to advance `MORROW-SOURCE-001`; otherwise leave that dependency recorded rather than guessing.
