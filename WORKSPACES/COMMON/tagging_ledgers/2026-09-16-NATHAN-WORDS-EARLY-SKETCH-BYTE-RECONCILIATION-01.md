# Nathan Words — early-sketch byte reconciliation 01

**Date:** 2026-09-16  
**Lane:** Nathan Direct corpus/provenance  
**Status:** bounded cross-surface source-identity result; no theory authority

## Operation

Follow the next cursor from `2026-09-16-NATHAN-WORDS-EARLY-SKETCH-REPO-CROSSWALK-01.md`: materialize the eight Library image objects corresponding by filename family to the public archive `2003 SKETCHES/` set, compute Git blob SHA-1 from the raw Library bytes (`sha1("blob " + len + NUL + bytes)`), and compare those identities against the current public repository blob IDs and byte sizes.

This is a byte-identity test only. It does not infer authorship, date, visual equivalence, or independent attestation from filenames.

## Result

Three of eight Library objects are byte-identical to the corresponding public repository objects:

| image | Library bytes | computed Library Git blob | public repo bytes | public repo blob | disposition |
|---|---:|---|---:|---|---|
| `Earliest_Surviving_Sketches_2003.png` | 1,045,637 | `98569a05ae95131899d1d3e7115ee41385d9bec4` | 1,045,637 | `98569a05ae95131899d1d3e7115ee41385d9bec4` | BYTE-IDENTICAL |
| `Earliest_Surviving_Sketches_2003_2.png` | 993,465 | `b2faa6bbeb169f14b003e6fb8e5bc14b56ec205e` | 993,465 | `b2faa6bbeb169f14b003e6fb8e5bc14b56ec205e` | BYTE-IDENTICAL |
| `Earliest_Surviving_Sketches_2003_3.png` | 1,010,584 | `ebdd8c7ee6bf719e63e975af790165f51edf075a` | 1,010,584 | `ebdd8c7ee6bf719e63e975af790165f51edf075a` | BYTE-IDENTICAL |
| `Earliest_Surviving_Sketches_2003_4.png` | 1,009,132 | `d4c1412bc3a37555b68078f849938288ba71fbeb` | 1,103,761 | `f922e2ce54b9aa96b871342838b7f59b32459a6d` | NOT BYTE-IDENTICAL |
| `Earliest_Surviving_Sketches_2003_5.png` | 1,033,712 | `9cedf0fa36c8c915a37ea13d41e72cf489ca6712` | 1,116,211 | `79d7e05e7d7d134508c47d58e939bed83fd130e1` | NOT BYTE-IDENTICAL |
| `Earliest_Surviving_Sketches_2003_6.png` | 1,012,598 | `8e4f632777385a85c85294b51be7d9694e5a323d` | 1,012,598 | `8e4f632777385a85c85294b51be7d9694e5a323d` | BYTE-IDENTICAL |
| `Earliest_Surviving_Sketches_Leuchtturm_notebook_2003.png` | 902,260 | `56dafaefdd12a853312ba81381f7f062043cfc42` | 1,070,740 | `134081a421ae3e01029e6264483750a01590c13e` | NOT BYTE-IDENTICAL |
| `Earliest_Surviving_Sketches_Leuchtturm_notebook_No-42_2003.png` | 1,146,610 | `0fe9cad9eb5756d87cb35df5d2668b5ccb1aa74b` | 1,095,696 | `1f09d7f044f9ea7e365e9d66d5c36ef1e241b425` | NOT BYTE-IDENTICAL |

Count: **4/8 byte-identical; 4/8 not byte-identical.**

## Correction to prior crosswalk assumption

The prior crosswalk correctly established a corresponding eight-name family in both surfaces, but byte reconciliation shows that cross-surface correspondence is not uniformly copy identity. Four objects are exact byte copies; four are distinct encodings/files under corresponding names. Therefore the Library/attachment surface and public repository surface must not be globally collapsed as duplicate copies without per-object reconciliation.

This does **not** imply the four nonidentical pairs depict different physical pages/objects. Differences could arise from crop, resize, recompression, metadata, alternate photograph/export, or genuinely different image content. That question remains open until image-level comparison.

## Provenance / duplicate handling

- Exact duplicate handling is now safe for the four matching pairs: count each matching pair as one byte-level artifact manifested on two storage surfaces, while retaining both source paths.
- The four nonmatching pairs remain separate file identities linked only as corresponding-name candidates until visual/content reconciliation.
- No source deleted, renamed, overwritten, or normalized.
- No Nathan wording changed.
- No assistant prose converted into Nathan-authored content.

## Coverage / counts

- Library image objects materialized: 8/8
- public repository directory rechecked: `SAT_THEORY_ARCHIVE_2023-25/2003 SKETCHES/`
- byte-identical cross-surface pairs: 4/8
- non-byte-identical corresponding-name pairs: 4/8
- theory construction: none
- quarantine exposure: none
- bibliography/source-ancestry progress: artifact-source crosswalk refined from name-family correspondence to per-object byte identity
- enrichment/capability: demonstrated deterministic Git-blob reconciliation for Library ↔ GitHub artifact identity

## Unresolved source/context issues

The four non-byte-identical pairs require image-level comparison before deciding whether they are alternate encodings/crops of the same photograph or genuinely distinct photographs/content. The notebook-membership/date interpretation remains bounded by the evidentiary limits already recorded in the earlier ledgers.

## Current frontier / next cursor

One bounded next operation: visually compare **one** non-byte-identical corresponding pair, beginning with `Earliest_Surviving_Sketches_2003_4.png`, and classify only what the pixels support (same photograph transformed / same page different photograph / different content / unresolved). Do not extrapolate that classification to the other three pairs.
