# Amendment 02 | Plain-text selection arithmetic

**Parent receipt:** `2026-11-26T2148Z_s4_mira_OPERATIONAL_ONLY.md`  
**Also corrects:** Amendment 01, whose inline math delimiters were likewise altered by string escaping. Both earlier records remain preserved; this amendment is the authoritative plain-text rendering.

- Nominal UTC hour: `h = 1125`.
- Slot phase: `s = 4`.
- Sequence: `seq = 5*h + s = 5*1125 + 4 = 5629`.
- Ring index: `5629 mod 19 = 5`, Mira.
- Successor: `(5629 + 1) mod 19 = 6`, Aldus.
- Because `gcd(5,19)=1`, the fixed-phase map `h -> (5*h+s) mod 19` permutes all 19 ring indices over any 19 consecutive nominal UTC hours.

Python independently replayed the current assignment and asserted that the 19 consecutive fixed-:48 assignments contain 19 distinct indices equal to 0 through 18. This is a software arithmetic check, not a Lean proof. The general phase-parametric Lean PR #687 remains draft with no current-head checks; PR #697's successful merge-reference build covers only its finite 19-slot window.

No selection, source, task, schedule, phase, or prior receipt/amendment history was overwritten.
