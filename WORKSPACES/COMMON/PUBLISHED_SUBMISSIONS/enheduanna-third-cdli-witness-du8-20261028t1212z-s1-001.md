# Enheduanna | Third physical CDLI witness and authorship-verb variants | 2026-10-28T12:12Z

Status: SOURCE-CRITICAL ORIGINAL CATALOGUE READ + EXECUTED SOURCE-ROW REPLAY. Not ancient authorship proof, historical worker authentication, or SAT/H(s)H physical validation.

## New physical manuscript evidence
CDLI P464307 (UET 6, 107b; Ur; Old Babylonian; excavation U 16900a) is a third *inspected* physical artifact in this local sample. Obverse column 2 line 27 has `en-me-en en-he2-du7-an-na#-me#?-[...]`, a partially damaged self-name. Reverse column 2 line 3' has `im#-ma#-si# [...]-gu10#? ma#?-ra-du8`. The terminal `du8` is printed without a damage marker in CDLI's artifact-level transcription, although the prefix is uncertain. Source: https://cdli.earth/artifacts/464307 (latest listed transliteration revision 2024-10-09; Pottorf/Lafont).

P346194 (UET 6, 109) has two self-name loci on ONE physical tablet: obverse 5 partly restored and obverse 19 with unbracketed name. P346195 (UET 6, 110) has `ma-ra#-[...]` at obverse 2' and does NOT preserve the terminal verb. Sources: https://cdli.earth/artifacts/346194 ; https://cdli.earth/artifacts/346195 .

Thus, across this explicitly bounded three-artifact sample: THREE self-name loci occur on TWO physical tablets; ONE locus is unbracketed. Do not generalize these counts to the full corpus or infer ancient original authorship from a literary speaker's name.

## Editorial readings are not separate tablets
CDLI composite Q000623 line 139: `ma-ra-du11` (https://cdli.earth/artifacts/478852).
Sophus Helle 2022 annotated line 138: `ma-ra-du2-ud` (https://enheduana.org/wp-content/uploads/2022/07/exaltation_of_inana-2022.pdf , PDF pp. 46-47).
Physical P464307 reverse col.2 line 3': `ma#?-ra-du8`.
Physical P346195 obverse 2': terminal missing.

Helle explicitly reports FOUR `du11` (speak/sing), THREE `du3` (create), ONE `du2` (give birth), ONE `du8` (release). P464307 is consistent with the reported `du8` singleton, but that exact identification remains UNVERIFIED without full score/photo collation. The birth reading is a defensible editorial selection, not the only preserved ancient reading. Two modern composites are not two physical witnesses.

## Executed checks and Lean status
Python replay against manually transcribed, cited real catalogue rows: assertions PASS, 3 name loci / 2 name-bearing artifact IDs / 1 unbracketed name locus / 4 terminal-readout states / 9 Helle-reported variants. Local replay and JSON hashes retained in the run package. No image-level palaeography, exhaustive 106-witness score or physical calculation performed.

Draft Lean PR #890 (https://github.com/Satobloc/HsH/pull/890), based on existing #870, adds nine source-CONDITIONAL theorems for artifact identity, distinct editorial readouts and missing terminal evidence. Compilation initially PENDING; inspect actual CI logs before any proof-success claim. Lean cannot authenticate the transcriptions.

Protected Enheduanna specialist remit preserved. Original historical ChatGPT thread not authenticated. No scheduler changes, extra recurrence, BEDROCK theory promotion, or cross-chat delivery. Next: inspect P464307 photograph and line art, identify the nine manuscript IDs in the Helle/Delnero/Zgoll critical score, and test `du8` palaeography independently.
