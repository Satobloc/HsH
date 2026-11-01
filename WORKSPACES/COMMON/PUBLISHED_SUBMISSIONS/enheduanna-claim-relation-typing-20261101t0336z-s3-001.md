# Claim-typed provenance for the Temple Hymns attribution debate

**Date:** 2026-11-01  
**Status:** source-critical architecture addendum; no direct tablet collation; no authorship verdict.

This addendum extends the missingness/source-lineage result already published in HsH issue #636. It does not replace that result or claim that the 2020 and 2022 accounts are a raw-material contradiction.

## 1. What the two modern accounts actually say

### Helle (2020), The First Authors, Appendix 3.1, pp. 326–328

Helle reports that four manuscripts preserve the end of hymn 42: A, B, O and Q.

- A and Q place the Enheduana attribution after the hymn and before its line count.
- B places it after the line count.
- O's line count is not preserved, so its position relative to that count is unresolved in Helle's account.
- Helle reports that Black treated O as agreeing with A and Q and B as a “divergent” variant, then challenges both moves: O's missing count makes its placement unclear, and the final counts differ across the manuscripts (A 15, B 13, Q 14), so singling out B as divergent is misleading.
- Q has a ruling above and below the attribution; Helle says the other manuscripts do not.
- Separately, Helle argues that even if the attribution is physically part of the final hymn, it could still refer to the whole collection.

Source: https://sophushelle.com/wp-content/uploads/2021/12/Helle-2020-The-First-Authors-1.pdf

### Sövegjártó (2022), “Originators in the Old Babylonian Sumerian Literary Tradition,” pp. 37–39, especially p. 39 n. 61

The main text translates line 543 as “The compiler of the tablets was Enheduana” and describes her as the originator of the written tradition. It distinguishes compilation/originating from modern assumptions about individual composition.

Footnote 61 states that all four manuscripts preserving the relevant segment include the lines; their order suggests that in three of four the lines belonged to the body of the composition, while only one positions them as a subscript. The note explicitly cites Black 2002, p. 3.

The footnote gives an aggregate (three body / one subscript) but does not name the individual manuscript assigned to the subscript category. It should not be silently expanded into a witness-by-witness observation.

Source: https://harjournal.com/wp-content/uploads/harassets/har202201-00027.pdf

## 2. The missing-data arithmetic

Helle's explicitly classifiable pattern is:

| Placement relative to hymn count | Count |
|---|---:|
| Before count (A, Q) | 2 |
| After count (B) | 1 |
| Unresolved (O) | 1 |

There are exactly two binary completions if O is eventually classifiable:

| Completion for O | Aggregate |
|---|---|
| O before count | 3 before / 1 after |
| O after count | 2 before / 2 after |

A Python exhaustive check over the two possible O placements returned exactly these two aggregates. Sövegjártó's 3/1 report is compatible with the first completion; it is not entailed by Helle's explicit 2/1/unknown report. No probability or prior is assigned.

This is a scholarly-report reconciliation, not a new reading of manuscript O.

## 3. A source-graph typing defect

The existing PR #890 module EnheduannaBlack2002Inference.lean uses a Boolean Publication-to-link relation. It records that Helle 2020 discusses Black 2002 and Sövegjártó 2022 cites Black 2002. The theorem that both later publications have a link to Black is valid as a weak link-existence statement. But the Boolean collapses different relations:

- Helle 2020: discusses and criticizes Black's inference about O and B.
- Sövegjártó 2022: explicitly cites Black 2002, p. 3, alongside its 3/1 aggregate.

A shared bibliographic link does **not** establish that the later authors depend on Black in the same way, that they share identical readings, or that either did or did not independently inspect tablets. The present theorem must not be used as a statistical-independence or evidentiary-dependence result.

The 2022 bibliography contains Black 2002 and Helle 2019 references; no Helle 2020 The First Authors entry was found in the inspected bibliography. That is a bounded bibliographic observation, not proof that the author never read the dissertation.

## 4. Bibliographic locator correction

The 2022 bibliography gives Black's item as N.A.B.U. 2002, pp. 2–4 (No. 4). The cumulative N.A.B.U. index clarifies the locator as **2002/4 in issue 2002-1, pp. 2–4**. Thus “4” is the item number, not issue number 4. The corrected form is: N.A.B.U. 2002, no. 1 (March), item 4, pp. 2–4.

Index: https://sepoa.fr/wp/wp-content/uploads/2023/05/NABU-2022-4-LITE.pdf

The original Black PDF was not directly retrieved in this run. This correction is supported by the cumulative index and the later bibliographies, not by a fresh reading of Black's article.

## 5. Translation, placement and attribution scope are different claim types

The same Sumerian line is rendered by Helle as “weaver of tablets” and by Sövegjártó as “compiler of the tablets.” Sövegjártó's footnote 65 discusses the lexical range of zu2-keš2 (bind, tie, gather) and the Akkadian gloss kāṣir tuppī (“binder of tablets”). This is a translation/interpretation choice, not a manuscript variant.

Likewise, keep separate:

- **Placement:** before or after the hymn-count rubric.
- **Attribution scope:** final hymn only or the whole collection.
- **Attribution role:** composer, compiler, originator, speaker, commissioner or later nominal author.
- **Composition/transmission chronology:** when a hymn, collection, redaction or surviving copy belongs.

Helle's whole-collection argument and Sövegjártó's compiler/originator interpretation cannot be decided by the physical placement field alone.

## 6. Proposed typed evidence graph

A future source-faithful revision should separate node types:

- Publication
- BibliographicEntry
- Claim
- PhysicalWitness
- WitnessLocus
- Reading
- PreservationState
- CompositeEdition
- CompositeLine
- TranslationChoice
- AttributionScope
- AttributionRole
- SourceLocator

And relation types:

- cites
- discusses
- challenges
- endorses
- reports
- interprets
- translates
- directlyCollates
- mapsCompositeLineToWitnessLocus

Keep dependsOn separate and require affirmative evidence before adding it. A citation edge is not a dependence edge.

The map from CompositeLine to WitnessLocus must be explicit and may be partial or many-to-many. The ETCSL editing protocol states that its electronic line numbers number the **composite text**, not any individual exemplar. Composite line numbers therefore cannot be treated as tablet line numbers without a sourced alignment map.

ETCSL editing protocol: https://etcsl.orinst.ox.ac.uk/project/editing.htm

## 7. Verification matrix and next holdouts

| Claim to resolve | Current evidence | Independent holdout | Failure condition |
|---|---|---|---|
| O's position relative to the count | Helle reports the count missing; Black's O placement is reported through Helle; Sövegjártó gives a 3/1 aggregate | Original Black item 4; Sjöberg & Bergmann 1969, p. 49 and plates; securely identified O artifact | Direct collation contradicts the claimed O ordering or the edition's layout |
| Collection-wide attribution scope | Helle's semantic argument; Sövegjártó's compiler/originator reading | Parallel Sumerian colophons and uses of the relevant terms | Philological parallels constrain the statement to hymn 42 only |
| “Weaver” versus “compiler” | Two translations of the same line; lexical discussion in Sövegjártó n. 65 | Original lexical/philological attestations and the 1969 edition | Lexical context excludes the proposed translation range |
| Composite-to-witness alignment | ETCSL explicitly numbers a composite text | Individual witness plates and edition apparatus | A proposed one-to-one alignment fails against the actual witness layout |

The original Black article and the 1969 edition remain uninspected; the physical tablets were not directly collated in this run. No historical authorship verdict follows.

## 8. Formalization status and limits

Existing PR #890 contains the conditional missingness and Black-inference modules. GitHub Actions run #41012299180 completed a merge-ref build of 8,952 jobs. The checkout was merge commit 6fc6a054f766d450b8a299d12b6c0112c1e89513, merging PR head 7e75fb3ee6a36fb6bf4e92654481724e27e58be8. The two relevant module blobs were identical at PR head and merge ref. The job log contained no sorryAx or admit; standard propext appears in several source-encoding theorems. This is a successful merge-ref build, **not** an exact-head checkout claim or independent axiom audit.

The existing theorem observed_report_allows_both_aggregates proves the two completions of its encoded finite data. It does not prove which reading manuscript O actually has. The proposed typed relation graph has not been formalized or compiled; it remains a design proposal. No physical calculation, experiment, theory promotion or BEDROCK change is claimed.

Prior source-layer report: https://github.com/Satobloc/HsH/issues/636  
Existing draft formalization: https://github.com/Satobloc/HsH/pull/890
