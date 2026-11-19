# Loom source-tagging revalidation and GraphEcho source record

**Run:** h938:s4, 2026-11-19
**Scope:** narrow historical-charter revalidation plus one new external source. This is not Mercer’s global tag-selectivity audit and does not change the canonical tag dictionary.

## Historical Loom charter source

- Conversation: 6aa67478-541c-83e9-b8fa-32d6d575eeb9
- Raw export blob: 6668ca60e451f8737903423727da7f9a430484e1
- Original export path: DEVELOPMENT_FULL_CONVOS/30SEP26_DUMP/26.09.13•26.09.19•Tag Conversation Corpus — raw.json
- User-role messages recovered: 10
- Existing tag-ledger matches: 10/10, lines 29–38 of 2026-11-01-LOOM-TAG-CONVERSATION-CORPUS-CHARTER-01.md
- Missing messages: 0
- Canonical tag additions or rewrites: 0

The ten messages establish the historical remit: source-first corpus tagging; term and definition crosswalks; current definition displayed before historical definition; timeline extraction with date/source provenance; standard-terminology comparison that preserves differences; automated candidate tagging followed by manual curation; and periodic inspection of tag selectivity.

The date/correction chain remains source-scoped. The March 22, 2024 document date, the February 2, 2025 first-public-discussion recollection, and the 2003 notebook-sketch recollection are not collapsed into one event or treated as equally verified. Outer user-role attribution is not extended to embedded quotations without separate span provenance.

## Tag-selectivity assessment

The existing ledger already distinguishes:
- archive speaker/role attribution;
- current versus historical definition;
- glossary and standard-terminology crosswalk;
- timeline/date correction;
- source-status and provenance;
- candidate extraction versus manual curation.

All ten source messages were already represented. No duplicate tags were added. The current ledger’s open-vocabulary approach is retained, but new source-local tags below are not promoted to the global dictionary. Mercer remains the precision/selectivity QA owner.

## New external source record

- Source: Sikun Wang, Yixi Zhou, Lei Fan, and Fan Zhang, “GraphEcho: Structural Redundancy and Evidence Provenance in LLM Graph Agents,” arXiv:2609.17695v1, 2026-09-15.
- Source class: external arXiv preprint.
- Inspection: original 13-page PDF read; Sections 2–7, tables, appendix, and limitations inspected.
- Independent reproduction: none.
- Code/custom graph dataset: no verifiable author repository or dataset link found in the PDF or bounded GitHub search.
- Tags proposed for this source only: PATH-MULTIPLICITY; ORIGIN-LABEL-MULTIPLICITY; SOURCE-ID-NOT-INDEPENDENCE; ACQUISITION-VS-JUDGMENT; STOPPING-UNDER-UNSEEN-EVIDENCE; MATCHED-EVIDENCE-CONTROL.

## Crosswalk candidate

| Current operational term | Current definition | Historical/source term | Relation type | Guard |
|---|---|---|---|---|
| Path multiplicity | Number of traversal paths | N_path | Exact notation match | Not a source count |
| Provenance-label multiplicity | Number of distinct labels reached by paths | N_prov | Exact notation match | Not independent-source count |
| Document ID | Observable document-level identifier | Source/provenance ID | Proxy | Does not prove independent study origin |
| Source recall | Acquired distinct labels / graph-reachable labels | USR | Exact metric mapping | Only independent-witness recall after lineage adjudication |
| Echo-walk rate | Repeated evidence-bearing visits / all walk attempts | EWR | Exact metric mapping | Not accuracy or evidence quality |
| Matched evidence | Identical evidence set supplied before judgment | Matched-evidence condition | Experimental control | Not free-retrieval performance |

A future glossary record should preserve the original user-requested display order: current definition first, historical definition second, then standard-reference crosswalk, with relation type and source/date locators. This is a schema recommendation, not a deployed popup or glossary UI.

## Status

This addendum does not modify the original ten-message ledger, user-role source, global tag dictionary, BEDROCK, SAT-O/Blockwave equations, Orson P1, or any paper gate.


## Amendment 01 — historical Loom conversation ID correction (H946:S2, 2026-11-19)

The original raw export was fetched by immutable blob and parsed. Its embedded conversation ID is `6aa67478-541c-83e9-b8fa-32d6d575eeb9`; the earlier value `6aa67478-0e14-4b7c-89ab-6c01ecb36c3a` was a transcription error. Raw blob SHA-1 `6668ca60e451f8737903423727da7f9a430484e1`, both duplicate paths, all ten user-message IDs, the 10/10 tag-ledger set match, and the historical remit remain unchanged. This amendment supersedes only the conversation-ID field in the original revalidation entry. See [H946:S2 correction report](../../LOOM/2026-11-19T1024Z_H946_S2_SOURCE_IDENTITY_CORRECTION_AND_CHRONOLOGY.md) and [publisher issue #2087](https://github.com/Satobloc/HsH/issues/2087). No global tag dictionary change; Mercer retains global precision/selectivity QA ownership.
