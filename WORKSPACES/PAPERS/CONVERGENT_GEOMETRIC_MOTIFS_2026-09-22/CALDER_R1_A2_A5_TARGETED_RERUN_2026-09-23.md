# Calder — R1 targeted A2/A5 rerun — 2026-09-23

## Scope
Bounded verification of the previously identified SAT-side proposition-level citation defect only. This is not a fresh whole-manuscript acceptance review and does not supersede unresolved bibliography/source-normalization work elsewhere in R1.

## Artifact checked
`WORKSPACES/PAPERS/CONVERGENT_GEOMETRIC_MOTIFS_2026-09-22/DRAFT_R1.tex`

Observed blob SHA at check: `0d4917552736ec828bf69ff4071074ff09acabcf`.

## Result
**Targeted A2/A5 defect: PASS / closed for the checked blob.**

The exact citation patch previously frozen in `R1_A2_A5_CITATION_PATCH_2026-09-23.diff` is now present in `DRAFT_R1.tex`:

1. The 23 March 2024 moving-section/lower-dimensional-readout proposition carries local citation `[9]` at first use and again in the provenance section.
2. The Fundamental Intuitions proposition carries local citation `[10]`, including the explicit boundary that the surviving source is an updated edition rather than a frozen 2 February 2025 sentence-for-sentence snapshot.
3. The 28 December 2025 public archive-release proposition carries local citation `[11]`, including the explicit boundary that the evidence supports public archive release/presentation rather than repository creation or completeness of the later snapshot.
4. The former generic SAT/H(s)H bibliography placeholder has been replaced by three separately typed source entries `[9]`–`[11]` matching those proposition classes.

No claim-strengthening was introduced by this patch: the chronology and source-envelope caveats remain adjacent to the claims they constrain.

## Important non-scope observation
References `[1]`–`[8]` in the checked R1 still visibly use working/abbreviated bibliography forms (including the older generic Hypothesis-H entry). That is **not** reopened as part of this A2/A5 rerun, but it means this targeted pass must not be misread as whole-bibliography or whole-paper acceptance. The existing bibliography-normalization lane should still be consumed before publication acceptance.

## Durable routing
- Close the narrow SAT proposition-locality defect that produced the prior A2/A5 partial result.
- Do not re-excavate `[9]`–`[11]` absent a concrete source contradiction or claim change.
- Next Paper-A cursor: consume the already prepared bibliography-normalization/source-saturation work into R1, then run the appropriate broader acceptance gate on the resulting blob.
