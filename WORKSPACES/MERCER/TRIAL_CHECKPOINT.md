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

## Current frontier — after Run 22

### A. Historical glossary / standard-crosswalk provenance

**Status:** source inventory + repository-custody layer complete; raw-message/content ancestry unresolved. Viewer catalog candidate triage and intrinsic glossary fingerprinting have both reached bounded stopping points without a defensible direct ancestry anchor.

Durable sources:

- `WORKSPACES/MERCER/GLOSSARY_CROSSWALK_SOURCE_INVENTORY_2026-09-14.md`
- `WORKSPACES/MERCER/GLOSSARY_INTRINSIC_PROVENANCE_FINGERPRINT_2026-09-14.md`
- latest run record: `WORKSPACES/MERCER/RUN_022_2026-09-14.md`

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

Viewer catalog candidate-selection bridge is **`CONVERSATION_VIEWER/data/conversations.json`**. Earlier Mercer references to `CONVERSATION_VIEWER/catalog/conversations.json` are stale and should not be reused. The catalog maps titles/dates to explicit raw paths, time ranges and message counts. Catalog proximity is retrieval metadata only, not authorship evidence.

Bounded candidate results through Run 21:

- `SAT theory overview`, catalog ID `fa2cc1b6a832`, 2025-10-29, 10 messages — no direct ancestry signal.
- `Vetting document review`, raw conversation ID `69023bdb-63f0-832b-8821-56362ed2493c`, 2025-10-29 — journal-submission vetting; no direct ancestry signal.
- `SAT Theory Archive Review`, raw conversation ID `6a1df035-25d4-83ea-943d-e0db20433533`, 2026-06-01 — archive-review context; no glossary match.
- `SATO-BLOC FULL LEANCHECK`, raw conversation ID `6902429e-f6b8-8326-b681-3e74e3119378`, 2025-10-29 — same-day SAT-to-standard mapping context but no direct target identifiers/distinctive phrases.
- `Assignment queue creation`, Viewer ID `6ecbc7ec20e7`, raw conversation ID `68c0c03c-ffc4-8331-8b66-49d0993c5830` — generic `Glossary` assignment-template false positives only.
- `SATNet and Neural Networks`, Viewer ID `3c14bc5a00c7`, raw conversation ID `6a1df069-b5e0-83ea-943d-e0db20433533`, 2026-06-01 start — no glossary signal.

### Run-22 intrinsic fingerprint result

Target: `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/Early SAT/GLOSSARY (LIVE).txt`, blob `aaf4a51228865fe9d05066a20e6daf2d18f8deb8`, 1,896 bytes.

Verified form:

- prepared standalone LaTeX fragment;
- leading blank line / CRLF line endings;
- `\section{LIVE GLOSSARY -- ACTIVE}` + `\section*{Glossary of Terms and Symbols}`;
- one structured `description` environment with math-rich entries;
- no preamble, author/date, source IDs, citations, speaker labels, UI residue, assistant salutation, or other embedded origin metadata.

Neighboring `2026/Early SAT/` files and the June-1 upload cohort are heterogeneous. Directory adjacency and upload-cohort membership therefore do not identify a common author/tool/source workflow. GitHub code-search misses for the exact heading and a distinctive body anchor are retrieval negatives only.

**Consequence:** intrinsic formatting did not yield a discriminating creation-era/tool-origin/raw-conversation anchor. Close this branch for now. Do not widen speculative candidate scanning from formatting, directory adjacency, `LIVE`/`ACTIVE` labels, bulk-upload membership, or code-search misses.

A future ancestry claim should require a stronger link: exact artifact paste, explicit glossary-generation instruction, matching distinctive body text in raw conversation, original file metadata, or another independently attributable source relation.

### Run-21 retrieval-selectivity rule retained

For artifact ancestry candidate ranking, prefer:

1. exact/near `start_local` date match;
2. archive/document/glossary/definition title signal;
3. small bounded message count;
4. only then end-date proximity.

End-date-only matches are weak secondary clues unless another independent artifact/content anchor exists.

A connector-specific discrepancy was also verified in Run 21: one `fetch_file` route reported a raw file as empty while the GitHub Contents API returned populated JSON. Do not infer repository emptiness from a lone empty retrieval surface when another direct GitHub route contradicts it.

### B. Viewer/catalog path drift

**Status:** Viewer publication repair green; canonical navigation workflow reconciled; tracked owner run terminal/cancelled.

Established repair chain remains in `WORKSPACES/MERCER/VIEWER_PATH_QA_2026-09-13.md`. Current Viewer catalog path is `CONVERSATION_VIEWER/data/conversations.json`; its observed `source_state_at_utc` remains `2026-09-13T12:30:33.868040+00:00`, with 374 conversations (365 development / 9 live). Development input still points to manifest generated `2026-09-13T12:30:33.434526+00:00`.

Canonical `Maintain H(s)H navigation` run `34814002515` is cancelled and must not be polled again. Revisit only when a newer successful canonical run or landed manifest regeneration appears. Until then stale generated state remains an owner-execution/generation-lag dependency, not a demonstrated generator defect.

A documentation cleanup remains useful: stale prose references to `CONVERSATION_VIEWER/catalog/conversations.json` should be reconciled to `CONVERSATION_VIEWER/data/conversations.json` when safely editable without overwriting concurrent work.

### C. Durable documentation convention

Established in Run 13: `WORKSPACES/COMMON/DURABLE_PROJECT_DOCUMENTATION_CONVENTION.md`, linked/routed through Common.

### D. `MORROW-SOURCE-001`

**Code-side resolved / output-side pending.** Superset comparator/payload policy/regression case/tests are fixed. No committed historical candidate-report path has been identified; any pre-patch external/manual report remains stale until its owning path is found. Preserve the earlier Janus export.

## Other queued Mercer work

- bounded stale Viewer-path documentation reconciliation;
- layered-autotag selectivity validation after standdown release;
- source-grounded methodology reconstruction from verified Nathan-authored material;
- raw UUID/timestamp backfill for live Nathan testimony when exports land;
- historical/manual scanner candidate-report owner/path recovery if a source surface emerges.

## Dependencies / blockers

- `DEPENDENCY / AMBIGUOUS_PROVENANCE`: direct raw-message ancestry for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt` remains unidentified; current search/fingerprint routes are exhausted pending a stronger source anchor.
- `DEPENDENCY`: repository first-seen dates are bulk-upload custody dates and may substantially postdate artifact creation.
- `DEPENDENCY`: canonical navigation run `34814002515` finished cancelled; a newer successful owner regeneration is still needed to close generated-state cleanup.
- `DEPENDENCY`: historical/manual scanner candidate-report owner/path unknown.
- `DEPENDENCY`: live Nathan conversation UUIDs/timestamps await appropriate export/provenance surfaces for backfill.
- No current issue genuinely requires Nathan attention.

## Run history

- Runs 1–4: training, shared live-development testimony surface, integrity/discoverability check, initial superset-scanner defect isolation/patch.
- Runs 5–7: scanner invocation/report tracing, regression spot-checks, committed regression tests, logic revalidation.
- Runs 8–12: Viewer LIVE-path drift diagnosis and repair; publication race hardening; canonical owner tracing; privacy-deletion timing reconstruction; canonical navigation workflow reconciliation; bounded owner-state verification.
- Run 13: established repo-wide durable documentation convention and Common routing.
- Runs 14–17: source-first glossary/crosswalk inventory, custody provenance, indexed phrase testing, and bounded raw-extraction route verification.
- Runs 18–21: Viewer-catalog candidate selection, bounded candidate eliminations, path correction, generic-glossary false-positive classification, and date-selection/retrieval-surface QA.
- Run 22: intrinsic fingerprint of `GLOSSARY (LIVE).txt`; determined artifact form, directory adjacency, upload cohort, and indexed-search misses do not yield a defensible author/tool/source anchor; closed speculative ancestry expansion. See `RUN_022_2026-09-14.md`.

## Best next operation

Next run: reread Control/Common. Do not poll terminal navigation run `34814002515`. Do not resume broad glossary ancestry scanning without a new source anchor. Perform a bounded documentation/navigation reconciliation pass for stale references to the superseded Viewer catalog path `CONVERSATION_VIEWER/catalog/conversations.json`, replacing them with the verified current path `CONVERSATION_VIEWER/data/conversations.json` only where the owning documents can be safely edited without trampling concurrent work. If already reconciled by another worker, choose the next highest-value permitted retrieval/index QA task.
