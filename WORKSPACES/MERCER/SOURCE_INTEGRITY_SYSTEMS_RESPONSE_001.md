# Mercer source-integrity systems response 001

**Date:** 2026-09-14  
**Scope:** archive/index/retrieval QA only under the active theory-bearing standdown. This is a systems/reliability note, not theory synthesis or source-content promotion.

## 1. Existing machine substrate: what is reliable enough, and where human checks remain

### A. Strong machine substrate for bounded mechanical claims

1. **`WORKSPACES/COMMON/scripts/find_superset_conversation_duplicates.py` — reliable for candidate generation after the Mercer/Morrow regression repair.**
   - It now compares shared message IDs using a hash of author role/name, the **entire `content` object**, recipient, channel, and create time.
   - It refuses to classify equal-size exports as prefix/superset candidates and never deletes or moves files.
   - Its output is explicitly a review plan, not an automatic disposition decision.
   - This is appropriate machine substrate for the narrow claim: “export A is a strict message/payload subset candidate of export B under the encoded policy.”
   - Human/source-use review remains mandatory before quarantine/deletion because index links, tags, citations, provenance roles, and historical snapshot value are outside the equality test.

2. **`tools/date_conversation_exports.py` — reliable for deterministic date-prefix planning and collision-safe renaming.**
   - Default behavior is dry-run.
   - It writes an audit manifest every run.
   - On `--apply`, any collision globally blocks all planned renames rather than partly mutating the tree.
   - This makes the manifest a trustworthy machine surface for identifying path-normalization blockers and intended rename targets.
   - Human review remains necessary for duplicate disposition: a target collision can be byte-identical, historically meaningful, or genuinely conflicting, and the script intentionally does not decide that policy.

3. **Autotag → Nathan Direct package → Stage-2 counts — reliable as structural/count substrate, not semantic authority.**
   - Current reconciled counts close arithmetically: 21,451 user records = 14,306 packaged unique user messages + 7,145 collapsed duplicate records; Stage 2 declares exactly 14,306 source records.
   - These are suitable integrity invariants for dropped/duplicated-record detection.
   - Tag meanings, relevance scores, winnow buckets, and reconstruction significance still require human/source-context validation and may change while the underlying corpus counts remain stable.

4. **`CONVERSATION_VIEWER/data/conversations.json` + its declared input metadata — reliable as a generated navigation catalog when generation state is fresh.**
   - Catalog count arithmetic has been reconciled against development/live manifests plus the external-conversation registry.
   - It is appropriate for candidate selection, navigation, and source-path routing.
   - It is not authorship evidence, canonical theory status, or a substitute for raw-source inspection.
   - Freshness must be checked: the currently observed catalog remains generated from the 2026-09-13 source state and is therefore a known lagging surface.

### B. Useful machinery that still needs point-of-use checking

5. **`WORKSPACES/COMMON/scripts/extract_raw_window.py` — useful bounded retrieval helper, but not a complete-content serializer.**
   - `text_of()` reads `content.parts` and nested `parts[*].text` only.
   - It does not serialize arbitrary non-`parts` content shapes such as the `execution_output.text` shape that triggered `MORROW-SOURCE-001` in the old superset comparator.
   - For ordinary user-text recovery this can be adequate; for “complete message content” claims it must be checked against raw JSON or upgraded to a typed full-content extractor.

6. **GitHub code search / connector search — discovery aid only.**
   - Repeated Mercer work has shown that search misses and empty retrieval responses are not absence evidence when direct repository routes return populated material.
   - Use search for candidate discovery, then verify by path/contents API or raw source.

## 2. Top observed retrieval/source-integrity failure modes

These are observed project failures or near-failures, not generic possibilities.

1. **Partial content-shape comparison masquerading as full equality.**  
   Earlier superset scanning selected `parts`-style content and missed a shortened `execution_output.text` field in a later Janus export. Result: a lossy later export could be mislabeled as a complete superset. Fixed in the current comparator; retain as a permanent regression case.

2. **Generated navigation paths drifting away from actual repository paths.**  
   Viewer LIVE entries previously carried date-prefixed paths absent from the tree. The builder/path resolution was repaired, but generated navigation should always be treated as derived and checked against tree state when path anomalies appear.

3. **Generated-state freshness lag being mistaken for source-state truth.**  
   The canonical navigation workflow is currently stale/cancelled. Catalog/manifests can therefore be internally coherent yet not describe the newest tree. Every generated artifact needs a source-state timestamp/commit comparison before being used for freshness-sensitive claims.

4. **Corpus-count changes being mistaken for indexing loss.**  
   The 388→387 conversation and 21,499→21,451 user-message reduction was exactly explained by the held/deleted legal conversation. Raw-source changes, scanned infrastructure JSON counts, and tagger-output bucket counts must be tracked as different invariants.

5. **Retrieval-negative / proximity metadata being overread as provenance.**  
   GitHub search misses, directory adjacency, same-day upload cohorts, Viewer date proximity, and polished artifact formatting repeatedly failed to establish direct glossary/crosswalk ancestry. These are candidate-ranking signals only; provenance requires a stronger anchor such as raw-message body match, explicit generation instruction, embedded source metadata, or attributable original file history.

Additional recurring hazard: **path-normalization collision with global downstream blocking.** The current development manifest has one exact duplicate-file collision that blocks 48 otherwise planned renames. The safety behavior is correct, but downstream users must distinguish “blocked by collision” from “missing/unparseable source.”

## 3. Cross-repo source-inventory/checksum layer: compose, do not replace

A useful first version can be built mostly from existing machinery. Do not create a parallel ingestion stack.

Recommended record per source object:

- repository + path;
- Git blob SHA where available;
- byte size;
- source class (`raw conversation`, `PDF`, `extracted text`, `generated index`, `viewer-derived`, `external registry`, etc.);
- stable source ID where present (conversation ID, DOI, document ID, etc.);
- generator/tool + version/commit for derived artifacts;
- generated-at/source-state commit or timestamp;
- parent/source path(s) for derived artifacts;
- parse status + record/message/page/line counts where meaningful;
- provenance status (`original`, `derived`, `external`, `unknown`);
- known dependency/warning fields.

Compose from:

1. Git tree/blob SHA + path metadata for byte identity and change detection.
2. `date_conversation_exports.py` manifests for raw conversation path/date/parse state.
3. existing autotag/Nathan Direct/Stage-2 manifests for record-count continuity.
4. Viewer input metadata + `EXTERNAL_CONVERSATIONS.json` for navigation-source lineage.
5. `find_superset_conversation_duplicates.py` only for conversation-family duplicate/subset candidates, never as the master inventory.
6. existing PDF extraction/index outputs when the PDF lane exposes explicit parent-source pointers; where those pointers are missing, mark the relation unresolved rather than infer it from filenames.

The missing piece is therefore a **thin inventory joiner/validator**, not a new parser ecosystem. Its job should be to join already-emitted identity/checksum/state fields and emit discrepancies.

## 4. Sampling regime for high-confidence availability/freshness/truncation QA

Use stratified source-to-derived chain sampling rather than random files alone.

### Per run / after meaningful generation

Sample at least one item from each active source class:

- raw conversation with ordinary `parts` text;
- raw conversation containing a nonstandard content shape/tool output;
- known duplicate/superset family;
- renamed/date-prefixed conversation;
- registered external Viewer conversation;
- ordinary generated Viewer conversation;
- PDF with text extraction;
- generated index/package record that should point back to one of the above.

For each sampled chain, verify:

1. source path exists;
2. blob/checksum matches inventory;
3. declared stable ID matches source;
4. derived parent/source path resolves;
5. source-state timestamp/commit is not older than the claimed generation state;
6. record/message/page count is plausible and, where deterministic, exact;
7. one beginning, one middle, and one end landmark round-trips from source to derived representation;
8. at least one nonstandard content-shape case is preserved, not silently omitted;
9. duplicate-family members remain distinguishable when they have historical value even if payload-overlapping;
10. privacy/hold exclusions are represented as explicit source-state changes rather than unexplained count loss.

### Periodic deeper sample

Use a deterministic rotating sample keyed by repository path hash so coverage accumulates without cherry-picking. Add oversampling for:

- files changed since the last successful generation;
- files with parse warnings;
- paths mentioned in Common blockers/handoffs;
- source families with prior regression history;
- generated artifacts whose source-state marker is older than the tree head;
- PDF/extraction pairs lacking a checksum or explicit parent pointer.

A practical confidence target is not “zero unseen defects”; it is: every source class covered, every known failure mode represented by a permanent regression specimen, and every generation boundary checked with at least one round-trip sample plus global count/checksum invariants.

## 5. Candidate full-theory/source-backtrace assemblies

Not ranked in this run. Selecting “most promising” theory assemblies would require a bounded source inventory of the candidate document family first; Mercer should not answer from remembered titles or content reputation during the standdown. This is safe to revisit as provenance-only work if Sable needs it.

## 6. Morrow continuity obligations Mercer can safely inherit

Safe for Mercer/deterministic tooling:

- path/ID crosswalk verification once candidate families are already identified;
- exact raw UUID/timestamp backfill;
- byte/message/payload equality checks;
- manifest/index/catalog reconciliation;
- regression tests for known export-shape failures;
- durable provenance/status documentation;
- source-path existence/freshness/count invariants.

Better left to a continuity specialist or explicit contextual review:

- deciding whether two non-identical branches are historically/thematically “the same conversation family” when IDs are absent or ambiguous;
- reconstructing conversational causality from overlapping exports;
- interpreting branch significance, response-routing history, or instance/crosstalk narratives;
- deciding which adjacent context is necessary to preserve authorial intent;
- any judgment that depends primarily on accumulated dialogue familiarity rather than mechanical source identity.

Mercer can validate the evidence layer for those judgments, but should not silently absorb the contextual continuity role.

## Durable takeaway

The project already has most of the ingredients for a strong source-integrity layer. The highest-value next infrastructure step is a thin cross-source inventory/validator that joins existing SHA/ID/path/generation metadata and encodes the observed regressions as permanent samples. The main reliability discipline is to keep **identity, content equality, source existence, generated freshness, semantic relevance, and provenance/authority as separate questions**.