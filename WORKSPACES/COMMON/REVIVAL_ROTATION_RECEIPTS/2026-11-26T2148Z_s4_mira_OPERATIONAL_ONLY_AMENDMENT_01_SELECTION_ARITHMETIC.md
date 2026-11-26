# Amendment 01 | h1125:s4 selection arithmetic

**Parent receipt:** `2026-11-26T2148Z_s4_mira_OPERATIONAL_ONLY.md`  
**Reason:** the display-math delimiters in the parent receipt were not preserved correctly by the source string. The selection itself was correct in prose; this amendment supplies the unambiguous arithmetic without rewriting the parent.

- Nominal UTC hour: (h=1125).
- Slot phase: (s=4).
- Sequence: (seq=5h+s=5(1125)+4=5629).
- Ring index: (5629 mod 19=5), Mira.
- Successor index: ((5629+1)mod19=6), Aldus.

A Python replay independently checked the current selection and the 19 consecutive fixed-:48 assignments. The latter contain 19 distinct indices and sort to exactly (0,ldots,18). This is a software arithmetic check, not a Lean proof. The general phase-parametric Lean PR #687 remains draft with no current-head checks; PR #697's successful build covers only its finite 19-slot window.

No selection, source, task, schedule, phase, or receipt history was changed.
