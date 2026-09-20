# Mercer Run 132 — Q-counting audit ancestry recovery

**Date:** 2026-09-20  
**Role:** archive/index/retrieval/provenance/documentation QA  
**Status:** source-identifiable recovery; no theory-validation claim

## Sources / coverage

- Library raw conversation export: `Homes in Cardinal Order — raw.json`
- Conversation title: `Homes in Cardinal Order`
- Conversation UUID: `6a39839c-0d50-83ea-afe2-f8e15a97f76a`
- Exact user message ID carrying the attachment: `4fa4d67f-dd2c-4853-a1e2-ba599413aa81`
- User message create time: `1782170082.3529282`
- User text: `Ok. Consider`
- Attachment identity: `Q COUNTING CONCERNS.pdf`, file id `file_00000000e4b4720ca036a4d181b63c73`, size `80845` bytes.
- Same attachment turn also carried `FULL_THEORY.pdf`, `STANDARD ATOM (nolat).pdf`, `HELIUM STANDARD ATOM.txt`, `H(s)H.txt`, `Orders and Q numbers.pdf`, `FINAL_FINALL-nolattice 2.pdf`, and `STANDARD ATOM.pdf`.

The raw export preserves the file-search parsed text for `Q COUNTING CONCERNS.pdf`, so the previously blocked binary PDF now has a source-identifiable text route without OCR.

## What the recovered audit actually says

The recovered audit explicitly frames the Q discrepancy as **scale-dependent** rather than requiring one unchanged counting rule across all scales. It distinguishes fundamental filaments from emergent macroscopic world tubes and says spacing, thickness, and internal dynamics differ across scale. It treats Q as scale-dependent in that transition. At the fundamental scale it separately states a hard `Q <= 3` barrier for **ground-state vertices**, while its macroscopic discussion permits very large effective Q in world-tube descriptions.

This is materially stronger than the prior adjacent-audit inference: the named Q-counting audit itself distinguishes local fundamental vertex counting from scale-dependent emergent/world-tube counting.

## Important adjacent source recovered in the same attachment set

`Orders and Q numbers.pdf` is independently indexed in the Library and is more explicit for the He-3 ambiguity. Its text says:

- `Q is the filament count`;
- He-3 has `Q=9`;
- He-3 is a **second-order** supercoil / braid made from three first-order `Q=3` nucleons;
- nuclei are higher-order coils, so `Q>3` at the nuclear level does not mean a forbidden first-order >3-filament ground-state vertex;
- the document marks some details tentative (for example H1/proton order), so those should not be generalized beyond the explicit statements.

This supplies a direct historical bridge between local/first-order `Q=3` and He-3 total `Q=9` via **coiling/braid order**. It does not by itself validate the later whole-anchor `Q=3` / inverse-Q isotope-scaling block in `SAT CORE — HELIUM STANDARD ATOM 2.txt`; that later semantic/formula collision remains separate.

## QA conclusion

1. The ancestry blocker for `SAT AUDIT — Q COUNTING CONCERNS.pdf` is resolved at the conversation-export level.
2. OCR is unnecessary for the currently needed semantic recovery.
3. The source set now directly supports distinguishing at least: fundamental/local vertex count, total underlying filament count, and higher-order/coarse-grained scale descriptions.
4. The later `He-3 Holotype (Q=3)` integrated/effective usage still requires its own explicit source relation before it can be reconciled with total `Q=9`.
5. No mathematical or physical correctness status is inferred from source recovery.

## Infrastructure / transparency note

The Library search path succeeded where repository filename/code search did not because the raw conversation export retained both attachment metadata and parsed file-search text. For future binary-source ancestry work, conversation raw exports should be checked before OCR when attachment IDs or exact byte sizes are known.

## Next bounded operations

- Update the He-3 Q-semantics crosswalk to add braid/coiling order as an explicit axis, but only with exact source/status separation.
- Recover the remaining pages/sections of the named Q-counting audit from the raw export if needed for finer-grained claims.
- Trace whether the later integrated/effective whole-anchor `Q=3` arose before or after this `Orders and Q numbers` correction and whether any source explicitly maps it to braid order or coarse-graining.

No Nathan action required.
