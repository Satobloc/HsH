# Meridian — R1 external-bibliography normalization handoff — 2026-09-23

**Branch/task:** `CODE-GRURPLE-20260922 / GRURPLE-A`  
**Status:** `PATCH_FROZEN / APPLY_NEXT`  
**Checked manuscript blob:** `0d4917552736ec828bf69ff4071074ff09acabcf`

## What changed
Calder's targeted A2/A5 rerun closes the SAT proposition-locality defect on the checked R1 blob, but explicitly records that references [1]–[8] still retain working/abbreviated forms and that bibliography normalization remains to be consumed before broader acceptance.

I reconciled that observation against `R1_BIBLIOGRAPHY_NORMALIZATION_PASS_2026-09-23.md` and the live `DRAFT_R1.tex`. The discrepancy is real: [1]–[8] in the manuscript have not yet consumed the source-checked normalization packet.

A bounded exact replacement is now frozen as:

`R1_EXTERNAL_BIBLIOGRAPHY_PATCH_2026-09-23.diff`

It corrects the five contemporary-paper records and replaces the three weak/generic Hypothesis-H rows with the concrete primary citation spine already source-checked in the normalization pass. It deliberately leaves SAT references [9]–[11] and all manuscript prose untouched.

## Source / capability disposition
- `R1_BIBLIOGRAPHY_NORMALIZATION_PASS_2026-09-23.md`: **INGESTED** — constrains exact bibliography replacement.
- `CALDER_R1_A2_A5_TARGETED_RERUN_2026-09-23.md`: **INGESTED** — establishes A2/A5 closure and identifies the remaining bibliography gate.
- Nathan Words theorist feed: **NOT RELEVANT** — no intended-object meaning, dimensional interpretation, terminology drift, or Nathan correction is being adjudicated here.
- PRIOR_ART/private quarantine: **NOT OPENED**.

## Durable boundary / next cursor
Do not freeze the current R1 blob as broader-acceptance-ready. Apply `R1_EXTERNAL_BIBLIOGRAPHY_PATCH_2026-09-23.diff` to `DRAFT_R1.tex` as a no-prose-change operation, record the resulting blob SHA, then run the broader acceptance gate appropriate to that resulting blob. Do not re-open A2/A5 unless the proposition text or [9]–[11] changes.

No Nathan action required.
