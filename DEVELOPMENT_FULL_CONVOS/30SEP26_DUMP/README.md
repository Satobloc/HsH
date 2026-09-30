# Story Morph v0.2

Second-round prototype: the engine now distinguishes world truth, character/reader belief,
event order, typed relations, multi-input dependencies, reinterpretation events, and latent
repair buds.

## Key change

A revelation can now change the meaning of prior material without changing the historical
facts. `Reinterpretation` records that operation explicitly.

The Nellibeth model includes three braided lanes:
- material/systemic
- relational/epistemic
- wound/ethical

## Reproducibility

Structural IDs, state IDs, run IDs, and record hashes are content-derived. Seeded mutation
selection records the seed, candidate mutation IDs, and selected mutation. Wall-clock time
is deliberately excluded from canonical records.

## Run

    python demo.py

Seed 27 chooses one of four candidate mutations. Change the seed or candidates and compare
the archived run.

## Current limits

This is a source-grounded micro-model, not yet a sentence/beat-level exhaustive encoding.
Chronology and reveal order are represented, but temporal interval logic, prose-generation,
automatic repair, branch manifests, and source-span provenance remain future work.
