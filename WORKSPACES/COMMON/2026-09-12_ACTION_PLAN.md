# H(s)H Shared Action Plan — 2026-09-12

Status: active shared programme

Purpose: coordinate archive, provenance, citation, convergence, research, and workspace work across the public HsH repository, the historical SAT archive, and the private reference repository without collapsing their different roles.

This is an action plan, not a theory-status document. Findings produced under it must be promoted to the appropriate durable ledger, audit, provenance map, synthesis, formalization, bibliography, or index before they are treated as settled project records.

## I. Repository and evidence boundaries

### Public provenance pair

The public cross-linking pair is:

- `Satobloc/HsH`
- `Satobloc/SAT_THEORY_ARCHIVE_2023-25`

Use bidirectional links between these repositories wherever they materially improve developmental provenance, derivation tracing, chronology, or navigation.

### Private reference repository

`Satobloc/HSH_RESOURCES` is private research/reference infrastructure, not a public dependency surface.

When material from HSH_RESOURCES is used in public HsH or archive work, expose it through one or more of:

- a Chicago-style citation to the original external source;
- an attributed quotation/extract with a useful page, section, equation, figure, dataset, or other locator;
- a sourced summary/paraphrase;
- a public-safe derivative table or analysis that preserves source attribution and method.

Private repository paths and hashes may remain in private/internal research records for retrieval and reproducibility, but public work should not depend on a reader being able to open a private HSH_RESOURCES link.

### Internal provenance is not external citation

Keep separate:

1. **internal provenance** — where SAT/H(s)H developed a construction;
2. **external citation** — what outside source supports, constrains, resembles, predates, or is deliberately imported into it.

A mature HsH statement may carry both.

---

## II. Workspace and coordination programme

### Individual workspaces

Use `WORKSPACES/<name>/` for substantial focused work, experiments, scratch analysis, intermediate tables, and task-specific notes.

### Common room

Use `WORKSPACES/COMMON/` for concise shared coordination across agents/threads/workspaces:

- active programme state;
- handoffs;
- blockers;
- dependency notices;
- questions another worker can answer;
- discoveries another lane needs to know about;
- pointers to work in progress.

Do not let the common room become a shadow theory archive. Promote stable outputs to their proper durable destinations.

### Shared reporting convention

A useful handoff should state:

`date — from → to/all — subject — status/action — source/destination pointer`

Where a claim depends on external research, give the original-source citation or public-safe extract/summary rather than a private HSH_RESOURCES link.

---

## III. Core programme lanes

### 1. Archive accessibility

Goal: make the three repositories locatable and text-accessible to the greatest practical extent while preserving source artifacts.

Actions:

- maintain structural indexes and manifests;
- continue PDF text extraction and OCR/image-text coverage;
- explicitly inventory inaccessible/unsupported formats rather than treating them as absent;
- preserve source path + hash identity;
- use canonical source pages/images for exact quotations, equations, figures, dates, and priority evidence.

Deliverables:

- coverage/accounting reports;
- unresolved-format queue;
- reproducible extraction/OCR mappings.

### 2. Development provenance and public cross-linking

Goal: build a bidirectional developmental map between HsH and the historical SAT archive.

Actions:

- continue chronological conversation archaeology;
- tag exact conversations/message ranges for important constructions;
- link current HsH statements back to historical development sources;
- link important historical sources forward to their current HsH descendants where appropriate;
- distinguish early structural antecedents from later explicit naming/formalization;
- preserve superseded forms rather than rewriting the history into a clean retrospective narrative.

Priority chronology distinctions:

- earliest SAT/HsH-like structure;
- earliest deliberate connection of those structures;
- first explicit formulation of a construction;
- first naming/terminology;
- first public disclosure;
- later refinement/formalization.

Deliverables:

- provenance crosswalks;
- timeline/landmark records;
- Conversation Viewer landmarks and source links where useful.

### 3. Citation closure and public evidence

Goal: ensure public-facing claims that rely on outside work have usable original-source support.

Actions:

- identify actual point-of-use citation needs;
- retrieve candidate sources from HSH_RESOURCES or external literature services;
- inspect the exact supporting pages/sections;
- produce Chicago-style citations;
- preserve short attributed quotations or precise sourced summaries where useful;
- maintain stable `CITE-YYYY-NNN` handoffs between private research records and the public HsH citation ledger;
- never promote a keyword/embedding match directly to `VERIFIED`.

Deliverables:

- verified point-of-use citations;
- page/section/equation anchors;
- citation-ledger closure reports.

### 4. Convergent research / originality / ancestry audit

Goal: determine, claim by claim and construction by construction, how strongly outside work converges on SAT/H(s)H; what ancestry that work itself cites; which SAT/H(s)H elements are externally anteceded, independently developed, near-identical, structurally related, apparently original, or deliberately imported.

This lane must not reduce the question to shared vocabulary or generic ingredients. The unit of comparison is the **specific construction, compound, dependency structure, transformation, or quantitative relation**.

#### A. Required comparison questions

For every serious convergence candidate ask:

1. **What exactly is the SAT/H(s)H object?** State it in bounded, source-linked terms before comparison.
2. **What exactly is the external object?** Quote or summarize the external formulation with exact source/date/version locators.
3. **How similar are they structurally?** Compare components, relations, dependency order, constraints, transformations, and claimed function—not just terminology.
4. **What is the chronology?** Separate SAT/H(s)H internal-development date, public date, external preprint/publication dates, and later revisions.
5. **What ancestry does the external work cite?** Trace its explicit references and acknowledged conceptual lineage.
6. **What older uncited antecedents are independently discoverable?** Keep these separate from the author's own cited ancestry.
7. **Was the relevant outside work plausibly available to the SAT/H(s)H development line before the matching internal formulation?** Record exposure evidence or lack of it; do not infer influence merely from availability.
8. **Was the outside machinery deliberately imported after encounter?** If yes, mark the import explicitly rather than calling it convergence.
9. **What remains different?** Record mismatches, extra assumptions, missing dependencies, different mechanisms, or different predicted roles.
10. **What is the narrowest defensible status?** Prefer a bounded classification over a broad novelty claim.

#### B. Convergence classifications

Use these as descriptive statuses, not prestige rankings:

- `NOT_SAT_HSH` — related topic or vocabulary, but the construction is materially different.
- `SHARED_INGREDIENT` — common standard ingredient only; insufficient for convergence at the compound level.
- `STRUCTURALLY_RELATED` — meaningful shared architecture, but substantial dependency/mechanism differences remain.
- `NEAR_STRUCTURAL_MATCH` — most of the relevant construction aligns, with identifiable nontrivial differences.
- `STRUCTURALLY_IDENTICAL` — same relevant construction/dependency structure to the resolution being audited, regardless of terminology or interpretation.
- `EXTERNAL_ANTECEDENT` — sufficiently specific external formulation demonstrably predates the relevant SAT/H(s)H formulation.
- `INDEPENDENT_CONVERGENCE` — sufficiently specific match, independently developed on both sides to the best available evidence, with no demonstrated transfer explaining the overlap.
- `SAT_HSH_EARLIER_PUBLIC_FORMULATION` — SAT/H(s)H has a sourceable earlier public formulation of the specific compound being compared; this is a chronology finding, not by itself proof of influence or scientific correctness.
- `DELIBERATE_IMPORT` — external machinery knowingly incorporated after encounter; preserve exactly what was imported and what HsH-specific construction was added.
- `UNRESOLVED` — evidence insufficient, chronology ambiguous, ancestry incomplete, or comparison not yet specific enough.

A single comparison may need more than one orthogonal field—for example `NEAR_STRUCTURAL_MATCH` + chronology=`EXTERNAL_ANTECEDENT`—rather than forcing all judgments into one label.

#### C. Ancestry tracing

For significant convergent work, construct two distinct ancestry chains:

- **cited ancestry** — sources the external authors explicitly cite or acknowledge as antecedents;
- **audited ancestry** — older relevant antecedents found independently during the review.

Do not silently merge these. The difference can matter for both historical interpretation and priority.

Trace ancestry until one of these stopping conditions is reached:

- the remaining ancestor contributes only a generic/standard ingredient;
- the specific compound under comparison disappears;
- the chain reaches a clearly documented origin for the relevant construction;
- evidence becomes too weak to continue responsibly.

#### D. Independence / influence discipline

Do not call something "independent convergence" merely because there is no citation between two papers.

Record available evidence bearing on transfer or independence, including:

- date of internal SAT/H(s)H formulation;
- date of public SAT/H(s)H availability;
- external publication/preprint/revision dates;
- known research scans and ingestion dates;
- archive evidence of when an external source first entered project awareness;
- explicit citations or mentions;
- public-exposure records where relevant;
- absence of evidence, clearly labeled as absence rather than proof.

Use `INDEPENDENT_CONVERGENCE` only when the available chronology and exposure record make independent development the best-supported account. Otherwise use `UNRESOLVED` or a narrower structural label.

#### E. Originality discipline

Do not award originality for generic ingredients such as worldlines, topology, holonomy, braids, emergence, extended objects, geometric mass, toroidal forms, etc.

Potential originality belongs, if anywhere, at the level of a sufficiently specific:

- compound construction;
- dependency order;
- transformation rule;
- mathematical relation;
- combination of mechanisms;
- use of a standard object in a distinctly specified role;
- empirical/quantitative consequence.

For each candidate original contribution, explicitly state what narrower antecedents do and do not contain.

#### F. Convergence ledger fields

Create/maintain a durable convergence audit surface with at least:

- stable comparison ID;
- SAT/H(s)H construction name;
- exact internal source(s) and dates;
- SAT/H(s)H first-public source/date when known;
- external work/source/version/date;
- Chicago citation;
- external quoted/summarized construction;
- cited ancestry;
- audited ancestry;
- structural overlap;
- structural differences;
- chronology relation;
- exposure/influence evidence;
- import status;
- convergence classification;
- originality/priority implication;
- confidence;
- open questions;
- reviewer/date.

Recommended durable destination: `audits/CONVERGENCE_LEDGER.md` plus machine-readable companion data if the ledger becomes large.

### 5. Field-development timeline

Goal: understand how nearby research programmes evolve over time without retrofitting them into HsH.

Actions:

- monitor preprints, publications, revisions, research-news releases, and relevant public technical discussions;
- log first-seen versus first-published versus revised dates distinctly;
- route strong matches into the convergence audit;
- route empirical bounds/measurements into citation/constraint review;
- preserve negative/mismatch findings where they prevent repeated false convergence claims.

Deliverables:

- dated field-development log;
- convergence-candidate queue;
- constraint/empirical candidate queue.

### 6. H(s)H Toolkit digestion

Goal: turn useful private reference literature into explicit, cited mathematical/physical machinery without blurring standard tools into H(s)H inventions.

For each tool capture:

- definition;
- assumptions;
- domain and limits;
- useful equations/objects;
- original-source citation;
- whether it is standard background, comparator, constraint, or deliberate import;
- HsH adaptation, if any, kept visibly separate.

Deliverables:

- source-linked tool cards/index;
- deliberate-import records where applicable.

### 7. Exposure analytics

Goal: understand public availability/reach without treating exposure as proof of influence.

Actions:

- normalize mixed exposure statistics privately;
- distinguish availability, views/listens/downloads, discoverability, and demonstrable citation/interaction;
- use exposure data in independence/priority audits only for the narrow question it can support;
- publish only public-safe summaries/derived results where needed.

Deliverables:

- normalized exposure dataset/report;
- public-safe chronology/exposure summaries.

---

## IV. Immediate implementation sequence

### Phase A — establish shared durable surfaces

1. Keep this dated plan as the common-room programme reference.
2. Add/update `COORDINATION.md` with active lanes and owners as work begins.
3. Use `HANDOFFS.md` for inter-agent transfers.
4. Create `audits/CONVERGENCE_LEDGER.md` when the first concrete convergence comparison is ready to enter; do not populate it with vague candidates merely to create volume.
5. Decide whether a machine-readable convergence companion (`.json`/`.jsonl`) is warranted once repeated comparisons reveal the stable schema.

### Phase B — establish baselines before making priority claims

1. Identify the best-supported dated SAT/H(s)H internal provenance for each candidate construction.
2. Identify the first public SAT/H(s)H appearance separately.
3. Build exact external source/version/date records.
4. Trace cited and audited ancestry.
5. Record known project-awareness/exposure dates for the external source.
6. Only then assign convergence and chronology statuses.

### Phase C — first audit tranche

Prioritize candidates that are both:

- structurally close enough to matter; and
- chronologically informative enough to change our understanding of originality, independent development, or import history.

Avoid spending early effort on superficial vocabulary matches.

For each completed comparison, produce a compact public-facing finding that says:

- what SAT/H(s)H specifically contains;
- what the external work specifically contains;
- how close the structures are;
- which came first by the available record;
- whether influence/import is evidenced;
- what remains original/different/unresolved.

### Phase D — integrate results

Promote completed findings to the appropriate destinations:

- provenance/chronology → timeline/crosswalk/index surfaces;
- external support/prior art → citation ledger + Chicago citation;
- mathematical imports → Toolkit/formalization dependency record;
- convergence/priority → convergence audit;
- current-theory consequences → synthesis only after separate theoretical review.

---

## V. Quality-control rules

1. Search/index silence is not evidence of absence.
2. Titles and folder labels are routing hints, not semantic verdicts.
3. Later terminology must not be retroactively imposed on earlier sources without showing the structural equivalence.
4. A structural resemblance is not automatically ancestry, influence, or identity.
5. A chronological lead is not automatically originality; older antecedents may still exist.
6. A public chronological lead is not evidence that later researchers were influenced by SAT/H(s)H.
7. Lack of a citation is not proof of independent development.
8. A private HSH_RESOURCES path is never the sole public support for a claim.
9. Quotations, summaries, citations, and derived analyses must preserve enough source identity to be independently checked.
10. Negative results and material mismatches should be logged when they close a plausible convergence path.
11. `UNRESOLVED` is a valid result.
12. All originality/priority findings remain revisable if earlier or more specific antecedents are discovered.

---

## VI. Working objective

The practical target is a record from which a reader can answer, for any important SAT/H(s)H construction:

> What specifically is SAT/H(s)H here? Where and when did it develop? What outside work is genuinely the same, nearly the same, merely related, or different? What ancestry does that outside work claim and what ancestry can independently be documented? Which elements were imported, which were externally anteceded, which appear independently convergent, and which remain defensibly original at the present state of the evidence?

The answer should be reconstructible from public provenance links plus ordinary original-source citations, without requiring access to the private HSH_RESOURCES repository.
