# Exploratory NLI top-k candidate-order sensitivity

**Date:** 2026-11-01  
**Status:** CONDITIONAL SOURCE-CODE FINDING / LEAN BUILD VERIFIED / NO DATASET-LEVEL EFFECT MEASURED  
**P1 docket:** HsH issue #564 remains OPEN / SOURCE-EXPERIMENT READINESS.

## 1. Pinned source

Repository: `mainlobelabs/pauper-consensus`  
Commit: `c328dab5ca1f1101b5ec56e2e92e3592898ceadf`  
File: [`firstpass/wct/cluster.py`](https://github.com/mainlobelabs/pauper-consensus/blob/c328dab5ca1f1101b5ec56e2e92e3592898ceadf/firstpass/wct/cluster.py), blob `45ad33fff02bb065cfdd2f1a1d2cd70f073da1f3`.

In exploratory `align_free` (lines 165-222), the code:

1. Computes a row-wise top-k neighbor list from the embedding-similarity matrix (line 182).
2. Discards candidate pairs whenever `j <= i` (line 187).
3. Only then computes forward and reverse NLI scores (lines 193-194).
4. Applies thresholding and union-find closure afterward.

For row-wise directed neighbor relation `N`, the candidate set is:

`E = {(i,j) | i < j and N(i,j)}`.

This is not, by construction, the union-kNN rule `N(i,j) OR N(j,i)`, nor the mutual-kNN rule `N(i,j) AND N(j,i)`. A symmetric similarity matrix does not guarantee that each row's top-k neighbor relation is symmetric.

## 2. Conditional result

If `N(a,b) != N(b,a)` for a pair, swapping the two claim positions swaps which directed neighbor bit the `j > i` filter consults. The candidate decision therefore changes under that swap. Bidirectional NLI scoring cannot restore a pair omitted before NLI evaluation.

This is a static algorithmic consequence. It does **not** establish that any particular archived embedding set contains such an asymmetric pair, that any actual cluster changes, or that the exploratory path affected the registered study.

## 3. Primary-analysis boundary

The pinned primary E1 path calls `cluster.align_anchored` at [`firstpass/exp/e1.py:67`](https://github.com/mainlobelabs/pauper-consensus/blob/c328dab5ca1f1101b5ec56e2e92e3592898ceadf/firstpass/exp/e1.py#L67). That path maps claims to a canonical proposition set. The later `align_instances` path is a separate anchored, claim-instance-preserving route.

The order-sensitivity result applies only to exploratory `align_free`. No effect on the registered primary E1 analysis, ConsistencyBench, or HsH P1 is established.

## 4. Lean verification

Existing draft HsH PR #850 was reused; no new branch or PR was created.

- PR branch: `research/orson-p1-shared-nli-bound-20261028t06z`
- PR head: `6b08ffbcc7ca64d5a9a55447b586e31aaef34a5b`
- Module: `FORMAL_VERIFICATION/HsHVerification/OrsonNLIClusterClosure.lean`
- Module blob: `72609ead71293dc889da07ecd5832d4bc7cdb8af`
- Actions run #41326800775, job #124908336445.
- Lean 4.34.0 / Lake 5.0.0; build succeeded, 8,976 jobs.
- The build's merge-reference commit was `79d10ef96f7d43cfe09d13bdcd1139f5b3707073`. The module blob is identical at the PR head and merge reference.
- `orderedTopKCandidate_order_sensitive` depends on `propext` only.
- `unionTopKCandidate_symmetric` and `mutualTopKCandidate_symmetric` do not depend on axioms.
- Full log contains zero `sorryAx` and zero `admit` strings.
- Separate axiom-audit, nanoda, tests and lint stages were skipped. A pre-existing `Symmetric` deprecation warning and one unused-simp warning remain.

Lean verifies the formalized conditional statements, not the soundness of translating the Python code, the existence of asymmetric neighbors in actual data, or any empirical effect.

## 5. Recommended follow-up

Before any future use of `align_free`, explicitly choose and preregister the candidate-edge semantics: union-kNN, mutual-kNN, or another justified rule. Then run an input-order permutation test on the actual archived embeddings and report direct edges separately from transitive closure clusters. No such data-level replay was performed here.

The original OV-49–OV-53 neutral-versus-false-authority answer-keyed bank remains unrecovered, and no authorized model-inference endpoint was identified. No model call, human-subject session, or new trial occurred. This note does not advance the P1 gate or promote any H(s)H theory claim.
