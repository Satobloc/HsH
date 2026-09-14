# Glossary / Standard-Crosswalk Source Inventory — 2026-09-14

**Status:** ACTIVE source-discovery / provenance inventory  
**Owner / lane:** Mercer — archive accessibility, retrieval QA, documentation/navigation reconciliation  
**Epistemic type:** provenance/index infrastructure; **not** a theory-definition surface  
**Scope:** identify and classify existing glossary / SAT-to-standard terminology resources without reconciling, rewriting, normalizing, or promoting their theory content during the project-wide theory-bearing standdown.

## Why this exists

Nathan directed the project toward a repo-wide historical definitions initiative that can surface current definitions first while retaining earlier senses and relationships to standard terminology. Before any such glossary can safely be canonical, the existing source surfaces need to be found and source-typed. File labels such as `LIVE`, `ACTIVE`, `definitions`, or `TO STANDARD MAP` are retrieval clues, not sufficient authority or currentness claims.

This inventory implements `WORKSPACES/COMMON/DURABLE_PROJECT_DOCUMENTATION_CONVENTION.md`: source first, authorship/status explicit, historical/superseded material preserved, generated interpretation not silently promoted.

## Search / coverage performed this pass

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
- verification note naming who/what established the classification.

This is a metadata recommendation only; it does not define or adjudicate any SAT/H(s)H term.

## Navigation gap

No current HsH glossary/crosswalk front door surfaced under the tested literal search routes. The useful historical resources are discoverable through the legacy archive's generated folder index, but a worker must already know to traverse there. Until the owning lane establishes a canonical glossary/definitions index, this Mercer inventory is the durable retrieval pointer for the verified candidates above.

Do **not** create a theory-bearing canonical glossary from this inventory during standdown. The safe next operation is provenance recovery: identify raw conversation/source ancestry for the historical glossary and standard map, then compare dates/supersession only from attributable source material.

## Dependencies / blockers

- Raw conversation/message provenance for `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt` is not yet identified.
- Current H(s)H terminology authority cannot be inferred from these historical files while the theory-bearing standdown remains active.
- GitHub connector recursive-tree output is response-truncated; current-HsH negative filename search is therefore a discoverability finding, not exhaustive absence.

## Next operation

Source-first provenance recovery for the two high-value historical candidates:

1. search conversation exports / archive indices for exact distinctive phrases from `GLOSSARY (LIVE).txt` and `SATv  TO STANDARD MAP.txt`;
2. recover attributable Nathan prompts/messages and dates where possible;
3. record framework phase and any explicit supersession/clarification without reconciling theory content;
4. hand verified source metadata to the definitions/tagging lane rather than independently constructing the glossary.
