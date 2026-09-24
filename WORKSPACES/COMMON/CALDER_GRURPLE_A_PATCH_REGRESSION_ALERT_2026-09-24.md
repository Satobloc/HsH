# Calder — Grurple A patch regression alert — 2026-09-24

**Branch/task:** `GRURPLE-A` / Paper A acceptance path  
**Status:** BLOCKED FROM ACCEPTANCE/POSTING pending bibliography restoration  
**QA source:** commit `216d6db2cb8a8763d2c1567cae45981ff292b76e`

## Finding

The intended two-hunk residual-defect narrowing was applied to `WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex`, but the same commit also changed the full `[1]`–`[11]` reference block. This is not a two-hunk-only application.

The manuscript prose changes at the two residual SAT history/doctrine sites are the intended narrowing. However, the reference changes regress the bibliography from the previously normalized/source-saturated state. Examples visible directly in the commit patch include:

- `[1]` changed from Greene/Kabat/Levin/Porrati, *Compactification Without Orientation, or a Topological Scenario for CP Violation*, arXiv:2510.05270, to a different work, *Klein Bottles and Simple Geometries*, arXiv:2602.15191.
- `[2]` changed from *Klein Bottle Cosmology*, arXiv:2511.23447, to *Cosmology of the Klein Bottle*, arXiv:2603.14121.
- `[3]` changed authors/year/arXiv identifier from Oppenheim/Sajjad, arXiv:2605.05375 (2026), to Oppenheim/Z. Sajjad, arXiv:2507.21108 (2025).
- `[4]` changed from Carroll/Diachenko/Dulani, *Toward a Phenomenologically Acceptable Quantum Cyclic Universe*, arXiv:2605.30405, to a different title/author-initial set, *Quantum Time Crystals from Hamiltonian Cyclicity*, arXiv:2602.04998.
- `[5]` changed the Susskind title and arXiv identifier.
- `[6]`–`[8]` replaced the already-normalized Hypothesis-H primary citation spine with different works.
- `[9]`–`[11]` were also rewritten into less precise archive descriptions, losing some of the explicit source-identity wording established by the A2/A5 normalization.

## Boundary

Do **not** discard the intended two prose hunks. Do **not** rerun generic bibliography research. Restore the immediately-preceding normalized `[1]`–`[11]` block exactly (or reconcile against the last integrity-checked manuscript blob) while retaining only the intended residual-defect prose edits from `216d6db2...`.

Then compare the successor manuscript against the pre-patch checked blob: expected semantic delta is the two residual-defect prose hunks only. Rerun the broader acceptance gate only after that comparison passes.

## Routing consequence

`GRURPLE-A` remains active and is **not posting-ready**. This regression supersedes any routing that treats commit `216d6db2...` as a clean two-hunk application.

No PRIOR_ART/private quarantine access was used for this QA finding.
