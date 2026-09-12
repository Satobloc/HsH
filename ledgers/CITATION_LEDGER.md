# H(s)H Citation Ledger

Status: active scaffold / human-reviewed

Purpose: this is the **theory-side point-of-use ledger** for external sources used in H(s)H synthesis, formalization, audits, tests, or empirical comparison.

It is not a bibliography of everything in `HSH_RESOURCES`. The private source-side bibliography and citation handoff register live in `Satobloc/HSH_RESOURCES`, but this public ledger must remain usable without access to that repository.

The historical/internal development archive remains the public repository:

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25`

## Public/private source boundary

Internal developmental provenance and external reference handling follow different routing rules:

- **HsH ↔ SAT_THEORY_ARCHIVE_2023-25:** cross-link bidirectionally when useful for provenance, chronology, derivations, and development history.
- **HSH_RESOURCES:** private/reference-only. Do not make this public ledger or public HsH documents depend on an HSH_RESOURCES URL/path.

When a source discovered or archived in HSH_RESOURCES is used publicly, expose a **Chicago-style citation to the original external source**, an attributed **quotation/extract** with page/location, or a sourced **summary/paraphrase**. For private/raw project data, use an appropriate public-safe extract or summary with provenance.

The private source-side record may retain the exact HSH_RESOURCES path/hash for recovery. The shared `CITE-YYYY-NNN` ID connects that internal recovery record to this public point-of-use record without exposing the private repository as the citation destination.

## Theorybuilding boundary

H(s)H theorybuilding is reconstructed from the project's own Fundamental Intuitions and the internal SAT → SAT-O → 4DHH → Blockwave/Satobloc → H(s)H developmental genealogy.

External literature is used for:

- proper bibliographic credit;
- standard mathematical definitions/results that are explicitly imported;
- empirical data and constraints;
- prior-art / chronology comparison;
- identifying independent rediscovery, extension, or possible synthesis relationships;
- deliberate imports whose provenance is made explicit.

External theories should **not silently become the generative assumptions of H(s)H merely because related literature has been discovered**. When an outside construction is intentionally adopted, distinguish the imported standard result from the H(s)H interpretation and record that dependency here.

## Citation-handoff contract

When any workflow, LLM, reviewer, or synthesis pass determines that an external source should be cited:

1. Create or update a private source-side handoff row in `HSH_RESOURCES/indexes/HUMAN_BIBLIOGRAPHY.md`.
2. Give it a stable handoff ID of the form `CITE-YYYY-NNN` (year = handoff year, not publication year).
3. On the private side, record the exact HSH_RESOURCES source path/hash needed to recover the archived copy.
4. Record the exact HsH destination path and, when possible, section/claim/equation anchor.
5. Mirror the same handoff ID in this public ledger.
6. Here, record the **original public source identity/citation** (authors/title/year plus DOI, arXiv ID, journal, dataset identifier, or other stable external locator as appropriate), not the private resource URL.
7. Keep the role of the citation explicit: `STD`, `EMPIRICAL`, `PRIOR_ART`, `COMPARISON`, `CONSTRAINT`, or `DELIBERATE_IMPORT`.
8. Mark the lifecycle state: `NEEDED`, `PLACED`, `VERIFIED`, `REJECTED`, or `SUPERSEDED`.
9. For `VERIFIED`, record the exact page/section/equation/figure or other support location checked against the HsH statement.

A citation is not complete merely because the paper exists in HSH_RESOURCES or appears in its bibliography. `VERIFIED` means the source was checked against the actual statement at the HsH point of use.

## Active citation handoffs

| Handoff ID | HsH point of use | Claim / equation / reason | Citation role | Public source / Chicago citation | Exact support location | Status | Verification / notes |
|---|---|---|---|---|---|---|---|
| — | — | — | — | — | — | — | Add rows when a real point-of-use citation is identified. Private archived-copy paths stay on the source side. |

## Citation role vocabulary

- `STD` — external standard mathematical/physical definition or established result used as an explicit dependency.
- `EMPIRICAL` — observation, dataset, experimental result, bound, or measurement.
- `PRIOR_ART` — earlier external formulation relevant to historical/novelty comparison.
- `COMPARISON` — useful structural or conceptual comparator without being an H(s)H dependency.
- `CONSTRAINT` — external result used to bound, reject, or test an H(s)H construction.
- `DELIBERATE_IMPORT` — outside formal machinery intentionally incorporated into the construction; this must be especially explicit about what is imported and what remains H(s)H-specific.

## Separation from internal provenance

Internal SAT/H(s)H developmental provenance belongs in source links, chronology/provenance ledgers, derivation records, and archive crosswalks—not in this external citation ledger unless an entry genuinely needs both an internal source and an external citation.

For a synthesis statement that has both:

- cross-link the internal HsH/historical source for **where H(s)H got the statement**, and
- cite the original external source for **standard support, comparison, empirical evidence, or prior art**.

Those are different relationships and should not be collapsed into one generic "source" field.
