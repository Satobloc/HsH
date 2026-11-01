# Enheduanna line-138 edition surfaces and witness-identity gate

**Status:** source-critical addendum; no historical-authorship conclusion, no physical-theory claim, no manuscript revision.

## 1. Three editorial surfaces are not three witnesses

The same passage is represented differently across three editorial surfaces:

| Source | Line label | Surface reading |
|---|---:|---|
| Sophus Helle, *The First Authors* (PhD thesis, 2020), p. 273 | 138 | `ma-ra-du₂` |
| Helle, *The Exaltation of Inana* (online PDF, 2022), p. 47 | 138 | `ma-ra-du₂-ud` |
| CDLI Q000623 composite, P478852 | 139 | `ma-ra-du11` |

These are edition/composite readings, not three physical manuscripts. Their line-numbering schemes must remain attached to each surface. The Helle 2020 and 2022 texts are by the same author and both refer to Paul Delnero's 2006 score transliteration at p. 2101; they are not independent manuscript collations.

Helle 2020 note 138 reports the aggregate distribution: four manuscripts with du11, three with du3, one with du2, and one with du8. Helle 2022 p. 47 repeats the same distribution. The total is nine reported manuscript readings. The descriptive count is separate from the editorial choice of a composite reading.

## 2. Text-critical interpretation is a different relation

Helle 2020 note 138 reports Zgoll's argument for du₂ as the original reading: lectio difficilior, possible influence of a following du11 on other copies, and a parallel to Temple Hymns I.544. Helle also allows that the ambiguity may be intentional. The 2022 presentation condenses the argument around the Temple Hymns parallel.

Temple Hymns I.544 belongs to a different composition. ETCSL presents it as a composite line, not as a single physical tablet. Helle 2020 p. 327 discusses a separate set of four manuscripts (A, B, O, Q) preserving the end of hymn 42. Those are not the nine Exaltation line-138 readings.

The edge from Exaltation line 138 to Temple Hymns line 544 is therefore an **interpretive/semantic parallel**, not a shared-witness, manuscript-identity, or transmission-dependency edge.

## 3. Physical witness observations remain separate

- CDLI P464307 is a physical Old Babylonian tablet and a witness to composite Q000623. Its reverse column 2, line 3′ is transcribed `im#-ma#-si [...] ma#?-ra-du8`. The terminal du8 is consistent with the reported singleton du8 class, but its identity as the exact manuscript counted in Delnero's aggregate is not established without the score-level mapping.
- CDLI P346195 preserves the line prefix `im#-ma#-an-si im-ma-diri#-[...] nin# UN-gal ma-ra#-[...]`; the terminal sign is not preserved. Calling the entire locus “unpreserved” is too broad.
- The two Enheduana name loci on P346194 and the additional name locus on P464307 are a separate authorial-name evidence family. They must not be counted as line-138 terminal-variant observations.

CDLI's Q000623 page lists 106 witnesses for the composition and reports only one aligned to the current composite. That whole-composition inventory is not the denominator for the nine line-138 variant counts.

## 4. Actual arithmetic and identifiability

The reported counts sum to:

`4 + 3 + 1 + 1 = 9`.

Conditionally treating the nine reported manuscript instances as nine distinct labelled slots, the number of assignments of the four variant classes to those slots that preserve the aggregate counts is:

`9! / (4! 3! 1! 1!) = 2520`.

This is a conditional combinatorial count, not a probability and not a claim that 2520 mappings are equally likely. It shows that the aggregate vector alone does not identify which manuscript has which reading. The full Delnero 2006 score at p. 2101 is required to recover the witness-level mapping.

## 5. Required typed source architecture

The current PR #890 module uses `EditorialSurface` for both editions/composites and physical artifacts. Its `TerminalReadout` combines variant classes, an edition-specific surface string (`du2ud`) and a preservation state (`unpreserved`); it also omits du3.

A source-faithful schema should separate:

- `EditionSurface`: edition, line-numbering system, line reference, exact transliteration.
- `PhysicalWitness`: artifact identifier, collection/accession metadata, physical locus.
- `VariantClass`: du11 | du3 | du2 | du8.
- `PreservationState`: preserved | partially preserved | terminal sign not preserved | unknown.
- `AggregateVariantCount`: source edition, locus, variant, count, population scope.
- `WitnessReading`: named witness, physical locus, variant, exact transcription, source.
- `CrossTextParallel`: source line, target line, interpretive claim, citation.
- `AuthorshipAttribution` and `HistoricalAuthorship`: distinct claim types.

No implicit conversion should exist from an aggregate count to a named witness reading, from an edition surface to a physical witness, from preservation state to variant class, or from cross-text parallel to witness identity/transmission.

## 6. Verification and limits

The current source branch is PR #890, based on PR #870. At the inspected state it is open, draft and unmerged; its head is 64 commits ahead and 6,516 behind current main, and 25 commits ahead of its parent branch. Code Grurple remains active. No branch code was changed in this addendum.

A Lean formalization target is identified for the typed non-inference rules and the conditional 2,520 assignment count, but **no new Lean compilation or theorem claim is made**. Lean/Lake/Elan are not installed in the current runtime; the existing PR's successful workflow run was a synthetic merge-reference build, not a fresh exact-head verification of this addendum.

The full Delnero score was not recovered through the available public repository, the old Penn dissertation URL, or SciSpace. No new tool, dependency, paid service, branch, PR, or manuscript change was introduced.

## 7. Next source gate

Recover Delnero 2006 p. 2101 and map the nine line-138 variant readings to their actual witness sigla. Then reconcile the Helle 2020, Helle 2022 and CDLI composite surfaces with explicit line-numbering and editorial-version records. Only after that should witness-level records be instantiated or the PR #890 type model corrected.

### Public source references

- Sophus Helle, *The First Authors* (PhD thesis, 2020), pp. 273 and 327.
- Sophus Helle, *The Exaltation of Inana* (online PDF, 2022), p. 47: https://enheduana.org/wp-content/uploads/2022/07/exaltation_of_inana-2022.pdf
- Helle's online translation: https://enheduana.org/exaltation/
- Paul Delnero, *Variation in Sumerian Literary Compositions* (PhD dissertation, University of Pennsylvania, 2006), p. 2101; bibliographic record: https://repository.upenn.edu/dissertations/AAI3246150/
- CDLI P478852 composite: https://cdli.earth/artifacts/478852
- CDLI P464307: https://cdli.earth/artifacts/464307
- CDLI P346195: https://cdli.earth/artifacts/346195
- CDLI P346194: https://cdli.earth/artifacts/346194
- ETCSL, *The Temple Hymns*, line 544: https://etcsl.orinst.ox.ac.uk/cgi-bin/etcsl.cgi?charenc=gcirc&display=Crit&text=c.4.80.1

This addendum extends existing source/variant work in issue #891 and PR #890; it does not replace or duplicate their prior artifacts.
