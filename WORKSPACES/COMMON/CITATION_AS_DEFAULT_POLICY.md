# Citation as Default

**Status:** PROJECT-WIDE CONTROL / NATHAN-DIRECT PRIORITY  
**Effective:** 2026-09-21  
**Purpose:** make source identity and claim provenance ordinary working syntax rather than end-stage bibliography repair.

## Default rule

When a statement, equation, definition, numerical value, historical claim, imported method, or interpretation materially depends on a source, **cite it where it is used**.

Citation is not decoration and is not an assertion that the cited source is correct. It records the ancestry of the claim/object so correctness, interpretation, priority, and adaptation can be audited separately.

This policy works together with:

- `NONNEGOTIABLE_SYMBOL_MANAGEMENT.md`
- `terminology/SYMBOL_REGISTRY.md`
- `TOOLBOX_INGESTION_NAMESPACE_PRIORITY.md`
- `terminology/TOOLBOX_NAMESPACE_LEDGER.md`
- the project's existing provenance and exposure controls.

---

## 1. Cite the right layer

Distinguish at least:

- **SRC** — underlying external source for a mathematical/physical result or definition;
- **PROV** — project provenance: Nathan message, historical SAT document, conversation, toolbox, notebook, worker artifact;
- **DER** — project derivation/calculation that establishes a result internally;
- **DATA** — empirical/reference dataset or standard constant source;
- **DEC** — project decision/adoption record when a formalism has been accepted, adapted, deferred, or rejected for a particular job.

One sentence/equation may need more than one layer.

Example logic:

> `BV push-forward` has definition/result X. `[SRC:...]`  
> SAT26 proposed using it for projection job Y. `[PROV:...]`  
> Current H(s)H adopts/adapts/defers that use. `[DEC:...]`

Do not collapse these into one citation.

---

## 2. Microcite: compact working citation syntax

For conversation, solver notes, tables, and dense mathematical work, use a compact inline **microcite** when a full bibliographic citation would disrupt the flow.

Canonical form:

`⟦TYPE:KEY·LOC⟧`

Examples:

- `⟦SRC:Arnold1989·§8⟧`
- `⟦SRC:arXiv:0712.0108·eq.12⟧`
- `⟦PROV:HSH-TKT·§4⟧`
- `⟦PROV:SAT26-VET·θ₄⟧`
- `⟦DATA:CODATA22·ħ⟧`
- `⟦DEC:TBOX:SO4·2026-09-21⟧`

For an exact repository artifact when line-addressing exists:

`⟦PROV:<short-key>·L12–18⟧`

The typography may be rendered small/subtle by presentation layers when supported, but **semantic compactness must not depend on font size**. Plain text must remain readable and searchable.

Do not use ambiguous bare superscript numbers as the only working citation system; they lose meaning when excerpts are copied or reordered.

---

## 3. Every microcite must resolve

A microcite is a display shorthand, not a replacement for bibliographic metadata.

Its `KEY` must resolve to a durable source record carrying enough information to recover the source. Preferred fields:

- author(s)
- title
- year/date
- publication/venue where applicable
- DOI, arXiv ID, ISBN, stable URL, repository path, conversation/message ID, or other stable identifier
- version/edition when relevant
- exact section/page/equation/theorem/line locator when material
- access/exposure/provenance notes where required

A future machine-readable citation registry may mirror the human-readable records. Until then, the toolbox namespace ledger and appropriate provenance/bibliography surfaces are valid resolvers.

---

## 4. Citation follows the proposition

Place the microcite immediately after the claim/equation/object it supports when practical.

Prefer:

`SO(4)` has six independent coordinate-plane rotation generators. `⟦SRC:...⟧`

rather than a detached bibliography whose relationship to individual claims is unclear.

For a multi-step derivation, cite the imported premise/theorem where it enters; the project's subsequent algebra should be marked as project derivation rather than repeatedly attributed to the source.

---

## 5. Underlying source beats toolbox summary

The toolbox tells us **that the project considered something**. It does not establish the external mathematics.

Therefore:

- cite the toolbox/archive for project genealogy;
- cite the underlying paper/book/standard for the imported mathematical result;
- cite the current decision record for the project's use of that result.

If the underlying source cannot yet be found, write `SOURCE-UNRESOLVED` or use only the provenance citation. Do not fabricate or guess the bibliography.

---

## 6. Prefer primary and authoritative sources

Default hierarchy when practical:

1. original/primary paper for a named result or construction;
2. authoritative monograph, standard, or official reference for established machinery;
3. high-quality review when it provides the clearest mature formulation;
4. secondary exposition only when needed for explanation or source recovery.

Use a secondary source when it genuinely supports the claim better, but do not erase primary-source priority/genealogy when that matters.

For standards/constants/data, prefer the responsible standards body or primary dataset.

---

## 7. Citation is not validation

A citation establishes a source relationship. It does **not** establish:

- that the source is correct;
- that SAT/H(s)H's interpretation is correct;
- that a formalism applies under current assumptions;
- that a result was independently derived here;
- that two same-looking equations have the same semantics;
- novelty or priority beyond what has actually been checked.

Those remain separate verification questions.

---

## 8. Equations and symbol definitions

When an equation is imported or adapted, record:

- source equation/theorem locator;
- source notation;
- project notation;
- every nontrivial symbol mapping;
- assumptions/normalization/sign convention;
- whether the equation is copied, algebraically transformed, specialized, generalized, or merely analogous.

If symbol renaming occurs, use the symbol registry and preserve the original notation in the ingestion/adaptation record.

---

## 9. Conversations and direct Nathan provenance

For Nathan-direct decisions, corrections, or conceptual claims that materially affect project state, use the established directive/provenance surfaces and exact message IDs when available.

In ordinary working conversation, a compact provenance microcite may be used once the raw conversation/message identity is available, e.g.:

`⟦PROV:ND:<conversation-short-id>·<message-short-id>⟧`

Until then, `PENDING RAW-ID BACKFILL` remains preferable to inventing an identifier.

---

## 10. Public-facing work

Microcites are allowed as working notation, but public papers/pages should expose resolvable conventional citations or bibliography entries as well. A reader must not need internal project knowledge to identify a source.

The website/document formatter may render microcites as unobtrusive superscript-style links/popovers if it preserves copy/paste/search accessibility and a visible fallback.

---

## 11. Adoption gate for imported mathematics

An imported object should not reach `ADOPT` or `ADAPT` in the toolbox ledger unless:

1. its mathematical identity is clear;
2. its source is verified sufficiently for the claimed use;
3. relevant symbols are namespaced/collision-checked;
4. assumptions and conventions are recorded;
5. its proposed project job is explicit;
6. adaptation, if any, is visible rather than silently attributed to the source.

Exceptions for utterly routine algebra/calculus notation should be used sensibly; the goal is provenance at the points where ancestry matters, not a citation after every plus sign.

---

## 12. Cultural default

Beginning now, workers should tend toward **citation by construction**:

- discover source → record source key;
- import object → namespace it;
- use object → microcite it;
- adapt object → cite source + adaptation/decision;
- derive result → distinguish imported premises from internal steps;
- publish → expand resolvers into conventional bibliography.

The desired endpoint is that uncited imported machinery looks unfinished in the same way an undefined symbol now looks unfinished.

---

## 13. User-facing file references must be linked

**Nathan Direct, 2026-09-21 — standing all-worker rule.**

Whenever a worker references a specific file/artifact in a user-facing message, provide a usable link to that file alongside the first reference whenever a link exists or can be resolved. A bare repository path or filename is not sufficient by itself.

- Repository file → provide its direct repository/blob link.
- Generated conversation artifact → provide the valid sandbox/download link only after the exact path is established.
- Library/connector file → provide the connector/file navigation link or supported file reference when available.
- If no direct file link is presently resolvable, say so explicitly and provide the nearest usable navigable parent/folder/source pointer rather than inventing a link.
- Internal durable-state documents may still use paths/keys compactly; the mandatory-link rule applies when workers surface those files to Nathan or another user.

Citation and linking are complementary: a citation establishes evidentiary ancestry; the link makes the referenced artifact directly reachable.