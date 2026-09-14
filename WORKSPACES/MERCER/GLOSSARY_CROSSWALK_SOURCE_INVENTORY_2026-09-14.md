# Glossary / Standard-Crosswalk Source Inventory — 2026-09-14

**Status:** ACTIVE source-discovery / provenance inventory  
**Owner / lane:** Mercer — archive accessibility, retrieval QA, documentation/navigation reconciliation  
**Epistemic type:** provenance/index infrastructure; **not** a theory-definition surface  
**Scope:** identify and classify existing glossary / SAT-to-standard terminology resources without reconciling, rewriting, normalizing, or promoting their theory content during the project-wide theory-bearing standdown.

## Why this exists

Nathan directed the project toward a repo-wide historical definitions initiative that can surface current definitions first while retaining earlier senses and relationships to standard terminology. Before any such glossary can safely be canonical, the existing source surfaces need to be found and source-typed. File labels such as `LIVE`, `ACTIVE`, `definitions`, or `TO STANDARD MAP` are retrieval clues, not sufficient authority or currentness claims.

This inventory implements `WORKSPACES/COMMON/DURABLE_PROJECT_DOCUMENTATION_CONVENTION.md`: source first, authorship/status explicit, historical/superseded material preserved, generated interpretation not silently promoted.

## Search / coverage performed

### Current HsH repository

Searched the current `Satobloc/HsH` repository through GitHub retrieval/search surfaces for the literal anchors and close variants:

- `GLOSSARY`
- `glossary`
- `standard-to-SAT`
- `terminology`
- combined glossary / standard terminology / crosswalk language

No dedicated committed glossary or standard-to-SAT crosswalk surfaced through those tested search routes. This is a **discoverability result**, not a claim that no such material exists anywhere in the repository: recursive tree output exceeded the connector response window, so negative search results must not be upgraded to exhaustive absence.

The current HsH README points archive users to the legacy public archive `Satobloc/SAT_THEORY_ARCHIVE_2023-25`; that repository therefore became the source-first next layer.

### Legacy public archive

Read the legacy archive README and generated `..findex.txt` rather than guessing historical paths. The README explicitly directs AI visitors to welcome/index machinery and describes the archive as a mixed historical record containing native notes, AI-assisted drafts, speculative branches, formalization attempts, corrections, audits, and other unequal-status materials. The generated folder index exposed the exact candidate paths below.

## Verified candidate sources

### 1. Legacy archive README

**Path:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/README.md`  
**Source signal:** directly signed/editorially framed by Nathan McKnight in the document; archive front door.  
**Function relevant here:** contains explicit SAT naming/history and a substantial terminology-bearing overview, including the statement that terminology is defined as useful and that later timeline entries reuse established SAT terms unless meanings change.  
**Classification:** **Nathan-authored editorial/front-door source**, useful for historical terminology/provenance and for locating intended reading context.  
**Caution:** it spans historical SAT material and a 2026 archive front door; it is not, by itself, evidence that every embedded historical definition remains the current H(s)H definition.

### 2. `GLOSSARY (LIVE).txt`

**Path:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2026/Early SAT/GLOSSARY (LIVE).txt`  
**Internal heading:** `LIVE GLOSSARY -- ACTIVE` / `Glossary of Terms and Symbols`.  
**Content type:** compact terminology/symbol definitions for an Early-SAT formulation.  
**Authorship signal in inspected file:** **unresolved** — the fetched file body contains no explicit Nathan authorship marker or raw conversation attribution.  
**Classification:** **historical glossary candidate; theory-bearing; provenance/currentness unresolved**.  
**Caution:** `LIVE` and `ACTIVE` are historical file/internal labels and cannot safely override the containing `2026/Early SAT/` context or later framework development. Do not use the labels alone to promote these definitions as current.

### 3. `SATv  TO STANDARD MAP.txt`

**Path:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/2023-24 FRAMEWORK DEVELOPMENT/SATv  TO STANDARD MAP.txt`  
**Opening heading:** `Mapping SAT-W to Known Physics (Initial Set)`.  
**Content type:** explicit standard-view ↔ SAT-W interpretation mapping for gravity, photons, matter/antimatter, bosons, mass and related concepts.  
**Authorship signal in inspected file:** **unresolved** — no explicit author/raw-message identity appears in the fetched body.  
**Classification:** **historical standard-crosswalk candidate; theory-bearing; provenance/currentness unresolved**.  
**Caution:** the file is directly relevant to the planned synonym/structural-overlap system, but its mappings should be treated as historical source material until authorship, date, framework phase, and supersession are established.

### 4. `10-20-25 definitions.txt`

**Path:** `Satobloc/SAT_THEORY_ARCHIVE_2023-25/10-31-2025 SAT FULL THEORY/10-20-25 definitions.txt`  
**Content type:** extended “Dictionary of Geometry” / terminology compilation.  
**Intrinsic provenance signal:** the inspected body includes conversational assistant-style framing (`That is an excellent choice`), source-number scaffolding, and retained `Chat` / `10 sources` / Notebook-style interface text.  
**Classification:** **AI-mediated/generated compilation signal present; not Nathan Direct by default**.  
**Caution:** this file may preserve useful quotations, source references, or Nathan-approved material, but the compilation itself cannot be used as a Nathan-authored definition source without tracing entries back to attributable underlying material.

## Repository-custody provenance — Run 15

Git path history adds a useful but limited provenance layer for the two unresolved candidates.

### `GLOSSARY (LIVE).txt`

- Git history for the exact path returns a single introducing commit: `f25c2b8a63eca815cce863bbe859f104983fedd5`.
- Commit author identity is the `Satobloc` account / Nathan McKnight email identity used by the archive, timestamped `2026-06-01T00:01:54Z`.
- Commit message is generic: `Add files via upload`.
- The introducing commit is a **bulk archive upload**, adding 37,337 lines across many files, not a glossary-specific authored edit.

**What this establishes:** the file was under Nathan/Satobloc repository custody by 2026-06-01 and was intentionally included in that archive upload.

**What this does not establish:** the document's original creation date, whether Nathan wrote every line, whether it originated in a mixed/assistant conversation, or whether its `LIVE`/`ACTIVE` label remained current after that historical context.

### `SATv  TO STANDARD MAP.txt`

- Git history for the exact path returns a single introducing commit: `bd1b2a6d25d8133c21a1901777ebdc137dc925e5`.
- Commit author identity is the same `Satobloc` / Nathan archive account identity, timestamped `2025-10-29T20:03:04Z`.
- Commit message is generic: `Add files via upload`.
- The introducing commit is an even larger **bulk archive upload**, adding 199,724 lines across many files.

**What this establishes:** the file was under Nathan/Satobloc repository custody by 2025-10-29 and was intentionally included in that archive upload.

**What this does not establish:** original document date, line-level authorship, raw conversation/message ancestry, or later supersession status.

### Provenance consequence

Repository commit authorship must be stored separately from **content authorship**. For imported archives, `uploaded_by / repository_custodian` and `content_author_class` are different fields. A Satobloc-authored bulk-upload commit is positive custody evidence, but it is not sufficient to upgrade imported file text to `Nathan Direct`.

This distinction should be carried into the planned historical glossary registry. Recommended additional fields:

- `repository_first_seen_commit`;
- `repository_first_seen_at`;
- `repository_custodian`;
- `ingest_mode` (`bulk upload`, `specific edit`, `generated`, etc.);
- `content_authorship_status` separately from commit author.

## Indexed phrase ancestry test — Run 16

Distinctive source-derived phrases from `SATv  TO STANDARD MAP.txt` were tested through the available GitHub indexed-search routes against HsH and the legacy archive, including:

- `Mapping SAT-W to Known Physics (Initial Set)`;
- `Photons are events, not objects`;
- `restoration of filament symmetry`;
- `filament tension across time`.

No raw-conversation ancestry hit surfaced. This is a retrieval limitation/result, not evidence that no originating conversation exists. Do **not** repeat the same GitHub phrase-search route unless the searchable corpus/index changes.

## Raw-export retrieval route — Run 17

A repository-native raw-conversation extraction path is now verified:

- workflow: `.github/workflows/extract-raw-window.yml`;
- extractor: `WORKSPACES/COMMON/scripts/extract_raw_window.py`;
- request queue: `WORKSPACES/COMMON/extraction_requests/*.json`;
- output directory: `WORKSPACES/COMMON/extraction_outputs/`.

The extractor reads an explicit raw conversation `source_path`, selects user messages after `after_create_time`, includes configurable neighboring context through `context_each_side`, and writes both JSON and Markdown. Output preserves the conversation ID plus per-message `node_id`, `message_id`, role, author name, recipient, create time, parent, and text. This is materially stronger provenance machinery than filename/upload custody or indexed phrase matching.

A committed request demonstrates the intended request schema:

```json
{
  "source_path": "<raw conversation path>",
  "after_create_time": 0,
  "user_limit": 20,
  "context_each_side": 1,
  "purpose": "<provenance/retrieval purpose>"
}
```

The workflow automatically reruns requests when request JSONs or the extractor change and commits changed extraction outputs back to `main`.

### Consequence for glossary ancestry

The ancestry problem is now narrower and better specified. The missing prerequisite is **not** raw-window tooling. It is a defensible candidate raw conversation path and time/frontier for either historical candidate. The extractor is deliberately bounded and chronological; it is not a phrase-search engine across all exports. Therefore creating speculative requests against arbitrary raw files would be noisy and could duplicate Morrow/Nathan-Words lanes.

Safe next ancestry operation: locate an existing raw-export index, title/date correlation, or independently sourced candidate conversation path for the glossary/standard-map material; then use the bounded extractor to recover exact attributable messages. Until an anchor exists, keep authorship unresolved.

## Retrieval finding

The archive already contains at least three distinct kinds of “definition” resource that a naive glossary merger would conflate:

1. a Nathan-authored archive/front-door account containing terminology and historical framing;
2. explicit glossary/crosswalk artifacts whose authorship and supersession state still need reconstruction;
3. an AI-mediated definition compilation whose generated layer is visible in the file itself.

Therefore the glossary initiative needs **source typing before term normalization**. A filename search followed by copy/merge would collapse authorship and historical status.

## Recommended neutral registry fields

When the owning glossary/tagging lane creates the canonical definitions index, each source/term record should be able to carry at least:

- exact repository + path;
- source date / framework phase when verifiable;
- author class: Nathan Direct / Nathan present testimony / mixed conversation / AI-generated or AI-mediated / external / unresolved;
- raw conversation/message ID when available;
- epistemic status: current / historical / superseded / clarification / workshop / quarantined / unresolved;
- relationship type: same term / historical sense / broader / narrower / structural overlap / standard-physics analogue / synonym candidate;
- source quotation or exact pointer rather than reconstructed wording when authority matters;
- supersedes / superseded-by link where established;
- public/private evidence boundary;
- verification note naming who/what established the classification;
- repository first-seen commit/time and ingest mode, kept separate from content authorship.

This is a metadata recommendation only; it does not define or adjudicate any SAT/H(s)H term.

## Navigation gap

No current HsH glossary/crosswalk front door surfaced under the tested literal search routes. The useful historical resources are discoverable through the legacy archive's generated folder index, but a worker must already know to traverse there. Until the owning lane establishes a canonical glossary/definitions index, this Mercer inventory is the durable retrieval pointer for the verified candidates above.

Do **not** create a theory-bearing canonical glossary from this inventory during standdown. The safe next operation is provenance recovery: identify raw conversation/source ancestry for the historical glossary and standard map, then compare dates/supersession only from attributable source material.

## Dependencies / blockers

- Raw conversation/message provenance for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt` is not yet identified.
- A repository-native bounded raw extractor exists, but the historical candidates still lack defensible `source_path` / time anchors for using it.
- Current H(s)H terminology authority cannot be inferred from these historical files while the theory-bearing standdown remains active.
- GitHub connector recursive-tree output is response-truncated; current-HsH negative filename search is therefore a discoverability finding, not exhaustive absence.
- Repository path history establishes first-seen custody dates but cannot by itself recover line-level/content authorship from bulk-upload commits.

## Next operation

Continue source-first ancestry recovery for the two high-value historical candidates:

1. locate an existing raw-export index, title/date correlation, or attributable candidate conversation path without repeating the exhausted GitHub phrase-search route;
2. once a defensible raw source/time anchor exists, submit a bounded extraction request and recover exact Nathan prompts/messages, IDs, and dates;
3. record framework phase and any explicit supersession/clarification without reconciling theory content;
4. keep repository custody separate from content authorship;
5. hand verified source metadata to the definitions/tagging lane rather than independently constructing the glossary.
