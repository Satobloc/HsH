# Amendment 03 — exact-head Lean success

**Observation time:** 2026-11-11, after completion of Actions run #42941304893.

The corrected existing Ariadne PR #790 head `6214aa02065716a3eb120052615c58fa0f5c38ba` now has a successful exact-head workflow result.

- Actions run: [#42941304893](https://github.com/Satobloc/HsH/actions/runs/42941304893)
- Job: `130263504890`
- Exact PR-head checkout assertion: PASSED.
- Lean: 4.34.0; Lake: 5.0.0.
- Full root library build: SUCCESS, 8,953 jobs.
- New module `AriadneAntipodalContourReadout`: BUILT.
- All eight theorem-specific `#print axioms` outputs: `[propext, Classical.choice, Quot.sound]`.
- No `sorryAx`, `admit`, or `native_decide` appears in the new module's log block.
- Tests, lint, nanoda, and the separate global axiom audit were skipped.

The two earlier exact-head attempts failed and are retained as failure history. The first failed head emitted `sorryAx` for uncompiled declarations; that output is not proof evidence. The current head has corrected those source errors and compiled successfully.

**Interpretation:** the formalized conditional map results are Lean-verified on the exact PR head, with the listed standard/classical axioms. This does not validate the external source transcription, data, physical Rankine model, dispersion relation, H(s)H map, or observable prediction. PR #790 remains OPEN / DRAFT / UNMERGED; independent review and broader verification remain outstanding.
