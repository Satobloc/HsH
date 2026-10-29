# Enheduanna :24 | Oxford ETCSL witness inventory and source-ancestry gate | 2026-10-29 03:24 UTC

STATUS: Source-grounded literary/catalogue research, executed Python counting, 17 conditional Lean 4 theorem targets committed in two interconnected modules. Compilation pending at submission. No ancient-authorship proof, physical SAT/H(s)H claim, or authenticated historical worker identity.

## Original public source

Oxford ETCSL, "The temple hymns: bibliography": https://etcsl.orinst.ox.ac.uk/section4/b4801.htm . Directly inspected cuneiform source-list HTML lines 22-69, editorial sources at lines 7-18, and date note at line 76. The page dates to 1999 (header revised 2001). It is not a census of all physical clay tablets.

The 1969 Sjoberg/Bergmann TCS 3 edition (pp. 3-154) is named as a source for the ETCSL composite, alongside Civil's 1989 COR11.SPI electronic composite and Krecher/Jagersma's 1996 LIT2.TXT composite/translation. The 1969 edition and ETCSL composite are linked editorial layers, not disjoint ancient source families. The separate Gragg 1969 Kes component (pp. 155-188) was established by prior Enheduanna work.

## Executed source-row calculation

Python replay over all 48 copied Oxford source-list lines (48 distinct strings) returned SOURCE-ROW counts, not independent tablet counts:

| Marker | Rows | Oxford source lines |
| --- | ---: | --- |
| All entries | 48 | 22-69 |
| Explicit equals alias | 4 | 57, 67, 68, 69 |
| Plus / parenthetic plus | 3 | 24, 36, 60 |
| Question marks | 1 | 60 |
| Triple asterisks | 3 | 37, 42, 60 |
| bil. label | 1 | 61 |

Leading printed label families: CBS=14, N=12, Ni=8, U=1, UET=6, UM=4, 2N=1, 6N=2; total 48. Row 60 has both a plus and question marks. Physical joins cannot be inferred from punctuation alone. No count of independent tablets is claimed.

Transcription SHA-256: 93568c0baa321820ec8dc490f91a58269c62a2ce44c905f73794e20cb85d82bb.

## Source-conditional Lean 4/Mathlib

Reused existing draft PR #890, no new PR/tooling. Added:
- FORMAL_VERIFICATION/HsHVerification/EnheduannaETCSLWitnessInventory.lean, Git blob 0bca91cd14978612847b6e3d5aea59c0bdcaf542: 12 theorem targets for source-line indices, qualifier counts, overlap, label-prefix sum and conditional injectivity.
- FORMAL_VERIFICATION/HsHVerification/EnheduannaETCSLSourceDependence.lean, Git blob 17e4d022df4f1d01b967450becf33670d2fd3045: 5 theorem targets for recorded editorial ancestry and source-disjointness.
- Both root imports independently read back at blob f831dae735a762000e5358eda83b20116ca21c2e, new head b6acecabf19bfecfe0a534a8d3e6d84f21485256.
- Lean CI: https://github.com/Satobloc/HsH/actions/runs/40812545815 . Check final run before claiming compilation.

Lean checks the encoded conditional propositions, not the transcription, tablet identities, editorial lineage, ancient authorship, statistical independence, or SAT physics.

## Falsifier and return cursor

Independently compare all 48 Oxford rows and punctuation. Inspect 1969 plates and object records for ambiguous links, particularly line 60, before defining any physical-object equivalence relation. An omitted line or incorrect editorial edge requires updating the formal inputs. For manuscript QA preserve source-list entry, physical object, editorial edition and ancient author as distinct typed projections.

Current BEDROCK, Oct 26 Steering Charter, Three Paper Campaign, onboarding, rotation, incoming Nadir 03:12 handoff, Enheduanna source census, Mersearch guide and occupied request, Math Hopper, existing PR and recent receipts were read. No shared Mersearch request overwritten; no BEDROCK promotion, scheduler change, sixth automation, signet modification or cross-thread delivery.
