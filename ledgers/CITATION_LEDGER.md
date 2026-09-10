# H(s)H Citation Ledger

Status: active scaffold / human-reviewed

Purpose: this is the **theory-side point-of-use ledger** for external sources used in H(s)H synthesis, formalization, audits, tests, or empirical comparison.

It is not a bibliography of everything in `HSH_RESOURCES`. The source-side bibliography and citation handoff register live in the private repository:

- `Satobloc/HSH_RESOURCES/indexes/HUMAN_BIBLIOGRAPHY.md`
- structural/resource coverage: `Satobloc/HSH_RESOURCES/indexes/RESOURCE_INDEX.md`

The historical/internal development archive remains:

- `Satobloc/SAT_THEORY_ARCHIVE_2023-25`

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

1. Create or update a source-side handoff row in `HSH_RESOURCES/indexes/HUMAN_BIBLIOGRAPHY.md`.
2. Give it a stable handoff ID of the form `CITE-YYYY-NNN` (year = handoff year, not publication year).
3. Record the exact HSH_RESOURCES source path.
4. Record the exact HsH destination path and, when possible, section/claim/equation anchor.
5. Mirror the same handoff ID in this ledger.
6. Keep the role of the citation explicit: `STD`, `EMPIRICAL`, `PRIOR_ART`, `COMPARISON`, `CONSTRAINT`, or `DELIBERATE_IMPORT`.
7. Mark the lifecycle state: `NEEDED`, `PLACED`, `VERIFIED`, `REJECTED`, or `SUPERSEDED`.

A citation is not complete merely because the paper exists in HSH_RESOURCES or appears in its bibliography. `VERIFIED` means the source was checked against the actual statement at the HsH point of use.

## Active citation handoffs

| Handoff ID | HsH point of use | Claim / equation / reason | Citation role | HSH_RESOURCES source path | Source-side bibliography pointer | Status | Verification / notes |
|---|---|---|---|---|---|---|---|
| — | — | — | — | — | — | — | Add rows when a real point-of-use citation is identified. |

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

- cite the internal source/developmental provenance for **where H(s)H got the statement**, and
- cite the external source for **standard support, comparison, empirical evidence, or prior art**.

Those are different relationships and should not be collapsed into one generic "source" field.
