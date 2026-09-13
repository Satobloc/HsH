# Request — structural SAT-signature tagging layer

**From:** Ravel / SATity audit lane  
**Date:** 2026-09-13  
**Status:** REQUEST / proposal for tagging + indexing lanes; additive only

## Why

The current archive-wide autotag pass is useful for retrieval, but it is intentionally over-recall: all 21,499 Nathan-authored messages are presently in WINNOW, and many topic tags are broad enough to fire by adjacency or generic vocabulary. That is correct for discovery, but insufficient for answering the harder question: **what actually constitutes signature SAT/H(s)H structure, philosophy, and foundations?**

The manual ledgers already show the more useful direction: `CLARIFICATION`, `REFINES`, `SPECULATION`, `EXPLORATORY`, `CONTEXT-ONLY`, `ASSISTANT-ELABORATION-DO-NOT-PROMOTE`, etc. We should formalize this as a second layer rather than replacing the broad retrieval tags.

## Requested additive tag families

### 1. Claim-role / change-of-state tags

These should capture what a Nathan-authored turn *does* to the theory record, not merely its topic.

- `DEFINES`
- `REDEFINES`
- `CLARIFIES`
- `REFINES`
- `CORRECTS`
- `QUALIFIES`
- `REAFFIRMS`
- `SUPERSEDES`
- `RETRACTS`
- `REJECTS`
- `FREEZES` / `PROMOTES`
- `DEMOTES`
- `LEAVES-OPEN`
- `QUESTION-ONLY`
- `EXPLORATORY-PROPOSAL`
- `TEST-REQUEST`
- `NEGATIVE-RESULT`

Where possible, relation-bearing tags should point to the message/claim being modified rather than existing as free-floating labels.

### 2. Authority / provenance tags

- `NATHAN-DIRECT`
- `ASSISTANT-CONTEXT`
- `ASSISTANT-ELABORATION-DO-NOT-PROMOTE`
- `EXTERNAL-SOURCE-IMPORT`
- `STANDARD-PHYSICS-INPUT`
- `ARCHIVE-RECONSTRUCTION`
- `LATER-SYNTHESIS`
- `ORIGINAL-DERIVATION`
- `PUBLIC-FORMULATION`
- `PRIVATE-EARLIER-FORMULATION`

Do **not** infer ancestry or independent convergence automatically; those require an explicit provenance audit.

### 3. Structural SAT-signature candidates

These are deliberately structure/philosophy/foundations tags, not SAT vocabulary tags. They should help us empirically discover which combinations recur across the most authoritative SAT material.

- `COMPLETE-HISTORY-AS-OBJECT`
- `LOCAL-AS-READOUT`
- `CARRIER-READOUT-SEPARATION`
- `INTERSECTION-SLICE-ONTOLOGY`
- `FINITE-CORE-EXTENDED-OBJECT`
- `GEOMETRY-FIRST`
- `MORPHOLOGY-AS-IDENTITY`
- `TOPOLOGY-AS-MECHANISM`
- `HOLONOMY-AS-MECHANISM`
- `CHIRALITY-AS-DIFFERENTIATOR`
- `RECURSIVE-SCALE-GRAMMAR`
- `BIFURCATION-AS-TRANSITION`
- `EMERGENT-QUANTIZATION`
- `EMERGENT-SPACETIME-METRIC`
- `EMERGENT-PARTICLE-PROPERTIES`
- `VACUUM-MATTER-CONTINUUM`
- `FORCE-REGIME-UNIFICATION`
- `CROSS-SECTOR-COMMON-GRAMMAR`
- `FULL-VS-EFFECTIVE-DESCRIPTION`
- `REPRESENTATION-NOT-ONTOLOGY`
- `STANDARD-LIMIT-RECOVERY`
- `TRANSLATE-NOT-REJECT`
- `FAIL-RIGID`
- `ANTI-TUNING`
- `NULL-RESULT-AS-INFORMATION`
- `CROSS-SECTOR-PREDICTION-VALUED`
- `FORMALISM-NOT-PHYSICAL-PROOF`

These should initially be **candidate signature dimensions**, not declarations that every one is uniquely or essentially SAT.

### 4. Terminology-relation layer

For glossary / standard-to-SAT mapping, use explicit relation types rather than a single `SYNONYM` bucket:

- `SAME-AS`
- `NEAR-EQUIVALENT-TO`
- `MAPS-TO`
- `STRUCTURALLY-OVERLAPS`
- `ANALOGOUS-TO`
- `BROADER-THAN`
- `NARROWER-THAN`
- `HISTORICAL-NAME-FOR`
- `SUPERSEDED-BY`
- `CONTRASTS-WITH`
- `NOT-SAME-AS`

Each relation should ideally retain source message, date, current/historical status, and confidence/review state.

### 5. Signature-strength / diagnostic value

Do not equate frequency with signature value. Add a separate diagnostic field after manual review, e.g.:

- `SIG-HIGH` — unusually diagnostic of SAT/H(s)H architecture
- `SIG-MED` — characteristic synthesis/role, but substantial standard overlap
- `SIG-LOW` — common physics/methodology ingredient; useful context but weak fingerprint
- `SIG-NEGATIVE` — explicit anti-feature / useful boundary condition

This should be assigned only after comparison against standard physics and the external arXiv/control corpus; it should not be generated from term rarity alone.

## Suggested immediate audit

Take a stratified sample from the current WINNOW set:

1. high autotag score;
2. middle score;
3. low score;
4. manually VERIFIED material;
5. obvious non-theory/context-only material.

For each tranche, measure which current topic/discourse tags actually discriminate useful SAT material, which merely reflect adjacency/common language, and which proposed structural tags improve separation. Preserve all current tags; add the new layer cumulatively.

## Link to current structural X-ray

The blinded arXiv experiment in `HSH_RESOURCES/EXPOSURE_STATS/arXiv_analysis/2026-09-13_RANDOM_100x3_JAN_SEP/STRUCTURAL_XRAY_PROTOCOL.md` uses a closely related 30-dimension structural rubric. Once both lanes have independent outputs, compare them: the archive should tell us what SAT repeatedly *is*; the external corpus should tell us which of those features are generic, common, rare, or unusually clustered outside SAT.

That intersection is a much better basis for defining **signature SAT** than vocabulary frequency or numerical coincidence.
