# Tablet O identified: N 4179, Plate XXXI, and the limits of the placement argument

**Run:** 2026-10-30 06:00 UTC  
**Lane:** Enheduanna, source-layer / manuscript-provenance specialty  
**Status:** OBJECT CROSSWALK RECOVERED; ORIGINAL BLACK NOTE READ; PLACEMENT UNRESOLVED; SEMANTIC SCOPE UNRESOLVED; LEAN FORMALIZATION PENDING VERIFICATION

## Executive finding

The previously unassigned manuscript witness O in the 1969 edition of The Collection of the Sumerian Temple Hymns is identified by Sarah Glaz's 2020 Figure 2 caption as **Tablet O = N 4179, Plate XXXI, copied by E. Bergmann S.J.**

The crosswalk is:

- Edition siglum: O.
- Museum number: N 4179.
- 1969 edition: Sjöberg and Bergmann, The Collection of the Sumerian Temple Hymns, TCS III, Plate XXXI.
- CDLI identifier: P279044, CDLI Literary 000750, example 027.
- Collection: Penn Museum, Philadelphia.
- Penn Museum object-page identifier: 572868.
- Separate accession number: not supplied in the CDLI record; its Accession Number field is blank. N 4179 is the museum number, not a separately stated accession number.

CDLI confirms P279044 is the Penn Museum tablet with museum number N 4179 and cites TCS 3, p. 15. CDLI leaves its Witness field blank; the siglum-to-object identification comes from Glaz's caption, not CDLI's witness field. The original 1969 volume was not directly inspected in this run; Plate XXXI was identified through Glaz's published reproduction and cross-checked against CDLI.

## Original Black source recovered

Jeremy A. Black, “En-hedu-ana not the composer of The temple hymns,” appears in N.A.B.U. 2002 no. 1 (March), note 4, printed pp. 2-4. The shorthand “NABU 2002/4” refers to note 4, not the fourth issue. The PDF header identifies the issue as 2002 no. 1 (March).

Black's p. 2 calls the 1969 edition “TCS 1.” This is a probable bibliographic slip: the CDLI publication record identifies the book as TCS 3 / Volume III, and the N 4179 artifact record cites TCS 3, p. 15.

On p. 4 Black prints manuscript O, reverse column ii', lines 16-22. The preserved local sequence is: line 18, Nisaba praise; line 19, the Enheduana attribution; lines 20-22, damaged continuation. Black explicitly states on p. 2 that O's hymn line-count is not preserved. His estimate of 15 lines depends on reconstructing joined lines; it is not a preserved count-rubric position.

## Physical layout around O's attribution

**No horizontal ruling bracketing O's attribution is reported.** Black records explicit rulings for Q only: after line 541 and after line 544. Helle (2020), Appendix 3.1, states that Q has a ruling above and below the authorial note, while the other manuscripts, including O, do not.

For O, the published evidence therefore gives:
- a continuous local sequence from Nisaba praise to the attribution and then damaged lines;
- no reported ruling above or below the attribution;
- no preserved hymn-count line;
- a catalogued left-side fragment, making physical loss of the terminal count plausible, though the exact break path is not reconstructed.

This is a real spatial distinction, but not a decisive placement marker. The absence of a ruling weakens the claim that O visibly isolates the attribution as a subscript; the missing count prevents determining whether it stood before or after the count. The correct status is **placement unresolved**.

## Four-witness layout: direct evidence versus editorial grouping

| Witness | Count / order in Black 2002 | Ruling evidence | Count-position status |
|---|---|---|---|
| A | Attribution 543-544, then count 15; a distinct colophon follows in column vi | No ruling reported around attribution | Before count |
| B | Count 13, then attribution 543-544 | No ruling reported around attribution | After count |
| O | Attribution, then damaged lines 20-22; count not preserved | No ruling reported around attribution | Unresolved |
| Q | Attribution, then count 14 | Rulings after 541 and 544, bracketing the note | Before count |

The directly attested count-position distribution is **2 before / 1 after / 1 unresolved**, not 3 before / 1 after. Black's A/O/Q “majority” grouping concerns the order used for his editorial composite. It does not turn O's missing count into a directly observed before-count placement. A's distinct column-vi colophon must remain separate from the disputed Enheduana-naming lines 543-544.

## Helle and Sövegjártó: source dependence and semantic scope

Helle (2020), The First Authors, Appendix 3.1, pp. 326-328, explicitly challenges the inference that O agrees with A and Q on count placement: O's count is not preserved, so that agreement is far from clear. Helle also notes that Q's ruling above and below the attribution is unlike the other manuscripts. He then makes a separate distinction: even if the attribution is physically part of the final hymn, it could still refer to the whole collection. The Sumerian word dub (“tablet”) needs supporting parallels before being restricted to one hymn or subsection.

Sövegjártó (2022), p. 39 n. 61, summarizes the three-of-four / one-subscript claim and explicitly directs the reader to Black 2002, p. 3. The 3/1 statement is therefore source-dependent on Black, not an independent second collation establishing O's missing count position. This does not prove that Sövegjártó performed no independent inspection; it means the cited support for the numerical placement summary is Black's argument.

The interpretive axes must remain separate:
1. Physical placement: before count, after count, or unresolved.
2. Ruling status: bracketed or no ruling reported.
3. Semantic scope: final hymn only or whole collection.

The physical layout of O does not by itself determine semantic scope. A line can be physically embedded in the final hymn while referring to the collection as a whole.

## Mapping diagram

Black 2002, p. 4:
O, reverse ii', lines 16-22
Nisaba praise (18) -> Enheduana attribution (19) -> damaged continuation (20-22)
count not preserved; no ruling reported.

Glaz 2020, Figure 2:
Tablet O -> N 4179 -> TCS III, Plate XXXI.

CDLI:
P279044 / example 027 -> museum number N 4179 -> Penn Museum object record 572868.
Catalogued as a left-side fragment; accession-number field blank.

Interpretive map:
physical layout -> placement status;
physical layout does not yield a unique semantic scope;
additional philological and formulaic parallels are required.

## Formalization and limits

A source-conditional Lean 4 module was added to existing draft PR #890: FORMAL_VERIFICATION/HsHVerification/EnheduannaOLayoutScopeSeparation.lean.

The module encodes O's reported local sequence, missing count, and “no ruling reported” status. It formalizes the non-identifiability result: two source-discussed semantic scopes can share the same reported physical layout, so no unique scope decoder follows from those layout fields alone.

Branch: research/enheduanna-third-physical-witness-du8-20261028t1212z  
Module commit: 7e75fb3ee6a36fb6bf4e92654481724e27e58be8  
Module blob: 850851f8ee5f3372d4392775375f943f84d8a88c  
Existing PR: #890

The earlier exact-head CI run #40991158494 succeeded on the preceding PR head, but predates this module. The new exact-head run #41012299180 was pending at report preparation. A root-import update was blocked by tool safety checks; no bypass was attempted. Local Lean/Lake are not installed. No successful compilation of the new module is claimed until the new run's actual build and theorem reports confirm it.

A small Python finite-state check confirmed that the two modeled interpretations have identical layout fields and different semantic scopes. This is a model check, not a historical reading or a substitute for Lean compilation. Lean can prove the conditional statement about the encoded model; it cannot establish that the model faithfully represents the clay tablet, that Helle's report is correct, or which historical semantic scope is true.

## Provenance and epistemic ledger

| Item | Status |
|---|---|
| Black 2002 original article and O transliteration | Directly read published source |
| TCS III, 1969 book record | CDLI bibliographic record |
| Plate XXXI / O = N 4179 | Glaz 2020 Figure 2 caption reproducing the 1969 plate |
| N 4179 / P279044 / Penn Museum | CDLI artifact metadata |
| Separate accession number | Not supplied in CDLI record |
| O has no reported ruling | Helle 2020 comparative report |
| O count position | Unresolved |
| 3/1 claim in Sövegjártó | Explicitly cites Black 2002 p. 3 |
| Scope of attribution | Underdetermined by layout alone |
| Nathan Direct view on A/B/O/Q placement | None recovered; no position attributed to Nathan |
| Ancient authorship or editorship | Not established by this layout audit |

## Next research cursor

1. Obtain a direct scan or physical-library inspection of TCS III Plate XXXI and compare the copy with the surviving tablet image; the present identification uses Glaz's published reproduction.
2. Inspect the Penn Museum / CDLI image at sufficient resolution to document the break edge and any physical ruling traces independently, rather than relying solely on Helle's report.
3. Determine whether the left-side fragment's break geometry explains the absent count, without assuming where the missing line would have been.
4. Search independent Sumerian parallels for dub zu2-keš2-da and for authorial statements placed inside the final composition but referring to an entire collection.
5. Keep placement, ruling, count, and semantic scope as separate fields in the witness index.
6. Do not attribute a view on the manuscript debate to Nathan; no Nathan Direct statement on this specific placement question was recovered.

## Sources

1. Jeremy A. Black, “En-hedu-ana not the composer of The temple hymns,” N.A.B.U. 2002 no. 1 (March), note 4, pp. 2-4. Original PDF: https://sepoa.fr/wp/wp-content/uploads/2012/05/2002-1.pdf
2. Åke W. Sjöberg and Eugen Bergmann, The Collection of the Sumerian Temple Hymns, TCS III (1969). CDLI publication record: https://cdli.earth/publications/86653
3. Sarah Glaz, “Enheduanna: Princess, Priestess, Poet, and Mathematician,” The Mathematical Intelligencer 42(2) (2020), 31-46, DOI 10.1007/s00283-019-09914-7. Figure 2 reproduces Plate XXXI and captions Tablet O = N 4179: https://www2.math.uconn.edu/~glaz/My_Articles/EnheduannaPrincessPriestessPoetAndMathematician.MathIntelligencer.2020.pdf
4. CDLI artifact P279044, CDLI Literary 000750, ex. 027: https://cdli.earth/artifacts/279044
5. Sophus Helle, The First Authors (2020), Appendix 3.1, pp. 326-328: https://sophushelle.com/wp-content/uploads/2021/12/Helle-2020-The-First-Authors-1.pdf
6. Szilvia Sövegjártó, “Originators in the Old Babylonian Sumerian Literary Tradition,” Hungarian Assyriological Review 3 (2022), 25-47, especially p. 39 n. 61: https://harjournal.com/wp-content/uploads/harassets/har202201-00027.pdf
7. ETCSL, Temple Hymns bibliography / witness references: https://etcsl.orinst.ox.ac.uk/cgi-bin/etcsl.cgi?text=c.4.80.1&charenc=j

**Disposition:** The physical witness O is identified as N 4179 / CDLI P279044, and its 1969 plate reference is Plate XXXI. The surviving layout has no reported ruling around the attribution and no preserved count; therefore placement remains unresolved. Even a placement decision would not, by itself, determine whether the attribution refers to hymn 42 or the entire collection.
